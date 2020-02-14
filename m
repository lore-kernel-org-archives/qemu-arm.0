Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2202919lfp;
        Fri, 14 Feb 2020 09:55:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqx2pHFl7mAp+t3+rr3VwRrdDx4aLqbCu7F7awCULX6UOtslm3wGp2KupYqak6MxmsOrRn7E
X-Received: by 2002:ad4:42aa:: with SMTP id e10mr3245454qvr.92.1581702959448;
        Fri, 14 Feb 2020 09:55:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581702959; cv=none;
        d=google.com; s=arc-20160816;
        b=z4j8bb2xh+/UuJENghHRZ9OWxLIklhq/cZ5fRyTeDKBcqtFqu6ZvoodbEl8HBcgvrh
         F7Y5zClXRZphqpj0Isi40h5jiw5ImuZTwia+a/nCqLlFbUPympwJASQgH9AM2beAb6xe
         E0RLOiZ1PHaUDTpvag9gr17grY7Y2AY4G79QyGolyj1iHbRnk0QikD3ErMFEaztNyuri
         HN4pvfr3vL1OKgcfV1VRnt+IzIJZ2+bbtBTheFaw8hadulD4cIoxqChv+4Mb03sz6OrS
         PQ/meQ6k+Xsdxx13EkdLGbFlSbsX6QxfXIdwSCNa7lmdreCL1yE0+cNV+n0x8mg5WJRm
         pnQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=CamjQrx2ACX1pcdy+Ha3T8xE7Ntp0ezj0SgMxc8gmcs=;
        b=FNAFYPugD85PRzTlle6SV8RR4qvspgwLUsfyEmIV5noFoVunSWxZUy2Bza5VYngzQI
         L0X/b4/2E4Jd30ipr0ludvV/A9YN9TX9mxA5dqzR+d7BkhphT8Nncut04JQ32QuN4MyP
         P+fQrRKwCbbFXnAtrNzpJ18SEAFNwdOIJO4opz8Zp+Wdn57FA3zLXyPA+8I9j/sBbnFR
         ngp7oSMgskxnelXVVGEkepRpstCNXZOBrzazf3tR+ZkaiQqAWFYeuAKNBjdrORI8cfXn
         IiO/vNhqwadeU7XkU6vUVC3YXlkZ/f6MJnbFQntGR8XTp3ecJ6w/Xp1GKDKkwGsghA6e
         QKcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="c4/UMPy4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y202si3243047qka.326.2020.02.14.09.55.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 09:55:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="c4/UMPy4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2fC2-0007fJ-TK
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 12:55:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55970)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7k-0005tY-FI
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7j-0000lV-Dt
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:32 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36021)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f7j-0000kI-7j
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 12:51:31 -0500
Received: by mail-wm1-x343.google.com with SMTP id p17so11555292wma.1
 for <qemu-arm@nongnu.org>; Fri, 14 Feb 2020 09:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CamjQrx2ACX1pcdy+Ha3T8xE7Ntp0ezj0SgMxc8gmcs=;
 b=c4/UMPy4cEWJPOu19sIDnKbKBQHCK1UaTu2xAKNM7G9dpBGC0BpTwrms73Tw7DHAOp
 W/EwyK0Y6/aVJnVYm7U3+YbYtoFFHTNPjpRo559U8tBzqELS0evaNTQZOfvKso/CawwS
 u4lLC9WmW4YDEZG4acOP6YVl17f10YjGj0tKVknruBhTk+PFS0r6/Jc8/mr8B3rB+fhE
 dhcRFK3jj1mFvxOQvLk0427NibQLjYKnwVx8AUQipFcJIw/MLIUpPCy/zBoH1G7p0Kh9
 1O/Tg1YAMytA0UgR2oCfd3On9i9FwSIkzr1IvPaNHucldAkewUdK29EicVxuMOPipeD8
 2vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CamjQrx2ACX1pcdy+Ha3T8xE7Ntp0ezj0SgMxc8gmcs=;
 b=pSbqyURMj3bMozop6WZ3BWrLc7/ZLu1MwJBRnrZtwL9qqzP6xDmbLD/kBzLqC2ePS2
 imEp8dshXJXPZnDLwHO05I/Rn4hEpSIM9iJAjP1+5jYYwYO7KhWQal7Bat8e02tF17Ge
 4fK9+/knIEE6uFC5wIS9qrxEiYSHuOSj7j5oVpbmbmtHdZWcML0d7p7TptngctmodeLP
 XuXoap0stVS5dEPzGbksn5QBKV2E2UwPK+I74ttLdZeXHUo7W2Uexzqti2TFUwbBbBY8
 zOGhrYtYod44TcwGlj+bFdswY096j1PkmY++tx/kvGKe+4iSkc1b7rSlOAropBEx8NO8
 /rdQ==
X-Gm-Message-State: APjAAAXBc2oipkntR6agyHwn+Ehsrz1iq/pEWRuqpdoT7DKDEH2ypnQQ
 coMNrBW26Y123FgjNe86a74g4mcJhfo=
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr6083108wmi.118.1581702689959; 
 Fri, 14 Feb 2020 09:51:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/21] target/arm: Use FIELD macros for clearing ID_DFR0
 PERFMON field
Date: Fri, 14 Feb 2020 17:51:02 +0000
Message-Id: <20200214175116.9164-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gnvU/mhP6xrF

We already define FIELD macros for ID_DFR0, so use them in the
one place where we're doing direct bit value manipulation.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We have lots of this non-FIELD style in the code, of course;
I change this one purely because it otherwise looks a bit odd
sat next to the ID_AA64DFR0 line that was changed in the previous
patch...
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 12bf9688007..1024f506c51 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1719,7 +1719,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 #endif
     } else {
         cpu->id_aa64dfr0 = FIELD_DP64(cpu->id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
-        cpu->id_dfr0 &= ~(0xf << 24);
+        cpu->id_dfr0 = FIELD_DP32(cpu->id_dfr0, ID_DFR0, PERFMON, 0);
         cpu->pmceid0 = 0;
         cpu->pmceid1 = 0;
     }
-- 
2.20.1

