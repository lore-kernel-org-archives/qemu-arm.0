Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp923878wrt;
        Wed, 28 Nov 2018 03:43:00 -0800 (PST)
X-Google-Smtp-Source: AJdET5esK/aAJw4WtDAUaic5HENM+o4Z+DIkBSWV8UV6mFvd772Dzsep7CvQGLte9nfJpnWjf7Se
X-Received: by 2002:a81:ac15:: with SMTP id k21mr37425048ywh.460.1543405380051;
        Wed, 28 Nov 2018 03:43:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543405380; cv=none;
        d=google.com; s=arc-20160816;
        b=ySQ3VbpZQ9dO4ECSDVX8n0kpXOwn+mjmYSxPCLaEGVxWfA8Yiy22badJZnD/mquJVj
         fBLPS5f2Yz6M0Z011UDyvWe7SzmaWbI96OM4fcJk2ernLpkrw3O8kzdTPEMpRK/T5UMU
         /9QqyzxZ2nf5EqQO8T2/0HoQnJjQaP72QfqT9h7GLyVPnHMDm3HPSelT0eOQl4Ro5KCG
         XDUCam1SS9sMMyVSB5f5hEjaz/ZXPpekhXDA5iuk/mH5sSO9i42OxGNUIAvdLv9sTTkp
         ZUaZQ4FUszpeTZIPp0ooq1qlgeOc/Lat+U6NR4A4bO10z/oZkCletboHc2UlUFOUKJ5E
         EThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sq5mkxMSKYMtxXVfKG8TxNiUD9ofP/GIiHFvRKjaMCQ=;
        b=qqQdJaHM9/5Ibg4Tx4/vHt1PDurffnfKnXGpdG8e4sB52v/fVhNZn90bH+GdjsXELJ
         JF3DlgCh48E7I+SDJ4jmMKYk3JC2FcbxLbsl/tTF5Fvt8xZsPd2QRCsw/7WfOn8Oduib
         ccRbnZC3Zmd5CP4Dijve2hxpX9fW4Nzyn0GHrKb3G4n4KsSrkxbw2I6bcHyiRh+eaYDs
         Xqatstsk6qEl0T5FMxAt4F3YALE9RKjmGIOaKVp+VV54rPVWwnWrJNCOjLnDvlaeX+vM
         mj5Q0O3LtscIm8q6LD06xZrq4RoECbPpkC1BvQyV0XXMtmRVhhbA6rxub5zBrGEDom5A
         fP9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iInOJuCu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 124-v6si4586914ywb.158.2018.11.28.03.42.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 03:43:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iInOJuCu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRyF9-0001GW-Hl
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 06:42:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRyCT-0007pN-Ln
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 06:40:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRyCR-0006TJ-Tc
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 06:40:13 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33824)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gRyCQ-0006SL-NN
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 06:40:10 -0500
Received: by mail-oi1-x243.google.com with SMTP id h25so22306124oig.1
	for <qemu-devel@nongnu.org>; Wed, 28 Nov 2018 03:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Sq5mkxMSKYMtxXVfKG8TxNiUD9ofP/GIiHFvRKjaMCQ=;
	b=iInOJuCuiPX9XxD4ft08QzM/++69HCNmXbCZgdURMYtl7R7DdVBuMGSfHt/Fy7Zvr1
	sRTNPqGH5O4mzccWc2mqizuae7my6jmSPBS1FVPKrzHKgRNgxIkbZYqUhDnqvUfoCkeo
	oLXTCdiHb3oKG5PfyS9x6yoRRMMNbVo3PkRyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Sq5mkxMSKYMtxXVfKG8TxNiUD9ofP/GIiHFvRKjaMCQ=;
	b=CNLhV3xsyLwNARcn7+iw/i0fSfpSQFuUh/MCADaD5IPunpvROrVlHwx3n0j3wrpMvX
	oFVqYn9nQXoAioM3YuVJap53lAYdMwxPViId+h8NhN8KyhhFg+S6ad+IF1Tue5eNZUMH
	xt6s8naQ6KUMtecieJ/33GaNePP1/cZc/OKzNq2rfjY1CSnvse8Xmc+WsqTlmYhmKYPw
	id2N/kR/q3ENEW6SeEi5cGx4UULeeC+IppzCyLxhSKTReZS3X2QVfDQty62JB0uke6ot
	GLej2zX427JZq6JqWaRhYiHeMgXgHDFiUX8Ooyk8qHCwRneOrEzN7FfAE49O5SgZeZXr
	BH+g==
X-Gm-Message-State: AGRZ1gLxH4OW01ZNK9HoRF+pVoBCwXrAsGGnIiQMOy6q38hEnCOlt+uL
	dM8gW/6QuSsUcgiubRlP+FHxbB+o8SSz6PCGWbDWbg==
X-Received: by 2002:aca:ed92:: with SMTP id
	l140mr19167858oih.112.1543405209458; 
	Wed, 28 Nov 2018 03:40:09 -0800 (PST)
MIME-Version: 1.0
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-5-sameo@linux.intel.com>
	<CAFEAcA9wvrnshOTYz-jZ0n6m7SfusYY+bnB-iPnQuVNqqdg5Ww@mail.gmail.com>
	<20181127153551.GC4393@caravaggio>
	<CAFEAcA9B5DPeot26-oGtR-h+xdfg+tmUPrYpKhaneaT1tr1yqQ@mail.gmail.com>
	<20181128104024.GD4393@caravaggio>
In-Reply-To: <20181128104024.GD4393@caravaggio>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Nov 2018 11:39:57 +0000
Message-ID: <CAFEAcA-G3_uhH134_n8yobkJQJ7pOvu-vpLe9MkwVp5DmJOeag@mail.gmail.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-devel] [PATCH 04/13] target: arm: Move all interrupt and
 exception handlers into their own file
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Eo1oC9bu5GvR

On Wed, 28 Nov 2018 at 10:40, Samuel Ortiz <sameo@linux.intel.com> wrote:
> Given that this piece of code effectively builds a dependency to TCG
> from the KVM code, I see a few solutions but I need your input here. We
> could:
>
> - Decide we don't want to support --disable-tcg for ARM. We'd then carry
>   this patch serie from the NEMU code repo. Worst case scenario, at
>   least for us.
> - Manage to implement exception injection from userspace without TCG.
>   Would it even be possible?
> - Offload exception injections back to the kernel in those cases. I feel
>   this would be the cleanest solution but may need kernel changes.

The kernel folk were firmly against 3, IIRC, but you can go
and have the discussion if you like.

I don't really see what the problem is. This is just a bit
of code that's used by both TCG and KVM. Therefore it goes
in the binary whether TCG is enabled or not. Other functions
and bits of code are TCG only and therefore don't go in a
KVM-only binary. --disable-tcg just means "remove the code
we don't need"; there's nothing special about these functions
that says "they're really TCG and should be removed here".

thanks
-- PMM
