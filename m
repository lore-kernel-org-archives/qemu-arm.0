Received: by 10.223.172.38 with SMTP id v35csp3833558wrc;
        Mon, 18 Sep 2017 07:41:57 -0700 (PDT)
X-Received: by 10.200.17.20 with SMTP id c20mr29333496qtj.321.1505745717257;
        Mon, 18 Sep 2017 07:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505745717; cv=none;
        d=google.com; s=arc-20160816;
        b=xtgLTT7ZZyWZe6As0jYUHy874GGg0qKSUypFGB/vt3/4vdop4Ke1+asjrAggY2guxK
         zstzs4zohIX8IfUuz/z/1sg7DotDh0+Og7rEhHzl9s9Wg3Wy3FYszx7nVHYLtxajf5LD
         g8z4uBHHwvmcGI9RIYRht9f8qQA6zz/0RaDGenHquR8LXCONF7oma4pctnzo92ShcRDp
         ELBXNdbPc6ovsEBYcSHPSHfFkNXMSmTl0yTqv31cijY37TtuvvZi5Q0Nliyffh2eDB1X
         lnjsfxkh3ba7C/zljzQfd5o8hLFvkFd7w8ZEl1xGExjSwzglwPLUb2HnTPpgbaF1uhQj
         iyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=IPkiTVmRXN1dU/SpKJ770xu94nKYt79TikqgdNHSevk=;
        b=pPUMHQNgXelgLL4bpXcnPltpqhh0842yXohX07aJ+FxYi6WSS5pJqYvmdhFsEvkZIN
         pTI66DjqcEPOk6DgBA1EtaPz+6IQGb75guYil6a3u5q4Bu3pA6U80PQ9RlX9hxFlmuAp
         HJcW5PISBdBRo48/VIwnc2B/x5WnsP5qVp1F68/A3VzzNN0sJh3CwpKGdDcvPYOQAa4i
         pZdZ78JXpfIOPRgLNcA33tWGt4gFzjSA1swjlm6x+N2sL/p6ddk2CQGy/hGWFKKvfpma
         jKlHE3mJg36WANtz5DufdDjFcSPrAfsPS2ORu2GDrvOepb9mblBOI/w1zWEVhCuHjlMX
         ZDFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xc6t77Ov;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q10si7185062qtb.128.2017.09.18.07.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 07:41:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Xc6t77Ov;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtxFD-0007e2-29
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 10:41:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dtxCl-0005ar-Qe
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 10:39:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dtxCk-0005f3-VB
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 10:39:23 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:49294)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dtxCk-0005eO-NJ
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 10:39:22 -0400
Received: by mail-wm0-x233.google.com with SMTP id e71so3342579wmg.4
	for <qemu-arm@nongnu.org>; Mon, 18 Sep 2017 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IPkiTVmRXN1dU/SpKJ770xu94nKYt79TikqgdNHSevk=;
	b=Xc6t77Ov673sqvuyYjq4+4ixhj5bo5jIftPad+oYNHslavym41svswmrK+l7G58or9
	EZQfJtZcLj20NnBVvDhskATxteXatlCL3cIfWOLPzflcSFAAoxugu9NrIslF0gUQ0zvr
	T2G8zLnYV/2kD2n+rkaUGuhuyPtuXby/NFny0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IPkiTVmRXN1dU/SpKJ770xu94nKYt79TikqgdNHSevk=;
	b=LWLwEMMVPhfT+QVwuamOk4RMNSBbO87dnhPaDMu1IqFc18UT02UpwDSX0wh3q5DLNj
	kz9L0kraZK20ccA7KoGC9OVW+9zlUVNbq/hlresCyB9H2EVFrWR6bwT/h+OWoIX4jgar
	sX5Vwy9juOlc1ZagHyIplwWCqxUpGJSOKSPDAlaJkEaISO1oTuUV/noQfGItNfkw4f43
	P5DqM1dIti2Eq7IJIyVx45XWRUUIEtJx6/e6MWwbizLfUcws8AYwH3vJ5IdVmgaGMSuZ
	fLvjlnFZtUmnMxUP6Rx/yp5g1UTvS3J/ZjF0vwpLANFH1Rtxf1IYyv9Hivww/Gf5wEhl
	x+Pw==
X-Gm-Message-State: AHPjjUgdeqVqBtuzm2eaSUmpHHkaWk5keOSodxKXJaeQ+je2Q6YVe/YJ
	ujrpzcvhkj+WdBIY6VkG3zRJuoyUH+N+uK4rWkotYA==
X-Google-Smtp-Source: AOwi7QDSesMYKwDQOIUVKPN77Zz4IixajFF5nB3j47qg/IRAMgnLIiZUnLdtsB5d6fJPwjWurW4R8ZOBpHgO96CBsks=
X-Received: by 10.28.52.81 with SMTP id b78mr9140984wma.11.1505745561570; Mon,
	18 Sep 2017 07:39:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Mon, 18 Sep 2017 07:39:00 -0700 (PDT)
In-Reply-To: <1abcfaca-3af0-efcf-d577-c3c5cb39e8fe@amsat.org>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
	<1505494753-10837-3-git-send-email-sundeep.lkml@gmail.com>
	<2c6a4136-fb80-2000-940c-1df5e718cbf1@amsat.org>
	<CALHRZurRLysJCRwvm+SbJUn8YBAst_Q38RCzJkmT4z=mfnYuiQ@mail.gmail.com>
	<CALHRZurNLqH_6Xbh9SKtCA0fuk-CFEZeqBMwYXV=+UaZB4k1Bg@mail.gmail.com>
	<CAFEAcA-BQ=ognSsb3Kxx5ThJ5Q_GA_sFFFofpKY1=XnRS4-WTA@mail.gmail.com>
	<6947945c-6b04-dce0-9010-b3350df0f151@amsat.org>
	<CAFEAcA8yHmZBgudTbW7S6eoObYE_O=CP3YjfL7g7GGip=wsjaA@mail.gmail.com>
	<1abcfaca-3af0-efcf-d577-c3c5cb39e8fe@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Sep 2017 15:39:00 +0100
Message-ID: <CAFEAcA-FqjxRpALbJqhWtdhEBN7YpvV5rG-yMdbv_RCFSoVLYQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-arm] [Qemu devel v9 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	sundeep subbaraya <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fo6sQtBnmJsK

On 18 September 2017 at 15:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> On 09/18/2017 11:00 AM, Peter Maydell wrote:
>> There's lots of stuff that can cause the guest to go badly
>> and confusingly wrong if unimplemented. If we print a
>> useful message with LOG_UNIMP then there's an easy clue
>> for what's gone wrong. The guest shouldn't be able to
>> provoke QEMU to exit.
>
>
> I understand. I'm worried about being PITA for an user to figure out what=
's
> happening here, that's why I'm wondering how this should be handled. Anot=
her
> idea I thought about was raising a PREFETCH or BKPT exception, but this
> would also be an incorrect model behavior.
>
> Anyway I'd be happy enough if instead of using LOG_UNIMP/LOG_GUEST_ERROR =
we
> use an unconditional qemu_log("bus remap unimplemented, unpredictable
> behaviour!") warning. Fair enough?

I don't see any reason to handle this any differently to
anything else.

thanks
-- PMM
