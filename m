Received: by 2002:a05:7022:ef0e:b0:81:d0c2:543b with SMTP id qy14csp2372553dlb;
        Tue, 2 Jul 2024 07:09:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNh+um/nO9XfgnBKuqgPkn9aBU9H+ebDWfYcKPM7YAxHAgik4lRTaseYiNkomthRF/EVwYtF1Ok1hHL+RhLIdIiVo8b0Ot
X-Google-Smtp-Source: AGHT+IHPsx0Ne6xGQf4uUv99GUaETOVkSsFVOCpJNAik9pZvFR2inEDTqH6w+kANo+vRmGxfE3PV
X-Received: by 2002:ac8:7fd3:0:b0:446:5c9b:4e02 with SMTP id d75a77b69052e-44662e009fcmr126306481cf.32.1719929391246;
        Tue, 02 Jul 2024 07:09:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719929391; cv=none;
        d=google.com; s=arc-20160816;
        b=q378m0MRBbTXR9k9GFnI3XKaUzxCbllDC0MFIPLN6NllrLwTwa7WfsQ/0zhCUfjrUI
         s+xpEYiLhFFKv1N/LLcYNpGXQLw2AR5V6v60MVdI4IG4/AP7hpskQVMgsbUFNFIkQMCh
         gE1FIpP/PBTYmFPzf0CCTdVDSa+IQfwdlnfemLrboR3pWeDTlpPr/1xbpUojQaPAaolJ
         eqMV7nz/T5eYXcrpL6xkFcx2WmphqXfvQ72hzfZPmX5pgkEsAAQJtZpq7E8/CpPZqznE
         LFSFNuKt+Ye23DxVj9kvFGEsJBQ3TMuaOMZsVpPEQuZ4UefnWO0hEVJPlfBtI+QP6Blf
         xnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x5n/UUecZqva2u2ersebHsP4O+vyf81j9dlx/AwZ1Sc=;
        fh=gkZ9uqAihsCbG1FkrPZwIIOqzI+9nmZ7XpSjssczzEI=;
        b=Cq+teoiaXadJv3A5cmQI5MzIpQ/5tiwqS0M37UMQJ8vZ3Noa8gOPlLjFZZHRUzAdfJ
         7NLkw+/+xN3BWSPLMx3NagY5snbY+I+yfsif/t8EGzrWu62z+8VAw+7irDCaIMrDR7qt
         bpC7eBMi1v5dBiHp67gKoVrOOi8kmseqTGBg5IDkh+tCBMr6g5t0aLVBU8o2fAlmS+o2
         FTwAMogGeRD9fUjCoNm5tfQIseJ5pQ6EqcnvqGxvGPQKegXW6iGX07LeuG2SeCqKIkyI
         REN/BSSqtJQw3RtswI4oiXDwF1h3+VXQUeX4N5ZJsQvMA3FgFq7xyfErBzhKWN2g9q2y
         xRAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o0cs7IZe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446513c17c2si98301361cf.133.2024.07.02.07.09.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 07:09:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o0cs7IZe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOeCJ-0007AX-3z; Tue, 02 Jul 2024 10:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOeCF-0006gV-Sb
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 10:09:28 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOeBv-0008Hi-4x
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 10:09:27 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-424aa70fbc4so29554705e9.1
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2024 07:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719929341; x=1720534141; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x5n/UUecZqva2u2ersebHsP4O+vyf81j9dlx/AwZ1Sc=;
 b=o0cs7IZenV28NQslm2YVS016/oOUO8yoanKqHD9OPNL6h0rLWaZ3dJEplrTtaTXTW8
 diYEwhau56TzbR4TT5t56zdbHTG1MDu5NMkTolL/olgrtyCPb5urN/i2sbAP5amYlEAw
 ikmzHLnX7H41fVz1+99TtUzLy2v4EiOgIrZfap93oVemN01kn0Bz+avMlDV9tA0hzn/v
 nmLNBsh8rk9+OkzIBWFrupSSLTAdVx66n8Dg3tWIJnRPUMhMqVJIp+3jAWun1X5mUdRC
 zR3H+ujVrLStKtrjMZJnuy+7+Gykxszc8k3x3u4KuqbgZDX9QYqhYpYuK3Av7f4UOmOU
 84Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719929341; x=1720534141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x5n/UUecZqva2u2ersebHsP4O+vyf81j9dlx/AwZ1Sc=;
 b=XKk3tEZyTyo1tG3wJmCeDwaWKkXdIXL30aKJ3UhqV2BOCUJDp63Pi4dSJnRTHhmPEc
 tLTI0dk3iwBEM1I9WXK0ufVOTnwXPKaGMddn6j3lmbCNY6S+RNUkpaT/v2GMSiVFZSIC
 nYs5V0DqfygtRkyIgrFZB9i08g9Yp0n5gyetGKdqaR5Qn5ZXKntN7c2gASqAzZ/W+QWW
 J+bRGNLLfTwL1Oqmdv0YmNRq5gnXmTeQ+IfYQ+ee8w+kLbq4XxkytymiVJul6q+W4bDj
 HXvReqdOxSPcoDTjzCDQENII8DwH0si+m2uraNifXMiuo4hdVo2RyiwMBEKjd+EvUCFY
 +MCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqqRf9p9op6UEqoQe//bE6rEMBsrrjGV9pjVmQ7wL89nQ2I9xSa73FRysmqKmF+nuxkMNLbC25udNAcIBhexJwTIAQ
X-Gm-Message-State: AOJu0YxewHyZaI59CCJNA7r7wQ1o6vaBlvXOuafbkqj43AIfCyreTMpz
 kNDSJ3oprp1jWoE3cxEt7IZL2wCt+vDAxbFNnuMv4izRMNQfgylWJsefcCjPhCo=
X-Received: by 2002:a05:600c:1793:b0:425:7ac6:9709 with SMTP id
 5b1f17b1804b1-4257ac698c2mr64240385e9.3.1719929340986; 
 Tue, 02 Jul 2024 07:09:00 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af37828sm205816585e9.9.2024.07.02.07.08.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Jul 2024 07:09:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, Thomas Huth <thuth@redhat.com>,
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 Laurent Vivier <lvivier@redhat.com>, Luc Michel <luc.michel@amd.com>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Patrick Venture <venture@google.com>
Subject: [PATCH 2/4] hw/sd/sdhci: Log non-sequencial access as GUEST_ERROR
Date: Tue,  2 Jul 2024 16:08:40 +0200
Message-ID: <20240702140842.54242-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240702140842.54242-1-philmd@linaro.org>
References: <20240702140842.54242-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: aPIOMEj7fA70

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sdhci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 27673e1c70..d02c3e3963 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -983,8 +983,9 @@ static inline bool
 sdhci_buff_access_is_sequential(SDHCIState *s, unsigned byte_num)
 {
     if ((s->data_count & 0x3) != byte_num) {
-        trace_sdhci_error("Non-sequential access to Buffer Data Port register"
-                          "is prohibited\n");
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "SDHCI: Non-sequential access to Buffer Data Port"
+                      " register is prohibited\n");
         return false;
     }
     return true;
-- 
2.41.0

