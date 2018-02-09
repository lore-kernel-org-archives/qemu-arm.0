Received: by 10.28.71.27 with SMTP id u27csp1024725wma;
        Fri, 9 Feb 2018 07:02:27 -0800 (PST)
X-Google-Smtp-Source: AH8x224xFF5vvCTxX6Xotoh13dy+YTIygZLxJdVya7TiGUffjJ/XEE28sj4NYOIfdtDfjEkTnUGY
X-Received: by 10.129.148.196 with SMTP id l187mr2004984ywg.453.1518188547249;
        Fri, 09 Feb 2018 07:02:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518188547; cv=none;
        d=google.com; s=arc-20160816;
        b=XMyVgXKSqVlseQj9V2hBli7DqhBkEmvnFxgsofBWpm0jJBGeTH6rBVwowdpz1c4TMX
         D2yFvcQ3mV9r5Ws1772VQnaK9yAC4x0604g6fvHUuCvp96RImnlEfC+3UDqs08eHrxZg
         irAk1E+XR7ka3madP7EbU7cAZjd5y1YdNb8z61hEi4L55yDmiCOdVS1c0YYu5JfOMJL3
         L9oERNZpcJupZTGlrvJ50xrWkQJRXCUjoj9Z9poVMkuyCOzM4rBOFpytzhsoCzMrxAJb
         WRJcTPUC9muRYzwBK9DD7TMk6v7T6himoYAIq2X8mBopiz4s/X+7MZKJWM/syhzomVvY
         7idQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=wY//D2TOSIUxA/+3Tz/qnHcjRg6V0zzmBzdlX6DyMlw=;
        b=mDUXeAGzXB+zPHkkp9z7cIIDqH8VprGYq+JVg7yVllnhH7PR4s9o1SNXmLdiU8q6t9
         nsDjPaqBz9JMGLw7N+q5IeEGEIc4z6h6Gx2KjqSHREv9QOexl1CcN7NNbSqD6iqfyB3V
         75Wb3MR56HF71GwWQvu78XXlspteeCoq6F2rnpI93mAEb9sdHS/uNhPndNQMT9hNiORG
         aY3cXvOclprpcFJxnVIfmTC3fYvyiYRyArwdF3m1iFIkMzfoG5lCKDvDzs52JwZiMnll
         F1Lqln4FPy2QkLGj1N1jyKmsO2bVCAxv9eWpR+GjjqRmDOLjzd7JMmBwsEy8RhNptupI
         WAYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mgxwE91z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x200si424353ywd.163.2018.02.09.07.02.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 07:02:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mgxwE91z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60265 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekAC2-0007dK-Ko
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 10:02:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA5A-0002B1-3O
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 09:55:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA58-0005Sp-6y
	for qemu-devel@nongnu.org; Fri, 09 Feb 2018 09:55:20 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:40828)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ekA58-0005ST-1p; Fri, 09 Feb 2018 09:55:18 -0500
Received: by mail-qt0-x244.google.com with SMTP id s39so10838642qth.7;
	Fri, 09 Feb 2018 06:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wY//D2TOSIUxA/+3Tz/qnHcjRg6V0zzmBzdlX6DyMlw=;
	b=mgxwE91zGV7qQTeHjAxwLKu2ekBxwkWYW4JLMRhm0zWb545LnoALZvAe9aLv3+6lif
	G9ys6giKe2sUSdqkX7DFdLHyl9q/lBo6spGI6rXPiX4IzOzQoRAetNJS3GREmILns/a5
	Wi4BgfokPsU1y1KWf8iSoFf5YPCaU422oJWAEeWACGFo1ff2kAf/w9vQfNQSkvlCSusw
	/9Lg00N8v9+S5zF/Sd6VeTtd3aEn/e8/GLPOQObt6LqLhRpRWpjZ9EJ7l9WOutr8lsEH
	HGSA/P83zWmNJFSVt6r+JrfjlQIXKG0GjDmh4EbaKzLgSaRckUVtfPYLMHantM2mWHxI
	90UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wY//D2TOSIUxA/+3Tz/qnHcjRg6V0zzmBzdlX6DyMlw=;
	b=LDrID36fCNCvO6kQEu4M63OYJAyvshO6gifh2cCBA9U6jXV+QaOX/6m1Fwt2m0hQ38
	g1F6ukT4M35bFFliYhxRY4MrrXJ6o5dLVG4BzMqzGa9/LrWN3C/HVtJ+WG8EqY37K+d6
	9OJk2boBE76T0qfSP+4A94dm4XJXseo0oaX01RSN6zLfCbUpKrbGNw24wPa4a8ASzQmg
	6CRINmrsw7OrJjvXOWx5a2Y08jAdaCI0TfG19wMzPBCRExQv1A/JrjNUTgV606WVEM5c
	vyMjJ6Juu/lBgv9X1LN4OmvSSiXeJBh/lb4BytNHcpxdI3125SdErNbf41n/JE8xRCgn
	Zssg==
X-Gm-Message-State: APf1xPAyS3rRuxeYZZhvpvZyiSu1p3k5V2gs9sLsnw/7fHGKlOGnfnbM
	anX46awYp6mcAt0kc1aPLWI=
X-Received: by 10.237.55.33 with SMTP id i30mr4948536qtb.95.1518188117449;
	Fri, 09 Feb 2018 06:55:17 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id b29sm747841qkb.28.2018.02.09.06.55.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 06:55:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri,  9 Feb 2018 11:54:14 -0300
Message-Id: <20180209145430.26007-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180209145430.26007-1-f4bug@amsat.org>
References: <20180209145430.26007-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH v12 14/30] hw/arm/exynos4210: access the 64-bit
 capareg with qdev_prop_set_uint64()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m4BA3fXcT+lo

We only set a 32-bit value, but this is a good practice in case this
code is used as reference.

(missed in 5efc9016e52)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/exynos4210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index e8e1d81e62..d89322c7ea 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -378,7 +378,7 @@ Exynos4210State *exynos4210_init(MemoryRegion *system_mem)
         DriveInfo *di;
 
         dev = qdev_create(NULL, TYPE_SYSBUS_SDHCI);
-        qdev_prop_set_uint32(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
+        qdev_prop_set_uint64(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITIES);
         qdev_init_nofail(dev);
 
         busdev = SYS_BUS_DEVICE(dev);
-- 
2.16.1

