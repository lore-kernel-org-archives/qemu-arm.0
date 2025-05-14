Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1273974njb;
        Wed, 14 May 2025 08:29:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTT5v9sajJTbaweJi8lwDb5W3TKZQtIdkJ6pAsd4SnolQ7j6BseB0cVOQjoFDYe84ux1NCN7imeY2Elw==@linaro.org
X-Google-Smtp-Source: AGHT+IFRb3RyI1/jBAKVNXlS8HkURDrmnM/MOr3kdSitItHv7dag840CPTw1E/6xwb7eGrZth/L+
X-Received: by 2002:a05:6214:e45:b0:6d4:1425:6d2d with SMTP id 6a1803df08f44-6f896ec0c13mr49559166d6.43.1747236582277;
        Wed, 14 May 2025 08:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747236582; cv=none;
        d=google.com; s=arc-20240605;
        b=B9Qq/UoE3qix9BKdFim4HBctZffzPeyi4AaMk0isAfqbnUwyFNABGiVnys0Eses5Gl
         dnV7I3++D5Gh+PZ0APiBbWj/KuMCbc6mgXC8PFyA93F/UaDPVpZUqOgYnKqftoi+NjS5
         SJJQVcHHfon/Hl048rz5VQWtzO4mmScLDz2ii+RzA1us8jVUat89udeLTtjrMeXb3tUq
         ElOy/NxEtWPsT1v4Ky8a3TWZm2GTG9hYG5tVEQtDi2LPrd73KKBZW2gIAIw6idkf4rvp
         suKJbZ81eVI1S1t595XpDJiRA2jq+0eO/paGSHajn+XJ1dII5DcSpcckxDz1CIqJ8m9H
         6keg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Ujc5g4wP7awZPP/3/jYO0KhWUewU++24FB98JsLaKD0=;
        fh=iM9GwfGv21/blqyxO272EqVSEyp03V2YmKTOh+3dT00=;
        b=Ed47/d6Ut8gImdsUtTp5M1Jwq7ot+bne/Ol6wT/CmmAAVlOvAkXDJm9fDMSsFP5QL4
         h77iShq6MV27ySUdclqAnP2Q9HYHYRsjTiisXr1Ew95rcR7F4pmYUo2Th+j4EXjdjlOT
         0eBqY2WJd60n8zh3mvKHrDNZofqlDcFEkzAf3Czhmp+NrlcmvY+SSqGcHprEBQWYaOAw
         N7MgdcDglLvSpUqE9a6Hauk7iGVdmRlafbX2R860UmLaxQFRzT9XVjmJpzwOT6j6Jedj
         6FPG1dX7ncrXG+hq4IR/68k3aboZ3zN5I0lm8GE9YaDXF4mGksZxstXVw2JQyxUgaa4U
         r5pQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fA9mDWP4;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00f6a070si1331567985a.150.2025.05.14.08.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:29:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fA9mDWP4;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747236581;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ujc5g4wP7awZPP/3/jYO0KhWUewU++24FB98JsLaKD0=;
	b=fA9mDWP498+PGxrdSIZ1WZa/UmWeKU0iV9g/SCqzCY0gewT3Xj3RiJRTeePZ5/pEFKJg61
	o596ZZCfJH9sfsS2FC0mIfSXuP2JFZX8ImX8GyKnUN/RvIaNsPp1VL8Lkzb8Yb6Mg5SYXT
	aaAiIg7LrU6BmedZRFma/owcE/3oFJQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-107-7PXd5x_dMUW1RklfQzMz_w-1; Wed,
 14 May 2025 11:29:38 -0400
X-MC-Unique: 7PXd5x_dMUW1RklfQzMz_w-1
X-Mimecast-MFC-AGG-ID: 7PXd5x_dMUW1RklfQzMz_w_1747236574
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BAE8E1800EC8;
	Wed, 14 May 2025 15:29:33 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.147])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54BB618004A7;
	Wed, 14 May 2025 15:29:27 +0000 (UTC)
Date: Wed, 14 May 2025 16:29:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
	philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 02/10] arm/cpu: Add sysreg properties generation
Message-ID: <aCS21A8UmjEedTIP@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-3-cohuck@redhat.com>
 <aCNj4dFWLkBZrmmh@redhat.com>
 <878qmzciyg.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878qmzciyg.fsf@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: 5Igc1+qCJzZo

On Wed, May 14, 2025 at 05:25:59PM +0200, Cornelia Huck wrote:
> On Tue, May 13 2025, Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Mon, Apr 14, 2025 at 06:38:41PM +0200, Cornelia Huck wrote:
> >> From: Eric Auger <eric.auger@redhat.com>
> >> 
> >> Introduce a script that automates the generation of system register
> >> properties definitions from a given linux source tree
> >> arch/arm64/tools/sysreg.
> >> 
> >> Invocation of
> >> ./update-aarch64-sysreg-code.sh $PATH_TO_LINUX_SOURCE_TREE
> >> in scripts directory additionally generates
> >> target/arm/cpu-sysreg-properties.c containing definitions for
> >> feature ID registers.
> >> 
> >> update-aarch64-sysreg-code.sh additionally calls
> >> gen-cpu-sysreg-properties.awk which is inherited from kernel
> >> arch/arm64/tools/gen-sysreg.awk. All credits to Mark Rutland
> >> the original author of this script.
> >> 
> >> [CH: split off from original patch adding both sysreg definitions
> >>  and properties]
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >> ---
> >>  scripts/gen-cpu-sysreg-properties.awk | 325 ++++++++++++++++++++++++++
> >>  scripts/update-aarch64-sysreg-code.sh |   5 +-
> >>  2 files changed, 329 insertions(+), 1 deletion(-)
> >>  create mode 100755 scripts/gen-cpu-sysreg-properties.awk
> >> 
> >> diff --git a/scripts/gen-cpu-sysreg-properties.awk b/scripts/gen-cpu-sysreg-properties.awk
> >> new file mode 100755
> >> index 000000000000..76c37938b168
> >> --- /dev/null
> >> +++ b/scripts/gen-cpu-sysreg-properties.awk
> >> @@ -0,0 +1,325 @@
> >> +#!/bin/awk -f
> >> +# SPDX-License-Identifier: GPL-2.0
> >
> > GPL-2.0 is a deprecated SPDX identifier. checkpatch.pl ought to
> > have complained about this, requiring GPL-2.0-or-later as the
> > preference, with GPL-2.0-only requiring justification in the
> > commit.
> 
> GPL-2.0 is inherited from the Linux script mentioned; not sure if
> GPL-2.0-only would be the correct fit here?

Yes, according to the table of deprecated terms at the bottom of

https://spdx.org/licenses/

GPL-2.0-only would indeed be the correct replacement.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
