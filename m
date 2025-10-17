Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62B6CCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 12:37:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9jiO-0007q1-K7; Fri, 17 Oct 2025 08:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9jiN-0007pq-KA
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 08:37:47 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9jiG-00009C-3O
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 08:37:47 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-7815092cd0bso19653647b3.2
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760704652; x=1761309452; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h6Deg7Uhd62141L1iDoLGmiNq3Lm5epcVVZxLHhIUDw=;
 b=lznITxOfI31jfp4nZCfGq+yqP3xJt0mAeC1UUWb3ZQKnDvNHCAj+3L7e885YtD2qGI
 GZgj4/zKBXSSUdlnYUwdz6cFua7/wgni8plsKWQCJ+ca1uqVCuM4/nykxzSYWeW4T+Ax
 IHq/hqJPQwAaknOvfQwce0l1TWoym8ruTDgr/Y3fAfKKPXybdKU1E69mvEVTeNM9Nwg0
 gjQmHikABTkgFJTxJBilkRDA3KLvjDKXiQS+iIXWH4ajIDnw+KumpBeYvdqcxFNU8PCH
 PiDPLj1kM5CWxwDgpvge2BwAnC2GNpRTExyUqdvWCQLBBbpcWhWj4HXi72DhoRQEMbCa
 QkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760704652; x=1761309452;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h6Deg7Uhd62141L1iDoLGmiNq3Lm5epcVVZxLHhIUDw=;
 b=My1UXfjEljmvF/L5r8F+xbMHz6TmcNFfuja62n1ZRrVKQeX3TjZ8BB+re2HcMM6bEK
 n34PALW/gGhvZfkaGyeXtHFc4O4B9/dg7IMk7rtl5G0EL+NtXjamUzZYkkxtQ68jLkzo
 mKc/E1mtT4vOpvirENnYdstbutMDGetu4o8mwysIHXBuTdqsk81NmFhV4ijapve+COMM
 y599XAZseRQjmtzrGeFuH+2LI+UrozropRoM3tSscdkcpis9VPxuQWbecKkXSldXI97H
 0itbNIHQ8bxOh7zhtXnj8BTBOxSNd+qmhYjEZ94GsRH/feoHahi4pw16Bgj7jAVLYY7y
 PrrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPm/Ezpq2ZYWh3Pj3JbMS4/jgKCD26SGHvw4otiXldz6MQpqRevzvtawI+m3Oq+C/RW+q9UQ6eyA==@nongnu.org
X-Gm-Message-State: AOJu0YwtQBn7tm6g0aSY3pCvsu/UIisRjyb0jyGWUpsZ48CNksL8Z7/z
 qw9oIwvF8E+foWndRc15PmFPkro6VxRjMrE4TjQJB39AnYbrfSO2HlXzxdAEgYScUejrvYzXSvZ
 jFIQpDLcWQPjuNu+K9Oy5e27DHip8zcW9u/4H9ZXMVg==
X-Gm-Gg: ASbGncvIUBXi77IZT8Lpxo/1Jj+B7J68GFM/WWEHyA0KIYf4vc0cN1Ii6j2eRCxEkn5
 GT4ejaeBCx/6Hrd5tCIN7kIODGWt9w13YDOxjnvdbLIXmoH/hv5ZugpfXoWs61mxrf2XsDnN35a
 o/oqVWRk6iIDJYQgOdBPBDyzjJ3c5tScFBK+9c12gU0hk2F3qs6chdjUZ+75bzoeC1PlbxoX8Rl
 ICiUwWgOh2OvQwKq4u6WX1LIgPgLaPoRCxVPF9mN0sZCLqbNp6XWQYf2ib45g==
X-Google-Smtp-Source: AGHT+IEpSLXlJUkCIfiu3AtYQ2stiJJAnxpwk/VXnfkQnJc4BzkIQSc6CaDCKQxZxU6ro3uCyNC2rSMjgT2w5GuFqyc=
X-Received: by 2002:a05:690c:6f07:b0:771:f60d:6cdc with SMTP id
 00721157ae682-7836d213e27mr57546207b3.31.1760704652376; Fri, 17 Oct 2025
 05:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-3-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Oct 2025 13:37:20 +0100
X-Gm-Features: AS18NWDMgZMWzJ_pb4W3r-f-fjSwLVOFdEU2z0ZXay_ipD7GQAPwPIt4lCQRXgI
Message-ID: <CAFEAcA-O85ii1-vxEb+p5YZW1Unzg22N-KB3tN0YJvFkaB=CyQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/37] target/arm: Define CP_REG_SIZE_U128
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 14 Oct 2025 at 21:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/kvm-consts.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
> index 54ae5da7ce..1b3c10c0d3 100644
> --- a/target/arm/kvm-consts.h
> +++ b/target/arm/kvm-consts.h
> @@ -30,6 +30,7 @@
>  #define CP_REG_SIZE_MASK       0x00f0000000000000ULL
>  #define CP_REG_SIZE_U32        0x0020000000000000ULL
>  #define CP_REG_SIZE_U64        0x0030000000000000ULL
> +#define CP_REG_SIZE_U128       0x0040000000000000ULL
>  #define CP_REG_ARM             0x4000000000000000ULL
>  #define CP_REG_ARCH_MASK       0xff00000000000000ULL

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

