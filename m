Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4709231wrt;
        Sun, 25 Nov 2018 12:55:41 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Ut15VVx7O5XlLPekaxsWJxRc2Zz9IAk1CbS9ZsP6TcLqVru4vqAcwuJF9lFFdrEXESelPc
X-Received: by 2002:a0d:f905:: with SMTP id j5mr3042308ywf.267.1543179341912;
        Sun, 25 Nov 2018 12:55:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543179341; cv=none;
        d=google.com; s=arc-20160816;
        b=qyUho6RIGleX1TRv0i6jCdjSNAK/MWr56+wqmdT2oubhQHNluqwmIersw2942+PuL6
         rVW+OByUqsD6zEtlNEirxsw6vHcAqhpaeGY9fUz7sRHugIg1LdZlVErxw4O10ID4Lee0
         1p9SG4MThkOZEz0N/hZhsnAMRFsHUMjtXPbmRzwsYtzQqYpljw1i+mJ1+b8nvIvCVVOK
         52ehamknWb4GnWGYcNhJ3HL9tXXdkV9GShT6BVt6TzpzsrZSh1aFxNXmtT3c7dFkjrsc
         xaIKTsqtqICJokEMQ3CY0uqt80z4gpJj/yv1qnldFQGxZc4eyCM5l1TQqiV4fVfGqmms
         VE9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=s9eDngiAySZj0FZzrOyEawrEqtPv/KJ+pyyCVtaYnb4=;
        b=LGZp+rHpTxMqElVCTlxMG3AIAjmkho97Bh2GMuz0uXG6tZuY07Mhnm6eHExWMUSqd9
         eqObeTEDzwhTzK1NoFLpXOmOT/dcNDCtteJHJBDDop4MaljhIfkMOV8OVqAVffa+YM3k
         h6jpX2Ow4TEeaoGMjz94vvTQFfG63RXueqK9Rkz5JJysNl2WurJc1QDIgthD53/4Asr7
         Fro06rEGz8LRvOWO1Kl3C2QzZoolktnhGlTAgjcE9bbM7CcHjsUfOTfOFnBVv5FarebK
         H4mRdn06iVLx/NJdL5jHbkQAO9jxcnxG+PJTymjtA+dHuCV7D9TM6SxnnDMgyX8LZl1w
         aFqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7-v6si37387907ybm.317.2018.11.25.12.55.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Nov 2018 12:55:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32960 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gR1RN-0003W3-8m
	for alex.bennee@linaro.org; Sun, 25 Nov 2018 15:55:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39250)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1NU-0000Bo-2C
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 15:51:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1NT-0005hb-93
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 15:51:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33602)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gR1NR-0005gE-LZ; Sun, 25 Nov 2018 15:51:37 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFB183082A46;
	Sun, 25 Nov 2018 20:51:36 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-26.brq.redhat.com [10.40.204.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D33835C1B2;
	Sun, 25 Nov 2018 20:51:30 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Nov 2018 21:49:39 +0100
Message-Id: <20181125205000.10324-5-philmd@redhat.com>
In-Reply-To: <20181125205000.10324-1-philmd@redhat.com>
References: <20181125205000.10324-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Sun, 25 Nov 2018 20:51:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-3.1 04/25] MAINTAINERS: Add missing entries
 for the Xilinx ZynqMP machine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rVO01N3iqZEw

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b9996ab2c..007f89f126 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -711,6 +711,9 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/xlnx*.c
 F: include/hw/*/xlnx*.h
+F: include/hw/ssi/xilinx_spips.h
+F: hw/display/dpcd.c
+F: include/hw/display/dpcd.h
=20
 ARM ACPI Subsystem
 M: Shannon Zhao <shannon.zhaosl@gmail.com>
--=20
2.17.2

