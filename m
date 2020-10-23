Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp853922lfa;
        Fri, 23 Oct 2020 14:08:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy60BZZNoRJEfRmEWbpzEUk2jM0NUbuk58UNDCPzm6DWimKZ7ZKfHn6GuvHyzz5zigYXVl
X-Received: by 2002:aed:26e3:: with SMTP id q90mr4002812qtd.121.1603487293523;
        Fri, 23 Oct 2020 14:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603487293; cv=none;
        d=google.com; s=arc-20160816;
        b=J4ixlxK0G7SOxp5HSLvaM+YPBXL7zH4fvfc1h0/+7Z5QYLAMSfMllKDxqoS7zTgASp
         p8f6ybrfvslpYwn8HLuatFxbMG78ps/aeMIL8R9zF5j3k4plirfHmx5pSl71aOKP4ryI
         5+agruwlzlET23WkGBL+mvannGl9ufSmC0kJh7VPlozo5BrOSWNycylI8Vo1DBLYnD1J
         K6kYw5wO47MkWHiivw1zkfycPkdVFPHS5hDiW/snf8+5F3lqpevlBkUeK81K0mUVnA1W
         RDUrlVdF7BasnRhpkYao9rtyxzzhydpYgKHrhOo2jcIBYohjHu72B7sA9pMt0qg+RR1G
         vDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:cc:to:subject
         :references:mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=g9hLwZzvASQ+W2Fqi0Pfbug+e02F0q9JvSB2utWnBOo=;
        b=TCT14JBlTpAM8e9Ao89w48trCgKRIH2vDYvn74+XComk4/RP96KWASb8KdXbsiuRGj
         E4+S5KF9s3yPaMulmGPhsYuoMqG1GFHVixeu4lk9lH5V20uBYTazKpdvL6J/HcR3ybAL
         bRqFVcHETI1eEBBfgWeNoF74Z4KAimX6xiow7WPI25ctt0YUQkWiaB6L9QAgiNGNj0Ex
         1Jzsi51ol6PiHCVA+NBe0zR7d77hhDb9rm3bieG3qjuqZOwfTsyQpA6Zd8Rm8ZW6rq7M
         LCX5hTsmspIk2Fwoany+45okeItM9vbS+FnS+aPU+RraW8Dwv506ymL2H7BJhpGNK84x
         5cuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=ZrDZ7Hev;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l68si1475062qkf.294.2020.10.23.14.08.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 14:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=ZrDZ7Hev;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:40056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kW4IG-0002Fx-U7
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 17:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <34kWTXwsKCr0kvnlqqhprhqjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--hskinnemoen.bounces.google.com>)
 id 1kW4Gu-0000Wh-4Z
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 17:06:49 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a]:36609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <34kWTXwsKCr0kvnlqqhprhqjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--hskinnemoen.bounces.google.com>)
 id 1kW4Gq-0002Cb-DO
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 17:06:47 -0400
Received: by mail-pf1-x44a.google.com with SMTP id 62so2373063pfv.3
 for <qemu-devel@nongnu.org>; Fri, 23 Oct 2020 14:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=g9hLwZzvASQ+W2Fqi0Pfbug+e02F0q9JvSB2utWnBOo=;
 b=ZrDZ7HevVhqan1iJdkUepw5QvbbNkYPiaGjfKRTjAA2C/ax1CgWLRE7euds9gQFu7m
 hKDb/J/MLg8vnvhQ+zKri+N0GGj+sTibayQC6A+QkV+EDtX4I4mt1cBO7SMxgXJGlWdV
 ZF9XA24Xj37dI4IsE/f2/gtVQ5Mgl/jiinvNp2xFO6sCfcx3Rt3/usc9cXHE1Vkjwswa
 4FyuafB2iwzEBCuhDECiT8fHPaNBLZsuiOVhfjMrJsjj+zFifpI2y+/7AGTwlf/FOmp1
 NaEa9Wkb40cyxFRvqjBOw9feGCycoh3c+hLsqkjC8GXTI/g/pXXMiPD/FcNpMV6P+yYH
 jxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=g9hLwZzvASQ+W2Fqi0Pfbug+e02F0q9JvSB2utWnBOo=;
 b=mUD8uZCIdquWiF5lQQ/p7AkrgpR2hum1UWR0cTeXJORtMuMjJJJeDc/LWa4/U/v5Sw
 2F+JRL2SGFeeGW58S1WCnERKqPjWUig1yG3/3GPTLNCaXqav8PxGWpOA5zJV2G2dP52J
 9tKDtKzPWFGJj2elvIouCIUMoRk+/qmGp6Ii6HLQwl9t25aUggngvSGdkaMf3zD4Dcg2
 L/Mu5UkmskY9gMak+rVMitnkXDPJFgpIdoMAZDDpIZ16UbLPoqX8qnLW1Mkym83y7BfM
 I+GzEQqjyL1K9wqbWjvQz05FbijyhZZgw4t7/wBH3HgnqHplWwN4cfl6XVlqg00IKMiG
 ssHA==
X-Gm-Message-State: AOAM53172AylTsApreaUp2V0VhiWV6vSIv+uO21AI0DKrUZAXeow9ZLf
 xrROUeUD4u4DtFIHrOt0ZBmIbw47hGF2WMQcFQ==
X-Received: from skybert.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3107])
 (user=hskinnemoen job=sendgmr) by 2002:a17:90a:6ba7:: with SMTP id
 w36mr4562011pjj.12.1603487202838;
 Fri, 23 Oct 2020 14:06:42 -0700 (PDT)
Date: Fri, 23 Oct 2020 14:06:32 -0700
In-Reply-To: <20201023210637.351238-1-hskinnemoen@google.com>
Message-Id: <20201023210637.351238-2-hskinnemoen@google.com>
Mime-Version: 1.0
References: <20201023210637.351238-1-hskinnemoen@google.com>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [PATCH v3 1/6] tests/qtest: Make npcm7xx_timer-test conditional on
 CONFIG_NPCM7XX
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, venture@google.com, wuhaotsh@google.com, thuth@redhat.com, 
 Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=34kWTXwsKCr0kvnlqqhprhqjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--hskinnemoen.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-devel@nongnu.org>
X-TUID: kofQAqSOmH+F

This test won't work if qemu was compiled without CONFIG_NPCM7XX, as
pointed out by Thomas Huth on a different patch.

Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
---
 tests/qtest/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 28d4068718..7e0ecaa2c5 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -133,12 +133,13 @@ qtests_sparc64 = \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   ['prom-env-test', 'boot-serial-test']
 
+qtests_npcm7xx = ['npcm7xx_timer-test']
 qtests_arm = \
   (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
+  (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
   ['arm-cpu-features',
    'microbit-test',
    'm25p80-test',
-   'npcm7xx_timer-test',
    'test-arm-mptimer',
    'boot-serial-test',
    'hexloader-test']
-- 
2.29.0.rc1.297.gfa9743e501-goog

