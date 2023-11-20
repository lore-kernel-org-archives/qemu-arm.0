Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp66987ejy;
        Mon, 20 Nov 2023 13:39:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3qgah91kvz/BhJwtrmeZBhrcEq7RCbJmATL2Eyru4OX4OxAXhd7/Cbtxq/bnrim4w6rUE
X-Received: by 2002:a05:6214:2484:b0:679:e77f:5e89 with SMTP id gi4-20020a056214248400b00679e77f5e89mr2457673qvb.12.1700516344817;
        Mon, 20 Nov 2023 13:39:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700516344; cv=none;
        d=google.com; s=arc-20160816;
        b=yNB/K98yRlz7c1KKb8Grx6NllqeegddUAnbizuTOl8s6obej9can+24yhi+tdc1mce
         UTvCWA1IKMe2vidrzdgEpVOy3ke7sTrzH+vTtiI+rq3zUGxlkrCp9uHfVMqG/3ruzSm/
         JEI8Uma4GJAcIbmFW7CUbSH+P04ojPxR6eIsKRpwi06P+yCAxbtRDDubjYiWMzk6l80c
         SNPrNSHR7VAqvZofgymCdEIAK9ximZk4ZUDfdl09RUljZu4sbKT5zry7jpOtYIF1sN8/
         7p29pfXE5/WA6d56sYSm0wcyqkWYU8MbgopxxCTJMeZScsz4tCuX7AU84/FNmVQ0s2EP
         wAMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hOzYF2dzBcuolmQzvvXqLCwUi3E1rapeqqZCPtHm/3E=;
        fh=toXMQ9nuJ3L4CLQ8EKaTQ8L/ltDlD3GauRZSJpgYVzU=;
        b=ojSpN4xh/dcwp0eNrDjlZTFvzl1pcCsxRBEQ1nnAhMgu91OpDjUhOCSAQzPNdW2YTz
         Z08na/g9LwWl9N6Px12wCvGigpj5NLjcaMGadmI7Fqh/97Gt5pOlM2/pX3KFLQWqDPt2
         7bFTeR1NarZvUNQZNEWO6xiWessEtYD9hZIq34EHvpUAsS/9FDE694Beh2aAPWXzVo90
         03dTBQBQbOkTVefgFm+y0HLxAsRy3Z7Ly6sz8N8XDIIgNTjrk2/Aug/2HggrqJ24lwM9
         ijiFSCIlIG63ThXgohNxNvirWyMglC5CMxLhCq3GotnfKVkHJHKcJOixoGUZHPLfL1xU
         L3LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nU4SQtss;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eb7-20020ad44e47000000b00679e0197f91si1703662qvb.167.2023.11.20.13.39.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Nov 2023 13:39:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nU4SQtss;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5BwX-0007Vv-3b; Mon, 20 Nov 2023 16:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5BwD-00075q-NK
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:36:17 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5BwB-0004FP-Ls
 for qemu-arm@nongnu.org; Mon, 20 Nov 2023 16:36:13 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4083ac51d8aso20293195e9.2
 for <qemu-arm@nongnu.org>; Mon, 20 Nov 2023 13:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700516170; x=1701120970; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hOzYF2dzBcuolmQzvvXqLCwUi3E1rapeqqZCPtHm/3E=;
 b=nU4SQtss+A5RcGRDcXNWpwmn6Q4k2ciTRipTM7zrxgPsJgPTSwiol5AjjsqAf4MnDn
 y3fZpZ82ayPHe8WFsz981bajPQzZWKWMGJ9apQeNY5f7d2JeCGgsxUzXsMkSTy8UYntf
 ng6xE7aDzFpsCMs/BrDiGq75cnPr7Mi9LsYNu4BJU+8YYp25abkKwNhdT+Pcnge6lWkd
 wxSYevVHiWP53YD8wy+8GVm7PY+cs8hMRaGmBxrNzcPy61Ip0hvsU3I9AoX1Tes3KLqE
 3sUWPgSlub0xwfpcowUZsLS7XSvnbOVyHGJWAnjbpy5KPBp6uV7/mHE14v9EVsDNiXOg
 wxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516170; x=1701120970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hOzYF2dzBcuolmQzvvXqLCwUi3E1rapeqqZCPtHm/3E=;
 b=oEwEHjOmMA52LQYNHbQ5ABPbYDTGh16jPuVU+viJfAwlUk8vieKcEDs+63PGFlUwZC
 Z0a6cW1AvjZpwEva8sWFv7ueAt2aC/huikeGLOIaTZBhkl9eoBesusDdTeQXLebnz9e8
 H4vqHqJmbx2LI54ol90asJ1yi0yD+vI1sI2A38+ordDnEe479XxYcQx2lKkJRTRWNz+x
 kuCKdxI5Q1rMIHfn63d98WTlhArHluPkDM0l13WSCBGry37fMXKgYxtIkpdWxUAN3jnG
 e6huYWz1OxIbKE/8ppLth9ajUoxe19fbCaDR9IVvZ1WntrCnf04uWkN/Ks9xjV0aWpYq
 cKVg==
X-Gm-Message-State: AOJu0YxCfpo0bGQD/gqgbWE8J7RhlFu9s6NX/xD276vzbjSn+UgbgzlQ
 fNh9HBl7+X/x3nN5e5r1fttWq6Y7uzIc8nkJmh8=
X-Received: by 2002:a05:600c:1c96:b0:405:336b:8307 with SMTP id
 k22-20020a05600c1c9600b00405336b8307mr7178838wms.7.1700516170346; 
 Mon, 20 Nov 2023 13:36:10 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.190])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a7bc8c6000000b004030e8ff964sm18674108wml.34.2023.11.20.13.36.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Nov 2023 13:36:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH-for-9.0 17/25] backends: Reduce variable scope in
 host_memory_backend_memory_complete
Date: Mon, 20 Nov 2023 22:32:51 +0100
Message-ID: <20231120213301.24349-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120213301.24349-1-philmd@linaro.org>
References: <20231120213301.24349-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: R3vTnAIlt2o9

Reduce the &local_err variable use and remove the 'out:' label.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 backends/hostmem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 3f8eb936d7..1b0043a0d9 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -324,7 +324,6 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
 {
     HostMemoryBackend *backend = MEMORY_BACKEND(uc);
     HostMemoryBackendClass *bc = MEMORY_BACKEND_GET_CLASS(uc);
-    Error *local_err = NULL;
     void *ptr;
     uint64_t sz;
 
@@ -400,15 +399,16 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
      * specified NUMA policy in place.
      */
     if (backend->prealloc) {
+        Error *local_err = NULL;
+
         qemu_prealloc_mem(memory_region_get_fd(&backend->mr), ptr, sz,
                           backend->prealloc_threads,
                           backend->prealloc_context, &local_err);
         if (local_err) {
-            goto out;
+            error_propagate(errp, local_err);
+            return;
         }
     }
-out:
-    error_propagate(errp, local_err);
 }
 
 static bool
-- 
2.41.0

