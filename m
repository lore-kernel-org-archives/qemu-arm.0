Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C96606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y/opi1mh
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMLNa-0007hL-97; Thu, 29 Oct 2026 04:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xMLNY-0007gW-F0
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 04:20:56 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gessingate@gmail.com>)
 id 1xMLNW-0007A7-St
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 04:20:56 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a214af2076so14756255e9.0
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 01:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793262053; x=1793866853; darn=nongnu.org;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=9UCTxJCqqA5MYAthVU4M5ES312L3tEWaOw9MGztoN58=;
 b=Y/opi1mhd682WYLUiN9RyodOWwvTrZeGW6fVfjumMeeDPp2ac+nz61pO98JxoffEFI
 0XVO7r+BwEdXzLUs29XwibzwktKOFP1DabVtitJSteoqw2JztXF9Oo+zQMCLnGHeZNUr
 OR/3H1ssH0re+1w7JLkv9SZZJa2j48dC/x0wNHVTq5II4GNAjUu+Bose5j110DObDDkq
 5sF/2zYRnzyhOUEiwUV6DckOU9YXPRZZzzaIF6GXmTFt8E7IiVXOT0G2SrAG3fpbbb2l
 o1IStgMAcswq8jE4chH9KttfRBersDfVaaQe9cp7TxiRALpqPxBQ5BvA6G+EA4edFJ4a
 zFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793262053; x=1793866853;
 h=mime-version:user-agent:content-transfer-encoding:content-type
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9UCTxJCqqA5MYAthVU4M5ES312L3tEWaOw9MGztoN58=;
 b=NJ14aZHckXIdyrUd1dcRx179Zwopb5/SG/kpwfLQHsZrMRCKXn62JgyxxBjeuRmOl7
 +z4IDVnjYWNG/lbVsNWMWGktYjyGAOz5RWuheMs0Is02zNl+mbOq7HAjlHOMxHk/nv0j
 2DLvWqn33js9GxO/OexTSSJAo/AefPFjtqmxl1cy66SQP0Kb8uRC8OO4L/FDh4D3Bq19
 0v/aMe7IEF4sbRUKgxcnsiozwhIVZRbF377egxofax/eRsrlapC+a+BjvrTQTk23T36S
 GT04/rcVEvfBWR2UnruJKNCmGmisGnTW/ZqkE1awT24FVFpiIxuGy8jADmiPZCJTAm7S
 5mTQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx4bfVZ8DM4XNGKxRLLwP3LbWc8haqv2Hy8z0LOhhm3F+cWBVQ14UOUn9ew6VT022oKImnxmbYzRw==@nongnu.org
X-Gm-Message-State: AFq9FYLI+VKfgtr4dlty6+Huso6H36QBjiLU29A1L7uBrF8S/3Cz+W9L
 c3wabMMp9BdC/CkSnmddlwYz887E+ucDLxPM6o/A2s1oyitYPu8umftN
X-Gm-Gg: AYBFou05KJLzwqQbCSKKT0GpzRrZ9Nx3MDjTvvH5FwUCxesyeQexZvgSJdymRfE+2Ir
 SFHen4jKYEFWgWNSKQsuzqZYQybdNq62hZiZbDUO1Jr5+cE+QfwbGcsVF13713x31Vj2MDpF01V
 7UUaVUaFvQ1BqIsRjpAWizthoTsJFiP8urhyuluUgN1EPHPy4i4SWscJgVZRU/pB4mghyM93G6R
 m2IuMHFGBNL+9dNKV0vou+W0PDfIuus3XWb0aC1VdlbB6yZohOjA1y8C6f7WwtbdtcQHZihDrED
 3I7pfZWGIUjyu/6tcx5dfNy3eAJcrvyBPD2nA6xy2utqnLGWLwMZrxUcj+c0F2FlPZpv0j3sfnZ
 fT//sWtD9mjCT3QspTstXuD4Bfu9jjrfZ0WOpE7Ee9hqUD+zAfBhi2LgBTnUgLgipZnHwVYPzAJ
 SHnEA+QyMIGYYtFiafv+1Eo3GsER0DBaieB741LSDe/zCeHOnGbYfgGsQ/8sBlqpUrpXkJYFmyn
 KYnLTzn6ku+zxinpr1mMJ6M1BpBBvcbWEDz9CC38sPkmgej7t+zcqIdK2pkgyYHUlrpgjULd7+k
 zwj+K9PYEJarbqfBj/fK8SLF0ji3m+iegS+JM4ZyJeZjqC4//zVxk4EIh4TOIwcRfPQ=
X-Received: by 2002:a05:600c:4692:b0:4a2:167a:c939 with SMTP id
 5b1f17b1804b1-4a9667756c9mr102884825e9.21.1793262053061; 
 Thu, 29 Oct 2026 01:20:53 -0700 (PDT)
Received: from [192.168.1.89] (95-24-99-141.broadband.corbina.ru.
 [95.24.99.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a969e61f9bsm72040585e9.2.2026.10.29.01.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 01:20:52 -0700 (PDT)
Message-ID: <c850cbe681b0328cf3c3f93140132f8363e253e2.camel@gmail.com>
Subject: Re: [PATCH v2 1/6] hw/i2c: add dummy device
From: Timur Maksimov <gessingate@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Jamin Lin	 <jamin_lin@aspeedtech.com>, Kane
 Chen <kane_chen@aspeedtech.com>, 	qemu-arm@nongnu.org, Fabiano Rosas
 <farosas@suse.de>, Laurent Vivier	 <lvivier@redhat.com>, Corey Minyard
 <cminyard@mvista.com>
Date: Thu, 29 Oct 2026 11:20:49 +0300
In-Reply-To: <87pkwtezsz.fsf@pond.sub.org>
References: <20261027-aspeed-i2c-nonpkt-fix-v2-0-07deed1dff60@gmail.com>
 <20261027-aspeed-i2c-nonpkt-fix-v2-1-07deed1dff60@gmail.com>
 <2629ee8a-e817-4764-a1e3-72e0ccbb978b@kaod.org>
 <874ie6ku2u.fsf@pond.sub.org>
 <5d219f231fb1f97c6d90cbef4068e82dff803a18.camel@gmail.com>
 <87pkwtezsz.fsf@pond.sub.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=gessingate@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi, Markus

On Thu, 2026-10-29 at 08:22 +0100, Markus Armbruster wrote:
> Timur Maksimov <gessingate@gmail.com> writes:
>=20
> > Hi, thanks for the review.=C2=A0
> >=20
> > It was my decision to use such API, I thought it would be okay for
> > a
> > test device. I don't think there is a way to expose integer array
> > as a
> > single QOM property.
>=20
> There are ways, but I need to know what you're trying to accomplish
> to
> be able to provide guidance.

We need to access the transfer buffer array with QOM. Actually, I have
a few ideas on how to do this without cluttering the QOM with
properties, such as using a FIFO interface.
>=20
> > Actually, we can go without this model. I suppose I will rewrite
> > tests
> > so they don't use it.
>=20
> You haven't answered my question on code-provenance.rst.
>=20
> > On Wed, 2026-10-28 at 11:17 +0100, Markus Armbruster wrote:
> > > C=C3=A9dric Le Goater <clg@kaod.org> writes:
> > >=20
> > > > + Corey for I2C feed back.
> > > >=20
> > > > + Markus for QOM
> > > >=20
> > > > The brute-force solution to expose the contents of the device
> > > > array
> > > > with 128 properties has a slight AI smell. I find it ugly but I
> > > > am
> > > > human :)
> > >=20
> > > Timur, have you read docs/devel/code-provenance.rst section "Use
> > > of
> > > AI-generated content"?
> > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 That said I don't =
know if there are better
> > > > alternatives.
>=20
> [...]

Sorry. Yes, I have read it. This is solely my work, no AI was used to
write it.

I also have a question about MAINTAINERS file. If we keep this device,
where should I put this file?

