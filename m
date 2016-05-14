Received: by 10.25.208.137 with SMTP id h131csp526211lfg;
        Sat, 14 May 2016 04:43:46 -0700 (PDT)
X-Received: by 10.55.143.129 with SMTP id r123mr20550950qkd.170.1463226226137;
        Sat, 14 May 2016 04:43:46 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9si6695203qgd.97.2016.05.14.04.43.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 May 2016 04:43:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b1Xyz-0001xT-N4
	for alex.bennee@linaro.org; Sat, 14 May 2016 07:43:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>) id 1b1Xyg-0001Ug-4V
	for qemu-devel@nongnu.org; Sat, 14 May 2016 07:43:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>) id 1b1Xye-0003nq-4a
	for qemu-devel@nongnu.org; Sat, 14 May 2016 07:43:24 -0400
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d]:35756)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tsunghan.tw@gmail.com>)
	id 1b1Xya-0003mw-5u; Sat, 14 May 2016 07:43:20 -0400
Received: by mail-oi0-x22d.google.com with SMTP id x19so207619640oix.2;
	Sat, 14 May 2016 04:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=CWHGy/g25+WYt3b5kDrK6qlp+hqr3GP4MNdHBiGggBk=;
	b=WYdDr7/mrCNa3nHNIzm87I9vjMtoo08jq4B9s5eiw1oFx8Oa+0Cp9YFapKZ4brqXsk
	PdyFc+gqNknkMH/GEcCJwdHGETOsv/gI1sQAphytFNbs2heYanMX2bwKGpN+I5WEut5g
	xteivRXUS0xBFs681zMg82mNJpJ4ueN+QD4hdzNPoivkN/tnKFCXa5L61z3K0YCrYgik
	bpp0DnPF/el4jV3VoP2CzoRkDMKDST+Jfiot8Aw1hP0aOWDHMmMR1TCXSmCDDpUqozc6
	Ln4ByhQ5Qm4r9txR3hfwTXO/VhGpC1hDob1v1gNf+UqPuYyhCZgi4KYvzmul9IWSVT9V
	Ttfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=CWHGy/g25+WYt3b5kDrK6qlp+hqr3GP4MNdHBiGggBk=;
	b=IigdHoMMgr+3uo4GRrhoX8MjbJGnnUztmst2pxPyOKzSzjc6nNdd5bc/erANP6gR9N
	K3IE+gyWKA8ImAln1l4twzueZ1B+syp9C+je+XXVp+A8wyx8Z0ppMJ8ArTpE7Qd54+Wx
	rCBoj8Q1RAOl4Bo30U+zme7trSjDubpD5EHD1pI6DfwlblWrXXpLz17hWWuxVwdOeJ1e
	7LPBkHL97lonKBkZh5mAmbFLYWyz6ygo36OuLLHYPBdrtjH63GeeZTmANzdeiwXSaO39
	zGZSlMNum/F1Vve+C9cNXhGryZe9NUOxbQ9rXNF2I7ymMk0FsUGWbidodgXlxfJAdHkY
	OrDQ==
X-Gm-Message-State: AOPr4FW9HLsYi/ySrfZcIXYaC0Pcr98aGvEsOQ0wYI63xAcmoTCeTtt+KrNMyHnlLB2dDWB/Eo1SLX1Pkh7Jgg==
MIME-Version: 1.0
X-Received: by 10.157.9.100 with SMTP id 91mr10815591otp.142.1463226199608;
	Sat, 14 May 2016 04:43:19 -0700 (PDT)
Received: by 10.157.9.182 with HTTP; Sat, 14 May 2016 04:43:19 -0700 (PDT)
In-Reply-To: <CAFEAcA-sc7-yoLCb5sh-1jN4er7aMcQgM9kWed5--90_cqXmiQ@mail.gmail.com>
References: <1463202423-19943-1-git-send-email-tsunghan.tw@gmail.com>
	<CAFEAcA-sc7-yoLCb5sh-1jN4er7aMcQgM9kWed5--90_cqXmiQ@mail.gmail.com>
Date: Sat, 14 May 2016 20:43:19 +0900
Message-ID: <CA+BS1oF+O0uuHqPQQW-tPY8DG-6cc3OdVDc=+e1uqf-cc3YWKQ@mail.gmail.com>
From: Tsung-Han Lin <tsunghan.tw@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::22d
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH] target-arm/helper.c: fix access rights of
 SP_ELs
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A7g0M7J3HpsE

2016-05-14 19:08 GMT+09:00 Peter Maydell <peter.maydell@linaro.org>:

>
>
> The ARM ARM defines that SP_EL1 is accessible only from
> EL2 or higher via the system-register instructions, and
> SP_EL2 only from EL3 or higher (see table C5-7 on page
> C5-288 of the v8 ARM ARM DDI0487A.h, or the register description
> pages for the two registers). Why do you think this is a correct
> change?
>
> Thanks for the correction. Seems like I misunderstood the spec.


> thanks
> -- PMM
>
