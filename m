Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp592407ejk;
        Wed, 29 May 2024 06:37:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6QHoRawV0MpKBAZ8Rh7yLuXyyeTZiD0UFSfgh//EMSQmug5OgUKuK21idEuIYj+lAfYe1tUx+42nqbLYt51hwk78zJ0uD
X-Google-Smtp-Source: AGHT+IGtcNmKz2/V71ZkPj8P8pxb2Hwcg+BETeM9JeR4xx8dF3Z+DgD/iU87eaYbdd50aeetDG6C
X-Received: by 2002:a05:620a:5dcb:b0:792:c524:c67a with SMTP id af79cd13be357-794ab053910mr1570731185a.2.1716989866189;
        Wed, 29 May 2024 06:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716989866; cv=none;
        d=google.com; s=arc-20160816;
        b=OiubLTLPM/BYfNpAgtnWJbMq+3CE7x9wAgukjFhas6SgKziiX+prldLp+woFJ455Wf
         Mh2xuqQmXIJLQu4Hs6fOlFKSBkzgWgBQJpNK68FJ+XMH/4/Sp1rlhcjMjZYiA08JGHFh
         8yspFiSAtb396MJlj/snglqbIYMF9VWWskCcyouyuc0wc2Q99aA3XYO5hFS3qVHMByF7
         Z3wivThAWEvdEHUzDPFNmMpMWoCT1j0EghlmkoucA0VrOrXlT2NwV9+KcSwHw15309GR
         oY+RusY/VZMJvofGrSygk4lqDppAUZwMY9lfq+g01DqFR/qolLS6NpEHfLqFhCgBIFrz
         dFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:content-language:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=fOODItsYaoXYGjV8sS8g9feC2BLE+G51N4k7qxVKN0I=;
        fh=MRIgwEw1fjUAlZI52zBtW2ECatp0NPWM7jOleU3yZQI=;
        b=hCcBTcT2Ie4sDr8TE9lHSdvWOQxGCPG21mcpDfenGkJMJlOKAL6ood3LMnl+7aI0OE
         Ymct6XgbvET5sTTCHBTko909q9xi61AFZp1D5T5kBYvXslV0fng7zP5cyDZ+fj144R8n
         Dce4Ws6DZFPdL+hZqkVIWfUvPXOCWJLbq5NeWTu+SMulxdYVn9I4Y7mVO1Dhs5TgxQrj
         71/620wMk5EJ/dRBlhqYa2liNf08/S9sFi9RLbbfUivjIQVE3jEmRFYyJ6tkND1hGTZv
         OIoqq5DK1sPeAx1/D/MlLT1MMjpMowwESdIamBbSesg6tCGZ4V9fCTbmxIKbpf7kvYFN
         8sTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XS2c26f+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abcc8009si1234371785a.214.2024.05.29.06.37.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 May 2024 06:37:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XS2c26f+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCJUP-0007Qt-BO; Wed, 29 May 2024 09:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sCJUN-0007QM-OE
 for qemu-arm@nongnu.org; Wed, 29 May 2024 09:37:11 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1sCJUL-0008SO-Fh
 for qemu-arm@nongnu.org; Wed, 29 May 2024 09:37:11 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a6519c6ec7bso82139266b.1
 for <qemu-arm@nongnu.org>; Wed, 29 May 2024 06:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716989827; x=1717594627; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=fOODItsYaoXYGjV8sS8g9feC2BLE+G51N4k7qxVKN0I=;
 b=XS2c26f+UzgoyZKYCEYRnT/xgkDx66zlGqOlyC59/8yypdQGqw3D7RJ1GWniEK0nt1
 XpL8+J2R8ETwJ/YXHCGrK4sRGvBhWyTB9a9Eb1eGv+hdOzvOmpDhcmgyracPHsFoOpBB
 TvOPO+EyE8QeEDwxmGU2AIjVlYeiXLi3hD1i6q2wcX62UYCFtM5n74qEFKhDZuf94f90
 V0yy3Ht4KolKXHFyqlIRgTSkkUbCm3cRIVdonwOF3Lfudb6bKJkpc7mlzj91/2fHhMF5
 w2Nc2fVGbgumL8AsXFlcTBjFCD7vaP4yrWMb5UmHEBc6lmCwSuW4Esr3Xvg0OO8sMmyQ
 swUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716989827; x=1717594627;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fOODItsYaoXYGjV8sS8g9feC2BLE+G51N4k7qxVKN0I=;
 b=p/BSBXSqqoroKf51WQlcjqbnwyET49yESwK8CM9+r4DJBnpdxDuojyP5FJ97+vLqui
 8uPXyENzmN8EBxx+mSStaJQqi9I/YuQH0SdofiiDZY5865LQE2tErjEW9W+IBteKMiRV
 ZhpXEYP8bMpASwXdBwlVLTahUI86qzozut2/4JrZTqETXdAk/wxTnrtVw7Fy0c1LBFvm
 N0YYSINj0wJwTtNKmNf8G3dU8hW/pflmbOCY+lnnhBNi4bhg1rw/rBHCNdfo3USf7R2L
 WY7E2sO/w7iBnZadrT4TJ4o51tUUClRR7dzoYr6SvNyd6xX8VXcDQYig+kYvnGgac+xx
 R99Q==
X-Gm-Message-State: AOJu0YyzuzU/WeNsknH+ub3G+StvBkB5uNqsCNRnKLrwtxqkz2xMsYee
 JiaptkjtDtW1Sz/j0prYoL3/eS+gcIUeCSK0D0VPjaysA/ByA3RN2ggyaaQePGA=
X-Received: by 2002:a17:906:1984:b0:a59:a64d:c5b9 with SMTP id
 a640c23a62f3a-a626524eae9mr1597147666b.76.1716989827495; 
 Wed, 29 May 2024 06:37:07 -0700 (PDT)
Received: from [192.168.200.106] (83.11.37.15.ipv4.supernova.orange.pl.
 [83.11.37.15]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc89943sm728623366b.144.2024.05.29.06.37.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 06:37:07 -0700 (PDT)
Message-ID: <1b6389e6-2a0d-4b1a-8ac4-9525384041d9@linaro.org>
Date: Wed, 29 May 2024 15:37:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] tests/avocado: update sbsa-ref firmware
To: Leif Lindholm <quic_llindhol@quicinc.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20240528182917.91027-1-marcin.juszkiewicz@linaro.org>
 <543bf25f-ca93-43a0-a93f-c3de6f878b16@quicinc.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
Organization: Linaro
In-Reply-To: <543bf25f-ca93-43a0-a93f-c3de6f878b16@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x631.google.com
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
X-TUID: 6S0i9B9HKUzT

W dniu 29.05.2024 o 15:12, Leif Lindholm pisze:
> On 2024-05-28 19:29, Marcin Juszkiewicz wrote:
>> Partial support for NUMA setup:
>> - cpu nodes
>> - memory nodes
>>
>> Used versions:
>>
>> - Trusted Firmware v2.11.0
>> - Tianocore EDK2 stable202405
>> - Tianocore EDK2 Platforms code commit 4bbd0ed
>>
>> Firmware is built using Debian 'bookworm' cross toolchain (gcc 12.2.0).
> 
> Missing signoff?

Ooops.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

> Apart from that:
> Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>
> 
>> ---
>>   tests/avocado/machine_aarch64_sbsaref.py | 20 ++++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/tests/avocado/machine_aarch64_sbsaref.py 
>> b/tests/avocado/machine_aarch64_sbsaref.py
>> index 98c76c1ff7..6bb82f2a03 100644
>> --- a/tests/avocado/machine_aarch64_sbsaref.py
>> +++ b/tests/avocado/machine_aarch64_sbsaref.py
>> @@ -37,18 +37,18 @@ def fetch_firmware(self):
>>           Used components:
>> -        - Trusted Firmware 2.10.2
>> -        - Tianocore EDK2 stable202402
>> -        - Tianocore EDK2-platforms commit 085c2fb
>> +        - Trusted Firmware 2.11.0
>> +        - Tianocore EDK2 stable202405
>> +        - Tianocore EDK2-platforms commit 4bbd0ed
>>           """
>>           # Secure BootRom (TF-A code)
>>           fs0_xz_url = (
>>               
>> "https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/"
>> -            "20240313-116475/edk2/SBSA_FLASH0.fd.xz"
>> +            "20240528-140808/edk2/SBSA_FLASH0.fd.xz"
>>           )
>> -        fs0_xz_hash = 
>> "637593749cc307dea7dc13265c32e5d020267552f22b18a31850b8429fc5e159"
>> +        fs0_xz_hash = 
>> "fa6004900b67172914c908b78557fec4d36a5f784f4c3dd08f49adb75e1892a9"
>>           tar_xz_path = self.fetch_asset(fs0_xz_url, 
>> asset_hash=fs0_xz_hash,
>>                                         algorithm='sha256')
>>           archive.extract(tar_xz_path, self.workdir)
>> @@ -57,9 +57,9 @@ def fetch_firmware(self):
>>           # Non-secure rom (UEFI and EFI variables)
>>           fs1_xz_url = (
>>               
>> "https://artifacts.codelinaro.org/artifactory/linaro-419-sbsa-ref/"
>> -            "20240313-116475/edk2/SBSA_FLASH1.fd.xz"
>> +            "20240528-140808/edk2/SBSA_FLASH1.fd.xz"
>>           )
>> -        fs1_xz_hash = 
>> "cb0a5e8cf5e303c5d3dc106cfd5943ffe9714b86afddee7164c69ee1dd41991c"
>> +        fs1_xz_hash = 
>> "5f3747d4000bc416d9641e33ff4ac60c3cc8cb74ca51b6e932e58531c62eb6f7"
>>           tar_xz_path = self.fetch_asset(fs1_xz_url, 
>> asset_hash=fs1_xz_hash,
>>                                         algorithm='sha256')
>>           archive.extract(tar_xz_path, self.workdir)
>> @@ -98,15 +98,15 @@ def test_sbsaref_edk2_firmware(self):
>>           # AP Trusted ROM
>>           wait_for_console_pattern(self, "Booting Trusted Firmware")
>> -        wait_for_console_pattern(self, "BL1: v2.10.2(release):")
>> +        wait_for_console_pattern(self, "BL1: v2.11.0(release):")
>>           wait_for_console_pattern(self, "BL1: Booting BL2")
>>           # Trusted Boot Firmware
>> -        wait_for_console_pattern(self, "BL2: v2.10.2(release)")
>> +        wait_for_console_pattern(self, "BL2: v2.11.0(release)")
>>           wait_for_console_pattern(self, "Booting BL31")
>>           # EL3 Runtime Software
>> -        wait_for_console_pattern(self, "BL31: v2.10.2(release)")
>> +        wait_for_console_pattern(self, "BL31: v2.11.0(release)")
>>           # Non-trusted Firmware
>>           wait_for_console_pattern(self, "UEFI firmware (version 1.0")
> 

