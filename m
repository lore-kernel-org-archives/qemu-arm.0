Received: by 10.25.0.144 with SMTP id 138csp949059lfa;
        Mon, 10 Apr 2017 09:48:50 -0700 (PDT)
X-Received: by 10.55.101.144 with SMTP id z138mr24940896qkb.4.1491842930262;
        Mon, 10 Apr 2017 09:48:50 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v123si11338632qka.184.2017.04.10.09.48.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 09:48:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxcUh-0005eM-OK
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 12:48:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cxcSE-0004DT-N6
	for qemu-devel@nongnu.org; Mon, 10 Apr 2017 12:46:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cxcSD-0005Mb-RF
	for qemu-devel@nongnu.org; Mon, 10 Apr 2017 12:46:14 -0400
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:34468)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cxcSD-0005Lt-L4
	for qemu-devel@nongnu.org; Mon, 10 Apr 2017 12:46:13 -0400
Received: by mail-wr0-x230.google.com with SMTP id z109so12943383wrb.1
	for <qemu-devel@nongnu.org>; Mon, 10 Apr 2017 09:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2s2VIuzTQ+xZlijKXauge7uYaiZyK0Zqv41fYCoMY1M=;
	b=GFd7W2b6MOsb8xnY0MdWMfi1u07qvl39suf1yk1fzU3ZzYH4ZJOeNiBfgDuIpZtCC+
	6NbdXNlxyfkQ+N66HLbUoEl5DDXFw0xbFbBYKm2ceiTCuWfpBOt2VwEu49hmst7h02b5
	PZGi6qK4/yZw0Cf+fxeBkC5UIdVqG+/8z81yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2s2VIuzTQ+xZlijKXauge7uYaiZyK0Zqv41fYCoMY1M=;
	b=EHRdXl90kTA+InGgDDyP0ZWIEU4H1fgkPAdZRe6QYecFaplUh9crrFWz4EfwMqEtz2
	i/wLdmkkKicB0U9aVPhYpezg9JfSAKpQdS/dmzqV4he17iavi2eA/XItQO7j/bn/uGUe
	49dYyZxNGTvMvwwW5tEPdPlqONkx3Pv4N/S1fuVV4wyHu2fV3KpPYRFMAxwNrHEpMRQe
	ZKAf98QAS1pFHHoHYQ4P0BpD66nNV0GjRt8rmjbBOZ1YyUstJYpHrKglhUIkj+7MMr5B
	pB+QiyE1sURckcjYWwcByy/HNyAXMDGt1r3glxPrzwoPe8pr3GVFmjqsN8u8DJIWIYGL
	af4A==
X-Gm-Message-State: AFeK/H3Z2eIl08vvRmZbm7gZjAX7YZToDIK49pHbfUkff3nAXOwGn+vTPYMnu7+zG2tM4XoUmGLySk4cl0LzSIIx
X-Received: by 10.223.150.149 with SMTP id u21mr28757251wrb.195.1491842772560; 
	Mon, 10 Apr 2017 09:46:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.97 with HTTP; Mon, 10 Apr 2017 09:45:52 -0700 (PDT)
In-Reply-To: <6a8d54a6-cf11-38d3-390f-dd4536b2c2b6@amsat.org>
References: <1491820793-5348-1-git-send-email-peter.maydell@linaro.org>
	<1491820793-5348-6-git-send-email-peter.maydell@linaro.org>
	<6a8d54a6-cf11-38d3-390f-dd4536b2c2b6@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Apr 2017 17:45:52 +0100
Message-ID: <CAFEAcA9LAHe9=nnS8tAJLsW-xDXb2oLq8jU6tRTT9vnDe6bnmw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::230
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 5/7] arm: Move condition-failed
 codepath generation out of if()
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hd1so/5yZuP/

On 10 April 2017 at 14:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wr=
ote:
> I'm custom to think "let's change that and think how to protect the code =
to
> help the next one who will modify it" and wonder if it isn't safer to
> define:
>
> const bool singlestepping;
>
> singlestepping =3D cs->singlestep_enabled || dc->ss_active;
>
> Then use:
>
> if unlikely(singlestepping)
>
> At line 11993 and here, what do you think?

I think we could do this with a function (that takes the DisasContext*);
then we can use it in the new gen_bx_excret_final_code() too.

I'll add an extra patch to the set in v2 that does that.

thanks
-- PMM
