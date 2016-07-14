Received: by 10.25.21.156 with SMTP id 28csp272818lfv;
        Thu, 14 Jul 2016 13:21:35 -0700 (PDT)
X-Received: by 10.13.194.3 with SMTP id e3mr11689129ywd.50.1468527660965;
        Thu, 14 Jul 2016 13:21:00 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com. [2607:f8b0:4002:c05::244])
        by mx.google.com with ESMTPS id y18si1684004ywa.427.2016.07.14.13.21.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jul 2016 13:21:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::244 as permitted sender) client-ip=2607:f8b0:4002:c05::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::244 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-yw0-x244.google.com with SMTP id i12so5519370ywa.0;
        Thu, 14 Jul 2016 13:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u3oZqkpxQydkIValXqJKFpKHJFXj6mE5a2P5z+Aa8iY=;
        b=kzXE3O8V1c1uXfDx1YAzZc4/2yh8lR8KAzbHAzkYxT4TQwj87Ngv2Q5uBESWY4K023
         k45RDk49YSxLrlnB1X737u7F8wMTMtgNe+P4MalOsR4+ulQFxiowZEmddOUiybdq2Sf6
         4GT06JnGnTdPkrBL4iX8a3+4qzs3zrf9IdohzRd0XqTD/28pXlIfA7JKB+lWr/c3J9pL
         UuQFL2TCPR7rhOeJZhTbGb3YaB4Xvtncvp3oU2QWyAMsxNov26tYBzhs7uJQkkGElzYL
         SWPrh2GCt/UNnjppY8H/mijEnFdO6CAwq0EvIgKncjqj5Kb6c2deE2F0ozbxEWfBIVTn
         Pabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u3oZqkpxQydkIValXqJKFpKHJFXj6mE5a2P5z+Aa8iY=;
        b=EVwefoTqbSBdke/OpdtF2ij5S9Bzj8S/6U+t/+Ey9ztasbasZMizkQmOrgtaQ5uU6W
         fNM8z7S2ppIcrIUlhBzQd7+MwU0HPzZT05iPEHYmwHkpbSZEIPNvtR/sJ/v49mZmtVov
         nz4rDCEdR2UmIqd5Gg0rSByMRmXAMAplvC4Dz8pJJ47Ep/rLQ2QlubueSBETbuHXxdd0
         zsF9iTdth/sovV/deXzudK/clcdVcikPq0slDzz5GbpiuYmgYfWKBtPHCSREIiTtrBD5
         NRUMEuQsLyrA7Xf5n007rBMU8Be56wBpDWhfweOR7BfuvUbklAJS+qpqq51oLJj+elod
         ATzg==
X-Gm-Message-State: ALyK8tIA3G2nFNdv3uWSgybHU6FFX5gDFicKaYP9hz93BtSMlUGwCY75DrqAku0C4Ra7Xg==
X-Received: by 10.129.31.84 with SMTP id f81mr11140825ywf.127.1468527660528;
        Thu, 14 Jul 2016 13:21:00 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from evgadesktop.attlocal.net (108-232-152-155.lightspeed.tukrga.sbcglobal.net. [108.232.152.155])
        by smtp.gmail.com with ESMTPSA id v68sm1634604ywg.31.2016.07.14.13.20.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 13:21:00 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM),
	qemu-devel@nongnu.org (open list:All patches CC here)
Cc: qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	pbonzini@redhat.com
Subject: [PATCH v4 13/14] target-aarch64: Generate fences for aarch64
Date: Thu, 14 Jul 2016 16:20:25 -0400
Message-Id: <20160714202026.9727-14-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160714202026.9727-1-bobby.prani@gmail.com>
References: <20160714202026.9727-1-bobby.prani@gmail.com>
X-TUID: hPfVjThlDEE3

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 target-arm/translate-a64.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index f5e29d2..09877bc 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -1305,7 +1305,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
         return;
     case 4: /* DSB */
     case 5: /* DMB */
-        /* We don't emulate caches so barriers are no-ops */
+        tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
         return;
     case 6: /* ISB */
         /* We need to break the TB after this insn to execute
@@ -1934,7 +1934,13 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
         if (!is_store) {
             s->is_ldex = true;
             gen_load_exclusive(s, rt, rt2, tcg_addr, size, is_pair);
+            if (is_lasr) {
+                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
+            }
         } else {
+            if (is_lasr) {
+                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+            }
             gen_store_exclusive(s, rs, rt, rt2, tcg_addr, size, is_pair);
         }
     } else {
@@ -1943,11 +1949,17 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
 
         /* Generate ISS for non-exclusive accesses including LASR.  */
         if (is_store) {
+            if (is_lasr) {
+                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
+            }
             do_gpr_st(s, tcg_rt, tcg_addr, size,
                       true, rt, iss_sf, is_lasr);
         } else {
             do_gpr_ld(s, tcg_rt, tcg_addr, size, false, false,
                       true, rt, iss_sf, is_lasr);
+            if (is_lasr) {
+                tcg_gen_mb(TCG_MO_ALL | TCG_BAR_LDAQ);
+            }
         }
     }
 }
-- 
2.9.0
