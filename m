Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2393658ejs;
        Mon, 3 Jun 2024 10:06:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJ9TEVhY6PKNCAWKMlaiOQj2dt1adjMJhWUuADKe/YadsCagy4rYu6IpZTrdYa2g+Ut6ZdrmTb7noUbThrne91LY7nEiLO
X-Google-Smtp-Source: AGHT+IEi7H8CZSb/vqPNLQUylv6mQL7TF9Rv0ntC4sYfJ1T982dNYU2Kx4Xb0FCfy4KTBPdIlHlM
X-Received: by 2002:a5d:690e:0:b0:35e:7cd4:6d24 with SMTP id ffacd0b85a97d-35e7cd46e31mr23231f8f.3.1717434400698;
        Mon, 03 Jun 2024 10:06:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717434400; cv=none;
        d=google.com; s=arc-20160816;
        b=bOWAoH0mc4RTuxygU9a2Nmhv3DUnWdyh1x2yx9O5QJlqCfwtmVhHJM6l9Bvs3DDnuI
         aJWRl8K4CE9bqWpUlxBnYphLl7nco7Z+9Tw/qCmmanixS75bQ/WWOr43unX2H5DLqdJy
         HnLI7Uqmq3uv2mKBjgZyzEKMBYKvOOLKlGS1Njdf81oJ7O9ZWcIkXieSVsnCkz6D7Nsd
         C+luTjuYuhKf+FUZXKzFO3xIuE5KuhLnSJZewzaOIqFlbQ/Ol/noXG+SVsFR2VhBDWYt
         v79K74RUY5foz3qWbgRyQyouPbHxHQfF09dAEi1J0nDT7gu7OjCdQ2YkranWcXG5NPnn
         lP9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=hIhvFG904StDLDEXs02aTwGPPyUmkI3bpXgRnoN+kU8=;
        fh=GrXUC3EmOrP2QAXcvXVSOD8TU83smcF4En5EhKRyfoU=;
        b=Qc4u71AOvHoek2KN9j4Svd0c+tgk3JM4SRL0dgAo5jpGxby/CBU+fnjFUeUPOT8uyF
         nHjGm6BgEE9SfYBu8lKABQ5HL9TbHUnEZpq9yJ0KiHbQjOPaQxgCoc3KV2ibD8sv7Gu/
         DnyuGjRLp91Sjt7WF/REHwjKM6haleWmZkO5vfREACBcoQ7/LKiDethShPN/9ioMMMPI
         cgF2JyaV6U6qfPLAy77dfuk4R0h64hD/6C906Aw5fXeQewEppLvW55kp+6zgntefJtkl
         0J98MOiulRCOoAufhPmxm4QaTRxyheEYdB7rKvFHRmrVjx1l1remZCkiKjpIjLrzKPnO
         DIcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@treblig.org header.s=bytemarkmx header.b="ELrkcLY/";
       spf=pass (google.com: domain of dg@treblig.org designates 2a00:1098:5b::1 as permitted sender) smtp.mailfrom=dg@treblig.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=treblig.org
Return-Path: <dg@treblig.org>
Received: from mx.treblig.org (mx.treblig.org. [2a00:1098:5b::1])
        by mx.google.com with ESMTPS id ffacd0b85a97d-35dd063e089si4578523f8f.687.2024.06.03.10.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 10:06:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of dg@treblig.org designates 2a00:1098:5b::1 as permitted sender) client-ip=2a00:1098:5b::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@treblig.org header.s=bytemarkmx header.b="ELrkcLY/";
       spf=pass (google.com: domain of dg@treblig.org designates 2a00:1098:5b::1 as permitted sender) smtp.mailfrom=dg@treblig.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=hIhvFG904StDLDEXs02aTwGPPyUmkI3bpXgRnoN+kU8=; b=ELrkcLY/6EwMu8Ty
	Eb52QEPH5cfiek1zT/RZ45JAm4u/p/wvFE03eS1QtjWA5U7XsdGL+Qj7NNtHTMIe6xIy3983dXjsP
	v9jrevej3+AhJB0GTLi56AKUomd61zdrltr4a0PoKtybCt5Bwgfuu0YnYJBjGkD0CyXByGoq7Br+V
	icQiRkgjJ3L83iOhXz9yEws9cPVdu7i3F8gP6yHLqAPYdSYNVrE5k/mAim1pLkpyPWP8tsQGhZusZ
	F9xH9DV3JwgZv9L4cGqoeWkb5t9p7OdcPoSVqELZnMiav/Y3U4Phrrfd06t7f/qa83kI5k/Iz8DS2
	X1fVlrzKuDNGJXQGPQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1sEB8o-003zgA-1o;
	Mon, 03 Jun 2024 17:06:38 +0000
Date: Mon, 3 Jun 2024 17:06:38 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-s390x@nongnu.org, devel@lists.libvirt.org,
	Eric Farman <farman@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Anton Johansson <anjo@rev.ng>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH 0/4] hw/s390x: Alias @dump-skeys -> @dump-s390-skey and
 deprecate
Message-ID: <Zl34HkNkeWnVhssP@gallifrey>
References: <20240530074544.25444-1-philmd@linaro.org>
 <cb4028fc-9596-47f3-9468-f8912dd48aed@redhat.com>
 <ZlnYkt9sLgDbQqVT@gallifrey>
 <6fec1c49-c6a6-4e96-bc44-5dc7feb843e6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6fec1c49-c6a6-4e96-bc44-5dc7feb843e6@redhat.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 17:00:10 up 26 days,  4:14,  1 user,  load average: 0.02, 0.01, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
X-TUID: 8tT9fBE0lrLW

* Thomas Huth (thuth@redhat.com) wrote:
> On 31/05/2024 16.02, Dr. David Alan Gilbert wrote:
> > * Thomas Huth (thuth@redhat.com) wrote:
> > > On 30/05/2024 09.45, Philippe Mathieu-Daudé wrote:
> > > > We are trying to unify all qemu-system-FOO to a single binary.
> > > > In order to do that we need to remove QAPI target specific code.
> > > > 
> > > > @dump-skeys is only available on qemu-system-s390x. This series
> > > > rename it as @dump-s390-skey, making it available on other
> > > > binaries. We take care of backward compatibility via deprecation.
> > > > 
> > > > Philippe Mathieu-Daudé (4):
> > > >     hw/s390x: Introduce the @dump-s390-skeys QMP command
> > > >     hw/s390x: Introduce the 'dump_s390_skeys' HMP command
> > > >     hw/s390x: Deprecate the HMP 'dump_skeys' command
> > > >     hw/s390x: Deprecate the QMP @dump-skeys command
> > > 
> > > Why do we have to rename the command? Just for the sake of it? I think
> > > renaming HMP commands is maybe ok, but breaking the API in QMP is something
> > > you should consider twice.
> > > 
> > > And even if we decide to rename ... maybe we should discuss whether it makes
> > > sense to come up with a generic command instead: As far as I know, ARM also
> > > has something similar, called MTE. Maybe we also want to dump MTE keys one
> > > day? So the new command should maybe be called "dump-memory-keys" instead?
> > 
> > I think there are at least two different concepts; but I agree it would be
> > nice to keep a single command for matching concepts across different architectures;
> > I can't say I know the details of any, but:
> > 
> >    a) Page table things - I think x86 PKRU/PKEY (???) is a page table thing
> >      where pages marked a special way are associated with keys.
> >      That sounds similar to what the skeys are???
> 
> Sounds a little bit similar, but s390 storage keys are independent from page
> tables. It's rather that each page (4096 bytes) of RAM has an additional
> 7-bit value that contains the storage key and some additional bits. It's
> also usable when page tables are still disabled.
> 
> > I'm not sure the two fit in the same command.
> 
> Does it make sense to dump all the MTE or x86 keys all at once? If so, we
> could maybe come up with an unified command. Otherwise it might not make
> sense, indeed.

So they're all really different granularities:
    s390 - one key/physical page
    ARM MTE - one tag/16 bytes physical
    x86 - per virtual page; then a current register with 16 permission
         sets

For x86 I guess it would be easy to dump the register, and then the
values for a range of virtual addresses.
But then if you dumped a range of physical addresses on ARM MTE you'd
get hundreds times more output than for the equivalent s390.

Dave

>  Thomas
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
