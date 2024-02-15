Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp639833ejb;
        Thu, 15 Feb 2024 07:25:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX/fiYdItpQf2Cg8o3A/MGApzcfCxdUwF4MeVsTu0mt3b2f77R+cfm3aRLHg1X/h8eisKCe6m9qstHMKOl2iEHa/sU4zwSw
X-Google-Smtp-Source: AGHT+IFjBUZvMpQHMtAtzEbwj3BXPaHq4rtNFDfwj1W9hiYqO6mkm0e79g30/8TQHsR/AqEkL58O
X-Received: by 2002:a05:6214:c4b:b0:68c:7395:1bf with SMTP id r11-20020a0562140c4b00b0068c739501bfmr2872351qvj.8.1708010736215;
        Thu, 15 Feb 2024 07:25:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708010736; cv=none;
        d=google.com; s=arc-20160816;
        b=I0UeWidJx0ZXjoThYhUQQq9N62Tw504WAjmwINIsZ+MZ3Bmdb55eXJ5eNWmze8q+cs
         vHpU9NnrAJl2bk/n8URQv6ckzPeWjGFjvbvYOKe62LXEIl4f7hVK7TqmNTsrhhfrPXJs
         vG9XWf+Km+/rxLtSfa+T+s9iEGb/ijjEBdei4+1wo4rEae9TKLlp5vDUrKr1arnQS3yz
         4bfaF+QWyEdzEMp5YI4TrlqEyOboPw8BmKw73I1gSJ17S/3knT5o60MIBwKkSM5+n+ku
         3qEKxQUNAj55cQ4+vUAaZjAqo35mkJdLaJmHkgiqL9CVXH47MFLu1VTc0eZoJ7DQdVpi
         xr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jhRQsAfr4ekZEkJ8DDbzUQK1c7Hjd/Dzn/FvQXB9GF4=;
        fh=BGtF4Xz+ORMrQW3SohAGrWRN4mp2qZxSIrBoGT6OYZk=;
        b=Kbh2dnZ8ReEfxmiWYP77UyyhPtXfjyHXPdwUrbj3Gj3RDoSyNW+N1zRSZrmbdzf6k/
         Bhc9iqCNmkbpa9rzUw3fNFkMJKXlaxIXZzbx06Mr3ubWvRYg2NDUZjUaDHbvHFLk7dwG
         iSySoXPqU7QR1jZJM9W39l2tdMRS6wl8C96IKGrEX5sKQl/73v54xDsyMerlaDEPP5Qz
         0/Z9JX+jZiV9/7QEvdjlBnJ/IC6NMnZkcAV44mn1aq4Nv+9eVxwVyVxUxmvWDzJZC3+C
         a+901Ag4NLXsjrHi42SrA+v5nptebOb7FDGAf8O9eU+cL/rW8n5SaS9qOIpFy0OlEnjU
         a9Qg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kSoWwjym;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020a0562140d6600b0068cb37cf647si1690293qvs.313.2024.02.15.07.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 07:25:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kSoWwjym;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1radc9-0000KC-1N; Thu, 15 Feb 2024 10:25:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1radc7-0000JU-2P
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 10:25:27 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1radc3-00087D-No
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 10:25:26 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33d0a7f2424so412097f8f.0
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 07:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708010722; x=1708615522; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jhRQsAfr4ekZEkJ8DDbzUQK1c7Hjd/Dzn/FvQXB9GF4=;
 b=kSoWwjymiOgfWfqel/j17t4H+IsRoIUjMEOqucUrJI7HdznoHt+mFUWn/3YjZIisnV
 /DkWzzQacI9kyqwItYr8GePM/KS+01SCDjRVcKQ/Ah1cLsULiq06z4t4m6gKaCfTluWO
 nPv2ThECWeinTrja8TXSpDapKXi7OGVkpMU2fucyS9BAaxKuDCBZ3EmGlpMbI55I4MM3
 mNfDzN3TV02pLXCcCHDivHr1wt0JS0uioHDY7POqmDExCNRsXdQb/Wc6hwOZn1iHxZ5z
 W9oqH/j+CmEnywJ0UBwIXpq6RSgyLnuZc4lcHAk9giPpx84JeblagQTOhPYPs97xL7xn
 /VXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708010722; x=1708615522;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jhRQsAfr4ekZEkJ8DDbzUQK1c7Hjd/Dzn/FvQXB9GF4=;
 b=nT2zMits2oGZs/bIlT0nfpqtkCqngtww23uF2aWTOWjkmJoqqzUYcznvydizM1Kd17
 uW5HJx8/geDqV6VzrFZR4Hk34yjur15xm5DakhsaLg2DOCzx2rbAk+qbDQF6L3/oSOzm
 oKe+Crp9O5MdhHpqxKT4QVaai7sp+9YZ5jcUPoaHar7mpO3l9/sicV4LRosMeKgSIOYi
 I0OSSctXEPtJchf+redpD+In5w/BabJnU9E70t1j0AS2Uu4UgqF4sZYPPaVuIBhnMdRt
 V47rT7Q6n6M+PJonOxt2gBg+diwWRTEKk24jrNzmY70L28+4SgNg3Xdn4s4Df3g3ul5E
 Coew==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3m+HvLC9iOFE5MnXEpVxgaFPF4J4BQEDoym/x81wVF1JsAQ4RedP/OhRIOMDbzWMdkrN34bAFqeTbpFVxGDFBe9i2
X-Gm-Message-State: AOJu0YyBAHc71rZkdprChc4K7znWgCtwSJLn6dyWQp9EOc0LXBbQ+tck
 dV8+SFEcAoY+Don/eRW3TPjlKHxC9cncRy5oTWB0WnTp0YJX4w9tjW04mTuS77Q=
X-Received: by 2002:adf:f892:0:b0:33b:6129:9d5a with SMTP id
 u18-20020adff892000000b0033b61299d5amr1983713wrp.52.1708010721817; 
 Thu, 15 Feb 2024 07:25:21 -0800 (PST)
Received: from [192.168.69.100] ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 s13-20020adfeccd000000b0033b7ce8b496sm430245wro.108.2024.02.15.07.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 07:25:21 -0800 (PST)
Message-ID: <5927419d-2dcb-470f-9b88-7320577d1a27@linaro.org>
Date: Thu, 15 Feb 2024 16:25:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] hw/ide/ahci: Inline ahci_get_num_ports()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <20240213081201.78951-1-philmd@linaro.org>
 <20240213081201.78951-5-philmd@linaro.org>
 <f2dd89fd-db4c-410a-bcdc-2a117e4f633a@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <f2dd89fd-db4c-410a-bcdc-2a117e4f633a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: AFV+5UnXvNiZ

On 13/2/24 17:43, Richard Henderson wrote:
> On 2/12/24 22:11, Philippe Mathieu-Daudé wrote:
>> Introduce the 'ich9' variable and inline ahci_get_num_ports().
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/hw/ide/ahci.h | 1 -
>>   hw/i386/pc_q35.c      | 6 ++++--
>>   hw/ide/ahci.c         | 8 --------
>>   hw/mips/boston.c      | 6 ++++--
>>   4 files changed, 8 insertions(+), 13 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> As far as it goes.  But it certainly highlights that
> 
>> +        g_assert(MAX_SATA_PORTS == ich9->ahci.ports);
>> +        ide_drive_get(hd, ich9->ahci.ports);
> ....
>> +    g_assert(ARRAY_SIZE(hd) == ich9->ahci.ports);
>> +    ide_drive_get(hd, ich9->ahci.ports);
> 
> ports is always a constant.  Or perhaps that's only from this PCI usage?

I'm just moving code around :)

I'm not sure about this assert, but TBH I consider ide_drive_get()
as legacy API (pre -blockdev, only 7 uses in the tree, half from old
boards).

I'll let that constant cleanup for later.

Regards,

Phil.
