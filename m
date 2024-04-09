Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1911962ejh;
        Tue, 9 Apr 2024 06:39:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVV4wBZyXnxKYo7O1hbXSeQRi4ykFGjZLtBptt6aDQJnK0JT7QUeWjeoCoWFDNhut2g5uCaxTB1Y43WXf7/xRM0dUHOLq7W
X-Google-Smtp-Source: AGHT+IEWaJRYMOLBmPouAfL371FKU4V9aXs3fa6IWdrD0fNo+EQyRASnqOZlzoGt3VbvezfAkWMM
X-Received: by 2002:a0c:dd90:0:b0:699:4471:95f3 with SMTP id v16-20020a0cdd90000000b00699447195f3mr3813599qvk.14.1712669974163;
        Tue, 09 Apr 2024 06:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712669974; cv=none;
        d=google.com; s=arc-20160816;
        b=GIctEHtTgdFK0Nr7LC4eroJ9erz/uXKr4Ne2lmVfByB8wQ8UKxTcKDI74qaofkzpQS
         0/9WyTQ5tmlN1BCdcW9HxB8CR7zMajAdPxjXqCVvrNLTv9zR6rbXOLgxcsPoesgpNflC
         NYQ4fmJDBWgqcVgHVzrujjI850e6AVrbEUIpGijTRXjgmZxzD6eDH9yi7oe7IZQwXc7D
         0IJeZfjrQx2/4nW+UrC5gZv7sWgFPqR52oNYfDFoDg3Ftsq1LFJhfwVWjtdsLLF9yJPK
         0YOhKjDf1Nbd/nFdpxnAnV3zAJdAgO1i/A2fp/0qnt+H4VxjqngCj0ZaKsXbWv32dK2g
         A2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lbfyIBf/SQJfbeKOCdEpbKAjf0YIAs4J/ih0RuWwHfw=;
        fh=pxGQLKv437gHtRtfYQeED9L+UQHEtshGqeP0Cvw2KMk=;
        b=nr3qLXY9npBwpUK61zl/XZ3xFPXZ5YYESYHimHHF8OMzzMm9u0caDt8IACrQuk7vlB
         Ra71yLKTgSqhCqMcRRTa2rDatk9e6cQxqKKUQW8E9WT91VS2DCjmh1b+u/Kcn5sHOHIY
         jrfOE73ZI18a9sgtDdY45Zyt5M4QzbZlq17Mt8xWWdKtMdvZWXaNT6i+yPm2qZJic1Ov
         bXARo9jEmNKFMYdlx2e/HjglF5gDQtl5RhOoo+mQdU6h7q/e1uYZCkb4YV1wBWgNXVF0
         Av0Qt6ezWkdUprnA2HUccRGMrxul78dG/XvUSbPMFgaAk7gPAjiUph4WhFDtYLHYbwFM
         DuUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A5olmGq+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a0cfa06000000b0069937cfe396si10153521qvn.525.2024.04.09.06.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2024 06:39:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A5olmGq+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruBgt-0006e0-LC; Tue, 09 Apr 2024 09:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruBgL-00068m-9d
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:38:39 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruBgG-0008EX-Cf
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:38:36 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-343b7c015a8so3490837f8f.1
 for <qemu-arm@nongnu.org>; Tue, 09 Apr 2024 06:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712669910; x=1713274710; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lbfyIBf/SQJfbeKOCdEpbKAjf0YIAs4J/ih0RuWwHfw=;
 b=A5olmGq+DqVVVxLXaoPRzZOpkl3+bcx6X/tP30ChgWYesXDu5TFuooy0CuRwrNc9jm
 I3Wed44qyzFmJK+uJlCYRIE14nxvFfK9dOec23W/u5HXaBIYGaeoyZT3zdGqRbfdW1Im
 wAxIi9Wx6c7qVFP50YAfsUDKRlWXkPYzUvHMb77hFHRspm4e2p+WZbNHEm5SWNK3/u49
 LK+Az1IT5t5lBH7Fvnio5HK4pR0n+qduf3Ew0rMRsoKh084WDevMpMarfeiphl4h34FB
 ZzbwoPfjLhoDAIlS8CaYqcZrtzzdmkS4BJ5faWewFpoD/JVnHRr+kS/P8jgbrrIOOr0G
 +wXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712669910; x=1713274710;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lbfyIBf/SQJfbeKOCdEpbKAjf0YIAs4J/ih0RuWwHfw=;
 b=r98NQz67ynfDV1IMGxwXzRueAg09yxiUDGdetp9eRN7fy7siu7hOmfnvt8fIaomzmR
 uAfl2iqIfglJmjoz18jyDncuCGvV4HlSGOziT+5sJsw4ne+zB+y00/yNzHJ+HUNeZY6o
 l3dkQZkXUjYlisDxCyTT4h1Dasqr5hRUqFXvM29f8HUmXmNj3jCsMNidCzTYcAOdwdRM
 nwHzmTK1pqF7C6W/Rpsi9Whu4X4h/Bb1OS3rKLzTGwyteUxK8uysH7QM8LyrCZRxQS5T
 PV5NgneMnm8HzSRqjRI9aiue1VV4ziGtxmIzZA3P9eUCObHNFbJV43dh5QWKxQ6dubjg
 xe1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBxWD6GCIRtOqgqP6MxNcq3DjmTpCB4ToEYKResySFYhsh8AL4hny9XmznyUuW0PTb5XYbjGU5E/4vzLwxdjkZGeUY
X-Gm-Message-State: AOJu0YxDXnNOH7Nv/I3DdqZxb9lhIbUqKLsz0E6vKKxLhE/Ec8o1L0Hp
 /txdsmVSLHriMmAWNDU06H4foUF0QZN62xuN8ilxUzwwE144g94IZSxM1cbeMWI=
X-Received: by 2002:a5d:5233:0:b0:341:bfe2:4509 with SMTP id
 i19-20020a5d5233000000b00341bfe24509mr8216775wra.42.1712669910719; 
 Tue, 09 Apr 2024 06:38:30 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.160.134])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a5d5242000000b00343c0c24a65sm11460005wrc.89.2024.04.09.06.38.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Apr 2024 06:38:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Chuhong Yuan <hslester96@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 v2 05/11] hw/net/lan9118: Add definitions for FIFO
 allocated sizes
Date: Tue,  9 Apr 2024 15:37:54 +0200
Message-ID: <20240409133801.23503-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240409133801.23503-1-philmd@linaro.org>
References: <20240409133801.23503-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: phjyva/UGxMC

Add definitions for the TX_FIF_SZ=5 case, per TABLE 5-3
"VALID TX/RX FIFO ALLOCATIONS".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/lan9118.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index a6a869de32..00409927fe 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -158,6 +158,17 @@ do { printf("lan9118: " fmt , ## __VA_ARGS__); } while (0)
  */
 #define MIL_TXFIFO_SIZE         2048
 
+/*
+ * TX and RX FIFO space is configurable through the TX FIFO Size (TX_FIF_SZ)
+ * field in the hardware configuration (CSR HW_CFG) register. These are the
+ * default configuration settings for TX_FIF_SZ = 5
+ * (see TABLE 5-3: VALID TX/RX FIFO ALLOCATIONS).
+ */
+#define TX_DATA_FIFO_BYTES      4608    /* 1152 words */
+#define TX_STATUS_FIFO_BYTES    512     /* 128 words */
+#define RX_DATA_FIFO_BYTES      10560   /* 2640 words */
+#define RX_STATUS_FIFO_BYTES    704     /* 176 words */
+
 enum tx_state {
     TX_IDLE,
     TX_B,
-- 
2.41.0

