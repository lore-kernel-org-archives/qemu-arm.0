Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp519407wru;
        Wed, 25 Jul 2018 03:10:23 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe6FwTvtcuWkWnVEm3HtS0XEIvY16b18WeMOQby98iuxVMALfNp3CumM6nTEcWAliTQZYzS
X-Received: by 2002:ac8:274a:: with SMTP id h10-v6mr20300093qth.187.1532513423612;
        Wed, 25 Jul 2018 03:10:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532513423; cv=none;
        d=google.com; s=arc-20160816;
        b=waLZkho4z6fWNmuEddhuZx3ccbPfJGgV0uXPaJSRwmtOEFV1ZkeBpuACqThOP591bQ
         zTtn4Q8XmwB1KRJ5X/KQ+BD+ufAhqztWSreHjetRG7nSkV5hZn72VjeITM0VDBF7OHqt
         9jfBVfSgRqIXh8XV3RTU8aiak254bgEiI5TYoUBjoHq+2bjbBbjeM8jGYFtY8Up0F1Yg
         TTn+1UubHY/ZZq9zWa7IpcteYrPwgwfiIK2QRcoZA63xt1wlWilis3uhno69mhako8q6
         YuV+TD2julx56AHHqknP6KweBNcIKrhdbMXkrDD0GibQhYclu5w3DONa45/9ScE2ypLE
         2cnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=PF2/vnohYlvSoXrltnpVdK1PZHb+uRqCCveDaIYxUCc=;
        b=uR/mW6AVyLzDn5M7gwp4HNrqIrZ1KcKDPe/YE9TZugBeJ9UBZn6jnL7ICxyOJfm6uC
         8xFnbEXZhCzrc9xRAw9lNLdQO/ulnXyyxol91QlITMioW//RH/+Yk4O4x7jZXfTSFEsB
         CUt8rGUnkFvOz2Uw4Q2x7P7p1jJnxAzJgwn8VrUU+qMEaJXaZvTkMz4xvTSAH8wmFZK7
         mhHW7epnNW1pmk5wPs5T7Nt+7LH45b11RZq9LMW9R8bz6G4LWp+x0v36rHS/xYlO1yB6
         ArDzs9f19V2oQ/mA5+a73KqCaV7tFK0VzmcwASrINq6PUYYAwIgwKJc9PpCZLnMX+ZxG
         6fIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id 14-v6si13668551qkk.312.2018.07.25.03.10.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 03:10:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF42F40122A2;
	Wed, 25 Jul 2018 10:10:22 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EB9F2142F21;
	Wed, 25 Jul 2018 10:10:21 +0000 (UTC)
Date: Wed, 25 Jul 2018 12:10:19 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180725101019.7lrwbgx5xquetjuw@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725084824.GA12855@redhat.com>
 <CAKv+Gu_RHsed0KAH8njKB8UPvbUDeoTZ5sP76f_br6azisZzSQ@mail.gmail.com>
 <CAHmQWvCqKqQXnXxOUgi=kLTyE5BhV2NxqaKzvPp63HX02V=X2g@mail.gmail.com>
 <CAKv+Gu_eFjS_UvOuEKhbsWr34o3Jqd4h2duJ-gG1ofsFbwkGbQ@mail.gmail.com>
 <CAHmQWvC8_J4i32UZzdHqJ4w3EdEAHmWGdgqrvGwEA7uo0kvk9A@mail.gmail.com>
 <CAKv+Gu-B4o7dwZPOix2MkECJia6M6Q+zBMw8XVdw49kFYW6J+w@mail.gmail.com>
 <20180725094037.uzz4ycen4qja4q4a@kamzik.brq.redhat.com>
 <CAKv+Gu9VnKkXC8r9BpMPjXfjhsPVRaAmRaOYM8=hPyDCgXMQWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKv+Gu9VnKkXC8r9BpMPjXfjhsPVRaAmRaOYM8=hPyDCgXMQWQ@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 25 Jul 2018 10:10:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 25 Jul 2018 10:10:23 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: VNRWN08uE6B/

On Wed, Jul 25, 2018 at 11:47:39AM +0200, Ard Biesheuvel wrote:
> On 25 July 2018 at 11:40, Andrew Jones <drjones@redhat.com> wrote:
> > On Wed, Jul 25, 2018 at 11:20:03AM +0200, Ard Biesheuvel wrote:
> >> On 25 July 2018 at 11:17, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >> > On 25 July 2018 at 17:13, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >> >> On 25 July 2018 at 11:09, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >> >>> On 25 July 2018 at 17:01, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >> >>>> On 25 July 2018 at 10:48, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >> >>>>> On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
> >> >>>>>> For the Aarch64, there is one machine 'virt', it is primarily meant to
> >> >>>>>> run on KVM and execute virtualization workloads, but we need an
> >> >>>>>> environment as faithful as possible to physical hardware, for supporting
> >> >>>>>> firmware and OS development for pysical Aarch64 machines.
> >> >>>>>>
> >> >>>>>> This patch introduces new machine type 'Enterprise' with main features:
> >> >>>>>
> >> >>>>> The 'enterprise' name is really awful - this is essentially a marketing
> >> >>>>> term completely devoid of any useful meaning.
> >> >>>>>
> >> >>>>> You had previously called this "sbsa" which IIUC was related to a real
> >> >>>>> world hardware specification that it was based on. IOW, I think this old
> >> >>>>> name was preferrable to calling it "enterprise".
> >> >>>>>
> >> >>>>
> >> >>>> I couldn't agree more. However, IIUC this change was made at the
> >> >>>> request of one of the reviewers, although I wasn't part of the
> >> >>>> discussion at that point, so I'm not sure who it was.
> >> >>>>
> >> >>>> Hongbo, could you please share a link to that discussion?
> >> >>>>
> >> >>>> Thanks,
> >> >>>> Ard.
> >> >>>>
> >> >>>
> >> >>> V1 discussion here:
> >> >>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg545775.html
> >> >>>
> >> >>
> >> >> So who asked for the sbsa -> enterprise change?
> >> >
> >> > Actually nobody, but it was argued that sbsa does not require ehci and
> >> > ahci etc, then we should find a name fitting for this platform better.
> >>
> >> That doesn't make sense to me. The SBSA describes a minimal
> >> configuration, it does not limit what peripherals may be attached to
> >> the core system.
> >>
> >
> > Hi Ard,
> >
> > I think that a machine model named 'sbsa' should provide all SBSA required
> > hardware, and nothing else, while providing a means to easily extend the
> > machine beyond that in any way the user likes. The user can easily add
> > devices with the command line and/or by using -readconfig to build a
> > "typical" machine. Note, it should even be possible to add, e.g. an ACHI
> > controller, to the memory map using the platform bus, if that's preferred
> > over PCIe.
> >
> 
> The purpose of the SBSA machine is not to provide a minimal
> configuration. It is intended to exercise all the moving parts one
> might find in a server firmware/OS stack, including pieces that are
> not usually found on x86 machines, such as DRAM starting above 4 GB
> and SATA/USB controllers that are not PCIe based.

To me, this purpose actually requires that the base config be minimal.
How else can you have the flexibility to build a wide range of
configurations for testing?

> 
> If we start layering the usual components on top, it is highly likely
> that checking the EHCI box gives you a PCI based USB2 controller,
> partially defeating the purpose of the exercise.
>

As I said, it should be possible to put these controllers on the system
bus, even if they're specified on the command line. This would be done
using the platform-bus framework. Naturally, providing platform-bus
support for devices/controllers that need it will take some machine-done
notifier code, etc., so this machine model patch series will get more
complex.

Thanks,
drew
