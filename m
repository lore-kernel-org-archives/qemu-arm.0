Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp84329njb;
        Thu, 5 Dec 2024 04:32:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWB7AEduAFFjeSvYPolT7QWsGenLEU33DKQiLdEqPmpX9NNf7jwW8bVeEBAfhpObN/XBsaSrk+ATX29hw==@linaro.org
X-Received: by 2002:a05:6000:1fab:b0:385:f9db:3c4c with SMTP id ffacd0b85a97d-385fd3f237cmr9353423f8f.9.1733401972972;
        Thu, 05 Dec 2024 04:32:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733401972; cv=none;
        d=google.com; s=arc-20240605;
        b=ewjaHFLU72P3UdBtHwdH1yO1WYDUUpIu3odnMTTbet9KQDnSO15QIwMmhxoDq6uuLi
         Pgm0P02iSgYxWGUtSX4U+WL0NA+4hMZXNYb/fLrMm/Yi/hcmJW9DbW9ooZB2VpVnuZ2K
         HkdHhENq2DXS6mY8SJGOcOcUU8Z2k836DMtZ9YzQfHw/sWinvtlPa2uAjWObbBO7udax
         dTPGotIVqeojinvRDUhWe0J+x+vCXxPMC+89uplOVEG0mCTlgm7iIlNI7Ne2TqbOq/F8
         Ll2G0cdO+X4oREu0WHEz/AWdvTLK/203IJepMTy2M1wAj6hc3la5HOwYY8+PIKkDA8bD
         GfaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=7QatEww3p5uincMuCHGM2HklsAUuluoA0dTIGETLpfY=;
        fh=WZEzW2I1F47EGfpGdtezbEgO3ooTckmaxOVG2hycXM4=;
        b=VPEprLtMUeMHGJomLEMyaZDvLRBcg+7lrvqYr/TWsy9y0j7QyBVmRf9UbD7emq7MYD
         emIcmdvf0XpL4GpD0L3fbYHp32Kb0I/J2nTR0QzviVF2G8Q3I+CTK4GdKleWdaCrzv6D
         vu+Xv9sUcHgTuNrp8vghy1RyOkE7jfjAOBy5EVoAc+Wfks4a6n79aAnCZLGUVgBo5LIU
         ia0FvLQidROyhAZyUpKie9lfSjxr4X0+paUFnyWRuXnlJLwiKZoUaVaGx+cL5a3KAO8n
         goRvv8Jiz8O/l/IZNMAfYpzd1rxbLy/JCcOjRMYd/1BOHtNN+8odBSiJ7Va5AaR1pKLt
         jYTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yarTESK+;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3861ecf33ecsor410465f8f.1.2024.12.05.04.32.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 04:32:52 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yarTESK+;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733401972; x=1734006772; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7QatEww3p5uincMuCHGM2HklsAUuluoA0dTIGETLpfY=;
        b=yarTESK+s2u9xtxkIbhPjrXTVpsfIlu1RwSsj4SqkeXVsUe5dug7AELEVEwWy5xHYf
         TMz2ZdFC6frVmYcKQY+RLLhH1Zg7b4KEH2cufAas8hjHi7W8vTav7k5i0QfGcN20SxbH
         92Wn6BUwDVlj/pypqiazRNMuB23H2nxPKHCWgcFReKQpQpyK3GRiikZnA7OhV7KFgtni
         EZR9CV2s3YESaB+tFToitDNXgreg/grju3hUBDGSlbpLd2Xi1iYGv7UCUQJcSDxQkqcq
         xvBu0gCI+PAHnrMyO/wlOmHXIsWDRv683Jdd+KCg4ocV52FffrrYSs87e4FMuevtF+pn
         Grew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733401972; x=1734006772;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7QatEww3p5uincMuCHGM2HklsAUuluoA0dTIGETLpfY=;
        b=e/qDWcHrURI2JTrG/FzTX3d6RDmyx/j/mnZhhVWSUJ/HhjXtV2NhFQClSY2iOVI31O
         YaEHb2wVGoP5TGpCJkOmekUrNthmcSrsTqWs6u/0FgNJ238FD+hVgopxkJjUXozmotpR
         TgxBu3tQ9BJMzcBeJs5mOcV4EpbDlL2ZZe5NPr8HwK1neJZZ3Z1AU8d5NnF7zkdKucUR
         95iZiJxNF1lci1YOrNwDqwVgtcShuk41VaZ9OAlx5hmHyuOPEbQCdzMKp1IUO4tVpZM3
         du6wVrvJoOFeMqhHuxIIQTMBpFuWM5KjZPvcMKDEjBLECb3z2HIqcyubv7kGO0cSgc0T
         PkEg==
X-Forwarded-Encrypted: i=1; AJvYcCV2AicVcRcSXxZgs1+B3PQXq1GD3HtFkeSSufygjoyMmsmOuiVAvi/yoQtOl1puAiJaVoMKvIDVfzysjg==@linaro.org
X-Gm-Message-State: AOJu0YyWMP2vpK/vA7BEKHUK7E7llCDUGntPdiMgdVbypwNnHCrFPMJW
	AzYmOHT3d8jBRUCsJGkuHzikjPSw6v/guYU4/4ajzg7UdCJ9Eztg5W6XZRSa6cK0Qw==
X-Gm-Gg: ASbGncvwty24qil0OaG6tZq3YjynJLSMDHbzMpAdIYgAzj1DHRkfKaNxXKUNwyvO0km
	SU+AvN0EBG9F0CXj8MpVlqUcqKJAn2dh7OUvy4E2TBq3pLfrMjuhtcweHpm6SMzgJ/iIsYC92u1
	wqf0qPC3yb8Txs8pY/wppPwtM6wxyyHwOi8uOH0uWaISfNt3iWvWkL2AilCpzdJouWZ8BelM4LU
	2THQmPg/sA/izz3hTEaJb/8zRfu16mB9ZIZNTyQzxwezziq
X-Google-Smtp-Source: AGHT+IGar0137GZGyq7fuSkakPayO2Iyooo2G413DupBnmFkgyBbqvY41v8oylXSRRfL9xdD31tQeQ==
X-Received: by 2002:a05:6000:1faa:b0:386:1c13:30d5 with SMTP id ffacd0b85a97d-3861c133159mr2116689f8f.7.1733401972303;
        Thu, 05 Dec 2024 04:32:52 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da113508sm22623965e9.35.2024.12.05.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 04:32:51 -0800 (PST)
Date: Thu, 5 Dec 2024 12:33:16 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v3 25/26] target/arm/kvm-rme: Add measurement log
Message-ID: <20241205123316.GA567753@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-27-jean-philippe@linaro.org>
 <02b90518-2996-4231-bee9-43ce313669b0@linux.ibm.com>
 <Z0XREyMovNyB4s6t@redhat.com>
 <20241126162149.GC956991@myrica>
 <d3d73795-3f59-490c-9e54-c6c358af62d0@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3d73795-3f59-490c-9e54-c6c358af62d0@linux.ibm.com>
X-TUID: sL+xJc7lTmvW

On Mon, Dec 02, 2024 at 10:58:01AM -0500, Stefan Berger wrote:
> 
> 
> On 11/26/24 11:21 AM, Jean-Philippe Brucker wrote:
> > On Tue, Nov 26, 2024 at 01:45:55PM +0000, Daniel P. Berrangé wrote:
> > > On Mon, Nov 25, 2024 at 05:23:44PM -0500, Stefan Berger wrote:
> > > > 
> > > > 
> > > > On 11/25/24 2:56 PM, Jean-Philippe Brucker wrote:
> > > > > Create an event log, in the format defined by Trusted Computing Group
> > > > > for TPM2. It contains information about the VMM, the Realm parameters,
> > > > > any data loaded into guest memory before boot and the initial vCPU
> > > > > state.
> > > > > 
> > > > > The guest can access this log from RAM and send it to a verifier, to
> > > > > help the verifier independently compute the Realm Initial Measurement,
> > > > > and check that the data we load into guest RAM is known-good images.
> > > > > Without this log, the verifier has to guess where everything is loaded>
> > > > and in what order.
> > > > 
> > > > Typically these logs are backed by extensions of TPM PCRs and when you send
> > > > a log to a verifier you send a TPM quote along with it for the verifer to
> > > > replay the log and check the TPM quote. Also, early code in the firmware is
> > > > typically serving as a root of trust that starts the chain of measurements
> > > > of code and data, first measuring itself and then other parts of the
> > > > firmware before it jumps into the other parts. Now here you seem to just
> > > > have a log and no PCR extensions and therefore no quote over PCRs can be
> > > > used.
> > 
> > Indeed, in our case it's the trusted hypervisor (RMM) that provides the
> > equivalent to TPM quote and PCRs. In more details:
> > 
> > 1. QEMU loads images into guest RAM by calling KVM, which calls RMM.
> > 2. RMM calculates a hash of the image content, adds it to a rolling hash
> >     the "Realm Initial Measurement" (RIM), which I believe is equivalent to
> >     a PCR.
> 
> I am not familiar with RIM. A link to read more about it would be helpful.

The "Learn the architecture" documentation might be a good introduction
https://developer.arm.com/documentation/den0127/0200/Overview
In particular the part about Realm creation:
https://developer.arm.com/documentation/den0127/0200/Realm-management/Realm-creation-and-attestation

The RMM specification describes exactly how the RIM is calculated, but
is less palatable:
https://developer.arm.com/documentation/den0137/1-0rel0/?lang=en
A7.1.1 Realm Initial Measurement

More specialized resource are the attestation token documentation:
[1] https://datatracker.ietf.org/doc/html/draft-ffm-rats-cca-token-00
and CCA Security Model:
https://developer.arm.com/documentation/DEN0096/latest/

> 
> > 3. During remote attestation, the guest sends evidence containing this RIM
> >     signed by the root of trust, along with a signed token identifying the
> >     platform (hardware, firmware, RMM).
> 
> Is this a well known manufacturer key that one would expect for signature
> verification or is it locally created?

It comes from a well known manufacturer key, although the signing can be
delegated in some models (like in the current demos):

The hardware RoT creates a key pair for the RMM, which the RMM uses to
sign the RIM. The RoT then signs the RMM pubkey, using the well-known key
(see [1] 4.10 Token Binding).

> 
> > 4. The verifier checks the signature and the platform token, so it trusts
> >     the RMM and the RIM.
> > 
> > > > Then what prevents anyone from faking this log and presenting a
> > > > completely fake log to the verifier?
> > 
> > Absolutely, the verifier does not trust the content of the log, it only
> > uses the log as helper to try to reconstruct the RIM. For example a log
> > event says "I loaded image XYZ at address A", then the verifier searches
> > image XYZ in its database of known-good images, calculates the hash that
> > would result from loading that image at address A. Any malformed event in
> 
> Hopefully just calculating a hash over the image will do and the location an
> image was loaded to, like address A (relocation?), doesn't matter...

In this case it does matter because we don't trust the host VMM which
instructs RMM where to load the images. So we need to verify that the
image is in the correct location, otherwise the VM could be executing the
wrong part of the code, or using the wrong part of the data loaded into
RAM.

When loading an image the RMM hashes its content, then hashes a structure
that contains both the content hash and the address, and it is that hash
that is added to the RIM.

Thanks,
Jean
