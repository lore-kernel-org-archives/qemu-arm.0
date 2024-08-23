Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp69425njb;
        Thu, 22 Aug 2024 23:21:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW64lX7WMVnni0y91twXhjFsz04VGusDo7+Gko7PtUpGSDMpou3uDsPp35BPclV2EitUYoRF3SyjFhVtg==@linaro.org
X-Google-Smtp-Source: AGHT+IFTdWCAt+EyGSZLYn3L/9XjJJyd+dSVaWC3oRdpkWd9FJVh2B0+K8V3s1BQv/EtXj+B73fH
X-Received: by 2002:a05:620a:2623:b0:79f:d0f:2b1f with SMTP id af79cd13be357-7a6897ba6d7mr134441285a.61.1724394074187;
        Thu, 22 Aug 2024 23:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724394074; cv=none;
        d=google.com; s=arc-20160816;
        b=zxnFEkJepuLs7E1NRCIOwI0GRwryZ2dTGnIXurcCZ3/AjDbhpE5XXJlBmzWotFEJDq
         GV/Ult7JXibMrfC/SA8/7xJYDK0l7DC46YfGcFtfxmxiuCGyrPekF1gWnNxXftHg3MQf
         jYSrI8IzqQAERFxvuzgKpOQ2ADMUXSOlMz+fxRJbA8nO42S4iyG+1O+brR/4mozRAXHG
         5kLzukWyYgF/DcW9jAATbBjBomT8QXdGM3bH1NeYiHXz2E/34RtvCnXIt175VKXK0+79
         UjwVvkLk165KmCDFdVObrUHuezvlIVFR0R/cBUJBQnDvCZcBHFR2GXiZLyGygQvPXMts
         y/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=lHhF/F/swQaONpwD+nKZPTJF1ZZpGwL3r/Flj4EEU9E=;
        fh=do0TMBOvtes8x+LP4Z9kpP3Vxm1/r8Aw01KwrJ/ZOy8=;
        b=DPVLSIj32c1DGKC8QtRfmYFMPAcbjXRb2CO6grJ8ECVMPo+5/XQ3vAL7FEUMGlm5Id
         48siTSPK0qz0DSWa3pnbWOKaf9pQg6u6rLXO1hw1XMzjQIxglL0wlldxg2tFu3foepkh
         uXZVSeYbe1C+hAuxRn9VCNLE+tQHGW44paDWskc6Hlpmdd5Sy8yOCd2pGeo8AokcnJ3M
         1FEe6Is6pW1Ur+G1g2PDLeuB4JoHv8zsyoY8dNcTyPxhfKUwrAIyV7UBZ6si9qytZhT2
         owKwpLZbUVAZIlI/W2TlRQr8WczU6Vfr0uyfNXqiWw7Z+p1oBLOf47lF6roObAQ8e3TA
         82Bg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zzbj0jHf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f4296d6si353512285a.642.2024.08.22.23.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2024 23:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zzbj0jHf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1shNfS-00020U-6P; Fri, 23 Aug 2024 02:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1shNfO-0001nC-Uf
 for qemu-arm@nongnu.org; Fri, 23 Aug 2024 02:20:58 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1shNfN-0004MC-5p
 for qemu-arm@nongnu.org; Fri, 23 Aug 2024 02:20:58 -0400
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7a1df0a93eeso103204285a.1
 for <qemu-arm@nongnu.org>; Thu, 22 Aug 2024 23:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724394055; x=1724998855; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lHhF/F/swQaONpwD+nKZPTJF1ZZpGwL3r/Flj4EEU9E=;
 b=Zzbj0jHfnx9v4v04dhauXw6NK5fq7T7dDD9/VYV38vmFFWEEycpjl38d4qKzGr0/FN
 bFmnesXfk+HxFZ5BwES+/HAPcX9UjwBpRSuFtcadm+6M8SegTZNSWCzdeg08OMBemJIt
 fWgnwxbJP+exKPTtewrKcF8X8y/GpoTmljFBL2mzB0/h2pFP5CrZEoF6oBQmI53S0Na/
 7T3zR3Y4I1rh3DTw3tmJtMSipE7dMjYlfmSVdI4edgzo0ILG8C+lJGVhZkXSENubculz
 S+pfesfIsjEZ8xJ5wWm48eJRI5OP8BFYo9/04rUHhaqut6IR0N38IWvl9M+Iebbgd8od
 Mieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724394055; x=1724998855;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lHhF/F/swQaONpwD+nKZPTJF1ZZpGwL3r/Flj4EEU9E=;
 b=h3nZr30A1iL5EbHfrv9IABdStYF2dDhCDLd1iiVMJaON/5Q4JsgRAKuKiBLrM7cREG
 fDAy9NcDYfgSaas22k5MCqKgOHqQNkr0vqS4reU47eDajDgZBiAwlyxPzQvlV0efYLDz
 J1EgNUc9CwVugLvEsYhhEgnidHnqup7BLFpwVwAppCXN+PMFaKwfXAdXWmnje3S3wVMW
 2CRaBlO+YQrrfiSS3BZVoTpECuImTmF+WC+oknjYetm34UavXh03BsHtfurg0FAYw0E9
 xEVTlZLMa/VDxR79yw43ZyMhdCOOw+sqcJtgSyYv8sQyP9JEwtsh9oGHNKDs9casHNBc
 lGZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaD4wAAfyZUttPlxjtM24Eei5KRGLIiLSH8WlRHYUx3szD+8vdQXikRHUXbL7LjQsbG0UL72OlIQ==@nongnu.org
X-Gm-Message-State: AOJu0YxmlaRcjaZDdfMvULp5OOmACG3HJQ/hFS8Cyh4kOFploAN/7p9H
 nDExgsDrDCLLJYL4pxMbZKTcpEuEg7K6Gc1DDcZ9p7RfgLv+9GQHgkdRAvJkxC8=
X-Received: by 2002:a05:620a:170b:b0:7a1:df6f:4374 with SMTP id
 af79cd13be357-7a689700b3fmr125664085a.16.1724394055249; 
 Thu, 22 Aug 2024 23:20:55 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.206.153])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a67f3fc6b9sm145482785a.115.2024.08.22.23.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Aug 2024 23:20:54 -0700 (PDT)
Message-ID: <60ae5753-548f-429d-89b5-f9f3721741f3@linaro.org>
Date: Fri, 23 Aug 2024 08:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/functional: Convert Aarch64 SBSA-Ref avocado
 tests
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240822114146.86838-1-philmd@linaro.org>
 <17ba91fd-b876-4169-8b72-3fddf966e1a3@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <17ba91fd-b876-4169-8b72-3fddf966e1a3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=philmd@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: nl74pTiaqDdq

On 22/8/24 20:48, Marcin Juszkiewicz wrote:
> On 22.08.2024 13:41, Philippe Mathieu-Daudé wrote:
>> Straight forward conversion. Since SBSA_FLASH files are not
>> tarballs, use lzma_uncompress() method.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> Based-on: <20240821082748.65853-1-thuth@redhat.com>
>> ---
> 
>> diff --git a/tests/avocado/machine_aarch64_sbsaref.py 
>> b/tests/functional/test_aarch64_sbsaref.py
>> old mode 100644
>> new mode 100755
>> similarity index 56%
>> rename from tests/avocado/machine_aarch64_sbsaref.py
>> rename to tests/functional/test_aarch64_sbsaref.py
>> index f8bf40c192..6728e5f92a
>> --- a/tests/avocado/machine_aarch64_sbsaref.py
>> +++ b/tests/functional/test_aarch64_sbsaref.py
> 
>> @@ -44,47 +55,31 @@ def fetch_firmware(self):
>>           """
>>           # Secure BootRom (TF-A code)
>> -        fs0_xz_url = (
>> -            
>> "https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/"
>> -            "20240619-148232/edk2/SBSA_FLASH0.fd.xz"
>> -        )
>> -        fs0_xz_hash = 
>> "0c954842a590988f526984de22e21ae0ab9cb351a0c99a8a58e928f0c7359cf7"
>> -        tar_xz_path = self.fetch_asset(fs0_xz_url, 
>> asset_hash=fs0_xz_hash,
>> -                                      algorithm='sha256')
>> -        archive.extract(tar_xz_path, self.workdir)
>> +        fs0_xz_path = self.ASSET_FLASH0.fetch()
>>           fs0_path = os.path.join(self.workdir, "SBSA_FLASH0.fd")
>> +        lzma_uncompress(fs0_xz_path, fs0_path)
>>           # Non-secure rom (UEFI and EFI variables)
>> -        fs1_xz_url = (
>> -            
>> "https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/"
>> -            "20240619-148232/edk2/SBSA_FLASH1.fd.xz"
>> -        )
>> -        fs1_xz_hash = 
>> "c6ec39374c4d79bb9e9cdeeb6db44732d90bb4a334cec92002b3f4b9cac4b5ee"
>> -        tar_xz_path = self.fetch_asset(fs1_xz_url, 
>> asset_hash=fs1_xz_hash,
>> -                                      algorithm='sha256')
>> -        archive.extract(tar_xz_path, self.workdir)
>> +        fs1_xz_path = self.ASSET_FLASH0.fetch()
> 
> Here you want ASSET_FLASH1 not ASSET_FLASH0. That's why it timed out - 
> system was hanging on exit from TF-A to EDK2.

Oops... Thanks you for debugging / noticing this!

> 
>>           fs1_path = os.path.join(self.workdir, "SBSA_FLASH1.fd")
>> +        lzma_uncompress(fs1_xz_path, fs1_path)
> 

