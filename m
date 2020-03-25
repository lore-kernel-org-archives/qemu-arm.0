Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp979426lfi;
        Wed, 25 Mar 2020 12:18:58 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu78/kYI2uEkiRjuQslAnO/2MZOHmjcDJH0AJm231Rug97lovb981zpRzUy/RNnVCj+vtrV
X-Received: by 2002:ac8:568b:: with SMTP id h11mr3316102qta.105.1585163937446;
        Wed, 25 Mar 2020 12:18:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585163937; cv=none;
        d=google.com; s=arc-20160816;
        b=tsrave0gKP566PY3k6z3WrMikBMRK9jOsMz6qtBvMUOpD9OwZH/AE11qAw7z8Zv95j
         b5s/2eNB3cjo1TE9tiLTO3Lfj1LhP5Jn1LShVIdE64tXw2pl4/cd1X7t/iMc5eZoZuvU
         xAl0ckK/92ts15lEL04LfRZqQCSaBByimnjccC+tIcsM+zGa9lQLVQ0v9VL9KbOYEcOU
         lxQsIfBbDd0ig3Pqu1WsDdwxXP+A2nE7zWMP6yE2ljMPQWQD08NBJDFUjl5DnUIRjsho
         NrsTIW5vad0ptPOucEPigAP/M3U1W7Y09sIhBECDJGZlDcsJ5ztdk2EkTVRFttdNSUFu
         Gjfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=K/JaHB+lFk7HG80DcgONiqIurhrs6UE02bBz6uqJR8c=;
        b=n2KTnBJjPQQwo416xw0CH9jWXMltIjOMkeA5Y2/cK6LAH2EQ3X0d++mYhXfL8E7q1n
         7wuqtYcQh7Zr7pmfI1v6w9QkviMQ+zeIbHSYt3kRmqI67sSr5ujIfk5i+BfcOQ1mg8rK
         SwePjlBZgjiyCOQyZEEMDErHKTXoS0haZbGFWlAo9kjgyF0QiYK6Edsv/O7QJcvjuS/b
         P9AOBJa0fsr98STJZqxlUVX1g/JHVok04XJu7z2O+J1D1ANTb9G/tkp8fx1sutNNYJmV
         dcf2edzHMesxtkhrJ07rWSTRB/ghuB4NJ59DjlDi4hDYK0ElO+zMluWDea99dObyRs5r
         fMtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="cLVwX8/A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m39si9751728qtk.400.2020.03.25.12.18.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Mar 2020 12:18:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="cLVwX8/A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHBYG-0008Jz-Nd
	for alex.bennee@linaro.org; Wed, 25 Mar 2020 15:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53218)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBY5-0008ER-H5
 for qemu-arm@nongnu.org; Wed, 25 Mar 2020 15:18:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBY4-0008Jz-82
 for qemu-arm@nongnu.org; Wed, 25 Mar 2020 15:18:45 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38798)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jHBXz-0008GY-2u; Wed, 25 Mar 2020 15:18:39 -0400
Received: by mail-wm1-x341.google.com with SMTP id l20so4168702wmi.3;
 Wed, 25 Mar 2020 12:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K/JaHB+lFk7HG80DcgONiqIurhrs6UE02bBz6uqJR8c=;
 b=cLVwX8/AKjx5dwLq4t8JJORTVvuXAwK1uGvNmRoxl6ZLkb+MntiBtYZ2hBIgiWV+e9
 jZJ6/YYqMxgMIFkBI0f14zO3qTy5xVv2pyRksIqKoXGVCA3KShdjBZ7SnM25JH6NrmqR
 JUhVSihnxCr3lQdmAJzxZX/YuxRAdUL3b0XhzWdiNCekoyB/KXjqFoVJzi7U0+REAOiz
 dbJQXNI3xPnCoRcopblHfzGguFYbOMKoaT1GlCaYD5K+YXys4jo+wiY72orvR+TVJYuH
 He1QkL7vL4bTu2EGqPboeQQLTNDAkxvMIajZednFRdJjSmyF9BHqDxtKjsnWF0P3v2FD
 Hu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K/JaHB+lFk7HG80DcgONiqIurhrs6UE02bBz6uqJR8c=;
 b=gUjQ3osXYzhxTt8BBu84ytOJJr9gvitpIh3SZCTtdsRhDa20iWzUEQtyiTXJn+WAmc
 hIvQVfqQnTSJG5T6B0CVDuLgcQWNTUDm7/JYDPAIYIn0wSDZKo8YeuDEK8N5oqYqFTrI
 Afb/y1YLYW4RgzwMvuJGvWLWCjcZjoISHVKBTY1tM6Plv1oqqHv54ayj4/C8YjJXCEH4
 orvN5WcXX59oPmF5HkqBrL00LQ544T+EnY7Mw9R/Y8f7EQcl3pBlBQe3f23MyvWrpnoI
 L9S6klir2ZHhJ8lIUL7tr0Ktv8ltxUyRaMQRT6lde+LAshXueLzYQBMtyKzQpHVqCJqh
 8OHA==
X-Gm-Message-State: ANhLgQ1s10ACC9wNHyH91fjk23EGYWBYGF4QpoDaAe5fBPRHrCK2rQDW
 fZcG+4ojtrx8OUtvbz5byAabLscVHCc=
X-Received: by 2002:a1c:456:: with SMTP id 83mr4977190wme.54.1585163917680;
 Wed, 25 Mar 2020 12:18:37 -0700 (PDT)
Received: from localhost.localdomain (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id r17sm6345672wrx.46.2020.03.25.12.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 12:18:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 01/12] scripts/coccinelle: Add script to catch missing
 error_propagate() calls
Date: Wed, 25 Mar 2020 20:18:19 +0100
Message-Id: <20200325191830.16553-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200325191830.16553-1-f4bug@amsat.org>
References: <20200325191830.16553-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HDEEpjQTd6Qa

In some places in we put an error into a local Error*, but forget
to check for failure and pass it back to the caller.
Add a Coccinelle patch to catch automatically add the missing code.

Inspired-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ...ect_property_missing_error_propagate.cocci | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 scripts/coccinelle/object_property_missing_error_propagate.cocci

diff --git a/scripts/coccinelle/object_property_missing_error_propagate.cocci b/scripts/coccinelle/object_property_missing_error_propagate.cocci
new file mode 100644
index 0000000000..104e345273
--- /dev/null
+++ b/scripts/coccinelle/object_property_missing_error_propagate.cocci
@@ -0,0 +1,58 @@
+// Add missing error-propagation code
+//
+// Copyright: (C) 2020 Philippe Mathieu-Daudé.
+// This work is licensed under the terms of the GNU GPLv2 or later.
+//
+// spatch \
+//  --macro-file scripts/cocci-macro-file.h --include-headers \
+//  --sp-file scripts/coccinelle/object_property_missing_error_propagate.cocci \
+//  --keep-comments --smpl-spacing --in-place --dir hw
+//
+// Inspired by https://www.mail-archive.com/qemu-devel@nongnu.org/msg691638.html
+
+@match exists@
+typedef Error;
+Error *err;
+identifier func, errp;
+identifier object_property_set_type1 =~ "^object_property_set_.*";
+identifier object_property_set_type2 =~ "^object_property_set_.*";
+expression obj;
+@@
+void func(..., Error **errp)
+{
+ <+...
+ object_property_set_type1(obj, ..., &err);
+ ... when != err
+ object_property_set_type2(obj, ..., &err);
+ ...+>
+}
+
+@@
+Error *match.err;
+identifier match.errp;
+identifier match.object_property_set_type1;
+expression match.obj;
+@@
+ object_property_set_type1(obj, ..., &err);
++if (err) {
++    error_propagate(errp, err);
++    return;
++}
+
+@manual depends on never match@
+Error *err;
+identifier object_property_set_type1 =~ "^object_property_set_.*";
+identifier object_property_set_type2 =~ "^object_property_set_.*";
+position p;
+@@
+ object_property_set_type1@p(..., &err);
+ ... when != err
+ object_property_set_type2(..., &err);
+
+@script:python@
+f << manual.object_property_set_type1;
+p << manual.p;
+@@
+print("[[manual check required: "
+      "error_propagate() might be missing in {}() {}:{}:{}]]".format(
+            f, p[0].file, p[0].line, p[0].column))
-- 
2.21.1

