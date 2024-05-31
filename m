Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp531134ejs;
        Fri, 31 May 2024 07:03:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXvF/4K+IGQavlY0m9XfTv04ZsgF3Kec3Fl5v8Kez3RYpu7v8toE5RNwBTqyWcrk15QfFZ+Qb5EdbrJiIKsGRpLnPty6d5c
X-Google-Smtp-Source: AGHT+IExITVZIC3mIMG2ATeB1g7w7CkWZZGAR1BKhyJQTx9vx7f01vBv36YAL2EWBl4Iaz1nwflL
X-Received: by 2002:a05:600c:1912:b0:417:eb5d:281b with SMTP id 5b1f17b1804b1-4212811fea4mr47924825e9.17.1717164180210;
        Fri, 31 May 2024 07:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717164180; cv=none;
        d=google.com; s=arc-20160816;
        b=PjikW2UI/f67jG8J9qFCYqDxl8fcgPTXwdeCG1lpoMMLwg8a8sEjCsEEyECnUXMuqR
         SMJkzTh0w3lAZruC3C1CcRs4aH0GW+KV4vOqMHsgI9OQ4VDtryKQ4hKhKde2K9w9qVps
         qZ/vexdpgNPruhYd/DLvlXFv42ZbkmeO+iqjNYzZ4suX78u/5XCEl6UItRAffJ2UowBI
         u3NwIPz3KaIHXWaqs0iptOTXaPpdMPneb50byb88YS3ml/d0nk0sy7+KYWNe3/XHKzz8
         TYYtWUXHrw2GkG75Hk4bLeUSpf7i/gSXaS0NrXstw7oDc7X9usSgFgW2obz8nslzZJhQ
         Sr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=PdMtr1N7TTcm4riWZLzhePUdK72d5QWd6KTPpxhQybs=;
        fh=FDIXUSWxpDd3Snuck7tLfG1O5y/bsC0ZNwDehoLqcB4=;
        b=UQAkD0owdCLzMkPkuRQrYo/H3KlAnE0ATM7vzcL+snisG6zFLODA+eKVQdyoC3f18C
         8uy1jp4z/fDLdxObPh4P03gW54SkNzuUEk2L46x25EE24V7BTe/7UncPI0rlztFmfEgN
         7CDnCvUspNwICqW/JCbNMeL4kAN5DWXJfjA5qhxX+OT5s/r8ud1hKCHOMr8Cd5jpdqC3
         kXI3zTz8PZSwAhq+LyIVOm2NUCI4SnxLBeNXZLQn7i/X03MCDlsLpbUv5F+SMjsHhHHn
         CQNOWSLhacdISdSFq2mvc22kv2clWehWUXpF4/iNXQpOvtLFKRk93zJv+jQ9zf29x90O
         Upzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@treblig.org header.s=bytemarkmx header.b=VCXHwDMV;
       spf=pass (google.com: domain of dg@treblig.org designates 2a00:1098:5b::1 as permitted sender) smtp.mailfrom=dg@treblig.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=treblig.org
Return-Path: <dg@treblig.org>
Received: from mx.treblig.org (mx.treblig.org. [2a00:1098:5b::1])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4212b8cc2a0si11068445e9.139.2024.05.31.07.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 07:02:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of dg@treblig.org designates 2a00:1098:5b::1 as permitted sender) client-ip=2a00:1098:5b::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@treblig.org header.s=bytemarkmx header.b=VCXHwDMV;
       spf=pass (google.com: domain of dg@treblig.org designates 2a00:1098:5b::1 as permitted sender) smtp.mailfrom=dg@treblig.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=PdMtr1N7TTcm4riWZLzhePUdK72d5QWd6KTPpxhQybs=; b=VCXHwDMVA3tpW+cT
	mM6QK3qPRGHOxIQAV68lCCNgxlpQFuVJhREQAtWpoW7RN/PuQ7Z+oEZoRFtaDGzI2aQJTC4/DtrBk
	Uxsvs0ztEggxv5xRWACu1Y5mzUlVnJKHCVJigY0gnSQ76N3jl8VzkG7TVLREtdc7YwxSK9U2A7+Xf
	aTXMBTDC9sGRFTqccB/mAV+NW+LHuy5CZS0vvVROH2jjK2YZDT3cYy0oEqf3D5BZLpgT19C7asGpo
	N/GHY+t5jbbK2vEhgLenTonjkh9lKmsWjgIEeMcsb+Qv+gOirBz9z4/unoxjVnmOFMY6SjiAlNXDj
	AINBRYq+Ic9Y1XQOxw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1sD2qQ-003aWI-14;
	Fri, 31 May 2024 14:02:58 +0000
Date: Fri, 31 May 2024 14:02:58 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-s390x@nongnu.org, devel@lists.libvirt.org,
	Eric Farman <farman@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Anton Johansson <anjo@rev.ng>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH 0/4] hw/s390x: Alias @dump-skeys -> @dump-s390-skey and
 deprecate
Message-ID: <ZlnYkt9sLgDbQqVT@gallifrey>
References: <20240530074544.25444-1-philmd@linaro.org>
 <cb4028fc-9596-47f3-9468-f8912dd48aed@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb4028fc-9596-47f3-9468-f8912dd48aed@redhat.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 13:59:17 up 23 days,  1:13,  1 user,  load average: 0.26, 0.13, 0.03
User-Agent: Mutt/2.2.12 (2023-09-09)
X-TUID: N74E94I7Ub2R

* Thomas Huth (thuth@redhat.com) wrote:
> On 30/05/2024 09.45, Philippe Mathieu-Daudé wrote:
> > We are trying to unify all qemu-system-FOO to a single binary.
> > In order to do that we need to remove QAPI target specific code.
> > 
> > @dump-skeys is only available on qemu-system-s390x. This series
> > rename it as @dump-s390-skey, making it available on other
> > binaries. We take care of backward compatibility via deprecation.
> > 
> > Philippe Mathieu-Daudé (4):
> >    hw/s390x: Introduce the @dump-s390-skeys QMP command
> >    hw/s390x: Introduce the 'dump_s390_skeys' HMP command
> >    hw/s390x: Deprecate the HMP 'dump_skeys' command
> >    hw/s390x: Deprecate the QMP @dump-skeys command
> 
> Why do we have to rename the command? Just for the sake of it? I think
> renaming HMP commands is maybe ok, but breaking the API in QMP is something
> you should consider twice.
> 
> And even if we decide to rename ... maybe we should discuss whether it makes
> sense to come up with a generic command instead: As far as I know, ARM also
> has something similar, called MTE. Maybe we also want to dump MTE keys one
> day? So the new command should maybe be called "dump-memory-keys" instead?

I think there are at least two different concepts; but I agree it would be
nice to keep a single command for matching concepts across different architectures;
I can't say I know the details of any, but:

  a) Page table things - I think x86 PKRU/PKEY (???) is a page table thing
    where pages marked a special way are associated with keys.
    That sounds similar to what the skeys are???

  b) Upper bit things - where you steal a few bits from the virtual address
    and then use that to associate some security; I think that's closer
    to what MTE is isn't it?

I'm not sure the two fit in the same command.

Dave

> Or should it maybe rather be an option to the existing "dump-guest-memory"
> command instead?
> 
>  Thomas
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
