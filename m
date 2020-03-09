Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1353683lfc;
        Mon, 9 Mar 2020 09:54:25 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvonQJuDKUq/noMIAy2Be4BgR3AsL3ZUxI9FvRgZfRo1HH3RLy/stHiuLJz8Ajs5EHw9Z1n
X-Received: by 2002:aed:2284:: with SMTP id p4mr14841980qtc.329.1583772865115;
        Mon, 09 Mar 2020 09:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583772865; cv=none;
        d=google.com; s=arc-20160816;
        b=P0G5pNthSpIPnPh7zppPAqVXC9dknDSbgWmNFCV4jH60tETZn9fz60X0aqTvYD3DBF
         /NSq1rnrc5H6ys1QStGO/C8TVsVW76oWca8JQS2uHy41IwV1TiMpLA5MRVeX2ishrxs0
         y//G/zEXKStHphIXrFpcJAKejsK8CS/9W6vnNGcTRlc0unVTUqPs3BUQ94fxuYX33t1l
         EZGn2JSEhUPUkE5bLLFOqAi907qbPA9g9erMaeLdhwXQoUZGhMfO9obpvdo/ZQz3RjNC
         OkHD5Kgdi6RwIGmv0vZg9+wTpQPHQnDaOXvJ+VjG9z0GWg8S/DVCTF93di1lTriUBs5K
         eEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BQnAqPzr5DDvBpluWBDNO8W8klH/WinH9MZYi++wetc=;
        b=J90WsgGAkmeAMa4nrs4SPSYGg8UySUDi8umRLEv7ZEfJXQikPRIF3An5O36g0YUpkv
         TVxcqieoQOn6IcPRUL61BuSebng4SUXxnxWmq+VX77kM4Xp6g07x12VTRx4tjrm8DvLp
         hG7GjtiBJODndzF5nqhCEXAdYiDEz6F3zhLCUmNfKWPA+oZ513PBtuVsPI9hitqQ/aIk
         3IAg9enGcx8C86MIv0S3SdPf80JUi21LgOxO9sadaQntP4AX1WD1g2IaAX+mxnagCoC3
         ycn8G/SpDOfPGFt3NOXWQQgEyGgKF9tmB/ykO0VN4uWmfb3V/gp0Q4TB8URl1Fg9TfZF
         q8GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ATH0JDLb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b11si6031283qtr.8.2020.03.09.09.54.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 09:54:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ATH0JDLb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBLfc-0000e6-Is
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 12:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53895)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBLfP-0000Y2-8H
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 12:54:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBLfO-000186-5O
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 12:54:11 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:37039)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBLfO-000155-0E
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 12:54:10 -0400
Received: by mail-ot1-x341.google.com with SMTP id b3so10264872otp.4
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2020 09:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BQnAqPzr5DDvBpluWBDNO8W8klH/WinH9MZYi++wetc=;
 b=ATH0JDLbOjq/PDbEGeLwUeIzkkbtEyo2IYRZRvnIjJE9NFHLG73jydaHTx3XATqPHr
 1P2jbyZvmp5Dz2A6cKZQ/8XQuEI1q8vzabxNn4ykypT/21LU7U7w0YyuYrBMq0NwOl4I
 qjbXIuoafV7Iz03lhzGj/YE+nN9JJlNuUaTLy+qOBQRDmvFu3iN344j7lIUIvMNm813H
 1wD7C4yfto3S6lE0yCdKSDQq6Ygh2nZNK/fkiGXgpfe8qtBaBr3R2sBvABIElnWeHtNC
 W3zT/K7fuvdiORRHZk5jvTiv1H4ePwcgr9u0JOd7G7iwdHcN4s6/Th/LtYbwbm5R+xxH
 6SXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BQnAqPzr5DDvBpluWBDNO8W8klH/WinH9MZYi++wetc=;
 b=CRsr6HoPlRUygpzvS5X+mrp+LAYP2ZD3yqK5UXeOAF0icMFl27M+2eA70bUuXiYmv2
 TNfaCo2ZL3M6bBIAR4O1GK0orFJkzG2Wk86ilxv9QN5+lPiCixfL0pjYnrMCdBuC0WLw
 kkOomaLwtIopKkcqqSCJUGQzzggKRbWU1y3qeolCMZOer1679Tcpvgq+1RMXOuR82LZ5
 cCccCTEPUgdiahs5y0C22cDMFLEMie+7slphLv2VVtxnxsGDpJ7welO5+SU5sG9PIvph
 TjsCRW1Mhs+f2fEHhpAydpH19P5QtvQy4K0lz0hMTwzLsiR4R28vhqRtLmOTLieXdRym
 ySkg==
X-Gm-Message-State: ANhLgQ1tgpykojxANlwql66jbUT1hFNyZ+z7s1nfx/a4Rr/X/fAvXO1s
 xWdi6vOScoLUHseMtyqxpG6hWvzc5d9dMsUCyHqfsw==
X-Received: by 2002:a9d:1920:: with SMTP id j32mr5077156ota.221.1583772848922; 
 Mon, 09 Mar 2020 09:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200206112645.21275-1-clg@kaod.org>
 <7ab3522d-54ae-ca24-592e-68d54e47de7d@kaod.org>
In-Reply-To: <7ab3522d-54ae-ca24-592e-68d54e47de7d@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 16:53:56 +0000
Message-ID: <CAFEAcA9cQx82NgpXR5h7pX+NJY4dxjy-JaLk14d7GriNLeTpCg@mail.gmail.com>
Subject: Re: [PATCH 0/2] aspeed/smc: fix data corruption on witherspoon
 machines
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Andrew Geissler <geissonator@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DpU4+wUSu7Kx

On Mon, 9 Mar 2020 at 16:32, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 2/6/20 12:26 PM, C=C3=A9dric Le Goater wrote:
> > Hello,
> >
> > We have been seeing a squashfs corruption on the witherspoon-bmc
> > machine for quite some time. It boots but quickly after boot
> > corruption errors start to fill the console. This machine has two BMC
> > chips with UBIfs on them. The romulus-bmc machine has a similar
> > problem when both PNOR are enabled.


> Hello Peter,
>
> If you have some time to take a look, it would be nice to get this
> fix in QEMU 5.0.

Oops, I think this just fell off my list somehow.


Applied to target-arm.next, thanks.

-- PMM
