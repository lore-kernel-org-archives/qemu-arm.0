Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp801222ejb;
        Thu, 19 Oct 2023 14:21:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX9kjHxjgrJKiX9rDVuftR6NBc69qQezIC4zZOiEG8m7FA89q/k2hq/Od+fpj5R5k2jBGG
X-Received: by 2002:a05:6214:19ec:b0:66d:18ab:b47d with SMTP id q12-20020a05621419ec00b0066d18abb47dmr61433qvc.64.1697750517318;
        Thu, 19 Oct 2023 14:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750517; cv=none;
        d=google.com; s=arc-20160816;
        b=g5ZFx1xVJsIuUTsB+TTHc+Zh2AUI4pfz+iIr8LHOCE1kt8sPSr1W9FdboRLEa5bXei
         3499ALFlrfKy21WmxcApXh4rOtxv+nKsUqxNjIXqo4JSloiAAlASnNbd6LYfAWPkUQ5t
         bkucJ5+GYwOQRwhZHFBHXFGMwgofbQdi7mZYi2/nhPXbfou/wbMKD93Qs40Bq+WpZg5c
         zeJFbjGHPgoLfmOu7AOrlxhQuqCQLz+edYUUIrCxyaOXJTZhSxhq3eZDRZqywJLnG92n
         SwAbJM+PDLmeNtmBltU7M6M0wG3jPin025EzgEit1zm+u1T63K42EKs0dEb7yXJuOcVx
         XCpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TF53WRurKJJRsNtHQwV6C2hpFVA8ru1RM8pOdggQzFc=;
        fh=WMYVDPEVgLeItH8gWOkBDbvMSqUUAVXxQBAwvOYWap8=;
        b=QJle49SY+ITI5rkVTgrf1t1B3oDyIHrnB3sXtVhdey/8HGmLALnFRzfQD5EV+bkzTI
         kNzNSpjaTLwBLGyzVltiIaNtQI0Ky2fx3t48nQPSIDLymxmb+736/1cZnLb4h+ZTalj7
         rcieHs4Iu+n6F9C4U6HwyN8m55EULQf+CvzzI11/7MJJPbbYZBaK3xKHw66mZIlNqgUS
         g3YtOwF6z1tDCoJ2gsyP5FsgWo2VVFbSIs+ESDKhXhSP4jXtzoMFAawXRdTR6maGAItb
         mvuxcmW5Uk8kv+Ov6H+N5W6adAsM3w2u7Wk0SYG83i8Zo9See0CNLw8B+snFogU0Jsbk
         W6Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XGL9SjUj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a25-20020a05620a16d900b007672ef90bd6si231924qkn.556.2023.10.19.14.21.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:21:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XGL9SjUj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtaQF-0005el-IP; Thu, 19 Oct 2023 17:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaQE-0005dq-H5
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:19:14 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaQB-0004zs-Te
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:19:14 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40837ebba42so1064675e9.0
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 14:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750350; x=1698355150; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TF53WRurKJJRsNtHQwV6C2hpFVA8ru1RM8pOdggQzFc=;
 b=XGL9SjUjp4RnXicJhvC+Ia522Nuzf4htD5YZRDyh7oiHHG+rBaTKeV9CqLwTaVZ5C9
 AbzzAlWHFyWH7xp1oY/SKqDojRrbE6JUnZjSMHY7Cct6Xvrsetjzqrhm7J320TD7pGgE
 j15vucvuJ37+TmOn3sGBLfi/6JTMRoiGrOZKy6qQ4UWqmhpD6PHBo8kHtFg/2Px1bJZX
 sZ04RIi27tpnWHsokv5Ygnt2GLYb4pLjlUjP4Y4vlleSii7Qtnt2hquEQwC0sT4ZnJ2S
 Pt0ddurjj/VgMAUgHSzDet4lX1WsPeqSPKw29Eznf00sMy+s4dadeCilIsxqi0BoyRf/
 WAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750350; x=1698355150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TF53WRurKJJRsNtHQwV6C2hpFVA8ru1RM8pOdggQzFc=;
 b=qHsqIiSH3d4xe9cqvK13YzYxdukeaZqP6BDTgpe8uqdMzqQE2qZ/5n+XRV7B9CKy6m
 rbBdo43J17RzZaDvX5HV2zjfEGgl0XM00vaL06LPJOAqK5duyrJhxb/tOPInRJWGEYIP
 uA7hsSi8dQHmDpwT2pUlhmIs9noAizgFOUVQ2bsG0LHuRncdpZUc3DXKYTvkcVDE//cq
 Cy/5lawaw3Lj0b2nGqX4wS2RYKzuDLdLIF3Axlk/4dVZwcx6YICNJEFtrnZCrdsnQXam
 IUiVDYfxJXS4BuURQ1EoZ4NEVPJX4gC00IHtZwSRvfgOVq/sCqh4oKxaZsmIqLe0a+yK
 +YpA==
X-Gm-Message-State: AOJu0YwCA6z3SmwmoypZAdWEf+v/BwTscxe+YULVQlM9yx6aDfyKwzrX
 GLGV7FlRhATeaMxpcHA6tTeeFucH4/57wLeun0ixeg==
X-Received: by 2002:a05:600c:3b20:b0:405:4f78:e128 with SMTP id
 m32-20020a05600c3b2000b004054f78e128mr63402wms.4.1697750350299; 
 Thu, 19 Oct 2023 14:19:10 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b004053a6b8c41sm515635wmq.12.2023.10.19.14.19.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:19:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 08/46] memory: drop needless argument
Date: Thu, 19 Oct 2023 23:17:33 +0200
Message-ID: <20231019211814.30576-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 3sVxDbeLV+66

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The argument is unused since commit bdc44640c ("cpu: Use QTAILQ for CPU list").

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231009075231.150568-1-marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 system/memory_mapping.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/system/memory_mapping.c b/system/memory_mapping.c
index d7f1d096e0..8ba9968f8c 100644
--- a/system/memory_mapping.c
+++ b/system/memory_mapping.c
@@ -291,7 +291,7 @@ void guest_phys_blocks_append(GuestPhysBlockList *list)
     memory_listener_unregister(&g.listener);
 }
 
-static CPUState *find_paging_enabled_cpu(CPUState *start_cpu)
+static CPUState *find_paging_enabled_cpu(void)
 {
     CPUState *cpu;
 
@@ -312,7 +312,7 @@ void qemu_get_guest_memory_mapping(MemoryMappingList *list,
     GuestPhysBlock *block;
     ram_addr_t offset, length;
 
-    first_paging_enabled_cpu = find_paging_enabled_cpu(first_cpu);
+    first_paging_enabled_cpu = find_paging_enabled_cpu();
     if (first_paging_enabled_cpu) {
         for (cpu = first_paging_enabled_cpu; cpu != NULL;
              cpu = CPU_NEXT(cpu)) {
-- 
2.41.0

