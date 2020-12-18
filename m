Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2347522lfq;
        Fri, 18 Dec 2020 06:33:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1Q+AiqIpiaLz+/nw+1cGJn6iBoWFh2QDfI4e7+svjzUTQbSyVZhSX4Ywobqhir4DdkMjR
X-Received: by 2002:a25:690b:: with SMTP id e11mr6115393ybc.314.1608301983640;
        Fri, 18 Dec 2020 06:33:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608301983; cv=none;
        d=google.com; s=arc-20160816;
        b=HgJivMjqnMnFsS5/TjFP5m9eSG1RZ9hedsLXTbqsySo7TZ4NMFqtkuI+Fs5ABCC6FF
         i+Ax376JWN/xGuQfjgYKiR5mV+1mFLXR9SOA1MJ5uV8ud1rP9HWkWG50K7STzcnJyVq6
         DfIt/7vs9+vnfIAHXOsGvJ0qnaCVK9LC2/OcXzhpj8jTMYKR/dNVhViNMs8Z2LrdyxdN
         dQCbuc875p/ZMRYqWBWIQVcOsUVe5Z3GcjliN4spJjigvThg0hfkwoL1zBmNXbIubCLP
         OqAdFE846Z/GSe8Yq06jG4aWGJmP8e0FoHzMk3cbGbK4QvhLvvUfQB7mcRsRTfOE7eUG
         07Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:message-id:date:subject:to:from;
        bh=xI5D3KG2I1aziZcUtcVkYavWnfgdEkuOHf8JBCbfNZo=;
        b=VTdO3LmZJY12ie0FrlHq3GHf76nAWKSmtZG2fkmtaaa/ahy7q66sDsVcLS2A842Kh0
         yNm/Zky1asezycr0MGsz4zVAn4pK3927/F6exfILsIiE+tw+FBZ7om635pp2beOk/czi
         edch2+onLZ7WEB0lxAug33dEF6lJ2jPLuU32V81RmBHdJ5xOMq/6k5jJznZZLwIYTjes
         sovskIjS6qhRr2Kl6eSnt/2CfypBMAEzM9WvzITj3AMGar46hQB5y+U6GVDS+utaKZtf
         WTTPWcKSIHEe0RpohwLu5dpTCSnoy/7zVKaPRK5hV/ec7D+tBotQvjxyd1FfvR2Ifa/o
         iI2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p137si8011322ybg.226.2020.12.18.06.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 06:33:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqGoZ-00016p-1e
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 09:33:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqGoP-00015g-Os; Fri, 18 Dec 2020 09:32:54 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56798
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqGoN-0007Og-9J; Fri, 18 Dec 2020 09:32:53 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id BC81C5FC85;
 Fri, 18 Dec 2020 15:32:47 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: [RFC][PATCH 0/3] ARMv8.4-TTST extension
Date: Fri, 18 Dec 2020 16:32:45 +0200
Message-ID: <7884934.NyiUUSuA9g@basile.remlab.net>
Organization: Huawei Technologies, Finland
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tcrJRbmrzLIx

	Hello,

The following changes since commit 6d3fd902ab9c4d6762532d4b5cce2275e458aa32:

  target/arm: refactor vae1_tlbmask() (2020-12-18 12:27:56 +0200)

follow. They add support for small translation tables, allowing for=20
translation regimes as small as 16-bits. This extension is nominally a=20
required dependency of Secure EL2.

=2D---------------------------------------------------------------
R=C3=A9mi Denis-Courmont (3):
      target/arm: keep translation start level unsigned
      target/arm: ARMv8.4-TTST extension
      target/arm: enable Small Translation tables in max CPU

 target/arm/cpu.h    |  5 +++++
 target/arm/cpu64.c  |  1 +
 target/arm/helper.c | 25 +++++++++++++++----------
 3 files changed, 21 insertions(+), 10 deletions(-)

=2D-=20
R=C3=A9mi Denis-Courmont


