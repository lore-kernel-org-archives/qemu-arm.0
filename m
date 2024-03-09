Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp368331ejc;
        Sat, 9 Mar 2024 11:24:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXrs77/QvuHJie1C5ifBrAjZke46xNNyGu/wXdhGsZAvgCpwQmf/91t9nDM0qDKXYbHhMAiMAsW5NOeAliEa4H3wPGvQcza
X-Google-Smtp-Source: AGHT+IHA2UqxcAA6tyzc+EHD+mTG5u0MLxOPCZKaxPGP3IeMy1ssWYX7Hygr6bp1pW/fpsN44D9S
X-Received: by 2002:ad4:5004:0:b0:690:99de:c3ff with SMTP id s4-20020ad45004000000b0069099dec3ffmr2770291qvo.28.1710012296936;
        Sat, 09 Mar 2024 11:24:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1710012296; cv=none;
        d=google.com; s=arc-20160816;
        b=jpT+y53xI6v4VlcUAMhVrMoT2hmVQA4yso6FvFV0Y7XlCtALqKvMK5VTrfQnjqo2io
         vLOckfxF0qakXEL3HSMw3I/PFO336D2KpWjM9gibhuIdwarWeERQYtTbznHSkAn1omYu
         I42M70Y4rDp3Fi7lKjv11WDFidnXXW4cHq7ylouAh1RgojW+UmeAsTBu99aiDcFSXQo/
         xC3VxB2aQOjgw5yzKJDlIN5ShqoX9QS7Sz8sYII0AaH48GzVZgdfNFSbrtqTQcT7H0i8
         lzkCCSkSlg8o38Q8oaziXxFoz0gfsDaHitxiI1nKSP2P5UDKFZK/+Xl1aW1onbh4erqj
         4fHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AJ+tmUmaxk1VpVXptMjtzEM2Kqe3+MxYTD28YtS2upg=;
        fh=LatWI0iv3shmjhlZgdI1Q3YwKN/K/wAUD1GWT6tWaCU=;
        b=lUmoXMjttu0TBBV/vRBDxFC4r4h/D98IxKHy24qwwfFWq6e5XVE+cf3Ym1iIfNqCVu
         fJuDIPcPzObj03Uua99P8iWFzPeV8IOJXlJpftXVaJBF7FtYc5jqugZk4eMSW5woYnr3
         AfJC0alrE1sn3zBu5JmZbMZ74qksUMyweTgA40wWTEnURd2MM+HeuAe5EdpL9OeTw6p0
         p9VBcYzvP9CwEsGV1EHHCZlQi74xpYO+DWMgEwZo5uyo/PgAddtlSYALaaB61BgYcRRG
         RIfXLsaQrOS5R977VvkwmH54F0l/vmC1Wgkz9drg1IW9w7Pf9vczXoZb8Ae3Hoq3NM6Q
         sx/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fvCZl1qz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oh7-20020a056214438700b0068ff09d8b69si2094020qvb.197.2024.03.09.11.24.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Mar 2024 11:24:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fvCZl1qz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rj2H4-00008M-EC; Sat, 09 Mar 2024 14:22:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2H2-00007p-P0
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:22:24 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rj2H1-0002R1-69
 for qemu-devel@nongnu.org; Sat, 09 Mar 2024 14:22:24 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a45f257b81fso194791266b.0
 for <qemu-devel@nongnu.org>; Sat, 09 Mar 2024 11:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710012141; x=1710616941; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJ+tmUmaxk1VpVXptMjtzEM2Kqe3+MxYTD28YtS2upg=;
 b=fvCZl1qzhpAzWfi5gSdtuZaioWkP82AO+e2X1JVsKWcbp5Syc3VSbo3NtQzv6XkRFM
 CG0K4Mv5xVwR4kePOt+oBVAzUfjPFk/Qx52DdJNGEQUaMLbMHW7e349pVTJjlb1O1q0+
 eDYpMmn1rdh40T/e1o9CilmGi+80uV47xGcdDrw7bw8EC6/quSvWZBFncK4OY7SGdvYi
 wjmHtsfV/ZYbXlp2rhHk+5Tnqjb1hLnEb3iONv4GMMQLuc/D5IZCreRA60kJ5Q4Eunc8
 VqxWkhRQ4COQP6qB6CgPO8iRybNyv/3a5JJKASycc/5n2UY5FSWDIvy4nzWhW+BdArx9
 QPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710012141; x=1710616941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AJ+tmUmaxk1VpVXptMjtzEM2Kqe3+MxYTD28YtS2upg=;
 b=XnlGAGvk5x+QytgnJXNEWpWgR5TokQNVF+hm2DmSdyAfRJsZO5bWfAZ0+tvLhbCwsJ
 FUIm57PwTpTJzoEOGIreUK/i+W/1sj1QRHU4dRzO0E/cG/DMiEoAE9FiMbSBC+wwOclM
 Gce8P4A35H9YIgLOBTRGgwTbG4p8fkQwoYLKtD8GQYRd4erK/EfJWNbAIC0W+YS/Q3b+
 umWsaI/il/bqtVjtPnAvYcjspnwUJLXAU7vt8DLqfjA6Hq3yfmhTyJewIr9Fa98O4lfZ
 2tsMbplyRRy+ZOqYL/N4Lvdnyr+Mw9EyLj9Edm17rbTwoCy+JLmbwWjjdANSlWAvCd1o
 1StA==
X-Gm-Message-State: AOJu0YzVz21vvA+JZ9JxoT7ZH3eYX9mDjeqvFG2FiZlri3uYManocttk
 slfCLFFYUm4VJqG+wHqm7tJ4RrZ8kjMCtHr5QbLupnFsGmor81atuML4Jdqn6f4OxFgH6/DjcrX
 P
X-Received: by 2002:a17:907:a4c1:b0:a46:172c:e9cf with SMTP id
 vq1-20020a170907a4c100b00a46172ce9cfmr223212ejc.61.1710012141400; 
 Sat, 09 Mar 2024 11:22:21 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 qk2-20020a170906d9c200b00a3fb9f1f10csm1162016ejb.161.2024.03.09.11.22.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:22:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 01/43] hw/i386: Rename kvmvapic.c -> vapic.c
Date: Sat,  9 Mar 2024 20:21:28 +0100
Message-ID: <20240309192213.23420-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 2RP2GqOjehvT

vAPIC isn't KVM specific, so having its name prefixed 'kvm'
is misleading. Rename it simply 'vapic'. Rename the single
function prefixed 'kvm'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230905145159.7898-1-philmd@linaro.org>
---
 hw/i386/{kvmvapic.c => vapic.c} | 5 ++---
 hw/i386/meson.build             | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)
 rename hw/i386/{kvmvapic.c => vapic.c} (99%)

diff --git a/hw/i386/kvmvapic.c b/hw/i386/vapic.c
similarity index 99%
rename from hw/i386/kvmvapic.c
rename to hw/i386/vapic.c
index 61a65ef2ab..f5b1db7e5f 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/vapic.c
@@ -747,8 +747,7 @@ static void do_vapic_enable(CPUState *cs, run_on_cpu_data data)
     s->state = VAPIC_ACTIVE;
 }
 
-static void kvmvapic_vm_state_change(void *opaque, bool running,
-                                     RunState state)
+static void vapic_vm_state_change(void *opaque, bool running, RunState state)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     VAPICROMState *s = opaque;
@@ -793,7 +792,7 @@ static int vapic_post_load(void *opaque, int version_id)
 
     if (!s->vmsentry) {
         s->vmsentry =
-            qemu_add_vm_change_state_handler(kvmvapic_vm_state_change, s);
+            qemu_add_vm_change_state_handler(vapic_vm_state_change, s);
     }
     return 0;
 }
diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index b9c1ca39cb..d8b70ef3e9 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -1,7 +1,7 @@
 i386_ss = ss.source_set()
 i386_ss.add(files(
   'fw_cfg.c',
-  'kvmvapic.c',
+  'vapic.c',
   'e820_memory_layout.c',
   'multiboot.c',
   'x86.c',
-- 
2.41.0

