Received: by 10.223.159.74 with SMTP id f10csp709587wrg;
        Fri, 8 Dec 2017 07:02:26 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZm2JPaNR35yY0Va129N0nBbSz630BL95PaeMohDPx2eSBUuM9barDcDf0TPqCZT127mNwF
X-Received: by 10.13.193.5 with SMTP id c5mr20780506ywd.138.1512745345936;
        Fri, 08 Dec 2017 07:02:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512745345; cv=none;
        d=google.com; s=arc-20160816;
        b=TdyunlPPLyceEOb7Sf7rZNqfXRitCKB7ao3BI7M3CNWAVlPwgLP3KfpHm4pcY59IZc
         XWm5iNJ/zlbmwmgO+D7fbvqRs6dZfvyuWqfUkBwkV81InRuJ4ibZgnVZdWHjplXhyd1C
         6anS0GDJsszESRTKo8v7lTmiXOaNr+SlVRmiHY522IVQTNtmQA1DvopVgmPihI8DPlQt
         iFAklZ7CamKzPrcUQpC9xFa5f468D6jFMakbK/SmbO9H+AtS6O4UQZGs1utxj/p0ckX1
         Bx78b4WTrBh4RLnygx1euU/XxO3V+XiXhEKgzmDOt5DPypzSiKa7LnN55xoi+Zn4YmPw
         moYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=lzYzORamLswo+qW25/t49vS+EZpGzxNVbjLeal3RjPQ=;
        b=lchBMQox599uNvTBEP79NDjsj80LlUTUBFKJ4s+cnj42J2z5SDB/6LtHnVnjAzfdTz
         6LClUVc3TMLBOSyOipytCChMR7PBghpXHPis5Rsq1CMTiUWdATJDLJa0L73ltMJnlTe6
         EyAltWE+3iQ8jI5INcDYz39fz6jZiA+njq2EU7Lai4L4mIqd1pPVOd6lNqyISodHOe6Z
         BG5lLL73ThJDEL5BgpB9qmipaJ6ZvccJKNeAo0KulIPY4YdIKCJ9pT4af7VDX2QQMhCa
         X4qhGbSChkX8p8SszPsM83PLbQnHs01HJ367h84cGkAc7MZ+CEYEKkXLvKJXyRgphDH2
         0Kbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z31si242156ybi.373.2017.12.08.07.02.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Dec 2017 07:02:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eNKAT-0000bs-E3
	for alex.bennee@linaro.org; Fri, 08 Dec 2017 10:02:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eNKAJ-0000bh-O6
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 10:02:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eNKAF-0007K5-SY
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 10:02:15 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38946)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eNKAF-0007Jn-LH; Fri, 08 Dec 2017 10:02:11 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eNKAC-0000tD-Rl; Fri, 08 Dec 2017 15:02:08 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  8 Dec 2017 15:02:05 +0000
Message-Id: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/3] hw/arm/virt: Add another UART
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oP7tvNNajlZt

This patchset adds a second UART to the ARM virt board, which
can be useful in some cases where you'd like a second comms
channel but don't want have to deal with PCI to get it.

Patch 3 attempts to add it to the ACPI tables, but this is
entirely untested and pure guesswork, since I don't really
know anything about ACPI. That patch needs review from
somebody who does know ACPI :-)

thanks
-- PMM

Peter Maydell (3):
  hw/arm/virt: Add virt-2.12 machine type
  hw/arm/virt: Add another UART to the virt board
  hw/arm/virt-acpi-build: Add second UART to ACPI tables

 include/hw/arm/virt.h    |  2 ++
 include/hw/compat.h      |  3 +++
 hw/arm/virt-acpi-build.c |  5 +++++
 hw/arm/virt.c            | 38 +++++++++++++++++++++++++++++++++-----
 4 files changed, 43 insertions(+), 5 deletions(-)

-- 
2.7.4

