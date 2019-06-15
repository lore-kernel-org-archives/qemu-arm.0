Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp684622wrg;
        Sat, 15 Jun 2019 08:59:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0jG03jfM8wb+9mV3xd1p0cy0HoZtjm0zqZ+EmBC5O2F3rkERKPHRutE6h3Kk5tmTmlo16
X-Received: by 2002:ac8:2fce:: with SMTP id m14mr68520843qta.22.1560614366979;
        Sat, 15 Jun 2019 08:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560614366; cv=none;
        d=google.com; s=arc-20160816;
        b=TWsL5gf7PqNCyvkwekYjGhE/gN1Lhqx4CvX9Vo4LRv545ofAu9mBkgGxmWsDn0oeXK
         wwMKpHGkvqoDKPosCksgUI36JHbbWsuTyLommnvhV8fCyswTtjB0YwcULGM9I7gUuvLZ
         TX4wuUCYU92kHeiQHow2gureUyUxNWFno/4AhbNG8DEZlDJ+ySdvIH+N6ZpufA6MlFlx
         yBKKXOZ+ryYX6jSrH7qIaYFAiG91rarOvaTo2imNzvz/HQ9VP6yLLoWSo3446CRXBZUQ
         w9cWvYmCA0oTHFHXd5BISRtqBC9ua6k1HCRSvUM94KdRgzy/a1KTZQsREG+FP2x2cR3N
         T0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7Lcnp5MSG8TTVn67v3S6gCHWmvOOuftvj5Qf3cKcCYE=;
        b=uXXWJtv+eh3TuRAav4jcEvXr/FxxHvnGZHOsAA2Iqd9xUyyO7nDp9RZW4I7mogbALD
         IzkXCQtkzNd9Io8/loIr/l7ABnE0FFvg0cJYCQroy4KEASV3kuhFfVEq7ef4MvprbYWe
         OXwzlFy91z2vCP/6dBa1zc9cc2jzr9wpK15c02xAynyJXtrDM0AvqnmYKY2ad3F5wDy2
         IYQh+HgclXU2AixiZ8XZgvM7U4U5/LXGYltJbgFVpOXB78BQpmm/A9l+hCb7nFyHFNLx
         zHBLPoZJE3UibpmSu8qsK3vr2A0GatX6Fulyb5Q+tf/++7cWubMme9RmWt7+fyBaitZ4
         6Ijw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h57si3758010qvd.131.2019.06.15.08.59.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 08:59:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcB5S-0000oK-HT
	for alex.bennee@linaro.org; Sat, 15 Jun 2019 11:59:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35918)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hcAr6-00045H-1p
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hcAr4-0000ye-6K
 for qemu-arm@nongnu.org; Sat, 15 Jun 2019 11:44:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41490)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hcAr3-0000te-W3; Sat, 15 Jun 2019 11:44:34 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6A0DF3082207;
 Sat, 15 Jun 2019 15:44:32 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-41.brq.redhat.com [10.40.204.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BF1D1001B05;
 Sat, 15 Jun 2019 15:44:30 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 15 Jun 2019 17:43:46 +0200
Message-Id: <20190615154352.26824-18-philmd@redhat.com>
In-Reply-To: <20190615154352.26824-1-philmd@redhat.com>
References: <20190615154352.26824-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Sat, 15 Jun 2019 15:44:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 17/23] target/arm: Fix coding style issues
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3E9yESdH0X8A

Since we'll move this code around, fix its style first.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/translate.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c274c8b460..d0ab3e27e6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9179,7 +9179,7 @@ static void disas_arm_insn(DisasContext *s, unsigne=
d int insn)
                 loaded_base =3D 0;
                 loaded_var =3D NULL;
                 n =3D 0;
-                for(i=3D0;i<16;i++) {
+                for (i =3D 0; i < 16; i++) {
                     if (insn & (1 << i))
                         n++;
                 }
@@ -9202,7 +9202,7 @@ static void disas_arm_insn(DisasContext *s, unsigne=
d int insn)
                     }
                 }
                 j =3D 0;
-                for(i=3D0;i<16;i++) {
+                for (i =3D 0; i < 16; i++) {
                     if (insn & (1 << i)) {
                         if (is_load) {
                             /* load */
@@ -12427,12 +12427,13 @@ void arm_cpu_dump_state(CPUState *cs, FILE *f, =
int flags)
         return;
     }
=20
-    for(i=3D0;i<16;i++) {
+    for (i =3D 0; i < 16; i++) {
         qemu_fprintf(f, "R%02d=3D%08x", i, env->regs[i]);
-        if ((i % 4) =3D=3D 3)
+        if ((i % 4) =3D=3D 3) {
             qemu_fprintf(f, "\n");
-        else
+        } else {
             qemu_fprintf(f, " ");
+        }
     }
=20
     if (arm_feature(env, ARM_FEATURE_M)) {
--=20
2.20.1

