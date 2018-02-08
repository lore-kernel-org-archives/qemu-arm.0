Received: by 10.28.71.27 with SMTP id u27csp2316511wma;
        Thu, 8 Feb 2018 09:14:33 -0800 (PST)
X-Google-Smtp-Source: AH8x2250LN4t4aG+fyicmDpFJ5a9AQig0QE8NgEM9e72GtPmpvB34Z6sfHXa+8YL6jXgvfrLlyAJ
X-Received: by 10.13.214.14 with SMTP id y14mr1059231ywd.43.1518110073129;
        Thu, 08 Feb 2018 09:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518110073; cv=none;
        d=google.com; s=arc-20160816;
        b=CPPiTnCKk+icL0PLmvMzF5s7Sd9FPkT8SDoWBRVdFkU6MniPRUOcy0jGgmaeNqoqbf
         NWgsSO4+cyNN44h9+iiVuCaAWj0rR0mVGk95JfR+tfOEwKJUPmTugZoDBPXUZeqSs2D/
         VE6iruu6zqD0sMySyzwNmaeLqL5i1o4vMn8TOCAoCZPbW/6Srs/1l0Ma6crRZuB4Gth0
         THCKE5nxkFk/Gf2k0sWbz+sL2OTtEE7dK0HabzH3j2s9vrwt51vIz0S/wO0xuUYWnl4w
         khkuQj30KTS8DYsY39zAcAxrx/vX6P0u8CKIoU5orhro1ejsexYh83imLyDNU6KcpjmO
         A1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=fXbDYPKBtb1ob/8HMTylq1noEaiAiTKM5rsfys7N0tc=;
        b=pjDuN/IEQauwXCBZ+Ymyi9ZabzmsIYx42nN9y4LVmrELohtgai5lbNy2Ez4MWWS1xK
         xr0n/jqCQo2kx2JVUCWnh6Soqlb5M6iKb0CnqD+VlFWASg8Lg16vmvpOThZP6KQhHi1i
         H73Qg4zP+7X2CNnxsGQ9bDSsTO8TxFT6idwsaIUeWq8ZWpSEzCkvO2nZjiz6cXYQrV+5
         Qt8HCkOJqbAxQgw1ZIlpojEqyVKpYZuOTHDnUdaxbr1u3eoCNd2d+6LNB7UtgN/Wl61E
         tkTLoksF+uGTF50DW3apGr4CEwvGBY0vF5laWSLSH2f9Q93pCJADeWTip0DXAvwVjEJp
         oGFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i0lgKhjU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t125si72883ywc.8.2018.02.08.09.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 09:14:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i0lgKhjU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53494 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejpmK-0004Dl-En
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 12:14:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpOL-00008D-BQ
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 11:49:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpOK-0004Oy-CV
	for qemu-arm@nongnu.org; Thu, 08 Feb 2018 11:49:45 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:37095)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejpOI-0004Ni-2l; Thu, 08 Feb 2018 11:49:42 -0500
Received: by mail-qt0-x244.google.com with SMTP id s27so6992907qts.4;
	Thu, 08 Feb 2018 08:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fXbDYPKBtb1ob/8HMTylq1noEaiAiTKM5rsfys7N0tc=;
	b=i0lgKhjUXS3yRFae0QP1MXAKXiephGu5ed184Q3CcBlksrerhndz0l2I0ET6arAgRI
	zFQp6jlV+WHcT5zIyaDfk9BW5JKx0jClmVMOaoSfMFz9gNARP5SqAPLCjJJUZNXszwhR
	EXkWhIuIPM/pt11bqlzrDd/IZGnTgNYGW+6nyrE4pNNfOp22DCFO/KufOqP54HQy8kQl
	MwJB5/iNq/VQIGljuiyoIZmvwB5xaGmMi3rNKcX8qZfVPUOSuV/mPObJBEa1qiitpKAX
	1JJgreqEy8bodVUUk67vI2IDRbr/AaqBCCx+QiRhxh+NOyewC/m75eIrMoW5CEHk31IM
	1OZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=fXbDYPKBtb1ob/8HMTylq1noEaiAiTKM5rsfys7N0tc=;
	b=Becofo3NhNwAHA0JhJZGsd9X26tI0ZXj6tlZNcdrNxyygey7Se993JQePAfgeKcF4F
	U3JpIephIUQ9ng6abTzRVHVmAZjcCXqY18mGPodlFGYdPQ3dGW0dBuh4rWpco/idEyU8
	hBUXUWgvQ/WflPDXHyD705/6HPP+yu/PJ8T2fcpKwK2Dv+x4qHnoTAvWbb3gJzs/ztYy
	VZRuBWhPPmY/Qy1w1k9P2KpolFeJSPnZM2G6sCZkIX9Aun2eJz11Pf0gh1qpvm7+gEvm
	BEAwPCDgLViHD1HrEHtMMUSr8zLdHmF2EBI1wcyZ407oFnkiBd2gPm0fnBZC61zdJu8d
	mlHg==
X-Gm-Message-State: APf1xPCKCtcl4zrj/3xgmfHJPqXHMyrp+XMm56apYVvkARZ8IP1RUb8c
	dnWczSqanDoiIQDjhV23NVM=
X-Received: by 10.237.62.211 with SMTP id o19mr1915941qtf.221.1518108581568;
	Thu, 08 Feb 2018 08:49:41 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id z66sm240905qkc.9.2018.02.08.08.49.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Feb 2018 08:49:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  8 Feb 2018 13:48:12 -0300
Message-Id: <20180208164818.7961-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180208164818.7961-1-f4bug@amsat.org>
References: <20180208164818.7961-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-arm] [PATCH v11 24/30] hw/arm/bcm2835_peripherals: change
 maximum block size to 1kB
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NQ8FqRpLe9Vv

following the datasheet.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/bcm2835_peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index ca971e83e0..13b63970d7 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -19,7 +19,7 @@
 #define BCM2835_VC_PERI_BASE 0x7e000000
 
 /* Capabilities for SD controller: no DMA, high-speed, default clocks etc. */
-#define BCM2835_SDHC_CAPAREG 0x52034b4
+#define BCM2835_SDHC_CAPAREG 0x52134b4
 
 static void bcm2835_peripherals_init(Object *obj)
 {
-- 
2.16.1

