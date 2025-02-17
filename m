Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp158394njb;
        Mon, 17 Feb 2025 08:42:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX5UHc/pxvZrpRFspTsYfZhRPc9BbrzsepwJQpEk0srFoIE7Y6Go8d+qceklanpGMt4XwuCP4QaNhRI1w==@linaro.org
X-Google-Smtp-Source: AGHT+IFktpajiG/mL/VTTjNsBbmAan3QQtYZahjlXgNceE6Ra8+kCTLdXYpg66KLji8u5Xtw/d7z
X-Received: by 2002:a05:620a:1b93:b0:7c0:a954:6394 with SMTP id af79cd13be357-7c0a9546a41mr130457485a.14.1739810541021;
        Mon, 17 Feb 2025 08:42:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739810541; cv=none;
        d=google.com; s=arc-20240605;
        b=aLFbb5Ioy8zGf8sZmXC2CHm9xY7RpGRvSZcKT7x5RY9eGr5Iqj6OEGm1XQ+MJ2OOye
         Km6VzrBLahjWs6HrJ1F7XnIDZLqM41TqTP6I3QIE1nqXyxJCe6lJ/RKmXxlMhZpD3/N2
         oBj1xdGN4k3FSxK+eAkj8rVsRj4wlRrp55SaYW5qhRVwx7+pPi0V5L4uWsi1Ldzw9TYK
         4vcixbLMzMIfldWO9rDFH0t7bIM421enhoVpWsiAMv8jOJGm/o0nidGmELqFNcuyrh93
         RT8odPnDwgu2Yoy6z1v6rqChiRzQagXO0DrobXCMKBeUV2oZ34qYMb5T1KvsTcOdCctX
         ilRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=XbkIoklqqdbuIOGIReku3lHEr+KYa4uqc8v7BThesjM=;
        fh=47QcS27w30xEdSwnc4ef8oyM0HkcJB52S9BkqDpOu10=;
        b=EqevNQyM3B7a6YBLDjrtv7G1KVhY1LG8+xoENRlleBRxwyhX0d6kCcHtHmc1uXIqYp
         5FvpuB/g+2h7TtDp6qG36g/HrSvT0bUKc2653G06rqMAXtSaoIcLq11HiInUCPiqRvHY
         RzYQP3HsWY19G8aWG7LCRXWRpeEvFQZ6lH/9qRoZ1iyLknolynzvUDCFOAhwMEuw+ozO
         3MfWSrbj2Z0ria3fuSVYnKw5lnLGptAHYhfLVxSyAehrn0eFn0spjt060oai3HWNwYVz
         w6LLjYB1AFbelvZr/Gflp9z47ntgzzS6QjFmD5jmTcFlHrfiJwy3lFHMFPg5qagpUNIP
         pOpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SDVZTsYQ;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kchamart@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c0a41ff944si112721685a.63.2025.02.17.08.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:42:21 -0800 (PST)
Received-SPF: pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SDVZTsYQ;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739810540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XbkIoklqqdbuIOGIReku3lHEr+KYa4uqc8v7BThesjM=;
	b=SDVZTsYQMZSLijn3vMdNdqERqBsoPizqyePbsAV4bN+KoF3GKIZ+WHkkASEiFNsWw8GrH7
	ClCOINzWeYWlEqbtPK/YLS7Um6zSOaojYbR0ox6oQTPArorIRupKrA6sj7ivH9/UdpQj8A
	zXtoH6e+WaeAgiSfrcDrfK9gwABnH4k=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-j4sB0fCTMsO_KX5yRpATvw-1; Mon,
 17 Feb 2025 11:42:15 -0500
X-MC-Unique: j4sB0fCTMsO_KX5yRpATvw-1
X-Mimecast-MFC-AGG-ID: j4sB0fCTMsO_KX5yRpATvw_1739810533
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4235F1800878;
	Mon, 17 Feb 2025 16:42:12 +0000 (UTC)
Received: from gezellig (unknown [10.44.32.23])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 100F0300018D;
	Mon, 17 Feb 2025 16:41:59 +0000 (UTC)
Date: Mon, 17 Feb 2025 22:11:55 +0530
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, maz@kernel.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Steven Lee <steven_lee@aspeedtech.com>, Yi Liu <yi.l.liu@intel.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Alistair Francis <alistair@alistair23.me>,
	Tyrone Ting <kfting@nuvoton.com>,
	Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
	qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>,
	Joel Stanley <joel@jms.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Zhenzhong Duan <zhenzhong.duan@intel.com>,
	Hao Wu <wuhaotsh@google.com>, sebott@redhat.com,
	Eric Auger <eric.auger@redhat.com>,
	Ninad Palsule <ninad@linux.ibm.com>
Subject: Re: [PATCH v2 0/3] docs: Small changes to system/arm/cpu-features
 and more
Message-ID: <Z7Nm03NCxsCGPTe6@gezellig>
References: <20250213084219.2975727-1-kchamart@redhat.com>
 <CAFEAcA9MgeaCQspu=4dCusTQVP3KOvpze55vshPJCaNS_E43yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9MgeaCQspu=4dCusTQVP3KOvpze55vshPJCaNS_E43yg@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: fOJZM5Qa1zA8

On Mon, Feb 17, 2025 at 01:23:51PM +0000, Peter Maydell wrote:
> On Thu, 13 Feb 2025 at 08:44, Kashyap Chamarthy <kchamart@redhat.com> wrote:
> >
> > In v2:
> >
> >   - Add live-migration context to the PAuth docs (Marc Zyngier)
> >
> >   - Fix the Arm capitlalization (Peter Maydell)
> >     - Context here:
> >       (https://lists.gnu.org/archive/html/qemu-devel/2025-01/msg05137.html)
> 
> 
> > Kashyap Chamarthy (3):
> 
> Hi -- it looks like only patches 1 and 2 ever made it to
> the list. Would you mind resending, please?

It's strange, but as you pointed out on IRC: occasionally the list "eats
an email for no clear reason".

Now sent a v2, with a note at the top of the cover-letter.

> >   docs/cpu-features: Consistently use vCPU instead of VCPU
> >   docs/cpu-features: Update "PAuth" (Pointer Authentication) details
> >   docs: Fix "Arm" capitaliaztion
> 
> (nit: "capitalization")

Fixed in the re-sent v2.

-- 
/kashyap
