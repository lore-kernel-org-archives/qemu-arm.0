Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4094158lfp;
        Mon, 3 Feb 2020 07:41:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwz+f8ljHeVLWhNckJl5NQrXTVs9beZnVTKqn2x+AksN85mwO/vn7nJ0lxFeSvo3BcJibVk
X-Received: by 2002:a05:6214:146e:: with SMTP id c14mr23830146qvy.82.1580744515928;
        Mon, 03 Feb 2020 07:41:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580744515; cv=none;
        d=google.com; s=arc-20160816;
        b=UrMYOgYBr8Kfyf8WO59vYYikoLjnzt8BrjaAwUg6jW9GugqG9xH4grn2oZ42QhJW+6
         IlEhFUT9/o5Uo+IYpuQPN31OwsECehuwHbAVsmmIDbUN13TUW3cXW6iAR2QhJzLB6rLP
         SrioH/2ul11DrpFFaqBhJ4M+oV2wrPivLuA6T2FlQn2mAvV6AbT9BuVruT4SPB5SIDYb
         kcHzjoBXvVTfHL3Z+KBhDtBRT/qT/p+37vZEV5Nrs+llxH+URm7Y4GzQvXiYFYeg17I/
         UcoKhbic4N5jovF7YCYo51MOCI40/6pZvRcP6HEcld32F6GI1/1apXkzcCEfKWs5rW9O
         mQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:feedback-id
         :dkim-signature;
        bh=ibL24skPvM5CgVaTsKj87UlbWcQFmnE+99ZNDNOvibc=;
        b=02ozfRE3TYQPb7jLNyia57rghilCnXmdqu49ij9m4F7nEXW1ACu4f8DaaE7CZeE9gA
         ZrxqisNR3qe7BtMHO9mR8ea6jDD4xCiX7oXtbTHH0kYQPQDQ88Ck3DcpCl6dKyknEs56
         VuI6e3bYlh6927FBJqYQ5y8h4HcLmvLxmsRd6Bapk6NVV0zieSX2WGnWt1dPy24dn4sG
         KgyMFqBQkMEI7fRiQN+c2ieFx/dUXvQHoDWU9LqIwBfDH2/tq6YPXwTSbZ0eKx/Sr0h9
         jXQlDC+zvn2KXGlFM2XBSJCZPM/4XAzneYaVqc/8qE17DMpk2cRux6qdeFIuZ3AtRwkq
         CsLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@megamailservers.eu header.s=maildub header.b=LHvuE5zA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k135si12992284qke.216.2020.02.03.07.41.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 07:41:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@megamailservers.eu header.s=maildub header.b=LHvuE5zA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iydrH-0002Fw-BV
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 10:41:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33830)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rsta2@o2online.de>) id 1iydr0-0001u3-CQ
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 10:41:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rsta2@o2online.de>) id 1iydqz-0001yn-C4
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 10:41:38 -0500
Received: from mail202c50.megamailservers.eu ([91.136.10.212]:41086
 helo=mail193c50.megamailservers.eu)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <rsta2@o2online.de>)
 id 1iydqy-0001uu-PP; Mon, 03 Feb 2020 10:41:37 -0500
X-Authenticated-User: 017626146082@o2online.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megamailservers.eu;
 s=maildub; t=1580744488;
 bh=ASa/+tFb77XKSveJBl+gykVAL1X0h+vCrAKuRTkNbfo=;
 h=From:To:Cc:Subject:Date:From;
 b=LHvuE5zAl/+b41w2TI56SHGE52NQHNFIYvBTRbCRvo2ZG137JM3NahoEpemaiMbOR
 fstQ1/4CVY4POxCl6gTKFx/g0r14q4KekiELdKQqMiL7NLSyAJIr42cqZHP8uvKvgn
 vfu1VjcA37dtBcjt69wHHa2jvGUBnkdSK0IoZ/KM=
Feedback-ID: rsta2@o2online.
Received: from desktop2.localnet (178-21-1-177.ilmprovider.net [178.21.1.177])
 (authenticated bits=0)
 by mail193c50.megamailservers.eu (8.14.9/8.13.1) with ESMTP id 013FfQsG009440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 3 Feb 2020 15:41:27 +0000
From: Rene Stange <rsta2@o2online.de>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Subject: [PATCH v2 0/2] bcm2835_dma: Fix TD mode
Date: Mon, 03 Feb 2020 16:40:03 +0100
Message-ID: <2357909.uYzqtL8Sc2@desktop2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CTCH-RefID: str=0001.0A0B0211.5E383F28.0042, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-VOD: Unknown
X-CTCH-Spam: Unknown
X-CTCH-Score: 0.000
X-CTCH-Rules: 
X-CTCH-Flags: 0
X-CTCH-ScoreCust: 0.000
X-CSC: 0
X-CHA: v=2.3 cv=SamJicZu c=1 sm=1 tr=0 a=oFQkuSNlBNCQRuITVo1IXg==:117
 a=oFQkuSNlBNCQRuITVo1IXg==:17 a=kj9zAlcOel0A:10 a=c27POuBx5ChD24pRu1kA:9
 a=CjuIK1q_8ugA:10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 91.136.10.212
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Andrew Baumann <andrew.baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BnLDHGb3/A3u

Hi Philippe,

this v2 patch splits the initial fix into two commits as suggested.

Regards,

Rene


Rene Stange (2):
  bcm2835_dma: Fix the ylen loop in TD mode
  bcm2835_dma: Re-initialize xlen in TD mode

 hw/dma/bcm2835_dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.16.4




