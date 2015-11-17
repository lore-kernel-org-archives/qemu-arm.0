Received: by 10.182.158.201 with SMTP id ww9csp729866obb;
        Tue, 17 Nov 2015 05:42:45 -0800 (PST)
X-Received: by 10.31.164.216 with SMTP id n207mr3855278vke.36.1447767765313;
        Tue, 17 Nov 2015 05:42:45 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x77si2727138vkx.201.2015.11.17.05.42.45
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 17 Nov 2015 05:42:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58488 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZygWz-0001aZ-09
	for alex.bennee@linaro.org; Tue, 17 Nov 2015 08:42:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZygUs-0000cO-Bh
	for qemu-devel@nongnu.org; Tue, 17 Nov 2015 08:42:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1ZygTN-0003Zg-U0
	for qemu-devel@nongnu.org; Tue, 17 Nov 2015 08:40:34 -0500
Received: from mail-lf0-x22d.google.com ([2a00:1450:4010:c07::22d]:35656)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1ZygTN-0003ZG-Lj; Tue, 17 Nov 2015 08:39:01 -0500
Received: by lfdo63 with SMTP id o63so5537734lfd.2;
	Tue, 17 Nov 2015 05:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OFJ514b9NEcFDYl1yj6Qz9zB+IKUo6A1I9eBKOR3s7w=;
	b=qycsZ4dSMwFPcePAk0kW1tDeUWyd2GC7vPrufohmMo1PWGjUGfBkmWZ0p3ERRsfNIG
	gdHu7I5CMLxMXPTd7CbhuR8MiDRBhvGSMF8c87gR6EsIj8LhMwGmXx5829htD5Yi5E+h
	HL/YSAgrNtRXeRFFKetQT9d+P7LfHuvTc+ZQjcYblWc6d/lz0I14YhbEDMZSlKMC+Mnd
	m6/NBTlEQPOHetqwL9ZyEGZ2bDRV2EWVbJZslHQERLmbGkThc9urjNQxhRa96IY8aTQa
	plW2k+rond9Zd+L4YEKFSi2WhR0BUrkZV7LZbRUJPgATA1r8QHdrQCvvRmjBlaLNypXO
	9gEA==
X-Received: by 10.25.207.149 with SMTP id f143mr20478016lfg.73.1447767541046; 
	Tue, 17 Nov 2015 05:39:01 -0800 (PST)
Received: from sfedorov-laptop.smware.local ([213.243.91.10])
	by smtp.gmail.com with ESMTPSA id
	u12sm6342000lbk.45.2015.11.17.05.39.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Nov 2015 05:39:00 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 17 Nov 2015 16:38:45 +0300
Message-Id: <1447767527-21268-1-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c07::22d
Cc: Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-devel] [PATCH v2 0/2] target-arm: Missed gen_set_condexec()
	in AA32 translation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: If3NlO9pkh4H

Changes in v2:
 * Typo fixed in the first patch

Sergey Fedorov (2):
  target-arm: Update condexec before CP access check in AA32 translation
  target-arm: Update condexec before arch BP check in AA32 translation

 target-arm/translate.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1

