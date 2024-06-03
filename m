Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2517285ejs;
        Mon, 3 Jun 2024 13:54:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUkfPpgZJxq8pBICnDOCzQsC1EC1ah32X9gSE2M1ohcVoDKYEnry16P9WxAp/eY+1M8Vdgkpdyb8ty1DEnBKfovSEN5DEdo
X-Google-Smtp-Source: AGHT+IF0apLuQ4yRjyUsS6naJwRD/5nhdCCG0SeHjJHWTLWCRSi2ivRiSfhe9TyuvyxWPmG755jV
X-Received: by 2002:a5d:47a3:0:b0:35e:5351:939 with SMTP id ffacd0b85a97d-35e53510a75mr6392942f8f.33.1717448065997;
        Mon, 03 Jun 2024 13:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717448065; cv=none;
        d=google.com; s=arc-20160816;
        b=T8GH0Jc3Urf6TsjFrJYEUH2ZwWB5AJYG+yutPKcED7eWv21M65ufcOULgOBWunXIaU
         QVcYLdFReg5XGNfd+AFn4DY6tOI5TAN/yEdNu3BsFhC5JkG16ewZvtBKHpySZ1giMued
         q0DTfgOiahosKn/qE3l6uEEMctqmBRpEk80sS50LaEWp+N0DQ2J6brHDpXZh2a5EE1lU
         7Zc1Um//tozlNcNIaQGvYHSwlosZsKzTlqtyFPW9Tdmwnx8MqGVA1VYoFN5MT4p8YfB1
         3kc582BLL1VQfK3alX24QKLQ+i1gyNzqVEDe6DUOdogjUp1yvMXQ5RVvHPBLiXqTHACH
         FQuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=bf3Q4VEvwj/mOWP9QOR2naUzVaiZxBRGyxhLDJ92NU0=;
        fh=jHscaL5QMi9N10SIPueaoJIqyVosKiU5MmZIoBS68mc=;
        b=eMa4tckwUiKzi+cxgfrUXwmmijatZFDdtgb+1KKvdmWVM10FJDus2zDZ47LlNlSmEM
         nJZh4dmzM47gFqVOYQ9+dHaTpK/tUFuqbzzNdIZvzRWbltmHBHGwIhYjA8MLmiviLrmv
         lkUnyPLUpOLCxkIU5Z55BXLT351OTg459kke4pZuusVBizdaEsG2EDrMg++IIi9Ie0BT
         HZLXFoc/N22krOHE0jjjd8fuAnBw95ATQ+Vqd0SPIa5Bdwpa0STvqL9NP/ImSSbXOA9U
         X/ZdSMCM2wcww8BGLcprhFMDfaMAB1kvEs0mnBZ8TM3y1ullW+fGLbktg2dWh0Ogb9dH
         na8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@treblig.org header.s=bytemarkmx header.b=hx+9GB4p;
       spf=pass (google.com: domain of dg@treblig.org designates 2a00:1098:5b::1 as permitted sender) smtp.mailfrom=dg@treblig.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=treblig.org
Return-Path: <dg@treblig.org>
Received: from mx.treblig.org (mx.treblig.org. [2a00:1098:5b::1])
        by mx.google.com with ESMTPS id ffacd0b85a97d-35dd052eddesi4979757f8f.285.2024.06.03.13.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 13:54:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of dg@treblig.org designates 2a00:1098:5b::1 as permitted sender) client-ip=2a00:1098:5b::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@treblig.org header.s=bytemarkmx header.b=hx+9GB4p;
       spf=pass (google.com: domain of dg@treblig.org designates 2a00:1098:5b::1 as permitted sender) smtp.mailfrom=dg@treblig.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=bf3Q4VEvwj/mOWP9QOR2naUzVaiZxBRGyxhLDJ92NU0=; b=hx+9GB4p5IDGXEi+
	nd0IhJd1PhYPisRTDoieZrg6DQPbmAB1uuxRbrIup3onrC//pnTYX2XRN4dJHQmMIqnUV3KsUjx02
	pYwRZFcT7BCuAcDiyXaTi9LcVmPMy39cxe/FWlDBMCeAf8AzkUAEN7aoYsNb270kO2JDdYMzJa9fy
	RMggQvfo2xd0gagiAVEgxuBl7TmQLecrV5zbTHOE6rv8gYjtvcIQurzGjRwbW+FFYBqkpmXJGbjEE
	R11rVGY+IcIiG/PxfRyg9FK/ekRPqU0v92bjWUszYDm9FskCo+QIpaTH5HSdGnt53EiyeClSr7zDv
	G45RUMzwOO+f5RSnCQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1sEEhE-0041ci-15;
	Mon, 03 Jun 2024 20:54:24 +0000
Date: Mon, 3 Jun 2024 20:54:24 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-s390x@nongnu.org, devel@lists.libvirt.org,
	Eric Farman <farman@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Anton Johansson <anjo@rev.ng>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH 0/4] hw/s390x: Alias @dump-skeys -> @dump-s390-skey and
 deprecate
Message-ID: <Zl4tgFuAdjU2bst6@gallifrey>
References: <20240530074544.25444-1-philmd@linaro.org>
 <cb4028fc-9596-47f3-9468-f8912dd48aed@redhat.com>
 <Zl20rAjHLJlZkwxE@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zl20rAjHLJlZkwxE@redhat.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 20:53:35 up 26 days,  8:07,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
X-TUID: Jr38qGPWbhZ6

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Fri, May 31, 2024 at 06:47:45AM +0200, Thomas Huth wrote:
> > On 30/05/2024 09.45, Philippe Mathieu-Daudé wrote:
> > > We are trying to unify all qemu-system-FOO to a single binary.
> > > In order to do that we need to remove QAPI target specific code.
> > > 
> > > @dump-skeys is only available on qemu-system-s390x. This series
> > > rename it as @dump-s390-skey, making it available on other
> > > binaries. We take care of backward compatibility via deprecation.
> > > 
> > > Philippe Mathieu-Daudé (4):
> > >    hw/s390x: Introduce the @dump-s390-skeys QMP command
> > >    hw/s390x: Introduce the 'dump_s390_skeys' HMP command
> > >    hw/s390x: Deprecate the HMP 'dump_skeys' command
> > >    hw/s390x: Deprecate the QMP @dump-skeys command
> > 
> > Why do we have to rename the command? Just for the sake of it? I think
> > renaming HMP commands is maybe ok, but breaking the API in QMP is something
> > you should consider twice.
> 
> That was going to be my question too. Seems like its possible to simply
> stub out the existing command for other targets.

Are these commands really supposed to be stable, or are they just debug
commands?  If they are debug, then add the x- and don't worry too much.

Dave

> The renaming is just window dressing.
> 
> > 
> > And even if we decide to rename ... maybe we should discuss whether it makes
> > sense to come up with a generic command instead: As far as I know, ARM also
> > has something similar, called MTE. Maybe we also want to dump MTE keys one
> > day? So the new command should maybe be called "dump-memory-keys" instead?
> > Or should it maybe rather be an option to the existing "dump-guest-memory"
> > command instead?
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
