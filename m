Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4323550ejd;
        Mon, 22 Apr 2024 07:51:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWagTb/J2MMhif7ejkIDYlS+WxF5tR97tOfL3pSTEvJbGe+IU36VHbKB7SJpt5fUUorAotUjtmt7snrNATVNAOsWaJ4kgKn
X-Google-Smtp-Source: AGHT+IHwZ9TUT3PUWU+ph0BRL0zI+I/0NVdvkfGNKxGVttAVJfQETpewoj7Rnt4mSwbNMJHx7AAD
X-Received: by 2002:a05:620a:468c:b0:790:680f:c88b with SMTP id bq12-20020a05620a468c00b00790680fc88bmr8377225qkb.78.1713797493411;
        Mon, 22 Apr 2024 07:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713797493; cv=none;
        d=google.com; s=arc-20160816;
        b=X4pN3tJXAKNz+kP3zBezPtEhKGhQhS8JtzUxIKhqH/IwhPZ1qrqgC90Vfj0aHG0d5Q
         8E2z7NJVZ2n9IbqtOGMLMYs4q2oA4iWh8XeBydOTgpxSz1n5grcPDb0GJwkXcgTPagW8
         eU2oPO/t7OLSUUT2YXqk68620aTLSJ3pF2ojp4jIjS01FOjTugO1ZyrqL8l1gOgHhyp8
         qZT3ep3I3k2kXr0E3z2jFNGKYg3kX6U7w5+6CQB14nrlRsMmJ4she4Q+wxjqrhZP3M5V
         4nDy+w4WWlis7UhjTLXcKtcjoUmu3h/iDmRtHdGQmssTqpdz6ncObzVivzA/X/R4I/Jl
         gCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Co44Q9mlr4zNsi4wNMbg2xr+Hkh3wz3o/Kg+Jwyh0d4=;
        fh=WyoOzUE1NXft/e3Boe86CT/zd2PXColkUkQzIRh9+gA=;
        b=DQrzYxiYEAqqw7KsFS+4mAUIUTdj+XD+HjKDmfpiy7DhazrmS8ZVy9bQtJ8KiOCUYX
         CT1e1qKcQynpMdbowNNcBD0c4zeP27Z7g0634dvtFZbvWIPhfs/oMqwboLGS7EeB7BYp
         4Z5Nx3W1WWeaV7688DCjGmUL0mh2/wSnhoTPxZRlztwjNXvbSkjZT6pfBq9G4pYhd8fl
         hGX7oTjfpKsBP/IB/vYMmFBrL7TB7bYUAMp+2JaQ2+ZThynuQ7rZOY8kLRlKU26Bdmk7
         shIl7mp81UE+ih8gUzBMF7cQjGo+fTgTssQkx2m0QPWTGGWcdfGCovDAW6n6zNUWCEK3
         b2gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=jCfpUiFT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id xx24-20020a05620a5d9800b0078f1583f518si8977573qkn.619.2024.04.22.07.51.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Apr 2024 07:51:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=jCfpUiFT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ryv0i-0004xE-Cc; Mon, 22 Apr 2024 10:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1rypxe-0000vq-BQ
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 05:27:42 -0400
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1rypxb-0000mA-QG
 for qemu-arm@nongnu.org; Mon, 22 Apr 2024 05:27:42 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1713778055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Co44Q9mlr4zNsi4wNMbg2xr+Hkh3wz3o/Kg+Jwyh0d4=;
 b=jCfpUiFTGUPXPYsp3pm3Ur6ev6kvmfoiYjjLuoCshXsFTzZ3APSPHDYHcs1KGuvM5BL0iW
 7aAzgJsJ9ebxp9++NZG/L5IrT4RJefIR2W2pZ6UopAdmIvUcqyP7ak3IYCYAWHTf1G0ATZ
 7vOqqujywPWxxJsaA+Zm3RxdJ7Srduk=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, wanghaibin.wang@huawei.com,
 Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] hvf: arm: Remove PL1_WRITE_MASK
Date: Mon, 22 Apr 2024 17:27:15 +0800
Message-Id: <20240422092715.71973-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:203:375::bc;
 envelope-from=zenghui.yu@linux.dev; helo=out-188.mta1.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 22 Apr 2024 10:51:07 -0400
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
X-TUID: YTqcQug3Vfqg

As it had never been used since the first commit a1477da3ddeb ("hvf: Add
Apple Silicon support").

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 target/arm/hvf/hvf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 65a5601804..015e96a6d3 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -150,7 +150,6 @@ void hvf_arm_init_debug(void)
 
 #define HVF_SYSREG(crn, crm, op0, op1, op2) \
         ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP, crn, crm, op0, op1, op2)
-#define PL1_WRITE_MASK 0x4
 
 #define SYSREG_OP0_SHIFT      20
 #define SYSREG_OP0_MASK       0x3
-- 
2.34.1

