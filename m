Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp5449854ejb;
        Tue, 7 Feb 2023 07:05:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+HNj/59Nw3BkEdTNcEZ/PwbWEyUT/EYmWzhLTS2cjRSB5TrTJykd6yEPYY4X0VgXvVtvIC
X-Received: by 2002:ac8:4e8e:0:b0:3ba:26b8:5505 with SMTP id 14-20020ac84e8e000000b003ba26b85505mr4926133qtp.65.1675782359142;
        Tue, 07 Feb 2023 07:05:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675782359; cv=none;
        d=google.com; s=arc-20160816;
        b=GA9N/kW/iwlsEgP2OXwblOsGl3p3mMxOJ449hNC4qzzMEoAWXrt+GePDPc7bpLOJ4q
         3T5h/9bm0qZaUdqyUFq+nR0HFy49cUnNO5QVR8za8zBhe65lruYIJNkEC01AJ6p/E7Jv
         VErSCmQL3fMrTQ8/YafnfhFyiFkK6Wqdy4uwyFwx0P7DsCIh9ZVkQeaWVbfebapfUG5d
         5sukURFHuDD2bT1S9MKEPDqxFcDI3S3kpl3EV4OTybsuFSW9rz0FoYbtH2AiH2fLjI6g
         cgt1gscMIQgFsx2es1pJt3TPmZ9dSxpYmovoBUz9/med2GYLRvALjpF0jRxbpu132p9A
         gXQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wqULP9uOv62ryMax0kxMFZqZakOkgflZRf7tcSpI5OU=;
        b=luBbRMATwUaIxhkReyPz0Piy1VT/fFRostwPHgLRctl6ax2Dm3CMnO9oy9bzF+C/uy
         TvvQpTNCckEfNZ7ti7Ov7BK1iusIN8kNVn+z98oDZhnNx8mNm8S6v5vcmF7qmPY7oyGf
         qcr60F3PlIFRJ7WJh/38SWe0myviD9PLuG9uADfG6f86YGUT0f6aSf3tNQvk0UoEJZbz
         m1VkwiQWsyFanCQ3vHxDTI1hixKlF36QnivldgKe18OjzzMg42rvUyIOfRXwBuRVhuTm
         CuT0U36Fl8ATflkhOF/QZDWCGe9hNKQpM7ub9b6JkuIoVauUNvwT5ksRz9B1xJnqTokV
         10ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WcLmCpdG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9-20020a05622a024900b003b827400cbdsi10682023qtx.508.2023.02.07.07.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Feb 2023 07:05:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WcLmCpdG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pPPXM-0007il-El; Tue, 07 Feb 2023 10:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPXK-0007dC-BT
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 10:05:34 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPXI-0006y4-Mu
 for qemu-arm@nongnu.org; Tue, 07 Feb 2023 10:05:34 -0500
Received: by mail-pg1-x531.google.com with SMTP id 141so10670416pgc.0
 for <qemu-arm@nongnu.org>; Tue, 07 Feb 2023 07:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wqULP9uOv62ryMax0kxMFZqZakOkgflZRf7tcSpI5OU=;
 b=WcLmCpdGftlxPdcbfRjWdguRBLqru5Zs/tUggGq6RCzDGNM4joI9hz2dnwtvZT0xHo
 oDU1JkzP5hpLeu4hNyiunU3qXxwSw7XjClYSWJJmyB5BjZn9yB/2oeXHu/+65sIHTkxW
 lW9xdLHQC32welIDanLXpnKmEZhGsJN0NBHuHaJvoLVD0K0ndFKH5KMae5Vp+2Y/lKkZ
 D27pETrDyOutGwV0ciRxLhG4AqXV2J3CVwxQtag17m30c7jlG29m3r/FejU5s8FMc8hZ
 I8Hy0K9V+sDYWtTvDpYEqxmxBzBlFHoXOCzJNyTP8oAet3/zHl8DykIVMthwGIPrh5lG
 z44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wqULP9uOv62ryMax0kxMFZqZakOkgflZRf7tcSpI5OU=;
 b=Dot1kYBuxTL/Y1Akq8p7x39CPUYtjHUDbIOz4zu/0pFloxtad04zSc96XNKPm6LtbN
 jOjhRZKpYt9ybsi7R0f2sXSXPZS3/Me+Gl6uk13HOTu+5nzeuzBv0n5QkKh5HkML/ERd
 EQYB+8kHTU11MiXIWayCwkrF2pPduppmdR60eZFw05zG/JkZdE7W2Cjgf846eLV6e+sN
 MYGE5HusgCxuj1L+9yl6Y7MDf/f3JlEgLXxYqdWXMtQo6/BO3aQ+s5uizrgHUBtFohh9
 kSWVlyVja0o/d/7FR7NfPmQCJ67bYKN+IzYLuWsXaeOvjaESAyDuMOOQVuuheDTY2A5V
 Zbmw==
X-Gm-Message-State: AO0yUKW3dta64DE35H58LYOPPH5tRnS7d9JPxLraVKD9uQuR8JImcyor
 q9ovx5nyCi2J/zBQhNs/TSEHLzj8MyCKv0MDw3mJxg==
X-Received: by 2002:aa7:9a48:0:b0:58d:ce70:4683 with SMTP id
 x8-20020aa79a48000000b0058dce704683mr813369pfj.39.1675782330793; Tue, 07 Feb
 2023 07:05:30 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-9-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 15:05:19 +0000
Message-ID: <CAFEAcA_2G4V6tPe-gNtstFOM4TDsCnHwFHAESdQwkKvDx3t1yg@mail.gmail.com>
Subject: Re: [PATCH 08/22] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CyaVu3IBB8H3

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will need 2 bits to represent ARMSecurityState.
>
> Do not attempt to replace or widen secure, even though it
> logically overlaps the new field -- there are uses within
> e.g. hw/block/pflash_cfi01.c, which don't know anything
> specific about ARM.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/memattrs.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 9fb98bc1ef..d04170aa27 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -29,10 +29,17 @@ typedef struct MemTxAttrs {
>       * "didn't specify" if necessary.
>       */
>      unsigned int unspecified:1;
> -    /* ARM/AMBA: TrustZone Secure access
> +    /*
> +     * ARM/AMBA: TrustZone Secure access
>       * x86: System Management Mode access
>       */
>      unsigned int secure:1;
> +    /*
> +     * ARM: ArmSecuritySpace.  This partially overlaps secure, but it is
> +     * easier to have both fields to assist code that does not understand
> +     * ARMv9 RME, or no specific knowledge of ARM at all (e.g. pflash).
> +     */
> +    unsigned int space:2;
>      /* Memory access is usermode (unprivileged) */
>      unsigned int user:1;

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I guess we aren't so tight on bits in this struct as to
warrant keeping the extra RME info in a single bit (which
should in theory be possible).

thanks
-- PMM
