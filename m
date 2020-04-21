Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5085500lfm;
        Tue, 21 Apr 2020 06:20:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypJV+LQCTXp60oQpidfwcs6HqDVDU5StL9G9/yrQgzxdR0pfoNxj0ucThzqDvj/8rTn1F9/B
X-Received: by 2002:a37:5f41:: with SMTP id t62mr21876223qkb.410.1587475201891;
        Tue, 21 Apr 2020 06:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587475201; cv=none;
        d=google.com; s=arc-20160816;
        b=ILuFQdiY7YkEfO3dNOWu07uBA0pc1J6+eh91gYD40w09M6VEMMpIfo0MW4u9TTsjiA
         NSg7uh07izy6CQouetjl+oD4SV+grKhoUC+eiGvWV+VmxmxB/sxbPx9oCqcpzMyI+OaV
         pnYRSqloMEkdTcQyigQb1D+5wJPVe1LdKe0WHi+LfsaPRrQ5ooiIHughqPrNgAeXSHx6
         kkPzPeQIFxM5dfUZFCjwjUEo/SRWnJvYJonJGObAt6fMtVC0WVVn0JVWGwBZOJb6MtSd
         LE1w6Ej1Mc1IUhNEyG/8+3xknejiGRIX5jArtCkUifr7/FhunjV/lMqD9+0cvoRhx4Iv
         FOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uMFN46GGJRGQBe/rYYHHm3lwuDss4tLS+w7l4aZddpQ=;
        b=OH1qmWh5RqYGMJ0RjdORQRdspQkR5axR708IVYPyPq1oj1fbsEsPIHpoW89sEBtOHu
         POuQZ2exH56qDk7H42M5cIa0fPQEIjmqVz3rlYF8qA7FY+YrS82ag1ztsgXy6m3PeCr7
         D8G6k63gty/L3qrGjG2o7hhd1cR9z4eCpLxRwKi6NilPpsrSfzZ48/vrrYkzzKmXpY7m
         Z7EVPi3JK4W5YNxWcA1eQO41E5kFv8lLQ9dVeijC/5hwSk9YdPnNTalIufsuJhf+NeSN
         CwavnTrb4N03YzFlez0r3bJMBCjgZMXBgZJnVnrH8GO2LmcD1AuGT4INVd6DrIdVEzee
         DNxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ob69b3JN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si1414889qvb.90.2020.04.21.06.20.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 06:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ob69b3JN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQsoj-0001BV-65
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 09:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jQsoP-0000xy-0k
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:19:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jQsoO-0007Ov-Af
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:19:40 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:30927
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jQsoN-0007MK-TE
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587475178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uMFN46GGJRGQBe/rYYHHm3lwuDss4tLS+w7l4aZddpQ=;
 b=Ob69b3JNJIcAnudEgSWXy2wp9EPlceo+q9763wIYBcks0f9Q/EMhXTzGomztgVbS+DynLv
 T+ADxmsEf9v/EVP6/Z264aCEqQA6R2Q6H1EIGmbnJBJje5iYYX2wP1fKsntmx0qinaUPBf
 Opl0dAqCd3QjFPKJDYU3rhzdCvRaUnk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-Uk1Qjkx0Pl28Jr_ULmqlww-1; Tue, 21 Apr 2020 09:19:35 -0400
X-MC-Unique: Uk1Qjkx0Pl28Jr_ULmqlww-1
Received: by mail-wr1-f72.google.com with SMTP id o12so7497168wra.14
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 06:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ae/4+1sN6db4JUzTalWSGb//t3m1oKTsE7xQyTnypSQ=;
 b=ArvfeoAhQPehACiNA5gzwfC6H/rU9IqI0gRlgDvFsm2Oi9TJ1AphHcF4Jzepx1lnuI
 N9kalL/T5WIc102q53KGVjOBI+dt97PrMRFg3gzzekJ6FYb2iXeJ36ph0/57UU8g8XXU
 a0GnLtPLynWy+cBie00Sv7GKu3wi4z+osgiyHqjCeeOMIkhm6PztaaRAU/0ELnmuEs0V
 xk1iL0ssDa8GoBp13o61KWJv5gKbqkP9BGz4VXMyG4IHvr1tsrO/paQtbztzHloOGP3m
 Q3s5BDC8vS54dcZIIiMngeNx3oCHjD2SYKUaE5C3v/4z5COSQ7z7rT9oxDLWea98aQJ1
 girg==
X-Gm-Message-State: AGi0PuaHbiGwHVd+CbNsUpjaSpFXU9RDQFIXf7XWhRy4i0pNNa51U1wS
 Ok1qz4/f1mi8bZacfD//IugPBCjl62f4yBzo9RUKstZJaPln9GS4SX/a5cor8cUZOOWzmsNu3hO
 5oRJqae6bZ4fR
X-Received: by 2002:a1c:154:: with SMTP id 81mr4819477wmb.48.1587475173946;
 Tue, 21 Apr 2020 06:19:33 -0700 (PDT)
X-Received: by 2002:a1c:154:: with SMTP id 81mr4819454wmb.48.1587475173622;
 Tue, 21 Apr 2020 06:19:33 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id t16sm4307074wrb.8.2020.04.21.06.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:19:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] target/arm: Restric the Address Translate write operation
 to TCG accel
Date: Tue, 21 Apr 2020 15:19:21 +0200
Message-Id: <20200421131926.12116-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200421131926.12116-1-philmd@redhat.com>
References: <20200421131926.12116-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 01:28:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BYpqseRWA6du

Under KVM these registers are written by the hardware.
Restrict the writefn handlers to TCG to avoid when building
without TCG:

      LINK    aarch64-softmmu/qemu-system-aarch64
    target/arm/helper.o: In function `do_ats_write':
    target/arm/helper.c:3524: undefined reference to `raise_exception'

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Better explanation:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg689388.html
---
 target/arm/helper.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7e9ea5d20f..dfefb9b3d9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3442,6 +3442,7 @@ static CPAccessResult ats_access(CPUARMState *env, co=
nst ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
=20
+#ifdef CONFIG_TCG
 static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx)
 {
@@ -3602,9 +3603,11 @@ static uint64_t do_ats_write(CPUARMState *env, uint6=
4_t value,
     }
     return par64;
 }
+#endif /* CONFIG_TCG */
=20
 static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t v=
alue)
 {
+#ifdef CONFIG_TCG
     MMUAccessType access_type =3D ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA=
_LOAD;
     uint64_t par64;
     ARMMMUIdx mmu_idx;
@@ -3664,17 +3667,26 @@ static void ats_write(CPUARMState *env, const ARMCP=
RegInfo *ri, uint64_t value)
     par64 =3D do_ats_write(env, value, access_type, mmu_idx);
=20
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
+#else
+    /* Handled by hardware accelerator. */
+    g_assert_not_reached();
+#endif /* CONFIG_TCG */
 }
=20
 static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
+#ifdef CONFIG_TCG
     MMUAccessType access_type =3D ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA=
_LOAD;
     uint64_t par64;
=20
     par64 =3D do_ats_write(env, value, access_type, ARMMMUIdx_E2);
=20
     A32_BANKED_CURRENT_REG_SET(env, par, par64);
+#else
+    /* Handled by hardware accelerator. */
+    g_assert_not_reached();
+#endif /* CONFIG_TCG */
 }
=20
 static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo =
*ri,
@@ -3689,6 +3701,7 @@ static CPAccessResult at_s1e2_access(CPUARMState *env=
, const ARMCPRegInfo *ri,
 static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
+#ifdef CONFIG_TCG
     MMUAccessType access_type =3D ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA=
_LOAD;
     ARMMMUIdx mmu_idx;
     int secure =3D arm_is_secure_below_el3(env);
@@ -3728,6 +3741,10 @@ static void ats_write64(CPUARMState *env, const ARMC=
PRegInfo *ri,
     }
=20
     env->cp15.par_el[1] =3D do_ats_write(env, value, access_type, mmu_idx)=
;
+#else
+    /* Handled by hardware accelerator. */
+    g_assert_not_reached();
+#endif /* CONFIG_TCG */
 }
 #endif
=20
--=20
2.21.1

