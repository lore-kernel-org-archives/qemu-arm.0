Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp184892njb;
        Tue, 26 Nov 2024 08:21:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUZEmzdDtTPMVCNie1RJTIiAk3DJvs4vaLzShbj4mnoEI37DHeTWG4Ev1/04NkwTfxsUTlMbCTnGFRg0g==@linaro.org
X-Received: by 2002:a05:6000:1868:b0:382:4fad:3b43 with SMTP id ffacd0b85a97d-38260be1539mr15644645f8f.48.1732638085761;
        Tue, 26 Nov 2024 08:21:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732638085; cv=none;
        d=google.com; s=arc-20240605;
        b=lWvVe8b9JXxzTHgS3cCwHZ6vFWfyWK0YXGQIfKvylpPx6ArRETB0wESkbr97oNK3hA
         jAgqWFytbUKj1XXG37hh5Pfiu2LiyuKHIoQ9e1xpzHdVhd7HBQqbO0Muw/R9kLQYfX05
         REayi/0BfLsPUMGN6Y7xWOg1ZGetZQ81GFWpRdkl3k3xi9GROZqgs7jxryJJ6TL23Zn5
         6yQuYdQZxlRqZxvWtvx5ukBvXYq6D/gktlI7x06Hfjn2sxR+Gvn0Ufr3z7ZhV9zF14Gp
         aWpy8JOqFMFgjeSKb+vdODNtQRQfQU8o/9uc/o2iZiTuodysPj31sr4rsbbghTPxBEX6
         X+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=h/Y3dfJHpWGeVDMDu3RlQMaq4H0hBO/Po984mVdCMzk=;
        fh=kN32I1t8InOq/e47dSDRz1HhTVo0y+9+JEXsQ3qLq6Y=;
        b=Wmnl5/WbUhrPQoZfCciT5DjQ/D6pcX7T6xUL0PhnWZlhYsPUa2y3D6CI8eRibVg+0H
         HdEAC/S0sVRn9peNh1kozHeeghZfg/McBZ916XoKdCW6ShnEXnZCLlC6NKNSPF8Gtl8y
         dpYzW5WrFZ9IQY2EyLNGlNyTtnpHkg41LJfNNzKoYJIw5NlxDFIo0JXsUyDCsId8pXt2
         XFeXMHn9IrvnCLstR7z70gm1uV5lgyb2bz/R7z/NNmQaa4snewexCJAzeebywnw22LbW
         wZciiH1jTeJ30t+n+ag+OT7aF1Oh5iwSytJOZqDD0r6HPeQWnKloaWor0y7OhvL/I8Uo
         vpoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TN51Hjia;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385c47fe0fesor252563f8f.10.2024.11.26.08.21.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 26 Nov 2024 08:21:25 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TN51Hjia;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732638085; x=1733242885; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h/Y3dfJHpWGeVDMDu3RlQMaq4H0hBO/Po984mVdCMzk=;
        b=TN51Hjia9FE4SSVNZzq/egsQlalVTSsUPaSIgWr1zfI1nuv9EumwOTwUXd1VJD3fq5
         1J16iDtHaMYje9iVBYUOb6cEzE4J3IKPMENWwIFBunK/TQX8y1eyypJ+hZIJCdDBNu+B
         k0ocEHmk9TBiagfhyhdVsLLjcnhXDhypTYP+7ruBsDEEisbBmt4x+FIYQTHeSrQ1W3Pc
         2mvhAGu1cLEvw0vg4fW56vzu6njQL0est3jVbBiWLCe2SimEww7URo+R4Yic3+D0NE5S
         MFCDu+iJWglLntInsl/J/L2sOWt7Die9jute7u2mliQR7skKTY25wXDmSLQ8pIOlpg7o
         0NVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638085; x=1733242885;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/Y3dfJHpWGeVDMDu3RlQMaq4H0hBO/Po984mVdCMzk=;
        b=GMN6OPwrCFpafHNlAjP68AoNna44otQFFDAxTPJ6rBGO13wqoYo4jeyZzzQhB03tj+
         jWgX6TB3TkfPtz8+Y77/pkBGOFQMO6ei82XZBejHB0qOVxLAYz2rDZjvmHMA+dDQ9dWJ
         qTTIjQgEX7kVZkvZLBLNpvRlAKnS4YFZZTAtR7OigqY1SG4xz2/vKQVN9UH9iLtcDE3R
         tRh/M5Ul51wcTjzODAj00yITv5B53pJ3468MShtsqq2Mlcs8X1+YpLGu+JmMPLMI2RFu
         Wvqud85l0vYANgBInHCR365/8r0wL1LAQQtAynY6bMUuJ1ym9PBVHB26NbQ8HnyiFINz
         VX4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUj67j/jvcrR4FY6ZV6wKfv2Mufn3V4kcfOZeYnp9RKLcqFR825A1u/V/3VNKzkIcUOGidZZeBnn7HinQ==@linaro.org
X-Gm-Message-State: AOJu0YzUxDKlG2T9HG5n5bI4t/XrXGE5yRLLRj59EOZXSNvPGyW5ieRs
	wiDkbO/yjG5lQFzGxTp0MIC8hdGadQJr+Ld/6WeKpCU/JJopEAU3NJ4ij4iTfsTL7A==
X-Gm-Gg: ASbGncvPuX83mALv12h1CpDZYPEHp35QbF54bxK/c2cY9ndq7l8j1U1b1ja7/UsgqmD
	2Jp76ahTip1f0OLNqWcJC1Utb9TfQ+B9dwCZyv/cMIC9s2BIRE2MrOEQ5/VBcsOnwCKPdj8tVMM
	4uiFXsXoJgHOtYxPRbTfLXGIvCPbTFbKJLUHdLmySuqaS7+JA7yaPBjb8hW+mo8iOyEnGOb1dQ4
	pSXK8FzZwXSBTZeaSUIn1fzCxA6tbdgc2sV8hr9vUDXQS11
X-Google-Smtp-Source: AGHT+IERC/qysp9e4MP1YayPf4Tiox6DeK1HwZXr50kJG05vy8ZZDrAgDmOEoML+pIX03Snk065zYQ==
X-Received: by 2002:a05:6000:1acd:b0:382:31db:d61 with SMTP id ffacd0b85a97d-38260bcb9dbmr16775365f8f.38.1732638085131;
        Tue, 26 Nov 2024 08:21:25 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm13655099f8f.109.2024.11.26.08.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 08:21:24 -0800 (PST)
Date: Tue, 26 Nov 2024 16:21:49 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>, peter.maydell@linaro.org,
	richard.henderson@linaro.org, philmd@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.bennee@linaro.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v3 25/26] target/arm/kvm-rme: Add measurement log
Message-ID: <20241126162149.GC956991@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-27-jean-philippe@linaro.org>
 <02b90518-2996-4231-bee9-43ce313669b0@linux.ibm.com>
 <Z0XREyMovNyB4s6t@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z0XREyMovNyB4s6t@redhat.com>
X-TUID: aUu8aLrTwNGz

On Tue, Nov 26, 2024 at 01:45:55PM +0000, Daniel P. Berrangé wrote:
> On Mon, Nov 25, 2024 at 05:23:44PM -0500, Stefan Berger wrote:
> > 
> > 
> > On 11/25/24 2:56 PM, Jean-Philippe Brucker wrote:
> > > Create an event log, in the format defined by Trusted Computing Group
> > > for TPM2. It contains information about the VMM, the Realm parameters,
> > > any data loaded into guest memory before boot and the initial vCPU
> > > state.
> > > 
> > > The guest can access this log from RAM and send it to a verifier, to
> > > help the verifier independently compute the Realm Initial Measurement,
> > > and check that the data we load into guest RAM is known-good images.
> > > Without this log, the verifier has to guess where everything is loaded>
> > and in what order.
> > 
> > Typically these logs are backed by extensions of TPM PCRs and when you send
> > a log to a verifier you send a TPM quote along with it for the verifer to
> > replay the log and check the TPM quote. Also, early code in the firmware is
> > typically serving as a root of trust that starts the chain of measurements
> > of code and data, first measuring itself and then other parts of the
> > firmware before it jumps into the other parts. Now here you seem to just
> > have a log and no PCR extensions and therefore no quote over PCRs can be
> > used.

Indeed, in our case it's the trusted hypervisor (RMM) that provides the
equivalent to TPM quote and PCRs. In more details:

1. QEMU loads images into guest RAM by calling KVM, which calls RMM.
2. RMM calculates a hash of the image content, adds it to a rolling hash
   the "Realm Initial Measurement" (RIM), which I believe is equivalent to
   a PCR.
3. During remote attestation, the guest sends evidence containing this RIM
   signed by the root of trust, along with a signed token identifying the
   platform (hardware, firmware, RMM).
4. The verifier checks the signature and the platform token, so it trusts
   the RMM and the RIM.

> > Then what prevents anyone from faking this log and presenting a
> > completely fake log to the verifier?

Absolutely, the verifier does not trust the content of the log, it only
uses the log as helper to try to reconstruct the RIM. For example a log
event says "I loaded image XYZ at address A", then the verifier searches
image XYZ in its database of known-good images, calculates the hash that
would result from loading that image at address A. Any malformed event in
the log causes the hash to diverge from the trusted RIM value, and causes
an attestation error.

> In addition, a measurement log is just one of the interesting features
> that a TPM provides to OS. The other TPM features are still relevant
> and useful to confidential VMs.
> 
> As a high level goal I think we should be aiming to make it possible for
> users to move their existing VM workloads from non-confidentail to
> confidential environments, simply as a choice at deployment time. To make
> this as practical as possible, confidential VMs  need to be aiming to
> match non-confidential VM features where ever it is practical to do so.
> Users & vendors should not need to build & carry around 2 sets of disk
> images - one setup for confidential and one setup for non-confidential.
> Following existing standards will reduce the work both for OS developers,
> app developers and users alike, to adopt the CVM world.
> 
> IOW, this is a long winded way of saying that we should be looking to
> provide a complete *standards compliant*, trusted TPM implementation to
> confidential VMs, not providing a cherry-picked selection of a few
> TPM-like features.
> 
> On the x86 side of things, the route to providing a trusted TPM is via
> SVSM, both for SNP and TDX. Microsoft's recently open sources openhcl
> similarly provides a st
> 
> I don't know so much about RME. Is providing a trusted TPM a job for
> the RMM ?

Not directly, but I've heard of at least two options that are being
actively worked on:
* running payloads like SVSM and openhcl that emulate a TPM. In RMM 1.1
  there is a concept of "planes" that enables this.
* having edk2 in the VM provide a "fTPM".

I'm less familiar with these, but I think both need to connect the virtual
TPM to the root of trust by performing remote attestation via RMM (?). So
the problem of reconstructing a RIM on the verifier side remains, even if
it's not done by the application.

In addition I'm wondering about lighter, container-like workloads, which
will want to boot quickly and run the bare minimum software, and where
edk2 or SVSM seems superfluous. Maybe people will want to tailor those
workloads and avoid the extra layer?

Thanks,
Jean
