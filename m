Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp817263wru;
        Fri, 27 Jul 2018 08:14:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdB8L3oF8BiKwB6idbNcIM/5p/Z67AWvA9HDZjX7eEsZMHRL3niRHHBNCnCYwGQ38WTeJZx
X-Received: by 2002:a0c:aac9:: with SMTP id g9-v6mr5943794qvb.78.1532704443396;
        Fri, 27 Jul 2018 08:14:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532704443; cv=none;
        d=google.com; s=arc-20160816;
        b=mIJUBLp9cik+5AHgE1njHzUienufyMElngem2rubVlaLenxCsweR8gOnQsj3ywg2sT
         4Ielwv3LO193AqNu46RNmW1WnTqgVW7nhKeThb4mq97A+z6B9kcOI6behe1eNBMT23nf
         9WYMHQe6Bs5CUYTAjzTlE/PSmEXbaqklomM+LvpTOnPbSemfWmacytQNbyRwa8pGNEHw
         wJpwT0lsJwvqJgl4NdX5aDnBOGTYWgVU4LqeAluMZBaeNPqjf7Fgg2Yc22cUz/bxFNRz
         2SuFKDZDVsydZ5c6vs7RQWGDPKmSj3/O46Xw1FC60xugHXwcrB5FkLj0Sv91dn4T2s5f
         8WbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Wxz/inhA29jR1MQskz+IRvr5A1wEGfbATy4raWBDB7w=;
        b=GVa8dVtwucwsBdOj+BsVG+22HUdKsMviQ++08xAbc2vpBO+gGhZEHPA3wRNn1xWx0Z
         uy+mi2Tc9Tn2KSWI3X8PhrzKx4EVHDiMImmhbXbv87pVS9kV4mFeUneX/zHbpEmetsr/
         QHlUv/ToocA6HTHwCEOAWeoDhnUMBhZS0Ta4fzoMlY+xOAsg82q3ENdCgdKXQgJEte52
         bs2Wkp3Yj4pdpHAi9zHIL/WiNbp+44cVjz//OUGfNB8gp8eVzRULw2LBBZlm+ZITe3bv
         2AR2gjnev63GR2en5hv1syE2q0mbGSk84sMQffd7lxO0oRVrJFBw6eRE+mK9Jt3PaLNT
         /7mA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a1-v6si4080489qvh.212.2018.07.27.08.14.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 08:14:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41753 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fj4RO-0005xk-Tt
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 11:14:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1fj4QT-0005S6-OM
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 11:13:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1fj4QO-0007EA-Py
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 11:13:05 -0400
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:42158
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1fj4QO-0007Aw-Hc; Fri, 27 Jul 2018 11:13:00 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 7A116813A0;
	Fri, 27 Jul 2018 17:12:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z5nVqdF0SUJp; Fri, 27 Jul 2018 17:12:58 +0200 (CEST)
Received: from localhost.localdomain (unknown [46.218.167.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id B19468139B;
	Fri, 27 Jul 2018 17:12:57 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>,
	Damien Hedde <damien.hedde@greensocs.com>
References: <cover.1532701430.git.damien.hedde@greensocs.com>
	<CAFEAcA-X=eziUHurc0SEcGEeM25t4YgkTczsVeF8myWHjfp3MQ@mail.gmail.com>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <2d22fcb2-b825-6195-a935-bf2adb3e0a60@adacore.com>
Date: Fri, 27 Jul 2018 17:12:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-X=eziUHurc0SEcGEeM25t4YgkTczsVeF8myWHjfp3MQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 0/6] Clock and power gating
 support
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p/s47Rl2VLcH



Le 07/27/2018 =C3=A0 04:59 PM, Peter Maydell a =C3=A9crit=C2=A0:
> On 27 July 2018 at 15:37, Damien Hedde <damien.hedde@greensocs.com> wro=
te:
>> This set of patches add support for power and clock gating in device o=
bjects.
>> It adds two booleans to the state, one for power state and one of cloc=
k state.
>>
>> The state is controlled trough 2 functions, one for power and one for =
clock.
>> Two new methods *power_update* and *clock_update* is added to the devi=
ce class
>> which are called on state change and can be overriden.
>=20
> So, you folks at Greensocs had a series a couple of years ago to try
> to add clocktree support (which included handling things like guests
> configuring clock rates, some clocks being "downstream" of others, and
> so on). It didn't make it into mainline, though it did get a fair amoun=
t
> of design/code review. How does this approach fit into / compare with
> that ?
>=20
> thanks
> -- PMM
>=20

Hi all,

I didn't have time to push a new version of the clock series and
I lost the track a little bit (was 13 months ago). Sorry for
that :(.. Would be still nice to have I think.

Cheers,
Fred
