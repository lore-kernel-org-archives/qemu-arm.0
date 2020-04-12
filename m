Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3145878lfm;
        Sun, 12 Apr 2020 15:51:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypL9qa0FgeqJyowSta0N9fqYg+7egdVQHkvxUaePPGs8djRdgKi5Je8YGQlzVgwt0QUeCZ6i
X-Received: by 2002:ac8:73d3:: with SMTP id v19mr7282206qtp.263.1586731897118;
        Sun, 12 Apr 2020 15:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586731897; cv=none;
        d=google.com; s=arc-20160816;
        b=RNR8vO/ktuimYXrW0V/wlnfW6oT1/gxCuKqi6ruSio6Yh9hKxwBDP7r3JziQ75XcRi
         qDOXZqi+BsVzUYKnbSp9mEOXJ4O9ofOQuvooCuEGn+wGC0xvXmHZj/9PKUxiwwM5J0Bs
         cFTU/3xF+z3oQCNiDmmig7NODY1gw8yFXhIDOhxPPRtJBAze0X4VlMXH94LQKxuEzSKD
         hc521KqNYAqW3xTavTIR7Y7tST4y0KGUPF/PqWqD+jcEWePNi0eRomP7fc5298Xpwz89
         56kFbXDkIcu/53n9yJqcZEYFAjYhp3P/jQDOs/vq2gqdvDGEX692DII1B+Tfh1+P/Mvs
         UOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=s26/jKdIQzWfIjPpMeEX8djoa/1k1238nClydsEcBV4=;
        b=S8IOfzMj7DBBKjkszZO2MUDvQqi2ot6JBeUl5aFgyjUlza7LDY8ZF3F1pb5DV1yusV
         kHXX81v3SBQu6+UjXNiCB8Lo8mPpxB7Bef9pI6SBJD+pGeUHiC3sw3xFQrJUAapzYdrb
         51R9SWqJBV+zU5zeFTHSo0JRgydDUSqoZqXyYx2Pjb4Ue0GFF28001yoSxwG6mfEUbVe
         TFCz7aizlilZCDjHLg/3hYiPDqf1NfIE13U5Oz3M+nCxdifj7TEg5j5MGaQce1Fp8yM8
         OCdY/+Lo5pgCsIm7+RTZZYXDRIugEx0zb5BW3Y0QqoFNpz6SuAqBC3Ylw1tJ2AzT2N6l
         Ip8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AZSVZJyZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13si288466qtn.355.2020.04.12.15.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 15:51:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AZSVZJyZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlRw-0002cu-IO
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 18:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49344)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIl-0000Zg-Kd
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:42:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIk-0005lZ-E3
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:42:07 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36756)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIY-0005ZA-QU; Sun, 12 Apr 2020 18:41:54 -0400
Received: by mail-wr1-x443.google.com with SMTP id u13so8060526wrp.3;
 Sun, 12 Apr 2020 15:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s26/jKdIQzWfIjPpMeEX8djoa/1k1238nClydsEcBV4=;
 b=AZSVZJyZk25y88lxeUuPjcWgORS5v/XkotN1qAfbMA4CwV/+r55keJwTWj2YqRqkLT
 2TMuCNDdMbYOtExjTCdAJ19siFQ3Gl0M7b7CJumolRMDb7Jb9NXQfatFazAAMNVHix6D
 g+PxMaImmiaw8SqOikrlNOjCdKTw7+RG1ua+cE/CNLT1u1a5aX9SCXOhymxatxEX/7Gt
 OWXf0JxQA+/ywVm89PrgDGHNQIb5kyyVM01kSd2ZVYHks9/w/5IUvl2bn7ta/eDucnjA
 B0enZCh2MMSBtpUl3NaqtBmeZ5WG2X3oCtW84HwaxAPdHoYDPjS2y4TboZKIWfuq5wWB
 7DVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=s26/jKdIQzWfIjPpMeEX8djoa/1k1238nClydsEcBV4=;
 b=a6xU/GewKFg2EPifaB3zdBuCn4FaZ3775gEXpbqEKowLZ2zEnBU6C+mF48Q+ApHYkY
 cG6x+M4pbOtHhmbwJpTpwA2RQNHNa5QvxfmxvDeDhYwWP5jCIX2W3065cXLXlK5s/75/
 HuXQ/Qk6tVoFTlG5u10Bx/FEGkkDXwjonHzYF3VjjURWVrmP3B3GqB/YitOloCTEq9Ea
 w1ZIB76K9jb9WmECieVURnzoj6CqAU15vESMuoViede73KQ12avgrxYytUoG0qsOdOx+
 4F2n1ynK5ET+tRCpucKIf7bdT0RkM+ARBX//y8ZcoHLWBjPMHhQnKClcB6W6LdoFLXsM
 +J6w==
X-Gm-Message-State: AGi0Pubidx5gSNzFowNBaciVG7HYDyiMr1QbuHpqXPfwb31eT3YD+8bj
 2GxcV477T4Twe/92RxqPAI4TRK43i3aezg==
X-Received: by 2002:a5d:480b:: with SMTP id l11mr17215356wrq.25.1586731312594; 
 Sun, 12 Apr 2020 15:41:52 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:41:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 01/23] scripts/coccinelle: Catch missing
 error_propagate() calls in realize()
Date: Mon, 13 Apr 2020 00:41:22 +0200
Message-Id: <20200412224144.12205-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sff50aW2KBAI

In some DeviceClass::realize() while we can propagate errors
to the caller, we forgot to do so. Add a Coccinelle patch to
automatically add the missing code.

Inspired-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .../use-error_propagate-in-realize.cocci      | 54 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 scripts/coccinelle/use-error_propagate-in-realize.cocci

diff --git a/scripts/coccinelle/use-error_propagate-in-realize.cocci b/scripts/coccinelle/use-error_propagate-in-realize.cocci
new file mode 100644
index 0000000000..7b59277a50
--- /dev/null
+++ b/scripts/coccinelle/use-error_propagate-in-realize.cocci
@@ -0,0 +1,54 @@
+// Add missing error-propagation code in DeviceClass::realize()
+//
+// Copyright: (C) 2020 Philippe Mathieu-Daudé
+// This work is licensed under the terms of the GNU GPLv2 or later.
+//
+// spatch \
+//  --macro-file scripts/cocci-macro-file.h --include-headers \
+//  --sp-file scripts/coccinelle/use-error_abort-in-instance_init.cocci \
+//  --keep-comments --timeout 60 --in-place
+//
+// Inspired by https://www.mail-archive.com/qemu-devel@nongnu.org/msg691638.html
+
+
+@ match_class_init @
+TypeInfo info;
+identifier class_initfn;
+@@
+    info.class_init = class_initfn;
+
+
+@ match_realize @
+identifier match_class_init.class_initfn;
+DeviceClass *dc;
+identifier realizefn;
+@@
+void class_initfn(...)
+{
+    ...
+    dc->realize = realizefn;
+    ...
+}
+
+
+@ propagate_in_realize @
+identifier match_realize.realizefn;
+identifier err;
+identifier errp;
+identifier func_with_errp;
+symbol error_abort, error_fatal;
+@@
+void realizefn(..., Error **errp)
+{
+    ...
+    Error *err = NULL;
+    <+...
+    func_with_errp(...,
+-                      \(&error_abort\|&error_fatal\));
++                      &err);
++   if (err) {
++       error_propagate(errp, err);
++       return;
++   }
+    ...+>
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 6203543ec0..54e05ecbdf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2060,6 +2060,7 @@ F: scripts/coccinelle/error_propagate_null.cocci
 F: scripts/coccinelle/remove_local_err.cocci
 F: scripts/coccinelle/simplify-init-realize-error_propagate.cocci
 F: scripts/coccinelle/use-error_fatal.cocci
+F: scripts/coccinelle/use-error_propagate-in-realize.cocci
 
 GDB stub
 M: Alex Bennée <alex.bennee@linaro.org>
-- 
2.21.1

