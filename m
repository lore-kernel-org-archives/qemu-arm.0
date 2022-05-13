Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp31974lfj;
        Thu, 12 May 2022 21:06:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDUy6PIwI5/J51J7EE1+GuZRhHPxsT1VYRm9uRYGIarDg1rsM3cMzW9DAtoVK6M07F6Et8
X-Received: by 2002:a05:6214:2481:b0:45a:97cb:1200 with SMTP id gi1-20020a056214248100b0045a97cb1200mr2969771qvb.95.1652414782029;
        Thu, 12 May 2022 21:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652414782; cv=none;
        d=google.com; s=arc-20160816;
        b=cjcgbHV7z4mMOgICiDpM6bIM2C0muSDMRKDW1tON6rybQY4ySpAu7rPXYy8oV+3vnF
         dsOHV4J4ng3klcbkpjUtx+5ev6vZBoxwXFavKb4l0ep0qOrJshEgvdk/A8QT4BUe1f12
         eC85K+7RGsXyzSN93luMvean4v+pNP8pDq673vI/2mGuZYRrgPjLNOhtu0hC89t+7e59
         PtXYtjWOdBvy/R+JQ6+FemUAzQ+o6D97p8cOrN6jHldSruP1HTbHFntlglDAm+VEXp+t
         IRcU+c/o1z1P4y5K5IPuuREBVSSEgSCetA93bh05G4c/FFGvwcFBlUi9VAejn8YLRqy/
         34ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=NZJrEIBE8B7jzc/WPV/Nzy31asqaWQJvgsI15JDNbfo=;
        b=NMd4n1uSJvo42pwUunhOpC31cqOhiXP9U/MiJJe4PSTlMhD889Fz6zW831DYgSaKri
         1M2fKvtYeBSlax3oYV5fLPHWXPdg4IS4pCatZyOukNZjRAJ3tWt9g8v4YgpSJsLOBZOt
         NMDE/TYyctuzHXXnbCVvwkX5ZvpamoK+oGXSwMOwcQYWWnWu6nu+tWOh2MQJlCPtgabK
         hPO73w8pp59ESXACexNa9LXDEJNlAzExLLTtUiiJFUFxd1DsI1PBR3HjMA+mU9MaLDEe
         VLIBscDYw6UelWRAVJ6jdNqd7yFQQ1+vlvP1jHj3LYQDM7FVaxee7UyHMQwP1cKurZ1s
         0EVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=hhYP088i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c134-20020a379a8c000000b0069fcf7580e8si801912qke.260.2022.05.12.21.06.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 May 2022 21:06:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=hhYP088i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:50776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npMZJ-0008V2-4q
	for alex.bennee@linaro.org; Fri, 13 May 2022 00:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613212e35b=pdel@fb.com>)
 id 1npMY6-0007jj-Ht
 for qemu-arm@nongnu.org; Fri, 13 May 2022 00:05:06 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:55514
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=613212e35b=pdel@fb.com>)
 id 1npMY4-0006Iy-23
 for qemu-arm@nongnu.org; Fri, 13 May 2022 00:05:06 -0400
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 24D0aCZS020780
 for <qemu-arm@nongnu.org>; Thu, 12 May 2022 21:05:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=NZJrEIBE8B7jzc/WPV/Nzy31asqaWQJvgsI15JDNbfo=;
 b=hhYP088i5yOS1VOO0YF8KE5rrpwQX+80pxIJfC2ICct41OHQw4A6l6SCnfbYxX/g+DfQ
 6UtAMKjfGxnBI45G/a2Lh9W48uD7/NS/t8Y57aKWBvNT3q0j0ABTsH9y1AEmrbDW+HmQ
 kPit3xmpKMqeCd7/krSCY5iMJrvz5k7BfKo= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0089730.ppops.net (PPS) with ESMTPS id 3g1cx98re7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 12 May 2022 21:05:02 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 12 May 2022 21:05:01 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id B722162D785F; Thu, 12 May 2022 21:02:20 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <irischenlj@fb.com>, <patrick@stwcx.xyz>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <clg@kaod.org>,
 <zev@bewilderbeest.net>, <openbmc@lists.ozlabs.org>, <andrew@aj.id.au>,
 <peter.maydell@linaro.org>, <joel@jms.id.au>
Subject: [PATCH 0/2] hw: aspeed: Init all UART's with serial devices
Date: Thu, 12 May 2022 21:02:18 -0700
Message-ID: <20220513040220.3657135-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZaIWVB_fCzAK_5GO0SYROwv33OSdhIY1
X-Proofpoint-GUID: ZaIWVB_fCzAK_5GO0SYROwv33OSdhIY1
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-12_19,2022-05-12_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=613212e35b=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kRp/6bpaJ9vt

CC'ing Zev and OpenBMC since this was motivated by a problem Zev had there:

https://lore.kernel.org/openbmc/YnzGnWjkYdMUUNyM@hatter.bewilderbeest.net/

This series adds all the missing UART's in the Aspeed chips, and initializes
them all with serial devices (even if there is no peer character device pro=
vided
by the QEMU user).

This allows users to quickly test UART output without any code changes. In =
fact,
you could even connect all the UART's to separate sockets and check which o=
ne is
emitting data.

The first commit is just focusing on adding the missing hardware #define's.

The second commit has more info on the state of the whole Aspeed BMC UART c=
li
interface, and adds the additional initialization code.

By the way, could I put this code into aspeed_soc.h or something? If not,
maybe after this I'll add a file for common code, so that we can move
towards unifying everything.

Peter Delevoryas (2):
  hw: aspeed: Add missing UART's
  hw: aspeed: Init all UART's with serial devices

 hw/arm/aspeed_ast10x0.c     | 38 ++++++++++++++++++++++++++++++++++---
 hw/arm/aspeed_ast2600.c     | 29 +++++++++++++++++++++++++++-
 hw/arm/aspeed_soc.c         | 16 +++++++++++++++-
 include/hw/arm/aspeed_soc.h |  8 ++++++++
 4 files changed, 86 insertions(+), 5 deletions(-)

--=20
2.30.2

