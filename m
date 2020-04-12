Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3155449lfm;
        Sun, 12 Apr 2020 16:05:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypLWWH7BOh+02HoPkUR2z2hpVCfJyzaTEecZYDQS+04T25PsjRlfh3r02S5FXs4Mc89VQQnI
X-Received: by 2002:a37:bd45:: with SMTP id n66mr14106044qkf.73.1586732728562;
        Sun, 12 Apr 2020 16:05:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586732728; cv=none;
        d=google.com; s=arc-20160816;
        b=c7NZstuZoRMU98imcx1J+qhdP6rOw75PrktBU/IWldGOat6cP5qlh+wopEIccqCJMH
         46biO3udO5up/+JxbA0vNBlwJFKpWTDcpUlK39iyhsBxtojj7r3JWxKJM8REAOnaive8
         AxZXE3OJJ5Sg/CbPD+52ihRfN3S3uwsdDtEik9CrdJFHQuQ8LlwSB7dC/m1AgG7Kh+Ac
         ZGOPwz0FWHfNQmGEsQmmGCt6QBXvfZiToiswYD3tMVkQBtf/KUO0lc6QXydqLANxj3ol
         o3QtzozIDZ/eybqPwRaOAHcJhtXawf8pN61QHMcJBcTCSk9Q0o028sUdUVAdTYcpUxhX
         a8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YaIevl7FVZKJyC7g4Goc3D0dFDZM5MSezImTR0wlSxA=;
        b=vwiXadQJCCRiTeOD/s3ao/rnDPVQQ1ED8ogOMWdj+thO+QjVQKPDEEFgegO4oIRWqW
         H4GDM2GvIXm3+dsbFfOpQNzrUyUrYaAjBMBw3ABwjA/a5mJiNhiSonclEpcY9NhwXUZS
         C+ko0ey9ymOVnRm3Ilji4IjYR2Oe13A1itZComBF6lO/k07chRdPGFL118sKPNXhlfhy
         io51NXqdDE8DtDW1gDfhQ+PDUxpd/WgOzP4R7AiuEHEEFUWrnX4R1FEpVUZ39k3P4XmS
         EH70HdWj0aFcvL6xAoNITsll2EzUqnVQ1AfXGN9O6waYI+exdFqJP5LoEnGjXaU892UP
         QJnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KLQmRGMv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4si4860725qvq.9.2020.04.12.16.05.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 16:05:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KLQmRGMv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:38518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlfM-0003gd-0D
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 19:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50407)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJm-0002mL-6o
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:43:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJl-0006Qn-7P
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:43:10 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36768)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJl-0006Pd-1m; Sun, 12 Apr 2020 18:43:09 -0400
Received: by mail-wr1-x443.google.com with SMTP id u13so8063113wrp.3;
 Sun, 12 Apr 2020 15:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YaIevl7FVZKJyC7g4Goc3D0dFDZM5MSezImTR0wlSxA=;
 b=KLQmRGMv9CBAmo9FgoPduo/o5yFTRq3Q/zNf9FvQhsCGWSXGbj7G+c94b/752CchlW
 kVExzxUSiXMi3kLyE9vx2TZULs5AlKXzUv8vN3yDlwmRqLnN0Q38Oqs5BCJpvcw2IwKV
 fwi6RxAppYm2TWS34f6h4EzVxlY9GFo1l5C8KeZF8vNCGjacR45bBcGVIQB9t602xZi7
 g3mhr62nIX5VW0dd/+o+2ASh733MJ4ZgjHxe6MXB0viUC9Y62fJcwS/1DLt3PnYwgpVO
 rBz3FY5tTY20jX0VemWik/fUmef3g0VoVc6hUm/dxb64YA24l85dPIoCBGZ9JzIf/5OJ
 j50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YaIevl7FVZKJyC7g4Goc3D0dFDZM5MSezImTR0wlSxA=;
 b=qamHqZRGBbYxZiZDIESfdH01LsrQC+aQdm0buyatfSaEU3pOapRJbBOud1Qt1MNNkG
 zMaQGjzIK3KT5yyqdZ4uEQMK+327qLLaXRp0X8b6ay1TL8B5f963FoW/Xh88tIVAk3OM
 4YB1MPTPOIU/j7JV51LxX6ZKBOLZ54OKiGL6uJiIFAckooiZdw7T1YePG2NHoDLfBc0+
 aaufbpF2TFq2VZhliU3C6iQCrxUmlSb4zK3kZe6GkyhNC2i4oUZzr8zVwVFAIy9Tzv3b
 9OQWR8XcxWK4ms5A6gTMgSi2IGFiPjL6A9BWaGa7tNgh7CmDpRhVt1iXCOctrC6CMY1j
 0fKA==
X-Gm-Message-State: AGi0PuZttJjVwLvlfaHMsLjf1Iwd4+y0IRgafDX8Jfv3RWhKvPouivZM
 BLr0WcsFNmcInIJaPBX8jlYx/AuP11aRmA==
X-Received: by 2002:a5d:460b:: with SMTP id t11mr13300743wrq.319.1586731385949; 
 Sun, 12 Apr 2020 15:43:05 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:43:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 21/23] hw/net/xilinx_axienet: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:42 +0200
Message-Id: <20200412224144.12205-22-f4bug@amsat.org>
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
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Joel Stanley <joel@jms.id.au>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X/hyCoC8PCj7

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/add-missing-error_propagate.cocci \
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

