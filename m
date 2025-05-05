Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2318473njj;
        Mon, 5 May 2025 02:43:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVkP6o8f3wXaWjAEVHxrUCEINPkpJhBnDegtxl+fp2qdDljVURTEK67ZR/+KBHvkka8906aKOq2UeuUg==@linaro.org
X-Google-Smtp-Source: AGHT+IGmmINNESZ/7n4GDmD3IhAir10ZD32McuEgafaBDvOjE/NG4x0Ckq4q3GbTXMMexo4Cg1jh
X-Received: by 2002:a05:6214:21a1:b0:6e8:fa33:2969 with SMTP id 6a1803df08f44-6f5237552b3mr149568686d6.10.1746438220730;
        Mon, 05 May 2025 02:43:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746438220; cv=none;
        d=google.com; s=arc-20240605;
        b=AaAN2v6PmQpfoXwehny3s67CcDStuA3f3EQHZah8gV0FrKkoA8hGjqvqSbcThTLDMW
         AxYt71UF7W9fphU+CnJGhNgTfs3AlBg30bggDA5I+QmE7WALI1tk3TNkdhBOU7vd0n7M
         NhS3MjmmkZKZle7XBrh4td0unv+SevwYQJ0uXqlHIa203l511VHuupIH5RypGY5RQ+1v
         OPrIRB57XLclzJ8O3o0Y5WmYEDVtb+oCahNNLmhaHBBEPl/ymLEV+Ls6Vs75hFHN/2NC
         on2QbMpqvEqWHHkP8AIEeo3mLdBXpNnDCZKB+SyMkJrzh01OTEjm+8jUcYox38V7LqCQ
         EB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sP81zsT/RNSG8ANhqUBnaYmRGZAXZNzC428xVjzVw84=;
        fh=AGXQaQ6zXqcJ0wDuEolRrfxGhnBKi5dc8WUas1QN40I=;
        b=JeQtJUAOCS8EAaCpj9xBlOR1Y0tVJhYlRAug63sEe6LQ9czNU83pXeYGI1pSU3s2KL
         VnJam3vIaBs7dgZBgmaQYl4y0Q9+d7I+0rftHc+NxnBZTLSHB/b9cXckqV6dp2Qj7AHi
         kMm+e+ioMBaob2OmjNSWYXU4iysDQ8VGh5RhqZ7qqcpmNYVlNGYasKMkH2SfN8NhjVFT
         q3tkiGurPa1xcvksPCm+uPAoME1e9QlpGNhTw76UNH7OAOptVU8J+gPZ8f6vJItBds/b
         E7sJz9ufQtXw2t+hnyTykTSrUfqHGHZn0fzQjhEn5n1/p5+2CxqZND4pw8z5KMIYvpPE
         5vAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hdzrntVr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f3aced1si84837816d6.44.2025.05.05.02.43.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 02:43:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hdzrntVr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBsMF-00067m-9t; Mon, 05 May 2025 05:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBsMD-000673-KM
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:43:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBsMB-0003iP-Qj
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746438207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=sP81zsT/RNSG8ANhqUBnaYmRGZAXZNzC428xVjzVw84=;
 b=hdzrntVrD6hdCa055MHPiLWVllTXkeZnSrQSGNvgkcMn3YzLmSIY/Lhqvb6GvjRjl3TGjY
 cydhVd8InbaVdc8Jx1eYx7GoSOHVfdTFuV9JNPAVoSWMmGeUeF0GiVjOZTWjdq8naUIo0s
 2xV1RfxsjrgLRsIq6grjDnJFjkZ7Z/k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-R_RO9NiaMvOWl_CDN9h88Q-1; Mon, 05 May 2025 05:43:24 -0400
X-MC-Unique: R_RO9NiaMvOWl_CDN9h88Q-1
X-Mimecast-MFC-AGG-ID: R_RO9NiaMvOWl_CDN9h88Q_1746438203
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43cfda30a3cso20162085e9.3
 for <qemu-arm@nongnu.org>; Mon, 05 May 2025 02:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746438203; x=1747043003;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sP81zsT/RNSG8ANhqUBnaYmRGZAXZNzC428xVjzVw84=;
 b=nxqd80qde4KoUNLGx8TPMq76chzcjzS96MZO1gOYTaJg3VNS+vJIbqbP2EZTp1/LAx
 qSdmIH+psh2TXGQPmi6WHmBaZ//6LkZxNJfh6mbUs2bpiNepHBhfYCypcefrB0EyIVp+
 oBp8TKalyxY6gUcYfYjM4BKgZ3ZuDKVYzYPlzeBkYnfP6nXlQ00U30Dd2Gj8bRUgcjr3
 zd9iwJR10QMv8GUS3DqLWyNe23QluNLyDMKGXXullUfFPdbPuI88qvzK9TPtM8i5utjP
 1CWeEhOyH4rJkZ2JDjOIsH5Lax6xcLHYezBmUe8g8k76t9bBCFJbmhYPfPB541GJtPbU
 OhOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTAqSHERZVfgVsTSqiVTHsj1La/PInkxvUhINhovpc0hYQVZExKCUL4SHIt9rfnj7ASYSHWgGnnA==@nongnu.org
X-Gm-Message-State: AOJu0YxwXJsJsXpqPZU+b5/pN36zPECIw9dbuQTy3xxEnlwzgAG2aTb5
 nplYu7eIlH4qJfo5vv20Lp19FbeGmSkhXSbsjX+xyKj7H+6XAPtn22uuA9Fk67SLOEFHc5KHI+u
 kdD08+Ei8KoUYOa2uIkGKcSIgNu/x1blD1DAehvZV4qrnMeNQjg==
X-Gm-Gg: ASbGncuzh5l+t1CLN5P3sCe1pv1/6GCi1xp/H0FXy/GK/TXs25WllP4i5bIEFpad1t9
 utVSgdlJVJ1IeTtkayVnXlG5Zb3D8atOsEZCeYeaLx/8UeoYIxRvUmBm8jbnDr780oo7RC66u/x
 SU4Rn8TmrMir35DuYV65n538rHhMpgzNhNDCKdpvA2kSLVk7/ID22AQuasf+WB7I/NHOI79RZS4
 940uYtorQtSFzGfecBaOie2ckiR2L+hm38nFRx0c3wdqhOBF2LMwTjOwIsiHy/xGQV8b2LOC4v9
 QOZZd5LHsVQRLM6/hPMeVlhhAO9sAxb8iGo6rxp6fjn/JcfFQg==
X-Received: by 2002:a05:600c:1e1f:b0:43d:46de:b0eb with SMTP id
 5b1f17b1804b1-441c48bca2dmr64706355e9.12.1746438202945; 
 Mon, 05 May 2025 02:43:22 -0700 (PDT)
X-Received: by 2002:a05:600c:1e1f:b0:43d:46de:b0eb with SMTP id
 5b1f17b1804b1-441c48bca2dmr64706105e9.12.1746438202560; 
 Mon, 05 May 2025 02:43:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89edfc2sm125931625e9.20.2025.05.05.02.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 02:43:22 -0700 (PDT)
Message-ID: <ead3ea8e-4ce3-405f-9702-21e4f1331faf@redhat.com>
Date: Mon, 5 May 2025 11:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/23] aspeed queue
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20250505090635.778785-1-clg@redhat.com>
 <3031f1d7-b842-4fee-adde-89a9e824ee57@linaro.org>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <3031f1d7-b842-4fee-adde-89a9e824ee57@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TXJh-7UD_hgAF3oupJlnd5rd2AnVzGJe8SKJYIV3wkA_1746438203
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: G1ze9p7FYTUv

On 5/5/25 11:35, Philippe Mathieu-Daudé wrote:
> Hi Cédric,
> 
> On 5/5/25 11:06, Cédric Le Goater wrote:
>> The following changes since commit e578dcc7e1590b20a84036afe5bdfa8d23a6048e:
>>
>>    pc-bios: Add AST27x0 vBootrom (2025-05-02 09:47:14 +0200)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/legoater/qemu/ tags/pull-aspeed-20250505
>>
>> for you to fetch changes up to f32ef57f7de98ec36da52b0a13bd5d18ac4bd583:
>>
>>    docs: Add support for ast2700fc machine (2025-05-05 09:42:16 +0200)
>>
>> ----------------------------------------------------------------
>> aspeed queue:
>>
>> * Fixed AST2700 SPI model issues
>> * Updated SDK images
>> * Added FW support to the AST2700 EVB machines
>> * Introduced an AST27x0 multi-SoC machine
>>
>> ----------------------------------------------------------------
>> Jamin Lin (12):
>>        tests/functional/aspeed: Update test ASPEED SDK v09.06 for AST2500
>>        tests/functional/aspeed: Update test ASPEED SDK v09.06 for AST2600
>>        tests/functional/aspeed: Update test ASPEED SDK v03.00 for AST1030
>>        hw/arm/aspeed_ast27x0: Rename variable sram_name to name in ast2700 realize
>>        tests/functional/aspeed: Move I2C test into shared helper for AST2700 reuse
>>        tests/functional/aspeed: Update test ASPEED SDK v09.06
>>        tests/functional/aspeed: extract boot and login sequence into helper function
>>        hw/arm/aspeed_ast27x0 Introduce vbootrom memory region
>>        hw/arm/aspeed: Add support for loading vbootrom image via "-bios"
>>        tests/functional/aspeed: Add to test vbootrom for AST2700
>>        docs/system/arm/aspeed: move AST2700 content to new section
>>        docs/system/arm/aspeed: Support vbootrom for AST2700
>>
>> Joe Komlodi (1):
>>        hw/ssi/aspeed_smc: Allow 64-bit wide flash accesses
>>
>> Steven Lee (9):
>>        aspeed: ast27x0: Map unimplemented devices in SoC memory
>>        aspeed: ast27x0: Correct hex notation for device addresses
>>        hw/intc/aspeed: Add support for AST2700 SSP INTC
>>        hw/intc/aspeed: Add support for AST2700 TSP INTC
>>        hw/arm/aspeed_ast27x0-ssp: Introduce AST27x0 A1 SSP SoC
>>        hw/arm/aspeed_ast27x0-tsp: Introduce AST27x0 A1 TSP SoC
>>        hw/arm: Introduce ASPEED AST2700 A1 full core machine
>>        tests/function/aspeed: Add functional test for ast2700fc
>>        docs: Add support for ast2700fc machine
>>
>> Troy Lee (1):
>>        hw/arm: ast27x0: Wire up EHCI controllers
> 
> If you ever have to send a v2, please remove the 'Change-Id:' tags.
> 

This is a Gerrit trailer AFAICT.

Why ? is it breaking some tool ? Can't we keep such reference ? If so,
I'd rather fix checkpatch.pl.

Thanks,

C.




