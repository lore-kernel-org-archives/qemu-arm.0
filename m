Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2869193wrt;
        Sun, 6 Jan 2019 14:51:00 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4S6q0aidkTnyIXm1Ro8F8dSSmTTsbjthkbAFpPA6WmoLDrxtpk8HOKnRqvZ7PfvLz/hKn0
X-Received: by 2002:a1c:2382:: with SMTP id j124mr6838273wmj.14.1546815060936;
        Sun, 06 Jan 2019 14:51:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546815060; cv=none;
        d=google.com; s=arc-20160816;
        b=HKM8FDLmBBl4Qc3xvQ7w4LXlghE+4KGXwTchP1CSHt+jzeyNuISCkGdDVkhpynwWwz
         p6VtSTV4sL2rNQpQLhNtp1EfHTHvTL1CrEqtJ8aNsL1sO8Vh+Yp6+VCz8VE4i+/wdOD9
         KmhjlWAYDLQQJIhIsmL7XfV89rut0SbGRYqDTUJG9OSqiQ/x6bh7LzL8/HugMXFfHpSq
         RuBWPK7J4kNOUcyz3FCf6qpcC/aDnBdA4wMhj4e1YYnETHBGqAPSRXKqHjr4BQlJStPi
         olQ7WGo02keZgxWWD7+BA19oUQ920rVEaHgj9jtk8gWsH3xpXIcqWWHtjj/RuDprK6ZJ
         YXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=8MaF/uwMdPOjMUlJxo48ZFgpzVcjiUMKRiWCI//FrlY=;
        b=ulVDsmU5BmEIzq/bgsb6sITGrYhWlVVS8Q/8Z5lu9qhIth6u0wOksQN8BGzsPnfezj
         ca/k85L8Poo1YfWIQMO8DSEHsDDVmyXdugJz0whCwqUN1Rg3oHHMePkoj6T58vfTM5MT
         R0lsZRTg2pVMmwkvPQkB8GGqCVLJqmfIFgMQLzIjURqcKUa493TAFgcnJBGiujx+Wrpv
         NbD6JU1y6B9B/dWjqMZZ5epNn/iG1VBLptf6y408ln4kaL4FyiPj71IqHBcaDZq5qCJT
         DnpKpdY5qp9W4HoR7YKG/fueA4lXfpSo3PudKkCxOdsdI08CC6F4IoDiN6HlL8fSaBuk
         u2Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Usm42F88;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si35040302wrn.89.2019.01.06.14.51.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Jan 2019 14:51:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Usm42F88;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50242 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggHFz-0003mN-Vj
	for alex.bennee@linaro.org; Sun, 06 Jan 2019 17:51:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ggHFm-0003lo-7U
	for qemu-arm@nongnu.org; Sun, 06 Jan 2019 17:50:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ggHFl-0004fY-Fr
	for qemu-arm@nongnu.org; Sun, 06 Jan 2019 17:50:46 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40354)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ggHFl-0004fN-8L
	for qemu-arm@nongnu.org; Sun, 06 Jan 2019 17:50:45 -0500
Received: by mail-pf1-x433.google.com with SMTP id i12so20877195pfo.7
	for <qemu-arm@nongnu.org>; Sun, 06 Jan 2019 14:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=8MaF/uwMdPOjMUlJxo48ZFgpzVcjiUMKRiWCI//FrlY=;
	b=Usm42F88w1Oer46rx7ZN6weKscDb2Z6d+0TJ9U5hYvt6SDqR9IqBBX3Rcc9T6yBlvS
	zOPnuZrCMswTIOU8ZegoMCzzG7JkJ/C1Y8vipCkSi1U00FFWAHza/vGAXO+z2tyL3YX7
	cMa6y79fgdMSEogdXfi9gXuN1jYZ/cG5LQkLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8MaF/uwMdPOjMUlJxo48ZFgpzVcjiUMKRiWCI//FrlY=;
	b=oPStboV10OLYqk6tLjh+Zvo81u2nTm75cWJTml7TjYyiXkVP3E1K2r3hhr8jirjDD+
	S99b5n5anrJkypWlcucNE9EkuwUfBN1qKiIy3ubLIt+C4wVySwYNWxKwMOiuq/7DJeKl
	qpxbDLeu4WUyD/oLPH0/QCLafSszMqWfQRDRbcwjxsz3/RHiCdqvQ2Xlr6vvV6pM2fm9
	lU7AHq4HtQxx/4r7Yb/JGdULiuL9mNIfKeI1ehBiv/gpYxwSW8DK65LbSdrH7FrcXI5P
	depoTZRL1rvYD/goHivQuWH4hhc0KP/oRAhckyCeLRM6IC3sdWiAIr2Yvl6SsDef+sN/
	cwtg==
X-Gm-Message-State: AJcUukcNFOE7fvWbvH9BD0XB27EQAuYc3ohBKHh/1kkHpclnDir26ySn
	285jOTswLdh7JWT+XSoPI/7OEA==
X-Received: by 2002:a63:7044:: with SMTP id a4mr8782516pgn.359.1546815043505; 
	Sun, 06 Jan 2019 14:50:43 -0800 (PST)
Received: from cloudburst.lan
	(2001-44b8-2176-c800-8cc6-2630-7d99-5ef1.static.ipv6.internode.on.net.
	[2001:44b8:2176:c800:8cc6:2630:7d99:5ef1])
	by smtp.gmail.com with ESMTPSA id
	n78sm45905768pfk.19.2019.01.06.14.50.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 06 Jan 2019 14:50:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  7 Jan 2019 08:50:32 +1000
Message-Id: <20190106225035.5671-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::433
Subject: [Qemu-arm] [PATCH 0/3] target/arm: Vector expansion improvments.
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B0Vj0OvXKZQ4

Based-on: <20190104223116.14037-1-richard.henderson@linaro.org>
which is queued in my tcg-next branch.

Patch 1 removes some conditionals that were added to the
generic expander.  The other two make use of the new min/max
vector expanders.


r~


Richard Henderson (3):
  target/arm: Rely on optimization within tcg_gen_gvec_or
  target/arm: Use vector minmax expanders for aarch64
  target/arm: Use vector minmax expanders for aarch32

 target/arm/translate-a64.c | 41 ++++++++++++++------------------------
 target/arm/translate-sve.c |  6 +-----
 target/arm/translate.c     | 37 ++++++++++++++++++++--------------
 3 files changed, 38 insertions(+), 46 deletions(-)

-- 
2.17.2

