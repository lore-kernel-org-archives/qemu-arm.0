Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp501147nji;
        Thu, 12 Sep 2024 05:42:46 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVdasAY2HFGYGw99LLSj6GzS/5UL8w/hqUxuJOkhFPt2aXHjJ95U0h15poCEKx/HbkHyPdnf+y1Wfvy9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHILkcytsFPStWnieeG9eo0ZvnHTshNBhX91WmfXwJTf9kMfNcZXL47Ug/7pmnQj+7p9CBf
X-Received: by 2002:a05:6808:191f:b0:3e0:3d6c:116d with SMTP id 5614622812f47-3e071aad729mr1789225b6e.26.1726144966303;
        Thu, 12 Sep 2024 05:42:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1726144966; cv=pass;
        d=google.com; s=arc-20240605;
        b=f65FFmMMUN0dOY/5LaMa5cjBl9yRnnL9pvBrCfVzdYjN912bksCFYIXGR1Sc3cbwaC
         5//j2YYwYQIcqGV6Od+zcsBQrTB1bFTuI7Zdu95BI0+eJ6au9Nup8mQMraGZ9Uuo6avl
         LStTTvEcAbt4I6VkcXx67Atw2mx1QNzWq88ZEvyrrvpvGJWe2fjWdDjoQhEoyDQfKs7U
         2j1SWVtpZHGVMRgukVFIsPLdLMOc4qpBlLwXPLwj1c97LocODvwVZ03a1eEC1/CxAY5k
         tqjVmKOMW+A96RRA7TuXoSINz6m1dXYWsZ8536rqY5JcUG0x7c9ty+SUYAXLcbdd423S
         enWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=w8nfejZavA0hL03c+N7MeOGb8mfUCS+H6+ty6eZ3ps4=;
        fh=uvb+b7H0iDOFcu0aVcddCawuVT3VfWmx9NGS7WEa2YA=;
        b=eUvGX7J2Cpf0LXX5rf+0rhsYZmyo/j8fCISgceIT0KNIBjTvt+NRRlVSugAhQP712R
         5QbkpNd4bHl/Y5veTBPD+O5AIvU7UxSUZEVGpkYdjX3G4WbQIInvqIjEz2LKFJYrhdNC
         PoQqqqpiEb8JxtfvHmBCVl5jH8z4UTeKVe51PvZZZVv0Vp+PDLgWMPn0KzoAARJUnXnF
         L3Dep/N2DEYKI9YgPRuA9OJu5+5KmDAypUWtLHeC+C+mUPrQn8fQNrPYeHFqqWo7RkJf
         ZVBUxKmmoW9vJyhu+ZdV4KwGUfaK2P7QBVD3uP06A4QFtXbHMxbNEtlVaHqzaULfPY1w
         cjMg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NBvOjOA1;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-326516-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-326516-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-326516-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7db1fbb6881si2199938a12.210.2024.09.12.05.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 05:42:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-326516-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NBvOjOA1;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-326516-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-326516-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAEF42854C3
	for <alex.bennee@linaro.org>; Thu, 12 Sep 2024 12:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE281A3AA5;
	Thu, 12 Sep 2024 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NBvOjOA1"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CA71A3058
	for <linux-kernel@vger.kernel.org>; Thu, 12 Sep 2024 12:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726144961; cv=none; b=dOVjQwZDtzmoP7HOfLGDybm8H/zq4luC/5IqwabH8+TQSl3q29K4sFhisLxVKfQJUFwnzqeFwB9Lhfo3bJH1cfqAbbVHWXZJpEWTkXiGDyp0fAMhnRpJKbjb/xSQXQXqKGfMmlwjZM4TV2d14EuwhC+wbI2KS8xTjapw8lrmqO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726144961; c=relaxed/simple;
	bh=VYq4xvU4yXtQJ3rBOR+LudQqXvYNFmbEy4t22IVlRrw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q0ziSqQ+pn3xtPDn94FlJy1kc3AFIlVaxSDkFaIleebnaES/xeEC4H9Sc6N2gxLIJlRsoR6Ggy/eTRgPQOVM2IsOtx9WEQUoqNBx4GrQ4vUje+skm3qcvRcfK51tl8WMQPpVl4C6XPYx1v10JMZP/XcXVnW0CyjBE1KbNA3F0MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NBvOjOA1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726144958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w8nfejZavA0hL03c+N7MeOGb8mfUCS+H6+ty6eZ3ps4=;
	b=NBvOjOA1VCgAN4EJvV2VF6Dz225zYB6BeELMW8AQnA4pIv/yCKS8AZN6fPkHKYjHIe1n3c
	yQVrCFY4T6lEsEkjB5GCX1ta8wjdy/NuHys+213dbnAYZ9aeXHkzxZKFZOohRBbfQKMebw
	vWCWNFbzL/gh9nY1xJs9dfX/4VhF52Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-rxDHA49kMuao0rrkCfThxA-1; Thu, 12 Sep 2024 08:42:37 -0400
X-MC-Unique: rxDHA49kMuao0rrkCfThxA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-374bb2f100fso430676f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Sep 2024 05:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726144956; x=1726749756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8nfejZavA0hL03c+N7MeOGb8mfUCS+H6+ty6eZ3ps4=;
        b=nc0rPycj/oL9ao054pXE/iXXJ/msIyZNpjtdxsIzCidxwlXj56yfl7qm9uw/YO3JcX
         HpPlgx2fT1A3JLWfa2UGHecQkKnnYShSYrGIZJ4L+9MnR0nApmyV2wl0SIIaPNln6qa6
         bxB5cUdVQDRVCk/UMAT8PrcIWj/lJwXhzAIDwlb5X0pqKizNXsaRveLjZ8aIJ7n8cfUv
         trx5kj1jKjQ4r1gsfPYgxbe+XYV7fRLrwPo3g1cuPiZt3Jq21hcbsjm0jZxsivsi/0wj
         W0Mrk6h7eD0q/vZlw1f3NOkhUFxtYO7+GuvjaSutOm+tjcc9J2ktgszgh845cmN3rdbk
         2S/g==
X-Forwarded-Encrypted: i=1; AJvYcCV5ULWndKnvAU4/zWtn+MPED1p/HPRG1diZ5Vyv+22qe0F03AMLC9c3uWSJifcT/cJaBL6rUeVzrhjp1As=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ZbJv/kBwTM3M8mtMJjMjD0A1X+/V7bg0v/3axvSpwR9ibo1k
	0BQtG03ICYHr2DFVy8Nrwx4Ss6+h6+VZIccpnTtSpdeqPopyl7lnqwj4mRq2Q0IN4OSyyTCKFP+
	R3q6ZtFy4b0NmUAiH+dSnsOcKcGvSlQP/JCk8hDeZqe7OIHf8YDtxR5ZY1lt5fA==
X-Received: by 2002:a5d:42cb:0:b0:371:88e5:6d34 with SMTP id ffacd0b85a97d-378c2cd5f09mr1419773f8f.7.1726144955751;
        Thu, 12 Sep 2024 05:42:35 -0700 (PDT)
X-Received: by 2002:a5d:42cb:0:b0:371:88e5:6d34 with SMTP id ffacd0b85a97d-378c2cd5f09mr1419735f8f.7.1726144955123;
        Thu, 12 Sep 2024 05:42:35 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb1e3a5fdsm159348345e9.48.2024.09.12.05.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 05:42:34 -0700 (PDT)
Date: Thu, 12 Sep 2024 14:42:33 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 <linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v8 06/13] acpi/ghes: add support for generic error
 injection via QAPI
Message-ID: <20240912144233.675d6b63@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240911163436.00004738@Huawei.com>
References: <cover.1723793768.git.mchehab+huawei@kernel.org>
	<2c8970b5d54d17b601dc65d778cc8b5fb288984b.1723793768.git.mchehab+huawei@kernel.org>
	<20240819145136.0452ff2b@imammedo.users.ipa.redhat.com>
	<20240825052923.715f88bc@sal.lan>
	<20240911152132.65a7a219@imammedo.users.ipa.redhat.com>
	<20240911163436.00004738@Huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7vPTRLbk71nh

On Wed, 11 Sep 2024 16:34:36 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Wed, 11 Sep 2024 15:21:32 +0200
> Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> > On Sun, 25 Aug 2024 05:29:23 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >  =20
> > > Em Mon, 19 Aug 2024 14:51:36 +0200
> > > Igor Mammedov <imammedo@redhat.com> escreveu:
> > >    =20
> > > > > +        read_ack =3D 1;
> > > > > +        cpu_physical_memory_write(read_ack_start_addr,
> > > > > +                                  &read_ack, (uint64_t));       =
=20
> > > > we don't do this for SEV so, why are you setting it to 1 here?     =
=20
> > >=20
> > > According with:
> > > https://uefi.org/specs/ACPI/6.5/18_Platform_Error_Interfaces.html#gen=
eric-hardware-error-source-version-2-ghesv2-type-10
> > >=20
> > >    "These are the steps the OS must take once detecting an error from=
 a particular GHESv2 error source:
> > >=20
> > >     OSPM detects error (via interrupt/exception or polling the block =
status)
> > >=20
> > >     OSPM copies the error status block
> > >=20
> > >     OSPM clears the block status field of the error status block
> > >=20
> > >     OSPM acknowledges the error via Read Ack register. For example:
> > >=20
> > >         OSPM reads the Read Ack register =E2=80=93> X
> > >=20
> > >         OSPM writes =E2=80=93> (( X & ReadAckPreserve) | ReadAckWrite=
)"
> > >=20
> > >=20
> > > So, basically the guest OS takes some time to detect that an error
> > > is raised. When it detects, it needs to mark that the error was
> > > handled.   =20
> >=20
> > what you are doing here by setting read_ack =3D 1,
> > is making ack on behalf of OSPM when OSPM haven't handled existing erro=
r yet.
> >=20
> > Essentially making HW/FW do the job of OSPM. That looks wrong to me.
> > From HW/FW side read_ack register should be thought as read-only. =20
>=20
> It's not read-only because HW/FW has to clear it so that HW/FW can detect
> when the OSPM next writes it.

By readonly, I've meant that hw shall not do above mentioned write
(bad phrasing on my side).

>=20
> Agreed this write to 1 looks wrong, but the one a few lines further down =
(to zero
> it) is correct.

yep, hw should clear register.
It would be better to so on OSPM ACK, but alas we can't intercept that,
so the next option would be to do that at the time when we add a new error =
block

>=20
> My bug a long time back I think.
>=20
> Jonathan
>=20
> >  =20
> > >=20
> > > IMO, this is needed, independently of the notification mechanism.
> > >=20
> > > Regards,
> > > Mauro
> > >    =20
> >=20
> >  =20
>=20

