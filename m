Received: by 10.25.21.156 with SMTP id 28csp651385lfv;
        Tue, 9 Aug 2016 12:12:47 -0700 (PDT)
X-Received: by 10.55.221.85 with SMTP id n82mr34277942qki.236.1470769967346;
        Tue, 09 Aug 2016 12:12:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2si12199585qke.265.2016.08.09.12.12.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Aug 2016 12:12:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXCSE-0001a3-NH
	for alex.bennee@linaro.org; Tue, 09 Aug 2016 15:12:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bobby.prani@gmail.com>) id 1bXCIP-0007gk-IO
	for qemu-arm@nongnu.org; Tue, 09 Aug 2016 15:02:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bobby.prani@gmail.com>) id 1bXCIN-0002hM-MG
	for qemu-arm@nongnu.org; Tue, 09 Aug 2016 15:02:36 -0400
Received: from mail-yw0-x244.google.com ([2607:f8b0:4002:c05::244]:36096)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bobby.prani@gmail.com>)
	id 1bXCIN-0002hF-Ha; Tue, 09 Aug 2016 15:02:35 -0400
Received: by mail-yw0-x244.google.com with SMTP id u134so910436ywg.3;
	Tue, 09 Aug 2016 12:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QkwVP7TjU2cRz/3mI7VPN56HGQ+d9FQZcVKhb9a0WB0=;
	b=0FZwOxH3gHZjEDnNpCQ2xgAjWAsmkbRJQON4Z0Dj1oZJ7+7LTqlJ8jgglrMwN20xpV
	HRvH565bvE27AYcGu8zz5ztDFfGMVFWMZIKuWk2CeOx23zvvhiS1pOyIjcYBhFVOPHT2
	6OPEzDdZEo5prMjnDMFGBGtbF39B7YN44JHJ3Wtv7WaHSkge9BErZks46XX7ky9g1bH8
	BczqigJJwcV6wNoeJbpKZoTXv05zSljlg/7a1evpC5lsKD+o/Wfp9OYhct5a+WEzfxz5
	H0g0vTChkLbJc4T16gqtGX/Q2/S3r5AZ1WaQfs/Zd/mEKjhBmoEhXIPjZkHUFVCSE8i4
	F5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QkwVP7TjU2cRz/3mI7VPN56HGQ+d9FQZcVKhb9a0WB0=;
	b=IhqE9lqH+pmP9HxWYIoW+FNCxDCTEMizljL163JuBz49bJi0nk58rZ0qcu+buZV5Ad
	BhxIIn4un6bERjffLv96UiF5TBK8gxO/7Y9I94Vf07ATcgrgFdBAnZ29105854DXxNb5
	KTSByQkd6Fp9wB6g0XjZVIlrVCD6MSr0AvJi94F5jmeKhCyMhRMNFPfBg6OB/sWfAEfA
	kL+t9EY90ajha0ksh0t4YSOV5CyxNMTTXCAfB8gf3g3ItkgbtvjqgMU0fjrJYvz6FB/0
	VZ7Qn2zd0UF+7YdFgcfAvUHTd9PutAhfD4TklvRHai0eEbux+DYvdn9892yMSOO1Lj4r
	8Lmw==
X-Gm-Message-State: AEkooutrhkanzzIw1NOmsvBGdF0fFnzEzRcWxxAzxr/X7jh7j+Iql6yagNpKKRcMIDeo5A==
X-Received: by 10.129.166.194 with SMTP id d185mr77872266ywh.247.1470769355057;
	Tue, 09 Aug 2016 12:02:35 -0700 (PDT)
Received: from evgadesktop.attlocal.net
	(108-232-152-155.lightspeed.tukrga.sbcglobal.net. [108.232.152.155])
	by smtp.gmail.com with ESMTPSA id
	t67sm16659070ywa.33.2016.08.09.12.02.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 12:02:34 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM),
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Tue,  9 Aug 2016 15:02:28 -0400
Message-Id: <20160809190229.27871-5-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160809190229.27871-1-bobby.prani@gmail.com>
References: <20160809190229.27871-1-bobby.prani@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::244
Subject: [Qemu-arm] [PATCH 5/5] target-arm: Fix warn about implicit
 conversion
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8ueRMgZAUOf+

Clang warns about an implicit conversion as follows:

/mnt/devops/code/qemu/target-arm/neon_helper.c:1075:1: warning: implicit conversion from 'int' to 'int8_t' (aka 'signed char') changes value from 128 to -128 [-Wconstant-conversion]
NEON_VOP_ENV(qrshl_s8, neon_s8, 4)
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/devops/code/qemu/target-arm/neon_helper.c:116:83: note: expanded from macro 'NEON_VOP_ENV'
uint32_t HELPER(glue(neon_,name))(CPUARMState *env, uint32_t arg1, uint32_t arg2) \
                                                                                  ^
/mnt/devops/code/qemu/target-arm/neon_helper.c:106:5: note: expanded from macro '\
NEON_VOP_BODY'
    NEON_DO##n; \
    ^~~~~~~~~~
<scratch space>:21:1: note: expanded from here
NEON_DO4
^~~~~~~~
/mnt/devops/code/qemu/target-arm/neon_helper.c:93:5: note: expanded from macro 'NEON_DO4'
    NEON_FN(vdest.v1, vsrc1.v1, vsrc2.v1); \
    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/mnt/devops/code/qemu/target-arm/neon_helper.c:1054:23: note: expanded from macro 'NEON_FN'
            dest = (1 << (sizeof(src1) * 8 - 1)); \
                 ~  ~~^~~~~~~~~~~~~~~~~~~~~~~~~

Fix it by casting to appropriate type.

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 target-arm/neon_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-arm/neon_helper.c b/target-arm/neon_helper.c
index 1f1844f..ebdf7c9 100644
--- a/target-arm/neon_helper.c
+++ b/target-arm/neon_helper.c
@@ -1051,7 +1051,7 @@ uint64_t HELPER(neon_qrshl_u64)(CPUARMState *env, uint64_t val, uint64_t shiftop
     if (tmp >= (ssize_t)sizeof(src1) * 8) { \
         if (src1) { \
             SET_QC(); \
-            dest = (1 << (sizeof(src1) * 8 - 1)); \
+            dest = (typeof(dest))(1 << (sizeof(src1) * 8 - 1)); \
             if (src1 > 0) { \
                 dest--; \
             } \
-- 
2.9.2

