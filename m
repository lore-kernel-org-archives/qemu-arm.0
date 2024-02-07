Received: by 2002:a17:906:e18:b0:a38:6d10:c5dd with SMTP id l24csp126584eji;
        Tue, 6 Feb 2024 18:52:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXmX/NCb1ZW3JI4vqlisEkmHvnQEMluZIVDCXAXi6dxefDOK3ellYehPWitVl2opON0XvxP5V6YE/3RQ8XcvULtYEMimG2s
X-Google-Smtp-Source: AGHT+IFFQDFZdHJw/foQzO3/3k4lUHM6blVXHCcG5Ss4TyiPF0A9n34PT/NwNRb1ZPsYsXeQ8pR2
X-Received: by 2002:a05:6102:3574:b0:46d:2004:ccdf with SMTP id bh20-20020a056102357400b0046d2004ccdfmr1309519vsb.25.1707274363224;
        Tue, 06 Feb 2024 18:52:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707274363; cv=none;
        d=google.com; s=arc-20160816;
        b=Q62mP9y6NyEOa/mB57Z7NJ5IsHAieVYC30sO/W6goQBcjECRaCsy0/MpYu+iu8L/o0
         OEFheAYCfQIFZvPbVj6UM4H5D302kQ4sVMx7+QoQ6R9wR9NcJpS+p3+3XCcJAQeBh8kl
         gYmuarUf9bsWdCZPt6cjN5z8NuTYNp8dDF87wJFFpuWM8Wy7y6MC4HWRXSNeky+a2cJG
         4BtFUI0JSLbKQlZZsu0KZryWC8PDkdzf1Jwt1figUHPtQE8eP1s59ciy4Tsie4GUonrN
         hZY+fGVDvGLIV97b9Qkjn3BstD1W0BXttBulD2hF4FQcqeTDPhUaDs5RahbHCa7TxX9q
         8+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=dEU/hJw5TC1eOVwox4NRRVOneFO8qr/5FlNmbbEKaKg=;
        fh=04esYzp7ApnF7UIJUPx7djGnIv0wRGrLTwIc8YlgZNs=;
        b=yi1GzQ4j9k2478XMeKAY7MQ8WQUJA1Y6u9m5MvYzGkI3YWH3ipA19gTqaHs0tnmG8M
         Q60pwx26t1K1y7bhE8J7g0Eji7BhYxvQC7GenF4FjAja7OYEbR8Y0eC2cUrZF7GDqhx0
         57/wcD4iQ2skE7tUULa4YF31NPhS7Gv4PdlsPlWRyaJYqDlyewurhI1yQiegieYmeaSI
         dVIZ/vI3Exb56f1DIuRLef722IrpzE+n/V/yC0OZ01U9vi0HQ9PG4Z6VUeVpuJMJ1wKV
         moneXfwf2NmRMTQ+wk/j+XcjPOtMXBG44ZJRjsfv5ZRm2O1eLongwojmQXo3AIwo3QrS
         bKWg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKlXbKT4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCWTKHQdfCGCsbf4w667Scy+/B8TPl6qSmRQxbgLFgnp3nnlTdaz9eCvEaRY4zrECslRIHbi8nEywNvssDGZaJ8t3lAZaw2Q
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18-20020a37e112000000b007856325a291si259500qkm.714.2024.02.06.18.52.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 18:52:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aKlXbKT4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXY2w-0003BE-Fo; Tue, 06 Feb 2024 21:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXY2u-0003Ab-NX
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 21:52:20 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXY2t-0000Wq-7h
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 21:52:20 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d953fa3286so1602375ad.2
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 18:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707274338; x=1707879138; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dEU/hJw5TC1eOVwox4NRRVOneFO8qr/5FlNmbbEKaKg=;
 b=aKlXbKT4EN0YtR/Pi66WdOjVtZ6bj7KTMJUyUPpsPsT98SF0y7Z0lo1AT2XDoqJCHy
 UN/9SDwHIbXwPP9TxCP6C5lqkyOk/uE51E5m/AABW4DpjwQhlDKVPTVEfDSkvebQ+zhf
 nsyADu+er3PXhrPuwtfDalwauuhhgxZW9+86pxEpI0hPk4Ig3LzLQVXiAyw7dXbOh86n
 MhFTLhnsgKlSt4FAPCzI9JUq92P73MhtOPyKtqtQwuqy9bamaYEFzeXlnGWFLCuvyXVE
 axDucYdKpYKBuTLgcLY0Bp4hO6r8z9RcN8q5fHGGbKBvX+1zmFackRj6kcsTN9/qSXiR
 kcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707274338; x=1707879138;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dEU/hJw5TC1eOVwox4NRRVOneFO8qr/5FlNmbbEKaKg=;
 b=YUmersW8oMNJyDmqaJkW99lPTuUE2SxKPtBCSAbiH9bx1O5rVN0Y4NBTsqhxy0dkYX
 ju/n7H9CZ8aejYZJLjyEfG7MQqxVTvI32VRqY75xukAQDAQuDV0cHEPtBvSzB6Jk4hPJ
 G6vF3PuFDAPnqmQlQLZLRmk5lwF7xkmdS+xwGmxZD5Lii3Lv5X6AU5JV3UG9NlrOK/h2
 amUe3PsrYxydTQGqM5fZiTSXctQ3tWCw+RV2GHKlB8ochw+V4w2VTDF7NrC1g7u3O7NZ
 /HwkZe1+aVnOENTJuZpT1RfdMTqQrdZMuwgHOGxSw7XApJVF0Zubnd9mgnJaVbmAQczP
 PpMw==
X-Gm-Message-State: AOJu0YzGEdl/HwURde7FO5q3XCNsWoQDtBOBe523TqxJclnSeDH0cjqe
 /cb1rgB4TmqWo8LKXehcJ20eEjB2ytjte359l+idve752qDRT3blI2Rxxyq2rrM=
X-Received: by 2002:a17:902:d2c4:b0:1d9:21bc:c607 with SMTP id
 n4-20020a170902d2c400b001d921bcc607mr3939106plc.60.1707274337716; 
 Tue, 06 Feb 2024 18:52:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV5y9TJR0Viu/ojyg8rbSkzcmPJW90jAOcq5R6982PxtOEJHZr48SWfBKspMXoASfh1QBseFwbwLPnBRMaZVtK2YgRPZ6wQbfmq
Received: from stoup.. (60-242-98-186.static.tpgi.com.au. [60.242.98.186])
 by smtp.gmail.com with ESMTPSA id
 kr8-20020a170903080800b001d8ef97de4asm255435plb.38.2024.02.06.18.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 18:52:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v3 0/6] target/arm: assorted mte fixes
Date: Wed,  7 Feb 2024 12:52:04 +1000
Message-Id: <20240207025210.8837-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: DfdZ+SdVG+Lx

Changes for v3:
  - As if /sys/devices/system/cpu/cpu<N>/mte_tcf_preferred is "sync".
  - Fix do_st_zpa as well as do_ld_zpa.  Oops.

Because of the above, I dropped Gustavo's t-b.


r~


Richard Henderson (6):
  linux-user/aarch64: Choose SYNC as the preferred MTE mode
  target/arm: Fix nregs computation in do_{ld,st}_zpa
  target/arm: Adjust and validate mtedesc sizem1
  target/arm: Split out make_svemte_desc
  target/arm: Handle mte in do_ldrq, do_ldro
  target/arm: Fix SVE/SME gross MTE suppression checks

 linux-user/aarch64/target_prctl.h | 29 ++++++-----
 target/arm/internals.h            |  2 +-
 target/arm/tcg/translate-a64.h    |  2 +
 target/arm/tcg/sme_helper.c       |  8 +--
 target/arm/tcg/sve_helper.c       | 12 ++---
 target/arm/tcg/translate-sme.c    | 15 ++----
 target/arm/tcg/translate-sve.c    | 83 ++++++++++++++++++-------------
 7 files changed, 83 insertions(+), 68 deletions(-)

-- 
2.34.1

