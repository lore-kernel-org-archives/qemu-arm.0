Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp1053398njb;
        Wed, 12 Feb 2025 06:59:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXSmZjHSYtazJfIxwKJRC+gxXB8v+4645gnnZ9wPRF3nbOgi2w56hR+mku/uhmBW1xaPSJ4ZsxSW15Q1w==@linaro.org
X-Google-Smtp-Source: AGHT+IG1fmuHJT8Nb8Hum6p77UFMLBDSv9KOfZW+ZKowBbJJaDqq+YoywtrOIhXqqU+qrZ2RV+JF
X-Received: by 2002:a05:6214:410:b0:6d8:ab7e:e554 with SMTP id 6a1803df08f44-6e46edc1dadmr64314876d6.34.1739372346568;
        Wed, 12 Feb 2025 06:59:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739372346; cv=none;
        d=google.com; s=arc-20240605;
        b=RBzi7x1C1qS+e+KmZ1XISRb8H4JdvkU8D970pBpJDsOz6vqOuKtHOnaKvXQt33Z39F
         SedPMhAraw02Vgs8r+JiyzbMIzfviM5vVfsZX5dJb9YF/Li0Fjn0/MiDtzm6cjsfYn9Y
         c8K3xAoKbRqyJRNTTdUQLfUD5fWqoEStk3q86vxU3/O66CjMl4hk8mj/47YNEZzse9RY
         eqLfVgo/0wYTnCk6uU8rFk98GsXhwFXrt07zrpS3lMcbASigAZwjEiKRVjdrJ5MBs4JD
         mqgN6wPIG7HUBMrPNma6gDbFB+yRuqvddohyOZPge8teKdTR1kgycQ6m7rgQUW7qq9KG
         hYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=y0cXZBivovxP8ijksatPfPKzIFHRx4Z7abcU1oSJGVA=;
        fh=BEizEjcKKL/56OMmXtnOFdwBgc86NGkjRMY0k00fz84=;
        b=RzRUP4NRcWMGYThomFaJMvjIKKvZAEkEt8HCVjftKKAubskZDy/jDR/bMp20poCgUN
         +U5CF7NDvkfi7n9QndKR7dy7qJGTXP7UcYp7WaE7JsX7vV8c+XS2qB5ip7A54d2usHOt
         BgblPcyT5bFbM70J3QCRsl2nQ2DB6HtlFtwgIMPHKHd0hhLKwKa+VV3bFygX5AsXLyF6
         bSbHifagon03av0KLyHQYerKGFzlWAG+vd/rb+XCnTDpaewr0XvUH9AkJQYtL9IcI7F3
         CJi42/M4cin0gV+b0UEKYTA+bgVxYJScSn2h8y195Pi2P+XghH7lLlWsZ45SdIr1SIuX
         iAgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AV+1q7H5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e469c8d4f0si36011986d6.11.2025.02.12.06.59.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 06:59:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AV+1q7H5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiECL-0003Vf-FW; Wed, 12 Feb 2025 09:58:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiECK-0003VG-Ld
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 09:58:44 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiECI-0003sc-Ob
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 09:58:44 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4395f81db4dso1240565e9.1
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 06:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739372321; x=1739977121; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y0cXZBivovxP8ijksatPfPKzIFHRx4Z7abcU1oSJGVA=;
 b=AV+1q7H5+LyDbwnvguY4bK5W5QxZJZSxE4bgZ6IhTJTtt56CKTD275UiVLH4kcTsFX
 XS0jbxaRonhlla8OkoY+PY9LBygNAvtf1cORAmqSR34FdgAjEjXBnqzDJIYcQUQ8sGtz
 Nu9ZaZegQbeTjK/upnkFWw1288ql143aHebpo6j6CppCS6hZkeyUFH9jOi2C9D95k+9G
 VmqF3PUvISN6XKmN3LjegFBQzGA88syOq1ZzBPYrN/VM7korOgzkekT9wYNPfZ1xl11x
 DGr4nDSwjB/FGosMFoY098wPjgr/LUflzoRNZlUoR7HrzQX8wfV0jqjaxzKHO5VNAzqb
 pcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739372321; x=1739977121;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y0cXZBivovxP8ijksatPfPKzIFHRx4Z7abcU1oSJGVA=;
 b=XRw0VuNUq1m7yS3RlH4DU3TLVYE+InGIE77pqRbYjElZRzgHeeXQkQtx3+sCKCcJKd
 vdbdMwf+voPQGEJdsyMRiWEv18tvJFcCNKINKn4fXhEiHsyIs03p0r2RirT8K8oK96kR
 7M+nzVVg9EyeMbe3rdXmvsxBCMoKtnTChmmYxp6B5eAGFGTFsd+JGSXz4aVUzSgNgu+0
 YVN6MNtvNkT0Cy2x1eNUrt92be9jp17TKs1H9bBdc5+De4wBzFUuqpDV/LYCzo8d2J8k
 64yGy+l5TGyRHwdPmftKjBy9hYlUBTlkzLY8WNDnYIYAFVIjhDAXm9Ny2hGHR3Olahwq
 li0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPP5iMpEj1OEN48/0V4a3Mt2kJAWni8wQLCreuikky+vvFVxMTQJ/FSqkPsYXAMloWuMwbtnYQ7w==@nongnu.org
X-Gm-Message-State: AOJu0YybaeoosqxKBM5o6OgXjNOu9W9PatSH40avEbXg8d9wqHXU0geN
 BUTthZ7u//NsMIFuSUPAlWAerK11xLsI3Ub46Dr/tV4XVZmp3VCQ5ztWmOhz4zE=
X-Gm-Gg: ASbGnctFfNvZmeXqqiP8oYQEdeFK0s5QbLRJOqRKKmrbxyGptiJFktH0mwGV0gUVu/1
 Y/XWLeitui7leQ8RQG89L5RVw3BiJceTARsiNR0sfa/rcy+9QyAcop03JG1J1kSlNnOmV0im56U
 LsnhabEf3Lxg2++Lk62a5yMqAGpFoCxc9ixxhEt0ixV6TVN0xsd/tp/5Iylb7tPTL5ALiqfQpRm
 824sY1ZPukPTwmHVasOnIFChcX9ByrKOBfuqHyfDegJTkfFLF/bP8SOijiWxHFQvVZT2ZAv3/Kd
 m9kruGMUSY8aGoc6lY8OI++B6R4GbD1dMajWzRfEkG9KuhP/qWN4nTPNQNE=
X-Received: by 2002:a05:600c:468c:b0:434:ff08:202e with SMTP id
 5b1f17b1804b1-439583b4d4bmr30639625e9.8.1739372321223; 
 Wed, 12 Feb 2025 06:58:41 -0800 (PST)
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1aa7bcsm21972115e9.28.2025.02.12.06.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 06:58:40 -0800 (PST)
Message-ID: <824c0c10-8aba-4778-b653-d0e2eb6115ea@linaro.org>
Date: Wed, 12 Feb 2025 15:58:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] hw/arm/realview: Explicit number of GIC external IRQs
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>
References: <20250130182441.40480-1-philmd@linaro.org>
 <20250130182441.40480-4-philmd@linaro.org>
 <CAFEAcA_PFSBdB0Uhb8K5aog0kj-HN=s_EBL=pQCkkNLuwUO42g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_PFSBdB0Uhb8K5aog0kj-HN=s_EBL=pQCkkNLuwUO42g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: bxmJqY6KtE0x

On 30/1/25 19:36, Peter Maydell wrote:
> On Thu, 30 Jan 2025 at 18:25, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> When not specified, Cortex-A9MP configures its GIC with 64 external
>> IRQs (see commit a32134aad89 "arm:make the number of GIC interrupts
>> configurable"). Add the GIC_EXT_IRQS definition (with a comment)
>> to make that explicit.
>>
>> Except explicitly setting a property value to its same implicit
>> value, there is no logical change intended.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/realview.c | 17 +++++++++++++++--
>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
>> index 9900a98f3b8..4a62c83506b 100644
>> --- a/hw/arm/realview.c
>> +++ b/hw/arm/realview.c
>> @@ -35,6 +35,14 @@
>>   #define SMP_BOOT_ADDR 0xe0000000
>>   #define SMP_BOOTREG_ADDR 0x10000030
>>
>> +/*
>> + * The Cortex-A9MP may have anything from 0 to 224 external interrupt
>> + * IRQ lines (with another 32 internal). We default to 64+32, which
>> + * is the number provided by the Cortex-A9MP test chip in the
>> + * Realview PBX-A9 and Versatile Express A9 development boards.
>> + */
> 
> On the other hand, this really *is* the Realview PBX-A9
> development board. So we can just say that that's the right
> number (and the vexpress is irrelevant, and the range of
> settings the CPU itself can have isn't very important either).
> 
> (PS: there's no verb "to explicit" in English (ignoring some
> obscure obsolete ones); French "expliciter" => English "to make
> explicit"; or you in the case of the subject line here,
> "specify explicitly" is probably most natural.)

TIL, thanks :)

