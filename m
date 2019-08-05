Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4020523wrv;
        Mon, 5 Aug 2019 07:00:28 -0700 (PDT)
X-Received: by 2002:a17:90a:3548:: with SMTP id q66mr18505495pjb.17.1565013628852;
        Mon, 05 Aug 2019 07:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565013628; cv=none;
        d=google.com; s=arc-20160816;
        b=jKw16nSjN2gch1tgfNwweC1w4n0BCHuQquBwCsuAImakbKRCCCkHYgtpvWOjzsRsAo
         HaDFntfaZEHG65Vbvgj4g7nUgS7QoRFMDQvJW1NCZ4pmRSSoF4Odb+Vr8RbhLeScDfi+
         O2qM+yRdHNSCVh+NEikzmXsCB06pF9cWN+3V+aPwo3yhSHr7dDWGw4gdEK44QisQLFBe
         PmLkkwRKSpsStnxgan5Jvrw+V7XSxBhGKFgrKFzpxh1C+9nHADZIWnw2KPpNEk9kfuqg
         Zvng2WI743Vggnq4aRNR/P3YU33x9SRR4IisEeuHFq7/sbykL3kdMxCE+PV/cuEn9OQl
         zx1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=/wy4ViPRWDvx0bz3Qem2DWS/A61LNcdI96nSPoQZO7Q=;
        b=TlvZOCgk9CIdU1ssgCFHkmCPom2890hEw4RDfSHk+LrPeeKlbgB89HrRy05tzin371
         NvstdhR2zxAXs8Qk5kUPuhK0ihF3joprx4aEi6EXo+2AtPD3oWtZx4L4QBjtjNzgPpfO
         5H8E9ZHHWPmlRpVlBnYyftQhDnFgHsGHI767NujiQZmdQWpNKP58u9XqsbRs1AuY+5WN
         U4pDQzi/kzbSIs/keU0qW3K3cMv529nq0FjMrUS8kTUDL2MlG0uCH68uWWX8C2nBbyWB
         Jn/T9CEniA5xjQLc6T6vup+h0iwHA0juAGLntWiyan73y6QowzmFxrcHQ8L04m6Y02OK
         5hmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OqrcPzxP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f41sor20816268pjg.15.2019.08.05.07.00.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2019 07:00:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OqrcPzxP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/wy4ViPRWDvx0bz3Qem2DWS/A61LNcdI96nSPoQZO7Q=;
        b=OqrcPzxPBU4o/ROYAzmcRiDWfCh0y6Jo8frZ3nHTDvjwxMLuC3AYHjMHkDeeh7w48h
         0uaLwkLECFspyC6JpWkOPYScr6o7LvM0d7+gPmJ5XUByRoDCHI495emwq412iLJD3XTv
         KhESveGD0roWLaQt7DS6HHLTmPnRXYbTV6LF6+a6CLlrx1gJy5D9W+mPPuUa3FrQn9Ct
         YpGrEFoJTmdXc3o+J45fUKe+jHKde7AAQDNpIXdjaNLQTwwgQEvx2x6YYqmFf0TlHIEc
         fLnmGpl7LnNsReBiMi9tSpIHyEzrFxav/GmykQAOEU2YkieqpVOmSBqKzht1pZ4Xpn6w
         KRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/wy4ViPRWDvx0bz3Qem2DWS/A61LNcdI96nSPoQZO7Q=;
        b=cXK22qdwE08F2G5D00q7q+nPwdwFsQzlGCxb4yG3yTgwkmyT2esBTf+lOUZZtxL8Z9
         iGH2ecL3cwg/BxKmoljxkd+QBzFsd1XDWypunJO0A6eETi5CPQP1bcm7QH/cEKPft2z9
         UBGOd3eLWRLzaAHZGKwUlUYAaA/BOsgVwfVCU9be92jdER5rFNcT1YzJUi2TM4pyuwCR
         hUDD4yIqH1wM3brc8gr9q2J3bcIWaZf95zL+KBjqlDo3IKbGXaIugiLwm/pvnR1EqJqq
         PEE6dWLeSLGa+6DLvpeK/b5su/5mHl/UEu2aZZ1RUstGADQErx1e63WO8evT0Rv6muw/
         ktSQ==
X-Gm-Message-State: APjAAAUppcTYCUhxG9LXZLpZ+ajVHDKm72t+qlY/oisePpuSMSC2Usek
	M9/jpnwjIXYMXoB8UWsNc0bBbJ1guGbggQ==
X-Google-Smtp-Source: APXvYqzS2SXsW/nAT0UTDFb8y5gV5wxcDbQ5Tk2+SjQ3slGFXKZIVnZ7cn2KuXG217ZJshX3eNMx7w==
X-Received: by 2002:a17:90a:7f85:: with SMTP id m5mr18234603pjl.78.1565013628309;
        Mon, 05 Aug 2019 07:00:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id p20sm108180589pgi.81.2019.08.05.07.00.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 07:00:27 -0700 (PDT)
Subject: Re: [PATCH v3 00/34] target/arm: Implement ARMv8.1-VHE
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20190803184800.8221-1-richard.henderson@linaro.org>
 <8736ifkbod.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <db7e63d9-fcf6-fda2-c164-af8f90815617@linaro.org>
Date: Mon, 5 Aug 2019 07:00:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8736ifkbod.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: r7dH/4FiNIKL

On 8/5/19 6:02 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> About half of this patch set is cleanup of the qemu tlb handling
>> leading up to the actual implementation of VHE, and the biggest
>> piece of that: The EL2&0 translation regime.
>>
>> Changes since v2:
>>   * arm_mmu_idx was incomplete; test TGE+E2H not just E2H.
>>   * arm_sctlr was incomplete; now uses arm_mmu_idx to avoid
>>     duplication of tests.
>>   * Update aa64_zva_access and ctr_el0_access for EL2.
>>
>> Changes since v1:
>>   * Merge feedback from AJB.
>>   * Split out 7 renaming patches from "Reorganize ARMMMUIdx".
>>   * Alex's MIDR patch keeps the nested KVM from spitting warnings.
>>
>> I have tested
>>
>>   qemu-system-aarch64 -accel kvm -cpu host -M virt,gic-version-host \
>>     -m 512 -bios /usr/share/edk2/aarch64/QEMU_EFI.fd -nographic
> 
> So testing with a host doing:
> 
>   ./aarch64-softmmu/qemu-system-aarch64 -machine type=virt,virtualization=on -cpu cortex-a57 -serial mon:stdio -nic user,model=virtio-net-pci,hostfwd=tcp::2222-:22 -device virtio-scsi-pci -drive file=/dev/zvol/hackpool-0/debian-buster-arm64,id=hd0,index=0,if=none,format=raw,discard=on -device scsi-hd,drive=hd0 -kernel ../linux.git/builds/arm64/arch/arm64/boot/Image -append "console=ttyAMA0 root=/dev/sda2" -display none -m 4096 -smp 8
> 
> And a guest doing:
> 
>   ./aarch64-softmmu/qemu-system-aarch64 -machine type=virt -cpu host
>   -serial mon:stdio -nic user,model=virtio-net-pci -device
>   virtio-scsi-pci -kernel /boot/vmlinuz-4.19.0-5-arm64 -append "console=ttyAMA0 panic=-1" -display none -m 256 -smp 4 --no-reboot
>   --enable-kvm
> 
> I triggered:
> 
>   ERROR:/home/alex.bennee/lsrc/qemu.git/target/arm/helper.c:3436:update_lpae_el1_asid: code should not be reached
> fish: “./aarch64-softmmu/qemu-system-a…” terminated by signal SIGABRT (Abort)

Whoops.  Rebase error while changing the signature of this function.
Thanks for re-testing the case where VHE isn't present.  :-P

> With -cpu max on the host it hangs the whole thing. I'm going to
> continue to experiment with explicit GIC versions.

Hangs the host?  Are you sure that the guest isn't just slow?
That's why I changed my testing to boot a debug edk2, which
outputs stuff much sooner than the kernel does.

Although I have no idea why the guest should be extra slow.
It does seem like it ought to be booting at the same speed as
the host.  I see tlb flushes as quite high in the profile,
and wonder if I'm doing too many of them.


r~
