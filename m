Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp801883ejb;
        Thu, 19 Oct 2023 14:23:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhUZbwomsrA6fV/yMDQjuR7n8moYh4vHoFbsM8my7HmBpDXQdH7liUIHNf3UssWwER9+ox
X-Received: by 2002:ac8:5703:0:b0:403:b219:89ed with SMTP id 3-20020ac85703000000b00403b21989edmr4016333qtw.30.1697750600584;
        Thu, 19 Oct 2023 14:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750600; cv=none;
        d=google.com; s=arc-20160816;
        b=QEgzY1/c4G6Lm/rt/G5rbG3JJBpkY3HnlzVVx5ssDk8zoXNSoWk45tQgS1mGXp0MB/
         VLA62NhtkvGUdUNM4Ek1LTFYl5ad8esP2doaTPPRzy7LPdMs1Ed4KB378obA87ckHOss
         AXyi2KZ2ZnnJCbXr6FYO7zTL+i84E7PpDQ0Efl0vYKksCwCLpx5mLRV/oDH5ZsE+Apsz
         8V3H9cjjKaRjzrWhcjMdTk/1ExP0eHzdNBMVq3CI79GuAD+Jg9dULCprWMpxp6jNShV4
         RtX1UTkRe3egDdWEQumK2IdZc8jyoGBhQie5r7UhD40HzJ0nop7XOw+jlW0FL1sHE+18
         gwXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RctKb6lJoE4fPKPR7iwErgm5ApYF3Oq0zyKJn1rvnek=;
        fh=dmOCqvos1g3r1RzW1CO0kfggl2PD3Dx25NFBbr1xQIo=;
        b=Pd9jS7mCbVJJza7HhdYrEPocOLSjuYp8aAq1FBhlko41lK+sacUpaaijrWnKOytpXU
         qFKRBC3lkK0bHtUwYenE6hlzTHZnRpp5ZKS7ypZ8SjHp9GdKA3lhd8/WZXDpb+t3DrcU
         lC5CGLuUE16Z47XnvN7KbiNlkEy27w0ef9ZHY2hkTb8Jd8DqqJkYXysBzfyDypVIB0sI
         L+19s8eiIgPRI0wIaFIdgO7CgRpYlaz0STbTfg0LviUyTwpGasxqm55HYWgeILzeTrfj
         ak48hyMO409x//LpoUP2b2r3VV3m8+Ii9pRallzzQJy5Hgsb14oO5Es+UD9FViWeBvbm
         mvGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q0CfCjC+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020a05622a138900b00419767946aasi278196qtk.113.2023.10.19.14.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:23:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q0CfCjC+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtaSy-0002B4-GL; Thu, 19 Oct 2023 17:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaSx-00026y-EH
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:22:03 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaSu-0007s2-Rz
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:22:03 -0400
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-507b18cf2e1so114611e87.3
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 14:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750519; x=1698355319; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RctKb6lJoE4fPKPR7iwErgm5ApYF3Oq0zyKJn1rvnek=;
 b=q0CfCjC+lkq8ai1mn5+34tw2rVRzN0wsHzp/ah0FDVPfgJEpEfF3JtupLwW8AY0TSQ
 A9qQnxGqkNra+BwtcWOafdEgFXodL/CErbybAz2mKuD9dNdhwcACO2coXTwaWBvinS0U
 FAG5oNFe7FeT1OI9FuBD2xgeid50fXX5Mz+Z2ZSzUMOoXYPEygZf5aMtEOO+h7THQ3mm
 PPJeB9UVzWME04b3zb2FVSUOTt16twHYIynZIVZoKhYN58sJt1ZmJe55R6JWfTeKrbWu
 kRX5NkQ4ehnOM0QUh5kiOiKaOTV6mCGIv+hmUM3l+mfNq89v0I3H0wv1AJ9Xgihd+gZC
 94Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750519; x=1698355319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RctKb6lJoE4fPKPR7iwErgm5ApYF3Oq0zyKJn1rvnek=;
 b=roQUQibOhSND3meMCTFwiJiFPpVIETwE+mQXJDbfVtUzpBDZy7NKelX+4KNBu0CspP
 U2sAllq/yAGXiF057zLwhX4R+v6lVr75JQ6WrKyBHvWS2LeNQeOADETspkINBAMopIie
 11ODJRMiSD4cuBFA1XsydsV1IeI2WVf+qUILtWQu1TPczmo9cmxMjwlsYwWFnwu3NR+Z
 y+pxx0si5A+Vukx7Axb7TxuC+GxEvn1RYosatoMs0SLptaZJ1wkG7jDowgpYTYKLIYjV
 NvH2uhQjv2hEZlEtETnD5eHDep8nrKdk88BYrtNg7rdgEHl17juQy26/AaDIdZKqI3cz
 gjjg==
X-Gm-Message-State: AOJu0Yy47F4W8O8LBJt36RCp55OeKVuhIps+9HJGfD3dN5eT0H/eD04U
 xDgcfQciVV9UvfgsoeFnkNglIg0zTMxJnQpvMnMwug==
X-Received: by 2002:a05:6512:48d4:b0:507:9689:f446 with SMTP id
 er20-20020a05651248d400b005079689f446mr1933381lfb.42.1697750518762; 
 Thu, 19 Oct 2023 14:21:58 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a5d6a52000000b0032db8cccd3asm210876wrw.114.2023.10.19.14.21.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:21:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PULL 33/46] hw/misc/allwinner-dramc: Move sysbus_mmio_map call from
 init -> realize
Date: Thu, 19 Oct 2023 23:17:58 +0200
Message-ID: <20231019211814.30576-34-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0LGgj4x/eFZL

In order to make the next commit trivial, move the sysbus_init_mmio()
call in allwinner_r40_dramc_init() just before the corresponding
sysbus_mmio_map_overlap() call in allwinner_r40_dramc_realize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231019071611.98885-4-philmd@linaro.org>
---
 hw/misc/allwinner-r40-dramc.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/misc/allwinner-r40-dramc.c b/hw/misc/allwinner-r40-dramc.c
index 6944f84455..2cc0254a55 100644
--- a/hw/misc/allwinner-r40-dramc.c
+++ b/hw/misc/allwinner-r40-dramc.c
@@ -414,6 +414,7 @@ static void allwinner_r40_dramc_reset(DeviceState *dev)
 static void allwinner_r40_dramc_realize(DeviceState *dev, Error **errp)
 {
     AwR40DramCtlState *s = AW_R40_DRAMC(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
     if (!get_match_ddr(s->ram_size)) {
         error_report("%s: ram-size %u MiB is not supported",
@@ -421,8 +422,12 @@ static void allwinner_r40_dramc_realize(DeviceState *dev, Error **errp)
         exit(1);
     }
 
-    /* detect_cells */
-    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(s), 3, s->ram_addr, 10);
+    /* R40 support max 2G memory but we only support up to 1G now. index 3 */
+    memory_region_init_io(&s->detect_cells, OBJECT(s),
+                          &allwinner_r40_detect_ops, s,
+                          "DRAMCELLS", 1 * GiB);
+    sysbus_init_mmio(sbd, &s->detect_cells);
+    sysbus_mmio_map_overlap(sbd, 3, s->ram_addr, 10);
     memory_region_set_enabled(&s->detect_cells, false);
 
     /*
@@ -458,12 +463,6 @@ static void allwinner_r40_dramc_init(Object *obj)
                           &allwinner_r40_dramphy_ops, s,
                           "DRAMPHY", 4 * KiB);
     sysbus_init_mmio(sbd, &s->dramphy_iomem);
-
-    /* R40 support max 2G memory but we only support up to 1G now. index 3 */
-    memory_region_init_io(&s->detect_cells, OBJECT(s),
-                          &allwinner_r40_detect_ops, s,
-                          "DRAMCELLS", 1 * GiB);
-    sysbus_init_mmio(sbd, &s->detect_cells);
 }
 
 static Property allwinner_r40_dramc_properties[] = {
-- 
2.41.0

