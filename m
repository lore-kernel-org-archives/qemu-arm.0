Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1354458lfb;
        Fri, 3 Sep 2021 07:35:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBbcofbgU5iqFf/DWvkk1LPWBSoEd2OKfLukoFaFUcVVz3gaeB0QL+YJ488XIlPBBtiTK1
X-Received: by 2002:a05:600c:3795:: with SMTP id o21mr8594797wmr.130.1630679751583;
        Fri, 03 Sep 2021 07:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630679751; cv=none;
        d=google.com; s=arc-20160816;
        b=oRA9UPu94nM1j4QIZ04zhNIqWd4L+FU53VbhQQo/L1bME1vJLIBpkyBc3lxKoxoG6L
         IurYDuVVYLXIM2vKL4cRscrFK6etLjo5ryMQPdxMC7ljVi+KJgatKXnbR+2U3eOlAdS3
         3F9DcM8XN9PDFfEK4x7o+D5JS7hbIIJzJ2PQ1VYtQ1TbsC2VeDHbOa5R/6jKGChPf5Wr
         7UBuoVncBGqWrYs273zNMmHSul+yIkMBVuGAcgDHT7KmAKjdCG0Fe50rH0KcEnVGqt8n
         FEP2QmmUvu8JNQEjMiz9yDiOuK8R9Jdx34cGVNKk/mufi6RlbO0qWEuIPD1sbKe6nQed
         2J/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fY5SdPSeZ+nzP/hRNCu8jlFl6ZP6Y10Sub0ilphjxgs=;
        b=0khmhOabKL7m2L6WRQxhBtLi3Tq4FT3MbIHTzG4BUkknZcRV6khoVOx3nKKtMuscat
         EHCkFgIAlSL6cixQvI+vadvNLNoSCWLr+pumqRxy657xxD+On4yQDijGxBJq++YCA7d3
         8PJ3dOmjErlB8WR4QPyYlnJh/Ez+npBsJQn3Ox3xibzK3Ep6UWiVJhDkIglPOc2GfVTQ
         XmuxC/S0ws0hfutJ0c9qibmJKJjxnhDBZ2nqMy7ndn13Ytu1dlvriD2PkZ7+2npCHPqF
         4wYtdwHb5F62swuYX/m0k+xrB3fK4h3I+tHJM8vNoY47VEUySxWa7bvorMutKN9FIDGc
         gdqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eyDOK78g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si265258wmi.68.2021.09.03.07.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 07:35:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eyDOK78g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMAII-0002tK-K3
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 10:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFM-0004Or-SL
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:32:52 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:45575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mMAFL-0005j5-CP
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 10:32:48 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so3707258wms.4
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 07:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fY5SdPSeZ+nzP/hRNCu8jlFl6ZP6Y10Sub0ilphjxgs=;
 b=eyDOK78gtwil10Bk1rn1CGTdZwVLTfjjB4us3m1an2HQcZW/OeAEWM6Tm34Z0RwpIf
 Dl6PuHM1qpKQWDL5Q8BHHqd7XQzUw/3Kx6OtjhOJ8fAFOwh7VUg1FbUxB43B1Tnnk0vi
 IeSqP2KN6553JREKkD0w8BSVPNqZUZr6smTmUOoQqCAaBHP2uhScV0w3c4caiAnkhFwG
 iKXYSA2V/v2NivcxJBbmpR9eCct2AxelZt88ShgTdtewrwadFCSSBuqlmBZdohI9ci0s
 eWt++nbdfexM6y3miHsqdp+6wpF08PSYfaO1sR5bVnAfG53xg5rSmDFhgpoyi/OspbMi
 UY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fY5SdPSeZ+nzP/hRNCu8jlFl6ZP6Y10Sub0ilphjxgs=;
 b=s22tzZN8IwL+j8Af6ze8C20kgvmfNZdPJEkSLaJsKzFLwA5bOOXEQFagUtWITPce9Z
 x8hFJGY2u4Fv0xVbG83ALzeHLAm3EdXGPCJ4ggaVNgYhxeKQKhvCpAlY1vdTdoX8OE3k
 wJ9k9UE2K3pNbwBlAweUpfnujxBiE5MuIssCQ4Tw6BI4PvMHf7meorU5EMA/SFYG09TP
 msqBYQAhiy6+4Aa1IsFqP6KtoVA+OtV3d8f1qc1sBgSoHuInu/YndfPjkV452sS56xiv
 Ll/HRzj4NepIPBqnGNHA8odMxEoDlaISQDTCI81rFjc8m+3jxpZeRDStuq/zMeMpXLXJ
 EK7g==
X-Gm-Message-State: AOAM531t2aLllsh4e4jGW8jEleovIekHa9UBZ5DMXkuu0BeoM/wgXf20
 AvgaQ1U1kK9w8cHaEgiHOFc0UQ==
X-Received: by 2002:a1c:3b8a:: with SMTP id i132mr682400wma.145.1630679564993; 
 Fri, 03 Sep 2021 07:32:44 -0700 (PDT)
Received: from localhost.localdomain (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id z2sm4314843wma.45.2021.09.03.07.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:44 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 8/8] docs: Add '-device virtio-iommu' entry
Date: Fri,  3 Sep 2021 16:32:09 +0200
Message-Id: <20210903143208.2434284-9-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903143208.2434284-1-jean-philippe@linaro.org>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rwNARcSntlFM

Document the virtio-iommu device for qemu-system-x86_64. In particular
note the lack of interrupt remapping, which may be an important
limitation on x86.

Suggested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 qemu-options.hx | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 83aa59a920..9a1906a748 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -976,6 +976,9 @@ SRST
     Please also refer to the wiki page for general scenarios of VT-d
     emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
 
+``-device virtio-iommu``
+    Enable a paravirtual IOMMU, that manages DMA isolation and remapping
+    for all PCI devices, but does not support interrupt remapping.
 ERST
 
 DEF("name", HAS_ARG, QEMU_OPTION_name,
-- 
2.33.0

