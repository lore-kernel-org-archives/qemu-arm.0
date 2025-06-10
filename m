Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1665677njc;
        Tue, 10 Jun 2025 13:42:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXBrt0Mw4ncOwe3klh4nXgFzo2tnGvdH4zgxWsoUiE5Tz9HduO0omssRgvyp9ieMvPY3FxihZn4QUaBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHZnjdMuQ276n+Irp9Y9bHnouYOx6akdqLq2EopuThjXxAxnkpQWdfii/WMwk/NEIwAV56v
X-Received: by 2002:a05:622a:4a11:b0:477:e2d:2ec7 with SMTP id d75a77b69052e-4a714c5a11dmr4948811cf.33.1749588135561;
        Tue, 10 Jun 2025 13:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749588135; cv=none;
        d=google.com; s=arc-20240605;
        b=GIQEeDux3NRdX49DleweuhdQcodEpHMvemWLQgEdVHSiaiKyoUYIypcJl7LxCAMIR3
         BNJbB7yVTkVSc/LZ7CnvVdIh4baYu40p8+niguJwt3tArEV/a7kTMNL/ebI2LPQzC91X
         CAffB9jovcLP8BQjd3UfVfJ0f9qqJOQayMx9xqbwFEkb1s34iLRuVHVVezwCt9RH7Acg
         HVgxBJvKJKrEJTzGi40zuSuEOSgORVV/q6e/sk8in+zVmgowyTCOq+RrYSVDDZjBS+aW
         T9ft467snQfpD2XQgDqV0HEMFhct3UpxSNLivv2Mw7AJJNVQa352rusIzYlIap0v3Mo+
         ZniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Yu15xTjUu7sbSjCZzNz4Y36AaOPlbj3ZUNiPok3KAgE=;
        fh=7mfqvvZe0j4lo8oqCXil4SDmJ9kbtBRhZII3b4KG5Mw=;
        b=NxZpolO+yn9ui0JTDXN0Rv2fsmZdaF6pFYJ6TSvd9a6vZdWxm3bpfnjB+xdiJAVYzI
         fjLYp0iKGp0Ig/YK5uKJ3RvNjLZhOoW5i8T0XbF8jyCxaJR+hWmb4TG99PO+rjKj40WO
         v4CKoMDOH4LmkYSXeBdo4YSigdxo9kQ1LYmW4MysoPB8hA+OgaCaWFGRn24eVq3RgkHx
         3neAYTQQqEqkzuwabUKTw3L7Bw+s+aP18g46/0m4D3rsuJvHRiKforwSszH4iNaYPCqv
         gNzWTy8qEWjBPWXFBTnCn9T/JZcA94uJtMamKpVw+TkTS2JioCuNajW2/Spg1JEbByse
         3qvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NdsBE+aO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a6198ac9dfsi111712641cf.440.2025.06.10.13.42.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jun 2025 13:42:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=NdsBE+aO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uP5nB-0006I6-Mk; Tue, 10 Jun 2025 16:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1uP5mz-0005qp-Vr; Tue, 10 Jun 2025 16:41:45 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1uP5mx-0003Rv-Mg; Tue, 10 Jun 2025 16:41:45 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9ebdfso10419366a12.3; 
 Tue, 10 Jun 2025 13:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749588101; x=1750192901; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yu15xTjUu7sbSjCZzNz4Y36AaOPlbj3ZUNiPok3KAgE=;
 b=NdsBE+aObjwdswskcETenp10inYIE8AZb9CZH2iTxy5hOIjWu0jSfotqkGHYkLMtnV
 asSqkB67vUAp3vCDnp4qMN4JXhAig05Rasl2K9hzA6YSkvlpl0cFJkHATSfkvGdJneLf
 SEP4m5qJPeqW7Ogy0COZtBF0qfYsMswHacvGazQKM5+Jcb0mtK4pNARXZqBfh8WuSUXo
 OJwONyI6+L7BsMXFHW+yxD9nIDdUHbxf5/4/g92GDEw4pC7PopUAg61flNadSLCmF+UT
 5m22XgvPfe+s2r637ZfCqThArDUVQgecTKmm3y6qzBKjNgnZUjYA0svsU90LpMu+v1nO
 QtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749588101; x=1750192901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yu15xTjUu7sbSjCZzNz4Y36AaOPlbj3ZUNiPok3KAgE=;
 b=UX6F8ffCH9NWlhpG44XwZHWT2q89gLShLpzKZZ48TQL8BAe35ODnTsM9LclJ2oP/52
 jjyLYlf/Bcv1rNBDNu9pqgqdLGE30iDmon4jY1r2cw/RskGOHW9y6ZS3DhvYGjwPnRw6
 6QfWsiLD7ZvSAZQrvCb7srO3XhFVgt7rVsomOSGREKcTawu/dbf1f76GV/9azPhKG4x8
 7NCjuWYn97I3F+aID4VxeqiFEJ46m4pH0BipvvYHnJR62wI6pWy4BjTDTsTKHS0Biyz0
 /U4LNi4En0Qj4OdCOWqIclTbi8GXCz+Ufcz4au5eEiRsjk46dNd0BtvDTery7A0DLvhX
 0LGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbhp68y9aMAKzJwvj+x1iwhlncKUYqk1hQ4H2OWOYiK5SokmW8Oiroj3B4NhEMWnAwdgQ8jphMXQ==@nongnu.org
X-Gm-Message-State: AOJu0YwNl32QD4pg+/TK7YPvDneYdN2l7e+AJt8QKPzukOseE7usQUl0
 F415AeNck56SlKrEEGPoybvDimeT3Pyn5b0V6cLzDLFxNQdy+5k+J97qQcBePg==
X-Gm-Gg: ASbGncutEyL2we37rISs4OFJjUMkD1W07gIZvNnwB8Gmzq03cCUzzSGcCONveKz0rry
 FH7b9vJ8x1w9T/quJi/QFsr+Yg8urMAiXwJ6O82t622d4bzaqFMUMJDjtkvJjDgyY1iqdeY38ZL
 pptL+VtzshkdxF6ipQk9sxwbT1ixKLqXq8cCevUhkBVYPsd2PFu2ORZK22uXFKhOsLP4wzWq83v
 gMXicYdON+sBHopgKxAxFH2tyn4uslk3Nmn1mkDHTJYqrv5Bntql0Ox8z+Xd50T26Za09g0xuJs
 uiiM/P/pKvYAUys6IPrlRcC8cZH6Qzy+xzq6LbDDF0ZjFMKziDHFsFkpjxd8GCRqKoul1PoQQfe
 1JaiqWuDeJBGCMr4SUAZhCJL5ANOoy97T7LTzeltLqS9/+SByiqtdYEt+zWO3cDpb2INE4KVayw
 /TXppjLQ==
X-Received: by 2002:a05:6402:254a:b0:606:ebd9:c58b with SMTP id
 4fb4d7f45d1cf-6084e695303mr99620a12.1.1749588101094; 
 Tue, 10 Jun 2025 13:41:41 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2cbf-5d00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2cbf:5d00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-607783de2bcsm6521847a12.68.2025.06.10.13.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 13:41:40 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/5] scripts/meson-buildoptions: Sort coroutine_backend
 choices lexicographically
Date: Tue, 10 Jun 2025 22:41:29 +0200
Message-ID: <20250610204131.2862-4-shentey@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610204131.2862-1-shentey@gmail.com>
References: <20250610204131.2862-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: bWMksw8W9weV

When changing meson_options.txt, this script gets updated automatically by QEMU
tooling which sorts the choices lexicographically. Fix this in preparation of
the ext patch.

Fixes: ccc403ed5844 ("meson: Add wasm build in build scripts")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 scripts/meson-buildoptions.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index f09ef9604f..73e0770f42 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -80,7 +80,7 @@ meson_options_help() {
   printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
   printf "%s\n" '                           [NORMAL]'
   printf "%s\n" '  --with-coroutine=CHOICE  coroutine backend to use (choices:'
-  printf "%s\n" '                           auto/sigaltstack/ucontext/windows/wasm)'
+  printf "%s\n" '                           auto/sigaltstack/ucontext/wasm/windows)'
   printf "%s\n" '  --with-pkgversion=VALUE  use specified string as sub-version of the'
   printf "%s\n" '                           package'
   printf "%s\n" '  --with-suffix=VALUE      Suffix for QEMU data/modules/config directories'
-- 
2.49.0

