Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2906034lfy;
        Mon, 17 Aug 2020 07:03:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIh4mB+CFgoV2k1pkITOtjtB176OW47vxbToqxjS/CGz+NcOcxu5Ozb7+cnbEud7aZJSL5
X-Received: by 2002:a05:6902:4d3:: with SMTP id v19mr19949396ybs.272.1597673010163;
        Mon, 17 Aug 2020 07:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597673010; cv=none;
        d=google.com; s=arc-20160816;
        b=bGE4Q9+7BVv28ytm/PG3BBhBu6M6+7xfeM7IyAyWt1teKMxSfn+PoG3UYyeX8O2gV+
         0dem1BhkpKaLPI4hWF6sxEZ4b7tz4LVWWeJ0VP6RyewmUpY58gTYzIOo6cNfH4RialfW
         xeGsO8Ky9pwLLYQ7ycTOgfsEi4S9m1GX/5q+kSKIaZNaVheWn0xl2g4gfan2CAC6vlKn
         CiZn/AXrjHOpfzIROqnKk+c3uGrrGVUOwG5Z1byn6F55NjiCGYfIGBzRbxyQWbqN7gEw
         9JlHXpBMuS0JbkAQ1zqQqp7kQsq4Kmte2yZ5LUWkmlnpewksCr/W2ORsExwQdv0QSpvD
         k3bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BfvYle3AyXZXtRgGPAz105k3QnmpEvKZtYecnlYInTY=;
        b=ZTUY4c6mWc4sWs64DWoxlf8qIXDEz4cJIe1PPr+REUeim1DJ1fQPN5VOm1E0bwax62
         bnGMuhoTW33mOHkVrEyh6tGFzLYcfeeBTso2fqDc9u68SOxztysJe4YRVhSIOLXw5iz1
         YEFXY8XZRwHtIfZFCuX2u7cFEHTq/xwInD5UAVdbW86axeFiIIPMUMUnCVAKbBfj+Ev1
         OVInEt07reYyiLeV6Xc/M3tNjTEtXrtfe3rPTjbs+IkcrzPOPbg7xUGghWw6Uit7Z+Yi
         0WL1oluQHqAQrzrGYISBVObMaPSYn8sTsZSPzzkIoElhmXR30CCyAKaB+yTL9YIOsviX
         b4VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RhTy0gqh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q190si18632138ybg.252.2020.08.17.07.03.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 07:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RhTy0gqh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7fjV-0005MV-Fa
	for alex.bennee@linaro.org; Mon, 17 Aug 2020 10:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k7fhz-0003K3-Nk; Mon, 17 Aug 2020 10:01:56 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:38216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1k7fhw-0001XC-LX; Mon, 17 Aug 2020 10:01:55 -0400
Received: by mail-lj1-x244.google.com with SMTP id m22so17575665ljj.5;
 Mon, 17 Aug 2020 07:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BfvYle3AyXZXtRgGPAz105k3QnmpEvKZtYecnlYInTY=;
 b=RhTy0gqh9Yly0157weuxmBvUxq8VjOW1EFeb1iJeIftEi/dL1SVY4JGprwb8u10vSK
 AwupqxcTryarWb8I3k1FoDrODibDX42iZknZe0SbL1mk+9eotvQIwQzAIGkViPlQ2y9y
 Qv4DLyKz4FoJB84Qt3xCgibLN07k3KiOhF37VQCOoXb/7HAb6P2Ge3DzrvDs48yzk/WL
 lIdqHsusRR3RgUNed5L4MuoAcZoxM8BpqUvwKCXnZecV6obu3u+DTU6cQxReYbVKfqx5
 KYJYFTn3agn1coFOTEzy3Kc9lemr/OPwv45tT6JTJA8jHz+MgKz/f7GTDrV+mQ1TgXN1
 NKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BfvYle3AyXZXtRgGPAz105k3QnmpEvKZtYecnlYInTY=;
 b=KCHz2As0ABMph1aPgz1zj8EuJG9dF7zjxzfvflmLbvQeaur3dn3GcwNwp8AoLlh/Vw
 z6CXR27R8/YQ+PnGOiQ/kYjhoNFB87QMfY8SfgPuRCP0Vh2++zO/Gyag1uQJSTfI/JTH
 oRVcMKRXrKClQ8wydqzY552xzNk2LjzyA7pzD5q8cwxPxlaZpP8b4fcUc2EwBaFZET7x
 I0EMgf+slSJlKpdfw+4dOs3cjFfqZHDDmE1wTqLEMB+oHZxc9GNPF5BpMEQ6zVgYWi5X
 lB/T/TcoMlXHrNL3xXhyJ84b/biawxKN7nVm5rGDrLySGcDAOBZrMqzDMevom++WwdUi
 KssQ==
X-Gm-Message-State: AOAM532KzaRTa5qelxjIpzr7GxG9yfdwdwxdE+ocKbWPnVRboYvR6eYZ
 KXFiz1SWg0Gb/idoXFC7zVcsaFjAfmWopkwx
X-Received: by 2002:a2e:8e70:: with SMTP id t16mr7975048ljk.81.1597672910407; 
 Mon, 17 Aug 2020 07:01:50 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id 29sm5111941ljv.72.2020.08.17.07.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 07:01:49 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/5] target/microblaze: mbar: Add support for data-access
 barriers
Date: Mon, 17 Aug 2020 16:01:42 +0200
Message-Id: <20200817140144.373403-4-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200817140144.373403-1-edgar.iglesias@gmail.com>
References: <20200817140144.373403-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RSzM3jsNe3wN

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add support for data-access barriers.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target/microblaze/translate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index c1be76d4c8..c58f334a0f 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1233,6 +1233,11 @@ static void dec_br(DisasContext *dc)
 
         LOG_DIS("mbar %d\n", mbar_imm);
 
+        /* Data access memory barrier.  */
+        if ((mbar_imm & 2) == 0) {
+            tcg_gen_mb(TCG_BAR_SC | TCG_MO_ALL);
+        }
+
         /* mbar IMM & 16 decodes to sleep.  */
         if (mbar_imm & 16) {
             TCGv_i32 tmp_hlt = tcg_const_i32(EXCP_HLT);
-- 
2.25.1

