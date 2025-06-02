Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2544532njh;
        Sun, 1 Jun 2025 22:45:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVd8lD5XJRqBrdo+SOghgdwnU+Fh6NROKdrt4Cf3NJkWFMpfjVdjq8YE1sKd7YdzA+bHIhpfldvS5PQpQ==@linaro.org
X-Received: by 2002:a05:6102:cd3:b0:4e5:a837:b0d2 with SMTP id ada2fe7eead31-4e701a2842emr4631329137.3.1748843127212;
        Sun, 01 Jun 2025 22:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748843127; cv=none;
        d=google.com; s=arc-20240605;
        b=lWrNo1LyHIXNVfhKrTalBoFRDADvbNebTNTfaVhi1ZbXJmqY4QhTyr6yXXc4Qaekfx
         kD3owqHd3srAJi9wlg3+sBh4D6vL/r1AsTEHUfhT6jbkXDIEoOY079wSOfEVTVLRVCM1
         OrJFmGELkt5O29x0GWfgBYmqqM5g5hJwrHurXHgjWH55vOBDa1lH1eDb7y9URzngn0hW
         YBxXI2pw2yzT8bEHxqsYvrkfWn0Dq/s9b7Uu/TOq7g1XOfk7RCJmLjY4sj8iQGoZs3Ca
         ZJ6ro0T7kUX31Rp2v070X1qK9O685IzkzOCPFskpe9qgTrqFTyXDXmSBLnPVCv1w1qQm
         HCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3wgaVQM5JOk0cE5WtY1vo4wuuhYf0EVx9YzGQ7j6Rv0=;
        fh=MBir1+RzDuTj7GNg+ZPQs9S/4FZBpNyM10gL7gmwm0g=;
        b=UKUM7zCwKiHFFWrKgDMaCv+NDglEkLttfHwBySkKYR9vUk6ikT3P7lyXHDn0WCwHht
         QHhOuoSyLGcoPB6aIGsh+DwHXriLiBWTiJ7JClCGjDRyO+z3rp0kkhS+xDoO2aADYJq7
         3Owm24gZnKvCVkPSH+sL4hiv8f7ctEwGHEllIW7tSJEBiM/xOKmbWyEV8fQkPLM27BTM
         X++Z9EbwlK6xVIiJUeJ0YtXBdP6d3idO1NFUM6dMksJUNXSXp3Zl3OsDRycmYgZZTanE
         Y1K/STT0jPnY/jVBE4BYPmNlJpC2jKf65EtHJocMzn+7hbRFglIRhWUymNOPV06XeyGS
         kaVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCg3TTqz;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a1e0cc1a2514c-87e2a36624asor4509276241.6.2025.06.01.22.45.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 01 Jun 2025 22:45:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCg3TTqz;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748843127; x=1749447927; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3wgaVQM5JOk0cE5WtY1vo4wuuhYf0EVx9YzGQ7j6Rv0=;
        b=vCg3TTqzOBoNfgYzrbjwFnf0ovizEvftdAZnyjSTFasbPzOT6PyRzw4u5uI2a1BsEr
         /PkeLgCCgtl3Cavee4EX4mwsIgcDQsWxxuh+bsiClGGKNwZyLl3kRitLXcsRtQ9DPHUw
         VqK0B9tS2Zmuo1YPuAUuE1NxZtNCV+B6sXpERi49wtSWWD2TbrYA20stQ3UAfIcpfsDb
         IJZ/FUbwfPPB2mfkkLKH2fAI/FYgA2yx3sxSfRSGPvcYSf3zvqg4fyMO00qHcFc9dnAg
         +anYmQZfhSW99aDgZgC9p2YvCJ1eTQvenin4ooIej1iZQ4ORhqSIpfA84Ao426DIw3w6
         RJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748843127; x=1749447927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3wgaVQM5JOk0cE5WtY1vo4wuuhYf0EVx9YzGQ7j6Rv0=;
        b=MgXx5HAZBHZwThCVm07rHITBgfSAe8+cTZTnxyIbzNFQObLfNOK43VVRy3On1diTgC
         EE/wxLXrUm9OWpPS/OabfPxpUYhHEH/1sVo3/FjsWoylM3+iL5nkhhAsBc8WYHD5UkAQ
         eh3kxGqP1QnIMPh2hWSoQeVYAtKouf+GlcLW9WS97L19tVFTvgkZKuAaMKPehfyFa1uR
         vkbYZFrOO4+jMhi8dP5D1WURHHe23qVgU6OGogR0oS4U9eQ7N/11Kmxq2077NDnBaDDO
         U3EHU8ABtC9IFTDAk6JS0VLMU1sXEeZN/VsPSxblWjpQTadIz2ExW8YB1So0k90xdl1U
         X8pg==
X-Forwarded-Encrypted: i=1; AJvYcCWFuZ+5JuNeqTrLoZ0NAYBjqbvNQWHYuBRrB7SG6kdyRXjxAnM3LnVqZASM492O1CQ6D3EVjjo811Yn/Q==@linaro.org
X-Gm-Message-State: AOJu0Yzplwq+QvUdlPzfbdMKo4wZCXSetiSysK5ufNqzD0lI+OooH8JY
	czHdBHV4pY80U+Zy7h2lop/arynTH0clBM5fk7NGldvfRq7ZZ9KI+ZTeI8u++8F3pjhVTQ==
X-Gm-Gg: ASbGncsxT45joV9i5UbXBjCF22IlEzOr+b5c4+vRIqTAcrORKrNj9hOmN2EVr5nKAUE
	u9a52piqiZ8DZD3trlbQtbhok+wPvl4/YvOU+AttFVHFgD4Ccaz1zGA4rEu0DLV8QdYX6lenIBb
	HDDPSIdixIkgnxSBmweM3VGSfy37iR/rcVavAzRCRE5BnwTbJ8PmNYcVHo5PFBR4ht/Rh5GCuhT
	1Z1dgRkaceJ0I56reLlwOXku4HmhOqdSCwEmPZ4wbeHuVsmzkAEbnM8qA4T+es001NRUe9S7Bqf
	Mj8aElX1yuogMgW0EgQgeZ1Q7/aC3WEP2pdLdoKOZ+p/u7ENcpIQX+UPqGAB3sXOipBYvlLYg+I
	m
X-Google-Smtp-Source: AGHT+IEASqpdTxOXJHi/lxrbmZNTmg4f48ukCWyjorVuYf6dP4OlwoTInpTE4NLeSSvEATcoqYOhzw==
X-Received: by 2002:a05:6122:1da7:b0:530:7e05:3836 with SMTP id 71dfb90a1353d-5309378fc36mr4325068e0c.9.1748843126707;
        Sun, 01 Jun 2025 22:45:26 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([179.180.194.137])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53074aaf305sm6961786e0c.4.2025.06.01.22.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 22:45:25 -0700 (PDT)
Message-ID: <0dc27145-d748-44c2-b6a8-19df16254882@linaro.org>
Date: Mon, 2 Jun 2025 02:45:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/25] tests/qtest/bios-tables-test: Prepare for
 changes in the DSDT table
To: Igor Mammedov <imammedo@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, pbonzini@redhat.com, Jonathan.Cameron@huawei.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20250527074224.1197793-1-eric.auger@redhat.com>
 <20250527074224.1197793-9-eric.auger@redhat.com>
 <20250527143816.39c0dfab@imammedo.users.ipa.redhat.com>
 <20250527150357.03bfab2c@imammedo.users.ipa.redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250527150357.03bfab2c@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 0VblyqinbXIF

Hi Igor and Eric,

On 5/27/25 10:03, Igor Mammedov wrote:
> On Tue, 27 May 2025 14:38:16 +0200
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
>> On Tue, 27 May 2025 09:40:10 +0200
>> Eric Auger <eric.auger@redhat.com> wrote:
>>
>>> From: Gustavo Romero <gustavo.romero@linaro.org>
>>>
>>> This commit adds DSDT blobs to the whilelist in the prospect to
>>> allow changes in the GPEX _OSC method.
>>>
>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> I take it back,
> 
> test with x86 enabled breaks on microvm,
> so it's missing some DSTDs here

It's fixed in the series I've just posted in 24/25 as we discuss it. Thanks.


Cheers,
Gustavo

> 
>>
>>> ---
>>>   tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>>> index dfb8523c8b..abe00ad4ee 100644
>>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>>> @@ -1 +1,6 @@
>>>   /* List of comma-separated changed AML files to ignore */
>>> +"tests/data/acpi/aarch64/virt/DSDT",
>>> +"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
>>> +"tests/data/acpi/aarch64/virt/DSDT.memhp",
>>> +"tests/data/acpi/aarch64/virt/DSDT.pxb",
>>> +"tests/data/acpi/aarch64/virt/DSDT.topology",
>>
> 
