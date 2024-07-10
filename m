Received: by 2002:a17:505:56a3:b0:1be9:327d:8ee3 with SMTP id ya3csp390245njb;
        Wed, 10 Jul 2024 07:15:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1E6ibVR5kFmjXwJjeAjsd3GvjcPx0x/szQm4KuhkjRxJEdricNRJYwueJrRCv2HO0xPAj3tw9V6Nv4Aci7r9A84qAG/Rp
X-Google-Smtp-Source: AGHT+IGPn2wMG22nYAkV8lu7XKxtjB6YzqeYJAuuHatqs7N2JiBkJEfiNkkV6RyMvhr0m009Dhie
X-Received: by 2002:a9d:5e90:0:b0:703:da15:d745 with SMTP id 46e09a7af769-703da15dacemr4353099a34.38.1720620955641;
        Wed, 10 Jul 2024 07:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720620955; cv=none;
        d=google.com; s=arc-20160816;
        b=YxD3WtcVoHH+VQfFhzsAXOojcfdE6l1H0HZmGtzSMR2rMIeJkwZc6R3A9V9Ppr9511
         DfQy39msGhJv+0wb+JflhLbw+Gm+gHWtClSHp8ffD8tuYA/MvwG3VncFgJaCvVRnNTAT
         +OnJaDdsgZVxGUu/+wqrD6cWj1lghGlFSfj1xfLlPpdzfkKvd5da/sXZK/xdPhAI7NoI
         96ERFQYEA85Ng042VHRxoo2Dn5B88CPmzAy3T5ynfQBPHCBLHqUmHN9xrMPLfp5qjam7
         RdWUKT68byA689sLVLu67vf195oCJnlXWa32fj23NRmYZeFP0bXqHfmJAJF0jzIW7o5X
         Su+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZV038v5PDie+4o0LGXftDcMbGJXn076Mf/fA/l7/zi4=;
        fh=Kf8XqkZfJnMlTWFi0JxHjWPWktaj9WS5K1C02/GnMmA=;
        b=n4Ab4pbHEwRsDETLrIdVTXeRZC36Pgx2h9tffyOYQZaNbe/dZUpWOo6svAKqvgC4T6
         q/jSd5aPHTy8TMwGWSkrc7HAjHmVrBagAjlyRhNXEOzrreN607qySD6AQ3Ose105voeR
         in3IEOprc/bczvVxrcTo2lPNgOdax7iv2M1pES5OFHFdD7hPZJycK+csBtZU/+wCnXAN
         i974Ao/WBQopAdd6UDSnSNSNyvYFa9AXnbpkq9FPyrmIce9d5nnCut5cIh52Roprs2SP
         SIKBRkgqrVCE5HDXwlZBkX8ZTKpO/tMz7ncb8GaakG9xLIHzvN1lyWhN0Ksk7YmHvTXC
         /6zg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Wl/4rzTW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4f33db27bd3si701183e0c.287.2024.07.10.07.15.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2024 07:15:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Wl/4rzTW";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRY5i-0006fW-2u; Wed, 10 Jul 2024 10:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY5g-0006Zc-MJ
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:14:40 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRY5f-0003w5-41
 for qemu-arm@nongnu.org; Wed, 10 Jul 2024 10:14:40 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3678aa359b7so582876f8f.1
 for <qemu-arm@nongnu.org>; Wed, 10 Jul 2024 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720620878; x=1721225678; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZV038v5PDie+4o0LGXftDcMbGJXn076Mf/fA/l7/zi4=;
 b=Wl/4rzTWaMn0m3bUk3wQobzZlWQuPNzhM54J766v65EdsBhE1CZyq4+jRR1G/O5Vxy
 OQLmAR2D9oS+eXg8qYZRxwsLQSC9q4JJafwTXl3Ri9GVn/eiqgtoXZoWaZAVf4omBCBz
 QLP4QFvVQHe8P1k58/bkaLGNtz2ZF7qEIeITaTQNQeSjXDZXAoAG0g1ce2O0Ekol8q3X
 52wm2PWRL9p8vn2DWKM1AJU/sjzf6pCUmWs/7TdwPUBx3nzB2twpZcQ5kBwUyJG4Y7pa
 JYajJc7YiBYi5J+jYJzfeH8E2Hv5T8yemBzzZsSf+tl/mniwXFQjSZ2+TnteOy4KPByC
 b4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720620878; x=1721225678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZV038v5PDie+4o0LGXftDcMbGJXn076Mf/fA/l7/zi4=;
 b=FoUOC4mF6+B2OYnZUIc5HpLRXx1YMHxTx2npeHxWXb0p0CZU5r1kiOYcVwoLfmN7Ce
 ncQITGOQV/tWAZIAT43Wl0BJHlxkNXsTj8bkHGu1XLIoARcbBgNUstHa8ADsy3T+8if6
 vqQ3jV20Q291fBlAtnya0e7PzdFS+owkDNo8NhGW8183Z8g9HdrWy6I1pLayt2b+CtCs
 nKDilbHqQyUqq3xfDuHjvk7+W99VL6+XBRrshXgH2VNKFT+xCVwmUrbEZmXfi0aBgwV9
 P41y44M+u/BnXPv/bawazGpRgfORO82ytHRVmfyRTPsVU7GBMTwevXi3M42jhEQmn+r/
 GrmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX5BA+xK4z92MHfDji4Bqggz4sFPbX583jQ3NDKFgaGbCFUzC4vjuDL7E8llgMfFXUn+jEuyR87O1F9W10H78uLr41
X-Gm-Message-State: AOJu0YwhFNqYCjMrAo+5P3EkisabX+ALZJR1FNqEhz5W1P1RzCUPme35
 cswFQ6wt887/FjfQkkFtFfT20zWnyrF6OStzPg7MpWf7WOHl278NCgBUHPyPCR0=
X-Received: by 2002:a5d:4387:0:b0:367:8fe2:7d8b with SMTP id
 ffacd0b85a97d-367d2e78dfemr4492467f8f.31.1720620877886; 
 Wed, 10 Jul 2024 07:14:37 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.167.117])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab1cbsm5493344f8f.100.2024.07.10.07.14.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 10 Jul 2024 07:14:37 -0700 (PDT)
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
Subject: [PATCH v48 04/12] hw/sd/sdcard: Add emmc_cmd_SET_RELATIVE_ADDR
 handler (CMD3)
Date: Wed, 10 Jul 2024 16:14:00 +0200
Message-ID: <20240710141408.69275-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240710141408.69275-1-philmd@linaro.org>
References: <20240710141408.69275-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: HNNaUmjiLowq

From: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 0e36b0cc2e..7e17bd0736 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1280,6 +1280,20 @@ static sd_rsp_type_t sd_cmd_SEND_RELATIVE_ADDR(SDState *sd, SDRequest req)
     }
 }
 
+static sd_rsp_type_t emmc_cmd_SET_RELATIVE_ADDR(SDState *sd, SDRequest req)
+{
+    switch (sd->state) {
+    case sd_identification_state:
+    case sd_standby_state:
+        sd->state = sd_standby_state;
+        sd_set_rca(sd, req.arg >> 16);
+        return sd_r1;
+
+    default:
+        return sd_invalid_state_for_cmd(sd, req);
+    }
+}
+
 /* CMD6 */
 static sd_rsp_type_t sd_cmd_SWITCH_FUNCTION(SDState *sd, SDRequest req)
 {
@@ -2445,6 +2459,7 @@ static const SDProto sd_proto_emmc = {
         [0]  = {0,  sd_bc,   "GO_IDLE_STATE", sd_cmd_GO_IDLE_STATE},
         [1]  = {0,  sd_bcr,  "SEND_OP_COND", sd_cmd_SEND_OP_COND},
         [2]  = {0,  sd_bcr,  "ALL_SEND_CID", sd_cmd_ALL_SEND_CID},
+        [3]  = {0,  sd_ac,   "SET_RELATIVE_ADDR", emmc_cmd_SET_RELATIVE_ADDR},
         [4]  = {0,  sd_bc,   "SEND_DSR", sd_cmd_unimplemented},
         [7]  = {0,  sd_ac,   "(DE)SELECT_CARD", sd_cmd_DE_SELECT_CARD},
         [9]  = {0,  sd_ac,   "SEND_CSD", sd_cmd_SEND_CSD},
-- 
2.41.0

