Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2110352wrg;
        Fri, 17 May 2019 10:41:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyWpxO9mUmuqAPLm+vPoYTiAj+LKuO4ce54t8dCR/dDiN/TcZcjQ0yyBpjNXuVQ6+fBGQ2p
X-Received: by 2002:a17:906:66da:: with SMTP id k26mr45711946ejp.292.1558114915103;
        Fri, 17 May 2019 10:41:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558114915; cv=none;
        d=google.com; s=arc-20160816;
        b=OW+yUa3k9pxWIi7u9K3ceXTlxtvF/TVWW7jtgmO9iVbxNIyTOLWlHHFeQFvSnCAPRM
         XvSxUVJJ0s05v3kETatZEOyAcCJqYwo5uwNY7Nt07mxBflz0HtMafBsarToc6VPYy08x
         PxGB8rcmZZAjkQYF0ABknf75b6vH0okqntI800QeYykkiph9mdMg/1HEcoJJCTF15xgE
         7+IL/XQaW6L5Mt311dLJEjYxy3wdLGRTqNW85OW46vYulYztA0UCPLs/ktWzs1JD6oio
         tTowtgw+mKJooOLyEbElmZKm7ETy7vgjxoz/ZlySLAKVTI8ixRQ06Ce4fr6CkXaSDF6N
         9+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=NHqcTeUCaIUf4K7nIsxAw0DoSlAJnoOlQ+lc04URKg4=;
        b=Mqm/WJprWeDXLdc6o1nAO6PNuICnNIgfzzO383LQA8ZWOlf0uLCg+s0E9PHa/wkv3i
         gwSh9sBHa6x3EPHNDl0FvBHxu/uUPVOp4F8uJPDjquwgDwAUHQ5xbZezaRIY7/O+at6q
         LpiIjwJbkhEkUu3i++uZU2/Mzth79TjNgAkjtp4guYlOnb/4lGCAlh4dOZ0/dPRIcEUM
         c5UrTLG0ZTpCOJVHcolk5N4mDPot6Wgxa3XDIj5i8D1XshJtXu6PLxwRKHzKXlo2zKH0
         FE8U4FmT0okxYM76mhz9bNnij/OMfeY/1VnfVDDXfipfGCl3biByydR3Z6e8PBAuSvIj
         S9RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dp3Aa9fo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h31si7114488eda.11.2019.05.17.10.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 May 2019 10:41:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dp3Aa9fo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:51710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRgri-0007w3-4Q
	for alex.bennee@linaro.org; Fri, 17 May 2019 13:41:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRgqq-0007tN-RB
	for qemu-devel@nongnu.org; Fri, 17 May 2019 13:41:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRgqo-00038a-9M
	for qemu-devel@nongnu.org; Fri, 17 May 2019 13:41:00 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36187)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hRgqm-0002wu-Mt
	for qemu-devel@nongnu.org; Fri, 17 May 2019 13:40:57 -0400
Received: by mail-wr1-x442.google.com with SMTP id s17so8025746wru.3
	for <qemu-devel@nongnu.org>; Fri, 17 May 2019 10:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NHqcTeUCaIUf4K7nIsxAw0DoSlAJnoOlQ+lc04URKg4=;
	b=dp3Aa9foUBrPnuFoCEsOi/CuDhovzp1J6NLcdqvH8dxaogF1KZ9W0mqZX4cdg4qfPo
	MydfdJeCrh2IKEIv4/MQq+fxRW/AgKa5mjJPLhxAWH5rVoPPSO9yU61MRJQB6GgdnjEd
	s4Fm26EB6uNTSQnSOMjDfBVscCL87W63D1SqEobdirlUwEuTxkRZYvHZoPFMVwiTKZEL
	W8UTI8uaj7MffvaQeQQZo4w0Q4aMocgnAK8NN8iRjgeAGa5MMU+OnFuTu9dYof48FHrq
	7tKQMLo/cA+8/FpLGan44kNcsb89eiFfTH1kBXR8WlRoJF9QIrPz+/ttbTyzvqOjfJT2
	CwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NHqcTeUCaIUf4K7nIsxAw0DoSlAJnoOlQ+lc04URKg4=;
	b=qwhtoNVBp5tAJJLtkDSQ2TsXnNnBsQBsfT8Q6RMLKeoonqrPLHIDCSSMsxA5Y6LsKE
	6qQZUJtFr7BLaaQ8ijZEC2u3VhFKkUhHNCNS8+rh23fE+4roh1uOa3+lyeLOGUA+FT5h
	5sP9oPGwlx4SGzrhaERUhhbGt1sdEwcwghdLnRw8HAZ3suJEef5W3KotTXh5sK8PHKad
	1pnbTn0xo3hQmykiuln+2rOGKsLacSRGvhKiXHByJJ3+y9ZJ5xhDVZNzNsVfxa6AGtt5
	97UXQhX4tQsEHN+lWZCkm6sZ+wv0TIfPQSViJwIHVQfU1Kqa0xUFizWREpLjQx5xtqup
	i/1g==
X-Gm-Message-State: APjAAAWZPuSv9FFplR5NE3Z523//gP7y+hf4P3ws2iv1bkNU3rxw0hv1
	J6y6/zU8rcJWDz/eqeSbLuj1rJI/qs4=
X-Received: by 2002:a05:6000:41:: with SMTP id
	k1mr3794790wrx.332.1558114851174; 
	Fri, 17 May 2019 10:40:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	y18sm5418641wmd.29.2019.05.17.10.40.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 10:40:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 17 May 2019 18:40:44 +0100
Message-Id: <20190517174046.11146-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190517174046.11146-1-peter.maydell@linaro.org>
References: <20190517174046.11146-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH 2/4] target/arm: Allow M-profile CPUs to
 disable the DSP extension via CPU property
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 76RILe5LShd1

Allow the DSP extension to be disabled via a CPU property for
M-profile CPUs. (A and R-profile CPUs don't have this extension
as a defined separate optional architecture extension, so
they don't need the property.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h |  2 ++
 target/arm/cpu.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 778fb293e7c..b1c7ab3ee94 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -801,6 +801,8 @@ struct ARMCPU {
     bool has_vfp;
     /* CPU has Neon */
     bool has_neon;
+    /* CPU has M-profile DSP extension */
+    bool has_dsp;
 
     /* CPU has memory protection unit */
     bool has_mpu;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 406fd360a2a..c43139ba897 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -769,6 +769,9 @@ static Property arm_cpu_has_vfp_property =
 static Property arm_cpu_has_neon_property =
             DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
 
+static Property arm_cpu_has_dsp_property =
+            DEFINE_PROP_BOOL("dsp", ARMCPU, has_dsp, true);
+
 static Property arm_cpu_has_mpu_property =
             DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
 
@@ -881,6 +884,12 @@ void arm_cpu_post_init(Object *obj)
         }
     }
 
+    if (arm_feature(&cpu->env, ARM_FEATURE_M) &&
+        arm_feature(&cpu->env, ARM_FEATURE_THUMB_DSP)) {
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_dsp_property,
+                                 &error_abort);
+    }
+
     if (arm_feature(&cpu->env, ARM_FEATURE_PMSA)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property,
                                  &error_abort);
@@ -1100,6 +1109,26 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.mvfr0 = u;
     }
 
+    if (arm_feature(env, ARM_FEATURE_M) && !cpu->has_dsp) {
+        uint32_t u;
+
+        unset_feature(env, ARM_FEATURE_THUMB_DSP);
+
+        u = cpu->isar.id_isar1;
+        u = FIELD_DP32(u, ID_ISAR1, EXTEND, 1);
+        cpu->isar.id_isar1 = u;
+
+        u = cpu->isar.id_isar2;
+        u = FIELD_DP32(u, ID_ISAR2, MULTU, 1);
+        u = FIELD_DP32(u, ID_ISAR2, MULTS, 1);
+        cpu->isar.id_isar2 = u;
+
+        u = cpu->isar.id_isar3;
+        u = FIELD_DP32(u, ID_ISAR3, SIMD, 1);
+        u = FIELD_DP32(u, ID_ISAR3, SATURATE, 0);
+        cpu->isar.id_isar3 = u;
+    }
+
     /* Some features automatically imply others: */
     if (arm_feature(env, ARM_FEATURE_V8)) {
         if (arm_feature(env, ARM_FEATURE_M)) {
-- 
2.20.1

