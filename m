Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp4967799wrd;
        Wed, 5 Sep 2018 08:00:37 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZrAhdmAAn22OmbqcIptXt60w98ovFYYa12E0LKZBBkiO6G2I8umXWKMqv9zsv6+QTCW/ym
X-Received: by 2002:ac8:c0e:: with SMTP id k14-v6mr34438593qti.20.1536159637778;
        Wed, 05 Sep 2018 08:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536159637; cv=none;
        d=google.com; s=arc-20160816;
        b=ZI8KILRSrXGk9qtYVwQcRPEsTwL3YgjTbmYgcQm9Zgq2vEWbWx5bAeQLyFmSNEi89P
         wM/8Wn2uAxxXAFJK7QmyUIpIUpazodOT6IdPu28KR9pIDQ5TUcPXzyOkI9KWxfacW5pT
         xh+XvT5zKWLFedX/pEjyR1Oc1Cj8jEdu4/tm9wIFkVAg+AokPRvqa7kRdUA0G9mu7/il
         3kh3ddGN2iBJgSUG3qXm+J8T+V+JdFjr7vCOKe6VK4BtJ1TSHbboiQBIkyE615apoe8s
         A4VZMwhDIEEWduUx5NxEvWniOVPst+c9+HMUDE9v88a9hXQavArpu9gthzaWTWutZDt6
         DQqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=x94p/LTDB6kdDtK+YOxWmD88dN5RTNoFesHSN+Uazvc=;
        b=q0rWhkODl67FQLzp0OTE6chqeiY47XC6/+lAeGCfAGbo/s+NMpL8YT3ka3TsqflV0B
         9lToDS4n6RgD1YYUMQbRurMW52WQxnrXS3cW6Bk7+BVIZe99xC1MqUPP2gwzsyjV4g8P
         X8bhfkCDIEfAzwxiZmqWxokPMW8UqLaF2mJP4rvOcVv5STq8tO76F1cD9bd11aUoCOLs
         7sYF1FbQqODus9xsstSz9RQ8bobGFM3/E2vulpE5eWr9BStCpXbet9ZWTzkvoqT4PukD
         5CZw1MLDpkg02u95eyV3/5bsowNMiTNL7t2FA52pcU09z0/rlbEdTvb4dNu7ZXOEDNTT
         ny1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id i8-v6si1693218qvk.184.2018.09.05.08.00.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Sep 2018 08:00:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33F9C40201C5;
	Wed,  5 Sep 2018 15:00:37 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D26662156889;
	Wed,  5 Sep 2018 15:00:35 +0000 (UTC)
Date: Wed, 5 Sep 2018 17:00:33 +0200
From: Andrew Jones <drjones@redhat.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180905150033.ntsvj4vtqzcreiwi@kamzik.brq.redhat.com>
References: <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
 <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com>
 <CAHmQWvA5t7zbbDDM0UvuKSL_Z8ey+x+vOGZumYjwsq0FC5AHGA@mail.gmail.com>
 <20180830083117.iekobw7l3arkt24m@bivouac.eciton.net>
 <CAFEAcA_s+9-4PYHyx_aAnxwt4e=VH77uBG7rC4JA++nOyjAaPw@mail.gmail.com>
 <20180830100233.nr6fm3npy57zl4xx@bivouac.eciton.net>
 <CAKv+Gu9r+1OBOSUBW_KpDEEoKyc=iwW4zVEe04-_JUnJtSGupQ@mail.gmail.com>
 <CAHmQWvBDjMeBpe9Puv+oRii3JrVULW_+AYJL9WV1tXT7F7ALfg@mail.gmail.com>
 <20180905120248.unyh6q4msvyx4f43@kamzik.brq.redhat.com>
 <CAHmQWvAD2Zaz94AxoAScBT8jL8WZqiTMdiuzKPxrZ_3Uvk5ihg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmQWvAD2Zaz94AxoAScBT8jL8WZqiTMdiuzKPxrZ_3Uvk5ihg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Wed, 05 Sep 2018 15:00:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Wed, 05 Sep 2018 15:00:37 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: ymQecRoP4GJ3

On Wed, Sep 05, 2018 at 10:09:46PM +0800, Hongbo Zhang wrote:
> On 5 September 2018 at 20:02, Andrew Jones <drjones@redhat.com> wrote:
> > On Wed, Sep 05, 2018 at 06:08:57PM +0800, Hongbo Zhang wrote:
> >> On 30 August 2018 at 21:29, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >> > On 30 August 2018 at 12:02, Leif Lindholm <leif.lindholm@linaro.org> wrote:
> >> >> On Thu, Aug 30, 2018 at 09:39:33AM +0100, Peter Maydell wrote:
> >> >>> On 30 August 2018 at 09:31, Leif Lindholm <leif.lindholm@linaro.org> wrote:
> >> >>> > On Thu, Aug 30, 2018 at 03:07:29PM +0800, Hongbo Zhang wrote:
> >> >>> >> @Ard, @Leif, is there any possibility to remove all the DT nodes?
> >> >>> >> On real hardware, how does UEFI find the memory size and CPU number?
> >> >>> >
> >> >>> > Usually by asking some form of SCP/PMU.
> >> >>> > So until we have rock-solid multi-cpu-instance (making terms up here,
> >> >>> > there may be a proper name already?) support upstream, we need to take
> >> >>> > shortcuts.
> >> >>>
> >> >>> I would expect that you'd want a "faked-on-the-QEMU end" SCP
> >> >>> communications endpoint to start with anyway. We have one of
> >> >>> those for vexpress, for instance.
> >> >>
> >> >> Ah, I wasn't aware we did!
> >> >>
> >> >> In that case - sure, that is probably the more sensible solution.
> >> >> Does it emulate SCMI?
> >> >>
> >> >
> >> > The purpose of the SBSA/SBBR qemu machine is prototyping the
> >> > interactions between rich firmware and the OS for things like RAS,
> >> > secure variable storage for UEFI or capsule update.
> >> >
> >> > How exactly the firmware figures out how many CPUs and how much memory
> >> > we are running with is out of scope for this, and so I don't think
> >> > there is a need to build something from scratch here: DT will do just
> >> > fine, given that both EDK2 and ARM-TF have working DT code for these
> >> > things.
> >>
> >> Ard, we need to clarify which DT nodes should be kept in SBSA-ref QEMU.
> >> I've researched and tested, there are 3 kinds of DT nodes in the
> >> current 'virt' machine:
> >>
> >> a) CPU DT node, because it is dynamic according to input parameters,
> >> and we don't want to get it by other way, so we agreed to keep it.
> >
> > I have a patch series on the list[*] (which I need to refresh) that
> > would also add a generated cpu-map node. I think the SBSA-ref machine
> > may be interested in testing more complex cpu topologies, but that won't
> > be easy to do with ACPI boot guests unless the topology is hard coded.
> > How will sbsa-ref know when it should use a hard coded cpu topology vs.
> > a dynamic number of cpus in a flat topology?
> >
> If I understand you question correctly: for the cpu topology, firmware
> always get CPU DT from QEMU (which is generated dynamically form
> command parameter), so it is always dynamic, not hard coded in this
> case.
> (and then firmware may translate this DT and insert it into a whole
> ACPI to load OS, it is up to the firmware developer)

I doubt firmware developers will want to generate ACPI tables. Maybe
multiple tables can be pre-generated and then selected by firmware
using a parameter passed to it from QEMU through the DT though.

> 
> And I even considered, do we really need dynamic CPU nodes for such
> platform? 

That was my question. If you do, then I think things get complicated
quick.

> memory size has to be dynamic, but it isn't in DT.

Memory size is in the DT. Making it dynamic may also be complicated
though unless you only want one chunk of contiguous memory. If you
want to represent SBSA machines that have multiple NUMA nodes and/or
gaps in the physical address space, then your ACPI tables will not
be patched easily. I.e. you'll want static ACPI tables regarding
different memory configurations too.

> 
> > [*] http://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg01170.html
> >
> >> b) GIC, UART, Timer (and RTC?) nodes, these nodes are now used by
> >> UEFI, if removed, UEFI needs a rework to not rely on them any longer.
> >
> > Will sbsa-ref support GICv2? If so, then timer and pmu DT nodes will
> > need to have their irqflags fields modified depending on the number of
> > configured CPUs.
> >
> No, I removed the GICv2 in next patch.
> 
> >> c) All the other devices nodes, such as GPIO, PCIE etc, currently the
> >> UEFI doesn't need them, so UEFI can boot with them removed.
> >>
> >> How about b) and c)?
> >> my idea is to keep a) only, remove b) and thus a UEFI modification
> >> accordingly is to be done, c) can be removed freely.
> >
> > So UEFI would learn to augment static DTBs with QEMU generated
> > DT nodes and/or other auxiliary info from QEMU passed to it
> > through the "guest DT" (which is now looking more like a guest
> > firmware configuration description)? Is it worth it? Why not
> > just require the entire DTB to be provided by the user on the
> > QEMU command line and completely ignore QEMU parameters like
> > '-smp'?
> >
> UEFI loads OS by ACPI, not DT for this machine.
> But UEFI has to handle DT too, becuase there is DT passing info from
> ARMTF to UEFI, and this dynamic CPU DT as well.
> I think every thing UEFI gets from DT should translated into ACPI,
> again,it is my understaning now, it is up to firmware developers.
> 
> "entire DTB provided by the user on the QEMU command line", you mean
> firmware can use it to load OS? it is not fine, some featurs such as
> RAS, may still need ACPI, so ACPI is to be used to load OS on this
> sbsa-ref machine.

If booting the guest with ACPI is the plan, but using QEMU's ACPI
generation is not the plan. Then either firmware will have to reinvent
that generation (unlikely) or multiple ACPI tables representing all
the desired configs will need to be pre-generated and made selectable
in some way. Either by choosing from multiple UEFI builds where each
build has one set of tables, or by having all the tables in one UEFI
build and then adding some UEFI code to select them based on parameters
it can get from QEMU through DT.

Thanks,
drew
