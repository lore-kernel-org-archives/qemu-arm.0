Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5086043lfm;
        Tue, 21 Apr 2020 06:20:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypJTKHVIuWRa5am/OqImeFdm/XKJq9luNlsgG6TspK0gKnCQsUFXcFUy0ZTGeKGGSWRbXxRz
X-Received: by 2002:ae9:ed89:: with SMTP id c131mr19936806qkg.447.1587475229556;
        Tue, 21 Apr 2020 06:20:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587475229; cv=none;
        d=google.com; s=arc-20160816;
        b=z0Bu/hyN2N8i3BpW/J3I0B5/4ys51PnX/Spvq9rSb4zv+mJOn0qz7zeHF+AYUITdCf
         LU0FIQG+yO/YlOvwmvUdmgY4djXb6691s+fNiWB9DnTEsv0V44oz/IhkpC+LUTJenGCr
         NNggFzILoBv/bYOPenOfoOzLpm5CXETGSdIf25+espQNipSX0uVPHqkyTpD7LzRnIWbv
         QNHNGOa6lDxC71tt4xWJ3fFLn1BPaQuOuJfILWRRJuiXuZccObCS1j2wcAz/BcXbl6YY
         o+NVyWQpzDlU8ZrJOJPK3Zu3k5EzKMNFzQPGWiUDTQqDYFOfJ8BAL6YYPhz12NDORKQo
         eSeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pU9wiDrqb1FbUODn1z0R5OZvX82oaKZlJ+qXZZecY0U=;
        b=gSfBoKNcbpFxHsLfOTAHU7z4Eg+TYNNM3J5iIaXSWHvzkfx9w8M82AYil/LsYKWNDJ
         4dleHsHDTMFafkiklkPFoqM4Pf2uXUPO8G+Yimm2FEwxq2VOlbUcKN5d0Gollqg5v/fq
         UrHiR67scEv+K/WygPQgyA/V9pmfk1JSIalWXdWwjK/ip/wrDEHkUjxO1u8/96gOz3dx
         9u4X5aP8uVxBYXu/3sxwfO6/madE9FGlkq6qxIZB3WQsbuUkNkQ+qvpHyJ+Oel8ooBas
         Zxl5ksTWiOz4oyR32WcOvGY45QI71W6vhDR4fWGKnWWEheY7IijuW+XTBsM5H8tLbuWX
         wyAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UjttNA5J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i27si1548727qki.328.2020.04.21.06.20.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 06:20:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=UjttNA5J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQspA-0001wM-U2
	for alex.bennee@linaro.org; Tue, 21 Apr 2020 09:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48562)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jQsoo-0001fv-Om
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:20:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jQsof-0007qf-3I
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:20:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60676
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jQsoe-0007ps-My
 for qemu-arm@nongnu.org; Tue, 21 Apr 2020 09:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587475196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pU9wiDrqb1FbUODn1z0R5OZvX82oaKZlJ+qXZZecY0U=;
 b=UjttNA5JE4WsRwj3ywUDZc2Pz+325cotcMVNFGmrIcTRLL/buJh8OETAPiNMMeXl7PP+Ce
 86uysHToH+nBiZ1cz8PHSg5sRp5O6U+2BBBvqTlcavDKonyyn7yUYi2kWmJ17ZpDbrjb5V
 EviFvPkqa26/70Xo+IRHJDvgBrotEeg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-c4oDz391M8SqcihxNEr9lg-1; Tue, 21 Apr 2020 09:19:54 -0400
X-MC-Unique: c4oDz391M8SqcihxNEr9lg-1
Received: by mail-wm1-f70.google.com with SMTP id v185so1375027wmg.0
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2020 06:19:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zqzb/pshEzW1fPo5MmdJgyS/wpMg+nvvsoa+3p+thQ0=;
 b=t8wjuhqL5tYrAay8f3tMKT0Juj3aBAhYXFkzTKc+PZhxTQamMbjOrXocxza9cu+aDm
 5Oc6R2hWzAU5NPhMTEqRPK9g5CjWzfopWc3iAXJG5M9DBdKlqns8CJcbXfCRyu0pS5qE
 a90hRJtk02gYx8GP3nKsH68XLShjFDVQFHJGi1wjXdt2XdN/8omewh/B+eVuOG1HoSXh
 IpoftSp9mT+zUPIIi+Foyx4yPr35mp5h3MK7+xBGMKoIz9t5RBFR5ChHBnxrtfK28ACY
 LqXx09nsVZ+6qlKOE2vQD7YDY5/zhqNRHOAHcDz5+/GjF1i1hhOBZ0p3zCUrQC/rkz8p
 335Q==
X-Gm-Message-State: AGi0PuYcKspidoQvFue/f4PHqZY3HYrFTzVLptpSL6NiIkYXanj/ki7P
 mUu54whnqb5s/y1gxGPmTGv0dkFAVcQgDUZBr4bXqAnz7IIabhmJ3ifDTK6QQJfxRRbUyGhn7mc
 X/FlrkZxfnsHW
X-Received: by 2002:adf:e282:: with SMTP id v2mr24137574wri.329.1587475193001; 
 Tue, 21 Apr 2020 06:19:53 -0700 (PDT)
X-Received: by 2002:adf:e282:: with SMTP id v2mr24137559wri.329.1587475192830; 
 Tue, 21 Apr 2020 06:19:52 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id y10sm3395269wma.5.2020.04.21.06.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:19:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] target/arm/cpu: Update coding style to make checkpatch.pl
 happy
Date: Tue, 21 Apr 2020 15:19:25 +0200
Message-Id: <20200421131926.12116-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200421131926.12116-1-philmd@redhat.com>
References: <20200421131926.12116-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 03:31:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-TUID: Zbn7lVe7q9OK

We will move this code in the next commit. Clean it up
first to avoid checkpatch.pl errors.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/cpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9023d9e2cf..1ddf850f00 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -582,7 +582,8 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, in=
t interrupt_request)
     CPUARMState *env =3D &cpu->env;
     bool ret =3D false;
=20
-    /* ARMv7-M interrupt masking works differently than -A or -R.
+    /*
+     * ARMv7-M interrupt masking works differently than -A or -R.
      * There is no FIQ/IRQ distinction. Instead of I and F bits
      * masking FIQ and IRQ interrupts, an exception is taken only
      * if it is higher priority than the current execution priority
@@ -1902,7 +1903,8 @@ static void arm1026_initfn(Object *obj)
 static void arm1136_r2_initfn(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
-    /* What qemu calls "arm1136_r2" is actually the 1136 r0p2, ie an
+    /*
+     * What qemu calls "arm1136_r2" is actually the 1136 r0p2, ie an
      * older core than plain "arm1136". In particular this does not
      * have the v6K features.
      * These ID register values are correct for 1136 but may be wrong
@@ -2688,7 +2690,8 @@ static const ARMCPUInfo arm_cpus[] =3D {
     { .name =3D "arm926",      .initfn =3D arm926_initfn },
     { .name =3D "arm946",      .initfn =3D arm946_initfn },
     { .name =3D "arm1026",     .initfn =3D arm1026_initfn },
-    /* What QEMU calls "arm1136-r2" is actually the 1136 r0p2, i.e. an
+    /*
+     * What QEMU calls "arm1136-r2" is actually the 1136 r0p2, i.e. an
      * older core than plain "arm1136". In particular this does not
      * have the v6K features.
      */
--=20
2.21.1

