Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3015224wru;
        Fri, 3 Aug 2018 02:37:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeXZJYJccXKY7EMQT5BpiLtkju7iKnLLfjaEk7lViKIaJuF3byf77t4n1X5dxQNPh1novU5
X-Received: by 2002:a0c:e9ce:: with SMTP id q14-v6mr2806270qvo.106.1533289073153;
        Fri, 03 Aug 2018 02:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533289073; cv=none;
        d=google.com; s=arc-20160816;
        b=MwiQVZLojYVZk8c09Yesk/gNv059W0dGZjOoTwoBRM5YbM0/yzx8FwPa3FUsUPSAp0
         697YWGfNX+a9/+US3GpjYEt+xSCQjQIVUhj2s7nlmcnWMhOPMc+hEwBt6nL4WmqIVEKt
         VEIM+oW8neGx5KzEiBGRWlE1u0mqYCqJ6XMCuZAFt5VD7OaEyrFIT7x5yXf4etzS6a7b
         dpsKFWf6Op4L4BVZWoniOpqosHEveGcCgd/4ZDTjgRXUXoSXttwDUqbnW58cajZR0AeM
         JQ0GkKLioaoTopgMH7QT6MykQwrrodJ6EcntL/cm1ld9ODP7Ep3zZv7Y/V3GePaiycQ+
         h1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=Agm2F5Fa3Hp02qxXDLcAgyGrkpN/XO7s8ve0ifTFbKU=;
        b=JxKFT9a1PgzARnqee9xFMop8XR5AR9NvwoyAFvJUIGpeUHr7QbkbuYFvUvjq+Nq8cb
         Wj9HF5BxA7fVBZXy1WLd9gD6U/lhAl8zzKV88lecs3/aBA4F55YpGBkFwmQt5SJg3PYu
         FVexLQDEdwAqmD5rAI593EwQ8VRnZ7Cq0GJKNM+8MjT0/slIJGVfubK2Il2dQ+96G6Vz
         pSrEe/NPazG3Q1BH+mcSNZvf1hq89sOMNgG5czGDajnmIRht+p2xrOgOk1OfRsTHOFZH
         IspAkHPpX7zaF7wJbhxFloYosIfGkm+4m65l6ac78TZjc7ii5NMyssuZLWQvJmH4kFgY
         fCzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id w43-v6si1234543qtj.171.2018.08.03.02.37.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Aug 2018 02:37:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83FDF819701E;
	Fri,  3 Aug 2018 09:37:52 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E4222026D65;
	Fri,  3 Aug 2018 09:37:50 +0000 (UTC)
Date: Fri, 3 Aug 2018 11:37:48 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	lersek@redhat.com
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180803093748.2s563javprolaqsi@kamzik.brq.redhat.com>
References: <CAKv+Gu-ffZRNmACH6YieNsg=AHxJxYoXHsBGf6C=nOvFfTu7Sg@mail.gmail.com>
 <20180726111109.w24jk6ehklimige7@kamzik.brq.redhat.com>
 <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
 <20180726114158.am7kgc3jekxg55i5@kamzik.brq.redhat.com>
 <CAFEAcA8YH4p__zT1o0s3vNZOsyWZn3XPLgkNeT+jSJpmjvFTUw@mail.gmail.com>
 <20180726123509.qyadwbz4skwashcj@kamzik.brq.redhat.com>
 <CAFEAcA-Zv5xV2VwMCfGXUv8oT+gC_dgn8Q3M1v3FBjry7TbXVA@mail.gmail.com>
 <CAHmQWvB1zgaLi++BhGEs1Emb0-5HOrzCcPrHJDoxx-8Be9df1g@mail.gmail.com>
 <CAFEAcA_mVGSicjN=wwJY8OCJ-j=DtdLjDvM9U-dC3dQ=RQQXMQ@mail.gmail.com>
 <CAKv+Gu8sCjfL=uKy4nM6pcRneUzw2YG79CuOVBH3TeNOXf689A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu8sCjfL=uKy4nM6pcRneUzw2YG79CuOVBH3TeNOXf689A@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Fri, 03 Aug 2018 09:37:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Fri, 03 Aug 2018 09:37:52 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: F47adr3OiRIO

On Fri, Aug 03, 2018 at 11:26:41AM +0200, Ard Biesheuvel wrote:
> On 3 August 2018 at 11:23, Peter Maydell <peter.maydell@linaro.org> wrote:
> > On 3 August 2018 at 10:21, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >> The 'sbsa' machine won't consume QEMU generated ACPI, so it won't
> >> touch or add new ACPI tables.
> >>
> >> UEFI relies on its ACPI to load OS, but currently it still needs DT
> >> from QEMU to pass some info, one example is CPU number.
> >>
> >> So, the 'sbsa' code implementation should be like this:
> >> A separate file, no ACPI codes, a little necessary DT codes.
> >>
> >> "Necessary DT codes" doesn't include so many peripheral devices nodes,
> >> so the code overlap with virt won't be so much (contrary to sbsa.c
> >> with all the DT codes), then no need to separate the common part to a
> >> third file, and virt.c can be untouched or only a minor change with
> >> few lines.
> >
> > Would the real hardware you are trying to be an example
> > for use DT for this? It seems a bit unlikely to me.
> >
> 
> Yes, as a matter of fact. There is work underway both on the EDK2 and
> the ARM-TF side to rely less on static descriptions, and more on DT to
> instantiate drivers and ACPI tables at runtime rather than at build
> time.

Hi Ard,

(A bit off-topic, but related to your comment above.)

I started poking at teaching ArmVirtQemu how to get the base of RAM
from the DTB, where the DTB is passed to it through x1 (QEMU needed a
few new lines to ensure x1 had it in the firmware=y,-kernel=no case
too). I have the assembler written, but I got hung up on the integration
with edk2, because I don't understand the build files well enough yet to
swap in ArmVirtPkg/PrePi/AArch64/ModuleEntryPoint.S for the ArmVirtQemu
platform. I would also need to clean up the assembler a bit before
posting. I'll be out-of-office for all next week, but if you send me
some edk2 pointers in the meantime, then I should be able to post an
RFC the following week.

Thanks,
drew
