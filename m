Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4483936ejv;
        Wed, 3 Apr 2024 03:18:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZUQU35fMluRhS9ollW62a7l6cwuZf3JoiSOgFcwonS2LwJjemK5XcdpujQ5Rma0asMghNBS9QiWYMJHKxRo9p/xbcnVuV
X-Google-Smtp-Source: AGHT+IF9SQnT+xj8lQaSphTeaa5iTi35gYB685AfANx+i59AtNxS06kVDnpsFMFh/tcaZIJ2uxeo
X-Received: by 2002:a0c:e38f:0:b0:699:2b22:ae13 with SMTP id a15-20020a0ce38f000000b006992b22ae13mr863868qvl.12.1712139498975;
        Wed, 03 Apr 2024 03:18:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139498; cv=none;
        d=google.com; s=arc-20160816;
        b=NDA0Ybs/H/AwpL8NLijfQyj0XXi+ewh0L9XUwxDa6Mjm8IuE6kUPamZmMvzuT1bKH2
         UOs23p7a9MUgsEldxsWkI6eCJzIPej+PPPBi/W52VtvZrbHr9n97jNlzbDDFbcVthnzy
         z/2f/go4I/umEs36Yj82VUnJTK18PuOR6jwWMT8nYGZ6Atlx1TYMWk3HhwurGJzo/SY3
         Yyr36j2Jb2MVduI1gAxeNGAUbojvIhTJ+pKf9KKCfbt6xu0L+ocpLc24nXApn50MFFFm
         w0EZChV7I9Zhubiqh4qKQn96TLVdhiS7o7zSdEgQqT9zOIggCpjkK6phkQ4vwCiwcp3w
         SW8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=zR1rru9V4h7gwvo9LnV1uQhan7+q08IyhjCcUZ/bjGg=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=L000iCRPNiyFJRCuBb3TRawx5B7//EKuLCcp/PV3Rj4pSp0fnAp2+achqnab3GORlf
         gfwg2epQ7zr17vAmycbDWkqUg7FM/cur3lc2Fx1bbNUs7JkuL037idgO0/xM3cSYw/BH
         4/s18PtejbOdi0QXMVPePNtRJt7MfoVgUGljZXtXw1sjo5uer0nhYv+liW+RGzZZa0ev
         VUfhujeaakCoQHADF8QC+8vdIKhMYCLMK90+7Qa/2kEWpEFliiMOlc+RI+kf8ieS6B2d
         hkqifzqP0dm1puBjrBY742znm8rjbXBMdkh5WNktGaPWEsonELjzrR2uiq2tG3TG+oyt
         1gHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1-20020a0cc481000000b0069671af68e7si9086231qvi.616.2024.04.03.03.18.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 03:18:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrxgn-0000l6-Ul; Wed, 03 Apr 2024 06:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgm-0000ir-CJ; Wed, 03 Apr 2024 06:17:52 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgk-0006cq-6k; Wed, 03 Apr 2024 06:17:52 -0400
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4V8gdw2gXkzbf6T;
 Wed,  3 Apr 2024 18:16:52 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 584281402C7;
 Wed,  3 Apr 2024 18:17:47 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 3 Apr
 2024 18:17:46 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 09/23] target/arm: Handle PSTATE.ALLINT on taking an
 exception
Date: Wed, 3 Apr 2024 10:15:57 +0000
Message-ID: <20240403101611.3204086-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=ruanjinjie@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ngO0el+iYL7w

Set or clear PSTATE.ALLINT on taking an exception to ELx according to the
SCTLR_ELx.SPINTMASK bit.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v9:
- Not check SCTLR_NMI in arm_cpu_do_interrupt_aarch64().
v3:
- Add Reviewed-by.
---
 target/arm/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0e7eefd7e5..65f2ddfa56 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11729,6 +11729,14 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
         }
     }
 
+    if (cpu_isar_feature(aa64_nmi, cpu)) {
+        if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPINTMASK)) {
+            new_mode |= PSTATE_ALLINT;
+        } else {
+            new_mode &= ~PSTATE_ALLINT;
+        }
+    }
+
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = true;
     aarch64_restore_sp(env, new_el);
-- 
2.34.1

