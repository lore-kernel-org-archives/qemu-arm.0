Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2877516lfq;
        Mon, 14 Dec 2020 12:07:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyV7YyPKvOp5FE775eHx0UtNLSj7R+t/U7emlvhmED5mAl++cXVGf2xO0fwt7OThwupoe3s
X-Received: by 2002:a62:1b06:0:b029:19d:d05d:f67a with SMTP id b6-20020a621b060000b029019dd05df67amr25195062pfb.78.1607976442355;
        Mon, 14 Dec 2020 12:07:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607976442; cv=none;
        d=google.com; s=arc-20160816;
        b=Cu5Gh2xVdy+0QpLrQ8xU+DUZMXZAGIK16096Go1Oh1fi8WEHu9IHVJh0liHFBSzs6O
         mW1EWo/4F2pUW3i+nmKrMQAhHPfpsyULkDBczqkZRRrznGnklcDmcW4u0TMSwZ+DLK8y
         /ccu+ZGBJan7II2FB/stIcZj9rMm4vQksvvkU04Pf4Un2sjcSYWR5wRPjqyAUTF681LN
         XpdloccUXJ/KZCOr7kLHj5580HnXvybWNDre9hiJ0aAoo1kl43CRQD8b7hDm7tBvEpa0
         g7aAf5tNyqiP2H6aoG4n76j2nylNlaHdcR/bcwhjdl3n/0gvZFJ4wjmzPI8KJsZrMgOX
         eMUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=hc1suCpwgqGstWBGIr/Djt3Z4l7yWC89pyLo8A6B0VE=;
        b=NPAVacmzDwpxy5MXHtQQY+04SdYpSu95b81Ho5+9N01fFUMxafVTdWcbAq/CQEY2V2
         PibeiZcCzqc1wVn7bW09XEIxEm33t/HaxwRpoaI+k9+zvkVrWCOEim506Ll9SXSm53Gh
         gzSs7UOGgKAU6ng7Bwswl1ry7UvxK/io9HkNeyZPI1AB0zwU4saY7UBMgrj9qaBKRWmW
         nAJDvszO9bVP9WnuaSiPjduHFIIhAdoSYG0iRiLklbbcn54Ui94aNQhqc5osKQ/Rpoif
         8PPTGkZOv4EK8P4zezs/iKQErQJw6Xhk4iwEbGLwE2rb+6lCASHwmzJ3HhDfcnQvp989
         HT7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=LuNw2ZaD;
       dkim=pass header.i=@keithp.com header.s=mail header.b="lQikXlR/";
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id n5si16954722pfo.305.2020.12.14.12.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 12:07:22 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=LuNw2ZaD;
       dkim=pass header.i=@keithp.com header.s=mail header.b="lQikXlR/";
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 06ED03F2E37E;
	Mon, 14 Dec 2020 12:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976441; bh=SHaBrTVYFaEGb4To3qkPAGlihv7272MZZpVhhlOyO1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LuNw2ZaDvhHrmM7DlwbXWqyGt2Kk9rujLnzy/QZ4H+oIEZXwsEabvd42ct3sBYxJQ
	 dhzaIj0BHWQtEuPWc0ls7XoDqX0sySvH7xp/45BVT193CgV9yeHdyUq23aNrTBy9Ql
	 9m51qYuqxRucJCE+skVCfhlZYs1id6fnWIm3gdUJouR2+GFdkr8g9vf6ZEiyOdq8az
	 eR3FxEVi8TkYVPmMqTxNCWe4MYz3tjiycXVDW5O/NVAMxhe7my/qqXvRaLW/1FBjw8
	 Zwu5MJhneaLY2cEVlnxYYVPg2VTwmaZsB6sYeBG2pOforKDbW+EVcUpN9KReHoyJxw
	 Bw6g4ohH4X7Zw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id moJfYBEkvgQC; Mon, 14 Dec 2020 12:07:20 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id B9C4C3F2E37A;
	Mon, 14 Dec 2020 12:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976437; bh=SHaBrTVYFaEGb4To3qkPAGlihv7272MZZpVhhlOyO1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lQikXlR/ZLy2EEIdkPMWnOYaq+lT+w1rFYuaydjqXOv/u/TSZgZcBK3GnEzbFDKSa
	 WmA5r0hhgDMoAvK5686xqXRVhevCezaIxVtL4hddEyYfb/cbmER4LUC9TZTl+jc4vG
	 p/0tIlBAQAILOj/A/r8XIzl3OxUgVkaMCPisErvR1PNCA3MyzE0+XyF6wGh+nLrc27
	 N3pFw9J+hHKgO0elyDcMuU9Z84PtVE3CKhqoUGAYlrdbi9EoZv2I9Oe9WcKKYETV/4
	 c4/zoDtpN6rkBDd1toMt0Lj2BhRen2SRStr61AQ6qXj8JSflFxLgM5bsFM+uFRNx3E
	 rTWCjTjz3Yz7g==
Received: by keithp.com (Postfix, from userid 1000)
	id 50F581582231; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Kito Cheng <kito.cheng@sifive.com>,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH 6/9] riscv: Add semihosting support for user mode
Date: Mon, 14 Dec 2020 12:07:10 -0800
Message-Id: <20201214200713.3886611-7-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214200713.3886611-1-keithp@keithp.com>
References: <87wnxktost.fsf@linaro.org>
 <20201214200713.3886611-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZJtv4i2HXQ+u

From: Kito Cheng <kito.cheng@sifive.com>

This could made testing more easier and ARM/AArch64 has supported on
their linux user mode too, so I think it should be reasonable.

Verified GCC testsuite with newlib/semihosting.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Keith Packard <keithp@keithp.com>
---
 linux-user/riscv/cpu_loop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
index aa9e437875..9665dabb09 100644
--- a/linux-user/riscv/cpu_loop.c
+++ b/linux-user/riscv/cpu_loop.c
@@ -23,6 +23,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "elf.h"
+#include "hw/semihosting/common-semi.h"
 
 void cpu_loop(CPURISCVState *env)
 {
@@ -91,6 +92,10 @@ void cpu_loop(CPURISCVState *env)
             sigcode = TARGET_SEGV_MAPERR;
             sigaddr = env->badaddr;
             break;
+        case RISCV_EXCP_SEMIHOST:
+            env->gpr[xA0] = do_common_semihosting(cs);
+            env->pc += 4;
+            break;
         case EXCP_DEBUG:
         gdbstep:
             signum = TARGET_SIGTRAP;
-- 
2.29.2
