Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3656101wrq;
        Mon, 25 Jun 2018 03:53:23 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJO8U7/XVVpecoJ+nnWUwI80v7hK4qvRZizk1s5pGCo2iWvFvId00DBY+cnjeURIDwtLNtv
X-Received: by 2002:aed:3601:: with SMTP id e1-v6mr10260313qtb.23.1529924003019;
        Mon, 25 Jun 2018 03:53:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529924003; cv=none;
        d=google.com; s=arc-20160816;
        b=0YFGB2U1V/PtLb2ShZWLAgMIRgmB9acC35tBeRMwkGBL11fmUN8xDw/qpJMakdmRC5
         4Onr9PUe3/iLp5yVl9cTbxIvaCdwG1A0gQ9iR2kQb2S1zx6dlG0tJtBVkHT6yAjkBvjR
         Gl8iZmeDK+Ddt+EORqYsj7qC323I4nurhvhnDWppHQ5Vq5T9c20h+qx9ZlzznvhFKrfo
         gymxaiyu+D9YeQW6W6XsKVkHKFycGbWR4yDO/PYcrfWFUaGZCJdGQeCZLSBUNm/VXhEK
         +yYXCUohvP2BKLRqrdieAWrJeSjCHNRlWaNzYn2MXkQg3o6vRjOD80shsKCktHVQBB7k
         fRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=g6TbXSPfm4pyUce/BuXMkrEoHut1JfPjZk5IgsFrhDc=;
        b=qO+C4Qmy7ueLtMzipZjGOEQdP0unVSRxW+tP36XSJMSJ11v5o4EmPDL1+bE0VHzW/t
         R2R5FqPI4E7Taq+8iuHu2SP6IodtxwrXnf0quVGh36ySNkDrPjPhBzcwBY35qL4cV0eQ
         gwJEqbC8XD5fVZD+7c9cquQugw0N3x7yAtHoI0JmYdD3Hj8T9mX+l6pJMvQ07OoAdZVK
         MjyXk8OLw0oPD2KDyUnteaUYIA8jVsN/Gs6iE4BrLQFrp55RTDWcdh1SjESuGwgmE3UV
         PjZzDOIk3o8uDNjRxTfVd0roB3FVTIh1ZgNO4xnYtKlr4r7hWsbS/4eIeYefAADefWnq
         oLvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="jUrb9/3K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i66-v6si2450455qtb.200.2018.06.25.03.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 03:53:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="jUrb9/3K";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXP7a-00027s-He
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 06:53:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXP7Q-00027b-UN
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 06:53:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXP7Q-0006K5-4n
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 06:53:13 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:36065)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXP7P-0006Jh-N4
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 06:53:12 -0400
Received: by mail-oi0-x241.google.com with SMTP id 14-v6so12040599oie.3
	for <qemu-arm@nongnu.org>; Mon, 25 Jun 2018 03:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=g6TbXSPfm4pyUce/BuXMkrEoHut1JfPjZk5IgsFrhDc=;
	b=jUrb9/3KIhZx4vOOYLWdWqhBZ1ZgspDUlocn0/s5DbUiq9qEgvpJaeMtCoUMIrPSAB
	jmqmi20HSNz5h1LsaObxOGHiRga+LuGYvJgxVp7VmapP5u5rC2yoKwr+n5sWDGR3Z6bD
	WCkhI5Do3+J4YLibLSM84CG6rOslKlGN8jqkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=g6TbXSPfm4pyUce/BuXMkrEoHut1JfPjZk5IgsFrhDc=;
	b=TprYu1anK2pjaZ8/i62Yr++QMeSlCe/5xAwVW8eC4quTv0RKv3PEUpSQNN7fIde/B1
	dq3xT0AtF259ipvzh6W5zBQZAo7NBdioQkcQMhLCZ6QxSGodfZ9M8MH99XO3LKZ7JZyq
	gumzL8sSWqPB/tL49pvytp+bLTYxMHnqsFb91kkcQQHnfJUEWM7xIHF23646teosYolj
	+tPWw9m8Ri4NuScUu1AoAe+Z7O6ydJ2tJDyCnpGmk2m33Y1epcI115W2R6ASYeRvK3Kz
	7gkgmHk8aia4+Ut8H7g/TXyjmqwrtzQ+0QUzgUZav2i/f4bAAxgU3K9PzahvMB27JZHG
	usxQ==
X-Gm-Message-State: APt69E1C0OdkP9wmnC3UId26EGKA7n1Av3oPEIxheB0kknTIeB+2Yot0
	d9WQC86U7uJyQ+F2Yu88QwQE/jb4+UPUr8lDHmGZUw==
X-Received: by 2002:aca:bd84:: with SMTP id
	n126-v6mr6185456oif.337.1529923989472; 
	Mon, 25 Jun 2018 03:53:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 03:52:49
	-0700 (PDT)
In-Reply-To: <20180612065716.10587-1-clg@kaod.org>
References: <20180612065716.10587-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jun 2018 11:52:49 +0100
Message-ID: <CAFEAcA9=kJ0PDoGMkyVGiPMVp-R-G=kxFGkXCWjWaOmwjE75hg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH 0/3] aspeed/smc: small fixes
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
	Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ++x/IgOBJ+mE

On 12 June 2018 at 07:57, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Hello,
>
> Here is a short series of cleanups and fixes for issues in the Aspeed
> SMC controller model discovered when experimenting with the MMIO exec
> feature and also from tests under a QEMU PowerNV machine.
>
> Indeed, the OPAL/skiboot firmware accesses the Aspeed SoC address
> space using the iLPC->AHB bridge of the SuperIO controller and drives
> the SPI controller to access the PNOR.
>
> Thanks,
>
> C.
>
> C=C3=A9dric Le Goater (3):
>   aspeed/smc: fix dummy cycles count when in dual IO mode
>   aspeed/smc: fix HW strapping
>   aspeed/smc: rename aspeed_smc_flash_send_addr() to aspeed_smc_flash_set=
up()



Applied to target-arm.next, thanks.

-- PMM
