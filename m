Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp742507wru;
        Wed, 25 Jul 2018 07:08:28 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcg+FsUOInLj5WWDt6CzxNiu433aJfyxkQKRv9M9wjKgH4bmBGCB6vz23iU0SG4cSsO9GyZ
X-Received: by 2002:a0c:8950:: with SMTP id 16-v6mr18858412qvq.247.1532527708527;
        Wed, 25 Jul 2018 07:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532527708; cv=none;
        d=google.com; s=arc-20160816;
        b=pQF3m0mDAJKTGsmxLmVPXbaX8z/dhbTR+KNJp7p9B+IoO7gTJGtCnZfr4eyFfEIu4t
         lsC/Vk6FjGkF3uZozAmMY9Z3giEIoqr5v63Syfngx0WOfnL0782b7ZBH3eh2xWRjwEdO
         XgKeHKPlOvPVRQPEoYXN6lSBBFY3bl50IGuCHwl9f2tt/0Y1IBQLnkGSBp0oKDQsc1Wv
         yP6grtM/l8IGu18fOyBdAyw6G4RvyQjzvYaJdoN+zqrFDFOz2oHcg4Uwn5e2hqhvv+04
         q6jSaesjMd2t5IJ+jVxxYEyEkA9zAJw3thf4+7XXWLPuY4dI7nSJPb8uGHY8g9P1VIUv
         HHaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=SgkBP5QaUu8e9U9ZdtzK8qtobjoUaadw0Y60i7mubUE=;
        b=j/eHbIJ1xMp0urupIkhSbV2qgn6D0Swygaxwbg1ZskizviAkLHzExZVnOZNavDg6Ye
         MPO3H//GEkl2pK28VJLJ7ikIr33EJqHFbRvWYo6ODOFdmz8Ea/xQooxOBGsasR3mFDnG
         cHqc8VK+gwbYnZmy1osI+WigCIskK3ELZppXiFIlM0haY+e6uKiz2OVDqnpnZeoH/0Fw
         chwIsK+eZmlP+gfBdppXvPmdgX3zHCOo321shiBfkc9Ca/ZMLmmVfZKl+79p1ehSC6Hc
         /J9+YpICFgCIgoEFzC4qI3iWfczaGaL9WtVJat18lhygfrQx24qdXx6bonLvZGZOYpmh
         Jtqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id n11-v6si6747005qvo.33.2018.07.25.07.08.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 07:08:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5C51402345E;
	Wed, 25 Jul 2018 14:08:27 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67A812026D68;
	Wed, 25 Jul 2018 14:08:26 +0000 (UTC)
Date: Wed, 25 Jul 2018 16:08:24 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180725140824.vnkejw5emkxwktaz@kamzik.brq.redhat.com>
References: <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com>
 <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
 <20180725124700.GF12855@redhat.com>
 <20180725125944.5nd5ydm4x4e3vvjw@kamzik.brq.redhat.com>
 <CAKv+Gu-pbJj59wH7wgZ6Uq+Uko9wYEBqSF=WaC3LL68CFkbxEw@mail.gmail.com>
 <20180725133810.gsgfu4x6emygu5o5@kamzik.brq.redhat.com>
 <CAKv+Gu_91nXP4TSvrLf0e8kfX5X3ZNPcmx5UzT1jf5A_rVj8pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKv+Gu_91nXP4TSvrLf0e8kfX5X3ZNPcmx5UzT1jf5A_rVj8pQ@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Wed, 25 Jul 2018 14:08:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Wed, 25 Jul 2018 14:08:27 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: tD6MZio1frVr

On Wed, Jul 25, 2018 at 03:46:01PM +0200, Ard Biesheuvel wrote:
> On 25 July 2018 at 15:38, Andrew Jones <drjones@redhat.com> wrote:
> > On Wed, Jul 25, 2018 at 03:03:40PM +0200, Ard Biesheuvel wrote:
> >> On 25 July 2018 at 14:59, Andrew Jones <drjones@redhat.com> wrote:
> >> > On Wed, Jul 25, 2018 at 01:47:00PM +0100, Daniel P. Berrangé wrote:
> >> >> Would iut make any sense to call the machine  "refplatform"  or "refboard"
> >> >> to indicate it is a generic reference platform, not specifically following
> >> >> any particular real impl, albeit influence by the sbsa spec.
> >> >>
> >> >
> >> > That would indeed stop me from whining about a machine model with an
> >> > 'sbsa' name not strictly implementing a minimal SBSA machine :-)
> >> >
> >>
> >> I still don't get why only a minimal machine is worth considering,
> >> given that a real-world minimal SBSA machine is not capable of doing
> >> anything useful.
> >
> > One definition of an SBSA machine can be quite different than another.
> > If we only hard code the required [useless] base, but also provide a
> > readconfig for the rest, then we get a useful machine without loss of
> > flexibility.
> >
> > That flexibility comes at the cost of platform-bus code (since we need
> > to add devices to the system bus) and a less concise command line. The
> > platform-bus code may indeed be too expensive for this purpose, but
> > we may need to see patches to be sure. I understand the desire to have
> > a shorter command line, but this is QEMU :)
> >
> 
> My concern is not the QEMU side. It is the code that we will need to
> add to UEFI and ARM-TF to deal with the dynamic nature of the
> underlying platform. That code has no counterpart in real world
> hardware, but will surely turn up in production firmware nonetheless
> if we end up having to add that to our SBSA reference codebase.

It sounds like there's already some sort of informal SBSA reference
instance specification that UEFI and ARM-TF intend to support. If
that instance specification were slightly more formal, i.e. documented
somewhere and given a more descriptive name (not just 'sbsa'), then
I think it would be a lot more palatable to hard code those specifications
directly into a QEMU machine model of the same name.

Thanks,
drew
