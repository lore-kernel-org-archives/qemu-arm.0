Received: by 10.182.158.201 with SMTP id ww9csp6914053obb;
        Mon, 28 Dec 2015 10:27:47 -0800 (PST)
X-Received: by 10.55.77.17 with SMTP id a17mr71907814qkb.40.1451327267527;
        Mon, 28 Dec 2015 10:27:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c85si15631245qkh.5.2015.12.28.10.27.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Dec 2015 10:27:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:45785 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aDcWJ-0007xc-1c
	for alex.bennee@linaro.org; Mon, 28 Dec 2015 13:27:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDcWG-0007xE-E6
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 13:27:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDcWF-0002ek-N4
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 13:27:44 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:33749)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDcWF-0002ee-Ga
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 13:27:43 -0500
Received: by mail-vk0-x229.google.com with SMTP id a188so183714218vkc.0
	for <qemu-arm@nongnu.org>; Mon, 28 Dec 2015 10:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/6uc/RZawLXcUJqvH39c0q2IMNZun5QqrkE/20ONvs8=;
	b=chikCiXkVvRmsEOoyJuhPBwClrAaBB2PaWY6Q+IfyzaC55iCfuq+CVXiMXzGBsh6d4
	GNH4SdjrsDXzukjC8hIRdU53qaFBs21pQAhmsmMD0exQCvu22yPoWnuPnzczPuUKMZPW
	EHJrkTSPvf7dcmtcxbYiACPZeaTe4oxBPSiQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/6uc/RZawLXcUJqvH39c0q2IMNZun5QqrkE/20ONvs8=;
	b=R2BvOGl6Ff5cf9tfA/coQtPSL2NNtV+alPkd/Z0FrVii7izGjL2nCxu8E3DWZytzYs
	kfS0L4raPgPC5QDk6zK9Ch4Rm4INn63Em+/nipjB9qI6C0fPIwhjnN0r1dRaEkU71qmb
	LEy+862be+oxffMPd6CF0AsU0qFdG9gAoKl0f9duH8E//+3jabGYp+5BbfEyjlOKQIQo
	ga591AKCOPFRy8fOcSHBmj009rMVWHFhosD7nE3kFgTh9VwuwkUOL/YcXzVywSQbcKGQ
	4cRsufjIfWYGxcoZ/UfJgxLEicrVm5GPuAj6mC0zyBjAp7/4JKOK0c16QhZvzmME2x74
	bLPQ==
X-Gm-Message-State: ALoCoQldbn8S7Am3ZVTuItGE4F+zTD9HLuv7sTmb4Tf95NwfWnnWKK/eKb6lNcXPOpUMgFefyVwSGoOrgyOEfbw5pnQ7bVXXV9xc04y5g39QFfayHvDxo6k=
X-Received: by 10.31.180.145 with SMTP id d139mr31416939vkf.83.1451327262794; 
	Mon, 28 Dec 2015 10:27:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 28 Dec 2015 10:27:23 -0800 (PST)
In-Reply-To: <56809677.5080003@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-3-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA90sBFurRv6rbDEP7Q-qEy2PrpH7BgHVFOt15ZDfk68NQ@mail.gmail.com>
	<56809677.5080003@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Dec 2015 18:27:23 +0000
Message-ID: <CAFEAcA8AfMbJkmg_30dsC86v2-_RZDWDstZBZBFqs1YBX2eMZA@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 02/26] armv7m: Undo armv7m.hack
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FrvSzT1fQynC

On 28 December 2015 at 01:55, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> On 12/17/2015 10:38 AM, Peter Maydell wrote:
>> We could use a comment here (a) explaining what we're doing and (b)
>> mentioning that this isn't architecturally correct -- ideally we should
>> catch these exception exits on execution of the jump insn, not by
>> letting the jump execute and then trapping when we actually try to
>> execute at the magic addresses.
>
> I had an instructive little digression to investigate doing things the
> "right way" (in tcg).  I can see how it would be done by adding a
> conditional every time the PC could be updated.  To me the unassigned
> handler trick/hack seems simpler (less likely to add a bug) and avoids
> emitting more code for every ldm/pop instruction.

Yes, it's faster, which is why we do it this way. It is however
not what the hardware does (in a way which is visible to guest code
which is specifically looking for the difference), which is why it's
worth commenting on.

thanks
-- PMM
