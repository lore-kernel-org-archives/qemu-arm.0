Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3073938ejb;
        Sun, 5 Feb 2023 01:45:31 -0800 (PST)
X-Google-Smtp-Source: AK7set8Iew97XGXiHqgNVwLGIxa5LMr7COyXvuVmpyyPgThK7D92mrHOh5LuLYCE3CMuS3YUI0dF
X-Received: by 2002:a05:6214:2509:b0:56b:ed70:361d with SMTP id gf9-20020a056214250900b0056bed70361dmr5745550qvb.14.1675590331548;
        Sun, 05 Feb 2023 01:45:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675590331; cv=none;
        d=google.com; s=arc-20160816;
        b=KnNTpbSOfjBXXFENI2EdTTW6WhjBEYFqpOICUxdOnDY+kMKVXK56u5VtaBNpgHVsrq
         5EySGeBYTtSlzjabRe+eAs320rtfjgvQt58Plnks1DIpnMauOawlFNb2YRDDRv1qXVmn
         9Wc3vKqOFLgV6NvFAtn75ofmv5HS7gXBOgDexNTGO2sO9/5vm2L0L2etPnTNrp/qIrAp
         uyL4DITpImW3DtzGknjmhbEjVSs/AGKeV0sYtFFF5As8RlDGSxhSpPfXbYXolcoxLMze
         7cW/sQplRsRC/Iecefvo510/UdR6mpNBFTcqkRBbrOEMw1L51KZ6kztOMv7ZaRJwmsyQ
         d9XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=qGfQzBrF15FcynAI/1sBHoIblw4ElShJPsqja9I9HJw=;
        b=EzN8C/FZbSVElPO9WVuGjh9iv7ndAZqB1elJtWHbR3aNlEMpBjNo51dV7gQTNY7q2M
         7zDCLjk2ajTqF70u6hglkC3CfJzLTN2E9af0wQAputsiJBrMekxWZskeqSPxNGzY+v/A
         WfHm7FgHVN8U4ta8h3LBe/R97xiSRo5ISAw7YnHzqJjM3RJO8IjbEIavuxv5SC8kybkN
         li7HSogKFdejNcsLJM/wSsrZSYPWwqwACaXlHtrnT9EM1df6Og8Vsc4t/mCG/CGv7zdR
         aRuapDaKB56j1YE03CCjtLLqhUnlSzbx15/348Q49vqJB6uYMmKGhSJz8sDIYMk9gtEl
         d1Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=ovRZWy8K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q93-20020a0c9166000000b0053e18975e3asi5407670qvq.366.2023.02.05.01.45.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Feb 2023 01:45:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=ovRZWy8K;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pObZk-0003Ub-4e; Sun, 05 Feb 2023 04:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3gnrfYwgKChsJDFJK1617FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--smostafa.bounces.google.com>)
 id 1pObZh-0003Sw-Jg
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:44:41 -0500
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3gnrfYwgKChsJDFJK1617FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--smostafa.bounces.google.com>)
 id 1pObZd-000173-11
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 04:44:41 -0500
Received: by mail-wm1-x34a.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso4573136wms.8
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 01:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=qGfQzBrF15FcynAI/1sBHoIblw4ElShJPsqja9I9HJw=;
 b=ovRZWy8KZvlQxW5+aoCV1VcREEAPIuD9J4Iup3E0pgAtFHGxKDfNwfP3uNIYDgWHTZ
 UyA020LxM95n0euDzptMISwczgcZ52S1qra0AqjJKvpUWeXd18WT4fqsaOPthJU973TL
 XadtgFLnesW1WDHr4PRwt3OXZ2wjd7iFDWDL4SAn1iNozijnvhPUaHKqhMTWntzU8fe3
 lLVgKGd1cKgS6l10fqfwdW89dDgKylDBtBrmL97h7rHeoVt+QpD+xPujT8wag8RZXbE0
 jf/k8P8BNI1Xc8S/YhEOIw/8qo6ORrK9phz7DcZca16MfsPQFsgI5TzaFKW0MT7VbF2v
 5tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qGfQzBrF15FcynAI/1sBHoIblw4ElShJPsqja9I9HJw=;
 b=h0n6uQ+1K5hYtersBGt7CfQdLyrPu5JY+YBLPBU3RVzR+CMm72wGoezhedQ9uFNMGP
 y4MROmZKwrDb7te4upCuo7QMBF+IdmX+DLFeb2kUyM/DCk3cjjM05GmNN40Q05Z16K/a
 hHPxk60miR7pvzCc5l4TpGLOzfAhkMNgOIiu1cr0cxYBinuYJVcyLOE6akWBmPrp3wI2
 +I44qGDgtZStApW+AQIzYiJFwrsjHm5wKRah9NAXCVYOjddz4hGs4h7fzIh0BPDaxFc0
 J1V856QFRTmmdtOcsungpSGVhPRfdra8G1Wwdq6wRvlMTW/jIzyxcz9ajKceIU7Flv91
 JrmQ==
X-Gm-Message-State: AO0yUKXrmQGdmv+XfrdbhAWRjT7UAbxn2hCmdqCmD1K3LQ22kOMCBpQ4
 F02/VpWKTizMk+jnhKA8URCMj/iGae1H3rmWvYKVMslIiUi3BJi2SpMTwIIIhsuhaUaDU1DkZk9
 QS5dngAySK9wFhmNIu1ynUHQsRX/46J7ejuqfes65GK2bWMItplOXqP/J/CnOZGFLtg==
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:600c:4408:b0:3db:1188:dd3b with SMTP
 id u8-20020a05600c440800b003db1188dd3bmr759365wmn.143.1675590274285; Sun, 05
 Feb 2023 01:44:34 -0800 (PST)
Date: Sun,  5 Feb 2023 09:43:57 +0000
In-Reply-To: <20230205094411.793816-1-smostafa@google.com>
Mime-Version: 1.0
References: <20230205094411.793816-1-smostafa@google.com>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230205094411.793816-3-smostafa@google.com>
Subject: [RFC PATCH 02/16] hw/arm/smmuv3: Update translation config to hold
 stage-2
From: Mostafa Saleh <smostafa@google.com>
To: qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=3gnrfYwgKChsJDFJK1617FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--smostafa.bounces.google.com;
 helo=mail-wm1-x34a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: hArS4M51bVnX

In preparation for adding stage-2 support. Add it's configuration.

They are added as SMMUS2Cfg in SMMUTransCfg, SMMUS2Cfg hold configs
parsed from STE:
 -tsz: Input range
 -sl0: start level of translation
 -affd: AF fault disable
 -granule_sz: Granule page shift
 -vmid: VMID
 -vttb: PA of translation table

They will be used in the next patches in stage-2 address translation.

No functional change intended.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 include/hw/arm/smmu-common.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index c5683af07d..45f74d0e93 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -60,6 +60,16 @@ typedef struct SMMUTLBEntry {
     uint8_t granule;
 } SMMUTLBEntry;
 
+typedef struct SMMUS2Cfg {
+    uint8_t tsz;            /* Input range */
+    uint8_t sl0;            /* Start level of translation */
+    bool affd;              /* AF Fault Disable */
+    uint8_t granule_sz;     /* Granule page shift */
+    uint16_t vmid;          /* Virtual machine ID */
+    uint64_t vttb;          /* PA of translation table */
+} SMMUS2Cfg;
+
+
 /*
  * Generic structure populated by derived SMMU devices
  * after decoding the configuration information and used as
@@ -79,6 +89,7 @@ typedef struct SMMUTransCfg {
     SMMUTransTableInfo tt[2];
     uint32_t iotlb_hits;       /* counts IOTLB hits for this asid */
     uint32_t iotlb_misses;     /* counts IOTLB misses for this asid */
+    struct SMMUS2Cfg s2cfg;
 } SMMUTransCfg;
 
 typedef struct SMMUDevice {
-- 
2.39.1.519.gcb327c4b5f-goog

