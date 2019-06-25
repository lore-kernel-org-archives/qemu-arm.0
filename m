Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4583150wrg;
        Mon, 24 Jun 2019 23:14:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWLKyDaKSOoBm0k/KoJXedLFs2HU2TcgIMjSiORSm3xVMUXeJvf+VWZblt4bD8AweuZwzg
X-Received: by 2002:ac8:1a9d:: with SMTP id x29mr134675578qtj.128.1561443261333;
        Mon, 24 Jun 2019 23:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561443261; cv=none;
        d=google.com; s=arc-20160816;
        b=qibVN6v9FILT+VsXR/sMiQ5n1yd3KlKnzzdJl/LFV7vQLHEKZ1zY0eD1zOg4vbvPfX
         QU8oUDRVOJnL9TAojhZx9/O7hVw+Xhm+ViK297nUdTHdqaKa4/MtAiG9FM6QVTd59OqU
         gK3onMlzVcLecq5hrnoQMWWIYr7EsFzRHaPDaiaL3kYPx5F/IKMzJOS2CIUlxVHLKrP/
         MG86qYJn7L4ih3igeuEixlGM3T3eQ0nb4AYLoiTt2dB79qA8lA8hbT+Ri5J4fjt0ViKq
         3AqQ/I4HND0foj4gWhhxsjbTTPZloUscf8BAjjFY/5YVuMu69IKiQnKj3XvFNvnSH0fz
         7Xpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=ZhiP/W0BScsYIig7kfI85wD9wDQpobi2QS3rR3Bwz3M=;
        b=vZCTBzsPVKiZ5aC2gwquTf5vkHTArLwLyI0Q9B4wDPsj5I6dlIZpfceoLIPMHDzv8X
         /0KvF1KaC7y37Mi2ImrkxQYqLjDaR3Nampu99RDWfN37ejUYp9KJemmP9ES5LPWHu9ND
         pLDxLtcBhF1Sx8Xwgxlr0koDclIDoh6hd0c2R26kdtnGuKhCk3A4T3cwjrVuFCpU03We
         2dA7VazV0hg0Xr1YHdBNUIdASvAzZkDMyvNyRsLNh8OD3lTVUYKNP5oLMod7ejSPgIQh
         8PLKrhQh2EEGpic1Q2mCP3zX6ezBVYNPc6OScD2THvGcZa8rRdD3Uy6X0psLW7f7x30E
         FgbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s47si5409399qth.305.2019.06.24.23.14.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 23:14:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86A4C30832EE;
	Tue, 25 Jun 2019 06:14:16 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DE1B10027BF;
	Tue, 25 Jun 2019 06:14:12 +0000 (UTC)
Date: Tue, 25 Jun 2019 08:14:10 +0200
From: Andrew Jones <drjones@redhat.com>
To: Dave Martin <Dave.Martin@arm.com>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 05/14] target/arm/helper: zcr: Add build
 bug next to value range assumption
Message-ID: <20190625061410.5ocufyqmk4d73ic7@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-6-drjones@redhat.com>
 <20190624110507.GG2790@e103592.cambridge.arm.com>
 <20190624113037.m5onedluc4x7c5ej@kamzik.brq.redhat.com>
 <20190624160308.GT2790@e103592.cambridge.arm.com>
 <20190625061127.jvrbee6eyxf4meem@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625061127.jvrbee6eyxf4meem@kamzik.brq.redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 25 Jun 2019 06:14:16 +0000 (UTC)
X-TUID: lOQ8EOPff6hJ

On Tue, Jun 25, 2019 at 08:11:27AM +0200, Andrew Jones wrote:
> On Mon, Jun 24, 2019 at 05:03:08PM +0100, Dave Martin wrote:
> > On Mon, Jun 24, 2019 at 12:30:37PM +0100, Andrew Jones wrote:
> > > On Mon, Jun 24, 2019 at 12:05:07PM +0100, Dave Martin wrote:
> > > > On Fri, Jun 21, 2019 at 05:34:13PM +0100, Andrew Jones wrote:
> > > > 
> > > > The purpose of this check should probably at least be described in a
> > > > comment -- i.e., what actually depends on this?
> > > 
> > > I was thinking the already present "Bits other than [3:0] are RAZ/WI."
> > > explained that, but how about this for an improvement?
> > > 
> > > /*
> > >  * Only the lowest 4 bits of ZCR_ELx may be used to constrain the vector
> > >  * length, the rest of the bits are RAZ/WI. Since the vector length of
> > >  * 128-bits (1 in quadwords) is represented as zero in ZCR_ELx, and all
> > >  * vector lengths are represented as their length in quadwords minus 1,
> > >  * then four bits allow up to quadword 16 to be selected.
> > >  */
> > 
> > No, maybe the existing comment is enough.
> > 
> > I thought there might be more code elsewhere that assumes that checks
> > sve_max_vq <= ARM_MAX_VQ then then assumes that sve_max_vq <= 16.  But
> > if not, we probably don't need an additional comment here.
> 
> I suppose there is some assumption that if sve_max_vq > 0 then it is
> also <= ARM_MAX_VQ elsewhere in QEMU. However here in zcr_write I don't
> think that assumption is being used. Here we're simply enforcing a limit
> of 16 within the emulation, without checking sve_max_vq at all. So I like
> the suggestion for a build bug like the one this patch adds, because
> otherwise we have 16 in two separate places; the ARM_MAX_VQ definition
> and the '& 0xf'.

I suppose we could also write the 0xf in terms of ARM_MAX_VQ, with a
(ARM_MAX_VQ - 1), but that's getting into emulation implementation
preferences, which I don't know anything about. So I'd leave that to
Richard and Peter.

> 
> > 
> > I haven't tried to understand all the code in the series beyond the
> > user/kernel interactions, so maybe I was just paranoid.
> 
> Paranoia is good for the soul. Or something like that...
> 
> Thanks,
> drew
