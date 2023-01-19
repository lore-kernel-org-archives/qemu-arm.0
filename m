Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp217144ejc;
        Thu, 19 Jan 2023 02:14:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt5DIieeneQeZ6jSFjRgXgvGc/ZVtt4vTJSJJWzLO3/5nwDiJvEOzK6of1uIeS5VbQZr7FE
X-Received: by 2002:a05:6214:5e12:b0:532:2fd0:593b with SMTP id li18-20020a0562145e1200b005322fd0593bmr14900877qvb.21.1674123244914;
        Thu, 19 Jan 2023 02:14:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674123244; cv=none;
        d=google.com; s=arc-20160816;
        b=lGBDMLFqWT5qDbQ7m7t9Fh+8b143VBPzzrwMszlecTeve+ruP8EVldzNGADsvyLWsH
         6lMxIr8wAhOghhu8zGMPYFfr/DMPPkkvUzubmUw0kAdbmHL+YcyRbnTOGXGRJSJ6wGid
         U/PWraG2X1aqUKDZTSwecwbE11nSXMV8zTy6+OSfeFJfD2M5O8g2FeDesSGKNtR4jOKv
         aQB16eKVW+R7u0wR8ZzY2p5fs6+bxe3V6mWOTPBnpvgTeKxMGLhWtUcARb9eQrTdEnx0
         fhHNWOL2426g8BQHXUtLxvQH56ftAqlqHgt3bsRglyGdfBBE4AkXb4iiXQ+Vt1jinCZ5
         C1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vGJD4ga3J8xHyk3OZlII0Hth91GC6i661lSTuntqoMY=;
        b=ex+vyxuJHes4wFb9Nr3QWYiPsgGsmR2dYi9Q3795+mXf4Rzyes0LTzeyyoDmywIA5Q
         /SVziB9131Db7q9fT4R/C2lrODFTvavXo/ab7nNO+pR189SLjGCzZPVbnYb95ioRDhxB
         p49CLdU91pRXena1WflVRfXAJe83YUOl76EOhVaD8rqsePWlz6+HnZvIoK9xm3UFVMz2
         FzaU+USpbvv30K798ka/tHJpXOHl8FVbVYPzuQ2dInlc0eg0Gd1vUPf0rzKwQEjYYYLM
         0pcbca7HWijevvDmhJC0XiCpx0KoKg2arZtUny9xt63+sC15zoYkf1eJZ738JWB5/P3h
         v6Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sU/mku+8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16-20020a05620a249000b00706a6fdfa3asi5025179qkn.544.2023.01.19.02.14.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 02:14:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sU/mku+8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIRot-0004Y8-Jh; Thu, 19 Jan 2023 05:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRoC-0003yq-QY
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 05:06:15 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRoB-0005HT-5t
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 05:06:12 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso845426wms.3
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 02:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vGJD4ga3J8xHyk3OZlII0Hth91GC6i661lSTuntqoMY=;
 b=sU/mku+8bdAPvPh/NwGYZAIvmwLPGFZ3THFdmBM7LeshJlWO5fDPuyFzYLHBRshbLu
 9p5TKwQAmNc1mcTFJOeu9pYx34ALHT5bwEyQoQVWSZWdxMwp1GxJZx5IEtBVXhumN97m
 m+9fohXi5pvZDEjvZbGQaNsHZH7xpvWFgGe2/I64RgTjd2v8pEQp4SrcHzolhdQKoXn/
 G9wfg4olJdyZGqc1o/f6eYezrY5/Obpp7K0TR+14pij+LnncAAdnhP6sAKpU69pHqjdD
 9jI9QO47sVmj6d27s94IS82Bf1psyz0NJeyJfETSw+Ls8rf1s2QJDkPXVzSqxriPKUeR
 kGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vGJD4ga3J8xHyk3OZlII0Hth91GC6i661lSTuntqoMY=;
 b=DO8WKYIrpepSI9pV8jl4AaCz+T6hHhZPoaEooQq2tLLDhRTN/9xQHgqBYaGEMkrau9
 2glevv1CUqL8M63n7n7HYgOTxi/qHMkMBaPw5NtNQej47wE75JmXDHUeInUiH7TMB6pl
 E97DmIbrN7zjPQRetkGM9mdCWSpwUiA8k0/TwEthek1FNaTQB7NgJzI65FW60RzV6j63
 VypcGHxKMz0N8mJXVMVRLjc/cnxsOiD6q2gZYa1UGgzCgoYHTJEQdaaRFhhPoEXxqMwP
 0gfe2EpGlZ110B+9JgZgFiHYfLabRfSyk2d2CZmU7zdFy6q5/+UlGHr9o22eMyJ2H/cA
 mHhQ==
X-Gm-Message-State: AFqh2kof/wM+S2ywfN0pyEWVgzQvg8HEvX9dBmi8iSj9Eid8D9fUDMMv
 Vg7n3/1KfXdBKdIOg6px3q4ZIA==
X-Received: by 2002:a05:600c:3b29:b0:3da:f678:1322 with SMTP id
 m41-20020a05600c3b2900b003daf6781322mr10067606wms.38.1674122769486; 
 Thu, 19 Jan 2023 02:06:09 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bh25-20020a05600c3d1900b003c65c9a36dfsm4526130wmb.48.2023.01.19.02.06.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 02:06:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 6/8] tests/qtest/libqtest: Allow checking for HVF
 accelerator
Date: Thu, 19 Jan 2023 11:05:35 +0100
Message-Id: <20230119100537.5114-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119100537.5114-1-philmd@linaro.org>
References: <20230119100537.5114-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: bzwSUHHx6jgz

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: CONFIG_HVF is poisoned.

We could pass host config definitions to qtest using:

  diff --git a/meson.build b/meson.build
  @@ -2547,6 +2547,7 @@ foreach target : target_dirs

     accel_kconfig = []
     foreach sym: accelerators
  +    config_host_data.set(sym + '_QTEST', '')
       if sym == 'CONFIG_TCG' or target in accelerator_targets.get(sym, [])
         config_target += { sym: 'y' }
         config_all += { sym: 'y' }

Then test for CONFIG_HVF_QTEST ...
---
 tests/qtest/libqtest.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 6b2216cb20..31650bdc9f 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -901,6 +901,8 @@ bool qtest_has_accel(const char *accel_name)
                 }
             }
         }
+    } else if (g_str_equal(accel_name, "hvf")) {
+        return true; /* XXX CONFIG_HVF is poisoned... */
     } else {
         /* not implemented */
         g_assert_not_reached();
-- 
2.38.1

