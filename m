Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1538564ejc;
        Fri, 13 Oct 2023 07:12:17 -0700 (PDT)
X-Received: by 2002:a05:6402:951:b0:53d:a4a3:e5c4 with SMTP id h17-20020a056402095100b0053da4a3e5c4mr8396975edz.1.1697206337779;
        Fri, 13 Oct 2023 07:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697206337; cv=none;
        d=google.com; s=arc-20160816;
        b=MjbiotrVoc8Jge0e/7L5ouDuRlhl/1cp2HHyG/67d9ZgeYMbzhX0zyfOrmSQzUXIsu
         3j1aL1f/OJsEiclsYSS725AnLN3g919qrdBGALDm9mxxbP8QDKeF1E8yTzFpGO+UIN5K
         X3b7hZvf297Tg1Cs+q7N+wFSx9pk5bQiLrYnXjWqPItZZC9Lu02lY3wZppMn3Ajmqcao
         6NfRoMaESD5a4aWa4WjBmDUwmVNGSAgBLtdNzIbTCZRCT+HhJL+9ym1HFceUXzxsZv44
         LYobEATnWPVIsigcm7IMv8PVXTExH1pLmuJmGaHhJy8nUEzYOF85UOX4vIUlvVxBoNeP
         a5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TEZCH3t9203jXT8Ca8hiOxWdvxGRGRt32KSzy33l+nU=;
        fh=MusjSs7gXCZ/MKYOlww+3pkKR+FOAC+Wy5x6PlCIutc=;
        b=C1QT8ZFbgTrzTSnt9ywa560Beu/KRdzc2CLTJVcS34+WqssH2MSKUSZQhSj0GemidL
         xGqEBIVQAUYP+2zzHdlkfpI2HR/FLpyk9CApCYmStZltoR0Wh+tIT7JbmdTMbpk91dJJ
         u3MppxA3K/PcftPYcWRXvXEAZPyh8scLv8R//Ww355d5UI83KyLRXgDALW00dKpItkEb
         py3i+l6+ExdsGwCtNUvPU0uzhRPm+/lBH1x/ey5oL7oRTh/KLnTMvcpmhY1Pxqikt9r8
         tvtQt3YA/2/9OQNUqeurrFhWu3BjHMfZmIN3crqae7Sr1a2nuQHee9qwUP751NmSNCiZ
         4LdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WIpEq8vP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v16-20020a50a450000000b0053e563572acsor377136edb.12.2023.10.13.07.12.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Oct 2023 07:12:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WIpEq8vP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697206337; x=1697811137; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEZCH3t9203jXT8Ca8hiOxWdvxGRGRt32KSzy33l+nU=;
        b=WIpEq8vPPgQYrHCG2DdU6dGjVJCfHGi091Dmxo7PNpDXg+2T5E9rv+gm7kxgai5hvP
         6hW7A9B8Rvj82ITasof4b5ObjAt4S+P03Pvh/nCE7e9eMO4a307WL8LdZGyOr7XfM7ef
         N+ndrtq+nWuAF2ZODQUMEGr/AawjRQF/HB0hltX+TWBhyjzmRGHS5kem57lDNP3nqRtT
         gS0qmxLjhTd0J2MvEW+4ykUAsBQfSF3mtpljUOhMQBPr15FjuOQgU5MWc53AJ7GyatTI
         TTDBL2/qknYoyUBJ9O+5r7mgnLC7YbFXTtlCyqfcf+X03hNzYWM1SnenwzpOb2mIGtCs
         /QDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697206337; x=1697811137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEZCH3t9203jXT8Ca8hiOxWdvxGRGRt32KSzy33l+nU=;
        b=OCs3n0WiqouH4pn7QSDuiNP6Rp8wRp4HPyhCnlbG9pW9QspCLRyzP+BSzD/ntWoouV
         mM5Yz9vkC/bgZFjEtWB86i/apdMIMbROFn2bb4JRoeDR6pNjJ2JWI3jIswlJSg/vqkky
         N8kiiVVKLP8PbEMvYkeDgDXR8ra8k3L5gOfRlpMR+Oqcp+lqSYxyR11+l9XfrfECp+Nr
         5arD6mQxrI+OOcLKIJI64+bAaGJi+CEjymet8eZ0tbVEWOkQK6km+tvWZiPLGmeovlm0
         6jqJNZQlu6fkdVBNGhsIE2sYTDJT9G2WUEnvnCjZnz94kxo19rGimo8184XRx9M79Ktz
         SAvQ==
X-Gm-Message-State: AOJu0Yxnbcq1Q9vM9QKggaYazWJ3iEvCjGN4v3bnGtqgHA8q6BtVuSJw
	CYnCAeb0A+Nw73jAa676Xa9yjEMo
X-Google-Smtp-Source: AGHT+IHX4ugufWGqluImCZdUvxTDlFZ2SAOuBxWXdJrjlcL7BU5CoDVnCL1SAPP5XnXA6WFLpGEx+A==
X-Received: by 2002:a05:6402:35c5:b0:53e:6215:76ee with SMTP id z5-20020a05640235c500b0053e621576eemr229010edc.10.1697206337349;
        Fri, 13 Oct 2023 07:12:17 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.172.118.168])
        by smtp.gmail.com with ESMTPSA id c25-20020aa7d619000000b0053622a35665sm11366351edr.66.2023.10.13.07.12.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Oct 2023 07:12:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gavin Shan <gshan@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 6/10] hw/char/pl011: Warn when using disabled transmitter
Date: Fri, 13 Oct 2023 16:11:27 +0200
Message-ID: <20231013141131.1531-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013141131.1531-1-philmd@linaro.org>
References: <20231013141131.1531-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mcAitVPvDxcC

We shouldn't transmit characters when the full UART or its
transmitter is disabled. However we don't want to break the
possibly incomplete "my first bare metal assembly program"s,
so we choose to simply display a warning when this occurs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/char/pl011.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 30309337b1..9c43cb47bf 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -76,6 +76,10 @@ DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
 #define LCR_FEN     (1 << 4)
 #define LCR_BRK     (1 << 0)
 
+/* Control Register, UARTCR */
+#define CR_TXE      (1 << 8)
+#define CR_UARTEN   (1 << 0)
+
 static const unsigned char pl011_id_arm[8] =
   { 0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
 static const unsigned char pl011_id_luminary[8] =
@@ -151,7 +155,12 @@ static inline void pl011_reset_tx_fifo(PL011State *s)
 
 static void pl011_write_txdata(PL011State *s, uint8_t data)
 {
-    /* ??? Check if transmitter is enabled.  */
+    if (!(s->cr & CR_UARTEN)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "PL011 data written to disabled UART\n");
+    }
+    if (!(s->cr & CR_TXE)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "PL011 data written to disabled TX UART\n");
+    }
 
     /* XXX this blocks entire thread. Rewrite to use
      * qemu_chr_fe_write and background I/O callbacks */
-- 
2.41.0
