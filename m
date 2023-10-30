Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1939174ejc;
        Mon, 30 Oct 2023 08:15:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1NJYguktKd8du54FcasNc1IAAm97KnVkYCSmrYrOv4pYtU8fKCBhfFo6Ip7mR9T6G/xBm
X-Received: by 2002:ac8:5e4c:0:b0:41c:376d:20ac with SMTP id i12-20020ac85e4c000000b0041c376d20acmr11299747qtx.0.1698678950637;
        Mon, 30 Oct 2023 08:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698678950; cv=none;
        d=google.com; s=arc-20160816;
        b=f+cBKRTugPAAfMxftJDsSRF4r9juKOvfSrSovbxBCt+IWsE8Z7ea7WG6DPYrTRzIga
         OXmgPCVhZokt2DcawChIl1GQrPORHLsUTXdefwN0Tc39X6cDrKiLBVj0Rb4jU31n6M8o
         MHNkWBEfQNe5xQ0m86+7m2LNVRoOFfQQNlshKWslJyb5FsV0Dx1qeBMx0dQP4/xmZbc1
         PTvJLfDwS5QOidaiMPntsaCAcoj9dTA8IZKg8z+8VGYaSpyyjMoXXWfBP3ELzAubZvOd
         TyRGklJKuBtJmjggxMaMUmtUZoPbamnjt++qLSTRfZZBgnOxxGRxJrb6ksUfYdOr2Pzp
         POAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=BoT5GBKyq79PCkTu6tYc22/PMQ5+dRigm25txblUDsA=;
        fh=dkcIM9QY2KsS4gUlMo3NvFj0OvTR7YVGhfMMQz9rbxQ=;
        b=Gy6d90bfopOsZ7xx7lJj76wnoxjL/rIrGawXIxquPv93EPZUTkUg+l4FT4ilNrSUAE
         qCUJPRglWj51PwWp6cR0iqnlI4oXBo5urKpenlfxrKlLxwjOH3V6bjtdzAfVrqEbmKB0
         1WnG4PbemAeJAwnRJLu1DE2hyesK8YQlYVz1W+gn1ieFK3Vdn2K4x689vRQ6r23Ffmt4
         JO8N5n46WhGvyUT0M4QcMpcvd63rUfGTqcNwMDXyA4Lc+gQbC4YdYKECPdKE/furaMSM
         nIfTCgDo8lNGcUzBS8WaPDdCVAJyCuiT9o1DFYG3f1383rKqsitjemumIPVdnM78tXED
         XjEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rt-labs-com.20230601.gappssmtp.com header.s=20230601 header.b=FYKN9rZv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rt-labs.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6-20020ac85a06000000b00419537da80bsi5798171qta.117.2023.10.30.08.15.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 08:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rt-labs-com.20230601.gappssmtp.com header.s=20230601 header.b=FYKN9rZv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rt-labs.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxTzT-0002Vy-UW; Mon, 30 Oct 2023 11:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hans-erik.floryd@rt-labs.com>)
 id 1qxTzS-0002U6-Du
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 11:15:42 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hans-erik.floryd@rt-labs.com>)
 id 1qxTzP-0002lf-SF
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 11:15:42 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c503da4fd6so67270031fa.1
 for <qemu-devel@nongnu.org>; Mon, 30 Oct 2023 08:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rt-labs-com.20230601.gappssmtp.com; s=20230601; t=1698678936; x=1699283736;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BoT5GBKyq79PCkTu6tYc22/PMQ5+dRigm25txblUDsA=;
 b=FYKN9rZv0wpZsINuPkhFSaLqFA9sYHJyDUlnHRGteyYopzVV/tlxXJB9NoQWz4LKYt
 EGN4NHIncuwEnkuphlNzTEg1pkCrVd8I+ldlqtqubVTHZEnh6SGvA407xMpNK3inMv1V
 QMX3n6LgjmG57UUntgh7zJruaSgIllmLnTXwczZvnxrzhegFoQPRU4rdb77LAsV68/gP
 o2ABA8hzGqu+NWC40P0VLmpFP5wdJuSBv0GNswHVtxR/vxhBFBsxRd3C05WoG3i1Afw2
 i/wUdbgK6VdBqfLHn3oEMZAVMEJ9z8pEa10cibwm9BpFUvgXfl+jbcIo6Jw4oF7oYhkM
 hn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698678936; x=1699283736;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BoT5GBKyq79PCkTu6tYc22/PMQ5+dRigm25txblUDsA=;
 b=mWJqCCnd7opfzD+nSg3qc1IbtRRltPE/QfQUkXLJTJ2VE/8W9Bup+6ngnX7HtJCH+x
 QbhSVEwL7Me9JfRfwC3L5z86z2QdHoHjtp/qjqf8CRSbjj2Zly0uH2eWOLBD8n1GB1nL
 XdKJPIcW/qJ2lRDwqJ6kPTu6+7qB3TbkdhvqUBu9P871OQeYtJuBbfPCnyqsl6l+tQLH
 0lV0PwT3/tj9euNcHuJ7krVNDfz18/H4DyM85pROjll70rWbIc6m9EwMRIR+zguts9X9
 7uRfCAnKwaSpWwMriXUYNE5WMYuCcNqwJmoZyZYHpHqXEj4gqyrbYIsKWGsZ+ZKlJqK/
 VCdA==
X-Gm-Message-State: AOJu0Ywl9pAn3y22VugLLb0FIUa7buGLIuygaoDwPEUJNOL+Ggygnry9
 VNaU8bcqU9vJ55blKZrHzYRSGg==
X-Received: by 2002:a2e:9416:0:b0:2c5:1989:ce1c with SMTP id
 i22-20020a2e9416000000b002c51989ce1cmr6909206ljh.26.1698678936077; 
 Mon, 30 Oct 2023 08:15:36 -0700 (PDT)
Received: from rtlap47.intra.rt-labs.com (h-213-136-33-86.NA.cust.bahnhof.se.
 [213.136.33.86]) by smtp.gmail.com with ESMTPSA id
 j18-20020a2e3c12000000b002b95eb96ab7sm1282274lja.18.2023.10.30.08.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 08:15:35 -0700 (PDT)
From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
To: alistair@alistair23.me, peter.maydell@linaro.org,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, philmd@linaro.org
Cc: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
Subject: [PATCH v3 0/3] stm32f2xx_usart: implement TX interrupts
Date: Mon, 30 Oct 2023 16:15:15 +0100
Message-ID: <20231030151528.1138131-1-hans-erik.floryd@rt-labs.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=hans-erik.floryd@rt-labs.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CVb33YIGVVJD

Generate interrupt if either of the TXE, TC or RXNE bits are active
and the corresponding interrupt enable bit is set.

v3:
 - Drop patch "hw/char/stm32f2xx_usart: Update IRQ when SR is read" as
   it is not required

Hans-Erik Floryd (3):
  hw/char/stm32f2xx_usart: Extract common IRQ update code to
    update_irq()
  hw/char/stm32f2xx_usart: Update IRQ when DR is written
  hw/char/stm32f2xx_usart: Add more definitions for CR1 register

 hw/char/stm32f2xx_usart.c         | 29 +++++++++++++++++------------
 include/hw/char/stm32f2xx_usart.h | 10 ++++++----
 2 files changed, 23 insertions(+), 16 deletions(-)

-- 
2.42.0

