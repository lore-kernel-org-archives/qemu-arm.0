Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp637343lfc;
        Thu, 21 Oct 2021 11:44:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvUuKni++65po3RzCM5WlNlfpWHAy7Sw6I/nB/2yIL/jD+Bx0afp3NUkkp0aM3yurCOgqQ
X-Received: by 2002:a05:6830:19d3:: with SMTP id p19mr6087579otp.355.1634841883133;
        Thu, 21 Oct 2021 11:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634841883; cv=none;
        d=google.com; s=arc-20160816;
        b=xvj3+gc70Piaz1YKD2a1Nmnt9JO6lJJuQU3MO6Y/osIBXMAm/XHsRMJtcrMw+eqzR7
         brYOJ6EcUK0/TdTXk76WefC2hVvFUvPRGVAsaCQv+vW0DaSP9Ic0RP9OGppW1PAEvL1/
         FVUvK0G60gltYC7JHAU6Uka/jYeY2bbBq6miGnoF9d/4KSTFbnRkWgfCOrCYF6LrHGZn
         AiV6+Uox08gD0agg8X2su/Zh5az56qtMz7u2VBre4rkxXs+7fCumWA6sq4NGmmeJjOa0
         +wqO8r+eg7ObO3FYr81ECoIhMAKJSPt+8SAeyF2FbOQRkfnHWLky6c/QHSbwskVcEZEe
         truw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=prjL0IYXvRm4Htgay889/PxyOqJwqIRrZSdP/e3VblQ=;
        b=JC0ONbsfz/8IW7IwwCXrfa/UfqxL7EMr8k8erPqUlb+iiMh9RRvr0i5dfYEIogJcUR
         ojnHIFkSgE0mj1eKLvZ6VyfjdskzXg2Zlumc6Q1yN7XAff/jcgBs8/NPy3y5/wAIeSe7
         lBm4FjmwiR/nHO6TpQa8RjThU6Wtjxo9DbAMwEHZBObw4aNQSOvsWnDp9+FnDClU03J5
         ilOJ+xA6+qqUWN0a8WrjD+T1aSC1b9+bhXdHoBoYD1cFz2hpYqucr/xA70Jd9ZKtZLMl
         jO8psD/9Q/Qy8rpCLGE6l9l7jQlDALUu2ZjtXxgrcd6TGicgmUiq9erGoCL2b5B3zWme
         IBiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kUTCCJhU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q18si11028602otv.60.2021.10.21.11.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 11:44:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kUTCCJhU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:59114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdd3S-0002LH-CL
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 14:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3E7RxYQgKCFQIG3wAFE32AA270.yA8C08G-wD89A929G.AD2@flex--wuhaotsh.bounces.google.com>)
 id 1mdczJ-0005DI-9Q
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 14:40:27 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a]:40475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3E7RxYQgKCFQIG3wAFE32AA270.yA8C08G-wD89A929G.AD2@flex--wuhaotsh.bounces.google.com>)
 id 1mdczG-00032s-Jg
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 14:40:24 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 mj18-20020a17090b369200b001a1d3806b2eso355084pjb.5
 for <qemu-arm@nongnu.org>; Thu, 21 Oct 2021 11:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=prjL0IYXvRm4Htgay889/PxyOqJwqIRrZSdP/e3VblQ=;
 b=kUTCCJhU11q6/B+hRu+hcJZwYHti5BdJ8ONsVBMWaQfNdwIViTsd42LfdIrVrcEZF8
 xH0e9d13Jky0/9n2AUtDOuP3JtDQAs37j+JwkLDAEC12kZpX0hTwApC4kaTumWlvV0vk
 HsvNSctctIQmBseKJb89/iXiQ7nbW6D4mslyc+GtPGMFY3ijTip/hVEyP1Whmyt7iGH0
 fRBXTXNEVU2M1FkMkLLgiD8QeBnB7PRc+xygVspRBH1SO6wnHJ+lOH2nj/ODI5sQX4cf
 Qk+llLVRxiThjeFpoPcM5CSiMTC13WqdMWfbm4//FGHLn7a1YeZGL6HobROEKWFRHM4v
 Jpag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=prjL0IYXvRm4Htgay889/PxyOqJwqIRrZSdP/e3VblQ=;
 b=1pXrNB57rzh+PupVq4P3jotGHA+X/7kmY24N+EfmUlM7p3K3KznT+PjEg9P0h0ans+
 QZDSmAebTGjp0Han/CQ4GDICBJq74Ycbn5PTB522fUovLU6IO9apAnVBhHjW2tDrsm6D
 pPph4lWvwkb/lPbnIuS/4PB4XM8Oo36NjsuAWjhdeNH2mJA+DbaF+/OvtOLsR4sUQIrM
 TJ4J5maz4Z87abpxmhDRhM/1LO2wXyofr0NEIwOwB2OMadyMfPYYg+PC1iNAnnYwqrmy
 xrOVyQ5SmvzqCTrJTynSGrCOEjj+X3hBxXD5wYsh1hFxazedA0J0qRsyOccmx//+DEZR
 Q98A==
X-Gm-Message-State: AOAM532rfHl1KwxZ71TaJ1FLc1aegVoEOUNmh3Up+gn4c1cBYYZM/M4F
 mpIO/0vbhZMET8Ydu0c9OwJb65OZHbj/Kg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90b:4f4c:: with SMTP id
 pj12mr3919834pjb.239.1634841619752; Thu, 21 Oct 2021 11:40:19 -0700 (PDT)
Date: Thu, 21 Oct 2021 11:39:50 -0700
In-Reply-To: <20211021183956.920822-1-wuhaotsh@google.com>
Message-Id: <20211021183956.920822-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20211021183956.920822-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
Subject: [PATCH v2 1/7] hw/i2c: Clear ACK bit in NPCM7xx SMBus module
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3E7RxYQgKCFQIG3wAFE32AA270.yA8C08G-wD89A929G.AD2@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -76
X-Spam_score: -7.7
X-Spam_bar: -------
X-Spam_report: (-7.7 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: AnLt98jpexO/

The ACK bit in NPCM7XX SMBus module should be cleared each time it
sends out a NACK signal. This patch fixes the bug that it fails to
do so.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
---
 hw/i2c/npcm7xx_smbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/npcm7xx_smbus.c b/hw/i2c/npcm7xx_smbus.c
index e7e0ba66fe..f18e311556 100644
--- a/hw/i2c/npcm7xx_smbus.c
+++ b/hw/i2c/npcm7xx_smbus.c
@@ -270,7 +270,7 @@ static void npcm7xx_smbus_recv_byte(NPCM7xxSMBusState *s)
     if (s->st & NPCM7XX_SMBCTL1_ACK) {
         trace_npcm7xx_smbus_nack(DEVICE(s)->canonical_path);
         i2c_nack(s->bus);
-        s->st &= NPCM7XX_SMBCTL1_ACK;
+        s->st &= ~NPCM7XX_SMBCTL1_ACK;
     }
     trace_npcm7xx_smbus_recv_byte((DEVICE(s)->canonical_path), s->sda);
     npcm7xx_smbus_update_irq(s);
-- 
2.33.0.1079.g6e70778dc9-goog

