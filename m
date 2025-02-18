Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp635379njb;
        Tue, 18 Feb 2025 04:03:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXyBtl2UKsw//P1yTHPfRQfoCeLo4rZQm3ftOo9tejYlaiO0gR7Ayk8rIKRxQWX2ZBGhlo7cPmZomSHIg==@linaro.org
X-Google-Smtp-Source: AGHT+IFwCWMZ5Mt1Tee54Qy5cxo1cywN38Yn7xYcitNWSTQc1yYa8IHFYNCJiFP1xs+9G3+/hgCU
X-Received: by 2002:a05:6214:246b:b0:6e6:5f0b:94bc with SMTP id 6a1803df08f44-6e66cc8c405mr177386796d6.11.1739880199470;
        Tue, 18 Feb 2025 04:03:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739880199; cv=none;
        d=google.com; s=arc-20240605;
        b=AVeRsy4TTXc/wfUn8qXKM+uF8cj5wyibXMIiv8IhBs4BMc9/VxgIk9Q1A9YqOt6IDi
         gC8J5dvTSLQW2IwCTiC/MEP4EHrNjvQVvu1xuu6da/aLmUv/o50qs0QsEM93jUsHFg01
         OfXDePL1DQJKFSwni+Rvb+WYHFavzklXs0QCupjwRmFOXNtFpyz8TVqUk4Z2p7lyHU09
         1SILj6h0Bo8/pORZcxcrluXOM/zTm3HrjJGIZ+uGM67eEZHTX+irQJj2+y30qTzblIY7
         QFCiKKgu70aSjnPMVgE1sydyvIhL6atR+IHtFk6jvnkFf6izmKFiCpnrXtbYQhvG+eb8
         dw2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=tl5jWt1jY+CS4reZsM+ZcrEsJGS2JjPTAKSIDHPZXuQ=;
        fh=f8kIsEZVKhph+MZOoyA1sJRc8kR3LpOaUgz61WzV8dM=;
        b=XW49n09yNci+Wl7RDDuaBlSq+SA+i43wTKWLlQFjkLXH7McLLG02mVWlikCtRvsxgQ
         ExaoBwji4smWoUiaN7RKSTKv3vwh3CD3ifbKkZHqZwYagttjjHhITaa/lTprGpRg2huy
         xIM+vDdrwNjlyMmWQVaBRPp3X93jXLhGz4ClaP4p7k8IUHDwTbSM/BF5wLtnGCjIq4gm
         SHM/pIHrIcWjR7bbh8r04RRLkA0hcWZ8KuppeAbToitoDFZHeUYJ3Vwu2/OALD5+o8nn
         +5Ljp+s/iuV+RzwuS1DGYzBwXbnpnS7vWk3qv5Yay6mTdcicy27Jhue7C0FueLCg8HYf
         yzVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BwqX3wqZ;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kchamart@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d73472fsi105385496d6.31.2025.02.18.04.03.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 04:03:19 -0800 (PST)
Received-SPF: pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BwqX3wqZ;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739880199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tl5jWt1jY+CS4reZsM+ZcrEsJGS2JjPTAKSIDHPZXuQ=;
	b=BwqX3wqZgu6ee9aaRHPnqhvOVTaI4+qcVnKTlxPk8RFc2SmQeVdoP7tIcXXp8o7S4Kwivr
	aclW/lbNJYTXdnNCHTrkgZ8K/RqISGdCRLVw/SynCriNzmbRhVM97t2SauloF7Kcu7qBMs
	idmSumFbilSLOCwk0Vov5UL1oTJESZE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-20-amhCjBS9M62iSJguWJGg7g-1; Tue,
 18 Feb 2025 07:03:15 -0500
X-MC-Unique: amhCjBS9M62iSJguWJGg7g-1
X-Mimecast-MFC-AGG-ID: amhCjBS9M62iSJguWJGg7g_1739880193
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 76D121978C99;
	Tue, 18 Feb 2025 12:03:11 +0000 (UTC)
Received: from gezellig (unknown [10.44.34.39])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C63C19560A3;
	Tue, 18 Feb 2025 12:02:51 +0000 (UTC)
Date: Tue, 18 Feb 2025 17:32:47 +0530
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>, qemu-devel@nongnu.org,
	Ninad Palsule <ninad@linux.ibm.com>, sebott@redhat.com,
	maz@kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
	Zhenzhong Duan <zhenzhong.duan@intel.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Jamin Lin <jamin_lin@aspeedtech.com>, Yi Liu <yi.l.liu@intel.com>,
	qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>,
	richard.henderson@linaro.org
Subject: Re: [PATCH v2 2/3] docs/cpu-features: Update "PAuth" (Pointer
 Authentication) details
Message-ID: <Z7R259Pl1218TsOC@gezellig>
References: <20250217163732.3718617-1-kchamart@redhat.com>
 <20250217163732.3718617-3-kchamart@redhat.com>
 <ff481ffd-545f-4d0c-b53a-3cf9e0f8f388@redhat.com>
 <Z7Qnsm02w6gao_ui@gezellig>
 <CAFEAcA8H0P14JaAtpcwG99SYkqAdhoNzyQBuO++YjJjM1rUbPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8H0P14JaAtpcwG99SYkqAdhoNzyQBuO++YjJjM1rUbPw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: Hu5TEwohLaoI

On Tue, Feb 18, 2025 at 11:34:38AM +0000, Peter Maydell wrote:
> On Tue, 18 Feb 2025 at 11:29, Kashyap Chamarthy <kchamart@redhat.com> wrote:

[...]

> > > Maybe we shall
> > > - rename KVM vCPU Features -> KVM only vCPU Features
> > > - Add a TCG only vCPU features including both SME and RME ones
> > > - introduce a top level KVM and TCG vCPU features with below:
> > > PAUTH, SVE, detailing potential different semantic for both KVM and TCG mode
> >
> > Yeah, it can be done.  Would you be okay if I do it as a follow-up?  As
> > this a re-work of the entire doc with several features.
> 
> I think personally I would favour not having the split of
> "KVM only", "TCG only", etc sections. Instead document
> all of the properties in the same format, and have each
> property say whether it is TCG-specific, KVM-specific, etc.
> 
> Some of these properties may at some point in the future
> change, after all -- SME is currently TCG only but may get
> support in KVM and HVF in future; "aarch64" is currently
> KVM only but we might some day support it in TCG.

I agree.  As the PAuth case demonstrated, it only makes sense to
entirely do away with KVM- and TCG-specific sections and use a
consistent format througout.  That way, no need to remember to update
outdated sections.  It's also consistent with the x86 docs[1], where we
don't draw attention to KVM- or TCG-specific features.

I can rework the doc and send a follow-up.  (Eric: I assume you're also
fine with Peter's suggestion above :))

[1] https://www.qemu.org/docs/master/system/i386/cpu.html

-- 
/kashyap
