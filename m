Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp456874lfb;
        Wed, 1 Sep 2021 05:54:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWrkUly48zd3ZD4wHvcJH8BcxHvrmeC8JnE90tQGyBjLTx+fYvv2gEqXAOKauNH9p/0IDW
X-Received: by 2002:a67:f553:: with SMTP id z19mr9598629vsn.50.1630500876462;
        Wed, 01 Sep 2021 05:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630500876; cv=none;
        d=google.com; s=arc-20160816;
        b=V4LgBG0uYPQz1h3z5XB4+Z+z111xHHYJaLkNKQAC1Eq1roolaj4r2rMJ0W7rTfoDEo
         PeLvDpY9Xihdf8MqVe9Qc1r/gZuaz+aRaXbxVsGQOD0Ytv9GuIISRBkYUXfuR4CiDpe/
         MotDD7Q9zwrzoZCbTgkG6c1AkwbY/IewQH4khHcHfQZPGt8No5LN6kPtyqHM4odKi22S
         HN+CCa5iNJlHwFcMTX5K93ykbflhvDFOjlPAeVV3u/Y2S1V/yENvepKrjKpvLWwm4noJ
         J+a+DxnFA6Ctrr60ItBbKaQccfkNwMgHBpgmu1uiIH4Zpfs1jGot3U7qwmLaj47s+sgG
         T8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0+KB8VLhpjDCIb3k+XnxOMKOakzrhTJnwW420hgy2YA=;
        b=KWX/YuAb/CRZbddOm2OpWvhxoPgG6OC7H8Yz7IZ/Z4BEXs9aeNnMGg442UCL688o6f
         ISL+Ay/7PAggA4gpSg95cLvxFUAMwxV8faWxMDokpbf7nH79i9H/cmn5jug5HNqSw6r2
         1awfWMqPSJxNcDR2qAgwL1rOFbuqq9hlTQVMdJf9TV6ocR4T0FaoHZ+iK1cfnVaUBNBP
         oycap3Ud7fP2FGcVueknFzTOWHJh930kYP0wwXuWPMAlgYpHp1iQv01PJTr4akIevqVy
         3KNr7igNU8/yB46AQRtepKn2m5MXTE/u5a0avX5PEBjIls5zNIqg21gW+s3gYQXmgXEI
         hLoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=RO630i0c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5si979710vsp.381.2021.09.01.05.54.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 05:54:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=RO630i0c;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLPlD-0002rZ-R9
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 08:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPci-0003jA-4o; Wed, 01 Sep 2021 08:45:48 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLPcg-0003ge-LG; Wed, 01 Sep 2021 08:45:47 -0400
Received: by mail-pf1-x433.google.com with SMTP id e16so1953240pfc.6;
 Wed, 01 Sep 2021 05:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0+KB8VLhpjDCIb3k+XnxOMKOakzrhTJnwW420hgy2YA=;
 b=RO630i0c4UDvUHAZSkxa0pOSVXjJUThL3Hyu+OUN7brYuo9Jqz7YAAE3FGZp1VRP7D
 ESPg08odxk9ypns5U/F8qejexBpcM7Wcpy9UwxM8r1mvupm2cJKLZB0lqZslyKTVnRiu
 7YpMqSsK+86d9ecfHQJ4IXjvZuBEEKdyAUHiCb9WH/nC3ZSb6/yjt5zLNDBhm0hBdi7Q
 u4YKqZ8jh5uuEhuevrWKS4Eh4M9UZbqx8PEZYaNg77+aPfI0crAQnoR0UHZaYhxP7NO/
 MVDC0sm+SknNlkm2umscYZ1j4xCYG1IMrKP6ZxqZiE6zK7cpI2yGQaGH+GGbZrIvx8Cv
 QdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0+KB8VLhpjDCIb3k+XnxOMKOakzrhTJnwW420hgy2YA=;
 b=hQRFyoXBzkTReTTCQzZuKeBA8nMBwfmdYniSC7uXDyJiExDyhIeDNLFKDwnRynjI/I
 hC3sNUQPf458TbTtt+LyGP1KFqWIKSmQMvs6cvZ48B2Tug+48BPFvoqUF83WQXHKoA/o
 3W7daS4tBXMlWpwrFFWSz603bmaBonnBXdV0RzjzDXSsms2eFjsJwl2Ez21QWQx7Zzc4
 zJ/TDGomzyNG4lJfO4u+52mAl6XYcyjxd3omBxUQWnkJ4VUHfC+YGOcWA4yahJo6i/aG
 hIiO3YmY9hx93F5vxtHwaRI/wttdj6Dt5H/CbkfEDGhUT8E8f0etKhrxBhGKAn5RzzgC
 MYZg==
X-Gm-Message-State: AOAM531SXaqpg6C9HT4Y+XKqmeNXqWSCQ0Sb/Dn7FNNoxC/06TDeWOU4
 DNRkMXLdihP9RDeztxfDMKE=
X-Received: by 2002:aa7:8d4e:0:b0:3fd:b14b:950a with SMTP id
 s14-20020aa78d4e000000b003fdb14b950amr17922569pfe.26.1630500345130; 
 Wed, 01 Sep 2021 05:45:45 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d22sm20917134pfq.158.2021.09.01.05.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 05:45:44 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 6/6] hw/char: cadence_uart: Log a guest error when device
 is unclocked or in reset
Date: Wed,  1 Sep 2021 20:45:21 +0800
Message-Id: <20210901124521.30599-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210901124521.30599-1-bmeng.cn@gmail.com>
References: <20210901124521.30599-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EYuE2xo4di0q

We've got SW that expects FSBL (Bootlooader) to setup clocks and
resets. It's quite common that users run that SW on QEMU without
FSBL (FSBL typically requires the Xilinx tools installed). That's
fine, since users can stil use -device loader to enable clocks etc.

To help folks understand what's going, a log (guest-error) message
would be helpful here. In particular with the serial port since
things will go very quiet if they get things wrong.

Suggested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v3:
- new patch: hw/char: cadence_uart: Log a guest error when unclocked or in reset

 hw/char/cadence_uart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 5f5a4645ac..c069a30842 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -240,6 +240,8 @@ static int uart_can_receive(void *opaque)
 
     /* ignore characters when unclocked or in reset */
     if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
+                      __func__);
         return 0;
     }
 
@@ -376,6 +378,8 @@ static void uart_event(void *opaque, QEMUChrEvent event)
 
     /* ignore characters when unclocked or in reset */
     if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
+                      __func__);
         return;
     }
 
@@ -413,6 +417,8 @@ static MemTxResult uart_write(void *opaque, hwaddr offset,
 
     /* ignore access when unclocked or in reset */
     if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
+                      __func__);
         return MEMTX_ERROR;
     }
 
@@ -478,6 +484,8 @@ static MemTxResult uart_read(void *opaque, hwaddr offset,
 
     /* ignore access when unclocked or in reset */
     if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: uart is unclocked or in reset\n",
+                      __func__);
         return MEMTX_ERROR;
     }
 
-- 
2.25.1

