Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3834582lfb;
        Mon, 16 Nov 2020 08:13:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZ/AKUSGwkWxASaMS36gs/2FpwVfKcZUQlAgFZWAj2C40C+tT2yG87Sj8jJHwcTsYJ4r49
X-Received: by 2002:a25:6903:: with SMTP id e3mr21527149ybc.295.1605543218460;
        Mon, 16 Nov 2020 08:13:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605543218; cv=none;
        d=google.com; s=arc-20160816;
        b=MzrMhGpi2CiaSBuXwIm/7wTLQKs6XbGX7/2d6k24fh6QXrnfxLGiE4T8oggeHSoaOp
         MPJ9hb8/yI6EmRFGSaL4gInJV/3D3r2mheTa8kG7i76uf/eOz3pCL1JbdWRhJLJEKre7
         aywTyKeEkWnKbEbIZyWqhxB1Xrq6RkxSFg55+xNaIl6K4u+RJ0I1FTfIbjcTfHk8xV9+
         zw6nKehVFnMR9vfJugblzoAKBbB0LGgnVUsOtwR+RJzkkh3oQFJ1B2QiP+7wUD4N9/er
         m+9/wNQvYG40WQ5KbeB3EB1QpyhanRVxeFeA1+Tso9NVJuUqc9/CrVzTq0dFSksI/vNX
         nGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ndVG3Ur/YVssArwv222lKAY0FdZzdrlIXHioNrSqs3Q=;
        b=EtO3mHB5Y0uIYLh4eMQyvyckaollOWWTGFnolIj9O0suJnES+9SaBhfKUmrUD50toa
         r4EBOWJEIQvVuu1vgRss5CNMZlL1xJs2nZ3thR2FcfD8qQxbMqMn5reFRji5hJjohx5k
         wGH3UYPiYRsTOmYwpf/duaEBQJ9KB6hmyK3BnHKIbvoNES62holDePnbCN4YWoVlor03
         5cUbSEMt4yYh+jL0g+71bteffPtD4iLHgIsjySLeXfiJaAOhw5e4hiMstwP6GOY8R1e/
         QdZI0zvIXpDjZlodGx5dsAXePzeo9C6JgqXna4thYz0uZwtdVLUjI+4aT+h0g2JMg0e1
         tiUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iJB9gGn2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s31si20816112ybi.63.2020.11.16.08.13.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 08:13:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iJB9gGn2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1keh8L-0004Md-RV
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 11:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3e-0008TB-5w
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:08:46 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3a-0007q9-K7
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:08:45 -0500
Received: by mail-wr1-x443.google.com with SMTP id j7so19264150wrp.3
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2020 08:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ndVG3Ur/YVssArwv222lKAY0FdZzdrlIXHioNrSqs3Q=;
 b=iJB9gGn2i4gB7DNDRGs9+1HkmXJXvC7IipL/5wAyfqNYX3Ig0DxUiriQv//NWw0Tgz
 IevpZjYLiMVElxkkkb8KezbqVaZa/zMtJvD6TPRg7GJ0co1mt1SzTEDHuzDPlkbYMnf1
 hKiivlnEIwzmChT7KNtInscSHKNXGF0EA9Zew79NyOzZI/hS3tdArgybeP6VO2eDfPmb
 u87+0MkNVV/8AGYa+SMV6BPi2hWMbQjwXqrgNNV00KrdfZWngHp6VsaeFrJXoyGI+Wg0
 7Q3r6a2IGBCjRAMsCoRFg0FroPf3o/tsJZdQ567wdxetcBEt9SC660rG705EkatMGm/R
 ybiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ndVG3Ur/YVssArwv222lKAY0FdZzdrlIXHioNrSqs3Q=;
 b=mxRMpQl/jjOmYI0/rmzQYVxCK0vDmlO2cyiYsF5oLSSY8L75eV43HHuiN3wAgqyY9B
 rZUloPY3N4Jx3eL1/wKY0x6NACLDhuc+PRJoLRaMEPIZ3SCNLlIPCcJayV5Wlbd9E/0z
 26wT+FjCFrwGqseWg0A3Ewe2ZhLlM0X9re7s9PsclVu+tPP4qh38r+AZkSUHU68WLP6x
 0ZIEEJoxwGsPkME+Q+x3S/fnse2TIqfe8T5HrDTc1R2Y1Zvk8/YK9bCYmKLnODWAlsq5
 bNtBdtHBMOjR4iqkMjGA9T2ijeeUo1oJBT+dfX8ZQw+yidHHTGey1gCkaU/vCk2mazdF
 BSMg==
X-Gm-Message-State: AOAM531gz4LN+HKUs4stHapNEfqX8CxRovAq/h+WOJosUr64hprT8EyC
 gEfgiJBjUIWAdEo8NYZZQy79AhQraQGbNg==
X-Received: by 2002:adf:dccd:: with SMTP id x13mr21348550wrm.394.1605542920918; 
 Mon, 16 Nov 2020 08:08:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/15] target/arm: Enforce M-profile VMRS/VMSR register
 restrictions
Date: Mon, 16 Nov 2020 16:08:22 +0000
Message-Id: <20201116160831.31000-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZRs8neeBqNgS

For M-profile before v8.1M, the only valid register for VMSR/VMRS is
the FPSCR.  We have a comment that states this, but the actual logic
to forbid accesses for any other register value is missing, so we
would end up with A-profile style behaviour.  Add the missing check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index daf39306d04..aee60ff98b3 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -622,7 +622,10 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
          * Accesses to R15 are UNPREDICTABLE; we choose to undef.
          * (FPSCR -> r15 is a special case which writes to the PSR flags.)
          */
-        if (a->rt == 15 && (!a->l || a->reg != ARM_VFP_FPSCR)) {
+        if (a->reg != ARM_VFP_FPSCR) {
+            return false;
+        }
+        if (a->rt == 15 && !a->l) {
             return false;
         }
     }
-- 
2.20.1

