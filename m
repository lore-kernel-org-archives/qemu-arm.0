Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp659620wru;
        Wed, 25 Jul 2018 05:47:04 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeV4azQDiWBTPYE1u6VQG7ZV7ucJ4b8dBIQeRBPZyDoFg09dy/F+d8wP6SzGjdbAX9ddlWS
X-Received: by 2002:a0c:c3c6:: with SMTP id p6-v6mr18750740qvi.146.1532522824425;
        Wed, 25 Jul 2018 05:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532522824; cv=none;
        d=google.com; s=arc-20160816;
        b=HU7QJpG2OBSjOd4xb/aIUT36bPIH/2/r0PhRnFWLT6JFTMHY0NlyMDMUGwOel6b531
         7itWMsW/GKaRB1mrAOteg012TlYGBU7iOL3Cw1Cwf2f+zO52bR1sUXmwUuWaxnXmknMb
         DOhYfjJD30qNxJ4VeGYFqF8KZ056ISK56kmM8TQNHxz0L99O8THncz+056rwqyq2QnVi
         RoJCzOL3vOf6BrZHC4AW1iLjYd0Q7ezSk7gANISJZVrcOwz71HqOWxHWDynAJ5Ag0Hb/
         OHCymoW1G8StrM1Fopy8pPtmL4tUEdrxqQ9lgWyvf3VUpkRDwzP0WBcRZ3iWqtSTGpXZ
         c6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date
         :arc-authentication-results;
        bh=55rS9b9VwE9hq+S0UNXPmTG+eCoYcYg8EDQXrLG3LQE=;
        b=0xTuUSyfw1GfpTu/V/3y5UhbujAu6nOsLSYUEq195YOC2bXtquXnn7w4rwPvIppXpZ
         UqvzgQLDZ61fgQl1RTXEvmt8UEzAMTVeva9Qp89wAI/Vcntie8GwwfuGwesK84Ozwd9z
         ekCqb9qtiYmVoq39tMiqDEknUDc6HVlW4ApfStJg/8RYkplA+cHPFwxqp1zdOgw7xnUD
         YPrGjLWV+1VaVwIADm3By/1q/u1xXeDZrOxB3fqMH/ytlSGZBKixuGn4XJHnwq5l+9Lo
         f3WPYLa44oqtHUrefE5uW+MFrwQmUJbBT9O4NVAolkGqDYCCYvZEMXBi9Qu9sTQzm1H7
         7Izg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id r25-v6si1517530qtk.15.2018.07.25.05.47.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 05:47:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5B16857E8;
	Wed, 25 Jul 2018 12:47:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 598D77C56;
	Wed, 25 Jul 2018 12:47:02 +0000 (UTC)
Date: Wed, 25 Jul 2018 13:47:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180725124700.GF12855@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com>
 <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Wed, 25 Jul 2018 12:47:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Wed, 25 Jul 2018 12:47:03 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-TUID: FkbV5ozToz92

On Wed, Jul 25, 2018 at 01:19:09PM +0100, Peter Maydell wrote:
> On 25 July 2018 at 12:44, Andrew Jones <drjones@redhat.com> wrote:
> > On Wed, Jul 25, 2018 at 06:46:59PM +0800, Hongbo Zhang wrote:
> >> For Armv7, there is one typical platform 'vexpress', but for Armv8, no
> >
> > Wasn't the vexpress model designed for a specific machine?
> 
> Yes.
> 
> > Namely for
> > Arm's simulator?
> 
> No.
> 
> > Is the vexpress model really something typical among
> > all the Armv7 platforms?
> 
> No.
> 
> "Vexpress" is a model specifically of a development board
> produced by Arm (the versatile express). It's useful if you
> want to run code that runs on that devboard, but (as with
> most of the devboards we model), it's not necessarily ideal,
> because it has all the limitations of the real hardware it's
> modelling (in this case the big ones are limited memory, no PCI).
> The hardware it models is also quite old now (maybe 7 or 8 years)
> and it's not really "typical" of anything. (In the primarily
> embedded space where most v7 CPUs are there's not really anything
> that could be described as "typical" anyway: everything is
> different.)
> 
> For most people who just want to run Linux on an emulated v7 CPU,
> I would recommend the "virt" board, for the same reasons I
> recommend it for v8 cores.
> 
> >> such typical one, the 'virt' is typically for running workloads, one
> >> example is using it under OpenStack.
> >> So a 'typical' one for Armv8 is needed for firmware and OS
> >> development, similar like 'vexpress' for Armv7.
> >
> > What is a "typical" Armv8 machine? What will a typical Armv8 machine be in
> > two years?
> >
> > Note, I'm not actually opposed to the current definition (because I don't
> > really have one myself). I'm just opposed to hard coding one.
> 
> AIUI the aim here is to provide an emulated platform that is
> set up in the way that server-style armv8 machines are
> recommended to be set up, so it can be used as a testbed and
> demonstration for the firmware/OS software stack. The hope
> is that following "best practices" results in a "typical"
> machine :-)  But the word "typical" is probably not really
> very helpful here...
> 
> I would expect that in the future we'd want this machine type
> to evolve with the recommendations for how to build server
> platform hardware, which might indeed be different in two years,
> since it would be the development platform for writing/testing
> the firmware/OS stack for that two-years-time hardware.

Would iut make any sense to call the machine  "refplatform"  or "refboard"
to indicate it is a generic reference platform, not specifically following
any particular real impl, albeit influence by the sbsa spec.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
