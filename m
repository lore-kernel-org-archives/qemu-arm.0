Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1152014wru;
        Wed, 18 Jul 2018 20:12:20 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd9XQovjJcZlAhnVNhG6YKWPCy+V6Gn2fJ31ipDXhBnUU9sgZC459f6weBFog049W0iHnbZ
X-Received: by 2002:a37:9f4c:: with SMTP id i73-v6mr7615324qke.136.1531969940516;
        Wed, 18 Jul 2018 20:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531969940; cv=none;
        d=google.com; s=arc-20160816;
        b=fCwZA1BZIc9e4OF5bZvdT/Tkezd1rsBjzFZsvd4aY9ftMsfHXpYl+fzQ+n3Sa5O9Mx
         ny91leZows9fWHyHBRmoqZxBx1vM/DXbwFffkIraUVBjI/lgp+uwT+mlfftOO2MobGlp
         4Njast466+fHPSGxV2aNY55NQLZ/j4PIM1ISXjvfFQye3hqMS3sxMW9RFhoNTASwwrC2
         XoSGzLGBpn615YDhlcxYnwOFLATInhMRNDXZls7RrSTa6ayVmWLUh+CxUGECXupghK9S
         njfeg/VZc8EnUeLxgRPuc2QEp2qQnh3B4WdBa7xs32wemjCTMnuQHJIlNkMBoZHbEbnZ
         H3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=yjsjsEuPk8zzkNNrMVesOOC9+E4xh2yUbSso47H9vZE=;
        b=cdakakzU+OirwDg+LeXnHou76KbzKopSU6DH/SAzQlxn9mKWjNHjWP72609oC3YNyc
         x7tBXw9Oq+JcfI2iTjd5JvksuTzVY2IWqWJbcFtTAD1YAIUd1KxDy+mtsNOfPmbVhhlZ
         LZCaNCbBehyCRZ3urhHzaTAWsOW6uTdpcPZ0kMo78LMIG2hJp2Q2yDWAD17ADrzFnVpz
         W7pQfLN+MhtnmWzvr7sEAsr/O+ydPQ92fViyxhydmhkXemEQskd/jc4H9HocIVc0pneA
         /lffrx1vfkz+Xawhmja8W2XiQGktwjdTSnU4urWYDREiQYd00KXgIpNjyaARpf3zYrci
         FIng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="aPsllw/l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b17-v6si1029300qvk.127.2018.07.18.20.12.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Jul 2018 20:12:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="aPsllw/l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39356 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffzMa-0000mW-0p
	for alex.bennee@linaro.org; Wed, 18 Jul 2018 23:12:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hejianet@gmail.com>) id 1ffzMQ-0000gv-1b
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 23:12:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hejianet@gmail.com>) id 1ffzMM-0006um-S9
	for qemu-arm@nongnu.org; Wed, 18 Jul 2018 23:12:10 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:36998)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hejianet@gmail.com>)
	id 1ffzMM-0006tH-Lb; Wed, 18 Jul 2018 23:12:06 -0400
Received: by mail-pl0-x243.google.com with SMTP id 31-v6so2942713plc.4;
	Wed, 18 Jul 2018 20:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yjsjsEuPk8zzkNNrMVesOOC9+E4xh2yUbSso47H9vZE=;
	b=aPsllw/lq9urfrP45g5orjWCaVXO9wN/SOBrLdxqxb5MmIzRhRdTHPC7P4YHhi7g9+
	DY9r2b165bpNIM7cciMkTLCWQpuf0axuMIJHOkqh7CVoJhJumg0f5uILLm9Pg81bO0MC
	e6lNT47QCXA87drjJ91zPiDsVqYRjw/Np2zHfv/GgdFw5SIrclkWUDHh8H4WRuWbmvf0
	7gRn9eR+ESqVfy1xna8k1EfqZkkPfeTjBAL95L3Q+U6RJr5uWgg199fn/SM8giI49DDT
	pnt7JNpeGGp+i+9tNZVTDN8V7jNGAb4+9Xn7HdJ2TsO13aIJUjld4ZWlFLNWkHq4VlsG
	O3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yjsjsEuPk8zzkNNrMVesOOC9+E4xh2yUbSso47H9vZE=;
	b=emoImTiPGphnkeWj35+Wa3bAs90cJqfJvSJUBHEK76WTfU9MzKL4uGJPzsNmlV0tAM
	QoE7l7BDjtlI9cYCE51wHr4G5u73WQPoFexUTzl9Qn6UtyPvh4Y4G4epEjKqfHvvJ/+O
	AO+agCg0FqRTSmDYiv8CkwtWI3ahSnItmZzMGSxXT0bDaxkH63OXsiT6SWJSvJ0WKwB2
	eaW4uzn7LkSA3GqNnuFtcjR8Bdk2v8dMJFKpHnzWyHWUzkVf+E83ZRe+USW7jJDKq9vc
	xBsaT0HAZQkjpwnH0ZiWbhZkbPfdePgRF6IaxdObcSG/QYaD4wQKBBRih22WTvxcuIVW
	H/kA==
X-Gm-Message-State: AOUpUlFrnFpQysBE+OM+IKAoBlrCN0kasJz68ThpkhHrc10MNvIBMuTD
	hXqZpUzJcx2QkWpFhmdlqtw=
X-Received: by 2002:a17:902:70cc:: with SMTP id
	l12-v6mr8412148plt.132.1531969925644; 
	Wed, 18 Jul 2018 20:12:05 -0700 (PDT)
Received: from ct7host.localdomain ([38.106.11.25])
	by smtp.gmail.com with ESMTPSA id
	k190-v6sm7594571pge.28.2018.07.18.20.12.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jul 2018 20:12:04 -0700 (PDT)
From: Jia He <hejianet@gmail.com>
X-Google-Original-From: Jia He <jia.he@hxt-semitech.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Date: Thu, 19 Jul 2018 11:11:50 +0800
Message-Id: <1531969910-32843-1-git-send-email-jia.he@hxt-semitech.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH] hw/intc/arm_gicv3_its: downgrade error_report to
 warn_report in kvm_arm_its_reset
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
Cc: Jia He <jia.he@hxt-semitech.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e8newP0DOiOL

In scripts/arch-run.bash of kvm-unit-tests, it will check the qemu
output log with:
if [ -z "$(echo "$errors" | grep -vi warning)" ]; then

Thus without the warning prefix, all of the test fail.

Since it is not unrecoverable error in kvm_arm_its_reset for
current implementation, downgrading the report from error to
warn makes sense.

Signed-off-by: Jia He <jia.he@hxt-semitech.com>
---
 hw/intc/arm_gicv3_its_kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index 271ebe4..01573ab 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -211,7 +211,7 @@ static void kvm_arm_its_reset(DeviceState *dev)
         return;
     }
 
-    error_report("ITS KVM: full reset is not supported by the host kernel");
+    warn_report("ITS KVM: full reset is not supported by the host kernel");
 
     if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
                                GITS_CTLR)) {
-- 
1.8.3.1

