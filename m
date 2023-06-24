Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp193809ejx;
        Sat, 24 Jun 2023 10:42:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5EM+cLDc3XA3BNaHQBM9d1JYbUkgK9Dvzwaqw3q2lexNV6cE6S/JQq5w4knBKg9eLtudkK
X-Received: by 2002:a17:90a:8b94:b0:262:cdb1:24ff with SMTP id z20-20020a17090a8b9400b00262cdb124ffmr594163pjn.23.1687628530448;
        Sat, 24 Jun 2023 10:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687628530; cv=none;
        d=google.com; s=arc-20160816;
        b=STUTAfZFm2c8lSocpLqy+nRRH/ZkXTO0XoOCEPll5libzCeQYXtvaj05XsL4q+3DYl
         IiHtIR+Pr4gt6ZPYQPDyuyd5Gwv1RgUi3q1asnT5wfeF9tzfbJNJXovBbS08fImMsSdO
         QrW+1WTdbWqqx4Mb1Mha4K+mJR3d0oku2FLK4wiI3QHk0TpZYnyB9uG8GKcY4WtlfhA5
         WwKQ66vKYGvs7jUtaBCJ7hmaSZPLE1lgodXfcrliO6VvypDCS8/GfgO1LQ72GVbQ3+Uc
         wE2LbLlHp9lErNriNBG5qhpqdm9lyW0edWJfA0igByleErYunqZMHilqBK1FQfZMa+7Y
         BVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=iCloP/Ux3IV8UJ0ZKXn7/ebp5dcIIh/2RC3mzeqRGMo=;
        fh=dxlO8U8n9FJbkfu3NZ9xTJMkF/Fn5IQj359CkmYw0tg=;
        b=DU/J0/A0WCW1pfNo1ky01XBrI3YTkBgRDz7SSKXRJKFOrCWQs5wSRoFOczbiE1Dxah
         7fU8JxiYeTwAOYA26mJkB6OPpDlEs1P1xqAEwUXVlgwiAPtN1RCc42SJIj8bEPqSIBpI
         HUJruXkcSMNVbU7ZtOmbUdby9ApHeg5egUaOEbfjtzEmO7/CkESqZhY7AJsYCxihIWu6
         2Hpm8bQ658lbFMD/oKHijyeXNIvYnC85oN6eWrM2wN7IyFaTgXHtIbXaMzHpireiTl63
         MEmLcKgKq7iecZiawtH9qw6LKrrtUSHIaPVRlzCxWujYO7FYxbh8crxKBys3lxPNkq4V
         q1HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B5Q6wTHD;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id i9-20020a17090a650900b002509d96227esi3992367pjj.173.2023.06.24.10.42.10;
        Sat, 24 Jun 2023 10:42:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B5Q6wTHD;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233157AbjFXRmH (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Sat, 24 Jun 2023 13:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbjFXRmE (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sat, 24 Jun 2023 13:42:04 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12FD91FF9
        for <kvm@vger.kernel.org>; Sat, 24 Jun 2023 10:42:02 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f9189228bcso17654945e9.3
        for <kvm@vger.kernel.org>; Sat, 24 Jun 2023 10:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628520; x=1690220520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCloP/Ux3IV8UJ0ZKXn7/ebp5dcIIh/2RC3mzeqRGMo=;
        b=B5Q6wTHDnyh2KH0MiJh6f7PRNtQ407iOhYbCWpAuAn2/F07ZIUhbhg5RZhnZx5aixo
         krIptOmRDGX4i+JQ48AmPyA0UMgIN9bZPYWdqQc0zCDEP4Do4gFa4VBPEK3TV2G/qjyK
         TxY+6y3B+iWbYRlATMU2lY1+o9i90v/HVZQYbeyLm6UdtSQEpYHVUcZ5fxK5VJ1NnEYs
         iy0BtiVzJy2t5b9awonbad36/jZG14S8MSTnthMeJln51zyNicO+yZr+ObXx88p69pnr
         S1aw9y9Wlm9wze65oBQ50fPz5m5iQqX+190XTv09khKKIIEk79oKUf1Nr2TcLzDhZUZR
         Grzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628520; x=1690220520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCloP/Ux3IV8UJ0ZKXn7/ebp5dcIIh/2RC3mzeqRGMo=;
        b=KStL+Sc3lWg8tlgVULqRHAjMvswXIynoZdwBjiogTDV406mjNsarNS0ufOmnY0HHMw
         v3HMYw0Cb6lYADcjOGh1hp9SWWe9aPHMLJt76dcnuyWGKFOcTg7JfU0E9wep9ngzbWeJ
         ytICzKkFVwOH82wOy1UqBD4+xTKJ5i6zMcshUfAjdfW9UxTccWYQH41jAjUe7oMNAnxn
         iBB57JB6CeWkF5wGIfszN+FJ8WCFG36l+V1F9P+iPzv/KKyeq5iOBO3HjS27Y8T0cEEM
         9bB9EFPCSPm/HdhP0KZdHwoRzO3UZdeZsSAlRYZeE5s4Kc2UanTmWKLtvi6ekhAGXkde
         5mnw==
X-Gm-Message-State: AC+VfDx+w3XVA9BKk8uPMRrF0YeUZJ/j/APf6zzWO9QrdVnsXKwfkB1B
        4VHyiszHSjOTzgHUr7NrgXZUfw==
X-Received: by 2002:a5d:5242:0:b0:313:deda:c444 with SMTP id k2-20020a5d5242000000b00313dedac444mr1551101wrc.24.1687628520556;
        Sat, 24 Jun 2023 10:42:00 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.150])
        by smtp.gmail.com with ESMTPSA id u18-20020a5d6ad2000000b00313e90d1d0dsm650617wrw.112.2023.06.24.10.41.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Jun 2023 10:42:00 -0700 (PDT)
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
Subject: [PATCH v3 05/16] accel: Destroy HAX vCPU threads once done
Date:   Sat, 24 Jun 2023 19:41:10 +0200
Message-Id: <20230624174121.11508-6-philmd@linaro.org>
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
X-TUID: W5z+Qp64KCKl

When the vCPU thread finished its processing, destroy
it and signal its destruction to generic vCPU management
layer.

Add a sanity check for the vCPU accelerator context.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/hax/hax-accel-ops.c | 3 +++
 target/i386/hax/hax-all.c       | 1 +
 2 files changed, 4 insertions(+)

diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
index 18114fe34d..0157a628a3 100644
--- a/target/i386/hax/hax-accel-ops.c
+++ b/target/i386/hax/hax-accel-ops.c
@@ -53,6 +53,8 @@ static void *hax_cpu_thread_fn(void *arg)
 
         qemu_wait_io_event(cpu);
     } while (!cpu->unplug || cpu_can_run(cpu));
+    hax_vcpu_destroy(cpu);
+    cpu_thread_signal_destroyed(cpu);
     rcu_unregister_thread();
     return NULL;
 }
@@ -69,6 +71,7 @@ static void hax_start_vcpu_thread(CPUState *cpu)
              cpu->cpu_index);
     qemu_thread_create(cpu->thread, thread_name, hax_cpu_thread_fn,
                        cpu, QEMU_THREAD_JOINABLE);
+    assert(cpu->hax_vcpu);
 #ifdef _WIN32
     cpu->hThread = qemu_thread_get_handle(cpu->thread);
 #endif
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index a2321a1eff..38a4323a3c 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -209,6 +209,7 @@ int hax_vcpu_destroy(CPUState *cpu)
     CloseHandle(cpu->hThread);
 #endif
     g_free(vcpu);
+    cpu->hax_vcpu = NULL;
     return 0;
 }
 
-- 
2.38.1
