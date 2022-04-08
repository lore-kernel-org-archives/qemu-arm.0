Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp401681lfq;
        Fri, 8 Apr 2022 07:42:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX1hhxGewZhFl6du897hSOE2zlj9Vcthi3s6mczxlglFuTTeMRIfnP9I63z8NT1uG74dci
X-Received: by 2002:a81:d553:0:b0:2eb:e285:39e5 with SMTP id l19-20020a81d553000000b002ebe28539e5mr3262588ywj.395.1649428956793;
        Fri, 08 Apr 2022 07:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649428956; cv=none;
        d=google.com; s=arc-20160816;
        b=QiShnIWCCU9u6qukl5wbW0IZg9CCg2MlbBs57gtKr2Qm+wi8OegfI2oYaJRb7R38Ck
         fRf5SDL3nmmBJ3D4aGC2L22dwbRGPAQllTtuxCKywFVmyjqeizxDn3hlSBjZMa1mnJhR
         vtaLJjft52/qmgL1xmDxspTkVqjFF4WVCBOGSfxNj73RA2Enm1zT0zhOgrOpp4xuwN3O
         2iSHFlbgwOS9y9NJdsVNhlV2XCve6t4pMa4cVtKFI0MlarAElCgXf6hNE/Ye1mkhaY5g
         fNG1Opp7ccsqbCqHykCiWtA/g3gvceNvnwNrOHb4mrwugW2wNd4w9Hds6/s3Ahhu3HNY
         dIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LtZz4rR4JTiEt09cH5eXBwQY/mFcoau4efeuuU9fWxY=;
        b=b08oIjvk0mHqrLnlCkV/LcrmarUW6c7dibMzJIWRNpdiKyFoMQU8d0ZelFta1f7c8U
         xSYnhgnsgEMfA8rY0eVe7fHY3QwxwVsub4FiL25VTZEalxQjM6mYzbh2KmeBJCRS+jN0
         kqTbvRY8LkRvlE4IhkeTJBnLsPkZI0Yjv86X+kFwiSSg62Y/B4VR9KYQSP4mems/OQKs
         KDniiOGiJizoJXbO6PUYewi71v+oiK0Ko88/asViyCuoXsKZu5pxmpvtxhWEdcOcDe6W
         Pry52nJsiZRJQHNpdxTxWBdUdGjMdLO6/OQefR/yXCjGrTg/CIBuAKq4VYXAmpLDmce8
         WWxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IQ0AkNqG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q79-20020a252a52000000b0063d53e56da9si624886ybq.37.2022.04.08.07.42.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:42:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IQ0AkNqG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpoq-0002LQ-7e
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPa-0007Ky-N3
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:30 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPX-0002T1-LT
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:30 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso5640823wml.5
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LtZz4rR4JTiEt09cH5eXBwQY/mFcoau4efeuuU9fWxY=;
 b=IQ0AkNqGdxjR/lWNvljBqpTxtqpHNLVzTAA44jXIE74VUMSoHwm/2Irh6DYtgdOwhq
 aIcTotjRAflCsP4Cuycm1vlF4LPjQnjV6EpoYYXIasG/As2jjIsDvFyVRqNooaMnA/Bl
 OtQX0SPIc7nnxYtmZEWcmmANuhHbW++vRdlKU2HNtLxmRCb3h09VrCTIGBuWFWGeGmEC
 nrqTq0D0yUQvv5XkV0nMCuwa0q5Oe1ikibGvIgseWGFCyZORDRZP9BG2B6CzjqFcz7Du
 kulpemzrKOeQo3lzGswYo/ecJf7eMKs6nzhHaB0Yu0cC+jasH1MjSBXbChFcXNfed6uU
 872Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LtZz4rR4JTiEt09cH5eXBwQY/mFcoau4efeuuU9fWxY=;
 b=qvHRZy6TIbHt+zAqOZVO/AwSFjZm88XLiIcv920Z5hi5ghnGO3nFg0LXTa4pA9vgNx
 zyHguvSKtJd12F3H3v0HlZqrho2H1fw3lq914VTjFbC26I5TvgK7kqna4TLwwa3dg+sn
 8/8IsElGXx8v5HP71Xr5ERNGp5m2RIiaRKC5z7H/pXgSkYf/GfyCACG/aqobvagMFd2b
 njw7Z6clS7kJSYCzMghK8p7hnQUUucgk/zHuj0NIO60go0YhqKIDaqrNrdOQZPVSakvG
 QqpnXecxjQQFEncyXcX4K3WN3+0/OWab01LrrXyjDyMdASMNuAO0vs+A4f4oAGPH5zuD
 Y2fA==
X-Gm-Message-State: AOAM531wLTF+5VN4Lto9Psgv5xvT4mMAjGf/U3zgIiGsnIamsfZ/eHyH
 EmsaXMHhhLzmy3jbLCaZl5DRNa4CIYzKdg==
X-Received: by 2002:a7b:cf10:0:b0:38e:6a68:98c3 with SMTP id
 l16-20020a7bcf10000000b0038e6a6898c3mr17264660wmg.156.1649427386366; 
 Fri, 08 Apr 2022 07:16:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 36/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_inv_vlpi()
Date: Fri,  8 Apr 2022 15:15:45 +0100
Message-Id: <20220408141550.1271295-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LztTpMJWdNKl

Implement the function gicv3_redist_inv_vlpi(), which was previously
left as a stub.  This is the function that does the work of the INV
command for a virtual interrupt.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index a586c9ef498..0738d3822d1 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -1102,9 +1102,12 @@ void gicv3_redist_vinvall(GICv3CPUState *cs, uint64_t vptaddr)
 void gicv3_redist_inv_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr)
 {
     /*
-     * The redistributor handling for invalidating cached information
-     * about a VLPI will be added in a subsequent commit.
+     * The only cached information for LPIs we have is the HPPLPI.
+     * We could be cleverer about identifying when we don't need
+     * to do a full rescan of the pending table, but until we find
+     * this is a performance issue, just always recalculate.
      */
+    gicv3_redist_vinvall(cs, vptaddr);
 }
 
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
-- 
2.25.1

