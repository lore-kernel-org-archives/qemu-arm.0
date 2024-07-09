Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp1560272dlb;
        Tue, 9 Jul 2024 08:28:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXBbAaJsD+ekVLyQ476qOF2/66sGJ1yTUCgEakFh/NLmkLqIwReJfoPcqXRSwx+HSPIjYGG9/9FYu6qUsXBETa3KqMLY5cu
X-Google-Smtp-Source: AGHT+IEuS1j1yOB4Ota4gplmzWVIyFX6hjm0QanqLZ76XfTgu/auXDEAoyI65ICxLrq3yttzamqR
X-Received: by 2002:ad4:5f88:0:b0:6b5:475:d1ad with SMTP id 6a1803df08f44-6b61c1c18ffmr33389576d6.34.1720538892468;
        Tue, 09 Jul 2024 08:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720538892; cv=none;
        d=google.com; s=arc-20160816;
        b=XH/meAHosr5hJsxbz0/exI3gZfzWK29YdxNJg8jogTQzZQ2v7xwu3rjcO58oA/zgKi
         gq3w60PQUhHqHQa74WmVVdw+h5MuL4X6Ehh8AIuTmjIup+RlKb79h2ClSaS4lVgMh2ml
         PrFrTZ+JYLBoi/bc0GpqJL6ZHe8a6T4hj4qu7DDrzdTOqLywcR1U8yNrmIWYHCDqys9o
         0wc3c0QBOcl+UaVfy52jp2gpMgj7+L9wneE5I1iH24hapivQdBJ9Mo3XzVNI8Jbk9ehm
         b25pCmTS6vGww6bacaESn061w/B5xYSz7MMHBpokD4Hf0Rh5DAGZm4juz96PRSaSf0Mt
         dqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=egTnAJY4Ail08o7ydS3nshQ0gmoljQp4B2SNOCZM4Nk=;
        fh=Txzf7K5YV+qryaChbcvqA4D4sw+KVK3yVi4ERabJCxo=;
        b=Iv1+SErlKEV4TWZNukDQciprfKgeo0+jzpFdWTZKqWKaHyS9U13WpdOvOHdq0+eZq+
         QAjglQddktMc70Yw8Mw6oeH5dwtctnudbNnYnDbKKHQMvI4gQyojcdQxR9Q06RoCa6m0
         b8plywxZah4kPhX9Q5D5yEhhvyiQ4LdaNb2+QVJ1HYd8MzQ3Lf2kSFH2VryeZsqT8L3b
         EC2+VW4o+j1i5kjhzLRPi1L7T8eoI/fMzc1kTKV4zgyra2CvC+2Aj4WL2FY0jAUqj2J4
         E0pMSxooi5yF+CglvQabmqhOGdhYspSDFxkpFe9yLA5dVCoYp3PGXVSFrrT1UHvC7iWc
         NxIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OCW5Xo4U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61b9f68c5si24200736d6.35.2024.07.09.08.28.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OCW5Xo4U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRCl8-0003Ms-Jk; Tue, 09 Jul 2024 11:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCkv-0002RA-Ho
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:27:50 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCkt-0006Wa-KW
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:27:49 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52ea952ce70so3452841e87.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 08:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720538864; x=1721143664; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=egTnAJY4Ail08o7ydS3nshQ0gmoljQp4B2SNOCZM4Nk=;
 b=OCW5Xo4UcQ5u/BJ4MZXAT1fDkefnYsAR0UV53gtFdVQOc9bbFskBaqgRBcHaOv/TEz
 ImwmvYdnLBDs8Yno1SkzmQhetSDiu7uVw8KLBhvXr/XVPKrYKbqY1lSXNoiNe4JnnxWX
 NNXttNrlVfOlV3yuBdyleXnOzcn9ZzNiy2bECUyFOdMxIZ0O80FzJAOsGh2tubfC6Lcm
 c7IDGtACVso5Ae2nPDC0zwm1eFzhGzOQtTlAKoyLGEevfsKmwXBwQMKrGykOGFSVrwd9
 h8o82ToB3+Wpy4D1oqCcJC6xduNLJQFCY5TgAZwXMQp/Eed8qsnbXD1AIRNG4BEtbsZb
 8xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720538864; x=1721143664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=egTnAJY4Ail08o7ydS3nshQ0gmoljQp4B2SNOCZM4Nk=;
 b=AF2nwdxC27vxDhTzzTaYX5v3GNtCES7bzb9MsVN+tsmewXlKZF7stBMA6dFlPOLtxV
 /ouWjR5Ockew9wUuG+nxLu7LtiSBh6KbZKhfYYiOgz91WdHB5ZGtEsETL1PdaZtelKIe
 vv9pgUjkm3s07AOr7IO4433yQ94NJ8+zv9JK706NwyXt3MFcqRlozbjkfecJLs+HxRLC
 Na7dOuhDHwyAAHUTJxBUf7OanrL0c+1UPs4Hh5MXWrQP5MDuLjfmHmcd/J2ZtJ7rT7Eb
 X5iNaa5TtHh8OeJXV4OY4P4HFDlPItmK/TV8ZZC+1LOSwtmH7dUcs95POxNNxsxXxLAy
 wM+w==
X-Gm-Message-State: AOJu0YwqSsjPselaIrDXQ+RfTcDDhV2nTsStxRDDJ7qfc/L24DLVoCbI
 7tvJoM4sV9Ce7SgXWoSsYmp+KoDf+pJDKdZwdt2TFxlpIU6f6cpEdhjqPOBj1Y4=
X-Received: by 2002:a05:6512:2309:b0:52c:8024:1db with SMTP id
 2adb3069b0e04-52eb99d4ebamr1935061e87.63.1720538863738; 
 Tue, 09 Jul 2024 08:27:43 -0700 (PDT)
Received: from m1x-phil.lan (vau06-h02-176-184-43-20.dsl.sta.abo.bbox.fr.
 [176.184.43.20]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab80asm2863625f8f.109.2024.07.09.08.27.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Jul 2024 08:27:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>
Subject: [Aspeed PATCH v47 17/19] hw/sd/sdcard: Subtract bootarea size from blk
Date: Tue,  9 Jul 2024 17:25:54 +0200
Message-ID: <20240709152556.52896-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240709152556.52896-1-philmd@linaro.org>
References: <20240709152556.52896-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 6hJRzXd4kyJX

From: Joel Stanley <joel@jms.id.au>

The userdata size is derived from the file the user passes on the
command line, but we must take into account the boot areas.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Squash in previous?
---
 hw/sd/sd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 5830725629..291497468f 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -814,6 +814,10 @@ static void sd_reset(DeviceState *dev)
     }
     size = sect << HWBLOCK_SHIFT;
 
+    if (sc->bootpart_offset) {
+        size -= sd_bootpart_offset(sd);
+    }
+
     sect = sd_addr_to_wpnum(size) + 1;
 
     sd->reset_time_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-- 
2.41.0

