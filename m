Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1272372njf;
        Fri, 16 Aug 2024 09:15:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHgDD2WqWbrob20yM5KZeFe8tF0E9XFWTLxsjhTLyUz9qne+QVvbObizWNw4L/WLUgeT3tqC6U7xLkW3ahVF5cY2M2tWv2
X-Google-Smtp-Source: AGHT+IHXU5fHwSPm508muEPKXhayx/HGICY7mSDx5bP0FWLcGqx+sMTjlX9dRY767MQzc/xGANuC
X-Received: by 2002:a05:622a:618a:b0:44f:f814:38b7 with SMTP id d75a77b69052e-453744042f1mr32441841cf.58.1723824923473;
        Fri, 16 Aug 2024 09:15:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723824923; cv=none;
        d=google.com; s=arc-20160816;
        b=wj84/vAwHXs2ryWEJ3x1NV3RsWRviXJnwn5sWNhc98KC9ydCGJFNkR9bjgg3mR2Nw/
         5Wu0T96Ivf36gFT4GEGnuwZZQ/Ufqi/XtcjK9wk0os/58KDO6Um0uQM8iCy/aYaouP26
         tj6SwZIJ/5Cy2Socqw1TMyuXrMNwtk/sfYc1EWiueU3TYOKZFaNXvYxcXwqv3npjdcIu
         dYMU1HgVzvnFniwarMl1roWYQSwd6wgdPrEuoLP+DkTaPgwbKcCOZtGBmDUEbQRwyzzm
         0dt4kYaN9W+6hZPHXIrOap6psoVEpLjwtsLhT4vP7TcTV5oQaR40j0scn0D31O2A8h7b
         8X4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RhHY2mwb1dwmyJC3ZOyMGrBB8Z2DIi78BFy4b8vQ1Pg=;
        fh=8716YcvxZZxTMNcQZ0eLGoLGp1r7TadekkZAFKW2f4M=;
        b=pr366Oqyj/6T0pyOIrhR0WH4EwMvkidYIrmHdBcERH3uR8xL+53ThwlTnpIFnQwUbL
         KXYg7PQ+LPW0lo17pKjEx/ZKcHiMU+fDQtALn5WJnhWQf5NpjmQlOT+jCXlgcrqZ4mWm
         3VLpKf+JG8zKJoxceLi74LgOBqCgj9FIi8Qyz4jV3BXLZWZ4dPvBJNqFfjXtIlfbfflK
         ICB1/cMZIu1bljsUfpRzhweiEygbdDh7Ok19M/4ZZDAq8EAWpH1k7l9JJUPTfZAOj52s
         4U6RFtVf+2dAn2BPihnzXuL8+YYsbb8dLs52SoC+eN/CG2eQc6kxDf3urEBA+M7YuKTv
         PS0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eXWdA4c/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4536a0b7b1asi43269401cf.559.2024.08.16.09.15.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2024 09:15:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eXWdA4c/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sezaS-0008Oh-EX; Fri, 16 Aug 2024 12:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sezaQ-0008Dy-0l
 for qemu-arm@nongnu.org; Fri, 16 Aug 2024 12:13:58 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sezaN-0007dr-4c
 for qemu-arm@nongnu.org; Fri, 16 Aug 2024 12:13:57 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4281ca54fd3so15683005e9.2
 for <qemu-arm@nongnu.org>; Fri, 16 Aug 2024 09:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723824833; x=1724429633; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RhHY2mwb1dwmyJC3ZOyMGrBB8Z2DIi78BFy4b8vQ1Pg=;
 b=eXWdA4c/ewN9lCK7I0lr1HAAcsNc9+bNK+hu4TBPHHktOPuIgX9sFsMxKZVYgPqZEa
 GlgX76b1pyXeqElpq3sgnTP13TvHPxuHLE7OrLHCfvQ4yEzH+GUqEZQjqgzn2w2v5+gz
 J8xt0xSTYojn2HD9F4zwr1gcDgGIy1tdqArrAw10TTbcSeMdV1c5nuISwb9APT3rImBC
 ohZ3PuXjEUIKAxQCtEPnjBZzAycB5opO3WIPFeZOBL/xriq+S9ewDvlnzdh/Bwq907v7
 Qq1W+8OXRG5kmTkFrfOOQL8FAcRbB01aXU1OHwpAmAVH8hlcMAdZFzBHopK4BF1fFCPR
 BnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723824833; x=1724429633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RhHY2mwb1dwmyJC3ZOyMGrBB8Z2DIi78BFy4b8vQ1Pg=;
 b=khZ2HDcnaxmBQTEFSG5uexbSImQn889VvQe/ZxXQC2mj/ihiWqhzqJuQiFIbpFnVgQ
 JeIEY57J/3tlXc7aNzUbb2hcb2WlWWvaQeVawa2yaIzShcuTHq6+buijtxzYVjrm5zZ1
 IhA6VCPok9SZyh4ljRTd3cIA7AxTY+W3RD+I9Rxxz4Nn4y0PPLCG8L+O4VNncUIiMN89
 iAroTt6eD70mjdmguEDw6iqg0xRXbEq3OggJ/PMFoidchLESfqdx6eh+0qFymEn7yzNX
 EHBdNKXjs0d/rBUw52KGirKCVOKnbzxiu2w+ZI9cKcD9w5FpqBdzeXtbgqM6pfEmM5Zq
 9ofw==
X-Gm-Message-State: AOJu0YxtVvsXOT8N1p9RwG0POvHKWGqlh1WlUd+nSe2Jpqk+Nj2OUJBU
 w3jinjZWwqhCh38dbyy7E39tfKk/6JoWu/D932TiTKy8S3IAIwRzZsZc/pJaonHQJtXG5KhHhdy
 Y
X-Received: by 2002:adf:fc44:0:b0:371:7e73:de6e with SMTP id
 ffacd0b85a97d-371946897d8mr2727433f8f.52.1723824833475; 
 Fri, 16 Aug 2024 09:13:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-371898bb588sm3912269f8f.115.2024.08.16.09.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2024 09:13:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH 3/4] hw/arm/virt: Default to two-stage SMMU from virt-9.2
Date: Fri, 16 Aug 2024 17:13:49 +0100
Message-Id: <20240816161350.3706332-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240816161350.3706332-1-peter.maydell@linaro.org>
References: <20240816161350.3706332-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: m+Ep1vXxlADv

Now that our SMMU model supports enabling both stages of translation
at once, we can enable this in the virt board.  This is no change in
behaviour for guests, because if they simply ignore stage 2 and never
configure it then it has no effect.  For the usual backwards
compatibility reasons we enable this only for machine types starting
with 9.2.

(Note that the SMMU is disabled by default on the virt board and is
only created if the user passes the 'iommu=smmuv3' machine option.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/virt.h | 1 +
 hw/arm/virt.c         | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index a4d937ed45a..aca4f8061b1 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -134,6 +134,7 @@ struct VirtMachineClass {
     bool no_cpu_topology;
     bool no_tcg_lpa2;
     bool no_ns_el2_virt_timer_irq;
+    bool no_nested_smmu;
 };
 
 struct VirtMachineState {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a5d3ad9bf9e..7934b236516 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1408,6 +1408,7 @@ static void create_pcie_irq_map(const MachineState *ms,
 static void create_smmu(const VirtMachineState *vms,
                         PCIBus *bus)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     char *node;
     const char compat[] = "arm,smmu-v3";
     int irq =  vms->irqmap[VIRT_SMMU];
@@ -1424,6 +1425,9 @@ static void create_smmu(const VirtMachineState *vms,
 
     dev = qdev_new(TYPE_ARM_SMMUV3);
 
+    if (!vmc->no_nested_smmu) {
+        object_property_set_str(OBJECT(dev), "stage", "nested", &error_fatal);
+    }
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
@@ -3308,8 +3312,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(9, 2)
 
 static void virt_machine_9_1_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_9_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_9_1, hw_compat_9_1_len);
+    /* 9.1 and earlier have only a stage-1 SMMU, not a nested s1+2 one */
+    vmc->no_nested_smmu = true;
 }
 DEFINE_VIRT_MACHINE(9, 1)
 
-- 
2.34.1

