Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2368749ejf;
        Mon, 8 Aug 2022 01:12:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4SP/JoMYLM0nkxlAccVy1MLbTdw2gLUSN+ykLrgj0gzP4P0SLXw7gR7TFaftQoHF7iwRme
X-Received: by 2002:a05:6214:4012:b0:476:f313:7fb with SMTP id kd18-20020a056214401200b00476f31307fbmr14829745qvb.130.1659946379685;
        Mon, 08 Aug 2022 01:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659946379; cv=none;
        d=google.com; s=arc-20160816;
        b=o87L5C4Z9DYnviv1JQD4RvPFgS5Q+t468udg6MfmD+r7gM6JfQ6rYZAIZMY6CU8jxX
         Ty7WXiuFnwEg6TTfjVbo476JssQrJIJKIkxIYQVZOHynniBmGWrGlHr0tOpnfS0C1RFa
         s5VP2koawqbXHJiKqE3bETd/STNXVkxaM3usdNLU2FsfJlTl/gJuwlDK+NcG9GfYV8Nk
         +ClEvte0WnM5oTS3255Ds295b86EnaFKbInkG2Gfkrrl4mYr3j4fFSdADwJxafHMKpMx
         AsEOX+jzjAs0uyi3QpyC6PFP5Fp9M5wrjPsC+sgudxt9LTkVIe12jAWuIuR5B+jEl001
         WNgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=nDmWTtJUwqvKFPtJyCnzEXET3uwV3AcrrZWh0wc9MkY=;
        b=a5SRbCV57jz5RT3G5c/FGEg/QggqQvVW9qh69z2aeBIY4vKtlfOGNlp1cYPJf/xOid
         3mTJWP6+KZsVyAQyve/3wX3alCuwKqu7BAn08EnBjYDf6EGlshBDlairUXz4M7bVH8NU
         LkZpRI60cAWYORZCqwBqlgMy3Shuaa6o5lJiQw4gtRAgreOr9wzEGgiNpM4rWUNWHMvy
         Q+RUAIti+DBPdpZ5naRbUhJJfCeSZt0+SHXLMPOq1LOM3/XsG5u57ZbM8aY+5ab/qlXM
         SkPXYqHsmUIp+1fLrfHDnfX6ohvCEhZWp1J1nVkvXfhaS2Nxuw8OZN8MUsjo41/Urv9b
         MvDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd17-20020a056214401100b004796d8eef1bsi3695742qvb.261.2022.08.08.01.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Aug 2022 01:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oKxsg-0007S5-4K
	for alex.bennee@linaro.org; Mon, 08 Aug 2022 04:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1oKxo9-0005MC-FA; Mon, 08 Aug 2022 04:08:22 -0400
Received: from [60.186.184.82] (port=57362 helo=liuqiang-OptiPlex-7060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1oKxnt-0002Jz-Pn; Mon, 08 Aug 2022 04:08:17 -0400
Received: from localhost (liuqiang-OptiPlex-7060 [local])
 by liuqiang-OptiPlex-7060 (OpenSMTPD) with ESMTPA id c574aaf4;
 Mon, 8 Aug 2022 08:01:16 +0000 (UTC)
From: Qiang Liu <cyruscyliu@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Xilinx ZynqMP and...)
Subject: [PATCH] xlnx_dp: drop unsupported AUXCommand in
 xlnx_dp_aux_set_command
Date: Mon,  8 Aug 2022 16:01:16 +0800
Message-Id: <20220808080116.2184881-1-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 60.186.184.82 (failed)
Received-SPF: softfail client-ip=60.186.184.82;
 envelope-from=cyruscyliu@gmail.com; helo=liuqiang-OptiPlex-7060
X-Spam_score_int: 71
X-Spam_score: 7.1
X-Spam_bar: +++++++
X-Spam_report: (7.1 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, NML_ADSP_CUSTOM_MED=0.9, RCVD_IN_PBL=3.335,
 RCVD_IN_SORBS_DUL=0.001, RDNS_NONE=0.793, SPF_SOFTFAIL=0.665,
 SPOOFED_FREEMAIL=1.522, SPOOFED_FREEMAIL_NO_RDNS=0.001, SPOOF_GMAIL_MID=0.799,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
X-Spam_action: reject
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dbXd0D+9I7v+

In xlnx_dp_aux_set_command, when the command leads to the default
branch, xlxn-dp will abort and then crash.

This patch removes this abort and drops this operation.

Fixes: 58ac482 ("introduce xlnx-dp")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/411
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Tested-by: Qiang Liu <cyruscyliu@gmail.com>
Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/display/xlnx_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index a071c81..b0828d6 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -532,8 +532,8 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
         qemu_log_mask(LOG_UNIMP, "xlnx_dp: Write i2c status not implemented\n");
         break;
     default:
-        error_report("%s: invalid command: %u", __func__, cmd);
-        abort();
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid command: %u", __func__, cmd);
+        return;
     }
 
     s->core_registers[DP_INTERRUPT_SIGNAL_STATE] |= 0x04;
-- 
2.25.1

