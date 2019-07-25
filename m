Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10836675wrv;
        Thu, 25 Jul 2019 09:37:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDarkVw4275liAFyTQX9qi+FhJDmRSQQWWqIb3xccgdREjAusZYOMaU1vFZSnqcpJ3abez
X-Received: by 2002:a67:b70f:: with SMTP id h15mr51225897vsf.161.1564072664414;
        Thu, 25 Jul 2019 09:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564072664; cv=none;
        d=google.com; s=arc-20160816;
        b=YUTbRazlAqvT9IvvlrZj4IVlltqF1lucaACTm+H/Z1mxWgyr3gtUmsCLyZqvDR3BLC
         YVKMVVr+4351t7joL7RWiva2hSJMDJcl++rZiZafSUntfsnprQYP/x1iJIbzv/oHEn7a
         bVkm4bR0Pu5kBdmH6gQgn/LjP0ay/htOYh7JugQCmhtyk9O/tPQz4b9nJnDx4gRSlDKc
         F0VAjfdt0XYGo5Wjj+cg3I2Q4Ru+0UmEKq+6R6d9tp4Nk5TWdAfSUlplAMZLzz86D4xQ
         ky6bEvvta526B1m7OuanslrIKS//XlR9LkxWeYYY1sdRafmAo6VbfGvkqH3KeeaXK0w5
         R0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=yM6cVpuxn4Ke92kaJ4AKkVK8RWiK/GxhKcUyMJM8z1M=;
        b=XKYZjGz28XEZIZA+xfPAu+qSohL2B5PQhjL8TW06R8Yamukga9FJdgnbAAHCl6721M
         jvqULE4NnVG2T6ROB5F9zDlLt3Z+mqy1cBlBujEf8cx36QuvpjIs/DjSzQ5hzrPoQJgi
         GJtiJtiGshdRoPwqE2p9lfxXUabXhxSHZgI6K3gwrl0F81WmbtGYaoBAfLyQbQcyXC00
         26tYHxV/ZzCb6Noxe3FnnpLqLarQLjr6vay4CkIdAGas/L8ks00c0wfl+4JelqijykQg
         f3nSgna22X51LHrVpYjTTvejQ+a0dR4pNVeCFz/zSzZGB9cvNLW04OQqgzL/fFHgJDHh
         YQmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DjFVat4F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si2216252vkd.7.2019.07.25.09.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 09:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DjFVat4F;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqgkR-0005nU-Fu
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 12:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48366)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqgk0-0004bY-H9
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 12:37:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqgjz-0007EZ-CJ
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 12:37:16 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:55848)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqgjz-0007DE-68
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 12:37:15 -0400
Received: by mail-wm1-x341.google.com with SMTP id a15so45582588wmj.5
 for <qemu-devel@nongnu.org>; Thu, 25 Jul 2019 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yM6cVpuxn4Ke92kaJ4AKkVK8RWiK/GxhKcUyMJM8z1M=;
 b=DjFVat4FH98pFLbbLk+slSWzmsHNOwovfvZGBlQivOkRG7faTKI4L17ghY1gr0OT8e
 dEyxzQp+sEZb3zmxy7p4NEuXHEF7dcSOCLREPlVQlAj4jq2CTp1s8Z7uawZ5Y70Ri3Pt
 FAJhHPaygvT7rEL4jNOQhJOjPqvDTSIo30Le3qdEd+D1Vkona5/NouCdJx7jMD4A/l9F
 iVLcDOn56kRqGdAVpTDhCTP7hQBJgih1aaeC011DEupvIoEerSecl/hO2aNq2+/HFQFP
 FDbau2qt4aMqfbZl/VGXpo/Zfh+LzDy01qmuQ7L+Bo8wrBo+rgFpZ7IWU8Kuz02NG5CZ
 W4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yM6cVpuxn4Ke92kaJ4AKkVK8RWiK/GxhKcUyMJM8z1M=;
 b=F3PUCcFM2EDAF1DzV+SpxO5J1c/9vVuTeqOWWvA1CIJiUPspjSyrIJ7MZWUobffbzA
 9QhaOfZwqf3+mbzE/WHSpwULg7LdvJsQduVryuH8nN6c3sTFKdDKhKCfk9miKmMyvVnz
 CXyZeHh7G10KULCZH+0ZcBQtECuvMLOpEsh/LUk+6tuTcq2GGuv3/KBtpGruSjijvxaw
 2vSmczx6lLsGmLjgwccs82fneKWoUA0ppjZKwFCQJUJb3RI20vu99fosNImtE59/r9Gm
 3jjWLGKJ4nHxdDa5uD89LcJsUye8QDXFwdVMgWv0nujDzlIrHZSm35g9A0Hag42GhovB
 zxBw==
X-Gm-Message-State: APjAAAUrpVpee70+0Yv08a30J2PfiTAFTwPjGk+XYTELA2NpB0Xz2Mjv
 znDZXosFX1VTemQUi0Ovsxs9ZRwROtD1NQ==
X-Received: by 2002:a1c:7e85:: with SMTP id z127mr82974403wmc.95.1564072634239; 
 Thu, 25 Jul 2019 09:37:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c7sm44125140wro.70.2019.07.25.09.37.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:37:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 25 Jul 2019 17:37:09 +0100
Message-Id: <20190725163710.11703-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725163710.11703-1-peter.maydell@linaro.org>
References: <20190725163710.11703-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: [Qemu-devel] [PATCH for-4.1? 1/2] stellaris_input: Fix vmstate
 description of buttons field
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VvhibG08Ekph

gamepad_state::buttons is a pointer to an array of structs,
not an array of structs, so should be declared in the vmstate
with VMSTATE_STRUCT_VARRAY_POINTER_INT32; otherwise we
corrupt memory on incoming migration.

We bump the vmstate version field as the easiest way to
deal with the migration break, since migration wouldn't have
worked reliably before anyway.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/stellaris_input.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/input/stellaris_input.c b/hw/input/stellaris_input.c
index 20c87d86f40..3a666d61d47 100644
--- a/hw/input/stellaris_input.c
+++ b/hw/input/stellaris_input.c
@@ -60,12 +60,14 @@ static const VMStateDescription vmstate_stellaris_button = {
 
 static const VMStateDescription vmstate_stellaris_gamepad = {
     .name = "stellaris_gamepad",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_INT32(extension, gamepad_state),
-        VMSTATE_STRUCT_VARRAY_INT32(buttons, gamepad_state, num_buttons, 0,
-                              vmstate_stellaris_button, gamepad_button),
+        VMSTATE_STRUCT_VARRAY_POINTER_INT32(buttons, gamepad_state,
+                                            num_buttons,
+                                            vmstate_stellaris_button,
+                                            gamepad_button),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.20.1

