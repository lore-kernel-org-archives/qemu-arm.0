Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1543572njb;
        Thu, 6 Feb 2025 05:44:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX4fT3FfNRjSgPG+eT9nCiAomal5Ovcrz5uYnTcz2unC8iPyAy5zG21UwsBrqpPQYPQ+rAYh322u3hbjg==@linaro.org
X-Google-Smtp-Source: AGHT+IFdIUxyiRL/8UIQlsCLGZ3xQeHHPr+2OuEZ+byjTDdzPquqPRRSAozmiPnYJVkulgt76FFQ
X-Received: by 2002:a05:620a:1911:b0:7b6:d631:2669 with SMTP id af79cd13be357-7c039fcf7d4mr1034654785a.21.1738849475166;
        Thu, 06 Feb 2025 05:44:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738849475; cv=none;
        d=google.com; s=arc-20240605;
        b=FkOHBvrnLh06oSx7eLoroyKbp/nhNHpzremerLfPY/7dqJnsQoq2OX1vGbMRZO41sb
         8hABuVBgmqSPAr6cNsxZSYuT1Xv5cQODwXKxkln0MRyQULkpgHchV/owKHro//2uDJ/E
         sJOyh2xz4rXPqg4huSu5FITHUfOxYESoJkeSRIs4A7rT1R7+TY8apnTS2oh3k0FCPVyY
         8GV/M9UyYdHxsjeVPu/t28ngkNJgbXQMNYrqAALu3Xrja7E154+hnBx9U+Sdm/04hol/
         HfoRPzxvGWI8DftE0lzvYmAxFHQW56Bl9eHsLy+n4X3QC+ZUvEHu7VAEFlsDXWRmDWRF
         Y8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=ImrvNuLWGQXCZ9qln5o6nU+5vr05Km9wH+6P3lO9x+s=;
        fh=VzGyYLnZvIIgkvySCxecH+bM5gOMddDzteAP3Pkf5A8=;
        b=YGPzZO0A5+/kFrCkLC0B+JPsT6IfcOqctAEtoTE+pHi9gyMFBsR8uALjj5/3sKErB+
         5cVVEv7ky+2dQJbvijS3YbMU8MSnQqcZAv7QM1H0roPCSaY3sAezJ7aAyoG07kGCe6pF
         fTPlHMBEtwbfxe/bv9Sob8yt9ZUbF/ipwp35+UDqDYtIK5qOHsJ5pAc2Q2MlJu4aHfUB
         exd7d/x6rYyH4QvXTKgqM6G4IZp+ykNHPKlf+6POQJFzZQ5w9NkSAngsT2bob1rFB8Ea
         LvrYWCLRQksSDVAanTB9PHZcNAXeA76CxZ0Mraq5hY7rSIKekkKdirOKgVFa2onFLj5q
         ItJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041ee69d7si112792585a.652.2025.02.06.05.44.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 05:44:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg2At-0003V5-BP; Thu, 06 Feb 2025 08:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1tg2Ar-0003UI-PH; Thu, 06 Feb 2025 08:44:09 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1tg2Ap-0002mJ-TF; Thu, 06 Feb 2025 08:44:09 -0500
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4703B4E6005;
 Thu, 06 Feb 2025 14:44:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id Gyvkn7PVVDPW; Thu,  6 Feb 2025 14:44:02 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 501124E6000; Thu, 06 Feb 2025 14:44:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4B6EA74577C;
 Thu, 06 Feb 2025 14:44:02 +0100 (CET)
Date: Thu, 6 Feb 2025 14:44:02 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org, 
 =?ISO-8859-15?Q?Daniel_P=2EBerrang=E9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v2 4/8] hw/boards: Remove all invalid uses of
 auto_create_sdcard=true
In-Reply-To: <7b3a7826-f24b-4e72-acbc-297f25d0d4dd@linaro.org>
Message-ID: <c10b511b-3195-2698-f41b-e203af71b051@eik.bme.hu>
References: <20250204180746.58357-1-philmd@linaro.org>
 <20250204180746.58357-5-philmd@linaro.org> <87a5b07u1d.fsf@pond.sub.org>
 <34235ce5-9f6c-4968-a8c1-ab868389e9cf@linaro.org>
 <65a115a0-a2be-1c5f-f11a-e8b5f89c3ce4@eik.bme.hu>
 <7b3a7826-f24b-4e72-acbc-297f25d0d4dd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1525165154-1738849442=:22970"
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: fP2A4Hjr8ZEi

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1525165154-1738849442=:22970
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 6 Feb 2025, Philippe Mathieu-Daudé wrote:
> On 6/2/25 13:56, BALATON Zoltan wrote:
>> On Thu, 6 Feb 2025, Philippe Mathieu-Daudé wrote:
>>> On 5/2/25 08:03, Markus Armbruster wrote:
>>>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>>> 
>>>>> MachineClass::auto_create_sdcard is only useful to automatically
>>>>> create a SD card, attach a IF_SD block drive to it and plug the
>>>>> card onto a SD bus. Only the ARM and RISCV targets use such
>>>>> feature:
>>>>> 
>>>>>   $ git grep -wl IF_SD hw | cut -d/ -f-2 | sort -u
>>>>>   hw/arm
>>>>>   hw/riscv
>>>>>   $
>>>>> 
>>>>> Remove all other uses.
>>>>> 
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> 
>>>> Impact?
>>>> 
>>>> As far as I can tell, this stops creation of the if=sd default drive
>>>> these machines don't actually use.  Correct?
>>>> 
>>> 
>>> Yes, since these machines don't expose a SD-bus, the drive can
>>> not be attached and always triggers the same error:
>>> 
>>> $ qemu-system-hppa -sd /bin/sh
>>> qemu-system-hppa: -sd /bin/sh: machine type does not support 
>>> if=sd,bus=0,unit=0
>> 
>> And how is this error improved after this series? This seems to be a 
>> meaningful error already.
>> 
>> In any case, if you plan to merge this, could you please cut down on adding 
>> nonsense defaults to every machine that are then removed again? Maybe only 
>> confine it to hw/arm where most of the machines are, for the rest you can 
>> point to an earlier version of the series in the cover letter to show how 
>> did you end up with the list of the machines to help review but the final 
>> version merged in master maybe does not have to have all the temporary 
>> changes to avoid excessive churn. Or was that the plan already?
>
> No, I plan to merge v4 as is. If you disagree, feel free to post a v5;

If nobody else minds the churn this causes I'm not opposed to it but I 
don't see the value of commiting things that the next patch removes. It's 
OK to have this in a series for review to show the process but for final 
only doing this in the hw/arm branch where it matters (or just squash the 
in-between temporary patches to only have the real change) in the final 
version would make less churn on master.

> I won't object to it, I simply spent a huge amount of time to remove
> this dumb field, and there are still 6 other fields to do:

I understand you don't want to spend much more time on this but squashing 
patches is also not much work.

Regards,
BALATON Zoltan

>    unsigned int no_serial:1,
>        no_parallel:1,
>        no_floppy:1,
>        no_cdrom:1,
>        no_sdcard:1,
>        pci_allow_0_address:1,
>        legacy_fw_cfg_order:1;
>
> Regards,
>
> Phil.
>
>
--3866299591-1525165154-1738849442=:22970--
