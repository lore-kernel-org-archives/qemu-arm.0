Received: by 10.28.173.206 with SMTP id w197csp3889567wme;
        Tue, 9 Jan 2018 08:36:30 -0800 (PST)
X-Google-Smtp-Source: ACJfBotCndejrwXEWIARQAxnapTb+BS5NCdhyy4qHo/5xJmU7/OO7MUAXhpwql5KJKG9mLNCGsrb
X-Received: by 10.129.55.209 with SMTP id e200mr9580985ywa.306.1515515790768;
        Tue, 09 Jan 2018 08:36:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515515790; cv=none;
        d=google.com; s=arc-20160816;
        b=jx5/lF/FleeFyvXzrOAgCqnpzQ6UreLl8WK9BhT6xIs7K1pSmxnS0o7vEw+P7hiUHq
         zK2/rxbxJvJ3Y2WbA2Ihi1qZgjoFtRtHTSjN+qO+LbQUBy7PkhKEaN+2OSasEcZcZ9mX
         PAI7sRSvOtJseEZ9h1EpfT+/XkREk+7lk2RWLkJIAW5+CAP/aLjU1fmc7wgC4lb7HuPF
         UYghlTDWPCR/Ci4WhUgWzkhXUsiv8OqVBmR1Ga9yfPYc3aNh2/pyVdn5H+rV3dpMaL75
         2ERoh1MFRQd/j2Y7zd9qS2sbHu63VgQwG4nn2GNWSiHIBdCi1VKBsKRCODYIIhqpzZbD
         B4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=G59QPO1vwym5sxr7DXp3txM6Bf8D+cMqoTxCkHGrbOQ=;
        b=D0KnsPq3RncE2Qhbyq1LTGY3cv85lwZZUkceqqWxuu5gpZ5LPSVeJwpBgcK9BHFb5T
         Z3YGx1ur5YIBLrjkiPoVCeoDcIJGh2FQTfaassLROdZsrFVrwxBHhysrS7oDTYe6pevf
         cuphmXP14C3xn6STqSn9cGFsn1FF7kIxmu1js9FxJ+wAnzH6oOHeARK5VSox+bxYfe68
         X6xkJUq3cKKUY+M5JUnOcDjhXPwwPxGGcvX7Ez1wB3D5kdX5uXwU4oNwVwqSOTIVi+P+
         F1fTnoUqd2X+uT+kHAi+DCK0fLh091K6RQu+IXNRnnp8Ijef0dnLpTFZnYDeydyYJclw
         77BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W7LCdaok;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id w3si3107146ybw.75.2018.01.09.08.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 08:36:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W7LCdaok;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33041 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYwt4-00054Y-5z
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 11:36:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35571)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYwsS-00051u-Ft
	for qemu-devel@nongnu.org; Tue, 09 Jan 2018 11:35:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYwsR-0008Km-LJ
	for qemu-devel@nongnu.org; Tue, 09 Jan 2018 11:35:52 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:43951)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYwsR-0008KE-G4
	for qemu-devel@nongnu.org; Tue, 09 Jan 2018 11:35:51 -0500
Received: by mail-oi0-x241.google.com with SMTP id t16so5660391oif.10
	for <qemu-devel@nongnu.org>; Tue, 09 Jan 2018 08:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G59QPO1vwym5sxr7DXp3txM6Bf8D+cMqoTxCkHGrbOQ=;
	b=W7LCdaokdVP440+4KE+GOwscCWWOYxrza3W94Kaq5ZOkN8Cnc8kcRpxdinmizHzq6v
	SbhFBB3QB/4xlF4Vsam8o9wvLSkVKQtzWYsTBCD39qUgZXc8g6H6UQP6v3Nqgz0MT6Vt
	Lu2YCnBufL+/5H1QwSLDrNt1HEeVwtnbrRUfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G59QPO1vwym5sxr7DXp3txM6Bf8D+cMqoTxCkHGrbOQ=;
	b=CcHVnR3jesCdkPXnwfPQ571a2RiPkr8qGhSLHTPaLkVnWTDI0SeO0V/NSPKUBUjkbh
	YRa7s6zGgyVw5f41TfYPxT+lwZnvy3ihMkJVPavBklNpUPBhp+NaoTrm09wX/f3zXHZQ
	N44j30iYKsztac6Ojjt+olySiKQb06HL99UbZtiveDVjJt3ePuRPE9b5ef43X/XQocwN
	yDu5t1B87NEbBTwQeKEIxemAI2RI4uciQtluoFR7677YCBbXwZXb5aL5hAjr2S89IOUi
	2qnF1wfUpZ6SYCHIp0JPdXSEIap7x8d2e7MQCROm8xsm2LKKVKAV7ZXWCecil+6I4dxt
	4eFA==
X-Gm-Message-State: AKGB3mKoC2j4fpV5V7yuFtqgay+AVwA1t41UZ3irAYXeHLW3B2A4YIsU
	Qt18E57WmnsWN9A92iNBOh/ijmoEaPY/dBs74BtCyw==
X-Received: by 10.202.75.80 with SMTP id y77mr8458167oia.328.1515515750750;
	Tue, 09 Jan 2018 08:35:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 9 Jan 2018 08:35:30 -0800 (PST)
In-Reply-To: <e40cc107-2fe9-d8a5-b4fd-385c0d22c564@redhat.com>
References: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8NbL7ROZs99hWhpAF2Rdi2qEiWLNo3hr_9W7gmgXyw4A@mail.gmail.com>
	<6d20557d-5722-706f-ca4f-489ab85358c0@redhat.com>
	<CAFEAcA-Nn4VmSnxT7Of8Nh+p5QgF9cMzkqZ-VBCC=2zRgk-Xdw@mail.gmail.com>
	<e40cc107-2fe9-d8a5-b4fd-385c0d22c564@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jan 2018 16:35:30 +0000
Message-ID: <CAFEAcA8QqEna4u92bk88++Y1JrpCJD=KDpSfbJ8DhfSiTRm+=w@mail.gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 0/2] GICv2 & GICv3: RAZ/WI
 reserved addresses rather than aborting
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
Cc: Wei Huang <wei@redhat.com>, Drew Jones <drjones@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: joey+9TnkEGN

On 9 January 2018 at 16:29, Laszlo Ersek <lersek@redhat.com> wrote:
> On 01/09/18 17:12, Peter Maydell wrote:
>> On 9 January 2018 at 15:58, Laszlo Ersek <lersek@redhat.com> wrote:
>>> Sorry, no clue about any of this -- where should I read up?
>>
>> I cc'd you mostly as a heads-up since the QEMU bug is UEFI affecting,
>> not because I wanted to make you read the GIC specs :-)
>
> Thanks (and, thanks :) ) -- from patch #2, looks like GICv2 is affected
> too, and the patch seems to be fixing commit a9d853533cc1
> ("hw/intc/arm_gic: Switch to read/write callbacks with tx attributes",
> 2015-05-12).
>
> Is that right? That commit was released with v2.4.0. Should I have
> experienced the error? Is it KVM / hardware specific? What are the symptoms?

Happens under TCG emulation only. The bug got introduced with
commit c79c0a314c43b78f6, which changed the effect of a device
returning MEMTX_ERROR/MEMTX_DECODE_ERROR from "RAZ/WI" to
"guest data abort". That's in general the right thing to do,
but in the case of these device models we were returning those
values for cases which aren't supposed to provoke aborts.

The symptom is that if your guest code is poorly behaved and
tries to read or write offsets that don't correspond to documented
GIC registers, it will take an abort that it didn't before.
Linux is fine; this UEFI image I have lying around stopped working.

thanks
-- PMM
