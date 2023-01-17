Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2784272ejc;
        Tue, 17 Jan 2023 14:06:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvLUwb9i5KFXoRnKz9IPfv9flpRg9z9TiET//YjCTGDGOyuq9JopZnu40HZpOmomr6ErFpc
X-Received: by 2002:ac8:748a:0:b0:3a9:89f1:82a with SMTP id v10-20020ac8748a000000b003a989f1082amr6451569qtq.61.1673993174752;
        Tue, 17 Jan 2023 14:06:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673993174; cv=none;
        d=google.com; s=arc-20160816;
        b=FXEWLmyvedzOuvkFMEEX6Bap41k5gOUyIIrNkS2cXwGV5p4gPJoVjlC85k/OGBLp5f
         3NGnbuub+oAGDYtFS8uawRVSs29rh9M5hN2Z444FgVWaBCuARU1krcXVzyGH8mzBER1G
         n+8xJLpiopVmVyyUeH7QXFn6ll5MgzOpVOvTDVgPH+RaZjrdrInscaX1rBZgqrdMiEu/
         1KlKd73k3r5y9b/iGeBKyOnSj3T9V/sLpzR6LXKVFBE26SL75zEABg+2hRyPswn38uwK
         erCOB3e+us8B8SVq0rF0Dfn3APPhkJTABR/NaHSghcsptH4pKwh7CvatPlg5TMTwd/eU
         FrzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=QG3pbMMaVeOjU0TIv5v3Kd37Jdnt4gLyHr4rBQg65Gc=;
        b=ZYF9n5P6X5vkb7uMhnemdizxR/Yj26vGfSqNHgtXdRs+vjQiI8Folbj/yvFpJx+Zq/
         M3iiA9DtTmC1gmJpJpwDn3oQ2eGfq8p0GTfO27ihNCe8GJ45vlBdvzq7w4/WY7hlFFzM
         hruIht4irt61XBRwYET63jTbQby/NttdeXT8rFQ3bpLhXizrzZwcGKs1VwXhl1crxhFQ
         s1ugpHX9ppp1qaPBWORfB29yil9P7PU8jZnvsE1Ds20Oa50e9/JtfrwOnCsS0YBvw3QH
         oqp1a4gOrP3Zae3FvPTd2pNtpylQ4w5YeFWCGXyPqz4irErhVo0w+1+Sl/ZRQ3nVptd2
         QMGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=C4puCGmh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b24-20020ac85418000000b003b634ba83fdsi2888059qtq.677.2023.01.17.14.06.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 14:06:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=C4puCGmh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHu5R-0003fv-Si; Tue, 17 Jan 2023 17:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHu5G-0003cr-25; Tue, 17 Jan 2023 17:05:40 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHu5D-0006px-ID; Tue, 17 Jan 2023 17:05:33 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 0FCD820E09E0;
 Tue, 17 Jan 2023 14:05:28 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0FCD820E09E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673993129;
 bh=QG3pbMMaVeOjU0TIv5v3Kd37Jdnt4gLyHr4rBQg65Gc=;
 h=From:To:Cc:Subject:Date:From;
 b=C4puCGmh7G0XjLqCaDYzc9iqBD9c7v4Tbt7RfjaELy/qkW7Vss5ZFCO+nfDbJaQQP
 /8QxWU2Rs2Lg/QvYEKgOdx31jHutbnNPG8xIl4A6r2e75L9gUqGGTjnXkeQ1CginFc
 hkhltmJnEdw7iCtvngCZsQopOB+gF6MjnZlCcS0U=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 0/4] Series of fixes for PL011 char device
Date: Tue, 17 Jan 2023 23:05:19 +0100
Message-Id: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: r45dwccir67o

v2:
* Moved FIFO depth refactoring part of FIFO flags change into its own
  commit.
* Added a reset method for PL011

Evgeny Iakovlev (4):
  hw/char/pl011: refactor FIFO depth handling code
  hw/char/pl011: implement a reset method
  hw/char/pl011: better handling of FIFO flags on LCR reset
  hw/char/pl011: check if UART is enabled before RX or TX operation

 hw/char/pl011.c         | 78 +++++++++++++++++++++++++++++++----------
 include/hw/char/pl011.h |  5 ++-
 2 files changed, 64 insertions(+), 19 deletions(-)

-- 
2.34.1

