Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp3064458ejh;
        Tue, 6 Sep 2022 09:32:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5oF67rKXgAk4VFcV0DYBEGU6vq4KBVX6YvV5QWAY6LPeqjWgCsAWaHtpcwLY1Z5iNqZvay
X-Received: by 2002:a05:620a:40d3:b0:6bb:6d0e:1b8d with SMTP id g19-20020a05620a40d300b006bb6d0e1b8dmr38517607qko.708.1662481919938;
        Tue, 06 Sep 2022 09:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662481919; cv=none;
        d=google.com; s=arc-20160816;
        b=lyHmmqopIbwDFv846k9A04NtIJ0p4byZMdY6vh9GNaNDirCiApcVmUyFCt7STHPe9g
         Dcq7fG/3j4sKADbXwFnql4mDKuQHumufkhrYBSPtXDMPInY2i3QRuIw345BepydVBuym
         JyclXCeV9127DQP8AE4UciVFEJcg9CvgxgY9YKHgMaIxUAuPCSXqr9bwIN29W1jcN4nB
         nCp9hc5q7sD9BIjxlt+Pc211Tw0hpWtXhLI4APY+R16SdQeIoOqtnl7yqbrQmpiJY3LN
         DA1QzFr9UO1Qgbk1pFedGfAq3VzzT+hbdhmAYrq5VWoLPTJ0aR6R4pZdClfnrtznB/Bl
         mVGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=6MMXGy+7e2v2igEmsRuU7vnBISkediRNB4t43cObNys=;
        b=n80KSQROuDJ30+31iACqwc2oHOuGqJNTdUD9tLtLXverLgXD54g85WFHl1KNrPogKE
         fwxvLqX1MDja2UpT7VqicfCcrrCnH0Aakc6ULjFh5XItXTvp4MfR16qPv6RR6+oekOx2
         4bXJsKm+ChGcTURXcn+Y9rgBukfehGmSbtwfTeyybFTWWx1hlt0p4RfReIdaxtUjSw5s
         OuKBa7iUzxDO+YZkuwIkVlNvYsPvqb+WzDGHPMvWBOoOOCn3ViiKZ4TgQuQ8bXJhF+yi
         AOWD1aX2JLe9Sz4LzXqwM75YWGZkWdH0cHKBokfarJRuLwtQcEVagVkc/+ibSQmv7LjE
         kx4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=sPFHxNqW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15-20020ac87a8f000000b0034305847932si6407906qtr.103.2022.09.06.09.31.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Sep 2022 09:31:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=sPFHxNqW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:40894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oVbUV-0000gw-Fp
	for alex.bennee@linaro.org; Tue, 06 Sep 2022 12:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <37nUXYwcKCFcK3CIJG35DD5A3.1DBF3BJ-zGBCDC5CJ.DG5@flex--venture.bounces.google.com>)
 id 1oVbUH-0000gY-Li
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 12:31:45 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149]:37862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <37nUXYwcKCFcK3CIJG35DD5A3.1DBF3BJ-zGBCDC5CJ.DG5@flex--venture.bounces.google.com>)
 id 1oVbUG-0000BK-31
 for qemu-arm@nongnu.org; Tue, 06 Sep 2022 12:31:45 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-33dc888dc62so93585597b3.4
 for <qemu-arm@nongnu.org>; Tue, 06 Sep 2022 09:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=6MMXGy+7e2v2igEmsRuU7vnBISkediRNB4t43cObNys=;
 b=sPFHxNqW32NSssCY1FJBr/NnQkkSPl4PAzNlRuLBvOwr8Dr76vKloQThfIVEX3+g0d
 FPdJTAIioIkQoUYfkTpKUMqUCnnTmHXh4JQHmLWeEg0BIcE2c9dYFi8He7laNvDU7lbv
 KrQvCP0N/9r0jHGzv7a07LxrXqvPuQL9S5BQTTWruY8170CHqnG1dXUxCq5Fz3ml/+ej
 Jin2v+wIALrNOiM/rGgt3wuKXzaqLSQFhWrMsGmpWGDN+JAUC0XsMnlt4pUBRTNGcAOW
 fmL+6ia+HLiVqfRDFfM5FjQfNaDlNz8kcyQIk/yrJ/t6lhBYjIrj8fvpAPYLzBYIHQef
 t58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=6MMXGy+7e2v2igEmsRuU7vnBISkediRNB4t43cObNys=;
 b=MObl6mDr+p49x64gvOXV7YUNkoLyPYjAbJhzmdsTf6mG8I2GA5JstYkhYbHko7psqp
 9eixmx/O6mqdbmUyefiLAsI286ZjJLp3zyzxmvWzdE2lMTZqt6j9vJZaKKON6/962IKf
 6NT1Z1XTjg4/Xu6IaR/BON+FBG0DmKP85JAY4cl9+vRemOc3MeRUmrb68KQ6F4dtRbZU
 N3oFFb3I+LRB6hpgCNbDfkOuxXD0OpvltPmFxgx80P3O/bnnZGanQgvgVVulg1qY6kf9
 llH82UJj7Uxb5p2DVhYcL425uTsBPxpBU+HKfr+5UcWEdY7DrqlGr+mS0l+Fm/8/9JI6
 KbZw==
X-Gm-Message-State: ACgBeo2VnUHdrpfr64y9fWYlvgwbMQ/1ybPzB9f4fbraBhoe89F+J9oI
 8Wg3qMjq1XjHYDnomaB2UPxwBBzFJksb
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:201:ab71:9b48:417a:4d3b])
 (user=venture job=sendgmr) by 2002:a25:4253:0:b0:6a8:f31d:d28d with SMTP id
 p80-20020a254253000000b006a8f31dd28dmr10263515yba.38.1662481902535; Tue, 06
 Sep 2022 09:31:42 -0700 (PDT)
Date: Tue,  6 Sep 2022 09:31:38 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220906163138.2831353-1-venture@google.com>
Subject: [PATCH] tests/qtest: npcm7xx-emc-test: Skip checking MAC
From: Patrick Venture <venture@google.com>
To: thuth@redhat.com, lvivier@redhat.com
Cc: hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Patrick Venture <venture@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=37nUXYwcKCFcK3CIJG35DD5A3.1DBF3BJ-zGBCDC5CJ.DG5@flex--venture.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: g+bq49gE2Q7M

The register tests walks all the registers to verify they are initially
0 when appropriate.  However, if the MAC address is set in the register
  space, this should not be checked against 0.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Change-Id: I02426e39bdab33ceedd42c49d233e8680d4ec058
Signed-off-by: Patrick Venture <venture@google.com>
---
 tests/qtest/npcm7xx_emc-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/npcm7xx_emc-test.c b/tests/qtest/npcm7xx_emc-test.c
index 7c435ac915..207d8515b7 100644
--- a/tests/qtest/npcm7xx_emc-test.c
+++ b/tests/qtest/npcm7xx_emc-test.c
@@ -378,7 +378,8 @@ static void test_init(gconstpointer test_data)
 
 #undef CHECK_REG
 
-    for (i = 0; i < NUM_CAMML_REGS; ++i) {
+    /* Skip over the MAC address registers, which is BASE+0 */
+    for (i = 1; i < NUM_CAMML_REGS; ++i) {
         g_assert_cmpuint(emc_read(qts, mod, REG_CAMM_BASE + i * 2), ==,
                          0);
         g_assert_cmpuint(emc_read(qts, mod, REG_CAML_BASE + i * 2), ==,
-- 
2.37.2.789.g6183377224-goog

