Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4257548lfi;
        Mon, 6 Apr 2020 11:09:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypLNBFq6lcjsU5mJfMKp7vNTVziaxedBAsoULLbLDgDzmcdNOlsXzr+QEdH7BS9y7Y402WS4
X-Received: by 2002:ac8:7b39:: with SMTP id l25mr767065qtu.72.1586196546650;
        Mon, 06 Apr 2020 11:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586196546; cv=none;
        d=google.com; s=arc-20160816;
        b=kvCSIL5ksdUQ5jM+YPsyFK9ZN05sd58+jJ8p1jP+hPBs76JiuaEmcRpSoDWPho39CE
         1sOTwZ+T7OVPc9Ug/UY177UX5RJvt1LRuEr0MkqZIO98TlKUtcY/ZTc9kmFxowbXm808
         nip3NaQiug+vpJiaQp9ztYlly7Ta2mqsIwJm217sS+Eu+j1azz3B9F+xyFnqtX8OJOf1
         tZ9NMLY6/7LnVf08wFUTNAiYZIJ0BY2AbhWi2jF+3ZzXvSJQWZh/xlwpLmeQnuSqGHYk
         MRnSOpvck/dcRtzXm/vyZfj//ePDapSK2PuSl21oqFl2E0YW+J4pdDSMuigOYNhG2qN9
         5mYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Vz5Q0dw9UVVsHWJSWDpAMdysuLCt157lLdcHJoqyiRY=;
        b=aHaTEAAZlJ3aCyrTSH+NXIMbA6MFVhjeCuiL+BndNmHW60nJK5M1tuHzL190ua5ST6
         P6+3o3wOAv+Nk84j10jiBWmmkrKSaYFeIlNqYGSQJGZBXP9tGea2+IL63v2Pn5/IDv2t
         QXs7ykvha8rBBkPM0TJ/zV0o7P85IB+ItkXMvQHp06LkiXZI5v2F09LYruH67op4RZ/D
         gbqzFmel3F3KpGU157/wuORTBjOtES47dTtDLvzR+xJRiy0MoKwREWsu0GqZphPzn4bw
         751ExrMgcyO8du8j6iHjcM3p8GbIdMo/0iNUExUNpCXOZBI+j56x/9oSHMEoMIlOb5TR
         mxbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="DgZX+/Th";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f63si257611qke.227.2020.04.06.11.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 11:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="DgZX+/Th";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLWBF-0005VM-Up
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 14:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36837)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrh-0002x7-AK
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:49:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrg-0003Yn-7C
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:48:53 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:43459)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVrg-0003YJ-0s; Mon, 06 Apr 2020 13:48:52 -0400
Received: by mail-wr1-x444.google.com with SMTP id w15so467980wrv.10;
 Mon, 06 Apr 2020 10:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vz5Q0dw9UVVsHWJSWDpAMdysuLCt157lLdcHJoqyiRY=;
 b=DgZX+/ThOXO9FlaiLSsA2n361HyQEVVBt0lsXR4efUjz3HcIebZ5eNHDiu7e78EatS
 iuxI1rRpIrqddiXsZtUgQ1KohI5XQx7wF+4tp2prFv9PBfXX4uxtJC5/zza13mNPsASd
 dBlaoLFiDwoBBKEZQl4D/rvDjMOdpJW0P+S6hyfZeFbAeWOMQgfMEaDjvmnpkn1mLiPo
 P9Y7J14+pwHJIkkkspaQkBRwdw1CE9SPz0f+MaTlP9enWzwjHUkWQxr0p/Urx6wixhdi
 uXQ0CRuWx45bNj97FbFJA6xFM4q5KEZWEr1E/Kr9ahpxOj11jllNxH/ENCEHGYRs6Lnu
 iWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Vz5Q0dw9UVVsHWJSWDpAMdysuLCt157lLdcHJoqyiRY=;
 b=deeRAvJj0kFS7Lar/XyVCY4e10U2xL7puZgF/tqPEoQmIfOOyiKQCDLU06rPdTysfi
 H8NKgFZPpHBULkykY8Atk1J6S0r2hTD/g88DAcO4zeaKlgvkYsZH8ElYNNyLI0Gfdr7L
 uKcgxNmUBxAPGJ2Zyf3/3gOTs1qi7ilxwnOBVn4NkjjWRCyJdsW00EdGXckEniuiKEXo
 BMnSMoDXfdelnW3gtXfEGt05KfJDr06vqN2uVVBGe6+uigpq2p0XCvC0KsCaPoZzKcwH
 Y63b7r2rrMf+weTfU1nqqc5yU7IL4vHkl6atbRfmCf/3K3QjQcIj21NO+TBlgm4pUVuB
 uyZA==
X-Gm-Message-State: AGi0PuYEs70MhPjAzGS8YUNqbzI3Cr/z2wYqslerIQG3M+mETocFwz7N
 pt3w1BgMGAjtBxS2U7xAa+yLe79Hc9o=
X-Received: by 2002:adf:dc92:: with SMTP id r18mr387225wrj.76.1586195330875;
 Mon, 06 Apr 2020 10:48:50 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:48:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 45/54] hw/net/xilinx_axienet: Add missing
 error-propagation code
Date: Mon,  6 Apr 2020 19:47:34 +0200
Message-Id: <20200406174743.16956-46-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kUUXFU+h70bx

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/object_property_missing_error_propagate.cocci \
    --keep-comments --smpl-spacing --dir hw

Then review showed this file has a 'xilinx_enet_realize_fail'
label that calls error_propagate(). Updated the patch to use
the label.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: New cocci patch generated both transformations
    (Peter noticed v1 only catched one)
---
 hw/net/xilinx_axienet.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 704788811a..db2c675b16 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -958,6 +958,9 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
                              object_property_allow_set_link,
                              OBJ_PROP_LINK_STRONG,
                              &local_err);
+    if (local_err) {
+        goto xilinx_enet_realize_fail;
+    }
     object_property_add_link(OBJECT(cs), "enet", "xlnx.axi-ethernet",
                              (Object **) &cs->enet,
                              object_property_allow_set_link,
@@ -967,6 +970,9 @@ static void xilinx_enet_realize(DeviceState *dev, Error **errp)
         goto xilinx_enet_realize_fail;
     }
     object_property_set_link(OBJECT(ds), OBJECT(s), "enet", &local_err);
+    if (local_err) {
+        goto xilinx_enet_realize_fail;
+    }
     object_property_set_link(OBJECT(cs), OBJECT(s), "enet", &local_err);
     if (local_err) {
         goto xilinx_enet_realize_fail;
-- 
2.21.1

