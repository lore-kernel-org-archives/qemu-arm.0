Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp9954319lfb;
        Sun, 2 Jan 2022 14:12:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxh9ldeXPmWiSXloocSpGXbgsvYwKo+bFh5xZ7+YrfZ7tvQKWB4CuV+TUTQWYDfvFAYRihi
X-Received: by 2002:a05:6902:102e:: with SMTP id x14mr22088191ybt.265.1641161560421;
        Sun, 02 Jan 2022 14:12:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641161560; cv=none;
        d=google.com; s=arc-20160816;
        b=uAxTkMw/hK5IpSFZTw31BN8C48VgRbxvZsrlsv5K5C/zaltNtNoUFxHDOYAvTcwq8r
         3mXDLOqrxg+JQcswwWUyYtQVIhl5glcAFYOionPjp6zJNyUnnRHU8QfeI11Zo0NH58l9
         iQNV+aUNkN2VFpjGxJQHnJWW5ndij2CfN6weFhD8Y/21vPd2ktochpEh04jt3coZhXtP
         b0yjeyJNfluAnVFXSop5XscMdhblYr2NAIsHe6tZrTVhLDGa7xeauMGu1ihxVcjYC/zd
         Yow/VJKj6PJ/KuQ2OcmUoVVE8OTT22rv7MNu7d+/SpSTsgrJJWVVPgCm56H6Ep4LQrmZ
         bCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=9lgdCE3tpUQtlY2ZV5qpqcuD6bnWF6/JTyvPjSFhlg8=;
        b=ZRlj/tgBem39mQWkzoYaSuTaOLkVnm74QxcA2Vqx9JfTOScS7D7tBbyQnmi/PWvR5L
         FvcMHEhyWuEfUYny3Z4zVxLaETfJMrwiV16QTlP643o6EkCafsHqJnXpiiBlxmeliNOn
         KlSGIhtdHx8YvqLSGtKC5CA+Bga5H3N8eAHHZkjWQoEJjuOYXAdFr2jranipF8P23phF
         AypiECp6IFdPBETVSZOdO55qYe0MSHWG2t2sI8DCfJYx+6d7YoKb15bXbHdiBLnrYXd0
         byPcfmgR6MfqPFN5/GocgDi3KWtDeM59EsQ8RKF2Vxcl/sIafsskWaAFMKzT6AEV4i1q
         cMiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kawGX3uR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5si18054835ybl.494.2022.01.02.14.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Jan 2022 14:12:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kawGX3uR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:54706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n495j-0006lT-SA
	for alex.bennee@linaro.org; Sun, 02 Jan 2022 17:12:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3RSDSYQcKCOIZIRXYVIKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--venture.bounces.google.com>)
 id 1n490u-0002HW-Ox
 for qemu-arm@nongnu.org; Sun, 02 Jan 2022 17:07:40 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=50710
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3RSDSYQcKCOIZIRXYVIKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--venture.bounces.google.com>)
 id 1n490t-0006FR-73
 for qemu-arm@nongnu.org; Sun, 02 Jan 2022 17:07:40 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 q81-20020a252a54000000b0060af1d7e063so44429627ybq.17
 for <qemu-arm@nongnu.org>; Sun, 02 Jan 2022 14:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9lgdCE3tpUQtlY2ZV5qpqcuD6bnWF6/JTyvPjSFhlg8=;
 b=kawGX3uRa+Vkk7RKjbuZ7EisI6TqDrjlgq89wwY3UZiyi5U1Pdn3YYNYmwbZW12U2S
 KCtzCgk3fQktlckMzLMRswVUYzEnKPTMa6bcCTyuzTF6MjXVwvXYz8HHJJCVnW604psM
 kF3CYNSqbLXQmIm/k9ERfAq85SwUH2O/WsY1x0BUCV2cAEHLg8xbj7SXJct8+0WKzuYn
 uiUoyPibBCCfzNl0hisMsXvgT/NXxxwMQ/nVn1W2xb3+SUT6ovuIQZyyG6PHGK8q3v2F
 SXV7chkgPZ0KdgZDHnJVFz49zjsFfLNQEOXuIZ0aZHfaP+5rjIa2vZUvva50n17lVV5M
 Lu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9lgdCE3tpUQtlY2ZV5qpqcuD6bnWF6/JTyvPjSFhlg8=;
 b=Ub/aJYv3kEi+XY2Jxn7jQZfIH+ZCBz2PC0DzuSHFeFBAg1Mo5WldWLswssa04LGWAf
 4LYg5nDsEHKfByClmB46rdtE5I5XCWeh4ojyq/S+ZJQtDlqZfx95ShmfVYr7dIXRG2Kh
 jRMEJcsnwXKznVidaVrhU8HE4PmOk7bUIycL7DQRseST3kgfDTxCH0iNfavrcOdUZw4q
 tNKg7TsSIXU2oVfRd8/G0OXaDdLps9tfP8K5WR1untlsesSBKG4gb/PTryDk8IXtEGyk
 3bCBsq1YqIj8mRrXJFku9TmAhOI3iyvOItIOUbV5rbtC0swezl+6XL9/xOvs+vt+fk35
 22qQ==
X-Gm-Message-State: AOAM533+Od+pzjW+gGQq3L5yTCRLLCAwAVuh6J5pTvdKnaV6kLH19Twy
 PJ2/sdeBlk76+gIDU9RX9RuftFZgQ17r
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:9adc:6d14:2e33:8585])
 (user=venture job=sendgmr) by 2002:a05:6902:1546:: with SMTP id
 r6mr26126026ybu.88.1641160773845; Sun, 02 Jan 2022 13:59:33 -0800 (PST)
Date: Sun,  2 Jan 2022 13:58:44 -0800
In-Reply-To: <20220102215844.2888833-1-venture@google.com>
Message-Id: <20220102215844.2888833-4-venture@google.com>
Mime-Version: 1.0
References: <20220102215844.2888833-1-venture@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 3/4] hw/arm: add i2c muxes to kudo-bmc
From: Patrick Venture <venture@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, titusr@google.com, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3RSDSYQcKCOIZIRXYVIKSSKPI.GSQUIQY-EVQRSRKRY.SVK@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kwvRGr/S6cN/

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 257bf638fd..4cd58972c5 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -330,8 +330,17 @@ static void quanta_gbs_i2c_init(NPCM7xxState *soc)
 
 static void kudo_bmc_i2c_init(NPCM7xxState *soc)
 {
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x75);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), TYPE_PCA9548, 0x77);
+
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0x77);
+
     at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
+
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13), TYPE_PCA9548, 0x77);
+
     at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
+
     /* TODO: Add remaining i2c devices. */
 }
 
-- 
2.34.1.448.ga2b2bfdf31-goog

