Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1765647lfo;
        Mon, 7 Mar 2022 12:09:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGUkqhmFdq7md66jpPH5BYWUmpZboY89yIBll7TytlD63YBz4URUm/nKkK+ovG5cW1/MiQ
X-Received: by 2002:a25:e751:0:b0:628:68da:c25 with SMTP id e78-20020a25e751000000b0062868da0c25mr9843395ybh.123.1646683750640;
        Mon, 07 Mar 2022 12:09:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646683750; cv=none;
        d=google.com; s=arc-20160816;
        b=AfLlGOnyBQg8y/no37L/CZzq16SQeMkicMg0mfswe1qpmzCLJfT+E7P5w1ymuzooCt
         jn8JQwZPfS6EYIYI3k3jFMJ99yp20CmgUh/s/LuTAUIuWCofVL0xysu0IJb9EWkVYjB9
         17b0RRHztEdGM5zKjgwqQ35LfgK5NVDUkPFDfTxgzTr7IR1FENrq3n/KK3Rpb6Tgv68/
         CguaC7bXqdlrzKcMOMbwIquYDPM0vwef9/KRxA7C4nXOf9G7tZdFgmYlV2PeJU9vBt0K
         9Nb1JgZbFCFb6zWP4WIvt0iqPNcmwFp5j/LzhuzCwKitZctcbDqettwLNOPhux38GHxA
         t+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=LqhkxWS36ULXOg2FChbFMJ7upCoor9LOa8Ol8hX/PP8=;
        b=nvNnZdbph0ki5N7Q0xAezy7lPxRMSqkAHjmANB7XzWss8dOSSdvbeqBbQlJxFy/1dF
         J3ybFvdrFQYYfciFr8OWWqQHmv5ysmw36dBMIABnWL9Tfy/XhU5IwDD/akMWJclbmpZ2
         +HDisJP3vJZY+6LA/pUZjiNvslaZRa3hbDczpXdcoUuBzKQQuozByGtPB4iQnLw/nSxd
         H100JfF/2Cc+SedTAJU7gRXcnayuce1avbKabG9NaMajnb+/w+vIAcu29FKt1N+IR55y
         4obLHAjK7PKNmUku3SF3vCb4MER0Za+BxGAddLGDvtG5UJfS7X7MnT9tD1m22MUQI82E
         2T8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=aSCxrNE0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q2-20020a819902000000b002dc50bd1eddsi7751553ywg.277.2022.03.07.12.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 12:09:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=aSCxrNE0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRJfK-0002ws-3c
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 15:09:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <342UmYgYKCGARGRSQPEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--titusr.bounces.google.com>)
 id 1nRJdH-0007Ej-04
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 15:07:03 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=49694
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <342UmYgYKCGARGRSQPEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--titusr.bounces.google.com>)
 id 1nRJdF-0006Bb-CO
 for qemu-arm@nongnu.org; Mon, 07 Mar 2022 15:07:02 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 j5-20020a056902020500b00628ab64be30so13751820ybs.16
 for <qemu-arm@nongnu.org>; Mon, 07 Mar 2022 12:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc:content-transfer-encoding;
 bh=LqhkxWS36ULXOg2FChbFMJ7upCoor9LOa8Ol8hX/PP8=;
 b=aSCxrNE0UrcHG8MWSL0RBswPXOz3wF1edatR5bE9quRTJi2l8tIYGsJ7qvbaOxUkOw
 mUPExB02xVPA+JtTbNNKRRaq3Cw71HapghsPWXCTlplCMS2YjyBavhq4+ls7+OBXxMVy
 zZ8sXZmok0vwHTchPNYJuPKVHZtg345vMU8MNxEl16/r/QriPsRHrhmm7fsZ1l5L0Bls
 XU8q+/KCUe2432YFOjVUwZ95FR7HlEDhv/uo4JbDTNWC3n6o2dM93M73rsPKNPcbvkMD
 3kc687wG1Hv734T2MdzoqlosDLX4DYumfjwODPXoJrfSKxm1NX78Pm6GuOcDtL7hUv/7
 PkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc:content-transfer-encoding;
 bh=LqhkxWS36ULXOg2FChbFMJ7upCoor9LOa8Ol8hX/PP8=;
 b=5ZThEbP/LGDwEk9n5L4S/E6PO9fTXX4TQxn7wRXDg8fFR7iGvsVzmIsdpuKFrpRMuT
 RpUbLFbWLa6MNTShFLpyy0GT0HYFqCulwdNSxfoKw5JSFRrvhDtwJ8RlX9Woh10v63p8
 UkVxqxeKm9NImfTTTYdTs3tiLpVKD7e2MOR8iv0vPQrRDGimCj1plblka932abEDe7YB
 imvtqO+kj24juZcf8PqKEymfOK9NqfhtXZIOnF9ASK+u1ViOB3vrwSXB1la8CkyuxxFE
 VfMZ9V6m+JchgheEFVOyB45EA/OKbYTKzZ4EfYSKe/rlr+3/EFg/+DTLT3GAnvNUewG5
 31Kw==
X-Gm-Message-State: AOAM532UfDXaTQT5v6PGyUPwKWhaR4U4ygI+n0gyrdXlKgAyp72TjsFP
 9FrXSfJ1GZenplFty/Gh2OulFZvQmGo=
X-Received: from titusr.svl.corp.google.com
 ([2620:15c:2a3:201:3c4a:fc8b:1418:53ce])
 (user=titusr job=sendgmr) by 2002:a25:2510:0:b0:629:5421:c1d6 with SMTP id
 l16-20020a252510000000b006295421c1d6mr3822543ybl.619.1646683619942; Mon, 07
 Mar 2022 12:06:59 -0800 (PST)
Date: Mon,  7 Mar 2022 12:06:02 -0800
In-Reply-To: <20220307200605.4001451-1-titusr@google.com>
Message-Id: <20220307200605.4001451-7-titusr@google.com>
Mime-Version: 1.0
References: <20220307200605.4001451-1-titusr@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v4 6/9] hw/i2c: Added linear mode translation for pmbus devices
From: Titus Rwantare <titusr@google.com>
To: Corey Minyard <minyard@acm.org>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <f4bug@amsat.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Shengtan Mao <stmao@google.com>,
 Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=342UmYgYKCGARGRSQPEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--titusr.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lKDrZ67h5lQs

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Titus Rwantare <titusr@google.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/i2c/pmbus_device.c         | 18 ++++++++++++++++++
 include/hw/i2c/pmbus_device.h | 20 +++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/hw/i2c/pmbus_device.c b/hw/i2c/pmbus_device.c
index 8cb9db0f80..62885fa6a1 100644
--- a/hw/i2c/pmbus_device.c
+++ b/hw/i2c/pmbus_device.c
@@ -28,6 +28,24 @@ uint32_t pmbus_direct_mode2data(PMBusCoefficients c, uin=
t16_t value)
     return x;
 }
=20
+uint16_t pmbus_data2linear_mode(uint16_t value, int exp)
+{
+    /* L =3D D * 2^(-e) */
+    if (exp < 0) {
+        return value << (-exp);
+    }
+    return value >> exp;
+}
+
+uint16_t pmbus_linear_mode2data(uint16_t value, int exp)
+{
+    /* D =3D L * 2^e */
+    if (exp < 0) {
+        return value >> (-exp);
+    }
+    return value << exp;
+}
+
 void pmbus_send(PMBusDevice *pmdev, const uint8_t *data, uint16_t len)
 {
     if (pmdev->out_buf_len + len > SMBUS_DATA_MAX_LEN) {
diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index bab4526734..0f4d6b3fad 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -448,7 +448,7 @@ typedef struct PMBusCoefficients {
  *
  * Y =3D (m * x - b) * 10^R
  *
- * @return uint32_t
+ * @return uint16_t
  */
 uint16_t pmbus_data2direct_mode(PMBusCoefficients c, uint32_t value);
=20
@@ -461,6 +461,24 @@ uint16_t pmbus_data2direct_mode(PMBusCoefficients c, u=
int32_t value);
  */
 uint32_t pmbus_direct_mode2data(PMBusCoefficients c, uint16_t value);
=20
+/**
+ * Convert sensor values to linear mode format
+ *
+ * L =3D D * 2^(-e)
+ *
+ * @return uint16
+ */
+uint16_t pmbus_data2linear_mode(uint16_t value, int exp);
+
+/**
+ * Convert linear mode formatted data into sensor reading
+ *
+ * D =3D L * 2^e
+ *
+ * @return uint16
+ */
+uint16_t pmbus_linear_mode2data(uint16_t value, int exp);
+
 /**
  * @brief Send a block of data over PMBus
  * Assumes that the bytes in the block are already ordered correctly,
--=20
2.35.1.616.g0bdcbb4464-goog

