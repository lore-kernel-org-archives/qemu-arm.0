Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4979825lfg;
        Thu, 27 Feb 2020 14:05:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqxReiDPeovIS6baPEZOEhsM/4nUywVI2CBLRB+YXO1BwCiVXQAIVPTAKPCHA3bOoSwBB8HH
X-Received: by 2002:ac8:3f91:: with SMTP id d17mr1574309qtk.41.1582841129459;
        Thu, 27 Feb 2020 14:05:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582841129; cv=none;
        d=google.com; s=arc-20160816;
        b=sk5Gl2NbS21UEA0JLKLEMlRBfe0BI8R1XbN7bIaHigQcctKa/9M0H1VCmNf6A6mgUo
         gWRIV6fm/1X2huk2bT1ypTEuZ/90nWN3ik5aw/KxwiVJtP7h4au7Lo+BSSPXQO6rVJcg
         GYV4HD0yUNznP+uGNf7H2guyyXdwf3DKH5GKhrOLQFmzJuHQ/YoQu3ogxYwVke8Ig0v9
         ususZXuMK+7lHgjR8inq0curLmuJgQuPdj8EnGQuEf/F+ToOiZjAuqImDLP/EXlxAqUW
         xp6ulp2Bm5m2YgT79+w2b+RVCokJHwXFzFRunfHD6tzJ+wo485yvUALv2Gelhj8npc5h
         RT0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=ct19YN8D477GfCKm2ge3aSrXHQgydJt2ZJDeu9sZUbE=;
        b=RzY10wE4Dbno01asRjxXwPHNUNaOFZ+LZCTWU2Ph0NefXPv5oabrEwr7eFUvY+Bius
         YIpFxcK0iiVeX1qIT/wb4M0IrwQ7qLzrMxCJQCvLqGK5aA/QXquZV/gP2OMnTThzo81N
         OsJCuN28zfxQRfTzYVmGkkiezmyn622y6369+1qAMKu2IXuP9C1IkAtkQr8Op2iBuuQk
         C6eke23Z9E6q8zjYIzfJ/oSgxQDMfBqh7puFim+Bnhq8mk02tG660S+NQJ7m3CLWztG8
         MlswAa/FZ/S4eP/7wr235ExSnd9iSHvES4tTURF0hqGjdT+3kRY175oo+Nl5O+EnCgAQ
         nm8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Hyd6ONjy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a197si394850qkg.30.2020.02.27.14.05.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 14:05:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Hyd6ONjy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7RHc-0004yI-VJ
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 17:05:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44972)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j7REL-00019K-Ad
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 17:02:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1j7REK-0003lu-CD
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 17:02:05 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52848)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1j7REI-0003l0-Q7; Thu, 27 Feb 2020 17:02:02 -0500
Received: by mail-wm1-x341.google.com with SMTP id p9so1147073wmc.2;
 Thu, 27 Feb 2020 14:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ct19YN8D477GfCKm2ge3aSrXHQgydJt2ZJDeu9sZUbE=;
 b=Hyd6ONjyl4QfpbJ65iDBNOqBwvbPE8A0YWtVVDBsD8MiHmHGeDY46lN9xn33I/Ix+j
 ST6ly4uqoMEtdlELPgotCGoz42Uidlg79pNHD5s6yJDx6DG4GcC8QIbQhQfpk4T+uxb/
 eA57+0DgvgHDCKt7GCtoYONjtiJq7AMKzyQStfQd6UI3uK+hEnEcULAn0e3rIB2U2Ko4
 gJGUjdmMk4ySHe/f0rMMpPHmxJtT4LBaZ3VGLZoIzQYnR1C9kCTw0bhteNUnvudmg9d9
 vYlVxGAlgyb0YZz+6YaLeojPfNwQG4zxwV/t/Elz0TARc+xw3dk/qNlVWmdL4a0u8Xm0
 FYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ct19YN8D477GfCKm2ge3aSrXHQgydJt2ZJDeu9sZUbE=;
 b=a1HBAwO8Kjb6HJgpNZ0k6hKBwDV9RgbE+k3RPE1TGtdC7mezMai46FYMveeaxiXqBS
 GH4W4edbSxXMD6DOan08IYc6FdZ9xJXC5BQES5OM2WlbLhy1KHJo9B26lcnm0VMa3BC7
 I8/FSYT4JdbcIG1FnNV3Bocf4WTm+mzpz1JkXV3h+W0jiZqxRfL3iUe8Ec0csgTe8GH+
 1R5DfILsxwU3F83oKeJBQ2mKn7+TPknNZjuW/ozxWjMhyKkMHctTKePXqk8Kwcd7zgFx
 il+60Ar3LISL4qloZhOAwdxSe/pSB0SDZe9GDFq6/q8olnt71jA5QrOBtaxZFBLabMo7
 xHMA==
X-Gm-Message-State: APjAAAWSEcpWsIKO/FU5GWSv/SFwnwYMK56/2l4UsyxPMu/7NG1DoIOZ
 XnOCHNkv6JMc36fiMIQqt0Qregz+
X-Received: by 2002:a7b:cc69:: with SMTP id n9mr856189wmj.163.1582840919861;
 Thu, 27 Feb 2020 14:01:59 -0800 (PST)
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
 by smtp.gmail.com with ESMTPSA id z14sm6447040wrg.76.2020.02.27.14.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 14:01:59 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/4] hw/arm/cubieboard: report error when using unsupported
 -bios argument
Date: Thu, 27 Feb 2020 23:01:49 +0100
Message-Id: <20200227220149.6845-5-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200227220149.6845-1-nieklinnenbank@gmail.com>
References: <20200227220149.6845-1-nieklinnenbank@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: b.galvani@gmail.com, peter.maydell@linaro.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4JGCK6gMD842

The Cubieboard machine does not support the -bios argument.
Report an error when -bios is used and exit immediately.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 hw/arm/cubieboard.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 6c55d9056f..871b1beef4 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -19,6 +19,7 @@
 #include "exec/address-spaces.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#include "sysemu/sysemu.h"
 #include "hw/sysbus.h"
 #include "hw/boards.h"
 #include "hw/arm/allwinner-a10.h"
@@ -33,6 +34,12 @@ static void cubieboard_init(MachineState *machine)
     AwA10State *a10;
     Error *err = NULL;
 
+    /* BIOS is not supported by this board */
+    if (bios_name) {
+        error_report("BIOS not supported for this machine");
+        exit(1);
+    }
+
     /* This board has fixed size RAM (512MiB or 1GiB) */
     if (machine->ram_size != 512 * MiB &&
         machine->ram_size != 1 * GiB) {
-- 
2.17.1

