Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1613234njf;
        Mon, 28 Oct 2024 09:57:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6NIcaFzTaG3WjG0KrihXsFmz1R69ibvmOP8zl3vqMTzeytI9qbsurT3qYRs/MbA32wfNRnMI1HMyXvg==@linaro.org
X-Google-Smtp-Source: AGHT+IGXzSnwhhdlFVrWkZMl4xTEaNNnaeQGeVzzxYNO3rF3ZLUMLU2YXoVwC1Gsd6gTqAXuTjen
X-Received: by 2002:a05:6000:10c:b0:374:bd48:fae9 with SMTP id ffacd0b85a97d-38061137a49mr6392108f8f.20.1730134622047;
        Mon, 28 Oct 2024 09:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730134622; cv=none;
        d=google.com; s=arc-20240605;
        b=PzB0CFI5B65DDdAtkwmgnEj2nsnbT6nP0Wd48IS5NMl4vQHUUPVt0HIY9UnN/Rmg8P
         sC9l2zFTZfLbmhMfdhX57csUgsug2EOX2XAer/mn6PmL25z8FLP0krQ7fgYc8FiclAeJ
         HaV5A4pvOWxWGNzaVv+WjIsxP+cQR6yfiAaOaqGTrQqtEQBWHmW1ROjzG4CRBbc8LUQw
         0Z05/cP0W0qJjCB5WHPQUrcUHm8j140gMWVRaEHNwCvfltvdTeqyWrLkEXEq3BzcmTum
         ve2HB+mH0Mm4eBP5cCztV9Rtzx4dc+ovsED+EDciDn96WyXU2IS91FqfHu6mawUYQ9Rs
         XL0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from
         :dkim-signature:date;
        bh=/KOhnqIpYwSqkh+if8TVn48GnX568QbnMCx/zN5PUM4=;
        fh=N6fXrLyi/nHDYch89mjerhA7NyPP8UnGS1CQsNt8V+U=;
        b=YOIPkm4IMrU7yFNRLRBpZwxKX566V008LAXUzeT6IHWbNfbXaIcrMx87frVIX8vyIg
         cfVbzlaujxJTYzvrf9KQn0d8WWl8yYToKIeg0KYPA5yEyrqY3M3d1QnMSk0eaM/b2eQY
         0kaiBPYMxyaLq73ZQbkHWDauAO8tH10yKAOOua5JVFIlg679aEt5lc3In11A839PJeLP
         rKq63QdMT6h2sqQa36hrOyduMOTRWgRNXlUGWGnvcv6cEqLjXOLqAAJD3WVJ24WaTyp7
         rQCS/v6ix6P/UFO7ToCcfLGyZ4wyR9r9UHtKHLtqTfxwl1KeYknZdQCCSnyVhF2v5Bai
         QeaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=cCvZSEcF;
       spf=pass (google.com: domain of oliver.upton@linux.dev designates 95.215.58.177 as permitted sender) smtp.mailfrom=oliver.upton@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <oliver.upton@linux.dev>
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com. [95.215.58.177])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38058b21368si4932532f8f.187.2024.10.28.09.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 09:57:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of oliver.upton@linux.dev designates 95.215.58.177 as permitted sender) client-ip=95.215.58.177;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=cCvZSEcF;
       spf=pass (google.com: domain of oliver.upton@linux.dev designates 95.215.58.177 as permitted sender) smtp.mailfrom=oliver.upton@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Date: Mon, 28 Oct 2024 09:56:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730134621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/KOhnqIpYwSqkh+if8TVn48GnX568QbnMCx/zN5PUM4=;
	b=cCvZSEcFd/1XGsQIynCXj1VZLmsOYP6o3327svSfwJaceesyFRqzjIO6goaWG2ST7TPqHO
	8RV5bF238tMqz1xocrZBoQ5YPb4CYfFjXZ0WlGrD50G1L/rUtASS+lTVhayvg+go7wmbgx
	+srcoP8+vCGtfmwRcmYlVuiW7ho49zY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	cohuck@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
	abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com,
	mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [RFC 18/21] arm/cpu: Introduce a customizable kvm host cpu model
Message-ID: <Zx_CU9eeQByANMRW@linux.dev>
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-19-eric.auger@redhat.com>
 <ZxuX4i9NjVRizB72@redhat.com>
 <cb6c8f62-c5dc-416d-865f-fbdf96164dac@redhat.com>
 <Zxub7ol4p8P_sWF8@redhat.com>
 <CAFEAcA_wQu17y0PyQwxw0wuf2H5y2VE5aX16nLP2-u7QUP2ggA@mail.gmail.com>
 <Zx-9WxXkmkMuGIlQ@redhat.com>
 <CAFEAcA9w0mb5bcU8p+fScQony-=oqLmNurGWpnL_sBneQCzxUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9w0mb5bcU8p+fScQony-=oqLmNurGWpnL_sBneQCzxUg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-TUID: C0TfQaJgSSYc

On Mon, Oct 28, 2024 at 04:48:18PM +0000, Peter Maydell wrote:
> On Mon, 28 Oct 2024 at 16:35, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Mon, Oct 28, 2024 at 04:16:31PM +0000, Peter Maydell wrote:
> > > On Fri, 25 Oct 2024 at 14:24, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > On Fri, Oct 25, 2024 at 03:18:25PM +0200, Eric Auger wrote:
> > > > > On 10/25/24 15:06, Daniel P. Berrangé wrote:
> > > > > > Also, is this naming convention really the same one that users
> > > > > > will see when they look at /proc/cpuinfo to view features ? It
> > > > > No it is not. I do agree that the custom cpu model is very low level. It
> > > > > is very well suited to test all series turning ID regs as writable but
> > > > > this would require an extra layer that adapts /proc/cpuinfo feature
> > > > > level to this regid/field abstraction.
> > > > >
> > > > > In /cpu/proc you will see somethink like:
> > > > >  Features    : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp
> > > > > asimdhp cpuid asimdrdm lrcpc dcpop asimddp
> > > >
> > > > Right, IMHO, this is the terminology that QEMU must use in user
> > > > facing APIs.
> > >
> > > /proc/cpuinfo's naming is rather weird for historical
> > > reasons (for instance there is only one FEAT_FP16 feature
> > > but cpuinfo lists "fphp" and "asimdhp" separately).
> >
> > There's plenty of wierd history in x86 too. In this
> > case I might suggest just picking one of the two
> > common names, and ignoring the other.
> >
> > If we really wanted to, we could alias the 2nd name
> > to the first, but its likely not worth the bother.
> 
> Or we could use the standard set of architectural
> feature names, and not have the problem at all, and not
> have to document what we mean by our nonstandard names.

+1

There's existing documentation [*] for the standard feature names, which
provides:

 - A short description of what the feature does
 - Any dependencies a particular feature has (e.g.FEAT_VHE implies
   FEAT_LSE, FEAT_Debugv8p1, and FEAT_AA64EL2)
 - The register fields/values that are used to discover the feature.

This seems like the most user-friendly option...

[*]: https://developer.arm.com/documentation/109697/2024_09

-- 
Thanks,
Oliver
