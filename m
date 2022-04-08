Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp390890lfq;
        Fri, 8 Apr 2022 07:24:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMqiUfjP739dayXtSDjnxgMCtCm5snjXX7jB3i09J0ygiMFkSfbx2rDJSkI7pR/ejCjc+E
X-Received: by 2002:a25:ec02:0:b0:63d:b567:fc01 with SMTP id j2-20020a25ec02000000b0063db567fc01mr14056348ybh.148.1649427858300;
        Fri, 08 Apr 2022 07:24:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649427858; cv=none;
        d=google.com; s=arc-20160816;
        b=jFAnQFzAuAMa/5ca301pykBNTsvj7fp3mqGZtC8OUcZvX2KcDMcLSO3QRxjaSya/oK
         3rTtVJa1kQaGDX8Cykaui6bZPR3hPh3DlgDpXk5QzSvjDIG9JCdjDfDYgyAWeu7tSNtj
         SVvVerRlF+TjUGs2WgWngYxCY5qnAtsr5jdTq0capVZ1vpEVO2JWYPE7V51CaPI41aOV
         saOaF3ue8PJX5vI9G9iMDKbDOo/0VwAX+O7h6aIvTGqo6Iz77JCAIXlnCMWQxiVLk5By
         zCDNh3OeaaNaA/L09mxK/QsAL1OhSWsMHNMvqEXr5z4YgljpVPrIxsLKGq0SQZ4I9n+O
         RXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7U8lMphTZ6OFXdG0z5y131mbCO64BRGqr3xnuXCy7z4=;
        b=MjCvbP1xXVKqEoNAHOjyqbvuQwyl/USwCGaZajBh40RwAKroSaUQSsE0xsrSxMdP2x
         a2ZWvhJHUfZP6A1l2xqcsRXkq56kYC0KoELv7/yl07Z6fwQ4uEJ8B5KuusRkSHwmipnZ
         AMuG3BQri6Wf3L4g0+Iahe1h//VjbLB/LZQOGM+maTmnL4QuCxXm3JPmyxc1R1+2gIV0
         a9Ox+CozrL/1cG5PEw4Se/6V/pvBVjKj8R/f7Iemeugv4AbagwfqhuYuDGP0NX1pGv6O
         Xp8TD1DuDAGqd3Ae5D94O5LePX9xobz83eiQg77KCUB/YbP2wUJ4UBuS3Aega0qgsFAb
         7NDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HvWG8N1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p142-20020a819894000000b002e5bb9dcafasi531200ywg.387.2022.04.08.07.24.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:24:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HvWG8N1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpX7-0006QY-OC
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPI-0006vh-WF
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:14 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:46981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPG-0002JU-Uq
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:12 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso5640141wml.5
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7U8lMphTZ6OFXdG0z5y131mbCO64BRGqr3xnuXCy7z4=;
 b=HvWG8N1Y7hSsKO3Aiy6n2r3JXRn7452U1CYs+JweGMVHhalWTqG8L6iMBxeoef0NpR
 5qxF3iXOXAs1KKIrzuYO912sfaHaYPe8QJh7GSJ1sTmwdFC6bKPsQlIFi+elJXU8fplf
 KcwNy4l/iaqup1N/DwfCM9+dHd1slx4ADHA3PsaYI8GvY+bxDhzvaPiN/GJFv6pqetZM
 4guwxLuXMMtabh23gOxpb7+/u+PYFPySjusCqr9Av7vU0uUanUzexo3S4yoUWMC3v1l7
 bDB3lz57HYIBplFVLPnSWyoR9akKL/qTfSInT5Y8cQSJHVO4WQ9SJcRgVueZKn+Z8kh6
 Ax+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7U8lMphTZ6OFXdG0z5y131mbCO64BRGqr3xnuXCy7z4=;
 b=qpB2z5twTlWaS2Iid+VWqixmlpoAJlnJiFQA5ig7a+5wvRbQeFfG/ZePaFICuCYQEL
 uKtbCVcxlRp+EGOzQVE55PzcFUtodJKPAFQTliLLoPUKGxAbAtJ4644xnoEwSvr65LHK
 wldC1ol6fBNrpErtMXBOG37y1h39BhhXqPymRQNmDbQyZC8TpbiZU22T7hB/5kv7SPic
 9Z8symrsdLume6XX4w3a/6AE0PUn+TRsRS1zvIKpMFpABnWnHaanxgnoFO/dO9+p+P3R
 nPmSetHebcZlmm7+kPN8D5gJeFsrWzGSB8hvGQMV/iTU+jXHtLMhPnzgoSlSxJe3+Oja
 BN/A==
X-Gm-Message-State: AOAM530NMyIeNwc1792rzLKI77FTjOljRer9IlPtwL4kYdnPYIz9WpkP
 dC9kl/4eG+LJiyvMCp3FbAQefkE1UfzZ5w==
X-Received: by 2002:a1c:7517:0:b0:38c:8722:9bc6 with SMTP id
 o23-20020a1c7517000000b0038c87229bc6mr17168967wmc.2.1649427369543; 
 Fri, 08 Apr 2022 07:16:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 17/41] hw/intc/arm_gicv3_its: Implement VSYNC
Date: Fri,  8 Apr 2022 15:15:26 +0100
Message-Id: <20220408141550.1271295-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JtlIUE1cIHF0

The VSYNC command forces the ITS to synchronize all outstanding ITS
operations for the specified vPEID, so that subsequent writse to
GITS_TRANSLATER honour them.  The QEMU implementation is always in
sync, so for us this is a nop, like the existing SYNC command.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h |  1 +
 hw/intc/arm_gicv3_its.c  | 11 +++++++++++
 hw/intc/trace-events     |  1 +
 3 files changed, 13 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index c1467ce7263..ef1d75b3cf4 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -330,6 +330,7 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define GITS_CMD_MOVALL           0x0E
 #define GITS_CMD_DISCARD          0x0F
 #define GITS_CMD_VMOVP            0x22
+#define GITS_CMD_VSYNC            0x25
 #define GITS_CMD_VMAPP            0x29
 #define GITS_CMD_VMAPTI           0x2A
 #define GITS_CMD_VMAPI            0x2B
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index bd82c84b46d..05d64630450 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1165,6 +1165,17 @@ static void process_cmdq(GICv3ITSState *s)
              */
             trace_gicv3_its_cmd_sync();
             break;
+        case GITS_CMD_VSYNC:
+            /*
+             * VSYNC also is a nop, because our implementation is always
+             * in sync.
+             */
+            if (!its_feature_virtual(s)) {
+                result = CMD_CONTINUE;
+                break;
+            }
+            trace_gicv3_its_cmd_vsync();
+            break;
         case GITS_CMD_MAPD:
             result = process_mapd(s, cmdpkt);
             break;
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index a2dd1bdb6c3..b9efe14c690 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -191,6 +191,7 @@ gicv3_its_cmd_vmapi(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t d
 gicv3_its_cmd_vmapti(uint32_t devid, uint32_t eventid, uint32_t vpeid, uint32_t vintid, uint32_t doorbell) "GICv3 ITS: command VMAPI DeviceID 0x%x EventID 0x%x vPEID 0x%x vINTID 0x%x Dbell_pINTID 0x%x"
 gicv3_its_cmd_vmapp(uint32_t vpeid, uint64_t rdbase, int valid, uint64_t vptaddr, uint32_t vptsize) "GICv3 ITS: command VMAPP vPEID 0x%x RDbase 0x%" PRIx64 " V %d VPT_addr 0x%" PRIx64 " VPT_size 0x%x"
 gicv3_its_cmd_vmovp(uint32_t vpeid, uint64_t rdbase) "GICv3 ITS: command VMOVP vPEID 0x%x RDbase 0x%" PRIx64
+gicv3_its_cmd_vsync(void) "GICv3 ITS: command VSYNC"
 gicv3_its_cmd_unknown(unsigned cmd) "GICv3 ITS: unknown command 0x%x"
 gicv3_its_cte_read(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table read for ICID 0x%x: valid %d RDBase 0x%x"
 gicv3_its_cte_write(uint32_t icid, int valid, uint32_t rdbase) "GICv3 ITS: Collection Table write for ICID 0x%x: valid %d RDBase 0x%x"
-- 
2.25.1

