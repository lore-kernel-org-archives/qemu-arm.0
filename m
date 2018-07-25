Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp549419wru;
        Wed, 25 Jul 2018 03:47:00 -0700 (PDT)
X-Received: by 2002:a6b:9145:: with SMTP id t66-v6mr17026477iod.59.1532515620780;
        Wed, 25 Jul 2018 03:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532515620; cv=none;
        d=google.com; s=arc-20160816;
        b=hX1sqU6joBRpE6KS3HX4cRxS851mAiGaDEnxaJNEzlyB1yDr97GeSbkdghyNy8tEtK
         lMKax+PiIDF/AuNgoMYOS/gk6MdA6YDZcmTtEQDUSCPBQEKADaknPSTbv26IRwV3P+L0
         9L1phOw9VuvzLAMD4SckWr/G7veMDZ4XRQJUOgy1FLsOr3un3XfZYcl3HXAzr0ykmYoM
         ewL7FZpnH87ocd7YIGIzSw9o6eJDkeMIAQeCRKgbY41phk1hKEyWZZHWR5zVP0oBNdBs
         EJamc1WH1ky9gJk3WXmootHRjce5560fUMtj+EJhshbbEG6tjC1/wTSUDhqmKJQyg9aD
         Tskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=vbAfjOJtHr5c0lwRnEKV9D9DMjxEhUjckZBUzbO2mDE=;
        b=PNHIeDrwQqX9WlGdpR+ff/HFT9969ftcxn6wGSW3ejY5wTg5g48fkqbm8VLqUdmujk
         MmDiMmQjXV9RX7ipn/bPhePjr+arBbzG4fyqCkGQ21F3lmIELWlBLz412F1Dl71uC+oa
         usG8ra9tnR4xhqDzX9/jVZWr/zYlASKfzIfat7uaEMSVAXVfe6fIshSBWFQGmU8iAGZN
         IMTkJa2rA8Tn/mepUfpOYbRtyehJMnlUxcg5B3+qXUWMTmhRyux5lioCyjmvksV3iGKU
         J7zQ8MwbQLL190aV39JP1bJHIHOO3hjamz5pU1NUqeQHlqBDL6fxj+XkZ4oz3T+hUO37
         QFuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MNlW8B4o;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w6-v6sor1254549itf.124.2018.07.25.03.47.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 03:47:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MNlW8B4o;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=vbAfjOJtHr5c0lwRnEKV9D9DMjxEhUjckZBUzbO2mDE=;
        b=MNlW8B4oJBbYr090lAof21Zt8a1fl3jqlGX3D3XdDq6+OjyxPdO7yKSVTFDsWglaf4
         DsxLZAa5LS4CVLEr+TNtitlKdznDuw2rtEQF6oyVHPtQsOXwlU7l3/VgOrySOUB2wg7M
         SmGKTSKx2jJCKKoCJ4NsyRpSTM2PtThu+Ty4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=vbAfjOJtHr5c0lwRnEKV9D9DMjxEhUjckZBUzbO2mDE=;
        b=X+4pIh4BX3D2iNjpVVnJ6A+PDJWRDFzS5G+GhW47sxK4PG3FPmTLQFWlIdijMH31M+
         Up1DWOXJCwTF5CA93v67O3bBhLR2dJzluc8ul3JtqZHgWZk5zeEKRsHkiSDvslpcbhIE
         sn7p0TJObQLrVBDvs/XBAkTDo+Zx1bf7heJfBVBdcnmZMOMa9TCHtLwvDrfGDi+8dcUW
         QCN9TTDnfMORF6fU3FVLfVSTjKuGZpM4rr7pPm5xSFnlkk+dkxoJcJ+Yx+ikxSk7COWU
         ldkQ7GWeFuyTROlnMZfXQDneEnY+g6+gc9j0d0O6lZFQOsOio14BC18Emcc3Qch61ZQz
         PI4Q==
X-Gm-Message-State: AOUpUlHrVmOu5VUqV5ye7BJLXdCMLCdZJlevgdlrwgfbMziZ7ZVAeDPh
	DbLBLQCR5JIdZ1J7L541/nYVSzaONppsLvZ966/ZcK41
X-Google-Smtp-Source: AAOMgpevSoLcXBXa0lX95wEnQouFm/oWVju9pHiZMbnMhzXuHIPs11XrKXK7k5RlBBzI/5BIvhhvp3jV4MoIQir4Q48=
X-Received: by 2002:a24:a005:: with SMTP id o5-v6mr5765630ite.124.1532515620481;
 Wed, 25 Jul 2018 03:47:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 03:46:59
 -0700 (PDT)
In-Reply-To: <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org> <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 25 Jul 2018 18:46:59 +0800
Message-ID: <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: R10pfzkxVbtU

On 25 July 2018 at 17:54, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>> For the Aarch64, there is one machine 'virt', it is primarily meant to
>> run on KVM and execute virtualization workloads, but we need an
>> environment as faithful as possible to physical hardware, for supporting
>> firmware and OS development for pysical Aarch64 machines.
>>
>> This patch introduces new machine type 'Enterprise' with main features:
>>  - Based on 'virt' machine type.
>>  - Re-designed memory map.
>>  - EL2 and EL3 are enabled by default.
>>  - GIC version 3 by default.
>>  - AHCI controller attached to system bus, and then CDROM and hard disc
>>    can be added to it.
>>  - EHCI controller attached to system bus, with USB mouse and key board
>>    installed by default.
>>  - E1000E ethernet card on PCIE bus.
>>  - VGA display adaptor on PCIE bus.
>>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>>  - No virtio functions enabled, since this is to emulate real hardware.
>
> In the last review it was pointed out that using virtio-pci should still
> be "real" enough, so there's not much reason to avoid it. Well, unless
> there's some concern as to what drivers are available in the firmware and
> guest kernel. But that concern usually only applies to legacy firmwares
> and kernels, and therefore shouldn't apply to AArch64.
>
For Armv7, there is one typical platform 'vexpress', but for Armv8, no
such typical one, the 'virt' is typically for running workloads, one
example is using it under OpenStack.
So a 'typical' one for Armv8 is needed for firmware and OS
development, similar like 'vexpress' for Armv7.

>>  - No paravirtualized fw_cfg device either.
>>
>> Arm Trusted Firmware and UEFI porting to this are done accordingly.
>>
>
> How will UEFI get the ACPI tables from QEMU without fw-cfg? I didn't
> see any sort of reserved ROM region in the patch for them.
>
> Thanks,
> drew
