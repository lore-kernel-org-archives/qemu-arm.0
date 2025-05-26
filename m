Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3994844njc;
        Sun, 25 May 2025 22:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVon8E2KCYE9rpELDAiugmToJz4XZiyvxW3CPGEVNb7AaBU2Kyp9xEG+Re1fEQ4HAIiOsatqIb2sFyjIg==@linaro.org
X-Received: by 2002:a05:6122:8cf:b0:52a:79fd:34bd with SMTP id 71dfb90a1353d-52f2c4d8f4emr6257992e0c.4.1748238037171;
        Sun, 25 May 2025 22:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748238037; cv=none;
        d=google.com; s=arc-20240605;
        b=WGLXnHDFRc5Uilh0qc/dV1iRiZ9ecfa/dfaUa2HtHfrSSXZkNPWPMld50YwnbVDmd0
         YMrdcCVZw/9GKahEi6+Jdw4bpLSKfuuCwBkYMTyq7ZCt924ksmg+3dXvJOOsWqyQSjhB
         bq64Kg3WqXAZUnK3OqVPvTtUHfY/hy2D1QThuZuldKW+G1t4gt9ywp7Tn91auSx+cRly
         WeimusQUP02pGSRDctfmfV2xgsNmxvtP5Ot8lFJvCfwSknYBV1PghIjFTE8yt0ncYLjs
         cWrJwKgsJZ55Rn6AcgccisvG+f5sKO50qWA4Mnvu8wdVLb6fm+jvnnlux5pEMLQYG6if
         +P6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=eX7rKwEVeBoFbfBoHpfuEgu5R7z1fok8+2Ur3zkfZLs=;
        fh=EdKcHr8NARFVGGuoXL53Yzpn2HIJ2pz9YNiJgwkR15U=;
        b=YuzoVtVPzjx09FxXGKmRcUB1CBi5AjmHsP+NW9Wq+gCshz/ZPW8E6KJuObnet7BF+B
         cWUMR1sWwfkBf5pYw1my1iE+N3bfYdCUl8FK40b9wk1d5NK2FD8vJJ+C//pjZBUBSeDZ
         RHqBRVisFy6MfFnMoZaFLBQz+B71BiE4sNyEWvLeG+wp7qYtz7lxQI1xnulnt8IXpdYC
         ljwuItqbDc+RzqMhdA0rx/jkXCNv/eOx4+YaSDh/meFyKcAC4R5BlLGrsV5soz3z3E3k
         IWmVO2noGb2BC76cWrXOnxOgYjsXw72W350ejj0prO6oP1PnZCX9N/vgCaslWG+XXXZJ
         c+3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HoG11uE/";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 71dfb90a1353d-52dba910855sor9684766e0c.1.2025.05.25.22.40.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 25 May 2025 22:40:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="HoG11uE/";
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748238036; x=1748842836; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eX7rKwEVeBoFbfBoHpfuEgu5R7z1fok8+2Ur3zkfZLs=;
        b=HoG11uE/z/95lcpM2R/s+xMeUviC5pJMin93NLBqYMehqnsjjCbqZzyesnWZU98D73
         goH0vC4b8c8eoj0UjkTBho2ifQKjt2E+if45s7T16dXwNwHBMbkz5oS4jw595CvkKvPk
         oHguyCH4ACBdQxG3aDqY7L8zJe9ZxRLxFAhyX80d+ZMqguKhMPhGnLAoJGiOsv/zoiMA
         SKDDsaI1juIUzsL3UtawTU/LFq0waBYWqz66zaZDzt4IxpShiPILNC7b/3hOII/VlQJZ
         UdMqsaEbVyT9pfqPYwaHdTE0gKYUJUzFsGJau0ICoS1NfmAAa1vgyFvDwDBZi1tB7mhB
         efmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748238036; x=1748842836;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eX7rKwEVeBoFbfBoHpfuEgu5R7z1fok8+2Ur3zkfZLs=;
        b=UCuymep/29XjHI7hhEt+49FFAsmNmGpIUutX0amAXKqmnn/xWy6ggMae0kBtTXyfzt
         cR0/TR+iXZ2RYnn+5jV+yjdGdQEeZSsGqsDqb59Hh5ZF1fqp+vSVbJerlDLSdkmLA4hz
         GzYKdkO+ZmKzTn6khSYzFirP7GwuU2AqgNnxfYF8MZP9JUUvX56lFBRCms8yaZVqlwFH
         K33Y73PoKAxZFDZMaupC3a/O92VC1Av/S7+oyicX9hQWh5svs/76PjpD7ItDHi+JL2wI
         EuwQwvk17AGGuAylkV8ddvSYUeTKZECRgafVWSHn54E0uqhmk9u0VvQGXIZN8wthTOSs
         Ho5g==
X-Forwarded-Encrypted: i=1; AJvYcCUXH4hcSLq5EQkJD4hpK0BcvJfZYtBgIwk1+YrvIl086Hvo1qlxiMuSHVYjBDTogW5NRJN91baNCgSuYg==@linaro.org
X-Gm-Message-State: AOJu0Yx9GirRrJp3dqE3ahm4VKiZKbuFbR3eGbvmP6JkZU3JSeROpijo
	EuHF+eQbnFRwcMhzrT1oIC7Aajmk/9iK70UuKWhU5wP1Yj+hOuKrfPSYN0WKQwO94q+TBA==
X-Gm-Gg: ASbGnctSbyCsfaMWyv2HslgJR7bXr0uhGSb3JwVMQSOLLNYzfOWL2yxSyRy+me3MKcs
	pHMXUgNtOnnv8EMFGOzSMNMebkPWQrKTV+obpV1AA0CPfyKtzihPr/noq6SJ4l4W7dgAEM70CYg
	+jwW3fzSBkl+gvSGVAIwRJ3FJz8Wdybfgeb3BWYFP1YEpYmJMGErb9AHEnuCH3+ZtNct5yrAwDW
	FVUYhVF+cHDPbBgmxmNJepEmtWoVWodjnipfDLUJW0q2q1Z8YlGvNqKmlfFRg14V9QOwyPuL8PJ
	zghAAuT7fK3PzxTRtkgZkg9nlm2umft0p3Dvz8uZySsvVQl6HPaUIJspCZbKh2qRIMe8+CnRAJa
	mVtFxRmUhIdqt5Ml/GxhFAi5JJ9iCLQ==
X-Google-Smtp-Source: AGHT+IFAkofzZafmpvZGZDjLLsmro+pk3TmxyHtqUuBdMjEpKrM5lKOrdfAyS4CzV2sfYSuNQVkFCA==
X-Received: by 2002:a05:6122:81c4:b0:52f:4776:f6a7 with SMTP id 71dfb90a1353d-52f4776fcb5mr305127e0c.0.1748238036659;
        Sun, 25 May 2025 22:40:36 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPV6:2804:7f0:b402:6ba2:d081:510e:25da:56a5? ([2804:7f0:b402:6ba2:d081:510e:25da:56a5])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab6c0c2sm17171111e0c.42.2025.05.25.22.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 22:40:36 -0700 (PDT)
Message-ID: <160e3fea-3582-4f9f-b4e7-1dd628e08be3@linaro.org>
Date: Mon, 26 May 2025 02:39:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New test in bios-tables-test.c for the ACPI PCI hotplug on ARM
 series
From: Gustavo Romero <gustavo.romero@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <e376b3f5-81e9-4b67-ba8c-048ca713d894@linaro.org>
Content-Language: en-US
In-Reply-To: <e376b3f5-81e9-4b67-ba8c-048ca713d894@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: AuhVRoZKxIvi

Hi Eric,

On 5/22/25 22:13, Gustavo Romero wrote:
> Hi Eric,
> 
> While we go through the ACPI PCI Hotplug series [0] and review it, I'm
> starting to take a look at tests/qtest/bios-tables-test.c.
> 
> You mentioned testing the combinations of "acpi-root-pci-hotplug"
> and "acpi-pci-hotplug-with-bridge-support" flags [1], but taking a
> look now I see that "acpi-root-pci-hotplug" is only used in a PCI
> context (not in PCIE, so not meaningful in GPEX), hence
> "acpi-pci-hotplug-with-bridge-support" would be the interesting
> flag for testing the ACPI PCI HP series for ARM. Since this maps to
> 'use_acpi_hotplug_bridge' variable in i386 (e.g., in ICH9 controller)
> and this variable is being controlled by machine flag "acpi_pcihp"
> in the series, I understand it's only a matter of testing the ACPI for
> acpi_pcihp=off and acpi_pcihp=on. What do you think?

I've posted v1:

https://mail.gnu.org/archive/html/qemu-devel/2025-05/msg05824.html


Cheers,
Gustavo
