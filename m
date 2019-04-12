Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp782074wrx;
        Fri, 12 Apr 2019 09:54:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyD0nuNkYKnTACJR87WZSC7WK5nuRhzR05wbnSDKbsG80OIjGhoWav7cObEmJ24H/3+Lesu
X-Received: by 2002:a05:6000:124a:: with SMTP id j10mr38292306wrx.24.1555088091279;
        Fri, 12 Apr 2019 09:54:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555088091; cv=none;
        d=google.com; s=arc-20160816;
        b=IYJsY9+gIwVdGEZlGwgph/gvKr3R/oRQcbzUiVBDu12TwotQrdO6c2VaitGDdyuRe8
         C0ILpGIzHasaU6FGbH3mMs1vlD9Nh/A63Vi3UuzM18rgsUMuDbYtjt0ipdlapK6+/dG5
         9VXi2L95crGeA/kVgARDSp08PfuvnSITC77C4ethehJ+/A+n5kssU5iTV23YxxwRmmw5
         hTneblXLMvOh760bGIN1rd0h8HTGm7xn/5KtidCidaMB7N0E+Kbm6ovO1wDv2ki55rEo
         X/jmZ8+HmoAf7qZC6jzE37gONWUu60iVeIKdh3QRpjCnSwm6FmVieocMljnCeStPRPp/
         iGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=oigwkET35mCcwYuplE4cpJjHfGX0VfI7AujFL4cEA3g=;
        b=BIAGHQOaUtaoEGGz4eVJoQ8u92OCEKxUomwcwrFt9lHs7X9i87qeh9NOKqWOmplqbn
         KM4TNZfVDrUg+zJjvFdSQ0PBg83Sjh02+m7OV5YHc//lBulSrg7uuD2MsBzYL3fYo7qq
         VI4rjuxJDF0YrI5XZkMnnysSkvW+uIIYsEfmEV6789ebkt02o7Zrxlb59vBqcknFWAm/
         5f4pmP6finxUbWkoGVlQgytegaAy4s9pfIQJuYSK7Dx5cPb5z3sEfb26VYmNLTJghyba
         eoZL5FhUrBOVDxZZ0J0TAHOmzuc1//GjRollXrKGpFqJYYg+nN56jD2leFSH7JByabca
         srgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2si5528066wmg.40.2019.04.12.09.54.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 09:54:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEzRy-0000q6-Ay
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 12:54:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzRj-0000oU-FG
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:54:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzRi-0006Z4-Ad
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:54:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54942)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hEzRi-0006Uq-1u; Fri, 12 Apr 2019 12:54:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3B593082E5F;
	Fri, 12 Apr 2019 16:54:32 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5250260BEC;
	Fri, 12 Apr 2019 16:54:30 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Fri, 12 Apr 2019 18:54:07 +0200
Message-Id: <20190412165416.7977-4-philmd@redhat.com>
In-Reply-To: <20190412165416.7977-1-philmd@redhat.com>
References: <20190412165416.7977-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 12 Apr 2019 16:54:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 03/12] hw/display/tc6393xb: Remove unused
 functions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
	Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rYLDzwP3Pq6y

No code used the tc6393xb_gpio_in_get() and tc6393xb_gpio_out_set()
functions since their introduction in commit 88d2c950b002. Time to
remove them.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/display/tc6393xb.c | 16 ----------------
 include/hw/devices.h  |  3 ---
 2 files changed, 19 deletions(-)

diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index e1b1e302f23..6d133d9a66c 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -137,11 +137,6 @@ struct TC6393xbState {
              blanked : 1;
 };
=20
-qemu_irq *tc6393xb_gpio_in_get(TC6393xbState *s)
-{
-    return s->gpio_in;
-}
-
 static void tc6393xb_gpio_set(void *opaque, int line, int level)
 {
 //    TC6393xbState *s =3D opaque;
@@ -154,17 +149,6 @@ static void tc6393xb_gpio_set(void *opaque, int line=
, int level)
     // FIXME: how does the chip reflect the GPIO input level change?
 }
=20
-void tc6393xb_gpio_out_set(TC6393xbState *s, int line,
-                    qemu_irq handler)
-{
-    if (line >=3D TC6393XB_GPIOS) {
-        fprintf(stderr, "TC6393xb: no GPIO pin %d\n", line);
-        return;
-    }
-
-    s->handler[line] =3D handler;
-}
-
 static void tc6393xb_gpio_handler_update(TC6393xbState *s)
 {
     uint32_t level, diff;
diff --git a/include/hw/devices.h b/include/hw/devices.h
index 1ed5be32967..0850f697451 100644
--- a/include/hw/devices.h
+++ b/include/hw/devices.h
@@ -54,9 +54,6 @@ void retu_key_event(void *retu, int state);
 typedef struct TC6393xbState TC6393xbState;
 TC6393xbState *tc6393xb_init(struct MemoryRegion *sysmem,
                              uint32_t base, qemu_irq irq);
-void tc6393xb_gpio_out_set(TC6393xbState *s, int line,
-                    qemu_irq handler);
-qemu_irq *tc6393xb_gpio_in_get(TC6393xbState *s);
 qemu_irq tc6393xb_l3v_get(TC6393xbState *s);
=20
 #endif
--=20
2.20.1

