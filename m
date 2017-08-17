Received: by 10.223.183.22 with SMTP id l22csp1978258wre;
        Thu, 17 Aug 2017 03:47:08 -0700 (PDT)
X-Received: by 10.237.46.38 with SMTP id j35mr7118258qtd.285.1502966827300;
        Thu, 17 Aug 2017 03:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502966827; cv=none;
        d=google.com; s=arc-20160816;
        b=LtIYg+y5gnevwNLnyiIIw6CgYgsuh4hOtoWLwxhrxxUEd+eMf2U5WHdv2UYMfJS0zc
         oYZAVQnIdFbQvhFgZPeBkF1EEMRcq03sIJVPnaVa8QGJOkYg+9tQ2XqN66SAnxk6K0rZ
         qHIEFYB+9OMh6Qe7OB6eq/J8lFf8bGxceqW99Ur87Tvbtbpj3mAm/5h0l2n4QIsR7LJX
         m1+lxEVmME10y9751MFxY21oojFROn/7bVJdq5tDZ1YOU1smZJe768u+IdJ4iA3/wzL/
         dyOQBbxbXaUUKoDi/GTve2Dz2YgQZdQbbv7BnPrv5FZZ5G2p8XZoNfcMRl3mEFc5w/mJ
         OOtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=B5SlY4HnWxa6VcmTq1fdirtO781fN0N5xrUIp3u9iiY=;
        b=WuNCbcJ1F6d5APRgHhI1n8zZaje3SVAyqyzURavhRHmdMhn376WIwyY7Cm5N1Gb/cP
         iHwuiDblN3U+9NeO7wcZDyVM2y3C7yIljTp1n7lOIRIx3kGtGGjHI9LymFQ9p9lWm2Of
         uQ484IxJX/XjCTB7zvqHkgHRUKMkdGc6hsBvaVjc2v0u7xGDX5EQ0g1GUhqh9GlMSeAC
         OMSoAfXv/uAqd0RrerCiROVzX4dId4vLW7hPcBa3doLzq4kAEsizz+0WZ6P434KuGUTe
         4XC3e+1J7/gKQqE1WtbbEmGiCb59NXVnO2hd5tS0oVnV3FeVj4VsxdOHH+8sC9Ov1+r7
         TmdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fpM6fMnQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z1si2609935qta.544.2017.08.17.03.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Aug 2017 03:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fpM6fMnQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44262 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1diIKO-00071H-R2
	for alex.bennee@linaro.org; Thu, 17 Aug 2017 06:47:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1diIKK-0006zG-2O
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 06:47:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1diIKJ-0006Lp-7I
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 06:47:00 -0400
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:33815)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1diIKJ-0006LM-0x
	for qemu-arm@nongnu.org; Thu, 17 Aug 2017 06:46:59 -0400
Received: by mail-wr0-x22a.google.com with SMTP id y96so36733276wrc.1
	for <qemu-arm@nongnu.org>; Thu, 17 Aug 2017 03:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B5SlY4HnWxa6VcmTq1fdirtO781fN0N5xrUIp3u9iiY=;
	b=fpM6fMnQseJqBDVSBe5LVXy1yL4KL7G+nZrZZRmENU8GlFjipTP7jVXGv3iko1GvVl
	CHLU9PGYop2MNpxeQs85AL0lU1kc4cQeRn5JCCIKMBd8/4akuuvqinu+QV1JInvXT4gn
	esqjaaY92cCK3eK2h7nheG917oNbs+YABq548=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B5SlY4HnWxa6VcmTq1fdirtO781fN0N5xrUIp3u9iiY=;
	b=n2XWwdYNMOVa+KLK6ZZ1lpfpWi/tamivH1IIcaelJAdq4iMz0d/ALsGZeOCBPXO6BP
	aIebkrEmX3uoo9OX0BkXQ3ciOyT2r217eis2bdta+9AJYCXfVsjEHykWIlNlEiGYuHAq
	xke2OjY4srq1CR19TS4iYaBBWEUKfr+qEkxKRINV5kK+n8baTif+GtYbI9rTVv55sEES
	Xc0KF50/GaslG/E/X2o17TEupGRhYhXePcYb74VmBpOso/upFeeruw4w0s3CEXxMf3YV
	eftkpjG1xUScLoHQUxJWMxSd6UgZHAwBpFz16l3oAZoHI6bsUneS1llNcKN9hxS905mk
	R0cg==
X-Gm-Message-State: AHYfb5hjH7lGufZP7E5XdmdJazEOhmcFT6QMitsmlMDidgpyp3jCKuGR
	ajUsXpnPDVGKqrhUlbnUDy/eGyKwD7uavQ0=
X-Received: by 10.28.193.10 with SMTP id r10mr614136wmf.157.1502966817911;
	Thu, 17 Aug 2017 03:46:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Thu, 17 Aug 2017 03:46:37 -0700 (PDT)
In-Reply-To: <20170809062828.3673-1-andrew@aj.id.au>
References: <20170809062828.3673-1-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Aug 2017 11:46:37 +0100
Message-ID: <CAFEAcA-fQ+=ckEJJrOWDVLdEpEi_UxFZ0yySkhD7=k6dHrFCfA@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
Subject: Re: [Qemu-arm] [PATCH for 2.11 v2 0/2] wdt_aspeed: Support reset
 width patterns
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
Cc: ryan_chen@aspeedtech.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZWLlbDm8L/U0

On 9 August 2017 at 07:28, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hello,
>
> These two patches add support for the reset width configuration register in the
> Aspeed watchdog. Initially this was just one patch[1], but I've reworked it as
> two to explicitly support the varying capabilities between Aspeed SoC versions.
>
> Andrew
>
> [1] http://patchwork.ozlabs.org/patch/796039/
>
> Andrew Jeffery (2):
>   watchdog: wdt_aspeed: Add support for the reset width register
>   aspeed_soc: Propagate silicon-rev to watchdog



Applied to target-arm.next ready for when 2.11 development opens, thanks.

-- PMM
