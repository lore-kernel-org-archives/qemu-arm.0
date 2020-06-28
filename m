Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2198663lfm;
        Sun, 28 Jun 2020 07:36:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGkAW4gx93IW68Buex0AHgn1A83sBA+igRZdqVLzePoLOOmjBw/iDh0Q0FI2vcQA7cQ/Zo
X-Received: by 2002:a25:d40b:: with SMTP id m11mr19107117ybf.66.1593354973041;
        Sun, 28 Jun 2020 07:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593354973; cv=none;
        d=google.com; s=arc-20160816;
        b=dZ9CunfHQZzN9dxGIp30ua4jH5J8zSbmDmx6kXL1TbacgDCdOYOr+Hg6gO0DbS3BCR
         wC52tIUatFlBpdJhclBayhePuq4carrUBzK8JJv+N5N+rfMbwNTG+P2ZPosd42WcNDDf
         Kcb6LqMLPY9+tqK1KL29oZHTlAZl4csvR7hsNQ40Yiw/lm+NjRxfn219ih4DOMr5gwdM
         URp0Ei7MHTlspkdDoyToShDqqZSSrbZ5GsLNIZWj9JHxQ8U2g6lt08SMCNC0PnWFs+rs
         u0rqmX+ivu0wvzuvLix/zHL34wiJ888PaOzww7vw1ReJEDJXz6dp+B4lcO38J9eT0JRt
         dVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ZjKuW1mQwpJiy6HB5bGM9HstZflvVeFdcxiGRekmHQY=;
        b=geGDvfMcBBaW+k7VyJHQ902qjBCpWkV5pWigaBsbQjXASm4DPIWpxg8DjUiJusAIZB
         n/o/OoAJJ6KmJYYLgn2rbpPwMgbPeUwu5tSFfwgKUustis8Lr2sOPhVKqnMiOiy1PVVb
         XV+ONhbcsOCtSbuvWON1MdlSrl1lgP0axkkXchwUjcktpxCjBwJ2hf+AE4gK+fnB9Jxw
         CTAfMtD4TyOaO9iFIgW+nvPUs7wBBNlZkXw3ODQqgt8AkSZZDT12lOXK8+nQCaG4wV1t
         lwSi2VhtZGx7UvKzOxd+bBJNUSL9/ZrC9hDFGhaOJz59HgmWoN7h2cMq/vr+MELcnOHv
         +U/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ngVPIuSt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si8053705ybk.252.2020.06.28.07.36.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 07:36:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ngVPIuSt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpYPk-0007d6-G9
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 10:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1jpYIy-0005fe-Lb; Sun, 28 Jun 2020 10:29:12 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:42612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1jpYIx-0005Tz-3c; Sun, 28 Jun 2020 10:29:12 -0400
Received: by mail-ed1-x542.google.com with SMTP id z17so10711236edr.9;
 Sun, 28 Jun 2020 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZjKuW1mQwpJiy6HB5bGM9HstZflvVeFdcxiGRekmHQY=;
 b=ngVPIuStvwTnANyO6vMcKp3J1eVRVlMBoTIe0qiDzL73gKAm01b+PwM2ZkEFb7mhi9
 6kr0ZTNFubjwqelMfBMC+hynS13TZ+D0vlT3hHRf8uEAExC3VAnluZxFPvaBkpqnJmRQ
 wAxnggkmoYxvug/A8Q+OWdtNHQWATy6vhotvGN/hBEPtbLIe1i6N2VnOEpO4/gOrMd2G
 vYA+nwCzEGbc9HtrWp+Hj5VZy3IRI/mz7m/Yu8mFgNHPMuZs1FXOkYyiHdWtiVW/nXj8
 4lHmem3Ur7EWTts/aNpT3F7gyGLYnxMsbQF/n0lEF5CojQCAmspWLQtXJx7lCfMhZzsd
 qMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZjKuW1mQwpJiy6HB5bGM9HstZflvVeFdcxiGRekmHQY=;
 b=rk0Fq2IhWA5fn64bvSxtlBOFM/8lgT/bZ7oUg5CRW7Kr1g/2nvXYBkvh/ILPukZ/wM
 SazFptgouGIyqfjGcx5gIkZ+8siRsZNii6Am+/fvkqMnuUmb0Hkp8or8PDD5Jq9HewsM
 HI1yEGgNn1n6R5OpCOPMXuC2Ggjf5etpa9bzGttKzWOcogI1YRvWAcC9KtV5XG5sZQ78
 /RM6uQqZSJT2smfHpqs3fgyTa0pqRrCquuPjOvSmgBsXk2snN4TiMF8pu0Bi+3/HhCgc
 97SHKJKO0x45qDHP/pzNgR0Xv9cxhYcBu0Y1g7xh/HupbAGlXPrjLmlKZP49JaiKiMWH
 1XzA==
X-Gm-Message-State: AOAM533Adecu9ME/d3lMDIvM6MT2iwjVhsZAlrcSBF6MgLpKhdBQGMym
 XdotjYPyjBcHX2vH+7jhhFA=
X-Received: by 2002:a50:cf05:: with SMTP id c5mr13511180edk.232.1593354549304; 
 Sun, 28 Jun 2020 07:29:09 -0700 (PDT)
Received: from Tank.localdomain (82-73-161-131.cable.dynamic.v4.ziggo.nl.
 [82.73.161.131])
 by smtp.gmail.com with ESMTPSA id kt4sm13025837ejb.48.2020.06.28.07.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 07:29:08 -0700 (PDT)
From: erik-smit <erik.lucas.smit@gmail.com>
To: erik.lucas.smit@gmail.com
Subject: [PATCH v2] ftgmac100: fix dblac write test
Date: Sun, 28 Jun 2020 16:26:59 +0200
Message-Id: <20200628142658.29264-1-erik.lucas.smit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=erik.lucas.smit@gmail.com; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GqJHbEt9EBKA

The test of the write of the dblac register was testing the old value
instead of the new value. This would accept the write of an invalid value
but subsequently refuse any following valid writes.

Signed-off-by: erik-smit <erik.lucas.smit@gmail.com>
---
Changes since v1:

Changed %ld to HWADDR_PRIx to fix building on mingw

 hw/net/ftgmac100.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 043ba61b86..b69e3dd14e 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -810,16 +810,18 @@ static void ftgmac100_write(void *opaque, hwaddr addr,
         s->phydata = value & 0xffff;
         break;
     case FTGMAC100_DBLAC: /* DMA Burst Length and Arbitration Control */
-        if (FTGMAC100_DBLAC_TXDES_SIZE(s->dblac) < sizeof(FTGMAC100Desc)) {
+        if (FTGMAC100_DBLAC_TXDES_SIZE(value) < sizeof(FTGMAC100Desc)) {
             qemu_log_mask(LOG_GUEST_ERROR,
-                          "%s: transmit descriptor too small : %d bytes\n",
-                          __func__, FTGMAC100_DBLAC_TXDES_SIZE(s->dblac));
+                          "%s: transmit descriptor too small: %" HWADDR_PRIx
+                          " bytes\n", __func__,
+                          FTGMAC100_DBLAC_TXDES_SIZE(value));
             break;
         }
-        if (FTGMAC100_DBLAC_RXDES_SIZE(s->dblac) < sizeof(FTGMAC100Desc)) {
+        if (FTGMAC100_DBLAC_RXDES_SIZE(value) < sizeof(FTGMAC100Desc)) {
             qemu_log_mask(LOG_GUEST_ERROR,
-                          "%s: receive descriptor too small : %d bytes\n",
-                          __func__, FTGMAC100_DBLAC_RXDES_SIZE(s->dblac));
+                          "%s: receive descriptor too small : %" HWADDR_PRIx
+                          " bytes\n", __func__,
+                          FTGMAC100_DBLAC_RXDES_SIZE(value));
             break;
         }
         s->dblac = value;
-- 
2.25.1

