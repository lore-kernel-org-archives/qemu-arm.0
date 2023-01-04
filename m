Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8327007ejb;
        Wed, 4 Jan 2023 14:44:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuUrm5PL+0ghPAVnULVi1qO1A/xDTpTl4jbMRKwZo/UPO3VhBZPWIqiqKg5zgi4UA6QgjyH
X-Received: by 2002:ad4:44b1:0:b0:531:95aa:15f with SMTP id n17-20020ad444b1000000b0053195aa015fmr39676903qvt.43.1672872247599;
        Wed, 04 Jan 2023 14:44:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672872247; cv=none;
        d=google.com; s=arc-20160816;
        b=biX18GXe0XfEG+9tLPTeGgv5QcAVCOHPFxQTufWBZYvR48jBwwVaRN/szR+QzP0qZj
         W50L7MSe0EWIzsTnJYvR/WMekCRsRhCzMpXDcqmaQUvBYEP7hIc/3Q86JNhaspvPj6Gw
         Qiqx0Xn7xbe38cvE8n2IbZ6wocpQCnK55NhM3UGgJdhQj5P6F4hAp7BH3aXS+mrWe0Ap
         LMSL3IUdd5scw/NdH6HU5z8O08Lnvv7ICqmRK21X14Hb7dWxOjFDv+ECRiWqIHph2gfy
         ESQxzpzJ9fUgggs31UeYScnQP8VQLsE2k/fKPjHbV9VstoOBbFhJ/CUvndKVPKOwCR//
         xj1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZjXAofq2INlxh6v+H74awaoGQiZxjj50d0Z5Ts91LMc=;
        b=iP5SDe/Q05tavtCHbg8BEuqytr/K2g/g4E7Af959N8n1/jj8ivygr7w9hOaw4E0rM7
         M8nh5LHMQjy/UeG3FEzf5WeAcXopqtmXAAK4Ym/lTB3PbYgTsg0R5G40wU3scD8BjuND
         sOM1ylyJ/DuDUg1m2nFP4n2a1ibF4NkogX7S9DWVGcuQNxdpdbQHmU0RdHSq2rVjDWYo
         /b2E1FaWrA54dC8bZFHTyReYNvbqbLN+mvH2gxY8Ay4hJnKoyCHiCc/vhZG3iJ46qTsC
         Bu4S+SK+C4FR8rsoY5p57oZlsHK9A6fNFjO1KEJDi8ArkccbNQFKVN1/i/EMeOytKdE8
         lqZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YuZ/Rbge";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kk16-20020a056214509000b004bba3652dccsi18384187qvb.106.2023.01.04.14.44.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jan 2023 14:44:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YuZ/Rbge";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBvh-0002cA-2f; Wed, 04 Jan 2023 17:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBvN-0002FZ-4I
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:07:55 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBvH-0005fU-2d
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:07:49 -0500
Received: by mail-ej1-x62d.google.com with SMTP id u9so86138060ejo.0
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 14:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZjXAofq2INlxh6v+H74awaoGQiZxjj50d0Z5Ts91LMc=;
 b=YuZ/RbgeRSH2UGDgiOTNsUVPdo4mOEmyERt1MFFXdLGIKux5+lYgedDMDUlPIo7uAG
 HCdFl3rAFgNcCIZGBTUNWSjeIuxXs1SiPqbTU9IeJtbutnISUc9H9xCBlGh7pDhBYcPO
 fnJ4AnEP+2AcI7mYoLMPsKiBcnOjk0KEM51PwpFWTGU6Tf8kMF0p5DEfNOclhKW7Fy5M
 qxJ+VpnQH1lkJNRJQDNrfnVmt1cWnCTEr/F/YWZxcwr+HBY5ygqx6Dn3J47bOUcYtb68
 BRQ/qtJ5KpLO1izOsqcCLAMqcAgzZz91mLiU3aUzkWDtfvRAB/c9/eGIJ1h7axW/YWr2
 JXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZjXAofq2INlxh6v+H74awaoGQiZxjj50d0Z5Ts91LMc=;
 b=WauAUlkL+XfXSCc0YWJOFX+WahcQV6b1gRN6g0DsOhgNE3aC3alwfM8hclUxivvV58
 WYQc4+kzUuxvkzfyIqR/CeybIWlXn9mZEYJrTD4mXwxNp0MfwWm+1ThgqoEu7lZtdLXV
 jP9vM44w+N8C2GSNWTKuHe7+0fchKrfXzQDzJbSfre0VsZrNzdm8M3IXMfHBlRcqG9fS
 CAU25WXtaWClkUcWmpnfdgXnLpkstImXlkarWbPWUcz8vl1BU19LriqTqckRZ2dkuPRB
 yCQEzCmB3ESj+lEBLDuwUVPHpFguTvpXtEaVn2gFBYOjRUimtwbxetf0z9TpIaUi0n/g
 ojTQ==
X-Gm-Message-State: AFqh2kpzE1gS6AlhIEgXYFAoRHMqIhDlSzKybyuODvZLVe+sWG0eBvCB
 o4ec0R6BBx7RAUqh7u3Betp4n9FrjZSBjNfq
X-Received: by 2002:a17:907:9a98:b0:7c1:d4c:f08c with SMTP id
 km24-20020a1709079a9800b007c10d4cf08cmr42464785ejc.4.1672870065626; 
 Wed, 04 Jan 2023 14:07:45 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a170906305100b007bed316a6d9sm15915461ejd.18.2023.01.04.14.07.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:07:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 20/20] hw/block: Make PFlashCFI02 QOM declaration internal
Date: Wed,  4 Jan 2023 23:04:49 +0100
Message-Id: <20230104220449.41337-21-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
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
X-TUID: /Qf74/jo1woH

Convert the QOM PFlashCFI02 to a forward/opaque pointer declaration.
Only pflash_cfi02.c is able to poke at the internal fields.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi02.c  | 2 ++
 include/hw/block/flash.h | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index a9dcabdeb2..90b5feb36c 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -63,6 +63,8 @@ enum {
     WCYCLE_AUTOSELECT_CFI   = 8,
 };
 
+OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI02, PFLASH_CFI02)
+
 struct PFlashCFI02 {
     /*< private >*/
     SysBusDevice parent_obj;
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 64ee40c561..aefbaa9493 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -30,7 +30,6 @@ void pflash_cfi01_legacy_drive(DeviceState *dev, DriveInfo *dinfo);
 /* pflash_cfi02.c */
 
 #define TYPE_PFLASH_CFI02 "cfi.pflash02"
-OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI02, PFLASH_CFI02)
 
 /**
  * Create and realize a parallel NOR flash (CFI type 2) on the heap.
-- 
2.38.1

