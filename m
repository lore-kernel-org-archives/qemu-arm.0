Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp247074ejc;
        Thu, 31 Aug 2023 15:58:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuDsDE+TI/s9iUKYhg6NTvMssTpARJ1hfyTXh8eFKYjWmSo+2Q617Yn48Llil07+lICl6q
X-Received: by 2002:a05:620a:2491:b0:76f:e93:eb0 with SMTP id i17-20020a05620a249100b0076f0e930eb0mr817482qkn.52.1693522697679;
        Thu, 31 Aug 2023 15:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693522697; cv=none;
        d=google.com; s=arc-20160816;
        b=mInYODdWkOq5Jdjtr7Ayh0Z80h1viSwcl1OeJdnkZszGyXo7H13y1gRJ7G/Aj5Ri1H
         owvuswvLW9fxaOE+1LIVtvbL2joD+xLBeEcrV12FrPrZocfojtM33dGXutxVCp3SwJn+
         dMZIIRvqjs2F3b6SzgMJR2TOjnNDv9jdY84cwRaeMcoMzqGOppsiL+YQlG7Bj33ptEgE
         XJKVvcELdFxe3m/zTpIAnbWcXcG+B102lT35LBbtlkg4yvvzpL6Qv9zOiGtbXVt9RyRV
         It6K5rcIuw9eQQU3xRRNVsmC/l5ZXTtRQYsUJvWpOnF4UI5iPnSn7JbehNjHb8ZS5Gbk
         JuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4GNi2AOj7YBZidVqMdiMTsl/wL7uqVeokPItco5CZ1w=;
        fh=rmbPMLkKdMLoE/1W8nKMRiIPVfrTnm2fPPNYpN4rLFw=;
        b=h72MP9Z15RDEKINLOOEcCWf8aOMMpChgn3gyvAbYuW9JpO0rmNoCNgk03tyamRBerz
         N9GePBj61y217eCxEMvgLx3Njj8vcKZIT2L6a5CHuxlH9xeSm1zw6CURQYRx/IM6G8m8
         lRK4PrTF7Fl1R3qWumwyKfdtqbs65c8DZTTQ68QK0nxxbDsn/iGKNdqOe38a6gYm/pZP
         YLNay8bLQsae2WwHhGqjQbAgckjIBE7rugF5pHVLFlbEk2VSsq2uEhBxAQYuj9ZW1p0U
         hNSWH/gTQPdHiLRi4HZaVVETCw13MPXDnSkBGgUmr9dwhFCisjEpmKFzka4a0HYkVPMp
         rmgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BO63+KHX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rh15-20020a05620a8f0f00b0076eeed38118si1512119qkn.131.2023.08.31.15.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 15:58:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BO63+KHX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbqbW-0004uq-LA; Thu, 31 Aug 2023 18:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqbJ-0004fU-CQ
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 18:57:22 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbqbF-0003D9-9N
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 18:57:21 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-500bb392ab7so2456285e87.1
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 15:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693522636; x=1694127436; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4GNi2AOj7YBZidVqMdiMTsl/wL7uqVeokPItco5CZ1w=;
 b=BO63+KHXIScqc/o1nMCK7Mz7lmzuQ7DEUqw5iMowpiHgfWKHpf+qh+cI6bt1O1X7lv
 jkWzn3QOvsV7qoTdoVIHU26sE7ytH1hGfb743k8ktggJdcq6bJM9UFASbkpsSZx8ulYu
 P3uChnX+V6qe5PFdlRv+dEmyh/zmwIuWb1G6kihR0vtPSasbauctsgyrKTnFQljyIji0
 tGbFI08BMYB60KPMHgmqnDJKF9olgPtTc4/hmpQbnMRbG6UfLyfIke2WjtwU1mxe5Rqj
 Ck15lRS8uClSMjIbrQ5A4t1U815fY1Oh5wtTPxFj1vtckQqUUwFnaG3+L+vd1wP1CbKB
 tSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693522636; x=1694127436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4GNi2AOj7YBZidVqMdiMTsl/wL7uqVeokPItco5CZ1w=;
 b=U3hODjs8rKKCZoSwoP7hxLTfCvQzzdi5kk+TmJAjX0UGHXfygwseW8Lh1PfWglBVt7
 Wiam+J3hhnXdGId5We1vqFFMdne1ZQ4nER5mSXt3CHXzWSjRZJs9d6KkWM0Mb0ZpjRIj
 yaaoUlmzHLvcFNiHl+k/sbPJ4VjIDHlYmv+gecQsT3TAfuCczgLFVw/Gw1Wbh3ShzXEa
 gcVEoWd/XG6xFp7Hjik8iz+0e5c4qPgrAr2tONlv/g3I+EjZbg5gE7mcGeVxBCe6x3Qn
 b43BIavszYbYRT+HHr0Ik68qgy23v34pPzB/fgUw9Ukc2zvGUJmX3BRRJlIXSZROpj1N
 xECQ==
X-Gm-Message-State: AOJu0YxBw1FOjTm9Hk3D0Nc4j3yLJQM/XKKKAAgVP+nGZTQ1LHxs3QXQ
 VT/DE+UkLlhx/Ekn+f3z4dPhhM0qZIezSrMT3qc=
X-Received: by 2002:a05:6512:2513:b0:4f8:8be4:8a82 with SMTP id
 be19-20020a056512251300b004f88be48a82mr466680lfb.22.1693522635678; 
 Thu, 31 Aug 2023 15:57:15 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a50ed08000000b0052333d7e320sm1304363eds.27.2023.08.31.15.57.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 15:57:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 11/11] sysemu/device_tree: Clean up local variable shadowing
Date: Fri,  1 Sep 2023 00:56:06 +0200
Message-ID: <20230831225607.30829-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831225607.30829-1-philmd@linaro.org>
References: <20230831225607.30829-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: hcU+gD7o4e8S

Fix:

  hw/mips/boston.c:472:5: error: declaration shadows a local variable [-Werror,-Wshadow]
    qemu_fdt_setprop_cells(fdt, name, "reg", reg_base, reg_size);
    ^
  include/sysemu/device_tree.h:129:13: note: expanded from macro 'qemu_fdt_setprop_cells'
        int i;
            ^
  hw/mips/boston.c:461:9: note: previous declaration is here
    int i;
        ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/sysemu/device_tree.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index ca5339beae..8eab395934 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -126,10 +126,8 @@ int qemu_fdt_add_path(void *fdt, const char *path);
 #define qemu_fdt_setprop_cells(fdt, node_path, property, ...)                 \
     do {                                                                      \
         uint32_t qdt_tmp[] = { __VA_ARGS__ };                                 \
-        int i;                                                                \
-                                                                              \
-        for (i = 0; i < ARRAY_SIZE(qdt_tmp); i++) {                           \
-            qdt_tmp[i] = cpu_to_be32(qdt_tmp[i]);                             \
+        for (unsigned i_ = 0; i_ < ARRAY_SIZE(qdt_tmp); i_++) {               \
+            qdt_tmp[i_] = cpu_to_be32(qdt_tmp[i_]);                           \
         }                                                                     \
         qemu_fdt_setprop(fdt, node_path, property, qdt_tmp,                   \
                          sizeof(qdt_tmp));                                    \
-- 
2.41.0

