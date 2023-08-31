Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp129476ejc;
        Thu, 31 Aug 2023 12:01:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbHm3Es+xOJerWUAMDZ5CAQUf8udYI/r1rwKrWB/Wf/XFoOWWHXiWNotZeSLSPkODC2BFj
X-Received: by 2002:aa7:cd7a:0:b0:522:1f09:dde3 with SMTP id ca26-20020aa7cd7a000000b005221f09dde3mr393005edb.3.1693508476367;
        Thu, 31 Aug 2023 12:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693508476; cv=none;
        d=google.com; s=arc-20160816;
        b=FSgzEuJmDaPEJa7Bk3iIfBQEdl5GFp/hc7jr949T1Zo6n820QooOImZV72QYZQ/Mhd
         86oJAz5hfAb+xDvYGkjv9lTuGwG/wEqSZhwmBmnph1Mwo2VGn7svtc4lvQLIjChXyXPn
         zBn50EV7s3FjcGnzLeBIkDX/u9D1c4B+8Ha6mCC0SJN8FNODtljhIX28PbIjqRPJmKXt
         CxEkuGLD3YUD9lKXfRng01vO/9gCGGiNs6cuLkvoJLg8sNPkAWJTAg+A71DeZBENGugL
         6wxIXwNWTkhcU+wEoIbJGdOhVko5J8VVIkDc33yEnMx0cZhrOai/OAZpvpupgUeuUu0x
         bvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:cc:to:from:subject:message-id:mime-version:date
         :dkim-signature;
        bh=w6Yyv6ujwYagqpF1MJSJZ41XD5zmN9Sx2XGwawvqoDw=;
        fh=CbxwL8DkOrGDn108oDa/bldLEumz3knHa9SNylRBRCg=;
        b=E9CJk2UQ1viduSe8p2vWCXjgNEQN84P3P/w4lLPA2ur+ikhpda74JiUm9av4r42aU6
         88T0t7eadpI6aiz4+JEo2/NM4V825XIeuDMsnfIbsIBF1p+2kfse/UvIyWr4RJMotRmO
         BWGlIsKLBQJRNyLvmGTgf/pRpKmCxzyN5aaKNcaytjoYiZPeQpQlZ124MSbHjQSLOpx9
         5kXv1hvX6Y6ItzrIJn7RooPOMp+uUWAGtRdgbC+w0EDVnKGH5N2/Ue+u4ZIAQRu3kKjR
         PZCqpMGyn9oZQlquDQwKSEoXMSVko5h6Pm3TGuQlprbC+cJTWFbdIK7w26d/k+ydWJ0G
         gHIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=iJeZlol6;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
        by mx.google.com with ESMTP id b14-20020aa7cd0e000000b005256886827esi1400138edw.607.2023.08.31.12.01.16;
        Thu, 31 Aug 2023 12:01:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) client-ip=2620:137:e000::1:20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=iJeZlol6;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::1:20 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241453AbjHaTBR (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Thu, 31 Aug 2023 15:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236263AbjHaTBR (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 31 Aug 2023 15:01:17 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 611E8E64
        for <kvm@vger.kernel.org>; Thu, 31 Aug 2023 12:01:14 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-58c9d29588aso15535907b3.0
        for <kvm@vger.kernel.org>; Thu, 31 Aug 2023 12:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693508473; x=1694113273; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w6Yyv6ujwYagqpF1MJSJZ41XD5zmN9Sx2XGwawvqoDw=;
        b=iJeZlol6pcGftJ258RQQGOomkR47eYg5nDMqFvI+bTce6J2mBjA0VCK5w/RNRP/QJN
         /0bB9g5g6uPIvZIkvDwwk+K/m+DSaNa+AQRH9B0CT5soCYKedO/ZHe+Y0CjejK72CC0l
         NdJrkGdWIzSCagAZnPwefHtHetDZH1ZYVDaMoyeNWkG7iIHf6AbOZVYDgOC+hmZ+WuPz
         LmqhaEk5BZ74pODgWkFp4DquzCGrTuMXIqfkg+KzCQWeaoJi2jGHBQSiOZpS29c6rT6N
         9q689fxZDcUiibHCJYjE1JMGvL4R7gAKNywGTeBPHksb2VESKPczgWmGLmLt0a1UnDTj
         dgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693508473; x=1694113273;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w6Yyv6ujwYagqpF1MJSJZ41XD5zmN9Sx2XGwawvqoDw=;
        b=PsbtkYS/csgCIWLxmlBBqZex/mjNSeHQe04y5evBuIIIVbvHx4uJoRHHQFyswHGXBz
         dYSJ6b/G2shGtltllcl5VhnILj3aoGqLj01J2dHdQtPXm7l5ilBXnnILJBTg0gUR0gHS
         nbD5sZDnmEh32UlFfYRc8ucsKJtxP79hSL+ovHwmNNE0nMlepv9DQwXcE8i5F/yh/jqa
         9jB7ZdGZxoXhZ88XQowmRmwvVWtlrYw52PovusylUziLyep16M8BoJ6Z8MOzcZyEU2Pa
         Bq6U3AufWQQFV9nOpUMebl6PDZfyUa0df0a9Cm1Ha/dMvhDwptFrYD+9o7siDCMG24iE
         2/jw==
X-Gm-Message-State: AOJu0YwYMfTAXQv/aZkqxba/YyovytpTqBqi8UY6fUqSeb6xC0zcLMhZ
        ePY5D7mCq2jFpiNZE46Km64GOHi2TSbQQkWH5Q==
X-Received: from coltonlewis-kvm.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:14ce])
 (user=coltonlewis job=sendgmr) by 2002:a05:6902:11c9:b0:d20:7752:e384 with
 SMTP id n9-20020a05690211c900b00d207752e384mr16197ybu.3.1693508473694; Thu,
 31 Aug 2023 12:01:13 -0700 (PDT)
Date:   Thu, 31 Aug 2023 19:00:52 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230831190052.129045-1-coltonlewis@google.com>
Subject: [PATCH] arm64: Restore trapless ptimer access
From:   Colton Lewis <coltonlewis@google.com>
To:     qemu-devel@nongnu.org
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
        kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>,
        qemu-trivial@nongnu.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: z00Tg1NMKe0X

Due to recent KVM changes, QEMU is setting a ptimer offset resulting
in unintended trap and emulate access and a consequent performance
hit. Filter out the PTIMER_CNT register to restore trapless ptimer
access.

Quoting Andrew Jones:

Simply reading the CNT register and writing back the same value is
enough to set an offset, since the timer will have certainly moved
past whatever value was read by the time it's written.  QEMU
frequently saves and restores all registers in the get-reg-list array,
unless they've been explicitly filtered out (with Linux commit
680232a94c12, KVM_REG_ARM_PTIMER_CNT is now in the array). So, to
restore trapless ptimer accesses, we need a QEMU patch to filter out
the register.

See
https://lore.kernel.org/kvmarm/gsntttsonus5.fsf@coltonlewis-kvm.c.googlers.com/T/#m0770023762a821db2a3f0dd0a7dc6aa54e0d0da9
for additional context.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 target/arm/kvm64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 4d904a1d11..2dd46e0a99 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -672,6 +672,7 @@ typedef struct CPRegStateLevel {
  */
 static const CPRegStateLevel non_runtime_cpregs[] = {
     { KVM_REG_ARM_TIMER_CNT, KVM_PUT_FULL_STATE },
+    { KVM_REG_ARM_PTIMER_CNT, KVM_PUT_FULL_STATE },
 };
 
 int kvm_arm_cpreg_level(uint64_t regidx)
-- 
2.42.0.283.g2d96d420d3-goog
