Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3140033wrg;
        Mon, 13 May 2019 11:31:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzNEpXODKz8LBMbUyWRXEhVRM/7wAmGJxRV7wFsBnD+kFpi+jil3YY6LN8h4evcbbFFqutB
X-Received: by 2002:ac8:164f:: with SMTP id x15mr25406251qtk.149.1557772273822;
        Mon, 13 May 2019 11:31:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557772273; cv=none;
        d=google.com; s=arc-20160816;
        b=S542GaG5mBRXIMH7xFfyKLgvuk6wChZeW9Wd/aQv0Hx8DXq2BAEZRGPeI/TMcrmggi
         UcO3Ex3LTmwYHytJrRJTxQg615GEzV/7i4T0jOVlUw391bDGP11VoCGIZwM1wb3TiPpV
         4bnKe4iO5QqR0SmZ0J4Tn2VJIlDLQWz+AEk85pIefbWNWdew+lmC1xJIWZW475FMbFNj
         FG9JCuUMQ4aHj47fxZnDoJade3XQSnDYgneiWSgBWVbFVFy90WLqs/9nYOrNLutYAYfy
         p+Y1kpkNBeAEwXEc3tjz/zEtW4/qJSvit25Z6VufCP3PYFTHlqsqFH753QpNd14weDZn
         Ru/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=m9J7PZPscWZeRdAQhZgjjGRFXd6MbcPGEoGr+4I1AYk=;
        b=ZVwMdOFmzeTXAA1euGNnkmMvczD44P4GPo487nyPyKeB5M68UCsruDF29GJ+XbYi5j
         3nEJoySHdhUF3ZBlzoiuoSXp1JfnLqr2x8ehBONDxXPyohNVE9SLPl+RxNKbaLxTWwu9
         +yt2DXlOBxoJPPpNzLBrQHZtg8TLKskRIAb0jIAy1pef8CPW26rdFMVkBG2F4s2ZIBt1
         WNRkTRwZ+50VpA26ZjC8YqNI0WH4D5dOZP++zhSMAYksnpD0r7bJ3/08mzbW/HU95FvB
         bsteIVIzLBf+z9KjMsqisH1mjk05BD1FWqcGExpjwDGUuJMXSt8x6XVSz2oZr83cwZDc
         6O2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id r14si735947qvc.178.2019.05.13.11.31.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 11:31:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 04BA23087942;
	Mon, 13 May 2019 18:31:13 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-151.ams2.redhat.com [10.36.116.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 687405C1B4;
	Mon, 13 May 2019 18:31:10 +0000 (UTC)
Date: Mon, 13 May 2019 20:31:07 +0200
From: Andrew Jones <drjones@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, abologna@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH 11/13] target/arm/cpu64: max cpu: Introduce
 sve-vls-map
Message-ID: <20190513183107.7lsndkyp2p7yhra5@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-12-drjones@redhat.com>
 <875zqefkbg.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875zqefkbg.fsf@dusky.pond.sub.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 13 May 2019 18:31:13 +0000 (UTC)
X-TUID: fPoDKdhqjwmY

On Mon, May 13, 2019 at 05:25:23PM +0200, Markus Armbruster wrote:
> Andrew Jones <drjones@redhat.com> writes:
> 
> > Introduce another cpu property to control SVE vector lengths,
> > sve-vls-map, which allows the user to explicitly select the
> > set of vector lengths the guest can use. The map must conform
> > to QEMU's limits and architectural constraints, checked when
> > the property is set. Inconsistencies with sve-max-vq are also
> > checked. The bit number of a set bit in the map represents the
> > allowed vector length in number of quadwords.
> >
> > Note, as the map is implemented with a single 64-bit word we
> > currently only support up to 8192-bit vectors. As QEMU and
> > KVM only support up to 2048-bit vectors then this sufficient
> > now, and probably for some time. Extending the bitmap beyond
> > a single word will likely require changing the property to
> > a string and adding yet another parser to QEMU.
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> Please add an example of how the new property should be used on the
> command line to your commit message.  I'd ask for a documentation update
> as well if we had any to update.

Will do.

Thanks,
drew
