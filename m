Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp797275wrt;
        Fri, 28 Sep 2018 07:43:09 -0700 (PDT)
X-Google-Smtp-Source: ACcGV635zlsju00Uh8cdbavgIdwN9stlVviFifsJ4jY+UjpHsRzTU6x2bv2YDoSSxQUo5c3boSEH
X-Received: by 2002:aed:23e2:: with SMTP id k31-v6mr13012040qtc.230.1538145789259;
        Fri, 28 Sep 2018 07:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538145789; cv=none;
        d=google.com; s=arc-20160816;
        b=SWo1F7EKqvGmc+Nxlf8AdS5oBCTPN8OnyjpDNwH+xfQMF8/Advts1WBOlxWEbQS1W2
         f7bWAn9xQtklyJGyCISYfordcbQ2uUOHatgTJPbN8PzzVb7sxFOKAcj6E5BKouiKhvPY
         D9WrYjqb8FW+MC6N2W4Xb7OY9+KfHatJKCWH7/oQgn+N5q5TZ2M+z82c/j4Pnv0xyEKI
         URWPpfjrAYt2jsRM1UJTX+jnKkaeQNcgoaxgYcbr2kuyrjiEmNvmhmRwf3+gkYSwUZpY
         rtF2A4yMDeaKWVS8oo+gopKvl7e21fAWYyxECDsJSwndkB3fAcbDuTPXb+7ffsLENGxf
         0KQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=tKYnsmnvuYtKaHTgetwuTvy8yfe85eTlenbCTZTJj1k=;
        b=devNNWhMvkhJ6NzF9ZSrmIL61O0MhUi5geMcz/fsx/aHLVw4GwB3DAzseTfl548d8T
         s3y8Yfd0Hz/M2CiHorBuY3cOiwnjVzFx+Ts6m2L6ylxllLxPJc7hoErO3F0QXIegv6+c
         J5eigd5LzV2d+I0tbilDKMCqB9pIAnGL0fALecwUbR+Lrw0yqSt2uo9UodGY4eocYldN
         88G4bl/tewHNQZdXwD6+QMZAdiDl7e9JQEZJ78Hf25ETBFdkTHXfEWKAjqFrWB5RwS8G
         b4wVORg/FgB67q26CNISsChur91jzp0xUiattuJk8qWTOhyTkTB5yWLVBPOlRE2pCeFn
         fiqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IaydiAZL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d10-v6si657398qvh.83.2018.09.28.07.43.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Sep 2018 07:43:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IaydiAZL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43755 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5tz2-0008D6-PA
	for alex.bennee@linaro.org; Fri, 28 Sep 2018 10:43:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g5tyn-0008BM-Ph
	for qemu-arm@nongnu.org; Fri, 28 Sep 2018 10:42:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g5tyn-0003g8-3Y
	for qemu-arm@nongnu.org; Fri, 28 Sep 2018 10:42:53 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g5tym-0003ft-SB
	for qemu-arm@nongnu.org; Fri, 28 Sep 2018 10:42:52 -0400
Received: by mail-oi1-x243.google.com with SMTP id d63-v6so5571991oic.12
	for <qemu-arm@nongnu.org>; Fri, 28 Sep 2018 07:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tKYnsmnvuYtKaHTgetwuTvy8yfe85eTlenbCTZTJj1k=;
	b=IaydiAZLH5ezOo5r+4YMngyuOlW8mDhPoFNKbAsqwGMO2PBM9JyLbMEUGezFxJLuXb
	yCqf2dkeTHyP3FKHELZ8yExX2mqYp+p9IUkd6xHjCWW+9hz3bGW5DoQ4IfS3ma3mmK8i
	sPBXXVVToOsl1YIUVHE32KV/uqn64zAXO7UEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tKYnsmnvuYtKaHTgetwuTvy8yfe85eTlenbCTZTJj1k=;
	b=mxFOujBJuKbuExAjv39u+TT7Ik62JqVJyzDw5EXgJTpaCcd2G6DA4He+KXbjY93v7A
	L0jxCTbGgZoT4MZjWr23hsZLoI3vxV0fh12lj+ha6uz8YG5BVx1J/W1UEWOqqtJiIdne
	XetXXiVYqL+Z3biNHSYvyY7Yo2SGQku12bICddU2phOXF0mn2B6xrqS6m/XqHw4pwjBO
	qKSdrKmyZevbaiyJiNnMoXbo4OgDlGbTEYNpK5VztoIKKqygzOadVxGyYmW4lYRQwYKX
	URYkHDCirMvIL4i1fKs6W2GnmG+nQpTkP7WOFfnJiwkLOGEmKa+Wz+pg1NeHyE0HxJQT
	vzdA==
X-Gm-Message-State: ABuFfojhU0yfJ/7TAwqDdplwAArJoaAhqZ3hJrEI7gyZVWvYXcbo6I3z
	SdWxjhAsP2bWWthvYgbCALEBsLh4yuUU7dSMjfbwRg==
X-Received: by 2002:aca:5c56:: with SMTP id
	q83-v6mr5620969oib.255.1538145772219; 
	Fri, 28 Sep 2018 07:42:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Fri, 28 Sep 2018 07:42:31
	-0700 (PDT)
In-Reply-To: <20180928135003.8650-11-clg@kaod.org>
References: <20180928135003.8650-1-clg@kaod.org>
	<20180928135003.8650-11-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Sep 2018 15:42:31 +0100
Message-ID: <CAFEAcA_uBoK0rPRkZkS4=WnvPoBcJSSxxzJ-QYRPwpVSijBJyA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH 10/11] net: stellaris_enet: add a reset method
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NPUSZjy0CapC

On 28 September 2018 at 14:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/net/stellaris_enet.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
