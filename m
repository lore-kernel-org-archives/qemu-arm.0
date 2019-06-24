Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3689709wrg;
        Mon, 24 Jun 2019 04:56:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy42nIOILXIjj8wteMmqAwRTwyNb/DDT6JHP74uQhuWb402euCsYPbT6KTOe/oqfcCto2Aj
X-Received: by 2002:a05:620a:55c:: with SMTP id o28mr117734305qko.86.1561377371785;
        Mon, 24 Jun 2019 04:56:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561377371; cv=none;
        d=google.com; s=arc-20160816;
        b=nKwJ/iAeeVw6hLvWxXjf+gFV4ksiPihT41AizWsWNxpVgTysw+vl74lenK2Ih0QY3Q
         hn48rMshm8dOfAacxRG7iPw9AZz7z7A3DXuccohiCIX2xIt5QB7C7CDEHcVoA449gWwV
         VOm5x+wxN9MzI9Y7z0zjofHW6Vx7pirifrVDgB+tEgNuRt4Dwu9zjhmEdYq+rLIrOa6j
         MazHiVZqCGPlrrWDHi/BojekC76MTY+3Ov8+xDivUX+5mIzJqggTsbot3oONIMjhLwI3
         F6Gh6kKsv162FQqbLEUAU7fBQpvIRT0Z2mSFu9dipQaZ/+TkxEPscpnAtQIq9W03eSBm
         5z9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=FcDnN1IK6Nj49wEUQNAms4Imcgur/poIqQ9EgW4/F60=;
        b=sZmtlmjJvS6iaSY5QMloMbVvNXhm8da8EStK+fA8hyYVZi8tyqdKoV+gyJMcf33xHA
         cXvhwl9Xzh7+MP5P+Mp5zPIc1JyxF2QZJ5Ol/wArqoqX8qV5ZYG/9/6Fv6PLmTAcASTI
         bweCwt6daaCfTulg2U+UEo/SMWzQi695bzBLKrh8B570UA9UFVTy3Nm3Hi4BUavUskgI
         FJUERXkYREDdXsSyIXXvaIdYoJRX8bqR1qJu/E7VpW23WoQIk0PmmA47leqRbJ1rm4a+
         CAuusLGre/0C6CIJ18Dr6rlX30PVfjs7NZwEVdH7uUCWW80y1Blsy2z4cdcw5M4yPsXo
         URnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id y26si6953888qki.39.2019.06.24.04.56.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 04:56:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEB558762F;
	Mon, 24 Jun 2019 11:56:05 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 135BC1001B02;
	Mon, 24 Jun 2019 11:55:55 +0000 (UTC)
Date: Mon, 24 Jun 2019 13:55:53 +0200
From: Andrew Jones <drjones@redhat.com>
To: Dave Martin <Dave.Martin@arm.com>
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
Message-ID: <20190624115553.ef22fdempvxkzzog@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-11-drjones@redhat.com>
 <20190624110535.GI2790@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624110535.GI2790@e103592.cambridge.arm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 24 Jun 2019 11:56:05 +0000 (UTC)
X-TUID: 7JD4yg+QY/4V

On Mon, Jun 24, 2019 at 12:05:35PM +0100, Dave Martin wrote:
> On Fri, Jun 21, 2019 at 05:34:18PM +0100, Andrew Jones wrote:
> > These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
> > swabbing is different than it is for fpsmid because the vector format
> > is a little-endian stream of words.
> 
> Note, on big-endian hosts the FPSIMD view Vn and the SVE view Zn[127:0]
> of the FPSIMD/SVE common register bits has the opposite endianness for
> SVE_{GET,SET}_ONE_REG.
> 
> This only matters if mixing the two views: just from this patch I don't
> know whether this is an issue for QEMU or not.

I don't know either. My experience with the emulation side of QEMU is
mostly the zcr_write tweak in this series. And, TBH, I didn't put too
much thought into the endianness stuff, nor test this series with big
endian.

Hopefully Richard can chime in on this.

Thanks,
drew

> 
> The kernel and gdb were recently found to be broken in this regard for
> userspace [1] but the KVM interface should be unaffected.
> 
> Cheers
> ---Dave
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm64/kernel?id=41040cf7c5f0f26c368bc5d3016fed3a9ca6dba4
