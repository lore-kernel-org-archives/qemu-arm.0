Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp1752333wre;
        Sat, 2 Jun 2018 07:15:31 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJup+5iby8YlSTZ/fsJd98LvVjLIFMRvISolMLWDJFLBIbKJe8IOCc2NH6VuK29gFY8pQ5X
X-Received: by 2002:ac8:26b0:: with SMTP id 45-v6mr14541475qto.318.1527948930974;
        Sat, 02 Jun 2018 07:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527948930; cv=none;
        d=google.com; s=arc-20160816;
        b=fz1DKMRAVCncT2OHFupknIMyfgaSV84MWec5bH62kK3rhPVYucTjfdzLxbCudVVR4R
         MLzmm9iA5dbFZSYSdkzIjJf5V4g7TjqUH/zUDsawTMLjjjrrzqepYhxWvhYZlMyA4Q65
         pIjJEdP709g2PGMJr65G1aDYOl7/5J2Ez0mMwD163yjTzFHB08OpVe1CQduTGvw2gsxQ
         uRSfNmNf/UFXa5aXQAf3SQLSjJMxrjTdyxevuef5WIA5baK7HsjeDTt+M2dhYa4hKyDZ
         phBLG7PAWtxSk+aznRvA55oJzhKhYF4u3xBEjr/m9W5RBkVZSmCjCRYFJ15Ows1DnDWH
         mTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Eb4iOifk8vdQ6euEoZbZ6LIzsXsq5nn4VoCO4D+i6cQ=;
        b=TdNGn8oYTkTupd4vxT6xqc41lhJZgQO9YR9CJJNw8zVfn0Bk2cVj2KEHFHCqNinwmL
         yp31SVb+BOWW/h6Y1YEJzTiORjly30o2bG1H2wkCj77P7Wfj+1U8ex6w0x0VRyHtZVSe
         Lsy/YkWLG/ncnCv8WLdT9qrYYvD/ToSnO8viayVxnu2V7pqMG0yd7NDvwn3Fl6E8RgvE
         RramXW3DhUchqQ+YsKyqudo/uBXZ4pHDe8INRtiU1ufbC7NMLmfydrhYjE8ZH/Gyuo7t
         4ACapFZTdxqT1fxL6OlAKdnVEo3dYBPIFGaMEWdRb5iByvLjbrGkmvAbWjtcVblE139D
         LibQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e31-v6si6410135qve.100.2018.06.02.07.15.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jun 2018 07:15:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fP7Ja-0001Wj-Dn
	for alex.bennee@linaro.org; Sat, 02 Jun 2018 10:15:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fP7J4-0001Fv-7S
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 10:14:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fP7J2-00075w-7a
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 10:14:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59816 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fP7J2-00074j-3K; Sat, 02 Jun 2018 10:14:56 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9548B818BAFB;
	Sat,  2 Jun 2018 14:14:55 +0000 (UTC)
Received: from localhost (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 857F61C707;
	Sat,  2 Jun 2018 14:14:52 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Sat,  2 Jun 2018 15:14:45 +0100
Message-Id: <20180602141446.29982-2-stefanha@redhat.com>
In-Reply-To: <20180602141446.29982-1-stefanha@redhat.com>
References: <20180602141446.29982-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Sat, 02 Jun 2018 14:14:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Sat, 02 Jun 2018 14:14:55 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 1/2] target/arm: add "cortex-m0" CPU model
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, qemu-arm@nongnu.org, joel@jms.id.au,
	Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LQMgduHIoncB

Define a "cortex-m0" ARMv6-M CPU model.

Most of the register reset values set by other CPU models are not
relevant for the cut-down ARMv6-M architecture.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 target/arm/cpu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5d60893a07..aac224d809 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1215,6 +1215,16 @@ static void arm11mpcore_initfn(Object *obj)
     cpu->reset_auxcr = 1;
 }
 
+static void cortex_m0_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    set_feature(&cpu->env, ARM_FEATURE_V6);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+
+    /* TODO ARMv6-M doesn't support coprocessors, so how is this value accessed? */
+    cpu->midr = 0x410cc200;
+}
+
 static void cortex_m3_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1796,6 +1806,8 @@ static const ARMCPUInfo arm_cpus[] = {
     { .name = "arm1136",     .initfn = arm1136_initfn },
     { .name = "arm1176",     .initfn = arm1176_initfn },
     { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
+    { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
+                             .class_init = arm_v7m_class_init /* TODO rename? */ },
     { .name = "cortex-m3",   .initfn = cortex_m3_initfn,
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-m4",   .initfn = cortex_m4_initfn,
-- 
2.17.0

