Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp193693ejx;
        Sat, 24 Jun 2023 10:41:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4igjorqXRkXh05Wop1FeqvqtbomCH14zKQ+DmrOReU2adK7p9zcVOkNOvChdtEvyWhl+aB
X-Received: by 2002:a05:6808:2383:b0:39e:cced:f55e with SMTP id bp3-20020a056808238300b0039eccedf55emr24494047oib.58.1687628509170;
        Sat, 24 Jun 2023 10:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687628509; cv=none;
        d=google.com; s=arc-20160816;
        b=D3QtgTtbFmhDUsx7KJrqx0IU/YMkhWzHRLx10tdhECQYOffZIN02uZVsErpY3pCHmJ
         nXIy/n2f5MbR/RBk+uanqxbQVm7PVqAefRGYnKkDYXTlFWs/I2tr5RocvoroW8De+60E
         QvXpGVSzXxrGOgNags1c4GWKBYBVu4KvGMbbd/Mvq8yic91puK8PzDaSiqI0mLugR/fy
         pP+/QYyN3PmlJt0r5icIkJNDb3gLWKzj1iIPc3ygyYsu/oUq6ZUKc25jvD8tzLd9mS/g
         PNLnrlwCHT/O7LCEzDamR71tL2bX/IP5UViRHb0sXf/z4+chtJqlYmhyJc/1KOjxwsLh
         mG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=xHLdIwIywOmneOj5eUp5g6ra2t5DF15QteoMLknkUnc=;
        fh=dxlO8U8n9FJbkfu3NZ9xTJMkF/Fn5IQj359CkmYw0tg=;
        b=h4yQRs7TNV8mjCHKgk2PJM7/vY2xopfYzlk9Sjagl6uXXY71dwT1snZKIe98j649WF
         DI4zBVURlScpBdPvI92CC959BcB5Nd6Djya/FXpq1cw0JZvg1gNLoqn6ogW4Uz7ioZiY
         uOCz4qzt6HDlXzBnj6VG98y6TR7wgK7we9vrt0ldkeKFnQYQjhVHNnWuiKCZxUtji5lf
         ROiRN68ngJyeAzKk+NstfjlMJOknYOwLLzuwtOCeAPIyCUfX8LpXWsLHUEHHF5v3+L/a
         2xb4WwADoze9Vk1MTUWLARvtxTPScm5Kh1DEwlxRel8Q6oMATssFgYnEfo2qZubWfL6n
         0hjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=omrduxic;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id i9-20020a17090a650900b002509d96227esi3992367pjj.173.2023.06.24.10.41.48;
        Sat, 24 Jun 2023 10:41:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=omrduxic;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233188AbjFXRlp (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Sat, 24 Jun 2023 13:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233160AbjFXRln (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 24 Jun 2023 13:41:43 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69FE1BDB
        for <kvm@vger.kernel.org>; Sat, 24 Jun 2023 10:41:41 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f9bdb01ec0so22167955e9.2
        for <kvm@vger.kernel.org>; Sat, 24 Jun 2023 10:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628500; x=1690220500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHLdIwIywOmneOj5eUp5g6ra2t5DF15QteoMLknkUnc=;
        b=omrduxic9rR9gPq+8XiHL87viBJ6wPrEMLfMgl5GRT1MGJsF+TtB4IIzUjBDeXNjSP
         tp/8tj21VJeGWzF0OuqgjS2WgxvAd7ieEEmjLY+I4RrDNy354ZcTaHifbrUEQBN4g/u9
         4e/DFqq/MH/KbKaaB92Ppsx49dKlUxgAkumlNe5v3R+Jm/CqIieAk+esoDLYqoEBfLF/
         1f88uKZFICtvcllNPS/mi7pVo0xerJ43s2nY2Z3sJDSCnEe0Pht9v3orZiuam5tqDacn
         UUqcswJ4Q6QF4/9o+nZDEmVIc9HxLeYNLEDed2aM4/V1htoQbmJH9XmE/hgtRRhOhIST
         3Imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628500; x=1690220500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHLdIwIywOmneOj5eUp5g6ra2t5DF15QteoMLknkUnc=;
        b=dAGh4ajC+pDlkhah953SyXaUKFlkCfXmJQHu9M7cP/vY/kfiwneoxUzWP7dJDgCWO+
         8+v5HZ+bzmOuIA8Boid44CMdCFviG30w8bMvV8uIWwvDfVz8Y4bVjph0knZOddBw4233
         GS+U3J4nZ/BW/B2no95rMPVCxFn1Y0QjQFkahRLTbgRfDICXzbkTMN3wo4gqsXL/2rX+
         paDO9YhQAr+iqR43g/p+s+KTvDLEjowkGNPZ0bOeAFQwtuktyYH70W6ZYIOOrp6L+0vn
         55WWTFTyqgXtgFc5HiM1PDxESbiABnAi+ImWpsQgnWTbchXdgAjnk3u/12FtVXV4E9AF
         eKaw==
X-Gm-Message-State: AC+VfDyksc/vEePRd3w4GyeTIKhGWwHsI5A63HoA7T5SYx8kyK87oQ5Q
        3QpXgZ7waqqG1YgQvlaE5WSshw==
X-Received: by 2002:a1c:f70d:0:b0:3f7:3685:1e10 with SMTP id v13-20020a1cf70d000000b003f736851e10mr19084030wmh.40.1687628500315;
        Sat, 24 Jun 2023 10:41:40 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.150])
        by smtp.gmail.com with ESMTPSA id t16-20020a7bc3d0000000b003f17848673fsm2720557wmj.27.2023.06.24.10.41.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Jun 2023 10:41:39 -0700 (PDT)
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To:     qemu-devel@nongnu.org
Cc:     kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Roman Bolshakov <rbolshakov@ddn.com>, qemu-arm@nongnu.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Alexander Graf <agraf@csgraf.de>,
        xen-devel@lists.xenproject.org,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Yanan Wang <wangyanan55@huawei.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Paul Durrant <paul@xen.org>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Eduardo Habkost <eduardo@habkost.net>,
        Cameron Esfahani <dirty@apple.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 02/16] accel: Document generic accelerator headers
Date:   Sat, 24 Jun 2023 19:41:07 +0200
Message-Id: <20230624174121.11508-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230624174121.11508-1-philmd@linaro.org>
References: <20230624174121.11508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Ryjdsmj7IabY

These headers are meant to be include by any file to check
the availability of accelerators, thus are not accelerator
specific.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/sysemu/hax.h  | 2 ++
 include/sysemu/kvm.h  | 2 ++
 include/sysemu/nvmm.h | 2 ++
 include/sysemu/tcg.h  | 2 ++
 include/sysemu/whpx.h | 2 ++
 include/sysemu/xen.h  | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/include/sysemu/hax.h b/include/sysemu/hax.h
index bf8f99a824..80fc716f80 100644
--- a/include/sysemu/hax.h
+++ b/include/sysemu/hax.h
@@ -19,6 +19,8 @@
  *
  */
 
+/* header to be included in non-HAX-specific code */
+
 #ifndef QEMU_HAX_H
 #define QEMU_HAX_H
 
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 88f5ccfbce..7902acdfd9 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -11,6 +11,8 @@
  *
  */
 
+/* header to be included in non-KVM-specific code */
+
 #ifndef QEMU_KVM_H
 #define QEMU_KVM_H
 
diff --git a/include/sysemu/nvmm.h b/include/sysemu/nvmm.h
index 833670fccb..be7bc9a62d 100644
--- a/include/sysemu/nvmm.h
+++ b/include/sysemu/nvmm.h
@@ -7,6 +7,8 @@
  * See the COPYING file in the top-level directory.
  */
 
+/* header to be included in non-NVMM-specific code */
+
 #ifndef QEMU_NVMM_H
 #define QEMU_NVMM_H
 
diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index 53352450ff..5e2ca9aab3 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -5,6 +5,8 @@
  * See the COPYING file in the top-level directory.
  */
 
+/* header to be included in non-TCG-specific code */
+
 #ifndef SYSEMU_TCG_H
 #define SYSEMU_TCG_H
 
diff --git a/include/sysemu/whpx.h b/include/sysemu/whpx.h
index 2889fa2278..781ca5b2b6 100644
--- a/include/sysemu/whpx.h
+++ b/include/sysemu/whpx.h
@@ -10,6 +10,8 @@
  *
  */
 
+/* header to be included in non-WHPX-specific code */
+
 #ifndef QEMU_WHPX_H
 #define QEMU_WHPX_H
 
diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
index 0ca25697e4..bc13ad5692 100644
--- a/include/sysemu/xen.h
+++ b/include/sysemu/xen.h
@@ -5,6 +5,8 @@
  * See the COPYING file in the top-level directory.
  */
 
+/* header to be included in non-Xen-specific code */
+
 #ifndef SYSEMU_XEN_H
 #define SYSEMU_XEN_H
 
-- 
2.38.1
