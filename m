Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp1371518njc;
        Fri, 14 Feb 2025 07:07:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMSUEm8Nx8v6+bqXv7fbpVSu/FT47em7kY9p4UOjouw291d2OLgorHZT+52gpkW6VHxKzS
X-Received: by 2002:a05:600c:3b0d:b0:434:ff08:202e with SMTP id 5b1f17b1804b1-43960e98d5cmr93848765e9.8.1739545622786;
        Fri, 14 Feb 2025 07:07:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739545622; cv=none;
        d=google.com; s=arc-20240605;
        b=dY/1gsUkUtK8PVi4W16m7V8Xp5ii+pbD//BlOARBQx1poQZWFmQjsrycBM5OsDf7uy
         c4N6pCz6www/5fh6y8hKi7+XkZMEA4trtCO3u7tb0LL1NPNWz/m4CPX3MLCBsWoRi3iU
         UzeKi35ppuxZfR+S8pcKvm0czbB8L+UhaYM8SRiLQfSTFE94YiBn1wL38/sBNISDES0o
         lo244sy36sqZwc206w7gUbPiHYo8GdbeNt8IYpAi/dJysIPFX8X34RCWJJNlA4Fh1uj3
         CDtCnBYguZ4/MsAj6jxvMBALM2M5/O/O8KjtWSHOIq7MRcAG85aDF67VU7ln4tUsXAyJ
         XMAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=jr/nu0gmy2vwNLaPbJCFNJlI3FptA3Fz3pf+mSERcgM=;
        fh=fcBDm8jkb8fu/WfFWsdgCBc/xYH+lf37ujPvHo08FQg=;
        b=Pi2Fmu39xOlyvhLpzF+Zrd6GVTI922Id81dnh5BzMRwfgQYI36Gdt3pON15qWoclQM
         ypBDxg7579YE69YdBBZCG9q2mkmz1gvlIqr8q4i57Cz2SvCZpFk9Uo4oQiDcRE4VlLVZ
         jCVGxn/o4hGZXM+XIQ06EXzuC9uERVt27OQNRcJ+Jv034O1uJINdBxMzLXhsRJdY4SxN
         DoEpB9RkM6P1lzv2g2DogoYIEX8zD/JnGc7goJBay+ISqSV+JKjLzGUiLuNabD5e8jT8
         VqXDnaUhsZkMv4SRIk/T3XfHdWlsOWZ1XeZ/Cys7bEKF1RHXnRacEWHHJbxthUn6BRG+
         +fIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=daDSVuDG;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kchamart@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-43960820663si37623815e9.1.2025.02.14.07.07.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:07:02 -0800 (PST)
Received-SPF: pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=daDSVuDG;
       spf=pass (google.com: domain of kchamart@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kchamart@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739545621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jr/nu0gmy2vwNLaPbJCFNJlI3FptA3Fz3pf+mSERcgM=;
	b=daDSVuDGYzd5QlF/SnpLNcvr3Jjl4UPHjvegWOxspXvDwOo5ViKvNgsi6Nb9vf4W14CgY4
	T1VTmrkgmVHDu8NYPeNbAnL2FDwMCSCQjDznhM9KUxigO93bGBBZOSlipuMRRl43WqQ5xW
	p0FQdTY9+GjeP2x0bD4h21n58ZQlGrc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-aKO2M2ZlP-OSJkNwqkHyYQ-1; Fri,
 14 Feb 2025 10:06:56 -0500
X-MC-Unique: aKO2M2ZlP-OSJkNwqkHyYQ-1
X-Mimecast-MFC-AGG-ID: aKO2M2ZlP-OSJkNwqkHyYQ_1739545613
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 643A51800878;
	Fri, 14 Feb 2025 15:06:47 +0000 (UTC)
Received: from gezellig (unknown [10.45.226.6])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F1DAD300018D;
	Fri, 14 Feb 2025 15:06:25 +0000 (UTC)
Date: Fri, 14 Feb 2025 16:06:20 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, maz@kernel.org, Joel Stanley <joel@jms.id.au>,
	Ninad Palsule <ninad@linux.ibm.com>, qemu-arm@nongnu.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Jamin Lin <jamin_lin@aspeedtech.com>,
	=?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eric Auger <eric.auger@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
	Hao Wu <wuhaotsh@google.com>, Tyrone Ting <kfting@nuvoton.com>,
	sebott@redhat.com, Steven Lee <steven_lee@aspeedtech.com>,
	Zhenzhong Duan <zhenzhong.duan@intel.com>,
	Troy Lee <leetroy@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH v2 1/3] docs/cpu-features: Consistently use vCPU instead
 of VCPU
Message-ID: <Z69b7M8PkJ4AFtXP@gezellig>
References: <20250213135032.2987289-1-kchamart@redhat.com>
 <20250213135032.2987289-2-kchamart@redhat.com>
 <87v7tdpn5z.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7tdpn5z.fsf@draig.linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: IX4dMOpf7lVU

On Thu, Feb 13, 2025 at 09:09:12PM +0000, Alex Bennée wrote:
> Kashyap Chamarthy <kchamart@redhat.com> writes:
> 
> > Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> 
> Should we add vCPU to glossary.rst?

Ah, I didn't notice this in the tree.  I can add as a follow-up later.

PS: I sent the patch while on a train, `git publish` was acting up.  My
apologies if duplicate copies of this patch series land on 'qemu-devel'.

> Anyway: Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro
> 

-- 
/kashyap
