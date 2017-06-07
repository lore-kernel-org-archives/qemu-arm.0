Received: by 10.25.0.23 with SMTP id 23csp2122239lfa;
        Wed, 7 Jun 2017 07:40:28 -0700 (PDT)
X-Received: by 10.55.51.202 with SMTP id z193mr33483058qkz.22.1496846428788;
        Wed, 07 Jun 2017 07:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496846428; cv=none;
        d=google.com; s=arc-20160816;
        b=jx02UeeXSY8voytarYDQHE29gUJEx7+Ag9ylvE0mEL7hzIQeI0TLLzjthM2PliepUI
         Xt0FYUvmK7Zibkis5c3O7r39JBzDCIpXE6+hKBSAKAcaB9ZlVK8uxEw5uib9ca+vBXBI
         kbYr65fa4m4N+qyyIzW3YyxhgfXF7RyaDHl/Jbiz/6HxZQa/6KXGNZxpTZH1mCnsjgkS
         XTpUnNNNKfGXyOg7V3hAYH+V3cMVQ5TO5uXpHsibBrxu/GBPXqv96JW2NPBJ0GuLbpNU
         vRsG3RHTGWi0wYRl/ZP5z77iiPVV2dro6WsDsT6R2XF3g7i0lrH29K9IHNEhrXhdldTD
         kleA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=QP/nOZkpAR8DTBmHT2z3KXwVtle/j6oFcqdvBRhXkq0=;
        b=fb72qAMGgDAabI2KBtNyn+moCfbZil2aw3bwG/VBFpzeIkdVUqbTEuQfPzgg/cdlGr
         AGr32Vn4haOJfxx86ce/2uT2R7n6C4qOhsZKEZk19f0U4dVy3EqN7Pk/98Kqa8luMqgt
         Zw4jicPFxmMGkXCrWEqB1ZZeINlSfuC8K7i/JH9wclDXoBkwzrn2ec98UnA/SzVjS71v
         T+craVfjvjX/ESntkJOf61m9QDtVHoSZzpjVb7UPT5w6Eb2va302AOEWG+O3oiJ3qaeO
         cN432f/3x0tQmfvgZkYKlidkT81qq7DOHu0wtrxi+Gjy4zMYoDSQdcHcDDIIz4kgNnDS
         PJJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o11si2146183qtc.282.2017.06.07.07.40.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Jun 2017 07:40:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIc8I-00076C-5X
	for alex.bennee@linaro.org; Wed, 07 Jun 2017 10:40:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dIc8D-00075f-1V
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 10:40:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dIc8C-0001rr-8i
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 10:40:21 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:33268)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dIc8C-0001ra-2t
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 10:40:20 -0400
Received: by mail-wm0-x230.google.com with SMTP id m7so33582278wmg.0
	for <qemu-arm@nongnu.org>; Wed, 07 Jun 2017 07:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=QP/nOZkpAR8DTBmHT2z3KXwVtle/j6oFcqdvBRhXkq0=;
	b=WjUjf9fkMEc5gverr/1ERe71U+4T7WiN8G5IvmKATwgmVsRFok+5fJ2ObzFiX2fsph
	A7qQpw1ACTYvixW+/u95ePeSC4AWEOAGjNmQ9R9BkRpokiZ99/2rY+lxMG0Wb9D9h879
	xAFZyzzVjSLK8iFZtRxh7PFExqtxFc3BlRd5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=QP/nOZkpAR8DTBmHT2z3KXwVtle/j6oFcqdvBRhXkq0=;
	b=cNceJEZuDhlh9JB5mbKvy5+V0ouP1AcgZZsoIU7HCDmCmkX7UFkySCtgRnB/gLo7IH
	N6OnZT+BJ6QlN4S/e+kkeCC4aTPUV9/wqUJmh/tzMpAJsA+a4aGRXj1F2SsQMO2TSfeI
	663ihMjOkjzpMfXIurd2u4kuF3p+79MAPipOTL3h9A2khXrnwlMRbgtgw1Qk7UKUB9uN
	dQ4ajmiZZMCCbtqwxjfdYCArDfCY9uTt6ChbVsAsUGWEcMtZDPevWf2/+DyThU/EakJw
	B0ZYOYP8lyRimG8yIezrkVxclqe8aPXIvTx1cRzXVpxfoFamdZFZjOd1H/gkiYPvoTSm
	9m3A==
X-Gm-Message-State: AODbwcDzdSfJHubgz0oqeWnd35AmJh5PltrStEEBiHKJHxor0p3M7PTp
	dgj0iFjKA6HiBTUBcZdlLjjhTNCjh01M
X-Received: by 10.28.72.7 with SMTP id v7mr2645985wma.125.1496846418759; Wed,
	07 Jun 2017 07:40:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.55 with HTTP; Wed, 7 Jun 2017 07:39:58 -0700 (PDT)
In-Reply-To: <1496739230-32109-1-git-send-email-clg@kaod.org>
References: <1496739230-32109-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Jun 2017 15:39:58 +0100
Message-ID: <CAFEAcA9ipPsZm9Vvbie-V8tw=SQKGvPS4B60K1z8ZdtmReU+tg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-arm] [PATCH v2 0/2] aspeed: add a TMP421 device to the
 palmetto machine
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1c0mf4x07Mfu

On 6 June 2017 at 09:53, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> This series fixes issues in the TMP421 model previously sent and adds
> such a device to the palmetto machine.
>
> Thanks,
>
> C.
>
> C=C3=A9dric Le Goater (2):
>   hw/misc: add a TMP42{1,2,3} device model
>   aspeed: add a temp sensor device on I2C bus 3
>
>  default-configs/arm-softmmu.mak |   1 +
>  hw/arm/aspeed.c                 |   9 +
>  hw/misc/Makefile.objs           |   1 +
>  hw/misc/tmp421.c                | 402 ++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 413 insertions(+)
>  create mode 100644 hw/misc/tmp421.c



Applied to target-arm.next, thanks.

-- PMM
