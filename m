Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1664900njf;
        Mon, 28 Oct 2024 11:15:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJYMtW3RdMY4g/mU8jJhsWCssXDHP8GkN4zS1uuOR8cwnorWkNHL5VE0ZV5IsQpplazNQ4vLJ+pdkyUA==@linaro.org
X-Google-Smtp-Source: AGHT+IHBYfs7Hnv6QTy94VdA7xQw7xAy5N1tqp5Mly3QtXg9oO8pNXLPkAlXGtt/e1RIEzxlTx+t
X-Received: by 2002:a05:6122:31a3:b0:510:185:5d9c with SMTP id 71dfb90a1353d-51015126708mr7121718e0c.11.1730139315913;
        Mon, 28 Oct 2024 11:15:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730139315; cv=none;
        d=google.com; s=arc-20240605;
        b=N8VWMVzm3pKtsDUqmBHeG18aKtX3vybU+Mmww15fxRua9LSRjXkokAu63itpWL3pHT
         qj2JM7JPpKILzFclXnZKWmG5P/y5KdacvmAEWmF0y0NolcoZoIYWJ+HPAisSc0aSK5Zl
         hyc6ekr5p8ecHHqjvokaFbgSCZeHpCPdoZXld54E9zBC56Wr1rJJHQhQxp4iAorXKFYs
         hb2tBZRA0AOhmZo7TDgYRTzDTagN+hdFxO7TEO17yD6sr8mNaFPKVfe6Zven+5DdpD9P
         t+abM/ncOXk/xoK49odXu3/7UqpYA5kaAoEnlhQx9SLl1XmmNUFqhdacwk+h02cM+GhC
         5LTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=QcXB1LmtAQFEXSUS90sErQxDRM3Ijz+Y8bQE4SW/GfM=;
        fh=c+AaPTUhdT6jXtqhBE58ePmXy6ccIlr9eUvc4TjX8EA=;
        b=JB1YskfJxx7Zqrvfucim4coxVFzo/0eCmDjsIbj0J3MgbpTrB/JIGJPAv0nfJhjHYo
         XA2hpkxI8ZdNFkkhVSo0dfEK61y9Si/9Vs3pKf4LuZ71+S6p3k1qz4oZq5rPTuN6zCKe
         qDnqcHgnPfyFgbbaMgP8leGAqHGK2XmYRqIC1ciaBEw7uq6eZzfA0LzvP0UmEx4JQ97U
         8hKSlkGpkoiDBLXoaNS65EoKDOYjBA9WLBdN7G4QQwTzfHTjI+MoYcUQCZOv30EFjMdS
         ywuFI9TiH9JInBU55+qzzCgqiJWdICknoUrbZrlMPECSnZL8dVg+Ek7vnTNvuxzhuIFW
         zwhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="hS9/osyB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-510047776f8si1691884e0c.226.2024.10.28.11.15.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Oct 2024 11:15:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="hS9/osyB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5UGA-0005Vp-Nr; Mon, 28 Oct 2024 14:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3hNQfZwcKCOsiRagheRTbbTYR.PbZdRZh-NeZabaTah.beT@flex--venture.bounces.google.com>)
 id 1t5UG9-0005VU-DA
 for qemu-arm@nongnu.org; Mon, 28 Oct 2024 14:14:33 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3hNQfZwcKCOsiRagheRTbbTYR.PbZdRZh-NeZabaTah.beT@flex--venture.bounces.google.com>)
 id 1t5UG7-0002ei-Jx
 for qemu-arm@nongnu.org; Mon, 28 Oct 2024 14:14:33 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-e30ba241e7eso613636276.2
 for <qemu-arm@nongnu.org>; Mon, 28 Oct 2024 11:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1730139268; x=1730744068; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QcXB1LmtAQFEXSUS90sErQxDRM3Ijz+Y8bQE4SW/GfM=;
 b=hS9/osyBKEDQ5ESa1jMH2WXlRRYxCeqsVNzI2io7w5LCH3rnKrhSFU99cN/rPZntii
 VkSw8VnQitJjW9bN26n7hEDKJyJDdSwEc8kJoEu6qkGdrNhBOs2cn/RT4Ij5kO4Iw7wG
 F7gPGU/T6lurdh9sutx80ZYWNVsIRwyc4+xfulqpF1+1XOQw+/5qx8rIixjfqPiYzV2z
 1hkCSfVK9JJ19T5UpBLI/WklKDX0QeySK/NMBsw7KM0GkYtXwaOFQwP6j067jXMTGTOy
 K90VBDtdm2/mjW7/fUTTgF9tjp5xgxpkQCkM7/QExQaR4ZmZNpkJgeCTcA+RB47whL75
 vZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730139268; x=1730744068;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QcXB1LmtAQFEXSUS90sErQxDRM3Ijz+Y8bQE4SW/GfM=;
 b=RXbHMOmzMW3AsPEDdSHU9JHCfXxDcWnWZiuAdtUBwIfFd3Ga562vd/gccAMSVccXYW
 E7moMV2Bc8c/rLDCR1Yr7RdTlNiv3V9Slg+zPyayx06hRDhUDkSKWvUyj3RWTxOCFNJv
 CqcJgBjimzy8wbzrAgcQg09ZDZE7CcI34Z9PLIjPm52bD+K3j36u9bQz5GEBN+w7sR3b
 lEldmXYjL7+qa3vLl3l/mKCg9+Hcti/JwdWP1i5r+e+IX7W+Kb8IgnawRCrYpmsJQlFp
 654ZhJo4d/Vk/2SL96DmgB1xJshqP2ljcliZePijVeVw3FG9TeYiMbhNPDz97F1Yw9qR
 EjLw==
X-Gm-Message-State: AOJu0Yy87c/uEt0hogNkuJLZ/b8YVi02nq6sX8xy1SA7PwL5OlI1+Qtj
 v0B6D7OuOFG/8hVZabuWMHIl/CQoB2UFQUf6iwlvgxs9lFFj//qpjvgcBQirBqTk7l+EFXZVwPZ
 YWqnEzQ==
X-Received: from venture.c.googlers.com
 ([fda3:e722:ac3:cc00:c2:1635:ac12:d1ad])
 (user=venture job=sendgmr) by 2002:a25:ed07:0:b0:e1d:912e:9350 with SMTP id
 3f1490d57ef6-e3087bc765dmr23274276.6.1730139268203; Mon, 28 Oct 2024 11:14:28
 -0700 (PDT)
Date: Mon, 28 Oct 2024 18:14:20 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241028181420.1438938-1-venture@google.com>
Subject: [PATCH] hw/arm: enable at24c with aspeed
From: Patrick Leis <venture@google.com>
To: clg@kaod.org, peter.maydell@linaro.org, steven_lee@aspeedtech.com, 
 leetroy@gmail.co, jamin_lin@aspeedtech.com, andrew@codeconstruct.com.au, 
 joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Leis <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3hNQfZwcKCOsiRagheRTbbTYR.PbZdRZh-NeZabaTah.beT@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 0xpmzvoDp7bu

Enable AT24C with ASPEED in the KConfig because the boards build this
device.

Signed-off-by: Patrick Leis <venture@google.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e7fd9338d1..1b25e73578 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -539,6 +539,7 @@ config ASPEED_SOC
     select PMBUS
     select MAX31785
     select FSI_APB2OPB_ASPEED
+    select AT24C
 
 config MPS2
     bool
-- 
2.47.0.163.g1226f6d8fa-goog

