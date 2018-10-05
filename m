Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp185165wrt;
        Fri, 5 Oct 2018 02:44:13 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62PMJQH/S1vW4bbSw4gGiiqtByFvKQKC2dcV70HjledEMPzCxHLXCcrIy3oDcKDjVnDAXXO
X-Received: by 2002:a37:e21a:: with SMTP id g26-v6mr8199611qki.330.1538732652965;
        Fri, 05 Oct 2018 02:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538732652; cv=none;
        d=google.com; s=arc-20160816;
        b=waPgBP+duVr1mZU1jc/F7FJbp5Wwf7ZiLHWJMEd8/+siDwyCwhD65UwePJDEL6hlf4
         4weALeHzxDyCXMPncFe8rfVmgcJMyIlB6nnJDse/0eb2+lTD92wUJRAVgXDuG6j13xut
         hBsxm9ohCIC+bvnJhmDu1prugqkeEY89w0AOjoQzC5sA5yx5fmQGOyPiSB9GrCGgmS3h
         AReTGLkYDcxaTIFX6w/MNqpjEcCT7OES5okWXRX4LkhKRedP5pbvISMgimW+MqUgt57m
         Lldj8o1nmJZUwWHZEhB3jhZydFDA3qt4D6CRH0kbDbG/s2o38IAm2RbTa8oFRDbfRkpn
         C2BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=S0zBk65XkmPFaxiGenC1IWk0o/hnQxKqTnW6KtxsRh4=;
        b=QEUrMM3AVmyYEoUJGoWtE18+m4ZArJ+EXydiI5a5fjE0EdIlqS3NiMUQLNQk5XcLBd
         Oqn5nlcWcxpDD7lhdAhM+URDezy++FAl7BT4HA2V6w7E5ZxtOuEtCZdrT5TJS4i+WAAT
         no7d/++5ibEne+eBD1FbziRxR51wl6+bSn5gFbvDtEDTejoUI5+aKALNtqTn7FLyUelZ
         zj1PmV5o/okyqMpYEUYBzQiPQ8eqbR9iDUyjhtiVdjXl0IGGtk6Tl9gw2kf1c+qjNtmV
         PzuUrdJnuFFPlffzvrNz6UjKr8W0U75FcsiKm0taR31rFHIBBMsjwSdqR7TkMJokiRsH
         Wyog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bv2deedQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l78-v6si5339680qke.136.2018.10.05.02.44.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Oct 2018 02:44:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bv2deedQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g8Mea-0006iJ-EU
	for alex.bennee@linaro.org; Fri, 05 Oct 2018 05:44:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g8MS3-0001qo-0N
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 05:31:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g8MDr-00021L-B8
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 05:16:36 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39043)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g8MDq-00020T-Fv
	for qemu-arm@nongnu.org; Fri, 05 Oct 2018 05:16:34 -0400
Received: by mail-ot1-x344.google.com with SMTP id c20-v6so12042453otl.6
	for <qemu-arm@nongnu.org>; Fri, 05 Oct 2018 02:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S0zBk65XkmPFaxiGenC1IWk0o/hnQxKqTnW6KtxsRh4=;
	b=bv2deedQ32jZzJXnrhtiRv5z7wrOWizURK9xwg6nAS+ko188ph0h5rzgjYivivHYIa
	sDYX4VQwWsN75AxMG86zg7fD7zPdAyAZyioH0ZM4WdGjx7DfN3Pp/urHNor8auGvmrWy
	A5t4HsytPnPz7zP0EiP92XPQ/E57Dh34INXNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S0zBk65XkmPFaxiGenC1IWk0o/hnQxKqTnW6KtxsRh4=;
	b=QFF0GPdjELV5qNveAwzWxykCMzzk1f+pEu7hJ7//LKdNFeJEmLq8TUVfC6TaDmnsyX
	f36qWxJuocgkJmDMjZNnPQWt6HtuC8rSn9kRbx4LBE2cO4xSgTm0wQ0o7T2Bv9JtGC8U
	3TbdxE2GhJYgKLXxc9Ms5jBZn23n+QJO6P1f2/B3NSqjID+UmOj7tsjT9/3yWcQMIx6M
	WMjR8+BAiHENf6ZBWYMCGYL0qvmGMbkSo2h5HgLqJXIuELPKEKdcX/2Gzf5WbR1R9rIm
	BXsR2GTdHSe7u2gRN3DDZHYE150ZT1rktpIMD5Ilo9PN8jcZkJuY+hH+j58Lj5PqIwAO
	aV6A==
X-Gm-Message-State: ABuFfohAYowwFKTyT+BLEl/zBneEWG7ALNV04B977akHyn4yPohVnsAN
	I+5+1erW9cnaWz4P18gV/7sY8d1kH3bO4aSE5OcZfw==
X-Received: by 2002:a9d:44d7:: with SMTP id p23mr5896969otg.316.1538730993020; 
	Fri, 05 Oct 2018 02:16:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Fri, 5 Oct 2018 02:16:12 -0700 (PDT)
In-Reply-To: <20181005080729.6480-1-jerome.forissier@linaro.org>
References: <20181005080729.6480-1-jerome.forissier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Oct 2018 10:16:12 +0100
Message-ID: <CAFEAcA9h7_vaKk7GuGVWv2_hFeR=xC4ZgJzLuD+iSqCdwa1PSw@mail.gmail.com>
To: Jerome Forissier <jerome.forissier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt: add DT property
 /secure-chosen/sdtout-path being secure UART
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: tee-dev@lists.linaro.org, Etienne Carriere <etienne.carriere@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YhTcaZ3E1aDd

On 5 October 2018 at 09:07, Jerome Forissier
<jerome.forissier@linaro.org> wrote:
> Bindings for /secure-chosen and /secure-chosen/stdout-path have been
> proposed 1.5 years ago [1] and implemented in OP-TEE at the same time [2].
>
> This patch creates the property when the machine is secure.
>
> [1] https://patchwork.kernel.org/patch/9602401/
> [2] https://github.com/OP-TEE/optee_os/commit/4dc31c52544a
>
> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>

The patch seems OK, but it looks like the DT bindings are
not upstream yet? [*] I wouldn't want QEMU to start creating
bindings until the spec is definitely final.

[*] they're not in
https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/secure.txt
anyway; is that the wrong place to look?

thanks
-- PMM
