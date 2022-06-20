Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp598573lft;
        Mon, 20 Jun 2022 10:57:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tbcQOq310OGoM1cM9BZUwb0X6aXp1wun91KMPbDlVKTwvNE5ikaDwT0vWgg2BlNed4YaF6
X-Received: by 2002:a05:6214:5190:b0:465:d376:1eb2 with SMTP id kl16-20020a056214519000b00465d3761eb2mr19747226qvb.76.1655747819873;
        Mon, 20 Jun 2022 10:56:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655747819; cv=none;
        d=google.com; s=arc-20160816;
        b=1J05UXUsxanIfRUfUtoE8n+/Orux8LTVfuve7IDpZYAUy+qRvX9ErEovrrSD+Kckkm
         6H5yIK2d15gYpl5mEfRkUjLi85m5HMm/imZ4BjEM7dQDew0jPhZgSw4TSDQi58kMSpNJ
         xtg89ajvvbJHDzW7hml0ms5Ea6CGSkP6S+aq0+o/AqFqIZtX6XC+GC70YqwHpN8tIVq4
         KRkJg3AGOEB3PZGQvCzjdlbYgDcahqPvDvKwFIt4LiHxCKInc/wLfAMtOx0iubr22To3
         M/s7az+0c8ocS40PCUzF+q3DexmqFmOBwXwrMdiv9cDFQRPeyvG90MRUaP1Z4Ry5FhGo
         a/SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kr0F4qUk+3RjeBuKYk/PZF1Mpib+A9SY9/+3Z/Ka2cc=;
        b=yDIMr6PXpii4zyD1jPi2twM76LGLaMG3niX3Ld5buRYimymFte1gWnLpMbdSjOd5yk
         9bD5iE/98vISltWmicqAE+M0imJ/txM+SHx/xDIy+XwG0Y2WULDAoqdX8IH/nkaXJuZX
         offxl6dS917mOMhQjuEq6wgh0IlapdCBfbpaStoIzblK3XyTA4xtmE7FhHm5wQUsDlI0
         QennbEqKYbxY3d92GIOSveCuEEUpRxjenhhbUsvcwitAJmKtjCRrwlC9ztNzWvgPqxd4
         nhaqBZl8Ljbfir6CTO2YLhy/bXB9PkxawJT1WQgNJ55+NCEH8h5f+pvHwIMcEwVl0PhY
         nfLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q6BLC855;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c26-20020a05620a269a00b006a6d2744cc5si9234192qkp.691.2022.06.20.10.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 10:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q6BLC855;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3Ldz-00025S-Bg
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 13:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZy-0005pw-UD
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:50 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:43843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZv-0001PE-SM
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:50 -0400
Received: by mail-pg1-x529.google.com with SMTP id 68so5451858pgb.10
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kr0F4qUk+3RjeBuKYk/PZF1Mpib+A9SY9/+3Z/Ka2cc=;
 b=q6BLC855tuvcbThyIXPKseVzo8rumbbITk42LiNjtcOGkrrm3mQs0e30cZDAcjLWwv
 yBtnn+DSELQZ/Gmk/QxFnm1HngBAM8t3RJgH81mXAdQeEH6LDWBvE9UYJEZ9G3XWIzY9
 jJdIpHW02YL+ISb9qeju0aKcHfOrAOm9p36ehn/4mr5TYtnuYQcvh0gh+1usmrGdVm2A
 ayZooB/12lR5McnnXDWgqzdb6ji/k8c8oNNz80bBUU1X14mioxdi68dKiuSv4i7mjh24
 sxkpzZWYhx+hIeTVj/jpV7/G+jVFFZ9YcN2wD0eL37R6zKxh4/+jXely4PxJDudZHsGE
 5cZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kr0F4qUk+3RjeBuKYk/PZF1Mpib+A9SY9/+3Z/Ka2cc=;
 b=RYheoVTKNfmxk1yTazJMve7nIJTMD1Xk3RBYRSbruYQYR8AmAzhN0H9I6YOPdQkmxC
 JkVfcz9Px3oZk8O8bbxiMNzBfgZyvGhimLAKUHT+FjW68QxZAx9QSotX9WNgw5SRN7LR
 TT3OD/Mv9oCHTmrIQoo+SM7kGc4AQEMcavNABL35zI9TnefB/lTY5BBQ8Xlip8BFdxBP
 R6Fg5j9wEMlcvPcTeP4EYm6Eli+0ZMtXEDYj5xTRFh32rb7Yx2zL3J6F9UD5XGh93c9P
 g/sSDSBBKipJsGFI4KHLTyL9GPWTqRO+66Gwu8aSDK4PYVkeWlPwJkyGXHdKEwS2i8YQ
 9FIw==
X-Gm-Message-State: AJIora+pKNULA6ixsE+xxdCMwv2aQ+Sel3V96ImIRobcXYTiLw/0T+JD
 fJfpyY8DqP998x+VUvNz0OJDYHqm0nM3ZQ==
X-Received: by 2002:a63:78c9:0:b0:40c:9dc6:57f2 with SMTP id
 t192-20020a6378c9000000b0040c9dc657f2mr8748580pgc.35.1655747566492; 
 Mon, 20 Jun 2022 10:52:46 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 11/51] target/arm: Move error for sve%d property to
 arm_cpu_sve_finalize
Date: Mon, 20 Jun 2022 10:51:55 -0700
Message-Id: <20220620175235.60881-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FiFyYnjkxOsD

Keep all of the error messages together.  This does mean that
when setting many sve length properties we'll only generate
one error, but we only really need one.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 15665c962b..a46e40f4f2 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -487,8 +487,13 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
                                   "using only sve<N> properties.\n");
             } else {
                 error_setg(errp, "cannot enable sve%d", vq * 128);
-                error_append_hint(errp, "This CPU does not support "
-                                  "the vector length %d-bits.\n", vq * 128);
+                if (vq_supported) {
+                    error_append_hint(errp, "This CPU does not support "
+                                      "the vector length %d-bits.\n", vq * 128);
+                } else {
+                    error_append_hint(errp, "SVE not supported by KVM "
+                                      "on this host\n");
+                }
             }
             return;
         } else {
@@ -606,12 +611,6 @@ static void cpu_arm_set_sve_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (value && kvm_enabled() && !kvm_arm_sve_supported()) {
-        error_setg(errp, "cannot enable %s", name);
-        error_append_hint(errp, "SVE not supported by KVM on this host\n");
-        return;
-    }
-
     cpu->sve_vq_map = deposit32(cpu->sve_vq_map, vq - 1, 1, value);
     cpu->sve_vq_init |= 1 << (vq - 1);
 }
-- 
2.34.1

