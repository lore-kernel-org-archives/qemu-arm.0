Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1479311wrt;
        Wed, 10 Oct 2018 13:39:27 -0700 (PDT)
X-Google-Smtp-Source: ACcGV629GIAyQ0csuVwYC2QdBmGkLKaVdOyebwWbqRUtvBnBUUMH1v660X5e39QxS21mR4+o76ZJ
X-Received: by 2002:aed:2498:: with SMTP id t24-v6mr30066785qtc.131.1539203967060;
        Wed, 10 Oct 2018 13:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539203967; cv=none;
        d=google.com; s=arc-20160816;
        b=jNlAJqSyDt3F8juR3oWrLZIQkp9S3lR4NZVT/96wtRRFGhkFJ/SC+lZrIzJGyhW7JT
         7ur2pnBIj+0V5wdtDg1Xekc/tCbaqvh4pweoCpaLljPopJ5O/EOs7zDnqmLyp6+hRM7a
         N362kh3ogH70BDUdu1SaOHeg+QywlANipwTrE34+qVenCSx/L1hXvJywP/2+PCk8mYff
         5uWxtmyAzxc+cUQlIdjW5Fy+w4ZYTHWNc8DTyusIY2YUdE/Mt8/KXSp+r/LdzrGYuLal
         deJ7TfFN7j5bRAjvznBqRLY9dO5dX9ZblEkZOU+bH48vjaH1RB5+hN11b0YRl/c1NCSi
         y2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=epJp5s2jRMOo1Q26kIc83hFAj7hWogQkg7AnaFDhYiQ=;
        b=Y9Ski/NfRybvsZl6XlpUAr9stIhJ28cRvbdaQfqSyCJIwXXrsyIXoYutjCoMcQpYlu
         4vRS89K3uy2Gtqh4wKxQOsPrU2IzDvksR9Yg1dP4HwGFj+VcNXS7eRyjOltSxN1pF/XM
         U2mPU3TQxAqthyDk0EUJqu3dvOeaxlLb2VxX1+bF+VVic48LCA+J0ZaABw/DhBCCKJhP
         G+SAXEZE2RtnXz8+GoBX2Rtda32OiNIApQa3nRQ9iXKw30Qt1/YYZjQWPyO5fRhgw1qC
         8BZpxwBtJpu6O4o4EjIeRQ6F23JUDun1bz1Whgz0183BwMIq8M4zaGf0LnoEsz4Xuv7T
         ViPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oUS9Coit;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q125-v6si12635646qkd.100.2018.10.10.13.39.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 13:39:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oUS9Coit;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gALGQ-0003O7-GJ
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 16:39:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFZ-0002ox-6e
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFV-0002PF-PY
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:33 -0400
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:36965)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gALFS-0002NZ-Sy; Wed, 10 Oct 2018 16:38:27 -0400
Received: by mail-yb1-xb41.google.com with SMTP id h1-v6so2762019ybm.4;
	Wed, 10 Oct 2018 13:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=epJp5s2jRMOo1Q26kIc83hFAj7hWogQkg7AnaFDhYiQ=;
	b=oUS9CoitPfGxjrjrRb8uW1vZvWziB8rf+tBxmwKBwh7Uc6rCdthdGj9uqgk6MvyAJq
	sb92Rvj00hwLAP2NaIqkfHzMD7ao7fCYorilrQb15ADcgzcnYiJHQWU+79R7HgaTwoge
	DJETvFxHdBtU8o4Lir5Tmv+hLtC/2u7R1nzU5goZLR+MxcreRt3nFrRBLkIn0J4kioS3
	LkpcaBzPINRUwiHpTACXOKndKtnzNbvHSXoPStvw3W3KNjqJJHtPqxVX/1ef/fTAinlg
	7n+AUFvK1qEGhmJIAxi/3LaQiIaJRVHUYz43dIb/vWX9Spoh5Ccun25VTHiB557uOPmd
	2SIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=epJp5s2jRMOo1Q26kIc83hFAj7hWogQkg7AnaFDhYiQ=;
	b=TIjsNZXBygklpTklG6sA7g12y9DGVpq7vTdmpFdi/9txkz5XfnJGuqOMnty65XQxWY
	AzBJHyQ/qP3O5tkNE6b0SJaigkEAlu8lMsIoEOd9GNYH+aEqvGwZzVGOuw4sBwtxwrr/
	BoSsh9MUt9K91eEbSaJjO/wHMrPO+iDA7qz7sVk3V8P4enSY3ncsBqXVC2JpNBNK0ewe
	Nvt4/guTNZiJqOUyOlyd/wzF6uUcqeAYPFErY98Rc8qnMNtz3JJAfxe8QTlYnH/0bXs5
	x1qKx8z3gOLSjIaHT5LdPe68CbpcZibmqmeC1Dpv6/daG8GfzdzLQtkTCkxzfmp6rXqM
	XB8Q==
X-Gm-Message-State: ABuFfogg7Vd4Zmb2ksP6cmEaZnyX+1CraZBVQzGED9HYzCeXXmsP04Wa
	kBp2ppdPL2lckDntL0XBWTLh0Sv1
X-Received: by 2002:a25:4246:: with SMTP id
	p67-v6mr19978771yba.178.1539203905140; 
	Wed, 10 Oct 2018 13:38:25 -0700 (PDT)
Received: from quinoa.localdomain ([216.85.170.153])
	by smtp.gmail.com with ESMTPSA id
	u131-v6sm15170728ywf.13.2018.10.10.13.38.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 13:38:24 -0700 (PDT)
From: Aaron Lindsay <aclindsa@gmail.com>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 10 Oct 2018 16:37:23 -0400
Message-Id: <20181010203735.27918-3-aclindsa@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010203735.27918-1-aclindsa@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::b41
Subject: [Qemu-arm] [PATCH v6 02/14] target/arm: Mask PMOVSR writes based on
 supported counters
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>, Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tmq0IVRogBqc

This is an amendment to my earlier patch:
    commit 7ece99b17e832065236c07a158dfac62619ef99b
    Author: Aaron Lindsay <alindsay@codeaurora.org>
    Date:   Thu Apr 26 11:04:39 2018 +0100

	target/arm: Mask PMU register writes based on PMCR_EL0.N

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 52c76b7444..8ca4d30797 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1179,6 +1179,7 @@ static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                          uint64_t value)
 {
+    value &= pmu_counter_mask(env);
     env->cp15.c9_pmovsr &= ~value;
 }
 
-- 
2.19.1

