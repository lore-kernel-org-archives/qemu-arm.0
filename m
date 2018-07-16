Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1490021wru;
        Mon, 16 Jul 2018 06:12:25 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpccAwU1dLvZS1vQCt51eF9I8RmDqArvE9z6gkibbxTnZgIAmalo5d+gGMzgJTJt1YEgV7xc
X-Received: by 2002:ac8:2888:: with SMTP id i8-v6mr15045923qti.275.1531746745834;
        Mon, 16 Jul 2018 06:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531746745; cv=none;
        d=google.com; s=arc-20160816;
        b=NCwO5atxtghy9ubVJI0CmYky+VLgObIV5AlcAfOzz6QgfdpGFCEeopGrOJc4DhNHFg
         P+WyWHA1uQ0u+l97QstIANCyQsTh+8TfEIAjY1uITPE4oW0/hThQJoznwwgpI0xTzp5x
         U84/b55TEZOMyl2bcZ/ivIpeZqeQqM+gJh/7iAkEL58ytHXIjzLpWSEf0AAZj6blbyIT
         Uvnpt3MTLlJXxK0QkIHStQ6L4NE1JlZKumGmvLN5FbCcBdkk2opsbUw1O4Dj977DNMky
         jXFipVYSIDYecshQPzQijWS4OBD5p4bMnIX3JBDsrQV4LUj2/98Hw+ebxswq2/TnmU69
         Beeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zcp8F16QMW4sawzK/09KBot4vn6EjECBH2AAGw0QzUI=;
        b=ot5yLtQ5Ay+J0jTRHM8ugma2fKZv8WPc9Kc5JEiFh+a9gEmrfBwMmp/E7OxREeSXaI
         uBFhYT3jGV5PhKu5Ck5Dbl1rV9TaYnYtLJvsq0697NBmxmHbpx74yl2XMLQKEj3oh58Q
         cUEyVPbKqCDznp8uhgiiTU02tIXcvAgrwL71n8nylPWXSsXTy63BkMaVHs2ogWM1EcHj
         kw9I2dlImhCv3C5PvN+PnU7ujtxuV3T/80DQz4c1Em/a3Br2QRr3YWd8eZQ7mQCYOJvM
         g8r4hoY3nJuDrjSEsX6ZRBR9N1q+kBoVyp41QW20XXW8D/Tg+FQZ45vgPhztODv06O0O
         0r1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NM11xRPI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u6-v6si2044825qkd.354.2018.07.16.06.12.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:12:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NM11xRPI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3If-0002Wx-5j
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:12:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff396-0003EC-TF
	for qemu-devel@nongnu.org; Mon, 16 Jul 2018 09:02:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff391-0003QS-4V
	for qemu-devel@nongnu.org; Mon, 16 Jul 2018 09:02:32 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:34631)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ff390-0003Q3-U0
	for qemu-devel@nongnu.org; Mon, 16 Jul 2018 09:02:27 -0400
Received: by mail-oi0-x242.google.com with SMTP id 13-v6so74589141ois.1
	for <qemu-devel@nongnu.org>; Mon, 16 Jul 2018 06:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zcp8F16QMW4sawzK/09KBot4vn6EjECBH2AAGw0QzUI=;
	b=NM11xRPIJLVah7BSyEDomyl56L6Jdt8mmn9TFmhwMfQLIlpLJ+pzSFLF34gRdyABay
	jHd6kLxVpeJLcFTFm2qdDBv819GF3NwDOq7V9uV7/EUDBCfo7Q3XaVQI9LYbfLt/4j48
	GThdMCKGZqdTVniMmWPb4rb2epSsCN3qTuAds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zcp8F16QMW4sawzK/09KBot4vn6EjECBH2AAGw0QzUI=;
	b=V/2EjnLW6Rz18vjZBRComYh8YI06384WOLRW50LOKULkbYPK6KlQki3fWbRaL7I4XM
	hxpUMZGldXZE7eFDWYX87yGeT6WkKiKrzGDTVP9zGVwPD129DagTI38psBw6A/mTw6cY
	TPMqVo3IdgT9W30nQj7fu2fZRRZ6GlXwzvT1m1OKQHAVL9Dx+uMDU7lrWfodkxHutXzl
	PHO+FlojsO7GHC+sDRIcr8X3m/hFms6wGZ0LEaDMTV7dBcze0RWujWQEdluIlug0RDs0
	+zuNt/m02dme9lA7Gr18WLNzQHLdejj+GK/u7oeNDZoTizB9f3oJCVXIUxEY3q6zt8+l
	RjtQ==
X-Gm-Message-State: AOUpUlEKgrgXvEkGJEwDJCHRv2stWk7yxg5GJd5cF06y8Az82iG0pJVh
	twHFJB+1owi4080gfvK4sZ9iLiP5nRjade0xqvk1CQ==
X-Received: by 2002:aca:4c14:: with SMTP id
	z20-v6mr16547621oia.164.1531746146191; 
	Mon, 16 Jul 2018 06:02:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 06:02:05
	-0700 (PDT)
In-Reply-To: <e9073530-a6ef-0e93-dcef-f3c3e91df01f@adacore.com>
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<e9073530-a6ef-0e93-dcef-f3c3e91df01f@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jul 2018 14:02:05 +0100
Message-ID: <CAFEAcA-b7nzcjAyofRh5S6RxjZ08==PdN83e2sgKW9d=1Za2xA@mail.gmail.com>
To: KONRAD Frederic <frederic.konrad@adacore.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH 0/6] accel/tcg: Support execution from MMIO
 and small MMU regions
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IZawDsKGksay

On 16 July 2018 at 13:30, KONRAD Frederic <frederic.konrad@adacore.com> wrote:
> Hi Peter,
>
> Nice! Thanks for that.
>
> A little question though.. What will happen in the case where the
> CPU start executing code at random place because of eg: a badly
> configured kernel?
>
> Seeing the patch 5 I guess it will really execute stuff.. So
> maybe this is less user-friendly?

Yes, it's true that we will now happily execute from anything
(device, unassigned memory, etc), and do what the real hardware
would do in that situation (random unhelpful things, infinite
loop of taking exceptions). That's a bit unavoidable though I
think, and there are already lots of cases where QEMU will just
sit there with a black screen because the user has loaded in
a bad guest image that goes off into the weeds without printing
anything to a UART.

It's possible we could devise a user-friendliness option that
tried to pick up symptoms of guests being stuck (eg tracking
whether we're continuously taking exceptions) but that gets
into heuristics a bit.

thanks
-- PMM
