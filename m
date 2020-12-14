Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2877525lfq;
        Mon, 14 Dec 2020 12:07:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybdEABga7r7In8BX33i+qkoOujBbWR+KSImVKsVVrznri1W7tc/qT9qdeK+OffygdZGLai
X-Received: by 2002:a63:804a:: with SMTP id j71mr22788397pgd.307.1607976442765;
        Mon, 14 Dec 2020 12:07:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607976442; cv=none;
        d=google.com; s=arc-20160816;
        b=epcrpaXc/HDIL5viYO7UB3yciso6H5oTY7Geq+E6zVIckJaD+lN5uUGFRkPP9CeLz7
         01ESXOdxidAgPVdhnCCHo3S2HL62SFxpY7INhVYx4i4CKvM0He1Xvenjlsli8uaGIUO4
         ReV+9P4t4xst3ebHVu1qj2pT5to75OWLT74L7qcwk60vpkQB9HEVg/CQAPNMX59qdadZ
         KQH6ZCM9TrNFmwZrgNLlpTLj9lu2xmswfANhm+ZvEXYFZPVZtKKwDGNNXU9YG/5APKT0
         xquSfV0tYIhGTMi3Ti0XBcJ5LUaPfDnr8BnspmcOyRsZpEuCPVpVIpy+kO9mEPDkh+A4
         RPJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=D7RyhcGqk00Azp53vjwcq+tBOBajGKUzjE+kCsGHKxo=;
        b=ZXhgUqDxtESK4hYg+a8iKwSrc2G/7GGilxi1yU0Yx1sQqo7WQiMEIShJ8QNNvhMtiW
         /W3wrJ/qZ2vfaAy2MrTXzxeZPv/Q9s61+Bkuhfa/p+lTQx0vhmpuXWXJx0tvdwX4L2Ia
         3egUerL8ZF/wZFN6arMnDUW4S6yrDcEgpJES5hO0kPd3BkIf2daPRcZT3LMUjiMrYc9q
         9NQYBjv35GBN79yomyoCrzPYFRXDedT/WLLGzjRymtKNFhlb//Wcf3dDhF5/ge0xAWZb
         jGGgbmb81pgCgQulNO+9TfqXh43ZoMm3IThv6H65CGQPUtO02ziu1PiKqCZT+j1AZllp
         t9Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=F4DhU0zk;
       dkim=pass header.i=@keithp.com header.s=mail header.b=woPLroOD;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id i11si17636347pgq.11.2020.12.14.12.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 12:07:22 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=F4DhU0zk;
       dkim=pass header.i=@keithp.com header.s=mail header.b=woPLroOD;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id D965F3F2E37D;
	Mon, 14 Dec 2020 12:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976440; bh=AY23CfBi0c3vtSQCvpxnzKbVG3QpC88qHLH0dGoVpoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F4DhU0zkZL89XzzLTcsmt+odzuBk4TMpQH0ZNS25zBVNqS4y/eQ0fjZ06k+wyufyb
	 9FlUvkf5JHzFZVZXI/gp3GTMMFRYiuqt1MA9PTbryEw2YaDCih+tLoz8eoI6CNygPO
	 L0Bv8S+5Ps4cvuwsZ2AziOTlU5Kj51WGH4OS2lp59a4DWjBhYxegcF25/fgxhN+R2K
	 XbhSYCzolyJih3+/V/scdIct3Tebe8xX4oZL36/1TftDUvDN3oj9nB98pILMLU1PYW
	 +/7eM0FvFXknSZmJGueP4kVZjp4u4+q3XilvU4PNgKTLSJkBOkvyriFalZ/eFxio1i
	 YztD4EnozOeGQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EnWiC6NnVfvt; Mon, 14 Dec 2020 12:07:20 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id C99493F2E391;
	Mon, 14 Dec 2020 12:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976437; bh=AY23CfBi0c3vtSQCvpxnzKbVG3QpC88qHLH0dGoVpoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=woPLroOD667jpLIvfckXEoyx0d1jgITfLVKizZm7SGP6zEAdSbsXLTKSD84Tac0cv
	 Bp9p0qroqDceD0XI1ztXljgEARTqs3nhAfmPMpLyleXMMS89YqbXVtVZD/d0R7PrTV
	 gH55FkFrhotquAHmejt2vJnw6nOCd0LrBToXZEWWulKQlWacCmRFkJxLSBaf/D4F1S
	 jrAvrO1Vn+m4UWSR9XXJVk5De1XWsznlpXaqv36WnVGHL5D69tAlc8VfroTmOxFEuh
	 7LItHvaRvl/W/7nPUZ8YFNoarMlJbnyMLWhAuGVa040TXpgF0fjgIxMecQ7AR1+hij
	 vCpt7pGLTpmww==
Received: by keithp.com (Postfix, from userid 1000)
	id 5964F1582298; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
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
Subject: [PATCH 8/9] semihosting: Implement SYS_TMPNAM
Date: Mon, 14 Dec 2020 12:07:12 -0800
Message-Id: <20201214200713.3886611-9-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214200713.3886611-1-keithp@keithp.com>
References: <87wnxktost.fsf@linaro.org>
 <20201214200713.3886611-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZH//WE+7II4/

Part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
---
 hw/semihosting/common-semi.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index b1368d945c..b0648c3812 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -835,6 +835,7 @@ target_ulong do_common_semihosting(CPUState *cs)
     CPUArchState *env = cs->env_ptr;
     target_ulong args;
     target_ulong arg0, arg1, arg2, arg3;
+    target_ulong ul_ret;
     char * s;
     int nr;
     uint32_t ret;
@@ -998,8 +999,24 @@ target_ulong do_common_semihosting(CPUState *cs)
 
         return guestfd_fns[gf->type].flenfn(cs, gf);
     case TARGET_SYS_TMPNAM:
-        qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __func__);
-        return -1;
+        GET_ARG(0);
+        GET_ARG(1);
+        GET_ARG(2);
+        if (asprintf(&s, "/tmp/qemu-%x%02x", getpid(),
+                     (int) (arg1 & 0xff)) < 0) {
+            return -1;
+        }
+        ul_ret = (target_ulong) -1;
+
+        /* Make sure there's enough space in the buffer */
+        if (strlen(s) < arg2) {
+            char *output = lock_user(VERIFY_WRITE, arg0, arg2, 0);
+            strcpy(output, s);
+            unlock_user(output, arg0, arg2);
+            ul_ret = 0;
+        }
+        free(s);
+        return ul_ret;
     case TARGET_SYS_REMOVE:
         GET_ARG(0);
         GET_ARG(1);
-- 
2.29.2
