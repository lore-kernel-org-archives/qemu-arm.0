Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1433570ejj;
        Tue, 26 Mar 2024 08:47:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWQWGWN0Taef2nE8kVnIzNjn2Zr+X2brtUCMeTDsBvapvHrRvFKxuX3JtPGwfyMYZvhBEOkoloE7idFpLFdUZYAt9bKxPk
X-Google-Smtp-Source: AGHT+IGs2bp2oCxq9jOg9N4YdFxkehjQRrACNmTNx7fhy4RVIoLfomh6sd6KG0+T/7+uJq4zrTnT
X-Received: by 2002:a05:6000:151:b0:33e:c271:8ca3 with SMTP id r17-20020a056000015100b0033ec2718ca3mr37670wrx.10.1711468063937;
        Tue, 26 Mar 2024 08:47:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711468063; cv=none;
        d=google.com; s=arc-20160816;
        b=rrhAZdpdtsxsA+2+15T1krgZG2XO/qKcNTrOIONlGrw3VbG4aODxHr7Xql/MsJkBVj
         kP5KKpXduog5wsl0RIS4cy4IBgrkge5qyoEMPN+HqG3a5wzIIprezjPcDvL/DLJLuZq5
         HUUqBj1p+fkE4M2i/XYzBJn/MrThLFA4uoEQ1nNmvuQ9vEjyFL2ba0cHvtoNy3SEvr4N
         mCmjG58Ni0HgzhIPToWGGKnYFPoCYLWJf1OEF63teR1Z3NqduO2XHbiJvJA1Z9QZ3jnk
         Vm4gfd66XwAtoWjaqkRxoFO+TBgafN8qYIPEVhpxVxKkg+vttapXf4AWclcQjP9TKZt8
         i1ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pTnsklKw4fWTCEXstwwApylL5b79xPCluS5bdtq/AP4=;
        fh=8fwwG4jf5s+vp2LxKfvGZcFOYvMbRyHUPH92VDUPV1M=;
        b=oBnNI6benjCdsTRDcvjqOKT7D82hc7cT4YxyYQnIYJ+jiNZrAvPHjvYqRQERuHe8cu
         2LxuAeWw3ehvYLZ7RrCP9BYrwtP/x47/gfB1csUiviGu/YNUu7kwHoltzqIeFI09F0Zg
         bCmp9qO93+83Gvv8Efi233gzppvRI3ZbQlruHNJlZzCyecWGFjGbDe0rBR3JlgyIJr/j
         71KLSbY7cLmbJrAmEm8OglvG3OdWtbKks0ujaGMbX/EkRvVEFDURGE635wEypZCrAowS
         SvbJPMYWYWHwhGRua066NESBUuqvNNyFfk0RAh+biJNz8tCdFGUH+dlfJgfqDq0NuXXq
         Qz/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K9kypSWj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020a0560001a4200b0033e7be1f2c5si5465567wry.230.2024.03.26.08.47.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 08:47:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K9kypSWj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rp90E-0004Y4-6x; Tue, 26 Mar 2024 11:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp90A-0004Ds-J1
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 11:46:14 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp908-0001JK-Ks
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 11:46:14 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-341cf77b86bso1462724f8f.2
 for <qemu-arm@nongnu.org>; Tue, 26 Mar 2024 08:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711467971; x=1712072771; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pTnsklKw4fWTCEXstwwApylL5b79xPCluS5bdtq/AP4=;
 b=K9kypSWjrfL9N49/W0NFOIIlz2Dnk9rtYgHDD6A1UPo93CPorPUdqVmjm6kgb6pr2O
 ZuDtGSzklFVjwXlOvepNxv0tv7EHRW9ndWLYhbvZBKNEJKw3G3sqh/NjSeLkNEqY3810
 lC/FZkOjdhaCgmmaGXaR0yLvPtpXg37ndUompjvycbESn9AEB3SfLm3FEeUVU8i9a1UC
 FL/if81txP+DD12rEucTkPTogqMX0JCVVr4lUnZc4f+qhgv9kWP0UtxgbS7YcTUioGqI
 8aHdJtGGmg9YCTjK7Udiyf5IkzFCclroIJUHFaunEgDmUZuQS2O0Gx9apk5FQYDC5pU6
 tDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711467971; x=1712072771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pTnsklKw4fWTCEXstwwApylL5b79xPCluS5bdtq/AP4=;
 b=PIVl8i1F/7S5GQW2MJU/4Jj4xeHvRWMAmgA3BpG2CYycEWtGlS9EToYTWss7YQtFvh
 SoesWDwHYnxUQrKZpC+77jJH5H5lTnq3S4kJrmUhuAVtzmRidPJMCqFr4l2BcsDnKvDL
 oSXxRUMKrT5arlwHYJYODSm/vGBihPMEAt0PsrltwPrnz43m7PnEU17dRrxhNTQdst56
 F/raSgamZlRlB0B5zwrGaCzkByPB1hzDf2ObKkMKNIfijrx4H7ISOr6bJV+Gv3x4a2yG
 UJIlxBJ94oVxeCXoHQTRIsXH6Ul7gTyFEt3IQP9xrnxf4oP74bD1ZEWG0ddafLkFuJyu
 Hf2g==
X-Gm-Message-State: AOJu0YwBgFMPLdu7y1B8T4V/djUnXyRjwumz7QUrQ7H8yrpAJ9IlpjRt
 kYALnROIJ95DLBywBuYAXfpCZSvHt1g3a0qNbXpTVYDt1VUGm2PhZO7G8CwKjn8=
X-Received: by 2002:a5d:5b88:0:b0:33e:c0a9:79c with SMTP id
 df8-20020a5d5b88000000b0033ec0a9079cmr24223wrb.23.1711467971342; 
 Tue, 26 Mar 2024 08:46:11 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.229])
 by smtp.gmail.com with ESMTPSA id
 dv13-20020a0560000d8d00b0033e25c39ac3sm12463085wrb.80.2024.03.26.08.46.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Mar 2024 08:46:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 11/13] ui/cocoa: Fix aspect ratio
Date: Tue, 26 Mar 2024 16:45:02 +0100
Message-ID: <20240326154505.8300-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240326154505.8300-1-philmd@linaro.org>
References: <20240326154505.8300-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: 98oiaUVaIRQ5

From: Akihiko Odaki <akihiko.odaki@daynix.com>

[NSWindow setContentAspectRatio:] does not trigger window resize itself,
so the wrong aspect ratio will persist if nothing resizes the window.
Call [NSWindow setContentSize:] in such a case.

Fixes: 91aa508d0274 ("ui/cocoa: Let the platform toggle fullscreen")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20240323-fixes-v2-1-18651a2b0394@daynix.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 ui/cocoa.m | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 810751cf26..17e125d66d 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -519,6 +519,43 @@ - (void) drawRect:(NSRect) rect
     }
 }
 
+- (NSSize)fixAspectRatio:(NSSize)max
+{
+    NSSize scaled;
+    NSSize fixed;
+
+    scaled.width = screen.width * max.height;
+    scaled.height = screen.height * max.width;
+
+    /*
+     * Here screen is our guest's output size, and max is the size of the
+     * largest possible area of the screen we can display on.
+     * We want to scale up (screen.width x screen.height) by either:
+     *   1) max.height / screen.height
+     *   2) max.width / screen.width
+     * With the first scale factor the scale will result in an output height of
+     * max.height (i.e. we will fill the whole height of the available screen
+     * space and have black bars left and right) and with the second scale
+     * factor the scaling will result in an output width of max.width (i.e. we
+     * fill the whole width of the available screen space and have black bars
+     * top and bottom). We need to pick whichever keeps the whole of the guest
+     * output on the screen, which is to say the smaller of the two scale
+     * factors.
+     * To avoid doing more division than strictly necessary, instead of directly
+     * comparing scale factors 1 and 2 we instead calculate and compare those
+     * two scale factors multiplied by (screen.height * screen.width).
+     */
+    if (scaled.width < scaled.height) {
+        fixed.width = scaled.width / screen.height;
+        fixed.height = max.height;
+    } else {
+        fixed.width = max.width;
+        fixed.height = scaled.height / screen.width;
+    }
+
+    return fixed;
+}
+
 - (NSSize) screenSafeAreaSize
 {
     NSSize size = [[[self window] screen] frame].size;
@@ -536,8 +573,10 @@ - (void) resizeWindow
         [[self window] setContentSize:NSMakeSize(screen.width, screen.height)];
         [[self window] center];
     } else if ([[self window] styleMask] & NSWindowStyleMaskFullScreen) {
-        [[self window] setContentSize:[self screenSafeAreaSize]];
+        [[self window] setContentSize:[self fixAspectRatio:[self screenSafeAreaSize]]];
         [[self window] center];
+    } else {
+        [[self window] setContentSize:[self fixAspectRatio:[self frame].size]];
     }
 }
 
-- 
2.41.0

