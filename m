Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp389517njb;
        Wed, 10 Jul 2024 07:14:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUjMD9F5YcbrSDN8i+zicldvV/zuBGGNOdVHCX0v0ZnJuks14sSM54JeQFklrR5H3ex+VSGkZaVCE7zzw3aLL6/vb6rW0C
X-Google-Smtp-Source: AGHT+IGTu4ee9ZJQsMdSDUdlyab9eSIY8hUG8R0IlvyiCWRorN0Ietfih5Pzg3vLAxmCXzerPFC6
X-Received: by 2002:ac8:5991:0:b0:446:3927:5a9 with SMTP id d75a77b69052e-447fa825dbamr73073371cf.10.1720620897220;
        Wed, 10 Jul 2024 07:14:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720620897; cv=none;
        d=google.com; s=arc-20160816;
        b=prtMcLjYsllUGBVBLeqBXD/XoVSqujIK4HHYEKJFa/dJf42P78pQi2KfFQ7B+CP8Cg
         n+mC9cmOyOw1lr8khi7zFQ8Oj0F8ZR9V74X49dPw5TzaYZ8XnU7Z6gs9kHnt1WDH9t9b
         BiJ+ia/HtTSyLYSM/sW+OvV8jXNkUHPUHCsKFV/2hOX9FKjeNPgB+8o22uuA+pmUTsOg
         sk5NXPNy/QX3AmAvUacunllriqm5k3pN313OeXIhWm0fRyoerszmwXYBkWqLsGAUCESk
         5JhJV3JSOAKyTjGVLGrHadjlcvjVSuVceupkh1wpCTuoRkIQsyLxQFqilx9s8zoQKvaN
         Ya6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dSXWTIJRY6bXt8qFvPRs+ninmnXE9NGGsYv1EsJJ090=;
        fh=GH5Q+RtWzBCNH9E515TvTIpLJh2pWY/kifiV2Cu7nrY=;
        b=kOtv7G9ZE9bjdAYtEktx7+52qCfqKy8YnXc43Kusb+wNvLWmuVOWVyLIISwGYq1WHR
         16qspSwtVkeczRmJRL8ACpwZsV+mTMy8B7tWggzQupbCEYOfUn/Sgoi6ASxcEhD3PqaE
         SaSLJbWJ9J1ByTJjjaRSHJ6iE/+c1vyNZokOWrKJ9qbkbWj8P2ouH/a5keAXRgQLsdI5
         /aERKuiMuaYBR/RqwlkOJDyF/IcczQTF6iKoXYoHo9+6aXMTH+pcw5/v8VE7+e1YEdSw
         fXlpNpRJWcs+EHovz1gMjAiTr9Ve7htQdcg21zr6mo+XfyPZusuC/apFGJL3ssfhoxmJ
         FqVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gg75dxbE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9c0839esi52351401cf.690.2024.07.10.07.14.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 07:14:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gg75dxbE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sRY5p-0007ED-BJ; Wed, 10 Jul 2024 10:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY5o-00076O-7B
 for qemu-devel@nongnu.org; Wed, 10 Jul 2024 10:14:48 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY5m-0003xN-Mc
 for qemu-devel@nongnu.org; Wed, 10 Jul 2024 10:14:47 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4266182a9d7so26127165e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2024 07:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720620884; x=1721225684; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dSXWTIJRY6bXt8qFvPRs+ninmnXE9NGGsYv1EsJJ090=;
 b=gg75dxbEbAUxE08kNdqfuHAsFsznd9xgDtM8xCLYuMTn6g/CmRNWV3PZVeapWmPwn7
 hQr7MNOZVfT8DljvQQru1ud4/pK7SKNbGQpOVWeH7yGnZxLdu7/KbfBzbBd6SnKjJzVA
 7UwMatmtKAgzYuJu2K/fjs5b3gq6UuOOUllp31EoRJrKllDmLk0hHDbwfdcTqtxhCfW8
 HFwFz69ZWQZW5bn3pO1CMOnFJSZJBg0YJoOC/0GwU4NoJlSmX3NgqyZclD4lCEj0xmKq
 OyFyhibdfxY3EPvswP9YwoScm3KIyDvGQsK2uHtk4vDCf3YqxDzuIh/hIsMy9OpEZz7t
 /N5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720620884; x=1721225684;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dSXWTIJRY6bXt8qFvPRs+ninmnXE9NGGsYv1EsJJ090=;
 b=YxLCDDxtbQwoZ+fjDBxpyfR8O5vOsjIHi0hh0vU6+UlBlDJcbw+B15ccCmLSnGVNcV
 JtPSVANwFRgKBe7DKsHgW0lUn1D7i+QV+k/LN1k42u4pfWB/41jRM8mNXuoQkDfu4Mw0
 P9ioKTPsJQ3f5i/Gsz1hUOOodb9/DcxsinDIylmtuSpyMjcZeO1olg/bMxKP39whZLpr
 6qoZieRAOqZsJ+DFJESQqwWlLrp+fDsfom7QOVStlFX+tL2R22jewdb7xpH+gjHkESLz
 qUDExoHze2SiSofKqYhodvU3OEcsl+Ogm4LcktxD/BUbH3xgh9Fz0m/zaEda2upDMN7W
 Q+Sg==
X-Gm-Message-State: AOJu0YwI3akLcf2MOKIzE7HVIrA9rgLQFWU4Od50SjVZQxlaNzcAb+Dt
 PSTIIKgRdCQeyxl2HIVTQEWPq5OWhmqD86uez0zVkvxKGrzh/PdRd91KxB6zzpyunuPpbPBWrV2
 O
X-Received: by 2002:a05:600c:245:b0:426:6099:6eaa with SMTP id
 5b1f17b1804b1-426708f2020mr34787305e9.26.1720620883921; 
 Wed, 10 Jul 2024 07:14:43 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.167.117])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42726c62ed2sm52106205e9.15.2024.07.10.07.14.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Jul 2024 07:14:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>, Luc Michel <luc.michel@amd.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v48 05/12] hw/sd/sdcard: Fix SET_BLOCK_COUNT command argument
 on eMMC (CMD23)
Date: Wed, 10 Jul 2024 16:14:01 +0200
Message-ID: <20240710141408.69275-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240710141408.69275-1-philmd@linaro.org>
References: <20240710141408.69275-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: sZISFwU5Xl4J

From: Cédric Le Goater <clg@kaod.org>

The number of blocks is defined in the lower bits [15:0].

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 7e17bd0736..550f63418e 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1533,6 +1533,9 @@ static sd_rsp_type_t sd_cmd_SET_BLOCK_COUNT(SDState *sd, SDRequest req)
     }
 
     sd->multi_blk_cnt = req.arg;
+    if (sd_is_emmc(sd)) {
+        sd->multi_blk_cnt &= 0xffff;
+    }
     trace_sdcard_set_block_count(sd->multi_blk_cnt);
 
     return sd_r1;
-- 
2.41.0

