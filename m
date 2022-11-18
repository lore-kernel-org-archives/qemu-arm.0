Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp47710ejx;
        Fri, 18 Nov 2022 00:04:51 -0800 (PST)
X-Received: by 2002:a5d:4c4a:0:b0:236:6101:7b7d with SMTP id n10-20020a5d4c4a000000b0023661017b7dmr3472782wrt.484.1668758690941;
        Fri, 18 Nov 2022 00:04:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668758690; cv=none;
        d=google.com; s=arc-20160816;
        b=ZS8VDjNDeCptQVLX2qk81BWkspa9z4Gj9JTRNvb1l/Nti7+b1kkinJMMOXqTcltmvT
         vTGa1nQlSFwt8eiMaKgFN2fgQqR6jXB12u3D9Pby9FfyArHH8dOS9jvUy6Ykd4LmpD4R
         BkobIV/rXq4qLebcOJW9GKlLEt30cIVdQOnqx3LZHdY2B/tnZGj4f+oof+W45RjbMjkK
         itdUQT+Guo5R6ujmgO4+pW2hv7sEL/is1vtBwuyveky6yFAMG4D8O7/T+8y/LvVinfIh
         b/fPq2cl/OewcFbKOBOLDjMyd9SS6bzJp/WCzAyPy5WbMiQP21duGqoDJAs1eQnxqdXt
         3UWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IpX/ID5wjYZEraq2OpDMEh+qOqjGaXzhHouNsF/6wvY=;
        b=BPhu8pXxX9ZN+CysAhiZzFk8lf9DTO4x8didditv6NRJu7IX39DmYvpBrktJ3bD9ml
         29xPeg6FnigKp1abYA2NC1xiTr27wR7EWf/NdnjW8nswYtLVFlb95lw9aCtBw7dsYPRH
         M4O79zU0F92EtzaK97jySkxh9vJ8GdHcnswUJHQebIWByveAC5IIjY9lKb1ik2nJvRkh
         UloVT8D1qivKDvNrPr/J8hzlUnlZoKhwurQ7daPQN2miD+dYeQBf/xBO3xx1wNhiMPi+
         5eVorzw4hTHKqh59/TaTw/UkDSBReYDQ4nYrOMeDn7wqsm+1AKR5mlPtm8K5mj0VtIHZ
         JKAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x8H6VD5d;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t10-20020adfba4a000000b0022ee5b30eccsor1794295wrg.79.2022.11.18.00.04.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 18 Nov 2022 00:04:50 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x8H6VD5d;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IpX/ID5wjYZEraq2OpDMEh+qOqjGaXzhHouNsF/6wvY=;
        b=x8H6VD5dp+yc4PWRwQPIKsKV4vN7bz71bN/WBtPoOkT2xrFNeC7Q/HYcQRMm7UnNXX
         tR3E+Ti3Vq2+5/qfktrkteYLp3Pqg2nX/TEIrkTcxak31zq+LWY5XNexNdEoVMWjZx5R
         I4K+tbRx1/RY6m3HZ+HA3EyqCUFXnY/T/Gs9ZyMCKupDZbDD/Z7wGxd1fO/m7njPKMqb
         y0ezkz2OJxSWshAT8WW+syjJeWE36YPit8tqbyZd+633flDfB6yvBaawlPvnWwv55zDJ
         vXJ3Ni1driek196MM6kb7IrOgX46GdCBRVmMPG+Qp3y/tU0XftPuxVwBEsSir6e9OiYz
         19Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IpX/ID5wjYZEraq2OpDMEh+qOqjGaXzhHouNsF/6wvY=;
        b=u050lGeGwEm09hNgg/ll/U8zBIYK+i6Dl3ADO2BDSP+/szGHRgsicK/vTTqVxjtBJP
         comkvPKcMx03mOXtVMSJgrGFZvlmOMo9oNHDrtXXo69AehTdQTc+gN7ET8H2klZ3Xi66
         rPgnSXnmTovoGC2juXyYKZv3yLAzhws1GdP7wlbdhO57wwGl4aTJCy5UOj2/yVL4A+QD
         82NbNQPeNTgKc29Wey0PwkRjg12tTnXJNfTS5uBRLzY/vNGksvtNaUo0I3NU2MSdw2j2
         ZDy2pr67w0l+eeKp8yGBcGDh3mO/cQaZYfi0ob9DqQpb4JJbd5dCXeoRW7162U5OEgM/
         Pg7Q==
X-Gm-Message-State: ANoB5pmN0Rry6lXPAckAnIwNbbNMEC3mfd/vIU6gR6XJfLASOKEfM7IP
	6tht/5BJ0YLRMlwCMuKg2atRcYU+bWw+jZjo
X-Google-Smtp-Source: AA0mqf5m2tcqVtJpKMXuYzW+Mw4wo4l/+n9mTSXTf5E1RV8St/UcdI0maNBn7I506Higco5B/npMAw==
X-Received: by 2002:a05:6000:983:b0:236:aacc:ea07 with SMTP id by3-20020a056000098300b00236aaccea07mr3692007wrb.36.1668758690431;
        Fri, 18 Nov 2022 00:04:50 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net. [88.29.175.34])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d5005000000b002305cfb9f3dsm2857826wrt.89.2022.11.18.00.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 00:04:49 -0800 (PST)
Message-ID: <b3032db3-2b40-17ea-1b68-e331319c37ce@linaro.org>
Date: Fri, 18 Nov 2022 09:04:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 09/13] tests/avocado: introduce alpine virt test for CI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:Virt" <qemu-arm@nongnu.org>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
 <20221117172532.538149-10-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221117172532.538149-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: nv9VarTNrNRs

On 17/11/22 18:25, Alex Bennée wrote:
> The boot_linux tests download and run a full cloud image boot and
> start a full distro. While the ability to test the full boot chain is
> worthwhile it is perhaps a little too heavy weight and causes issues
> in CI. Fix this by introducing a new alpine linux ISO boot in
> machine_aarch64_virt.
> 
> This boots a fully loaded -cpu max with all the bells and whistles in
> 31s on my machine. A full debug build takes around 180s on my machine
> so we set a more generous timeout to cover that.
> 
> We don't add a test for lesser GIC versions although there is some
> coverage for that already in the boot_xen.py tests. If we want to
> introduce more comprehensive testing we can do it with a custom kernel
> and initrd rather than a full distro boot.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v1
>    - use "virt" image instead (even faster)
>    - don't drop boot_linux (it is now disabled for CI)
>    - re-phrase commit message
>    - add alpine to the test name
> ---
>   tests/avocado/machine_aarch64_virt.py | 46 ++++++++++++++++++++++++++-
>   1 file changed, 45 insertions(+), 1 deletion(-)


> +    # This tests the whole boot chain from EFI to Userspace
> +    # We only boot a whole OS for the current top level CPU and GIC
> +    # Other test profiles should use more minimal boots
> +    def test_alpine_virt_tcg_gic_max(self):
> +        """
> +        :avocado: tags=arch:aarch64
> +        :avocado: tags=machine:virt
> +        :avocado: tags=accel:tcg
> +        """
> +        iso_url = ('https://dl-cdn.alpinelinux.org/'
> +                   'alpine/v3.16/releases/aarch64/'
> +                   'alpine-virt-3.16.3-aarch64.iso')
> +
> +        # Alpine use sha256 so I recalculated this myself
> +        iso_sha1 = '0683bc089486d55c91bf6607d5ecb93925769bc0'
> +        iso_path = self.fetch_asset(iso_url, asset_hash=iso_sha1)
> +
> +        self.vm.set_console()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=ttyAMA0')
> +        self.require_accelerator("tcg")
> +
> +        self.vm.add_args("-accel", "tcg")
> +        self.vm.add_args("-cpu", "max,pauth-impdef=on")
> +        self.vm.add_args("-machine",
> +                         "virt,acpi=on,"
> +                         "virtualization=on,"
> +                         "mte=on,"
> +                         "gic-version=max,iommu=smmuv3")
> +        self.vm.add_args("-smp", "2", "-m", "1024")
> +        self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
> +                                               'edk2-aarch64-code.fd'))

I am not sure about restricting to BUILD_DIR, I'd rather use an
externally prebuilt image, i.e.:
https://snapshots.linaro.org/components/kernel/leg-virt-tianocore-edk2-upstream/4710/QEMU-AARCH64/RELEASE_GCC5/

(I'd like to use these Avocado tests with a distrib provided QEMU
binary).

Anyhow can be fixed later, so:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
