Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5945961lfp;
        Tue, 18 Feb 2020 01:53:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqyNaCytlypjZnCeIfVSPYCrChoqHzxeIYmnGKzTr7Yf9do/p8yotGCxEXuO0veClDIffeeL
X-Received: by 2002:a37:2f41:: with SMTP id v62mr13237585qkh.245.1582019635565;
        Tue, 18 Feb 2020 01:53:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019635; cv=none;
        d=google.com; s=arc-20160816;
        b=zcKGZTaxJRJOvEG/f2i/jB5cP5UbOQMQZ3/rU8KEZy+8mEwtCGZG6zMVkg4SOVSFsp
         446c2kT2OgkPu1HJrm5527YOpfHKP09AHnNxIGgVXaiN9W1LWPUvAW+Vbp+KG+YTOmsc
         LhyZsxDdKa/EBn8nNwDSTgrabzF+0D07Yj7+FKrk88IzoiVLeAN5SnKcODi4zQP4hmVd
         Dj/Gd7HUV65umIfpgjn7Lq4CL0RvIRo+AnGN95TaUnF5NXE8lmXrT8Uay6Y2R2iM14xy
         dEjAWQCeoNFjWWWE+sKaEHTADbcHEVsMgJvRCPFf3Rzmhx/tQHW0fLMoxWA+OwOtnMzs
         OBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2H4J2vu3KXwWqexWZLOkS7UYkLLeRSP92ejNeD36GIo=;
        b=n8DApRyGSyu0ngKfyBhBJXRn0lP4G5Bv79WDzy15u1sQ4V852ojekj3IXZBmr+W413
         rluxfPmRZVk2OYZAJMy2kYPqxxJwCjx7aDzwZuCKj2FZy+zk1pHi7F5C8i6PjLjbm14o
         J5RqtNCOyd1PwPDcfopxXYeuHJIE2zLy5IPpuFWowDGxpsMn7fXqAXv7nKQ+mcFkX23e
         UqP3rBdUMlveVuAxtLsrIU1cD8aVqAurNmgT1eP2NpWR4bUKbf81n/P9cc/ykn0oswMm
         XMVaTxDjZfuycIXHkrzZRcQXP9yTnSbB0+LliYhywXdpagfL19iGQpaIGq+UTfb9zf/y
         V66A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fLmbrA1P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15si1432522qvr.72.2020.02.18.01.53.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:53:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fLmbrA1P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zZi-0000w0-Ul
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:53:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43636)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQe-0001yA-7P
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:44:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQd-000658-5Y
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:44:32 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25302
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQd-00064d-0m
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 04:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2H4J2vu3KXwWqexWZLOkS7UYkLLeRSP92ejNeD36GIo=;
 b=fLmbrA1PguWd4xTZgZzaIu4QgOXoPlJ4cbx84zoZeT1DNKiGcSDjo8A8NRnlolcAu451Ie
 vOQHpGHlc6vseo06sByk7ELOMS5AVAYDbsQgzl5y24dMaFAYlI8GU0LCmwmq1sFF1j2H80
 U7u7dO1wBSU+SAAWfiHFf9wqM+mHTSE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-Yp8misK6MMyYCssu3sLzqA-1; Tue, 18 Feb 2020 04:44:29 -0500
Received: by mail-wr1-f69.google.com with SMTP id u8so10519220wrp.10
 for <qemu-devel@nongnu.org>; Tue, 18 Feb 2020 01:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ueQmicwIeIWE9QVKujYvFp2EZixSOWD+HCjjhY2qH0=;
 b=fQILIPh9cMEOVkjwtr5e6EFRKKlO+M3AqQ/juvYX5k0DV660nCmejlgutTK6TXDd8S
 nEHSZYOKnF8Ec1LLHLJcgUxhL553F1Qls9rii6wDKPDIkOHrjrRf7+Y0MlupkI9trtfa
 xIrcSzKfy6ZzAP6NVj7cpmiwKRb0T/ltgOWOZS0FUY8A/Arj/eKRgu39lNIqPpsr2dXQ
 gXOCz/6aGcJe9HKf67GoB0Pxa5M5X+kyhK2d9/ZMATBJ/FszmABicKC2tPh4vHNoCL9u
 9BS1qDXii6jddG1uuHxngg2X8QgU0qri4CgIEFeE5M9HQvw00luK2fnm5x2xORmcnpdy
 aLRQ==
X-Gm-Message-State: APjAAAUveOHDTnm3rhZ4WsUO5mAmh6A3He8PqgeVuKg1WM2vMdTEw9fK
 ZPdcA83E3NniumeHSa/YWJWJRiNMhMfIubb7ZRgRIRchk1ugCPK0ZoJv1/DmjBL2XfPjyxC+1e8
 wwiRhrSfL/XrtIuw=
X-Received: by 2002:a7b:c14d:: with SMTP id z13mr2148686wmi.71.1582019067778; 
 Tue, 18 Feb 2020 01:44:27 -0800 (PST)
X-Received: by 2002:a7b:c14d:: with SMTP id z13mr2148654wmi.71.1582019067602; 
 Tue, 18 Feb 2020 01:44:27 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 11/13] target/i386/whpx: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:44:00 +0100
Message-Id: <20200218094402.26625-12-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: Yp8misK6MMyYCssu3sLzqA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Justin Terry <juterry@microsoft.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8aFAFkxSBhr9

Fixes: 812d49f2a3e
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Justin Terry (VM) <juterry@microsoft.com>
---
 target/i386/whpx-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/whpx-all.c b/target/i386/whpx-all.c
index 3ed2aa1892..35601b8176 100644
--- a/target/i386/whpx-all.c
+++ b/target/i386/whpx-all.c
@@ -511,7 +511,7 @@ static void whpx_get_registers(CPUState *cpu)
     /* WHvX64RegisterPat - Skipped */
=20
     assert(whpx_register_names[idx] =3D=3D WHvX64RegisterSysenterCs);
-    env->sysenter_cs =3D vcxt.values[idx++].Reg64;;
+    env->sysenter_cs =3D vcxt.values[idx++].Reg64;
     assert(whpx_register_names[idx] =3D=3D WHvX64RegisterSysenterEip);
     env->sysenter_eip =3D vcxt.values[idx++].Reg64;
     assert(whpx_register_names[idx] =3D=3D WHvX64RegisterSysenterEsp);
--=20
2.21.1

