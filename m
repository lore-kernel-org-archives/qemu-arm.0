Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp458781lfq;
        Thu, 7 Jan 2021 09:07:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIszbEUK8F6K0NG4DLoQ0OpTVWqHeRwbYV/OlZzGtDpg75n1Qo4pQ2U7KdwjUkWk0LxgIy
X-Received: by 2002:a17:90a:12c4:: with SMTP id b4mr10050936pjg.234.1610039248792;
        Thu, 07 Jan 2021 09:07:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610039248; cv=none;
        d=google.com; s=arc-20160816;
        b=VpDI4AxRu903jAyw813YL3ndv6HIwev/z19+MEFoUuJ0h1Z+0vBVMsrJLcz2afUTDy
         BSKAMczfim5x633sMsqvfyv0I1faivB9hPfVMaw5ptiheWNKvFGjHghJJtbZ0a8CO4cF
         oDM0swpsIvz//w4LTbD0YWOHj3x/a8mQx2IlygbLZO2zSvvtC8ihqtImKtHWqd6/7hda
         LhQK8S2LJFOi1KHYvQmAeuT0BOG5qG9eFU/+4LS+3s+NpEW+ZPnDDb/18KGYFhQbqMAP
         fwLn8sRLVnxXM3qvY4dt/2UldjpZw4dm1U//XN6/HGYkwbhI4/hPIbRWObf78Xb5t++w
         r51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Uke6rj/BMfTrOj+mmj4Z5drXQo0g1uHuJzjtAYJqDAs=;
        b=pUVznf5sIube8nRdnQsAyvmObrTVpvq/mC9QUjw7RDMDMiWyBaSecN3vXog7tL0ZfW
         YX6pki6n3N9EdnQ+Y4qSlEcF/tYZvenYHKfSWwcqsA8hgavJ0Evj/Qvo9qtBF7EV5nKP
         3jm2YfvWJIwLEF8of3ZHFvwrhhGlkaUdPb28fn3yNmE1jjx7pc0pL5BdKlMc55SPWqs3
         vheaA5svFejxTWuKbrsYim5SiqSiRx+aM0PYFRh8nG52rJ+EyA8Iy+ySxWBpPwecKobx
         ajMFaGKyjEdj3MkVjv/m0caNGpLqM2f8PxM5m+/J7rbXRkRfdEcC5/fhukdYNpQtgMJj
         h2Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=Zfa93vr1;
       spf=pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@vr.keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@vr.keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id t27si5937571pgk.509.2021.01.07.09.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 09:07:28 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=Zfa93vr1;
       spf=pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@vr.keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id D09783F2E325;
	Thu,  7 Jan 2021 09:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1610039246; bh=bhuL9gru7dcwx7hNurPSG0LXo6Gk/htLgalKFE4yYNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zfa93vr1u9afwP+YSO+A13dxkreCFQveHsyyh3lk7ZvpgWFrCvari1WRkCYDBrWKT
	 4C3W4Q0V7YYrTBgZG8RPH5RWHfD9E8zLEKNNrmnrm9ZJA2dHpLmq+8abhN5wXaR7uF
	 MzuWNAKCfX3SC17bNbirn6LgVAAhN8HwiAAPnusmC4/pckjgjzGdoDp1ddRN7iMxYg
	 2qDwD+pw/JAr+5Sn6kpL6iB8VsXe9pD6ZSd4spIWWZ196KRmfeuveGVR27BRp+6zFO
	 J+OHYaEh9NPRZNBPrPebn4fce8N33gOC17EvQqHkyR86LsCinpfrf6/3PVRgWmJ2Ww
	 IOV3iCgfXpTUw==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TcbzPHBZo4ah; Thu,  7 Jan 2021 09:07:26 -0800 (PST)
Received: from vr.keithp.com (vr.keithp.com [10.0.0.39])
	by elaine.keithp.com (Postfix) with ESMTP id 0C36B3F2E35D;
	Thu,  7 Jan 2021 09:07:24 -0800 (PST)
Received: by vr.keithp.com (Postfix, from userid 1000)
	id E3715742D0D; Thu,  7 Jan 2021 09:07:23 -0800 (PST)
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
Date: Thu,  7 Jan 2021 09:07:14 -0800
Message-Id: <20210107170717.2098982-7-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107170717.2098982-1-keithp@keithp.com>
References: <20210107170717.2098982-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: yPXXUdwnGm+H

From: Kito Cheng <kito.cheng@sifive.com>

This could made testing more easier and ARM/AArch64 has supported on
their linux user mode too, so I think it should be reasonable.

Verified GCC testsuite with newlib/semihosting.

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Keith Packard <keithp@keithp.com>
Message-Id: <20201214200713.3886611-7-keithp@keithp.com>
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
