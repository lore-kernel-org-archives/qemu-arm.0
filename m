Received: by 2002:a17:504:c7cb:b0:1be7:c013:c773 with SMTP id cj11csp318705njb;
        Thu, 27 Jun 2024 09:46:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVF4liHIF+MPQ9+orXRn6xevD9VhDlD0FoEHABZKeQl0ZUAT9/56AHNGGPf0XdfsTQFuOVUMJK088QNLkrz9XQ0SL370q7O
X-Google-Smtp-Source: AGHT+IGtuFb+NDx0/oUwcW9M/jAGercMgGHI8e0NDrErj8Faph7mAgsjZE9Kx+YKakBmO1m4thtz
X-Received: by 2002:a5d:6a42:0:b0:366:d5ea:6098 with SMTP id ffacd0b85a97d-366e94d86b8mr8915426f8f.3.1719506807386;
        Thu, 27 Jun 2024 09:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719506807; cv=none;
        d=google.com; s=arc-20160816;
        b=pUW6WkBNaOSuyUhiIV+PTypcU81jpjJESCZBGd/I4+mYFzc2foqJZgjVUqSY/Uj+6k
         GEv8Hk8Uf8sd5qvruZ8PzglBcAagaYTJqFHqo1gOK19QeFQc8vryg2zZb0mhu7I0cwVD
         KbxuRdtlMgecl93rCqcVye4j5ZEjed6tbY/SeTi+k991TrYXE31BeH8aSbO7XYHt4ddO
         w3V9SJO40/9h1vRC5JBxpuEcIuSg2DROJb0GZ2j+bV3udiOFlZB/VUqUpcR0H+9nJT35
         8/XZba5JFkRdMba0Em1vIjIeS2oUL6xXUGJkio0wIDBZ7DnyKm8PqDX2beb1iEOsZh5x
         d7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=odkanXfrPw63vz4sKB+Q4JKAVIo0yPDND0DCfJzeHQw=;
        fh=PQLPyn1C4Gc1ndsw5Dwmh4k2pvwcsm2hWG5AArFPXMk=;
        b=YWTfCLJViIxhyFIgu2e8ExUirDk/eZBeBiUWuM8rIyEraFCQwZju2k3/YdXD04MYZp
         726uKCPNygDi+AZ1DvrVCO9OaR+lZyEUN28npCEQzO+qYYtbGZSNP3UOiyb6y4BlXABA
         CG24no+fmJLE7Z9LMyqmuN/nb7KRNAr9Tnps4nlLPGs4KPfJLwxn8QOswatEozKK3WKG
         HNLjwdw8sKmwETIuG6ZbhmVFxJoz2wMFxAwb4gwCBa2awlRI4ewhRT34Pd2S9PrtNQes
         T8toc3GYj9z8vypWtz7tLw/tttkUCOZJq7J0HLZ1BnqB7uVPdF+qTL3Qg3QxovI+TCYB
         cqZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@treblig.org header.s=bytemarkmx header.b=Poekx9w2;
       spf=pass (google.com: domain of dg@treblig.org designates 2a00:1098:5b::1 as permitted sender) smtp.mailfrom=dg@treblig.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=treblig.org
Return-Path: <dg@treblig.org>
Received: from mx.treblig.org (mx.treblig.org. [2a00:1098:5b::1])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3674358ad1dsi1051371f8f.407.2024.06.27.09.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 09:46:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of dg@treblig.org designates 2a00:1098:5b::1 as permitted sender) client-ip=2a00:1098:5b::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@treblig.org header.s=bytemarkmx header.b=Poekx9w2;
       spf=pass (google.com: domain of dg@treblig.org designates 2a00:1098:5b::1 as permitted sender) smtp.mailfrom=dg@treblig.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=odkanXfrPw63vz4sKB+Q4JKAVIo0yPDND0DCfJzeHQw=; b=Poekx9w2Vy/ZjfL4
	xwNU9VMr3n00i4Hzx7sGBDkrN4kEcKK4ixcFs3Nv52TUS0Zc8SPx3FcPBs4T5d5my9iluQ8InzjAw
	f/tsMF/GWGhSKF6o1KR/J+48GuB02fXxMN6cb5BItQ1olGKw8ZinmVGLicZ1/2ISSGf/2WND63BQh
	7tkhiQ3YCH8jSK1zQ4aPMa5zO0KGrTNTkmBoDfPsxAM3h7k+8P7aJX1KH/+ue7tLGwmo0Rs+tc8mB
	j5mxGFF/c+Hv++K0HeGRo3iJSTwaHfpxA/fbaYQSwrPx+cJ3+rn9sKsUG4pjTiF+sRgRXplK9GEFm
	gYZcJ8m7JxG/fa/hXw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1sMsGj-008iwA-0R;
	Thu, 27 Jun 2024 16:46:45 +0000
Date: Thu, 27 Jun 2024 16:46:45 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-s390x@nongnu.org, devel@lists.libvirt.org,
	Eric Farman <farman@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Anton Johansson <anjo@rev.ng>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH 0/4] hw/s390x: Alias @dump-skeys -> @dump-s390-skey and
 deprecate
Message-ID: <Zn2XdXo-HPihHPum@gallifrey>
References: <20240530074544.25444-1-philmd@linaro.org>
 <cb4028fc-9596-47f3-9468-f8912dd48aed@redhat.com>
 <Zl20rAjHLJlZkwxE@redhat.com>
 <Zl4tgFuAdjU2bst6@gallifrey>
 <87y17lcni7.fsf@pond.sub.org>
 <fcb6ff5d-fcad-4eb1-9b64-0a8477954a0d@linaro.org>
 <875xup81u9.fsf@pond.sub.org>
 <ZmBPhxW85fqQWGSE@gallifrey>
 <87zfrts7a3.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zfrts7a3.fsf@pond.sub.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 16:46:03 up 50 days,  4:00,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
X-TUID: DFrO7BoNwppi

* Markus Armbruster (armbru@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dave@treblig.org> writes:
> 
> > * Markus Armbruster (armbru@redhat.com) wrote:
> >> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> >> 
> >> > Hi Daniel, Dave, Markus & Thomas.
> >> >
> >> > On 4/6/24 06:58, Markus Armbruster wrote:
> >> >> "Dr. David Alan Gilbert" <dave@treblig.org> writes:
> >> >>> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> >> >>>> On Fri, May 31, 2024 at 06:47:45AM +0200, Thomas Huth wrote:
> >> >>>>> On 30/05/2024 09.45, Philippe Mathieu-Daudé wrote:
> >> >>>>>> We are trying to unify all qemu-system-FOO to a single binary.
> >> >>>>>> In order to do that we need to remove QAPI target specific code.
> >> >>>>>>
> >> >>>>>> @dump-skeys is only available on qemu-system-s390x. This series
> >> >>>>>> rename it as @dump-s390-skey, making it available on other
> >> >>>>>> binaries. We take care of backward compatibility via deprecation.
> >> >>>>>>
> >> >>>>>> Philippe Mathieu-Daudé (4):
> >> >>>>>>     hw/s390x: Introduce the @dump-s390-skeys QMP command
> >> >>>>>>     hw/s390x: Introduce the 'dump_s390_skeys' HMP command
> >> >>>>>>     hw/s390x: Deprecate the HMP 'dump_skeys' command
> >> >>>>>>     hw/s390x: Deprecate the QMP @dump-skeys command
> >> >>>>>
> >> >>>>> Why do we have to rename the command? Just for the sake of it? I think
> >> >>>>> renaming HMP commands is maybe ok, but breaking the API in QMP is something
> >> >>>>> you should consider twice.
> >> >
> >> > I'm looking at how to include this command in the new "single binary".
> >> >
> >> > Markus explained in an earlier series, just expanding this command as
> >> > stub to targets that don't implement it is not backward compatible and
> >> > breaks QMP introspection. Currently on s390x we get a result, on other
> >> > targets the command doesn't exist. If we add a stubs, then other targets
> >> > return something (even if it is an empty list), confusing management
> >> > interface.
> >> 
> >> Loss of introspection precision is a concern, not a hard "no".
> >> 
> >> We weigh all the concerns, and pick a solution we hate the least :)
> >> 
> >> > So this approach use to deprecate process to include a new command
> >> > which behaves differently on non-s390x targets.
> >> >
> >> > If we don't care for this particular case, better. However I'd still
> >> > like to discuss this approach for other target-specific commands.
> >> >
> >> >> PRO rename: the command's tie to S390 is them immediately obvious, which
> >> >> may be useful when the command becomes available in qemu-systems capable
> >> >> of running other targets.
> >> >>
> >> >> CON rename: users need to adapt.
> >> >>
> >> >> What are the users?  Not libvirt, as far as I can tell.
> >> >
> >> > Years ago we said, "all HMP must be based on QMP".
> >> 
> >> In practice, it's closer to "HMP must be base on QMP when the
> >> functionality does or should exist in QMP."
> >> 
> >> >                                                    Now we realize HMP
> >> > became stable because QMP-exposed, although not consumed externally...
> >> 
> >> I'm afraid I didn't get this part.
> >> 
> >> > Does the concept of "internal QMP commands" makes sense for HMP debug
> >> > ones? (Looking at a way to not expose them). We could use the "x-"
> >> > prefix to not care about stable / backward compat, but what is the point
> >> > of exposing to QMP commands that will never be accessed there?
> >> >
> >> >>>> That was going to be my question too. Seems like its possible to simply
> >> >>>> stub out the existing command for other targets.
> >> >>
> >> >> That's going to happen whether we rename the commands or not.
> >> >> 
> >> >>> Are these commands really supposed to be stable, or are they just debug
> >> >>> commands?  If they are debug, then add the x- and don't worry too much.
> >> >
> >> > OK.
> >> >
> >> >> docs/devel/qapi-code-gen.rst:
> >> >>
> >> >>      Names beginning with ``x-`` used to signify "experimental".  This
> >> >>      convention has been replaced by special feature "unstable".
> >> >>
> >> >> Feature "unstable" is what makes something unstable, and is what
> >> >> machines should check.
> >> >
> >> > What I mentioned earlier could be 'Feature "internal" or "debug"'.
> >> 
> >> What's the difference to "unstable"?
> >
> > It should be clear *why* something is marked x- - something that's
> > marked 'x-' because the feature is still in development is expected to shake
> > out at some point, and the interface designed so it can.
> > (and at some point the developer should get a prod to be asked whethere the
> > x- can be removed).
> > That's different from it permenantly being x- because it's expected to
> > change as the needs of the people debugging change.
> 
> When you add special feature 'unstable', the tooling insists you cover
> it in the doc comment.  Review should then ensure the doc comment
> explains why it is unstable.  Examples:
> 
>    # @unstable: Member @x-perf is experimental.
> 
>    # @unstable: This command is meant for debugging.

OK, that makes some sense.

Dave

> > Dave
> >
> >> >> An "x-" prefix may still be useful for humans.  Machines should *not*
> >> >> key on the prefix.  It's unreliable anyway: InputBarrierProperties
> >> >> member @x-origin is stable despite it's name.  Renames to gain or lose
> >> >> the prefix may or may not be worth the bother.
> >> >
> >> > Could follow the rules and be renamed as "origin-coordinate-x".
> >> 
> >> I don't think it's worth the trouble.  The "x-" prefix is now strictly
> >> for humans, and humans can figure out what the x- in @x-origin,
> >> @y-origin means.
> >> 
> >> [...]
> >> 
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
