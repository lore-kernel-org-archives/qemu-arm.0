Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1575567wru;
        Thu, 19 Jul 2018 05:41:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeRGgeUmnuMoDYbdUbzyohd+9DwdWaqEqAiAdyHghFwis1rnnlYsqqVct9+Ng5tp5/vG+aW
X-Received: by 2002:a37:350b:: with SMTP id c11-v6mr9036855qka.88.1532004108986;
        Thu, 19 Jul 2018 05:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532004108; cv=none;
        d=google.com; s=arc-20160816;
        b=RYhbQPp2UdkD+SO4JXaLWT6uhNbFLx1I49Z34btmMM4ISdz8Ynrz/Cd+bMlGUunHLc
         Hd/6MRtqci7EMpD/QcyB8b3pEju36LUT2/y4i6zWUhN7sSbNX4miQcmhcTrSqztC1bsm
         SydqjYt70Rvt3Y7EcijTH1W4mWRla1vaUCBWgEirR6WbZ+anTntNx0OBWYeTuENd38gs
         UWETLfAwzqCxWKqcGlnh93OA98gc2IWokihZuFmOmjWHjaT5OQVGJQirmpv3IrgQlzKP
         zdm6JRbPlNi9LDu8r3bPoolgtt88exLaFSGDjufeXeaOPSSrYhff8JuvQLjgHrPyVI4B
         BjHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3+06ik7nOp08E2Zt4jn5dC/1BloKZKFued9sUGebf34=;
        b=Fb9g6J04ucHdMpL9YCE7WsJpVdnZG0DzEb5XLWaEycj8grocgKazV+OHEECoGCOszT
         k7od62fcH8K9SfV5PZ7Vt0bMnrPvWHgpowXOaGZhfmnu8cKqp4Wae/0wMZHYHl5ZCQ05
         aHuaYXUlgfJXqWZKEMgwjVRpCs94xO7NKUecTI7CetKhLGpEJloXTIt1ppY4mt3B5r64
         DPWcYEokmH4EDfULFrAfScNMUDTS9Vtx0Jo4LYJ1NjCprOyWAEeyyMvEXTzqgXpV/Cya
         3KPWTY3Dj2ACelTQZkfl1DSfmM5PEn6H089/TjbHU9xJvEl2tErsDiOLcDXEmScVI1GR
         E/SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Tam73zLs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d62-v6si1826438qkg.74.2018.07.19.05.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Jul 2018 05:41:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Tam73zLs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fg8Fg-00065t-IS
	for alex.bennee@linaro.org; Thu, 19 Jul 2018 08:41:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fg8FL-00064Z-5q
	for qemu-devel@nongnu.org; Thu, 19 Jul 2018 08:41:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fg8FK-0002wk-BF
	for qemu-devel@nongnu.org; Thu, 19 Jul 2018 08:41:27 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:43490)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fg8FK-0002wI-50
	for qemu-devel@nongnu.org; Thu, 19 Jul 2018 08:41:26 -0400
Received: by mail-oi0-x243.google.com with SMTP id b15-v6so15199039oib.10
	for <qemu-devel@nongnu.org>; Thu, 19 Jul 2018 05:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3+06ik7nOp08E2Zt4jn5dC/1BloKZKFued9sUGebf34=;
	b=Tam73zLsy07Mc31LGDhwI3M92OGmITB+b1fWkSUKynx5qHBlBTE9HKXpR9D25w7ceK
	4BgegeHhhULkBflsyUxnRC1l3YH46GVGA/ao8nb6MFGCGMo8DZbUZDiN3ff9OoFqqUf9
	WsF9/A2rsaemcxSsqWeYlTo5ee7QEWQPN/ErY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3+06ik7nOp08E2Zt4jn5dC/1BloKZKFued9sUGebf34=;
	b=Gn/MEmN6XCAr6/LzqrY2Fy9h2lNtr/uRwBBUs+Frz5CCmLMfhraLMWCT/4kV1fkZZ/
	ezGTRwsFYU3VcRae5o9trpBbV2C62KvUqYXKDbaymhSSHV5Kf3wvXpjwxFE5V7DhjTQL
	cBy6qWMoWga6ONs3sqtxT9J/lUPyVLjL+veBVkmqIhzQUmTlpvvQEfFytYXXg20JPNIK
	IDbsi0/eGwVEGu3v2k5mWLNg8DRZSdcav1/iONogEBJrCkSVU/A9qp3/xjZfsRzVx7Y/
	SPRfsK2q/3xxqoVKsuCnObS9kn8Dr95blL0aW/ex1Zol1TII0YOnb+KDdehoeds93qei
	1AMw==
X-Gm-Message-State: AOUpUlFiHUIi1xMxcy6aIVpKO14vrT4Lo67250uuBu1A8s+fPFkefqah
	SyHaAq89rtfdxiTh4u4w9MihmzaaWIM0M8GdedTPow==
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr11122731oie.80.1532004085333; 
	Thu, 19 Jul 2018 05:41:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 19 Jul 2018 05:41:04
	-0700 (PDT)
In-Reply-To: <1531969910-32843-1-git-send-email-jia.he@hxt-semitech.com>
References: <1531969910-32843-1-git-send-email-jia.he@hxt-semitech.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jul 2018 13:41:04 +0100
Message-ID: <CAFEAcA_2t5z1JBWM9o7ygcOwxnQRba0qA8vVjcoZpcGfP9XUtA@mail.gmail.com>
To: Jia He <hejianet@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH] hw/intc/arm_gicv3_its: downgrade
 error_report to warn_report in kvm_arm_its_reset
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
Cc: Jia He <jia.he@hxt-semitech.com>, Eric Auger <eric.auger@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c85+vQUlfHW+

On 19 July 2018 at 04:11, Jia He <hejianet@gmail.com> wrote:
> In scripts/arch-run.bash of kvm-unit-tests, it will check the qemu
> output log with:
> if [ -z "$(echo "$errors" | grep -vi warning)" ]; then
>
> Thus without the warning prefix, all of the test fail.
>
> Since it is not unrecoverable error in kvm_arm_its_reset for
> current implementation, downgrading the report from error to
> warn makes sense.

I think the counterargument would be that this should report
an error, because you just asked the device to do something
that it doesn't support (ie to do a clean reset). Since the
device isn't going to behave correctly, the tests should fail,
and the way to make them pass is to upgrade to a kernel that
implements the device correctly (by implementing the necessary
feature).

But we could maybe move to warn_report() here -- I'm not
sure what our rules are for what counts as an error and
what counts as a warning.

thanks
-- PMM
