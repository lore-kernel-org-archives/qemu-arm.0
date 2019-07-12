Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp919172wrv;
        Fri, 12 Jul 2019 06:40:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJoNyySBD9fP8c6aKYw8vF9nAoT9N0u97Pd0F1Y5+h9/rHlO3CsDrHetKwavayeFy33n3K
X-Received: by 2002:a50:f5f5:: with SMTP id x50mr9156088edm.89.1562938818314;
        Fri, 12 Jul 2019 06:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562938818; cv=none;
        d=google.com; s=arc-20160816;
        b=VBV5UGwpL8AAo9FM2Dc98r+5Ukfr2TAvLUymfRgvtp9NiszTEm0PdTYeJd5rNpEQ5n
         OSB0+2ZbrpnuRKfTSrMeC9nm8QSaZmb8RBCv1IHav5ia+x1cD7s5pNwhNinds8S7V9Cm
         ah5u+vS+l/+ZoA4s0K9UeR0aekNW7XFujvbaZgWqcSiJecVAWVF3IuwdkMUqt2EhZRhT
         j+lPAmFulTlVvGAT8HmWbt0GRallJegJjRn/6YiqUz9ve75FqgzwxlYVwXxgLlDNSAe8
         Yi9XNA/miOrqLVJO2GjA9d1WYtRonjL12vqMcKaCtVG8FoPsVZl+jo1lfoyV9ZQzZ9+N
         rveA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=fPQg15TqtM5cXmL/Tx9oAFm2S60J7VpXTTN0lh1bAaA=;
        b=hKc4GLou2iYHiq7FKTrnr8aJL266jaXcTtdIbbDfXsASnt/9w4sWWAl01XMQ/FKJuM
         LQy/aT6cTqpTa16LcnzbtsjtX7sINn7RNxY3IKLKHnU+Hq5JWPtHxQK9Y7gZZfzNZ3ca
         hwBNbJJik3alGlPd2gFpO8jaYagIULt+YreSfknUNvM1VY37uTzXDQmd9lgWJlbl9P9p
         Tye1E9L5L8BdQH8pPwiANYe0BG9+7wJDnp8ZZad/hshJxKQTO5ucPQvSQbKekzTCqog3
         L2ZQB4Qwa1b+62NMlUcWLVDkGA4/Zup3uib6+ajw8MPjTG8VLq0bDU6EFTI347nkllz9
         aHZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z3si5290339edc.389.2019.07.12.06.40.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 06:40:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlvma-0005tB-Po
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 09:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57580)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlvmS-0005ds-Uw
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:40:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlvmR-0006jr-SM
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:40:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46972)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hlvmR-0006jA-MQ; Fri, 12 Jul 2019 09:40:07 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 051EFC057F2F;
 Fri, 12 Jul 2019 13:40:07 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-150.brq.redhat.com [10.40.204.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87E7019C58;
 Fri, 12 Jul 2019 13:39:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 15:39:26 +0200
Message-Id: <20190712133928.21394-6-philmd@redhat.com>
In-Reply-To: <20190712133928.21394-1-philmd@redhat.com>
References: <20190712133928.21394-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 12 Jul 2019 13:40:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1? 5/7] vl: Use qemu_strtoi() instead of
 strtol()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mGQj7JX3NEtO

Since we'll move this code around, fix this checkpatch warning
first:

  ERROR: consider using qemu_strtol in preference to strtol

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 vl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/vl.c b/vl.c
index 96de4f74b9..c7f4d01c99 100644
--- a/vl.c
+++ b/vl.c
@@ -978,8 +978,7 @@ static struct bt_device_s *bt_device_add(const char *=
opt)
     pstrcpy(devname, MIN(sizeof(devname), len), opt);
=20
     if (endp) {
-        vlan_id =3D strtol(endp + 6, &endp, 0);
-        if (*endp) {
+        if (qemu_strtoi(endp + 6, (const char **)&endp, 0, &vlan_id) < 0=
) {
             error_report("unrecognised bluetooth vlan Id");
             return 0;
         }
@@ -1019,8 +1018,7 @@ static int bt_parse(const char *opt)
         if (!*endp || *endp =3D=3D ',') {
             if (*endp) {
                 if (strstart(endp, ",vlan=3D", &p)) {
-                    vlan =3D strtol(p, (char **) &endp, 0);
-                    if (*endp) {
+                    if (qemu_strtoi(p, &endp, 0, &vlan) < 0) {
                         error_report("bad scatternet '%s'", p);
                         return 1;
                     }
--=20
2.20.1

