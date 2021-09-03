Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1516501lfb;
        Fri, 3 Sep 2021 10:47:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2dkUQfjk2BO796eIrxl6cw6BfRyUU1GwOokLb3nJmh7K43UYv3UeYW5ZH25Onf5FVXbbU
X-Received: by 2002:a05:600c:a08:: with SMTP id z8mr56398wmp.52.1630691249281;
        Fri, 03 Sep 2021 10:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691249; cv=none;
        d=google.com; s=arc-20160816;
        b=JZupXKO20wu9U+36NYhVOUHm/AEk5Iy0BuqYmsTMy3y5B7o/+VUkHu7FABEwbdWVk1
         c3HS2Gl4+hBJrTFG5L0NZeTYcoPJzCnvWVEu5O4FW+nFPSS/DEEms+13A/FrXNBVhG8g
         yASM4XuOzp+ky8i3YlCddXy9lzKdvsrLyWs4dSoO5IrwvPKSTBNOwrgcHgYaf5KjQlsv
         QBVCFXM9coNh65epQuIWXGAuYFI4kwn0IzTjgaR7NeqVBpHYrMPIKjf5p6GOQ+d8fc8y
         uztySmhimOVMluyKAXqpGdCkp2QNLPGLA7x95p0KQvVgwQNligIKraEVqSDhtBiWmQ4X
         zAjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YK/6tC4z9KDPJlWm5GSX2+ZhH64J9HoZElqQqFMEcSI=;
        b=TPI1SX5QnTRcK+xnP5Yg3J2cQTOds921oAWIEdoitp8nkWhKaCKZjOVXagjmcRxb/K
         4cPgWRPn0InLJCR+vhapTYo0Z9LIRI1k1Rrs7uYzUVm94Q+h9wssEyyDLysYtZjc9lmD
         e4+58V2RMxmp8D1DuMrDHKK3vGu9nxs4Dp/y046v71kQ8Od4U0u9ZCP5qGRJHpc5K3sy
         2/bfH37OS5aNgSgSEQxq25ym+9K1RjDAovihUpw/vxV3qjGFHaYIYp+bBM2HJoa2eieJ
         OYAAlmxv0cX4numNGosLULy4fjs8qFimXYepI2ESNSeCbxE9R2nyH31effMMYPr6ufGH
         TmiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QPHWWv01;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id u15si193871edd.40.2021.09.03.10.47.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:47:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QPHWWv01;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YK/6tC4z9KDPJlWm5GSX2+ZhH64J9HoZElqQqFMEcSI=;
	b=QPHWWv01eUprPDVa+QNEL01vLyT6kBHCfobGSx7VokIujoL7PaqYPJOGiOMIA5TMRK9UeC
	SYL/iKuStg2uK3r+JDM6j76SPeUpOnw3j+SH2OLtjRD5KYqK+6Xw4rwaqk0FWUU/98TpOu
	sMpOpVlsD7kizLg8LXmCOkY/fmBIZWk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-_tddkB5PMtyvHs98-uS3QQ-1; Fri, 03 Sep 2021 13:47:27 -0400
X-MC-Unique: _tddkB5PMtyvHs98-uS3QQ-1
Received: by mail-wr1-f72.google.com with SMTP id h6-20020a5d4fc6000000b00157503046afso1810066wrw.3
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YK/6tC4z9KDPJlWm5GSX2+ZhH64J9HoZElqQqFMEcSI=;
        b=os5YXhVX7DoO8GZ1YXmIaJkr+ONcuq60f6mzGc/vo1bok3KEUkG+oPnfmSZ6YxrLWk
         tP0G0sEV76nQ6stYzYBez6YRTqd3uMKmwREGnQT0l/ctzO6cTiIL3mlgWBaprx4x3/2w
         0u2K0y3smQ2096RVgXK4CvP+Ls7ZLVM+dWZrmJHICgY0bdb9Kq85jtx0WQA9QhqDQN2j
         ZbANUTAOZU9+3AOCjnjx7Rl8ZrK17r2wfSlk5IhQBuDSq64oGa7kVgjdLvGUO55yLOAh
         21sQTRf1wpMoQdSaZf2pnxbl+LRKJ8IJ6g4okUdr8Rbcryqs/jjSthjddFINCp9iejI2
         sR9g==
X-Gm-Message-State: AOAM531QOr3KJdID3wqtGoTcPnAlfexkaS5nFOMhPwGEu22ATsabqKEc
	t4xKkyH6UMaOgf4AqyVwx9Yyxoq2EzcfBL5PyL/XsJERTp2FiUXdl7qCFV+cBNmpoDaS/yCPEwS
	+kWnwJsyorXPbH4N0
X-Received: by 2002:a5d:504f:: with SMTP id h15mr276233wrt.69.1630691245888;
        Fri, 03 Sep 2021 10:47:25 -0700 (PDT)
X-Received: by 2002:a5d:504f:: with SMTP id h15mr276215wrt.69.1630691245679;
        Fri, 03 Sep 2021 10:47:25 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id l2sm129077wmi.1.2021.09.03.10.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:47:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org,
	qemu-ppc@nongnu.org,
	"Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v3 25/28] target/arm: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:45:07 +0200
Message-Id: <20210903174510.751630-26-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bWyTqSkLzCaL

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a7ae78146d4..96ff81fe68e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6242,8 +6242,8 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
 
         /* Create alias before redirection so we dup the right data. */
         if (a->new_key) {
-            ARMCPRegInfo *new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
-            uint32_t *new_key = g_memdup(&a->new_key, sizeof(uint32_t));
+            ARMCPRegInfo *new_reg = g_memdup2(src_reg, sizeof(ARMCPRegInfo));
+            uint32_t *new_key = g_memdup2(&a->new_key, sizeof(uint32_t));
             bool ok;
 
             new_reg->name = a->new_name;
@@ -8818,7 +8818,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * add a single reginfo struct to the hash table.
      */
     uint32_t *key = g_new(uint32_t, 1);
-    ARMCPRegInfo *r2 = g_memdup(r, sizeof(ARMCPRegInfo));
+    ARMCPRegInfo *r2 = g_memdup2(r, sizeof(ARMCPRegInfo));
     int is64 = (r->type & ARM_CP_64BIT) ? 1 : 0;
     int ns = (secstate & ARM_CP_SECSTATE_NS) ? 1 : 0;
 
-- 
2.31.1
