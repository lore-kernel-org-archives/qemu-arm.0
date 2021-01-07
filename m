Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp458827lfq;
        Thu, 7 Jan 2021 09:07:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyo9ivCGgJ96DwZ55kKApMauEwXGZRWm2yVJrYlSx5W/LwEQnD8dNbxmE49d5pCGM8oohbT
X-Received: by 2002:a63:2f05:: with SMTP id v5mr2762257pgv.3.1610039250742;
        Thu, 07 Jan 2021 09:07:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610039250; cv=none;
        d=google.com; s=arc-20160816;
        b=vMX5HdFGMTFN88b3XMt4DfuRMhE64Djutp/TDfjEkVt1NvMEyZOhG2BqA3qVl8+hf0
         eYv+x+rQBfaMqbWu0nc0yHLGNL9pGYYNOaf2cl8i2ybdYwNEwklxMKn5ndA4iis6U2uQ
         wRHm7Lbn9esVcIR9HQWvYyrPdSHKjmPp/8smaggEARXl2neqPN8h+UG/Fz0I+/kanjuE
         Vj8IDrJLoXyVaBoHWaIkGF0hpASqoN7C/vwZ+UyjlLEMtTS0TcZUyOOUkP/eiReBhOgw
         kujMAkNcXxb29IDNwP8ktslBwG/76kdCwwDw8XYONiQ/M3+DOr54hGGshFduv5tVyavg
         0TnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=X1nBrXGmMa8+iBcR3EBa2x1e1Tl5MGlUj6LLaGHYxdI=;
        b=XZfxj1DuvyslOqJUmXF5BHZ7hH0vm1d+gX4N1vEM5cRVa/KrGK0fbQdiQuvm5XvpaK
         NKALk3cBWFRCcdCBrntUIqxhO8VrlWSrTuT+wzcRfeM4pMbr5OFtQ/9HG9AAcpw6uiiS
         pvUM/Yqco7oj+1X4jSXm/y2p32cVUZPnSg4x6lJVWkKj9pVN/k+hzi0Tik8zGHa2QuFE
         jubfWep3+fZJ4ehLh/SbO/okvgigKroMUWwrMPvnoC4fy1ufv+3LDnie4MYb0LeBIGJz
         CGitUVUn+2lPf3arzirPR7AK7YZ2qp1B8oZ25AMbGXH7JBVry1usoPhOqErHc6rpGnS1
         m74w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b="qln/jqfq";
       spf=pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@vr.keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@vr.keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id j2si6980403pgt.342.2021.01.07.09.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 09:07:30 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b="qln/jqfq";
       spf=pass (google.com: best guess record for domain of keithp@vr.keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@vr.keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 5F4A73F2E377;
	Thu,  7 Jan 2021 09:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1610039248; bh=ao8BkiJUDNltJDG+znPk84V3JVHLPOPySPB5Z6oOHPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qln/jqfqzdkN5UkA4Tazx5hFW9ILpQ3FiHixTYXWoPgicwLoX60GNyr9/yTephVEp
	 X5sL1Ggkbk1YnY7o2g0r8qX1F58bdCTKENW4nYxpnjgGziR6yWpXQFJjyuGqnlnDW1
	 kGjqBZQtciu9s8Y3vnsetu0MBlN/lu9Ljg5Tgjw0aooyuVdOl6HbSTdO3dQ1SW/aGi
	 0x1/FL4upVKNzLlIWgui3hown/sZwxi5w8tPvwl1eM5P+czxFdXkY1HUeTBG8dDthm
	 0eLQxpqd7Sb+vntjZYdGxMM3CVBqzhJ+pnRGWp0L5ti3tm0WppbUERh7xP+q98/ne7
	 J1MgTICQ+Dkdg==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XOUfMGZHfuGL; Thu,  7 Jan 2021 09:07:28 -0800 (PST)
Received: from vr.keithp.com (vr.keithp.com [10.0.0.39])
	by elaine.keithp.com (Postfix) with ESMTP id 49C3F3F2E398;
	Thu,  7 Jan 2021 09:07:24 -0800 (PST)
Received: by vr.keithp.com (Postfix, from userid 1000)
	id 3DF96742C6B; Thu,  7 Jan 2021 09:07:24 -0800 (PST)
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
	Keith Packard <keithp@keithp.com>
Subject: [PATCH 9/9] semihosting: Implement SYS_ISERROR
Date: Thu,  7 Jan 2021 09:07:17 -0800
Message-Id: <20210107170717.2098982-10-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107170717.2098982-1-keithp@keithp.com>
References: <20210107170717.2098982-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 8FODJNuzlg++

Part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
Message-Id: <20201214200713.3886611-10-keithp@keithp.com>
---
 hw/semihosting/common-semi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index b0648c3812..abc15bf219 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -59,6 +59,7 @@
 #define TARGET_SYS_WRITE       0x05
 #define TARGET_SYS_READ        0x06
 #define TARGET_SYS_READC       0x07
+#define TARGET_SYS_ISERROR     0x08
 #define TARGET_SYS_ISTTY       0x09
 #define TARGET_SYS_SEEK        0x0a
 #define TARGET_SYS_FLEN        0x0c
@@ -967,6 +968,9 @@ target_ulong do_common_semihosting(CPUState *cs)
         return guestfd_fns[gf->type].readfn(cs, gf, arg1, len);
     case TARGET_SYS_READC:
         return qemu_semihosting_console_inc(cs->env_ptr);
+    case TARGET_SYS_ISERROR:
+        GET_ARG(0);
+        return (target_long) arg0 < 0 ? 1 : 0;
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
 
-- 
2.29.2
