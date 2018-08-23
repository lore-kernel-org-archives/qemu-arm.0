Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp990898wrd;
        Thu, 23 Aug 2018 03:12:19 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPw5XYi+MSDqS9M+KQDbPNBMx6Q1ILSYBMK7469WYnOLnwA+C4HLOAJz4uOIN2t4H9mNloUI
X-Received: by 2002:a0c:d7c3:: with SMTP id g3-v6mr54445386qvj.85.1535019139862;
        Thu, 23 Aug 2018 03:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535019139; cv=none;
        d=google.com; s=arc-20160816;
        b=ysEB6hzLSpSNjstKM7W6ai1CrxvczT4c32XD8chVoRhs7ySkNfMogTF8mwjjPzXF/f
         lYmImMAowQxk0UhBbUFgGbWq+vmTpwayaxLlAjncVYkqy++1qGjWon0Rj2gUidoCrN9h
         NMcIivheCZa98pbsMnEbrLV0MenEqQaGtBwKhyDuZYbLwZbX/8iOOuHlk6zBO+5+ecXR
         d5HNfU5UHHgFPluwV6Mp++YVL2kJwF/KxcfAIzfbyN+OirAHjn9DKUPMmFAmO/P/W9Oz
         pTAIM7kqeFgEl99ldBZAi362E2uHKjFGCr/w/allcx+RvQ+RguuVJTYo5UqSHtmR2dBO
         Tb+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=aGAfHSMJtHCotzOFr2sdmkjrRrFzr+5G3JlKYH2kjYs=;
        b=nKt0Ademokrl634Fohb6+oO/+2gsp/5MGv68DH/Wt8yurGkk0rIYlxz/h1tcvuTyhw
         ke8VF7nTiUfXp87YExLW8BUX1BN/enR54Q65Sxpl+A+Kl1o0QaG/vWI/Imh8leo3lSY7
         La8cammMfKDkoZL2PDopkjBNkXPziZuKuWoKfSPFZvvdQAYyO1QoMRztxD416in805Qq
         MYAsC2uc+WHs23dN57uyrfnWE0iXfXvTU4FjRqloLN9wJOIcsow4CuZiwmJEzyjCMDMN
         W033aJ2y424+u7ZUxvsKUxH0TQZdIQfyw7sZhWVVSDXmd0Xe67evTAf6f9ZdCCrDDya2
         dRGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fv81M2dG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f15-v6si2661590qth.269.2018.08.23.03.12.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 03:12:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fv81M2dG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsmbD-0007K9-Dm
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 06:12:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fsmb4-0007Jk-Oh
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 06:12:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fsmb3-0001r8-GC
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 06:12:10 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33508)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fsmb3-0001qN-9u
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 06:12:09 -0400
Received: by mail-oi0-x242.google.com with SMTP id 8-v6so8368143oip.0
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 03:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=aGAfHSMJtHCotzOFr2sdmkjrRrFzr+5G3JlKYH2kjYs=;
	b=fv81M2dGvKvArDKrEpeZIlEPnIXqvIpJmkAqYoSmUdw+HtQnsgDFcwI2piCLtMaVBf
	yGYt4CiBz5jZNx5puKMDIi9Lc/eaUX+7RIPyajcBfgGUAU+/EXL6Qp9+tOalFs5dRK4Z
	4SzI2+QMmLJHPzce5drdPV+D+QXlC4/2lL0z0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=aGAfHSMJtHCotzOFr2sdmkjrRrFzr+5G3JlKYH2kjYs=;
	b=UFnJC6Lc/IeRTmYbS5ZAyZCtRAi2s+U6l3HyhC3TGNrMF/8Xs2aMezDrNET+S5uJTL
	Vbz3mO5MmYl+0O3okuLLMkFpV63xprS9ci9YyukAEv9SM2lcGn8dtY4Y2Kqq39shGfK0
	x9DeJdhZZw+1lrFHTvF7EWsyqrU+0lmQ3VernljW9NeQNp3d5Zc8qLRMARhcBqZxEDL7
	hCVzvKIVFq2qdUXDLO8Avx5Rh8Y7Qd7jFtm9S4agVtqiGTFUcP9Vl2C7H4LzBJ0fCdVt
	nBdFu92NE2+DIdzL0pjuHgBimSpWW4B8fYu9S6gXyuWFWUa42Jlacmn8q/1GCFbl/Yek
	CfkA==
X-Gm-Message-State: APzg51DBWNW4OG0llScqvbGK6puDQ0c8GKLUlnZxgTuHmF8HgSDxYGqS
	a+sn0LcWNCYmPAlabmgzz+6Lygp5ILPQgzKxsk5O1A==
X-Received: by 2002:aca:c351:: with SMTP id
	t78-v6mr8464830oif.338.1535019127955; 
	Thu, 23 Aug 2018 03:12:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 23 Aug 2018 03:11:47
	-0700 (PDT)
In-Reply-To: <5da29ed5-0003-a18f-65e0-a408b5f46b92@amsat.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
	<20180820141116.9118-19-peter.maydell@linaro.org>
	<5da29ed5-0003-a18f-65e0-a408b5f46b92@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Aug 2018 11:11:47 +0100
Message-ID: <CAFEAcA_wFiOqKB4auHc9NFMOOrsBmXF4EmS+TWMEC8uxq=_02w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH 18/22] hw/ssi/pl022: Use DeviceState::realize
 rather than SysBusDevice::init
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
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RM1961tN+gWT

On 21 August 2018 at 07:53, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> w=
rote:
> On 08/20/2018 11:11 AM, Peter Maydell wrote:
>> Move from the legacy SysBusDevice::init method to using
>> DeviceState::realize.
>
> It would be nice to have a wiki page where each maintainer list his
> deprecated/legacy API and which current API to use instead (and why,
> some examples how to use or port, pointing to git commits).

This one is mentioned in:
https://wiki.qemu.org/ToDo/CodeTransitions

thanks
-- PMM
