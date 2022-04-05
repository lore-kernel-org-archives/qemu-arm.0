Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp286058lfu;
        Tue, 5 Apr 2022 15:39:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/2xyC0TZ2Dg62Eef/ad/aWx6tnVuY4EKxGguFQOSDtFnE044wzzmEiSiUz5fZ7cI+auq/
X-Received: by 2002:a05:620a:2697:b0:699:cca7:f8b2 with SMTP id c23-20020a05620a269700b00699cca7f8b2mr3827807qkp.738.1649198360934;
        Tue, 05 Apr 2022 15:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649198360; cv=none;
        d=google.com; s=arc-20160816;
        b=w682Z+zlfm4zUgmnp0gxgCET9aaot237aoGIkFU7No+wka3WlZpEo407HlGW8PP7RJ
         GlJvatidYf+ycq2S1g15LmgIRYrQK/6wZuDHRVu31zxwYQMdVVReP7Q7CU9N9AS4ntmB
         EgOhTRbM7JN8ORXUje6h5Ex7dBOa+ioGk86/3CI027Jk/S0l9wl4p09N1sjaZYspfT/d
         8tIP6/TfGv0t35gbi6IZMdWVjW4EuuIWYiUXcJx6ejog0xdWU0IfMpBLWTFPxlIDJMFT
         p2qBY30rQlBoKI3d410YRFPpLf1QcO10Hj7bBPo4uqpwlSYuZpG14+3go+id6dB+eyFn
         lU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=4lqFJfMyhM5gSqksn2scdDmPoQUw1eXlvt2iNImqMZo=;
        b=TyrikYcVqbs7sLqL/I/oJ4hXyNCWRLaeCN4tqof4acXuC74JwEbMMzjOHLt0lxxcrK
         scEZkWuWYOYvqyCUTcZfHQ5K5LBYW4reGC6QRApsdkcz/YND8kQbhg/MDxDrEnZbT6pk
         cKpDuVaUQwPvolVa1hF7EVlG+tLT8O2PQ5HZGQ4dDG0m6+HR0rdIpRUzIlBABRm+H+pF
         yLy842S0OIXVlcy8/tD2gCQKnyozPkgxyOlJ7u8bxEytvN7h2Hw/ryFny2vGR4vX9IA1
         h4UeivtrAsVwIv6pKKoI0bZ+F9CmW8K3YeG8miGZxQcl33jgUDkOG/chRLW1bf9jNE3z
         x1Yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=NkBN9HzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14-20020ac8140e000000b002e229d35fb3si5050028qtj.184.2022.04.05.15.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Apr 2022 15:39:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=NkBN9HzC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:52640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbrpY-0004J9-E2
	for alex.bennee@linaro.org; Tue, 05 Apr 2022 18:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3zsRMYggKCKMZXKDRWVKJRRJOH.FRPTHPX-DUPQRQJQX.RUJ@flex--wuhaotsh.bounces.google.com>)
 id 1nbroU-0004FK-Dh
 for qemu-arm@nongnu.org; Tue, 05 Apr 2022 18:38:15 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:41892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3zsRMYggKCKMZXKDRWVKJRRJOH.FRPTHPX-DUPQRQJQX.RUJ@flex--wuhaotsh.bounces.google.com>)
 id 1nbroS-000320-3D
 for qemu-arm@nongnu.org; Tue, 05 Apr 2022 18:38:14 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 k7-20020aa79727000000b004fdc86d9b79so431387pfg.8
 for <qemu-arm@nongnu.org>; Tue, 05 Apr 2022 15:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=4lqFJfMyhM5gSqksn2scdDmPoQUw1eXlvt2iNImqMZo=;
 b=NkBN9HzCvrPiJUXUlaFo+UKNf6vHPCa7lbPQAeayYzaPskdNrBj5EhmgUNZIQMYsRG
 qcZ2gMCW+WKcnecwaYcidX8Pk/GAaIEz2DHNvU91o0jAD8oeTTVSPN0Knjl9nFklUi+i
 L3YzC8Bxsvc9y2lTiggaYkycGSfPq0+tlYMiQoVLdXeX8Mn8jcFN+U5OUhurTC5BhAP0
 STpwKwVY4wE1QwLtYlRBzII8+SZeD7xSO7zbf8Lr453QKx69iQdjQNYD+ztmi7VL75yh
 EUtAVc7B2Oo2uciIZPZSre95cbbXaOTsMzJJ8HIk9bYfn1aH394UCK+BKNV3ZjsyuG5L
 XnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4lqFJfMyhM5gSqksn2scdDmPoQUw1eXlvt2iNImqMZo=;
 b=5JvzZ0ITIz7kVQev38CO8xVZzxa+L2BUcne/eMaZ6CiEDPwp5N/5As+ZHDEd4dex/l
 Wbhy86qENJugoq3z1lqLFMhcCnynezIoOhC4E9/3ruTzQlv+7v9WKem1jfv6/Um+EqUZ
 YebWPAD/3achfsgV17WDjDsfgF4ygNuCaSL6oBWp4IEwq/hScz3Tsr/CZqKeDdRTbbFG
 Fn95pHzy+4QDScck7Bk/9zkM9FRsj0RpCqQeDaYeVo+M+qNs3UYP9gtOKUNRJTah3ynp
 hPD9ey/g/ifW1JM7YsS6hCuOW09DZAkBQrkYTf8kTRN5QYiV/ZhNdxVdZRv+vAPvZCVp
 fmLg==
X-Gm-Message-State: AOAM533jb334uwmIALdG65cP/re+meRaT0m6wRKV3z2e8toSyiFbt496
 kamZkYO30/qZNHIL9+DFey+zp61PskeQ1Q==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:858b:b0:1c6:5bc8:781a with SMTP
 id m11-20020a17090a858b00b001c65bc8781amr69727pjn.0.1649198286447; Tue, 05
 Apr 2022 15:38:06 -0700 (PDT)
Date: Tue,  5 Apr 2022 15:36:35 -0700
In-Reply-To: <20220405223640.2595730-1-wuhaotsh@google.com>
Message-Id: <20220405223640.2595730-7-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH for-7.1 06/11] hw/intc: Add a property to allow GIC to reset
 into non secure mode
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3zsRMYggKCKMZXKDRWVKJRRJOH.FRPTHPX-DUPQRQJQX.RUJ@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aF4f1ov839KI

This property allows certain boards like NPCM8xx to boot the kernel
directly into non-secure mode. This is necessary since we do not
support secure boot features for NPCM8xx now.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 hw/intc/arm_gic_common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 7b44d5625b..7ddc5cfbd0 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -358,6 +358,8 @@ static Property arm_gic_common_properties[] = {
     /* True if the GIC should implement the virtualization extensions */
     DEFINE_PROP_BOOL("has-virtualization-extensions", GICState, virt_extn, 0),
     DEFINE_PROP_UINT32("num-priority-bits", GICState, n_prio_bits, 8),
+    /* True if we want to directly booting a kernel into NonSecure */
+    DEFINE_PROP_BOOL("irq-reset-nonsecure", GICState, irq_reset_nonsecure, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.35.1.1094.g7c7d902a7c-goog

