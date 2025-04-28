Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5851617njd;
        Mon, 28 Apr 2025 02:46:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsYXou4f7AFpOMg9r/+aMPgaRF5+PKVwEmBhtO2oyUyabeaRlR1ed0AaVQLkiYl7Od94reU/XoxcGvIw==@linaro.org
X-Google-Smtp-Source: AGHT+IEb73ALmydQSIeFm3Kxlu48TiEE9EpF9zAcsZdcKEiYquU3+Ovt22FOBtJSiNnH5VHdB5Rx
X-Received: by 2002:a05:622a:1905:b0:476:95dd:521c with SMTP id d75a77b69052e-4813356204emr124761721cf.45.1745833574003;
        Mon, 28 Apr 2025 02:46:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745833573; cv=none;
        d=google.com; s=arc-20240605;
        b=Iqj3L0/1xGws5SqZC14SwSli9mSMMXbKPiqfaybvS/oSeDgascSUBW6pyykHIn8M0o
         oC//UkR4eRIuc1dKsGJQbttlQSINoX6gCGEHR8yRq9Kxqbwq74PD8UWVp5H4jvsm/Rlt
         LsVG9tQGz4VXudvzAzhVMq1I1n7KOr9+xRj4JRnVbfP1tsShQKAJzsI+7scEN4CLbbt+
         pdllkX9aewdEpzytBpwXHgxKC6xma778VKRirxLNBN7KxBGxadGn/jzSJUEO9C3DF6AE
         rSJe5gaeQxL7FJC8pZjwnZUdORnukMZecMNfLyvDNQ3MG0N4z3z/rbs8Li/FwCkXeapC
         sxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OoA8Dn2Wtac2FOPR6/hQFftJ/lbfSRDWIBIb8p6NPmE=;
        fh=A/YICdj5jSBuEg+Pg8ODMc4kpeX9OTDtuYxMy6z641s=;
        b=gT5ICCIwgPK8e195QNfzNDu3+3w0t4CbX5hNpE6vs8w5dxEPWyk6JP1ZUmGNbY4NnS
         9ilPh075tHXyBNxYDNutjSD1IOQxX2lodmUeAsMcsNTyfv/s3EGi17C1wkW2GSJGIuGY
         EeZuXYIAuHiutDLbwSvQ+6LMbXKsrZNr0ZqkOjI3iopHX2Tv48aMk4+TnRQR7PreVwq7
         tcnMA6uMHOv84QjQWmEmCuj7Rb4u1egfBWZiD19QgAmYfXfXzvJn03xhVbkF7n4c9tJ8
         /PzUuRRS43D3SIl58QLRScbp3T2UoZK2A99LW03pb7wCNxcSKAz9zfCyOAeXZ5g/P3R2
         nKhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M5n+foSX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47e9fa9ad00si104573491cf.196.2025.04.28.02.46.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 02:46:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M5n+foSX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9L3f-0007Ps-LQ; Mon, 28 Apr 2025 05:45:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u9L3c-0007Pe-Pz
 for qemu-arm@nongnu.org; Mon, 28 Apr 2025 05:45:49 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u9L3a-0005yd-Pa
 for qemu-arm@nongnu.org; Mon, 28 Apr 2025 05:45:48 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso22740675e9.3
 for <qemu-arm@nongnu.org>; Mon, 28 Apr 2025 02:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745833545; x=1746438345; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OoA8Dn2Wtac2FOPR6/hQFftJ/lbfSRDWIBIb8p6NPmE=;
 b=M5n+foSXbONpmshrF6YiRY1ltxwjpofJm4z58vTpoxgaGS69fn3tQ0BT3O6i/WaFD2
 y3KeZgg5un1osW56cDMUBii7EszZ8h6wSYVh7EBO3whbWK/uXwyCIf/ewaIZasaBFMdT
 BPAXaNlgUihmI9TpJp65KFM53GtMk6i/zMYYmbXXUBGp1Acs6SBcYX6SDC6XVkotr3Nn
 EsKnh1S9eM+LUz5fM5EwmbxF8Pc9jfPM4ZvOFRDhPQ+mokOICdixHnBqDf8anTidZ9sE
 WkY6UAJfV14JH8jwE5F2nAEQF6Jiu9xUn2EbhQsqRyo4iRiApxDjsSNsS7+51voW5RNT
 RdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745833545; x=1746438345;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OoA8Dn2Wtac2FOPR6/hQFftJ/lbfSRDWIBIb8p6NPmE=;
 b=FrPVnx1jErLvv85QQh8xnwLdqjRy5HMFzwyN+CucL4OwAwTxfxHkUfzdtWcB376aSP
 UBjkrzgpI4ItDwyEv31VqwGbwJ9tWt5pwze2Yamqn18JFU+UA4ImfILVHmaCJH6cHXpB
 EuFBnVBwPO3MhLikxoV6Q7czNBn6QhD20Ec89OrKSdSFhYwUkxaqYsirs0wGap6ThQZL
 r6bGs0N63wMwdQ+fFclWdLvv96IxOtGfIk/YRptMaLc573I10UWJvU+LCvwEcLUczO66
 xCeny76u1yrXzGSrx8fr8bVBJQFGYnn34Ja9plf6DWutLgYHaE1zyJ55a8FiELI4wdjC
 2cTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdzS7hFvz4Buz62Ecf1PQ2ljCuhw1j1J7vxSN9W7mEd49fU1voP1eA9UOH7q/rUMkZBkdx52ja0A==@nongnu.org
X-Gm-Message-State: AOJu0Yxq3xTNVmj4TXdIkCEtmqkxvAlvw+9vgL4kaoPgAN+TaQBJsY87
 oi5g+fo8cpmRE191tYE7OdM8tLd5a2yvu+kvhAl/n3WUJPBCvlZCRTwCywsRufI=
X-Gm-Gg: ASbGncvSlkJrFcosZXKLyn0d5avhy/ayzicF7EZ+hY6hqCC1/bpC42frVsyBa9Z6oiy
 f3ki6sAJzhaV3jhSTOLwPJDpV8fH//SyWxv42+V+MDMFHqW3NCnLJxR5YGMb4bZtuVkJ7dS4Fs4
 O35DwYl1gU/m227aWeStoGAMtoLC9tihoXDL5ge+j4Mwvs98FszDZlIwSOPG4kDQXrmTesfNcZJ
 jn9AISMEsNivyvSlPOeiuHi8GAYFoapaJoSYiR+M1CCUtqGP8TdQk4oqr25PZMYbQZTf8y9+kia
 OpFKbD1+d/+WsgPvJS0cPsNHnnbfnfmfzNoBG5g9DrkAFccDqHxUZa6b68F7mSIOS4ghlncmNfQ
 NpyNxYAJyU49DTw==
X-Received: by 2002:a05:600c:b8d:b0:440:66c5:26f4 with SMTP id
 5b1f17b1804b1-440a65cdb5dmr89255715e9.1.1745833544725; 
 Mon, 28 Apr 2025 02:45:44 -0700 (PDT)
Received: from [192.168.69.226] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d29b990sm155277435e9.4.2025.04.28.02.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 02:45:44 -0700 (PDT)
Message-ID: <55dd4885-9f2e-4a52-bced-b70058f54101@linaro.org>
Date: Mon, 28 Apr 2025 11:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] hw/arm/aspeed: Add support for loading vbootrom
 image via "-bios"
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20250417031209.2647703-1-jamin_lin@aspeedtech.com>
 <20250417031209.2647703-7-jamin_lin@aspeedtech.com>
 <85a2947e-6909-4311-8b58-f9eb8045e76c@kaod.org>
 <SI2PR06MB5041D4AD25381C7D1D6A5C1CFCBB2@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <a4c178b6-7048-42d1-9e90-58ed87baf9b5@kaod.org>
 <SI2PR06MB5041756942DE834177DFF573FCBA2@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <53e66299-ba7f-404e-87c8-2952fb4d857b@kaod.org>
 <SI2PR06MB504102422034DBB6EA8CFFE4FC812@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <SI2PR06MB504102422034DBB6EA8CFFE4FC812@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: eYrrIRi+9nKX

On 28/4/25 09:54, Jamin Lin wrote:
> Hi Cedric,
> 
>> Subject: Re: [PATCH v4 06/10] hw/arm/aspeed: Add support for loading
>> vbootrom image via "-bios"
>>
>> Hello Jamin,
>>
>> + Phil.
>>
>> On 4/23/25 09:02, Jamin Lin wrote:
>>> Hi Cedric,
>>>
>>>> Cc: Troy Lee <troy_lee@aspeedtech.com>; nabihestefan@google.com
>>>> Subject: Re: [PATCH v4 06/10] hw/arm/aspeed: Add support for loading
>>>> vbootrom image via "-bios"
>>>>
>>>> Hello Jamin,
>>>>
>>>>> Based on the design of aspeed_install_boot_rom, users can place
>>>>> their ROM code at the top of the image-bmc, and this function will
>>>>> install image-bmc which included the user's ROM IMAGE at the
>>>>> ASPEED_DEV_SPI_BOOT address.  For AST2600, users typically set the
>>>>> boot address to 0x0 and boot directly from there.
>>>>>
>>>>> For AST2700, we introduced a vbootrom to simulate the ROM code and
>>>>> the BOOTMCU SPL (RISC-V).
>>>>
>>>> Side question, is anyone working on the BOOTMCU SPL (RISC-V) models ?
>>>> heterogeneous machines should be supported one day.
>>>>
>>>
>>> Troy developed an initial implementation, but testing has not yet been
>>> performed due to uncertainty around "how to share DRAM memory and
>> controllers registers" between the RISC-V and the Cortex-A35 cores.
>>> Furthermore, RISC-V interrupt support is currently not implemented.
>> Could you explain a bit more the issues you are facing ? Single QEMU binary is
>> expected to become a reality in the near future and the
>> ast2700 models could benefit from it.
>>
> There is a BootMCU which is a 32-bit RISC-V CPU, and its DRAM start address is 0x80000000 (32-bit address space).
> The primary CPU is a Cortex-A35, and its DRAM start address is 0x400000000 (64-bit address space).
> 
> If the BootMCU writes 0x12345678 to address 0x80000000, the Cortex-A35 should be able to read 0x12345678 from address 0x400000000.
> Similarly, if the Cortex-A35 writes 0x00ABCDEF to address 0x400000000, the BootMCU should be able to read 0x00ABCDEF from address 0x80000000.

This shouldn't be a problem, the raspi machines have something similar.

I remember having an issue when displaying the address spaces on the
monitor, using your example, if you start mapping the dram on the rv
core, then the AS has some internal offset, and when you map it on the
arm cluster, the offset persists and you'd see it mapped at
0x3_8000_0000 while being at 0x4_0000_0000 (it is a bug). However the
accesses from the arm cores really hit 0x4_0000_0000 base: it is just
a display problem IIRC.

Maybe the thread around this issue was this one:
https://lore.kernel.org/qemu-devel/20210421144846.GI4440@xz-x1/
