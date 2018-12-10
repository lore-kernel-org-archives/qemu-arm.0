Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4115368wrt;
        Mon, 10 Dec 2018 14:05:32 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XgBq/m1vI4v28pQl6nsdWa4rvKzh9TUTHjmGOzpsux+I6dAY98bp1b03AoB0ojN8o25Bfe
X-Received: by 2002:aed:2539:: with SMTP id v54mr13545449qtc.211.1544479532625;
        Mon, 10 Dec 2018 14:05:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544479532; cv=none;
        d=google.com; s=arc-20160816;
        b=n2/iHGUQ0hLnbJOOrcRRWJx2aQxtZaZT4r/P1/KMYbqzIWbMUUyaX4LARM1O6uOLIU
         ny6wBNmWtscBPX6mjw77De84JGR80M9bpqNyRM+cQrZ7+dwfGXLRmO7PtDAfd75nFxHg
         79cvJugOExtL+wkaeANuFSfiBo6V9NK+RGza6tH+JDWK8WBNZKVTj15z8bjMOBa4PSoj
         Ec+urBOoaJg7FEwS2XjWNz8oh6G2RkwpBMBMpkB/n0v1ybt8dfWHl0/GpZYaqtfVszBR
         k0g1mZ19CKz528aVdKVjt025fFiGEPPk3K1YIPVGsf93WkWbaU1LpoVP4pwOIZfJBmwh
         gggA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zygjM0O4eKQXryIZtaPZ5GHW79bxFxZP+83tM5x/zWM=;
        b=YqS5vICBfPOhx8V3ScYlFhpLZo2c4EbkfNi9znuFDDaB/k2JqMnrzTQgksaB3WZjAQ
         tTSXXehPci4O7iWYSoDFdLyd5MMxFPy1C0OlXHpHUhdhH4nJII1AfAte794aALhALvsb
         XDvmXltvuRRCQahd8pjoN+slQvHstfu8fxmS7QS6hwwpXqAs3AFaQ+rWRTjugXjebA8B
         otZLb6p52VQg8kLmrPbFW+ilidT2AnFgIchSn/zSmkYLUmxdElEJl5mL/QybOTwoCGJ2
         Wj6VflteBl2/8xBk9ykw3mc4Zp4brfx3rvRKJVBujEPjiVdaGcCdgtVsKzdtvyv5Vm+c
         OoaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="CR//JA7g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n26si1489549qki.136.2018.12.10.14.05.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 14:05:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="CR//JA7g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWTgC-0006ft-4W
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 17:05:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gWTfz-0006eI-Ha
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 17:05:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gWTfx-0004Hb-JW
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 17:05:19 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42769)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gWTfv-0003y9-MM
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 17:05:15 -0500
Received: by mail-ot1-x341.google.com with SMTP id v23so12019399otk.9
	for <qemu-arm@nongnu.org>; Mon, 10 Dec 2018 14:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zygjM0O4eKQXryIZtaPZ5GHW79bxFxZP+83tM5x/zWM=;
	b=CR//JA7gbXXBQUw2acRIBuile2KgpzeSmdU8F80GjarxO0s3mWYnGOGHometmHvW7b
	5AyDMaK/8Y8+RkBTuxP5YfWeFCNRDdxQbJuCDOqfjsByra4N+W1PUiybOAwJlllVZbxN
	c0uPI3NRjfu1ktLgVntPrrUcWogeQZLq7aYHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zygjM0O4eKQXryIZtaPZ5GHW79bxFxZP+83tM5x/zWM=;
	b=QAxRU5VxuneY+K8DImdCXtvqtU7uH+weLVyclZwt/7onmUH8OCGBasq9+luSBc7LI3
	TA6y/789GWK38Hn8syreNUJ1UmDEC39pdRGJ5qN9etaK+WaCltuiBWD1gP7zn5+uPpxN
	YsO7MxBzu7peEq/s7a4l8r8B9LHamCgv/qkWRwBKdKp1svD5tM211CUx9jmHnBSse/Kt
	j/qESRD9rVJ196tHv03RZ+ow2ee4wr4MZVj3Ccelzi11IwbgjwEHpqSYmQhZb/TcISPa
	FIgdBKIZrg2bJF29IJJ3rYoMAY9+59xsNMsPw8tYlx675LssiJA/KPu9FzQ2XW4DF1m6
	sQRg==
X-Gm-Message-State: AA+aEWaxpe4BTGG1m555OPx5qEBcV/TpXxZ2B2e66MOEILoJKbCxB1lU
	9d1GCqjeXK+/r5guOS3VGerpxHuoyVlVUbK6ypqQPQ==
X-Received: by 2002:a9d:5427:: with SMTP id j39mr6422494oth.363.1544479511856; 
	Mon, 10 Dec 2018 14:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20181210183836.20074-1-qwandor@google.com>
	<CAFEAcA9kXXeRkFamN73XREDp4QaokMs3E9TRLThKf4zYufapSQ@mail.gmail.com>
	<CAMKQLNK2J=JsgEch3G-pQ0mjW5B-n8Xc_4PDGHjFs6CfcA2ngg@mail.gmail.com>
In-Reply-To: <CAMKQLNK2J=JsgEch3G-pQ0mjW5B-n8Xc_4PDGHjFs6CfcA2ngg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Dec 2018 22:04:59 +0000
Message-ID: <CAFEAcA9LNUWrW1dePcKh4LLnN9xUKWswWnfjiNN_2JWExCj90A@mail.gmail.com>
To: wedsonaf@google.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH] target/arm: Implement VI/VF bits
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	qwandor@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u0ffQvxmRK5S

On Mon, 10 Dec 2018 at 21:32, Wedson Almeida Filho <wedsonaf@google.com> wrote:
>
> Hi Peter,
>
> We put this together months ago and hadn't kept up to date with the changes here.
>
> We're happy to see that support has been added for the VI bit. Is it going to be available in the v3.1.0 release?

Yes, that commit is in 3.1.0 -- do test it and let me know if
there's still an issue in this area for your guest code.

thanks
-- PMM
