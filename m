Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3935578wrg;
        Mon, 24 Jun 2019 09:09:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtuP/vF4UPSHDZPs6LfGHbfrC4qXmEmLqZ0a0WGDMY23jFG+4ropmpmi8xlwFln0jz8gOZ
X-Received: by 2002:a50:fa96:: with SMTP id w22mr66987629edr.45.1561392544395;
        Mon, 24 Jun 2019 09:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561392544; cv=none;
        d=google.com; s=arc-20160816;
        b=kMCd1SKIGBJe9pHixmVqQ8ohNnBr+/SN4Qwm3S+yyn2lqqCaFemcbtKq4hRX+gBmqi
         UW74yZol1cMni/HsX8roj76reuDD5Y2cGz2lSAy++qRsd30FiKY6yjJ5ZWXq7Me7tkAL
         OKdwftLGAZ/hXBRSCr06yeOABSeGqKSRJaR6bPZNDuI37tiGLUCO4rHg/Q6a6+++3Enw
         5w+mwcnzl01vyHFoYFSy+Ol6Lnf11Jmc9bMVgxzYodqvrlSFl4NKs4oMMIsHAaBifr0p
         dBm5uXFuRgJ1GF/tpcE1xtZvz1SRGs0cd86Lbe2MQpiz+c7KeforNfQ2c7LCIPcIhfib
         I2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=1CweOm8XWb6OjXTgvAOXzGatQw+54Pt44noM2jlNM9o=;
        b=ejZaz9rEVPLYvblHzCocoZ68YVa4pjhGxtWqScizmorLZVDuNdnPxH4M3EvjuTdQ2q
         5QafTbRMr6lrdVj5dKBc/Bb+T7Lvw4sG7Rue2BKh+wdKbt+yCsy9nBH8/MmAUZEjTc84
         BFaNG4f59JTtuzP1hWY9Is43mN7Qny6c4wC66L+vU2rGTJTBuvVnmmfLsQFdkWRz5N0n
         x4Ehxs1mFXsepFHSjCcE9XlperYWIMG4vhGgs3mBMZbtuaIIBoXFKCvO80IqR8YH/Vsi
         SqSuYgoSA+FOXCaeCCwvBt8AmGLGYo3UKFDB2Dwd7+hpgmiK3/Kzrj/XnvhuzSj2f7QO
         PGGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by mx.google.com with ESMTP id r42si11594656eda.345.2019.06.24.09.09.04;
        Mon, 24 Jun 2019 09:09:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 723DF2B;
	Mon, 24 Jun 2019 09:09:03 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19E0E3F71E;
	Mon, 24 Jun 2019 09:09:01 -0700 (PDT)
Date: Mon, 24 Jun 2019 17:09:00 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Subject: Re: [PATCH v2 10/14] target/arm/kvm64: Add kvm_arch_get/put_sve
Message-ID: <20190624160859.GV2790@e103592.cambridge.arm.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-11-drjones@redhat.com>
 <20190624110535.GI2790@e103592.cambridge.arm.com>
 <20190624115553.ef22fdempvxkzzog@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624115553.ef22fdempvxkzzog@kamzik.brq.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: Ur2mVfgKGXvL

On Mon, Jun 24, 2019 at 12:55:53PM +0100, Andrew Jones wrote:
> On Mon, Jun 24, 2019 at 12:05:35PM +0100, Dave Martin wrote:
> > On Fri, Jun 21, 2019 at 05:34:18PM +0100, Andrew Jones wrote:
> > > These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
> > > swabbing is different than it is for fpsmid because the vector format
> > > is a little-endian stream of words.
> > 
> > Note, on big-endian hosts the FPSIMD view Vn and the SVE view Zn[127:0]
> > of the FPSIMD/SVE common register bits has the opposite endianness for
> > SVE_{GET,SET}_ONE_REG.
> > 
> > This only matters if mixing the two views: just from this patch I don't
> > know whether this is an issue for QEMU or not.
> 
> I don't know either. My experience with the emulation side of QEMU is
> mostly the zcr_write tweak in this series. And, TBH, I didn't put too
> much thought into the endianness stuff, nor test this series with big
> endian.

Neither did I (at least beyond the "does it boot" level) -- hence the
bug ;)

And of course, few people are using big-endian, so nobody complained.

Just flagging it up so it doesn't get missed!

> Hopefully Richard can chime in on this.

It would be interesting to know whether you do hit this issue
somewhere, or whether you have a strong view about the clarification to
the KVM ABI.

Cheers
---Dave
