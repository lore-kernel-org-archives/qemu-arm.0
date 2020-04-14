Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5234156lfm;
        Tue, 14 Apr 2020 10:27:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypJHPrtAsDztTfgbcNexagWfQVafGDx+yw34BuDZ0tjtvHFTnSxu+2LrP1ZSG2Ne9Iajqpag
X-Received: by 2002:a37:7c81:: with SMTP id x123mr21795311qkc.287.1586885230196;
        Tue, 14 Apr 2020 10:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586885230; cv=none;
        d=google.com; s=arc-20160816;
        b=wtTwIvwgXLNqRVDBFXskZWgjpITVxyiQDwxaLle6ZVfTAvLRJIGFe+j3a9Jqy/pJNv
         yRI/ddkL3venzDISUoCq6uwgWkMFDf/EOdtw3UVLngH9RCN7IBjtk7KP0qlUw/+pj+us
         DV7FKwaQKWg8Uk+9p+/Kt0uCT5hP7v5mRZj30+Ws6BO/9O+Tj/V//0cHDJe8bn7UItzx
         k95YL/VGGR/2h4uKITtonwFt5bEi0+oyjiQ2PO0XfREjsBaMimrdpggGJowEcQSeJtdI
         fhKwAOZ8XDQSZ8dmDu4e1gRSY5o457LRrJieA0dUjU4ZOx7964o2PSGCwtYEyK1+6B4p
         3/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=n59eKf+0oDoamY0gLsMDzHfLMPXzKnb/MCgiWXZhTz8=;
        b=fsENGm+qNz2XzTBlCvBLLYfbmko90o/txXug+JLhk2WUjLkso8GZBgkGFVkqgIzNLd
         +4ju1gP+2dbI2yo/QSW6JKbGjPpaNPEiKs/Z1W2cjltqIPotHPPQ0fktvfSlfe3wYP3u
         Yu3WrauZ8gT1JH058SPJ93l2rXBbfcQnpGmjxhygfDHjMjZ0qAan4K9DfC2OWZb8FYu+
         5JIyp2V0hQsMP2D+pk+4s9OG1Iq/krgYKy0J4Qy2r1sXI4PA8GevLzf0sNnHn7l/RHbg
         Vu80ga1l6yGfFrEjFjrZaF/F3lOwdgXwXoo6ljSdGbxQiXEBVHXr8oFcI0roUTGI+uX9
         nhJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LsUdJIZx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18si7707757qkg.156.2020.04.14.10.27.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 10:27:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LsUdJIZx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOPL3-0004hy-L7
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 13:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43295)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOP2e-0001Pp-Bp
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 13:08:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOP2c-0007mY-VD
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 13:08:08 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:52723
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOLfW-0008QO-FJ
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 09:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586871122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n59eKf+0oDoamY0gLsMDzHfLMPXzKnb/MCgiWXZhTz8=;
 b=LsUdJIZx68+f13Io4YQ8CITy7P4w1N6jtm9wWOKxt9BeTERKa5H6mfgCVJ4sAl9pjcmccy
 F541cxSUiDVhZStOZxp16uEV9jr6a4pt1ogZR+DERvE8sKjZza4CfOCOY4hNBORCfU5hxY
 gOLcq2lev21zPant6A5za6hjFP8lmYc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-Yf7dFgbKNairJ9qPhXYCfQ-1; Tue, 14 Apr 2020 09:32:00 -0400
X-MC-Unique: Yf7dFgbKNairJ9qPhXYCfQ-1
Received: by mail-wr1-f72.google.com with SMTP id v14so8693450wrq.13
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 06:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KS4zH+Aytjp2L30CAb1LBJ5X0HgAg1y2VGWQ+0RaCBU=;
 b=LGHxbv14d8TpJ/ls/5ozP+llI1kQ1rtygC0Vym6MjBjqtzTv2NvIcytHGRqlAWv0h/
 M5kwbiuUQd0EDQXat4baRKl6uo0C/ucB6D647quKpz8B3NSYTAkquVIkFQIqXupsf8X2
 zFjDf37V0KfBs80tJ3QCG0MJJ3RhEXbhpcUY3b8cE5Xh5zRH6O6Ec4kn8JiIlgMJAi9r
 Fvu7ENFNk9T/+VP6NEcxQNZCmDWY77aMbILJTG3ulhhtvj0CqB7OxW1q3G+WKJTOvhhf
 jpfd/IrpibvfUIWj+1cZde5Lh38Puz5VsSHZ3h2L65u05txiVhoKGBCErbDMTZGpmcQL
 ++5g==
X-Gm-Message-State: AGi0PuY5zgkCJSlkAIKOZz1Y+OwMxvKo5zxdEbM0iLsVJ8akrSzqkwJM
 3iPoyancjvyjAvzZWSZu8Ckxkw9qBS05B12WQmSqUBxSk0/jh6oTBr7CjbflqLVKOWvSaoVIRNg
 XOxJk5FpiO9WmukY=
X-Received: by 2002:a05:600c:a:: with SMTP id
 g10mr24285279wmc.153.1586871116613; 
 Tue, 14 Apr 2020 06:31:56 -0700 (PDT)
X-Received: by 2002:a05:600c:a:: with SMTP id
 g10mr24285254wmc.153.1586871116450; 
 Tue, 14 Apr 2020 06:31:56 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a7sm2414016wrs.61.2020.04.14.06.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:31:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 12/12] gdbstub: Introduce gdb_get_freg32() to get
 float32 registers
Date: Tue, 14 Apr 2020 15:30:52 +0200
Message-Id: <20200414133052.13712-13-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200414133052.13712-1-philmd@redhat.com>
References: <20200414133052.13712-1-philmd@redhat.com>
MIME-Version: 1.0
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Fabien Chouteau <chouteau@adacore.com>, Max Filippov <jcmvbkbc@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yEom9mZhBUAv

Since we now use a GByteArray, we can not use stfl_p() directly.
Introduce the gdb_get_freg32() helper to load a float32 register.

Fixes: a010bdbe719 ("extend GByteArray to read register helpers")
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/exec/gdbstub.h | 12 ++++++++++++
 target/sh4/gdbstub.c   |  6 ++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index f44bdd2270..6d41234071 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -125,6 +125,18 @@ static inline int gdb_get_reg128(GByteArray *buf, uint=
64_t val_hi,
     return 16;
 }
=20
+static inline int gdb_get_freg32(GByteArray *array, float32 val)
+{
+    uint8_t buf[4];
+
+    QEMU_BUILD_BUG_ON(sizeof(CPU_FloatU) !=3D sizeof(buf));
+
+    stfl_p(buf, val);
+    g_byte_array_append(array, buf, sizeof(buf));
+
+    return sizeof(buf);
+}
+
 static inline int gdb_get_zeroes(GByteArray *array, size_t len)
 {
     guint oldlen =3D array->len;
diff --git a/target/sh4/gdbstub.c b/target/sh4/gdbstub.c
index 49fc4a0cc6..da95205889 100644
--- a/target/sh4/gdbstub.c
+++ b/target/sh4/gdbstub.c
@@ -58,11 +58,9 @@ int superh_cpu_gdb_read_register(CPUState *cs, GByteArra=
y *mem_buf, int n)
         return gdb_get_regl(mem_buf, env->fpscr);
     case 25 ... 40:
         if (env->fpscr & FPSCR_FR) {
-            stfl_p(mem_buf, env->fregs[n - 9]);
-        } else {
-            stfl_p(mem_buf, env->fregs[n - 25]);
+            return gdb_get_freg32(mem_buf, env->fregs[n - 9]);
         }
-        return 4;
+        return gdb_get_freg32(mem_buf, env->fregs[n - 25]);
     case 41:
         return gdb_get_regl(mem_buf, env->ssr);
     case 42:
--=20
2.21.1

