Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1704639ejb;
        Mon, 23 Oct 2023 16:47:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZZ9+4M5mUeuNareoN31val2KGcZI4JdRA9Ee/NiojvpTBGUG4Vp/UFpH6YUptiMpINADX
X-Received: by 2002:ad4:5f0b:0:b0:66d:3c5:1cdc with SMTP id fo11-20020ad45f0b000000b0066d03c51cdcmr15847863qvb.60.1698104839644;
        Mon, 23 Oct 2023 16:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698104839; cv=none;
        d=google.com; s=arc-20160816;
        b=yupjjyoxDMdgs15hEYj46eoQXlBVmDywlPUfkNKFIPKqZgi/+PO2H46KMCJh6jypxr
         /ZjYBf+KuJzvnQN2ucT1HGxQibd2NIPzzHAr7Fr/E9bGSC65CMRGDlL0k6b8ClEKDQeP
         r/1W93pgpcx6rXK59HvdzcGzfpWl5JrLfLXuA+vFvnw2YnXkAeCfsmdkvW0mXLugysrl
         SmGlmCUsucsm/k7eg++7nSAnwzlnddkSvOC6qfp7cpIU0oneIOESYs4ThFws1leAYZn3
         E6cdh5jg0QSKrWTkx96+mqnvH7fX2KC1mpqVRDmsYh2lJd3PZMCnoYarhlTA4YuCp2iN
         yg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=Y9PqfwJZCklklflJWx1kiMMaSEZM0FI95tSIjALLmPY=;
        fh=Mz0v6aCc/GPSuGOAcNmOuoiwEqcNHc5EwzP8i2J+/2g=;
        b=KBkG4w8dSQnUv0WY/TQ1oW3T4sQ74+IsCEs4IEyj0AjqpiG66iqvfmOZMCHgGlA6Do
         Q73xZil5nrnQnf63Z8witRwbnkqNEoq8IErEvq30DH+sLQl1IUJMa+8iHDiw/l3gXP+a
         gGlXCTwTS3weMzPyFJpgLdxL9Q5yDEglwrA/nURrphut2k4nL6eCnzj2PhcVw/yUxTJa
         Ka/HokIpUdRbqjopesfaysjdvwDJGrwx21lbq4Z7Z1n3mTL8WxsOYluMpxLTjs0gXCNj
         uORm2W9An79iGyjvvRL2WRcJKToGA1aeva6/HtdB13Fewp8nSaK8bAwoULErTm22YddQ
         wyRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=wpRdadLe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3-20020a05622a198300b00417b6e630f2si6162281qtc.274.2023.10.23.16.47.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 16:47:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=wpRdadLe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qv4dS-0002n9-R3; Mon, 23 Oct 2023 19:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38gU3ZQYKCAs4t4532rzzrwp.nzx1px5-l2xyzyry5.z2r@flex--titusr.bounces.google.com>)
 id 1qv4dR-0002mk-Gm
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 19:47:01 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38gU3ZQYKCAs4t4532rzzrwp.nzx1px5-l2xyzyry5.z2r@flex--titusr.bounces.google.com>)
 id 1qv4dQ-0002lY-1K
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 19:47:01 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5a7d261a84bso55140157b3.3
 for <qemu-arm@nongnu.org>; Mon, 23 Oct 2023 16:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698104819; x=1698709619; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9PqfwJZCklklflJWx1kiMMaSEZM0FI95tSIjALLmPY=;
 b=wpRdadLeTqWWGw5HUQVXgFYrg6GHr94YO5OeoZHADjWvZkAf6V/Wsfl2do20RFSeEz
 OI2IRqwBq7uZH3xegbYbTmEIBrjKOfZn+7zaSmHZmjHkSQZiGmENhKGxtT3EzGYXVtIA
 N7iFPbY4jXDvgK3qr84tTero0To0iG8LfeYZC3GgnbbgTTi/OkAzVb/JEj8tf5wBgqKq
 ZgN5oDaLf0k4+H0yOL91yYo2ioKP6F5QzPSSov/L++dGGa1nxQ9o9N66CAPlK9r3tDch
 jw+QU9IxjNoIBPUAMy8TOCJebnUeEfsLaCjWTyLq10FcY8mlNTgrXWvWLMiK1zr2d3DL
 vRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698104819; x=1698709619;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y9PqfwJZCklklflJWx1kiMMaSEZM0FI95tSIjALLmPY=;
 b=CGylUm68gia0J844eYUMCsC4ovCjAAQyACE/c/moIzE7yJ5zIpgCNLr+KM2NVSzWje
 MZfs0cvCkmd2xDB5NcJ9hAX1HYHCfNKOJownL5jlCs/xByMSXkTUn2INySW8IAvjigUJ
 cyuEbE4t1OMiwG9JApuj455EKIONSaDvosHZgwcb3n1dmHXEWjMrw4gq4gAyttKpw+3R
 swbRb4x52+rc5QhlIe8Z04JC0NhLCgOqAm2bEdOTZo3gRnrwDI8aq4OntH/auKTJs3FY
 /KhDIoTu0Xc3qV3UTBm4r1c77we/bvRr8aYgQQu1hoO8PnXZYbJu1agy71/iYdd44Oyq
 t7jg==
X-Gm-Message-State: AOJu0YxYBnc0tnA06597JO3fAY1a/F5iiKHQ9Nsi5WL1G+G+7xIM2DTk
 ckvLwZW1f7csRPfyVIGfVqbGtJn1LYE=
X-Received: from titusr.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:22b8])
 (user=titusr job=sendgmr) by 2002:a81:4e8e:0:b0:5a7:ba09:44b4 with SMTP id
 c136-20020a814e8e000000b005a7ba0944b4mr248644ywb.1.1698104818916; Mon, 23 Oct
 2023 16:46:58 -0700 (PDT)
Date: Mon, 23 Oct 2023 23:46:41 +0000
In-Reply-To: <20231023-staging-pmbus-v3-v4-0-07a8cb7cd20a@google.com>
Mime-Version: 1.0
References: <20231023-staging-pmbus-v3-v4-0-07a8cb7cd20a@google.com>
X-Developer-Key: i=titusr@google.com; a=openpgp;
 fpr=228BD42BAD6A2BCD3865AEA6C41200175CD21E30
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101; i=titusr@google.com;
 h=from:subject:message-id; bh=3ydAUfrEAeZPVQPNXJngklsGr0uuFIogbpEk1CsC6nQ=;
 b=owEB7QES/pANAwAKAcQSABdc0h4wAcsmYgBlNwXtjtsjf9QmxszIiPGvbc4msOc33M/DF1bOh
 SS9YkEgHeSJAbMEAAEKAB0WIQQii9QrrWorzThlrqbEEgAXXNIeMAUCZTcF7QAKCRDEEgAXXNIe
 MDMiC/49DLaShVclciQa158hVXIRKcL1oe7nw6RcZELMEHLXJR7QVC5hJe1eBwHmhJ1hQdbVdrg
 QEu43M+JHovPUAbQMTpohTiazv2X6iJZ8JTf6JLTofSjIvK3EyGN/jQL4rDVlA8V2aCynIJWuJP
 mxXNxPcTBTLSINETr+P2GSgqvHqGTzfYJoVidH8iwvdB01TVb9y9+NiKb6f5y2/gFkWG13144Lq
 U/KQEsKGB9b1C98OtkVuEVR4cSufPK5/QTDFLCme25wwEhQfwM9mPTnJcnZeFNvesd4+3cew+bU
 Y7GiyPb9e4jZVWRhQNps3t0466Gsw6F6JIcIJZvrvB1iUVqiqaDOKoCYpmpneVyFUF8SxkTKTzc
 IAptiOBkfU7hs73+6b5BWeBwTXzyjNvjJQQoEhdRUMmT/t15/OmkLMn3o1zgvPtrsNlYXxdp3dy
 ebAuXjkgcGf8eK8EBkexGE8FjcKEqPR2D6BJRZQHR0kg9I3qXMB+uSRk4v3nIw4OUsK1c=
X-Mailer: b4 0.12.2
Message-ID: <20231023-staging-pmbus-v3-v4-2-07a8cb7cd20a@google.com>
Subject: [PATCH v4 2/8] hw/i2c: pmbus: add vout mode bitfields
From: titusr@google.com
To: philmd@linaro.org, minyard@acm.org
Cc: Titus Rwantare <titusr@google.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 Hao Wu <wuhaotsh@google.com>, Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=38gU3ZQYKCAs4t4532rzzrwp.nzx1px5-l2xyzyry5.z2r@flex--titusr.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YAg8kkY3yrfl

The VOUT_MODE command is described in the PMBus Specification,
Part II, Ver 1.3 Section 8.3

VOUT_MODE has a three bit mode and 4 bit parameter, the three bit
mode determines whether voltages are formatted as uint16, uint16,
VID, and Direct modes. VID and Direct modes use the remaining 5 bits
to scale the voltage readings.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 include/hw/i2c/pmbus_device.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/hw/i2c/pmbus_device.h b/include/hw/i2c/pmbus_device.h
index 7dc00cc4d9..2e95164aa1 100644
--- a/include/hw/i2c/pmbus_device.h
+++ b/include/hw/i2c/pmbus_device.h
@@ -444,6 +444,14 @@ typedef struct PMBusCoefficients {
     int32_t R;     /* exponent */
 } PMBusCoefficients;
 
+/**
+ * VOUT_Mode bit fields
+ */
+typedef struct PMBusVoutMode {
+    uint8_t  mode:3;
+    int8_t   exp:5;
+} PMBusVoutMode;
+
 /**
  * Convert sensor values to direct mode format
  *

-- 
2.42.0.758.gaed0368e0e-goog

