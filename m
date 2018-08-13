Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2725863wru;
        Mon, 13 Aug 2018 02:59:04 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyrhbTLqdAMlnA6aJ1M+sVMHNoX3cv0dSf37prTer1b8lYpclYSp9u+p1sYfwoMOagD8+tz
X-Received: by 2002:a37:be82:: with SMTP id o124-v6mr15062845qkf.266.1534154344305;
        Mon, 13 Aug 2018 02:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534154344; cv=none;
        d=google.com; s=arc-20160816;
        b=ASjnxZmVgIz18uXXAcdl/toblh6GYfYp27ktQHP353Cpsd4tR5bOZWEL08TtnXEk2n
         VSgV6B59xte830D+4hfGcjE81PHpzw6H4IvJIjafKPGJGlVnVRX3WUCFdp5qVUp6jdCW
         ohByyoiHvuiNxziYnPJ0+3ct/2moqgl5X50mMPNkhulF9I7BXX4zf/uFTLOFkwl5BYpB
         FpmqWKgeJM3AUB8OgNPSVGmqjK+wYEjoD7wiNhH2lTo3OSOEjmaL1NOOyWnGuS+j8X1t
         HzO6fRqf/KTcBSTU5ECAoxsseuYA80FlY3YCa0bCx2MkU4KQIrrhAjXahfIgi4W6K0kZ
         207Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :arc-authentication-results;
        bh=yZ13/nG4lctEe8h42/57l8g3dXoZvnROzBLTusPt47U=;
        b=S8QjmmtPlYsHSMyvdM0NiEy2gB2XYQxqnIKJS5KB/nX7FORL32K/H82YQFCPoetPKv
         /1cR7MdcimC4jcj4y5VWA2x7SboCWtvX25iGnFBS4w+WfQQQCd62xRhMMJcODvp3l/E1
         +EG+OOPBhk5Mhyhw87azIjXHlO4mPUj2/agDYQjx6S22iu5eG7yK1SlU2SSI4yDVkABk
         NzsE9yWhI4qee5MleN8VO3kbBPxCiqVu7+Hni2fcn/U6t87cYQNnp27/CjpqXCDZHvpX
         CyYnQwOUdu+kOTm7+AGg3Q5tIdY05YNhV0pYgzzd4U1g2XvGKIKaDrk5PYS2S0C32frq
         IVPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WM+kyMQO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r25-v6si2191872qtk.15.2018.08.13.02.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Aug 2018 02:59:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WM+kyMQO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fp9ct-0006PN-Rj
	for alex.bennee@linaro.org; Mon, 13 Aug 2018 05:59:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fp9ch-0006O7-U7
	for qemu-arm@nongnu.org; Mon, 13 Aug 2018 05:58:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1fp9ch-0002QB-9K
	for qemu-arm@nongnu.org; Mon, 13 Aug 2018 05:58:52 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40129)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1fp9cf-0002PN-BG; Mon, 13 Aug 2018 05:58:49 -0400
Received: by mail-wr1-x444.google.com with SMTP id h15-v6so13713607wrs.7;
	Mon, 13 Aug 2018 02:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yZ13/nG4lctEe8h42/57l8g3dXoZvnROzBLTusPt47U=;
	b=WM+kyMQOAMW5C8RnGzcWmq7wUxpqf6inUKatcTk4VE0iqbGYvQEJLIXh00h4f7opOq
	g9nRUFY7h3qnu+MfbxMO+blDWw0dRUsrhk6+qJr2l+L4oVR+rJMwNkVybD4xQDFj3FOl
	ZCcbZoB16pS2v3VhQwFBeGAAc1l00VvqoM4cUC3vgOo7UqM/UVXiI2M/Mqo8glwM0PJH
	XuCNk+um0GkJcxLg98mV2VWdQ2C9ty9OoE1oa/NPm1F8Fzlohf4K21slrcsuW9Ujfe0h
	RfduKMLCi7S6TShi2e7wNOtzjNb82/yRzdJkHG/LRHlRyJaPpIcelFPojuUX1yESxpaA
	ndqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yZ13/nG4lctEe8h42/57l8g3dXoZvnROzBLTusPt47U=;
	b=Qz+8FXRUNSSRe1Q6wvYxhbBaOD7gs5AfcohsrwNO0uojg94pMnv1Y5MRpEnlPUuFg2
	JTPG05hzxDv2OCbfw/LMvP3SDH3HlJyweeFAltNRS8gM40kJuQNAlj61mxaLVCRa9DdY
	Bw3Pk9eA+zala2nBcWG7zZUOn29FQF6Va8ybwJuR8m2iPIBaNvBjyo41/P/oW1v7BZsU
	nf7qnab0rJZxKRArhlPm5HQI0L+ZtViy5SZCfAK34N+sxiTfUwu0UBT+uCTVfiOuP8d7
	LlwNZ5evUjElAMrE9yqvMvYMJHqQSAQ48bfSpfRzKHFnPgVvIfwnTdlegFVrcPbVCYv7
	opmg==
X-Gm-Message-State: AOUpUlEVhOYxrUWyQtpniggqXEz8K6u7GH0LU0/7/xycKmgwYmEiDrqr
	hVOOE+adiTGoe4eqIKxdalpqqUh/UoCulr7YmGU=
X-Received: by 2002:a5d:504d:: with SMTP id
	h13-v6mr10584985wrt.18.1534154328197; 
	Mon, 13 Aug 2018 02:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180803144721.17036-1-stefanha@redhat.com>
	<20180803144721.17036-5-stefanha@redhat.com>
	<CAKmqyKOthBCQrWc_v9zhdYoBATHYfjyjkUQqx1W5mktm2b+6hw@mail.gmail.com>
In-Reply-To: <CAKmqyKOthBCQrWc_v9zhdYoBATHYfjyjkUQqx1W5mktm2b+6hw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 13 Aug 2018 10:58:36 +0100
Message-ID: <CAJSP0QU2UhO+X-XX0Rj_Cj9=NmBp4aaBNRb4GExxDq546AabXw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 4/6] loader: add rom
 transaction API
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>,
	Liviu Ionescu <ilg@livius.net>, Alistair Francis <alistair@alistair23.me>,
	qemu-devel <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <qemu.ml@steffen-goertz.de>,
	=?UTF-8?B?6IuP6Iiq?= <suhang16@mails.ucas.ac.cn>,
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YfcEJ9ru6044

On Wed, Aug 8, 2018 at 10:32 PM Alistair Francis <alistair23@gmail.com> wrote:
> On Fri, Aug 3, 2018 at 7:47 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > @@ -1168,6 +1172,34 @@ void rom_reset_order_override(void)
> >      fw_cfg_reset_order_override(fw_cfg);
> >  }
> >
> > +void rom_transaction_begin(void)
> > +{
> > +    Rom *rom;
> > +
> > +    /* Ignore ROMs added without the transaction API */
> > +    QTAILQ_FOREACH(rom, &roms, next) {
> > +        rom->committed = true;
>
> My only thought is that maybe this should produce a warning or error
> if a ROM isn't committed.

Not all loaders use the transaction API.  Therefore it is likely that
some pre-existing ROMs will have ->committed = false.

For example, imagine a firmware ROM is loaded by the machine type and
then -kernel is used to load a file.  The -kernel loader shouldn't
worry about the firmware ROM, which was added without the transaction
API.

If we want to be strict I'd have to audit all ROM API users and wrap
them in add rom_transaction_begin/end() even if they cannot fail.
This is why I decided to simply ignore pre-existing ROMs.

Stefan
