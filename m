Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2179865njj;
        Sun, 4 May 2025 18:56:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVerFQ2XzJALQgwaewcZCceQdCgdygjZgu2wJYD+GDn3HGL4mL36wSm4cNJeLeSmligPln/8EcpCL+Oaw==@linaro.org
X-Received: by 2002:a05:6a20:9f4e:b0:1ee:ba29:d8fa with SMTP id adf61e73a8af0-20bd724e901mr23007455637.6.1746410184993;
        Sun, 04 May 2025 18:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746410184; cv=none;
        d=google.com; s=arc-20240605;
        b=Z4vsANupm701u5B6oX3EyJyu6+/Terdu9HS3nHokmut2RU5S6U490mXwyDLcyqntuB
         twdX2jGkigOF3tYPbo1QxLxj6sk++uc7YhuLrjlcQtEv/VFXvekQe8u2OmS/PWNnaNNT
         eCjJfZC22FE2XfHhAufkKMvq+xRD6/9QZVXoiXl5X85guA3+U0NHlEq0HuuGZVsIySnB
         m00i6mD7Z14ZRod0W5k87HVKQFyq2WmNMDxsxVaZgzF0MgJjQOyHVHrcO8R4/BJP2mLQ
         402IaAUJeruhRkeAb+NUK2P/kqvbGxds/f3U/0Qqo83pXpsYPBJs6U7h6oRwsOQnAQ/x
         WS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=F6rvyCptpZZum3a3XLfgy4KbKHlT47oeB0wfjegrLwc=;
        fh=RBLMWSCdSqYmo1CJJ99zLkySb1CIiGCqyGruyPEcmhU=;
        b=Fj8IClY4Pb7b5NKjB8eazr52h6WLs/DaAZfY+LLrLpE2/pghneLBijwWwoYalWRZZI
         AeSvPrC4yustqfu1eB55igZ54evrKWwAekU0VJZEU4sh1X3bpVV1tIlIecpxxKVCGZN7
         a1OO085EXkG6M/nMyHiwZ8EiBwerFPsFxD1Okb6D5136LtFm8bSOllgc8lv21N4IZAYa
         pQb+oCh3QI72lTF7OwerzPpSGdjZPHzZN5fmnVj2pNFnZKuFScZp3H9pt4gPuwjQ9BFC
         UJONi+jikmIvYhHPQ3nsu7pv6exWGUOBHVckQcKWn+HbDzfCDZHUvz4muUVg58UNjRao
         PquA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OCdNoe1Y;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f7b54603csor5102831a12.5.2025.05.04.18.56.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:56:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OCdNoe1Y;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746410184; x=1747014984; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6rvyCptpZZum3a3XLfgy4KbKHlT47oeB0wfjegrLwc=;
        b=OCdNoe1Y65s4t6jzu/FvCeyrIsdA55fjlI0TZ1Ffg7vN2F86AabhvB2Uiyv0U0nVGl
         PvUr6/p1AIDMHJSy+8jdfc5hkDiyU51jePFRptptL8nyPEI2EK4v4/xkQ8UPTr+KGbeP
         LVT1gaPTpmUXMnLwYRSImbJBaB1+YDWnJXHrVQpV9Fm9/oZGlRl8juaHHTVsKb08KEYl
         vxAMynrL5PDX5JZe8xYu57BzV9FoIMyf5AGJ/7uEDPWEaPx5o16kut0x0iAnFft/xwBz
         6n15Bjhdr+Y2gW9qE1WuiOnw6X35O6hN1SWyKj0XuxkxtoOv0FQcm2yvQJlQqSaWGp6j
         6gCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746410184; x=1747014984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F6rvyCptpZZum3a3XLfgy4KbKHlT47oeB0wfjegrLwc=;
        b=Sa2QljNHHB0F8Tb7oPq/p4ilrHw7KsrnQtPxbyekrpdUDatYUGqHgj8GLn0NNySRoX
         DCE850a0fbRuHmE19DoEi36BG4aOzXbz/yc6D3PzNhH1FqXqcQUuDCZlyUkBswmnWaMU
         2ptCj6QDVDXt1Tdarvu1il46hmYGxmb59Ynk330Yo9tGze5aXzNc7Ydsa8ospws1cl4l
         g1RF7ZkOOSXhmvjBUYApUbePw8ckaDkIQ3plMO6rXiT/gUZCjVUyKgErUCkA/MKSL+I/
         TV4n9bpU6g9+NUWyJfO+sWSghg5o80EqrNKh7T95Cm07bKX83wWTx3vbcpdMf6zXYmIp
         m86Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEY+OSKZRDFZGNWkj1rFBCj4fY0PAZ0u9zk4zJPgnOzvzWpeS1WPt4IrZvQN2lIlXt46nCI03Qu85/Wg==@linaro.org
X-Gm-Message-State: AOJu0Yzc9RCYLJPVH7kXWfkTnvuoDOJn7nY4mM74Zl1Cp5K/AjaEcJFY
	iPIcujlqO3FmiGTcpvuoX7xo7Hp1DB6D5ThTU1M0P5MCjFb8NPjgMqJ6ebedJhRcWA==
X-Gm-Gg: ASbGnctaymPSMsETI9o5AUlKu8ytSb6NLm7IMpn1C4qIt/WJtc8dhbV5g6WjDziuJXX
	GhcYPv2N7CqkBiHx31BvBe/OgeAW2FJRw2IZfftKh9ksiEuBusYKUpsQ1IHclwkHRfX7UZ+TGt8
	t9CUSYNnW3OQIAp8li8N1L/uH7d+hIASAeNWfpflJM10UzUDl6UgmKkq1SWmgP8rQOIEHQ0ykm9
	2zRlMBv8GVfWhW/OMeA5piFFvdDOXQuEeKknb1JGIZzxoCqTN2ntCyUp1e7Qodn2ADfz8qGDgyC
	13LXzLsjv8vmV3swLOXkIPU0cH8KrbqHe27uM1+e
X-Google-Smtp-Source: AGHT+IGit+JLh7j94oEa65elMcYUy5zCoUjV9A6bao3GjfXJLsS5Z1ncHzwZWCairFLXqpsh9XIIvA==
X-Received: by 2002:a17:90b:548c:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-30a4e228570mr16054269a91.14.1746410184424;
        Sun, 04 May 2025 18:56:24 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47640279sm7516495a91.44.2025.05.04.18.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:56:24 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 40/48] target/arm/machine: compile file once (system)
Date: Sun,  4 May 2025 18:52:15 -0700
Message-ID: <20250505015223.3895275-41-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5io3LD7znxK/

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index bb1c09676d5..b404fa54863 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -13,7 +13,6 @@ arm_system_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
 arm_system_ss.add(files(
   'arm-qmp-cmds.c',
-  'machine.c',
 ))
 arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
 arm_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
@@ -39,6 +38,7 @@ arm_common_system_ss.add(files(
   'cortex-regs.c',
   'debug_helper.c',
   'helper.c',
+  'machine.c',
   'ptw.c',
   'vfp_fpscr.c',
 ))
-- 
2.47.2
