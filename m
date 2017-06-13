Received: by 10.25.0.23 with SMTP id 23csp332029lfa;
        Tue, 13 Jun 2017 06:56:36 -0700 (PDT)
X-Received: by 10.237.48.80 with SMTP id 74mr18565229qte.10.1497362196107;
        Tue, 13 Jun 2017 06:56:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497362196; cv=none;
        d=google.com; s=arc-20160816;
        b=q3w9CYRUUpjBO3QL0duZXd0B3y4BfFSY44FXIm0CzfGorSXoFjICSYkHlLbsqIAiPO
         Rw6Dam/bLp8neb62R17FwvuPyTqL0+bfB6sudBm1XQnF72Z+Fo9I8rIGW5S5ze6caZmT
         T0104pwgU00tRb51h/XLtpl52XSdQgMh74SVyLDRYiw0wIaMZg7OzEOZUf4pIUCmbOBF
         m3SskLqUlaA1LixkHeT1GdAzuijTXx8dX0P1AokDhQBWbFOeG6lKGgnfaHhk/1JscHPy
         N70NCOQpv48bJW9EwwcBNdLqrtknzmUrl/pdJQSokGyXSNAvyAXve1MT5gUube0a1c+0
         xpiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3DKqN5RR5a7kf3YCKadheEI36zdBadfzalJhCvL7ff0=;
        b=czAtSVPFNWg73fvpJX3bp5mmKMZ02baLup3g28OyTeKeTEKcXIouQhi3YyPMU5XStI
         7nXITy0qcTSaLNPcJ+s+40V60PkCBtGgZ8USiyj5qZPNKPlhslE9e4gZMKTV2y3oBfAC
         gmbzUhg93mY3SmYTbqgKipDw66k6pCxkSOiZnz9m9CjYN24DiXSjpHr0kO3z8ZdihjMw
         jnvhzA+TrwEi7zQL7rjCiCwhfqzIIK/cOH0cUV5KZ/P33qFbWX9VSGxDnvMUd40qwaoJ
         1+BZXQt45HL9kfNYguJKP4GmudLfFXXEsS6x7sK18Xm+hAeHF/RACqvn/aivCuZJDv7R
         RQgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t54si11728109qta.166.2017.06.13.06.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Jun 2017 06:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dKmJ7-0007y4-Ep
	for alex.bennee@linaro.org; Tue, 13 Jun 2017 09:56:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dKmJ3-0007xu-V0
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 09:56:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dKmJ3-0002Jp-Ax
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 09:56:30 -0400
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c]:35153)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dKmJ3-0002JL-4o
	for qemu-arm@nongnu.org; Tue, 13 Jun 2017 09:56:29 -0400
Received: by mail-wr0-x22c.google.com with SMTP id q97so144815250wrb.2
	for <qemu-arm@nongnu.org>; Tue, 13 Jun 2017 06:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3DKqN5RR5a7kf3YCKadheEI36zdBadfzalJhCvL7ff0=;
	b=QEdThzJqojERLOUiynYHCeEfbCCdalCk2iuySkZFKYBNGaMFQ7BZw5RLRMF9VXgcub
	xPp/fETnxDpemWE5s8hzOuESUyi9PnwsadmOUFF9PWj4uc3bZqfJeKDcq/rUBLQBidfQ
	ocYS3LFy9pOkaSdJlMQ9wHLcMuvvBTZRkl0z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3DKqN5RR5a7kf3YCKadheEI36zdBadfzalJhCvL7ff0=;
	b=AXiexAqAYq090kGKgSj4A+mHu1ZniY9wlFz8sDk4mSMFSdw7zJElFlHQWD3QqYTany
	FIqrs6ln2XovixJlh9CJeg62yylUyaY+oO7mYBVUXEddDIG1ApK5J/i4TOGgWWMK4SkQ
	rN3kzyU+5De/8qnPhtl4njbm8VJde3VIV/lxzOYTkigO2lvwFgZRrMeTXULF9bWncb0x
	T38stASciHgPYZj55QkbVMBHQi1x8mXkVSvjAS/mXXOCR1BHsD6sN1H9WvAqhypg6tJ8
	RsBNGCIKd+uKBEEGrHSIBi1LrBlBHjAx6Qk9AFpD3JZtlw3udYVzzU4EZL35lDoTeVNE
	NrMA==
X-Gm-Message-State: AKS2vOwuho58mIz9PJ6EwgDdZTdh6Ev6coXRpp6ppws95mBsRzXoiMBL
	gmWBCX0tFNsO9iJfAJwXalbgWYPiJcJj
X-Received: by 10.28.24.202 with SMTP id 193mr2951777wmy.125.1497362187559;
	Tue, 13 Jun 2017 06:56:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.55 with HTTP; Tue, 13 Jun 2017 06:56:07 -0700 (PDT)
In-Reply-To: <1497023553-18411-1-git-send-email-eric.auger@redhat.com>
References: <1497023553-18411-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jun 2017 14:56:07 +0100
Message-ID: <CAFEAcA_W8KMDTLdrwk4eaLXf=_r4b7ZG-9VrFVK86WFe8QOY6Q@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22c
Subject: Re: [Qemu-arm] [PATCH v6 0/4] vITS save/restore
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, "Kumar, Vijaya" <Vijaya.Kumar@cavium.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WIOAIvLpEgRY

On 9 June 2017 at 16:52, Eric Auger <eric.auger@redhat.com> wrote:
> This series allows ITS save/restore and migration use cases.
>
> ITS tables are flushed into guest RAM on VM stop while registers
> are save on pre_save() callback. Tables and registers are restored
> on ITS post_load().
>
> Redistributor pending tables also are flushed on VM stop, independently
> on ITS tables.
>
> That work was tested on Cavium ThunderX using virsh save/restore and
> virt-manager live migration.



Applied to target-arm.next, thanks.

-- PMM
