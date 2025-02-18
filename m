Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp619591njb;
        Tue, 18 Feb 2025 03:29:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVaa8viIWX5amdPa4UPKdCoQSQmktRz6O5jMQjTGRS33Ojol6xAYG/P1TO9cqqcKxHH77nUBRIGWNixqA==@linaro.org
X-Google-Smtp-Source: AGHT+IFWSRhtPO/TltKbMRB5blcypscEc2NgvTX7+yAzZRAe0bqDZ49sDK6kYPIYQICy38bwzxNf
X-Received: by 2002:a17:902:ef49:b0:212:63c0:d9e7 with SMTP id d9443c01a7336-22103c5f3bamr226998305ad.0.1739878152952;
        Tue, 18 Feb 2025 03:29:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739878152; cv=none;
        d=google.com; s=arc-20240605;
        b=BP0NdyilpJsid+FXsXVf3PZTIJkosllZsAr7aUqQK1nEneIUNA9NU1il4HHqLBkQim
         vQNnAwLzVjIggRAa06FvBOZcXVq7cR31+ynSF5gVZoRPMcf9Bwa7Q6ORsv5tazCO3HDn
         WoZBEHIX8P50M4SswZBqIaDaKDipnCclGxMNTN+uobPP6AEtPRaKvtNdzG3l1Dx4hMNK
         sLe/k+AyskFq4z1T7R88OJlpPAXXruU+Bsbvrq2Nhp79NGsh9f6gbqU4sgn8f+3xS9rk
         izMVHC5Pxyl36UzP9J95c1UdCGhmgqhv/MZSipRHjdHQDnnzBJjl4yHk4xer/GEcM84K
         N8nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=wA5Dr3SAIqSUJqZ/TzERixoJpvxFjCXN+UQvjfqh3DM=;
        fh=TK97auETtXIDrXVlRZRKapiSZtjZaADh77v9YezEXak=;
        b=fufwekSwoiHqAR6bL0VljL1t91fz++RUxb6/0z3oZd7pxPoAdTqQLGBI90Hfyh5XZ0
         cpCT5AJXWD6QjQWFAff1jIkwBoU5Z/YRdryJyQthP9W6f1g8QrL8Ec3piPcQkC7xscHq
         O0AfRyaJcGheLILWs2TyHjg7jGqTWOZh896T4mIfaoUEDk9kTTKv96dXfMOLRLMgipSH
         +scEV9JXf2qd9PU4Ec1jqAuozfRl6kl6Qf3XnLgtyLGvs/mXA276u3z1Y28IZE3pE+zH
         9JE36d1fXIWzDq9CC8uzq1b3CoIbaxBD1Bp4uWTTYFCGY9fowkZOEKJ1mR4mVrlSrxbX
         sLEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FHKF/k6x";
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kchamart@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 41be03b00d2f7-adda2e700eesi10660658a12.559.2025.02.18.03.29.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:29:12 -0800 (PST)
Received-SPF: pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FHKF/k6x";
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739878151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wA5Dr3SAIqSUJqZ/TzERixoJpvxFjCXN+UQvjfqh3DM=;
	b=FHKF/k6x1Jc18RZp01ed6jWw/jnEx9GipjTn9HQTUaBRl0hylb8JUZ4COFR/+F7uMuX+Hz
	yqp5y/pX4a9cyygqsrYO22UpuJj/plmjuiEfx2qtLlXyb9gmpCJBFoBrtjmSJuRsGhwbHK
	6fu7P73pAzxCJNCRPJNfzaFB+Asb6Kg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-144-ph7rpuYxPBe0gJkPhRIb6g-1; Tue,
 18 Feb 2025 06:29:08 -0500
X-MC-Unique: ph7rpuYxPBe0gJkPhRIb6g-1
X-Mimecast-MFC-AGG-ID: ph7rpuYxPBe0gJkPhRIb6g_1739878146
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 714F318EAB04;
	Tue, 18 Feb 2025 11:29:04 +0000 (UTC)
Received: from gezellig (unknown [10.44.34.39])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30D0919560AB;
	Tue, 18 Feb 2025 11:28:50 +0000 (UTC)
Date: Tue, 18 Feb 2025 16:58:45 +0530
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, Ninad Palsule <ninad@linux.ibm.com>,
	sebott@redhat.com, maz@kernel.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
	Zhenzhong Duan <zhenzhong.duan@intel.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Jamin Lin <jamin_lin@aspeedtech.com>, Yi Liu <yi.l.liu@intel.com>,
	qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>,
	richard.henderson@linaro.org
Subject: Re: [PATCH v2 2/3] docs/cpu-features: Update "PAuth" (Pointer
 Authentication) details
Message-ID: <Z7Qnsm02w6gao_ui@gezellig>
References: <20250217163732.3718617-1-kchamart@redhat.com>
 <20250217163732.3718617-3-kchamart@redhat.com>
 <ff481ffd-545f-4d0c-b53a-3cf9e0f8f388@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff481ffd-545f-4d0c-b53a-3cf9e0f8f388@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: 5mMmINzR3+Nz

(Cc: Richard Henderson; context: "SME" and "RME" feature discussion
below.)

On Mon, Feb 17, 2025 at 06:43:01PM +0100, Eric Auger wrote:
> Hi Kashyap,

Hey,

> 
> On 2/17/25 5:37 PM, Kashyap Chamarthy wrote:

[...]

> > Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> > ---
> > v2: address Marc Zyngier's comments:
> >     https://lists.gnu.org/archive/html/qemu-devel/2025-01/msg03451.html
> > ---

[...]

> > +Live migration and PAuth
> > +~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +The level of PAuth support depends on which Arm architecture a given CPU
> > +supports (e.g. Armv8.3 vs. Armv8.6).  This gradation in PAuth support
> > +has implications for live migration.  For example, to be able to
> > +live-migrate from host-A (with Armv8.3) to host-B (with Arm v8.6):
> > +
> > +  - the source and destination hosts must "agree" on (a) the PAC
> > +    signature algorithm, and (b) all the sub-features of PAuth; or
> > +
> > +  - the alternative (and less desirable) option is to turn off PAuth
> > +    off on both source and destination — this is generally not
> > +    recommended, as PAuth is a security feature.
> > +
> > +TCG
> > +---
> >  
> > -TCG vCPU features are CPU features that are specific to TCG.
> > -Below is the list of TCG vCPU features and their descriptions.
> 
> The resulting header layout seems weird to me.
> Initially we had at top level (assuming ===):
> 
> KVM vCPU Features
> TCG vCPU Features
> SVE CPU Properties
> SME CPU Properties
> RME CPU Properties
> 
> and now
> 
> TCG vCPU Features has somehow disappeared giving the impression that
> there are none.

I did think about it :) That's why I wrote this in the cover-letter; not
sure if you noticed it:

    I replaced the "TCG vCPU Features" heading with "PAuth" because of
    this: before this change, the section says, it is about "CPU
    features that are specific to TCG".  But it has only PAuth-related
    parameters under it.  Since PAuth is relevant to both KVM and TCG, I
    moved them under a separate PAuth section, instead of duplicating
    it.

    But now we have a small inconsistency - there's a KVM-only CPU
    features section, but no TCG-only section.  I thought when there are
    more TCG-only CPU features, that section can be added back in.  Or I
    can add that back in, if anyone feels strongly about it.

> SME and RME and TCG only if am not wrong while PAUTH and SVE are both
> KVM and TCG

I didn't know that.  I read the docs a bit more closer about SME, RME,
and SVE, and did some quick `git-annotate` analysis:

  - "SME is not supported by KVM at this time" — this was added in
    commit e74c097638 (target/arm: Add cpu properties for SME,
    2022-06-20).

    If it is still accurate, then yes, SME looks to be TCG-only.

  - "The status of RME support with QEMU is experimental" — this was
    added in commit 57223a4c24 (docs/system/arm: Document FEAT_RME,
    2023-06-22).

    The phrase "with QEMU" doesn't quite decisively tell me whether it
    is experimental for TCG-only, or if it also applies for KVM.  Maybe
    Richard (in Cc) can tell us more.

  - SVE seems to be for both KVM and TCG, as the section "SVE CPU
    Property Dependencies and Constraints" talks about KVM.

  - PAuth is both KVM and TCG.

> Maybe we shall
> - rename KVM vCPU Features -> KVM only vCPU Features
> - Add a TCG only vCPU features including both SME and RME ones
> - introduce a top level KVM and TCG vCPU features with below:
> PAUTH, SVE, detailing potential different semantic for both KVM and TCG mode

Yeah, it can be done.  Would you be okay if I do it as a follow-up?  As
this a re-work of the entire doc with several features.

> Also while we are at it, we may use vCPU everywhere instead of CPU (SVE
> CPU Properties) and just skip CPU if it lays within the KVM and TCG vCPU
> Features

Yes, make sense.

[...]

-- 
/kashyap
