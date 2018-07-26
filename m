Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp211346wru;
        Thu, 26 Jul 2018 03:33:08 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfLy7SopLj/+vs9COxBk14yckncuFRtmngYZZZncsbH00a5LN7ZBXSzTUb/OqGBZetjwFFs
X-Received: by 2002:ac8:720f:: with SMTP id a15-v6mr1084118qtp.243.1532601188608;
        Thu, 26 Jul 2018 03:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532601188; cv=none;
        d=google.com; s=arc-20160816;
        b=yVWj5dANCz0MxibcGn1Qd+maHV2aBQWdSEu65g1/P+xaQ95YmJHHptlSsBus88ay2z
         eDMkusKonWdS7Cktty0RslK2njg6STGE4m0PJKOV7ifP6HhlVuHBMqyZpYaQZkpgq3xU
         YqJkwwwSt/WmJAieJ6pMNWZM9Rc0+zYuX6aSH2PE25ASdlyMzzQHg5hm3Pi6KmcQm97L
         aOXtt1AlxzjCfWm/NmV3X3MQMr04gwPvv9hijmV1rfFEGBBrkdY0Tfbp+DgE3BB6Asoc
         lHRH5VTK1PRYQxTpizmqwyJX+cphO9Y0I/C8+A1lEmLPiwn/frAofVQzqgczBAytYCne
         AOtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=epAwJrB2TE0NDhq4S32H/O24Pq4xP2KipnghiVtBfOo=;
        b=cwuA1XF9ZBbtgu8UL8r4dFYSz2RNJwDb84IOdfZDe0tG0bAb7tsj7+m9Bby+mU7Qr9
         LoDGu/xFRa/J5X2PUg/k3ra5oiqxrYsY/2eNqxn7Ht5JeHYAQrSSaN537JKftzIbeT+/
         6IAgGrNKB/vCOcqDO4W2TwOQNlTF9gnC4ljonSMZTj9sBGWHxlRmSOVhdH0DorQMKNsY
         vreZs/gcbjrhpJUAEiL2ny+g8gsQM7rtASBa6LokRTKA0QdTq2w2BtmWox1uAIFZ5UMI
         xL9F3KMUnyAitaucI+APBDzkQ8UmScT2LZ8Jdeq+W61r+NWVRaysXe5qDp8oqNq+t7z/
         atCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id t18-v6si912551qtg.13.2018.07.26.03.33.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Jul 2018 03:33:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 233D27D84D;
	Thu, 26 Jul 2018 10:33:08 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC8D12166BA3;
	Thu, 26 Jul 2018 10:33:06 +0000 (UTC)
Date: Thu, 26 Jul 2018 12:33:04 +0200
From: Andrew Jones <drjones@redhat.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180726103304.2ybxx35z7zy2engv@kamzik.brq.redhat.com>
References: <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com>
 <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
 <20180725124700.GF12855@redhat.com>
 <20180725125944.5nd5ydm4x4e3vvjw@kamzik.brq.redhat.com>
 <CAKv+Gu-pbJj59wH7wgZ6Uq+Uko9wYEBqSF=WaC3LL68CFkbxEw@mail.gmail.com>
 <20180725133810.gsgfu4x6emygu5o5@kamzik.brq.redhat.com>
 <CAKv+Gu_91nXP4TSvrLf0e8kfX5X3ZNPcmx5UzT1jf5A_rVj8pQ@mail.gmail.com>
 <20180725140824.vnkejw5emkxwktaz@kamzik.brq.redhat.com>
 <CAHmQWvDY6hb7-a2X8e7CbJ=vhHKni1RUwSH4C7quccGTOZxm+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmQWvDY6hb7-a2X8e7CbJ=vhHKni1RUwSH4C7quccGTOZxm+w@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Thu, 26 Jul 2018 10:33:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Thu, 26 Jul 2018 10:33:08 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: kY+Bz0Ieb4yo

On Thu, Jul 26, 2018 at 05:46:23PM +0800, Hongbo Zhang wrote:
> On 25 July 2018 at 22:08, Andrew Jones <drjones@redhat.com> wrote:
> > On Wed, Jul 25, 2018 at 03:46:01PM +0200, Ard Biesheuvel wrote:
> >> On 25 July 2018 at 15:38, Andrew Jones <drjones@redhat.com> wrote:
> >> > On Wed, Jul 25, 2018 at 03:03:40PM +0200, Ard Biesheuvel wrote:
> >> >> On 25 July 2018 at 14:59, Andrew Jones <drjones@redhat.com> wrote:
> >> >> > On Wed, Jul 25, 2018 at 01:47:00PM +0100, Daniel P. Berrangé wrote:
> >> >> >> Would iut make any sense to call the machine  "refplatform"  or "refboard"
> >> >> >> to indicate it is a generic reference platform, not specifically following
> >> >> >> any particular real impl, albeit influence by the sbsa spec.
> >> >> >>
> >> >> >
> >> >> > That would indeed stop me from whining about a machine model with an
> >> >> > 'sbsa' name not strictly implementing a minimal SBSA machine :-)
> >> >> >
> >> >>
> >> >> I still don't get why only a minimal machine is worth considering,
> >> >> given that a real-world minimal SBSA machine is not capable of doing
> >> >> anything useful.
> >> >
> >> > One definition of an SBSA machine can be quite different than another.
> >> > If we only hard code the required [useless] base, but also provide a
> >> > readconfig for the rest, then we get a useful machine without loss of
> >> > flexibility.
> >> >
> >> > That flexibility comes at the cost of platform-bus code (since we need
> >> > to add devices to the system bus) and a less concise command line. The
> >> > platform-bus code may indeed be too expensive for this purpose, but
> >> > we may need to see patches to be sure. I understand the desire to have
> >> > a shorter command line, but this is QEMU :)
> >> >
> >>
> >> My concern is not the QEMU side. It is the code that we will need to
> >> add to UEFI and ARM-TF to deal with the dynamic nature of the
> >> underlying platform. That code has no counterpart in real world
> >> hardware, but will surely turn up in production firmware nonetheless
> >> if we end up having to add that to our SBSA reference codebase.
> >
> > It sounds like there's already some sort of informal SBSA reference
> > instance specification that UEFI and ARM-TF intend to support. If
> > that instance specification were slightly more formal, i.e. documented
> > somewhere and given a more descriptive name (not just 'sbsa'), then
> > I think it would be a lot more palatable to hard code those specifications
> > directly into a QEMU machine model of the same name.
> >
> Root cause is requirement. This platform and virt serve different use cases.

Never any disagreement there. I'm just disagreeing with how you're naming
one instance of an SBSA platform with the very generic name of 'sbsa'.

> 
> As to command line and readconfig, my opinion is they are suitable for
> change slightly some base/typical platforms, not for change one to

Yes, command line and readconfig are suitable for changing a base
platform. That's why your new machine model should be a *base* platform,
not a specific platform with hard coded peripheral selections.

Thanks,
drew
