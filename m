Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2318383njc;
        Mon, 4 Nov 2024 10:29:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU1UKEW1W2nH3DfZhccdU47g5BI+xYfhhqJ8ceN9/CSMfwvS/YlGe/C2w4SCofE6WMlNpfbl/nzmf71zQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE8qTTsvRF8NVpAhCygawLm/h31Xu/BYjfBLpZitGlcXRSUgpMo4DAymwIzaSEqppXfftVz
X-Received: by 2002:a05:620a:1aa0:b0:7b1:48d2:f15e with SMTP id af79cd13be357-7b193f5c4fdmr4447211985a.54.1730744961576;
        Mon, 04 Nov 2024 10:29:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730744961; cv=none;
        d=google.com; s=arc-20240605;
        b=V9v1yQ8yTvPh8VaaAW1umM/V1slmTZs6NS07RAexYRH2ObYBs8lleOSgK7o4sFNyAf
         S1FtH6M8wk3NZg9zYWZeBBemxrdrkOqEGfat0o1u5PDnfEBMGQ38mpzrA040mi5hA/5F
         332sjZpA/B7JpI92pSFmoZVlcx92UMwFLUe13ioGrGO7SiwN13HT9SXeKdclU1hltlo9
         gTfp3RzU0kUN/UllEGPp9mhGidkM34k3DXiST1JWsz3/Uc4z6vgQeUZCHmrvWZUgM9d2
         uP1SZct0STCP5iPPwfxqe3V8uLoUVtDvUe5Ompt0kybwMHNCwlKz6+h7MWQmuK6karvB
         51sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ib3dno1TrrtYfmoTnReQnF1SujY6XHyETaGD47xMgyM=;
        fh=30ESABQkXnOOXRF3wuGvZqI5Skt/ZK5NEqYCgk2pdcA=;
        b=MagCRZ4bMpHZUa0EJGHeZgAbfowXmmDfU4+wdAAe5oQPrQennRjKxS5w3eN+nuylQN
         CHNzR5aDG7k2lEADRCDaVUWHZY3i7mmSBvnE3QDvLgRix+6/fhaIBGrFm07zOSRQOgFc
         ImE73hrRfuRryqCNVqqW8NZka7WCcYDDkPHT7fWkGntP4bLgPn0lhgEQxif9QneoIiz0
         FrREqtHfRij0OWh9cKeetEutItrFIbh6UjQdZLluiP4hfz5eqTKPzsJgnCiP1WN2IPQJ
         l8X76GPOFQ8N+8m8a6HA8VHrh5fy6Dgp1F7W0v/zLYmmW3NF3tE7X+Jp/emC6HVI5b0x
         IF/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gmYk2/eP";
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kchamart@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3a8148csi1306548185a.358.2024.11.04.10.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 10:29:21 -0800 (PST)
Received-SPF: pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gmYk2/eP";
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730744961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ib3dno1TrrtYfmoTnReQnF1SujY6XHyETaGD47xMgyM=;
	b=gmYk2/ePEjEwBFt+Pif6oPC4aB+APQXLXNc8X5yd2jSt2dYyJ5NFn+gCcwoQbzHfobRz+o
	Feyjvv5Z3gF6TdhsYiS2lR93w2vzqH5+We5GbiBz6Ws+SF47vpBtLsSwok+SX7rk9efQeC
	P6f00lfjZ3bJnq20gIP6i5OoTZnZXLo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-338-5mZqUXsrOoupLswS_sX-DA-1; Mon,
 04 Nov 2024 13:29:20 -0500
X-MC-Unique: 5mZqUXsrOoupLswS_sX-DA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 791DE1955F07;
	Mon,  4 Nov 2024 18:29:16 +0000 (UTC)
Received: from pinwheel (unknown [10.39.193.180])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6F16F19560A3;
	Mon,  4 Nov 2024 18:29:06 +0000 (UTC)
Date: Mon, 4 Nov 2024 19:29:02 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger@redhat.com, eric.auger.pro@gmail.com, cohuck@redhat.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	richard.henderson@linaro.org, alex.bennee@linaro.org,
	maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
	berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
	shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
	pbonzini@redhat.com
Subject: Re: [RFC 21/21] arm/cpu-features: Document custom vcpu model
Message-ID: <ZykSbiUnb_ZclYCz@pinwheel>
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-22-eric.auger@redhat.com>
 <Zx__Zi3Zpg1AspnE@pinwheel>
 <52690aae-55b6-47d5-a308-dd75475f8377@redhat.com>
 <CAFEAcA9y5ooPNZ7JbGmRyTKbZn5XPK+5zZgVAvnER=++kWuBrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9y5ooPNZ7JbGmRyTKbZn5XPK+5zZgVAvnER=++kWuBrg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: i5LtnxshpSS+

On Mon, Nov 04, 2024 at 04:30:17PM +0000, Peter Maydell wrote:
> On Mon, 4 Nov 2024 at 15:34, Eric Auger <eric.auger@redhat.com> wrote:

[...]

> > > If possible, it would be really helpful (and user-friendly) to be able
> > > to specify the CPU feature names as you see under /proc/cpuinfo, and be
> > > able to turn the flags on or off:
> > >
> > >         -M virt -cpu franken,rndr=on,ts=on,fhm=off
> > >
> > > (... instead of specifying long system register IDs that groups together
> > > a bunch of CPU features.  If I understand it correctly, the register
> > > "ID_AA64ISAR0_EL1" maps to a set of visible features listed here:
> > > https://docs.kernel.org/arch/arm64/cpu-feature-registers.html)
> > Not all the writable ID regs are visible through the above technique.
> > But indeed I think we converged on the idea to use higher level feature
> > names than ID reg field values.
> > However we need to study the feasibility and mappings between those high
> > level features and ID reg field values.
> > The cons is that we need to describe this mapping manually. Besides
> > being cumbersome this is also error prone.
> 
> You might be interested in "Arm Architecture Features" on
> https://developer.arm.com/Architectures/A-Profile%20Architecture#Downloads
> which includes a 1.8MB Features.json which is a machine
> readable version of the "what are the features and their
> dependencies and ID registers and so on" information.

I just took a quick at the JSON file.  It was a bit difficult to get a
sense of the structure of the file.  Maybe it makes more sense to those
who are more Arm-aware than me.  Or maybe that's what you meant by
"alpha quality" below :)

Out of curiosity, I tried to find the features for the register
"ID_AA64ISAR0_EL1".  I was navigating via trial-and-error with `jq`.
There's a lot of "right"/"left" traversing:

    $> jq '.parameters[136]|.constraints[1]|.right|.left|.value' Features.json 
    "FEAT_TME"

The register name is buried under this:

    $> jq '.parameters[136]|.constraints[1]|.right|.right|.left|.arguments' Features.json 
    [
      {
        "_type": "Types.Field",
        "value": {
          "field": "TME",
          "instance": null,
          "name": "ID_AA64ISAR0_EL1",
          "slices": null,
          "state": "AArch64"
        }
      }
    ]


I was niavely expecting a more predictable structure such as:

    $> jq '.register[ID_AA64ISAR0_EL1]|.fields' Features.json
    FEAT_RNG
    FEAT_TLBIOS
    ...

> But note that (a) it is alpha quality and (b) I am not personally
> going to try to interpret what might be reasonable to do with it
> based on the legal notice attached to it: that's a matter for
> you and your lawyer ;-)

Hmm, it sounds like until point (b) is clarified, this file is out of
consideration from an upstream point of view.

> -- PMM
> 

-- 
/kashyap
