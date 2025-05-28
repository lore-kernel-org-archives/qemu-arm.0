Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp5206626njc;
        Tue, 27 May 2025 19:13:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVsHfkfLIBn0BxBc/y4yl2zbtJeSEYmSyVpYsAuHmsKmUUe+IK3HFg30AWJy0ncGfTbtC0w76KQhz9uQ==@linaro.org
X-Received: by 2002:a05:6122:1d9e:b0:52a:79fd:d05e with SMTP id 71dfb90a1353d-52f2c4a8cd0mr13166563e0c.2.1748398426067;
        Tue, 27 May 2025 19:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748398426; cv=none;
        d=google.com; s=arc-20240605;
        b=VkmnV/agCQRp0Zwhnk7bss1KgS1oIpEtpnGVLH+0IABuA/ByLANw8954micUen5z0B
         N5HqtQYUggJ1aeFthfREhWEnJLJonUGjiP9bMdh6ku2F+fAZ9ri3lLwzmitbnS52UvPp
         Bww7Q000IwIgdhLGavcjlXebiLKiXZPcSsjkJxxxYCMjkWsJ9g5tyoK6LtFiMJuq/1Ey
         DNO+uU6VGfQyffml0I4s/EahaZyd2GLlQU6ZIwBgB+LSJAR8JPxOeP1o/li4XzvuZf6W
         RGGO5fX2VaNz8kohJGmAKAgp+mINjAfyqWyG7qW+SwemytPZmHN1aUKgQd4m9HrX3RPB
         6ypw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=z5Oxj3vlg74NXclXNNPUdD/eVWdV1JzWwV2IMntEOZo=;
        fh=p1w0Ax44zLAF0jNeuxZsHZI9zlW0WFJgC8nHQxYzaDA=;
        b=RS3lWSEdKFackr9tc593kbIRrc+Dz9AqmB+lE2BQUbdroLX620iOYWoTox2hum8qDv
         a+9WtuW1CScD6Yw6m62uLlM40DckhcX0p/ChoztLAHkICWX+pF3OpWjOJUsTQ51cDxJB
         ouLcHmmiaZ+J06tNZe6JxYTp1qiqQAGHvIKxRl0+kHDlz40ovDfHrFAsoNQqSSMI7xi0
         Oyqb4ZyM9Ypg69pVAoPA8rWFM1jQt97qIHoZs7hUgM16OF6FtttIB4Qhdqa3GNqFMKAc
         b2kqeUxNnPUcZziH4Lom4+k+NZfJ94jjhbUtc1nthXclZyRzodFgb+QejGNMVS3775E+
         DqFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qRh9Ayw2;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 71dfb90a1353d-5300878a3d6sor881557e0c.3.2025.05.27.19.13.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 May 2025 19:13:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qRh9Ayw2;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748398425; x=1749003225; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z5Oxj3vlg74NXclXNNPUdD/eVWdV1JzWwV2IMntEOZo=;
        b=qRh9Ayw2BVIuwgzzbmzUImqtoDnya8D88HZS4g1Jf2teKeFdNhCVFTVvt2vItpXpqe
         QYv7ka6EX0NPb5O9rBV5MhPDgx7vUzzYfhwvpLGtnEgiYmKeyp1+sQhqTIG77Ovq721O
         Mhd7XASc4UXX3e3oj3a9eORzEPhEwZO5MZlSCz+9ooYLOmZGJYo1P0VpPMo3CgECxpa7
         501NdrddTY3OWSbIYpgmzjzlq8lC61Z19fjIMKw70eSwwgNefQ+8bBuiRll+z2JHbaZ9
         ZHDTPjM/WgDxp7YoC2J22exuHTsU68rWxotEqG+P5oewrkl2kkVnijMEGuYqA+76HJ8Y
         zabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748398425; x=1749003225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z5Oxj3vlg74NXclXNNPUdD/eVWdV1JzWwV2IMntEOZo=;
        b=RKaAeutgSPAlH/pWjHqnHuJ1qM1V+IYvzc1ID6XyQrNVgNBLIc5DOpQbIphM7aXNDT
         OXquV0RSUqt/+wc18dyPCsmWF+FMiLbnaHEhqa8TG56w7xldS3VWC/gTu1Skrv2mAdBZ
         VHjhIA8xhQjhjUF3Rj1CTK/VQZZe4Km7Gtr9eUVYuXRssQUi1DHA44JkF1wOEnrOO5Dg
         B3N4IZ2qBnMFaDO9JsqWAS+PUwfitAArQuOXqkY2BA6r2g+GtviSMeq3fR66H2oZcUOs
         TOuFUxyI3Rs5lZCOMamHU1jz+xGoJodUqR4ILmNihHgy3H61d27JFTRPK5Uwa5paoCA7
         dE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZOWQcBfzNhD5uzS3ierci42+eyxjLoC2eOsvGmjELUcJqyZpn6M1WtvS67qrAkhaIPv/8kd0qK0mCzg==@linaro.org
X-Gm-Message-State: AOJu0YwQeZveGGb638FbyOhZFzLnHvsmudCf3H2mYYMrdgduE1t6VHF4
	VQ7DB7xEQBSovFLlrO1s7v2NgepPcVwSmZyM/afXI76tTp4BexuV80edZC/5EYBeAuha7sahI90
	X7jTN3Mk=
X-Gm-Gg: ASbGncsPwfaKMAxDzkk3VO/m/DAIGmsAq6r4j+gbea2X1gGCzjeqjBzFKs+7W9DOSLy
	Z83YUON27QFzGXJ6z6dlrnWoC8TGghO44yFTEEIFUknT0OBTmW7+BXW08qVCeKUQ4B+ZpzulMo2
	09ZNFu565Xs4EEmZDMSmDr8EbrPT+fOL2KZa4L3NQiSBS075AtrroXAVmanYqKKgzZBiopmnRlQ
	rzG4QWuxWcUngdKm0DwrB+nT7BFyb274ztQCqWvlO13wn9Ni3PZ2+zgW+CaAdbzgaeZnNOYAWcN
	Ewr2xa0eDazywrv+r7hg99zxl3KkstouIultJGgE+U6GoHdEA8Y5jb4cuI2lFXHvmkiHSIkfB8V
	+sPexQoGrB4D+U+mlPUZNhs5IqSsAY+XH6QCwYYb0
X-Google-Smtp-Source: AGHT+IEXHC8zBStbvtUE7ChtTV9sGiqjBzk5X3C7KCIDaeDqq9XlWqKgGunnJkKSnBBmGl8puAhspg==
X-Received: by 2002:a05:6122:1d9e:b0:52a:79fd:d05e with SMTP id 71dfb90a1353d-52f2c4a8cd0mr13166552e0c.2.1748398425584;
        Tue, 27 May 2025 19:13:45 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from ?IPV6:2804:7f0:b402:6ba2:2066:dacd:9134:8586? ([2804:7f0:b402:6ba2:2066:dacd:9134:8586])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53066944109sm177520e0c.32.2025.05.27.19.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 19:13:45 -0700 (PDT)
Message-ID: <67a82638-b4b7-43e3-8108-42f1a18a0162@linaro.org>
Date: Tue, 27 May 2025 23:13:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/functional/test_aarch64_hotplug_pci: Add test
 for ACPI PCI hotplug
To: qemu-devel@nongnu.org, eric.auger@redhat.com
Cc: qemu-arm@nongnu.org, thuth@redhat.com, alex.bennee@linaro.org
References: <20250527150229.1617074-1-gustavo.romero@linaro.org>
 <20250527150229.1617074-3-gustavo.romero@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250527150229.1617074-3-gustavo.romero@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 1rTWWjLEqCyP



On 5/27/25 12:02, Gustavo Romero wrote:
> Currently, test_aarch64_hotplug_pci only tests PCI hotplug using the
> native PCI hotplug mechanism. Now that aarch64 supports PCI hotplug via
> the ACPI mechanism it's time to support it in the test as well.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>   tests/functional/test_aarch64_hotplug_pci.py | 24 +++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functional/test_aarch64_hotplug_pci.py
> index bb2c121503..862bb6746b 100755
> --- a/tests/functional/test_aarch64_hotplug_pci.py
> +++ b/tests/functional/test_aarch64_hotplug_pci.py
> @@ -27,11 +27,26 @@ class HotplugPCI(LinuxKernelTest):
>            'current/images/netboot/debian-installer/arm64/initrd.gz'),
>           '9f817f76951f3237bca8216bee35267bfb826815687f4b2fcdd5e6c2a917790c')
>   
> -    def test_hotplug_pci(self):
> +    def run_vm_and_test_hotplug_pci(self, use_acpi_pci_hotplug=False):
> +        """
> +        Run an aarch64 VM and test the PCI hotplug mechanism by plugging and
> +        unplugging a PCI network adapter to the VM. Proper plug and unplug of
> +        the adapter is verified by checking if the network device is correctly
> +        added and removed in Linux.
> +
> +        Parameters
> +        ----------
> +        use_acpi_pci_hotplug : bool
> +            If true the ACPI PCI hotplug mechanim is used, otherwise the
> +            Native PCIe Hotplug mechanism is used.
> +        """
> +
> +        acpi_pci_hotplug = "on" if use_acpi_pci_hotplug else "off"
>   
>           self.set_machine('virt')
>           self.vm.add_args('-m', '512M')
>           self.vm.add_args('-cpu', 'cortex-a57')
> +        self.vm.add_args('-machine', f"acpi-pcihp={acpi_pci_hotplug}")
>           self.vm.add_args('-append',
>                            'console=ttyAMA0,115200 init=/bin/sh')
>           self.vm.add_args('-device',
> @@ -70,5 +85,12 @@ def test_hotplug_pci(self):
>                                             'ls -l /sys/class/net | wc -l',
>                                             '2')
>   
> +    def test_native_pci_hotplug(self):
> +        self.run_vm_and_test_hotplug_pci(use_acpi_pci_hotplug=False)
> +
> +    def test_acpi_pci_hotplug(self):
> +        self.run_vm_and_test_hotplug_pci(use_acpi_pci_hotplug=True)
> +
> +
>   if __name__ == '__main__':
>       LinuxKernelTest.main()

Re-posted here as a single patch:

https://lists.nongnu.org/archive/html/qemu-devel/2025-05/msg06332.html

I missed the Based-on: 20250527074224.1197793-1-eric.auger@redhat.com tag :-/


Cheers,
Gustavo
