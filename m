Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1095808ejb;
        Thu, 16 Feb 2023 19:13:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9YMtkz51KwdQQZkP6LM3fcoea7whaEdMX8VEST2ldNIRB7HW0IJCbtLzsAJNMAIdfxzPC4
X-Received: by 2002:a05:6214:19ed:b0:56e:f9a2:3eba with SMTP id q13-20020a05621419ed00b0056ef9a23ebamr8155825qvc.41.1676603619820;
        Thu, 16 Feb 2023 19:13:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676603619; cv=none;
        d=google.com; s=arc-20160816;
        b=IVvJRU2ytH0eUNC24vg4uChrwtkTMNUGuCkVo1nLGE/9AlBlhmH/V062D/sodoA3nu
         Na1m9hToVN/xgThvPKljjB2OJKf/moxh429byzXaGx+YJPezt/UgftFxPunBsp9m/2xR
         t0nHSrJnxTeQyoKXQ5YjBAr+DpPWk3aDdDbZuCOCADqQpQR8xaEonmEUrfXCj+6qQEQJ
         qnyBRhShdtmPEIIASNtjBDALlb3TxMafPwb3xAI15BVd+IKKIV3yZhEce6ydcG0DR54M
         s/tq1/BMHJcbw368Big6ZWHcpQWAt+ATnF5w9SaMxGfzC6qpYzUWdS19uKJH3N17BaSk
         6pDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:cc:to:message-id:subject:date:from;
        bh=YTunM18A3UmQEdH7Zsg9ORPVZd8NjDzEmoBp5YtUwKY=;
        b=S17NpJg0lFzG6dGw0UqTXWQqNk6B18JX/sbDp0JvqeksJbzc85ljCc+vgs/F2zk8x3
         zxWDwBUP6QnfF6egkptUzA2viVM9MkJL6ldmj4mMzoyoVBOYN7MYbW/2A5w/hehmemCC
         sqjguSVNvJcUpNkIiZiZa/kr9hg7Gn3jDVmb/XTMF/LPZYxBODHxvIQqjRw7YGqOCrgI
         +LZ4bzKc8x9/veorv8bzc2aNakogiQmZeSYkAWgUA0sE4rWHkyDrRLh1bLb0gE7N6p6f
         rLBoGSUzGu1wusdR9OlizKo82Dny+6+8iQ3yHFhC2W+WX1Hs+A45t0TBah2fnFcM7Cvk
         00Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7-20020a05620a25c700b00719e5a9ed49si2627951qko.52.2023.02.16.19.13.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 19:13:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSrBI-00006I-C0; Thu, 16 Feb 2023 22:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pSrBG-0008Vd-VS; Thu, 16 Feb 2023 22:13:02 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pSrBF-0004rv-Cl; Thu, 16 Feb 2023 22:13:02 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 3EB8D11EF68;
 Fri, 17 Feb 2023 03:12:56 +0000 (UTC)
From: ~ssinprem <ssinprem@git.sr.ht>
Date: Fri, 17 Feb 2023 09:59:37 +0700
Subject: [PATCH qemu v2 1/2] hw/at24c : modify at24c to support 1 byte address
 mode
Message-ID: <167660357595.26523.10278976309538219635-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: qemu-stable@nongnu.org, ssinprem@celestica.com, ssumet@celestica.com,
 srikanth@celestica.com, kgengan@celestica.com, clg@kaod.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: ~ssinprem <ssinprem@celestica.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vYTZ3rLtxh2u

From: Sittisak Sinprem <ssinprem@celestica.com>

Signed-off-by: Sittisak Sinprem <ssinprem@celestica.com>
---
 hw/nvram/eeprom_at24c.c | 46 +++++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 3328c32814..0cb650d635 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -41,6 +41,12 @@ struct EEPROMState {
     uint16_t cur;
     /* total size in bytes */
     uint32_t rsize;
+    /* address byte number=20
+     *  for  24c01, 24c02 size <=3D 256 byte, use only 1 byte
+     *  otherwise size > 256, use 2 byte
+     */
+    uint8_t asize;
+
     bool writable;
     /* cells changed since last START? */
     bool changed;
@@ -91,7 +97,7 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
     EEPROMState *ee =3D AT24C_EE(s);
     uint8_t ret;
=20
-    if (ee->haveaddr =3D=3D 1) {
+    if (ee->haveaddr > 0 && ee->haveaddr < ee->asize) {
         return 0xff;
     }
=20
@@ -108,11 +114,11 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
 {
     EEPROMState *ee =3D AT24C_EE(s);
=20
-    if (ee->haveaddr < 2) {
+    if (ee->haveaddr < ee->asize) {
         ee->cur <<=3D 8;
         ee->cur |=3D data;
         ee->haveaddr++;
-        if (ee->haveaddr =3D=3D 2) {
+        if (ee->haveaddr =3D=3D ee->asize) {
             ee->cur %=3D ee->rsize;
             DPRINTK("Set pointer %04x\n", ee->cur);
         }
@@ -184,6 +190,29 @@ static void at24c_eeprom_realize(DeviceState *dev, Error=
 **errp)
     }
=20
     ee->mem =3D g_malloc0(ee->rsize);
+
+    /*
+     * If address size didn't define with property set
+     *  setting it from Rom size
+     */
+    if (ee->asize =3D=3D 0) {
+        if (ee->rsize <=3D 256) {
+            ee->asize =3D 1;
+        } else {
+            ee->asize =3D 2;
+        }
+    }
+}
+
+static
+void at24c_eeprom_reset(DeviceState *state)
+{
+    EEPROMState *ee =3D AT24C_EE(state);
+
+    ee->changed =3D false;
+    ee->cur =3D 0;
+    ee->haveaddr =3D 0;
+
     memset(ee->mem, 0, ee->rsize);
=20
     if (ee->init_rom) {
@@ -201,18 +230,9 @@ static void at24c_eeprom_realize(DeviceState *dev, Error=
 **errp)
     }
 }
=20
-static
-void at24c_eeprom_reset(DeviceState *state)
-{
-    EEPROMState *ee =3D AT24C_EE(state);
-
-    ee->changed =3D false;
-    ee->cur =3D 0;
-    ee->haveaddr =3D 0;
-}
-
 static Property at24c_eeprom_props[] =3D {
     DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
+    DEFINE_PROP_UINT8("address-size", EEPROMState, asize, 0),
     DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
     DEFINE_PROP_DRIVE("drive", EEPROMState, blk),
     DEFINE_PROP_END_OF_LIST()
--=20
2.34.6

