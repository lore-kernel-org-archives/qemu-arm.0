Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp3426550wrr;
        Tue, 12 Nov 2019 16:52:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqwgAD+lNILpZwk8b7VRKt1h1CNYIkchjl5JaWmtnWDCFWX5DWDcdlWRMXtRl3hOb+q1uGcq
X-Received: by 2002:ae9:dc45:: with SMTP id q66mr303485qkf.248.1573606360227;
        Tue, 12 Nov 2019 16:52:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573606360; cv=none;
        d=google.com; s=arc-20160816;
        b=Io6zD2nY2lHFAg8PInkFurm4vSqB3cCrdZZZOaeXCFu1mE1yzCGKR2bw5/p6Zjc8Yb
         EjBRMorhRn6M7SNNDcaI3h5YzBPGGH3eAJ9y4I+nWVafIRz4N3irL3Q1Oh68x2o13FhZ
         k8H0xZsWsWbxBzzSwYzfr3SJbpZyxYjEArEiocEMFtj8DR7w9hDuNwY9bzUtrQeLJ6SO
         1ky2/k4pO2vX3QiGC8ExfPbsINbJVa0xpYd4+TjD0ovOnLFKSkglKzCmxLfPNyVw8tFS
         OIseKXTd3JroqvkIg29q6NYRzPzwtibTWwib6Tf+SoipuSIVqBxAvkOYQ/WHQvGx8O5S
         zUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=m0HBsUHijHgIFgKZm6EaOmXclG6Mq1OAILNKtGWTkEo=;
        b=vzwCneRBp+QqOWBnvP36InfaPNqmHpVpG1gCeMBeaLUQJbWw9TtS+ScgHcZAW4kIXl
         w7NcmNefPOcI1OLXfavkudYJa6F1zQzSebaKZjxKTr+RDcuM6kJDX9slmd9oxhrxFf0j
         cn0X6EwdZUr0orIr5vnAhj8N0VTGjI/QF3kp5VIFM7AyQL8ItnsFSEpPdiT9iXU5LHlH
         TNKcqc86AKbAYPWUPolYi42CGxvXtMBgVhDWyEiRtaTRj8tSZ47NKsquPpFm9fsxsqnM
         PsMnZijEUOrz0XxMqqQdtoXMzzfrE6jYWYHY09g21tvmImIAZw72lF/NBvF4a6PQKMyn
         ndcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YdCkKLDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7si195933qvx.33.2019.11.12.16.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2019 16:52:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YdCkKLDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iUgtj-0001Nj-9L
	for alex.bennee@linaro.org; Tue, 12 Nov 2019 19:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54225)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iUgtJ-0001MS-Cr
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 19:52:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iUgtI-0005H3-ID
 for qemu-arm@nongnu.org; Tue, 12 Nov 2019 19:52:13 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:41626)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iUgtI-0005Gx-Aq; Tue, 12 Nov 2019 19:52:12 -0500
Received: by mail-pf1-x443.google.com with SMTP id p26so340987pfq.8;
 Tue, 12 Nov 2019 16:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m0HBsUHijHgIFgKZm6EaOmXclG6Mq1OAILNKtGWTkEo=;
 b=YdCkKLDlfhZ7DEoutIRY0whTzWTnnVTMNKC9DOU4MbEJxARyKdJrGxggCJezsGNnoN
 vRCR3qKFhGDtcUPfUNlHZDX6NXpxt0N2DhvRjrr15HCrb2CaZB+v4p4P3gZZq896wWUT
 EDFSPZSm7oCMuWLeXxvmrd3aSZ5+EEgcZla/rsN1A9svUIUcVQ42azydht1SVvUQs/Cy
 8TLmf0ZKm5+wYjJbYfhCbMyXh6xMcqtXNAVnhHV62FSwyDQUmbEGBJIFqtUJYt7rdClE
 iIxmR0Bq+oCUfDesn7R0jSnntnBr0L5eKoXvHeW8pokviHzSRYS0TxRCKlOA8MNMI5Jo
 CxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=m0HBsUHijHgIFgKZm6EaOmXclG6Mq1OAILNKtGWTkEo=;
 b=E26aJt9g/nW2RqbOP7Kdsgnz83lwam1cAHAJHZV9MkOsiZ/va0NCHBKve9KyEeIo6c
 /n4TAjuvIfMSH01eEefephTknyz4LqPtj2XcfvT7XgHTLFb5105xH1oU1b7nVqnZEB2D
 IRM98UFw1UfTIj4nJDLtVeFpfvO7umPG0EUW5jqaLY95DHe6EcbEZwb8Jn+x21gstJgv
 cLIWeYGflOjZ6aSMFDYrw6puBompzCYZTmnjtRVJ3ZvyRFcT6kHBjdXko6EAJgXVOyAM
 +fb/FNrAEwgpNBBwZMKDKpt+yFCTkZIPd/TvThSDwdMlfIns9DB0NAB7FU19q3dhaH1f
 0L2Q==
X-Gm-Message-State: APjAAAX7UW3UVePJKLgm6LgQwI450yZ2kH1xenyvc3IOle9yw/B4Z1n8
 JJ4dkvMgrz7+3JUwUwIzhV4=
X-Received: by 2002:a17:90b:11cb:: with SMTP id
 gv11mr890469pjb.61.1573606330778; 
 Tue, 12 Nov 2019 16:52:10 -0800 (PST)
Received: from voyager.ozlabs.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id i13sm169848pfo.39.2019.11.12.16.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2019 16:52:10 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 0/4] arm/aspeed: Watchdog and SDRAM fixes
Date: Wed, 13 Nov 2019 11:21:57 +1030
Message-Id: <20191113005201.19005-1-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9TaRhUissHYq

Three of these are fixes for ast2600 models that I found when testing
master. The forth is a usability improvement that is helpful when
diagnosing why a watchdog is biting.

v2 fixes some review comments from Cédric and adds his r-b.


Joel Stanley (4):
  aspeed/sdmc: Make ast2600 default 1G
  aspeed/scu: Fix W1C behavior
  watchdog/aspeed: Improve watchdog timeout message
  watchdog/aspeed: Fix AST2600 frequency behaviour

 hw/misc/aspeed_scu.c             | 11 ++++++++---
 hw/misc/aspeed_sdmc.c            |  6 +++---
 hw/watchdog/wdt_aspeed.c         | 24 +++++++++++++++++++-----
 include/hw/watchdog/wdt_aspeed.h |  1 +
 4 files changed, 31 insertions(+), 11 deletions(-)

-- 
2.24.0

