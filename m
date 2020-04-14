Received: by 2002:a0c:f485:0:0:0:0:0 with SMTP id i5csp1065458qvm;
        Tue, 14 Apr 2020 09:36:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypKVuo8tvrQ+0W6OcuJJxO85uNx3Nh4vf7sXJM7bIyt9J74t35hDg5d31f5WlD2G18Jl0IpA
X-Received: by 2002:a0c:ec07:: with SMTP id y7mr810775qvo.183.1586882190158;
        Tue, 14 Apr 2020 09:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586882190; cv=none;
        d=google.com; s=arc-20160816;
        b=Mu9v+/EcWpD5QjJZnLXkwhHkVYOlPyNndyg5HFCv81nYKqNhej0KPHV0fSAISz95Nr
         o41d7CW7kLbX/kQbrzrriGa0QOtccJx4e1Lz61R7dWLlvj6XT1r6HaMr2h8JQaUj6QOW
         woC5YonrzNRh6qFktN9vBupHOOZKdCeVWxEzH0KbEuZDUvviH7/F+vqpgKBgOVOAap1D
         pQD7XfCt8gpaJ6VWtucC7NPS+WUlJMnlHpSfBVarZktFGgEDOAM5p3fGiwhMtO3vsvvf
         fVcYif6SG+EdhbYDx3AHVbHCqFiIaB3uhyZSjnQjEdrrSHmZlenrqnRSsaVJA9istAlR
         vpxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Fjs4yVSzX/t7eIZ4BMJCeGD5o8nvdl+6NyWwA/aHCM0=;
        b=bQL73cFoItpsbFkn5m2OH4+pZacIcERVCAUPovZA4UzM8tJttFDXvwkdCZPst96j5T
         Kv90sxPYZca0HKudp5Ydu/CuaMWJGS/ol4nGy3RCbrN3hYf3YS+tljvFQjo8RYLVX8CP
         oOYE0lbbdDdrWYiy1NTEYJZjnDqWNH73jTzahzVIhRE/8UJXZ1yqfYezhqAorFzFPyfw
         r588r02d1kNMr4ObGz300hy4grZxWVwnLf7bIaqPts9SNjnPN3k4fS0PMmAiRIIs7xNO
         3iWE4dCs3PLSGLI2J18yhvCJi5jgW3DvkHxbC0OwsZG+GVHMemrhosesLRBag2mbOyb6
         KhGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fCVIrjvA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 26si8446759qks.280.2020.04.14.09.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 09:36:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fCVIrjvA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOOY1-0005L3-Nv
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 12:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52026)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jOOPN-0007Jd-Lx
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:27:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jOOPM-0007Zo-8B
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:27:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26198
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jOLfQ-0008P6-5J
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 09:31:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586871115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fjs4yVSzX/t7eIZ4BMJCeGD5o8nvdl+6NyWwA/aHCM0=;
 b=fCVIrjvANftPw/cpB8vc7GG2NPioQJ7Z3AUnVzDsLd8yUWu7dH9dsNYx8A0nZhEdBe12PQ
 KPrIaEvm8vF3a66ADEwLEkKpNUMql4RkKMRx3V5TEp0iJ1foSypHn3UKxC9XfWj2Al/nVN
 +zVlOZ3jTXgrxaPT8PJdoTH2q4ZJfJY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-_fImy4kmMVWZ7V47WhgILQ-1; Tue, 14 Apr 2020 09:31:54 -0400
X-MC-Unique: _fImy4kmMVWZ7V47WhgILQ-1
Received: by mail-wr1-f70.google.com with SMTP id j16so8003354wrw.20
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 06:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RxFffFGRSs8+HS+rlE7EgcZ1aLnSCjkXM0Jmxf700XU=;
 b=jwEuGYIg8w5PKRqVQyATdwRSZpDQrtUFoSe9rRl7b4v9uhkSkYy0+wYjFA1yjQ4MAR
 oPBc/Uh3+JLW/k1F+SYT42PlOmFQ1Kzu5BJg17Asjz7L8d5eNAeifYLW1yf4BEgfv4UF
 hpf6UTZTTRNyRrANFKyF12LyHI6alu8Ds6RbF3At+zMnr0IY9Y9rNEJleZulhBTNLd0R
 QBZNcfNhhgVRWFShVSFFqf753az6QI8T7DSon3WnYbx95cEwiqqX3aFvlzNkb5e/HU4P
 Dp6vCKmYzEP6UuyluElc06kIwn/eMVkcPSzvpFa6EJ/pdyioZ3v3EIeGpWX0Tf2P7MZs
 KUQQ==
X-Gm-Message-State: AGi0PuZJfhvKWw9iJjdFRsWn4uCGm7VByDRQD9Nd+zAMeaL/MaJOwoTR
 lP4pRzOLzHJKQmwWKRxgLnXaw2DKot3kPbkvSRdoNtMAob+qz8Al57/s2r4ffyXhEsegp5EqWlk
 +QFqdgFIw2KwQmdU=
X-Received: by 2002:a1c:2e0a:: with SMTP id u10mr23597880wmu.146.1586871112676; 
 Tue, 14 Apr 2020 06:31:52 -0700 (PDT)
X-Received: by 2002:a1c:2e0a:: with SMTP id u10mr23597795wmu.146.1586871111491; 
 Tue, 14 Apr 2020 06:31:51 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id s14sm19592651wme.33.2020.04.14.06.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 06:31:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.0 11/12] gdbstub: Do not use memset() on GByteArray
Date: Tue, 14 Apr 2020 15:30:51 +0200
Message-Id: <20200414133052.13712-12-philmd@redhat.com>
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
X-Received-From: 207.211.31.120
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
X-TUID: ALcauzi78jFt

Introduce gdb_get_zeroes() to fill a GByteArray with zeroes.

Fixes: a010bdbe719 ("extend GByteArray to read register helpers")
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Since v1: Use memset (pm215)
---
 include/exec/gdbstub.h  | 10 ++++++++++
 target/arm/gdbstub.c    |  3 +--
 target/xtensa/gdbstub.c |  6 ++----
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 30b909ebd2..f44bdd2270 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -125,6 +125,16 @@ static inline int gdb_get_reg128(GByteArray *buf, uint=
64_t val_hi,
     return 16;
 }
=20
+static inline int gdb_get_zeroes(GByteArray *array, size_t len)
+{
+    guint oldlen =3D array->len;
+
+    g_byte_array_set_size(array, oldlen + len);
+    memset(array->data + oldlen, 0, len);
+
+    return len;
+}
+
 /**
  * gdb_get_reg_ptr: get pointer to start of last element
  * @len: length of element
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index 8efc535f2a..063551df23 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -47,8 +47,7 @@ int arm_cpu_gdb_read_register(CPUState *cs, GByteArray *m=
em_buf, int n)
         if (gdb_has_xml) {
             return 0;
         }
-        memset(mem_buf, 0, 12);
-        return 12;
+        return gdb_get_zeroes(mem_buf, 12);
     }
     switch (n) {
     case 24:
diff --git a/target/xtensa/gdbstub.c b/target/xtensa/gdbstub.c
index 0ee3feabe5..4d43f1340a 100644
--- a/target/xtensa/gdbstub.c
+++ b/target/xtensa/gdbstub.c
@@ -105,8 +105,7 @@ int xtensa_cpu_gdb_read_register(CPUState *cs, GByteArr=
ay *mem_buf, int n)
         default:
             qemu_log_mask(LOG_UNIMP, "%s from reg %d of unsupported size %=
d\n",
                           __func__, n, reg->size);
-            memset(mem_buf, 0, reg->size);
-            return reg->size;
+            return gdb_get_zeroes(mem_buf, reg->size);
         }
=20
     case xtRegisterTypeWindow: /*a*/
@@ -115,8 +114,7 @@ int xtensa_cpu_gdb_read_register(CPUState *cs, GByteArr=
ay *mem_buf, int n)
     default:
         qemu_log_mask(LOG_UNIMP, "%s from reg %d of unsupported type %d\n"=
,
                       __func__, n, reg->type);
-        memset(mem_buf, 0, reg->size);
-        return reg->size;
+        return gdb_get_zeroes(mem_buf, reg->size);
     }
 }
=20
--=20
2.21.1

