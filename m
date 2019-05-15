Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp350922wrg;
        Wed, 15 May 2019 02:15:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwXJIgvEGcXaBXSV9Le6JbGCyG6nye975gZhcE3kEww2xyPy7AdXBvNXW6ptYqqhIhS7WWw
X-Received: by 2002:ae9:ea15:: with SMTP id f21mr4039206qkg.138.1557911727812;
        Wed, 15 May 2019 02:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557911727; cv=none;
        d=google.com; s=arc-20160816;
        b=XBUbfWK8go+HmQBgLgK1LVXmljvQnDdTc0kXckV0jkCnpahVFu4e8Xoz+FiLfTTSC2
         c3ebTPMl2GO13yOQlRW1E5XH6cuoIJXhrTgry1gXLr5bNeFEtmqiYBnPFy8DfzJIAIcZ
         VdwFW50ImZYrrTK/g7/fjudVuORz8brQe6+KOYuJIkX3XzdYId7yv6GlSuYlCesZFPJa
         NexQOKjLyzyCmE0kmwEAipTNoG4+X5xN/Toq0CQC5EW3a33S6HkpuMJ1xv7yHU/7Zm3U
         WpNzKz0ACa0jbj0VryjwfPGJD4s87brxjwbgN+o1nha100nzIYaFgAotdyi3VkDdxYz6
         hY8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=ledJz/4BBUI4Wq39eYnWG+/z+Al8gd8QyGvXAxSU/0E=;
        b=Fcy16eRU7JrlrnyK2pWgXppC9xVOHmnmo8yILmpda9voHJMFs2/s+wzDEXMpe8cjhn
         s0LW7yvKmC7oDRIsPVFpws/o28v42A1d13YWLKwO9wuZS2lb+bKpYx3roBCNqQohtZE8
         wN2ZSVKx+1vyNCftMMw0SAC+gsEr8lYM1aEMNFAB33PyFoMyKeAfDdpaDWyny4JtuzTh
         TcWx5fsfAaloAx86CA7bjQGRiVOpw1NlwJSzksg2undLnJHAN9r0vSxC9c0FXb+CiBzn
         qJqjrrScubpCahIMs6dMamlJt6foV04UMI9oyPmjUsZ2MzsSNPDiRyZdKHyC9eepgyPl
         hGUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s13si1025422qts.59.2019.05.15.02.15.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 02:15:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EBD3F8552E;
	Wed, 15 May 2019 09:15:26 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13BD910021B2;
	Wed, 15 May 2019 09:15:24 +0000 (UTC)
Date: Wed, 15 May 2019 11:15:22 +0200
From: Andrew Jones <drjones@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH 00/13] target/arm/kvm: enable SVE in guests
Message-ID: <20190515091522.xomdryr24oc7qki5@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
 <20190513123656.6iu7ebu7zucn5mxt@kamzik.brq.redhat.com>
 <e38aac8cb33c5782499b4ca0356c43267f05dc5e.camel@redhat.com>
 <20190514125329.mi7ctaoujirwm6gs@kamzik.brq.redhat.com>
 <1857a74ef586a4e41d93b184498cfcf6c2927cec.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1857a74ef586a4e41d93b184498cfcf6c2927cec.camel@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 15 May 2019 09:15:27 +0000 (UTC)
X-TUID: WPTlxhtP+nx2

On Tue, May 14, 2019 at 06:03:09PM +0200, Andrea Bolognani wrote:
> I thought about it a bit more and perhaps the simplified design is
> better after all.
> 
> Whatever the interface looks like on the QEMU side, we're going to
> want to offer libvirt users two options for configuring vector
> lengths: listing all desired vector lengths explicitly (basically
> sev-vl-map but more verbose and readable) and providing just the
> biggest desired vector length (like in sev-max-vq).
> 
> In the latter case, we'll want to expand the user-provided value
> into an explicit list anyway in order to guarantee guest ABI
> stability, and doing so when a single bitmap has been obtained via
> QMP seems like it would be more manageable.
> 
> Sorry for the flip-flop, but after all isn't this exactly what
> upstream design discussion is supposed to be all about? :)

Yup, no problem. I'm actually liking the idea of the single map plus
flags. We won't need two implementations (QEMU and libvirt), we'll
only need one (libvirt). The QEMU QMP side will only need to state
what should be implemented using the flags. Also, as we already
agreed, we need TCG and KVM flags anyway, so we're already in flag
land.

> 
> [...]
> > > If the size of the bitmap on the KVM side is 512 bits, why don't we
> > > just make it that size on the QEMU side too from the start?
> > 
> > I'd still only want to input 64-bits on the command line, otherwise
> > we get into inputting arrays, which isn't easy. KVM's interface is
> > meant for expansion, but it won't be using most of those bits for
> > quite some time either.
> 
> I'm probably missing something entirely obvious, but couldn't you
> just have a single, possibly fairly massive (up to 128 hex digits if
> I'm not mistaken) value on the command line and just work with that
> one, no arrays necessary?
>

We could, and I like the idea. It just hadn't crossed my mind due to
implementation tunnel vision.

Thanks,
drew
