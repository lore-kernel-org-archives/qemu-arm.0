Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF4ACDB479
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 15:36:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcPe3-0008RU-9L; Wed, 24 Jun 2026 11:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcPe1-0008Ps-NE
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:36:05 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcPe0-0006W7-76
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 11:36:05 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2c7cfa17fedso9518125ad.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 08:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782315363; x=1782920163; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7QKjxFjRe2W/GIIECAFct9aMnyK6wHfWohF/HhYSAkw=;
 b=G9TmS9wk9ft4nyndWDBJeLm7DNJ6i5mZ5o1HUUcd/UkmHTPW3SmiCRA6W08MwjfZpB
 VLJRTIaTqCPdn8V7WxRyosdrzOk9q4eSb9qjVUB8faBwLWOpGoi64gSTnK1MNskUUS+G
 Te1vlKJEzsBA2MkOvOMAOyqORXxfyB8wdAx6ePhMK2lnYkfffNNmCY/GacRWGZb8rTXr
 PINhh9E8siCVcJyD8aQiNl2/gQE71/A3N63cxPx77+wFCg7r22bGdL8Tuqg2K8mcZsJj
 n09Y6V0gtt1oMY3uGLkXGs8PKIroySk6L2FSZb7PiuhfRFh7lcKz93S+ncDeOFp6Oac7
 lqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782315363; x=1782920163;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7QKjxFjRe2W/GIIECAFct9aMnyK6wHfWohF/HhYSAkw=;
 b=bE3GtD92d9rIj7u89K7BCxyA7lOnKoQNtgrR48hXEq2IDG7GbtKu/S5D5Wb44ld0bN
 txAzLYpHFVsS2HuGlOhVaRqNvkQXYMyKKq//WWH6iiYIw4evO3RPh1boBRJJ2odfXDUs
 FMy2VDL2C27u/ue16XUjvDVcL7wUX/TSyThOQSqk9p9ep0KE5ki0hOiKjX9Na4VdOKJo
 XpUUKYpf+fD1FpzZHqYmvsekVhHHDYEvi9yBwRkLPtJV4zFOZjWWDYlRr6iXeLSv4pQ4
 a1cw7p5k4y2T24rfNVOMPRNtmO9yDKH4JLvHMQpIDVKbVlxPR2zqDvOMNtBPqbT0E5Im
 J8Ug==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro/52bqy5mj0RSSfT0mtMNQ7ne6c2GXJAz9jLzSo55zpzr2DQ8VFIDA2cLT8VR03eBoE+i/wuIetw==@nongnu.org
X-Gm-Message-State: AOJu0YwWhT8V+AJVxRYxImbMCqXSLfAkYQcdOX2G6aOlRT+VTL3ziAuq
 bBaJe8u1uIRwpDY3LAte76JSfX+b54gArt9KZNh+pXpnUpOkLiWVK+ZCMlEJd66af+c=
X-Gm-Gg: AfdE7cnwwz1bCWIe2D9c3EO4nFRNX0tT0syJyp8XJaWKw1NATHBBjpTPsHXakkng3bZ
 sHtiY3xkPVK3sJJYc6yn7OQ/g7g6r4+SZwUZQB3k9TmcxQddAztnofRD24W+DBBEkImGDy+eB/n
 J2N0MUWIRfXLs5kWSXcWHTDEWvQGs1iFraFeJREtDAMqmN3TaDyCMY1qNKlzhxS/UVqS+QJGTUb
 QURO8wKRsNp3WMe0aEPmAECaXEXaIY9JINgk4XWtk2CxNOEMxKO9gpwa3V8ih7Wnqqx04HEk1Op
 DFuqwV6RVzK9g0zxf/buhp962YWAFip9PXHt9vRa1hXdUVX5JJdxkewIvDn/xLgoMtHgY1xR1T/
 ogMSJla4x5q608yWT7oePPqHMJR/2XeiAMsh8I2uQkspknvJsF7PMqlRzdH00Cl/12Dkii/wmIN
 8VT/8EWOplbYaBBS33PCapdXD77j2Q+5OpoLnYBYLEToq70U/mfG8eHTcJiA==
X-Received: by 2002:a17:902:c401:b0:2be:1c3c:72ba with SMTP id
 d9443c01a7336-2c7e15aee3cmr43091195ad.32.1782315362474; 
 Wed, 24 Jun 2026 08:36:02 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c7f5b04be8sm874555ad.35.2026.06.24.08.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 08:36:02 -0700 (PDT)
Message-ID: <a1d7bfbe-0c2a-4b09-86a3-e52a7377d720@linaro.org>
Date: Wed, 24 Jun 2026 08:35:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] linux-user/aarch64/elfload.c: Add FPRCVT
To: Jim MacArthur <jim.macarthur@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Alex Bennee <alex.bennee@linaro.org>
References: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
 <20260624-jmac-fprcvt-v2-4-dc6cf8e512b6@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260624-jmac-fprcvt-v2-4-dc6cf8e512b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 6/24/26 06:37, Jim MacArthur wrote:
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> ---
>   linux-user/aarch64/elfload.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
> index 4887a3a7b7..4487d047bb 100644
> --- a/linux-user/aarch64/elfload.c
> +++ b/linux-user/aarch64/elfload.c
> @@ -173,6 +173,7 @@ abi_ulong get_elf_hwcap(CPUState *cs)
>       GET_FEATURE_ID(aa64_cmpbr, ARM_HWCAP_A64_CMPBR);
>       GET_FEATURE_ID(aa64_f8mm8, ARM_HWCAP_A64_F8MM8);
>       GET_FEATURE_ID(aa64_f8mm4, ARM_HWCAP_A64_F8MM4);
> +    GET_FEATURE_ID(aa64_fprcvt, ARM_HWCAP_A64_FPRCVT);
>   
>       return hwcaps;
>   }
> 


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

