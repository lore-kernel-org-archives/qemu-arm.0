Received: by 2002:a05:7022:1102:b0:84:b8cb:c71e with SMTP id ou2csp697371dlb;
        Tue, 16 Jul 2024 23:02:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVs9fS6CydrCfaZeMcupXpiTP6lvqTqE76BjUWQfDLn+4gIQR6IxsMKKFVJ5y41f/RmvYMVTTm4BrboAxFSYtbWyhBbwMu
X-Google-Smtp-Source: AGHT+IFmQHVmPU+HLFflICBbANfq0y7NQUBvO3FhlW+AeFl/BaT7Ch4J6YC3nHbfIpy7qqMAsnmp
X-Received: by 2002:a05:620a:2455:b0:79f:18ee:a650 with SMTP id af79cd13be357-7a187446a81mr72887685a.17.1721196152023;
        Tue, 16 Jul 2024 23:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721196152; cv=none;
        d=google.com; s=arc-20160816;
        b=xO1tmTfMxvwVPz9OB0PzCRqUXvA0Hg0djG2CJgrTRjSbOHb3UvL+S/yBVd+MHE64+i
         g5xU3pL42Jc7Gg9LeS6NN2AVOSFt2MkN9NoAhvOOj7w1xAD2Xp2L5BshBbwYZVebD0zQ
         zukSp/E5KowKJL4h3yfiIMnBpYaSY7RjWI57L0cbDQKgeX0Snmz3RFlmOgluXwNjEJb9
         j+BwjhwrEJK8P/I07mM39HGBl41yA5z2EKh4akTi/RomigcHVjQuXq6R9vgIydJIC/Lr
         QxtLGZk9H4Ce2mJIGm8RaIZLjv0l4hK5c13y5vCVgNAe+eWvZtTfzMGh2s02sQNebTga
         7hCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=OG5tWqvD7v5D7eW6eQiZf6y3nPVRndjEp8rarTrxMPg=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=NC0rn1iUsOgDFMnxT2Dz1iccIpdou1cizqW7YA3v27Mt/5aDliZK/R8X2x/6mQT1+r
         p1gF4qfw26hu239EI2tbldzMFzVQDb4KZODj8lY3n+9YT99d/YtLvr/sX9y9aAVpkA8I
         nzWUYSOghSU0KoZeERxUDjd0Pz8G6wk0tATN/dVAP7LnMiVl9hR90EAcksygDL096Q+6
         3bbG4Siu7XGzSL4atFmeTEciiljlVAQcS450v3e/2EnxRCXz/IjmpYdemjSy6/iEujhq
         9+xb0oYnPX2MsNApdY06VQT2v5cPPLvPVll5fTAXl/3+y+VvbrV4m/DlQz5EcBJAS1ze
         tpgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zIdExSEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a160b7c655si905384785a.63.2024.07.16.23.02.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:02:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zIdExSEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTxjw-0004s1-F8; Wed, 17 Jul 2024 02:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxjr-0004qo-27
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:02:07 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sTxjk-0001Ej-Iv
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:02:02 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-70afe18837cso4079632b3a.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 23:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721196119; x=1721800919; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OG5tWqvD7v5D7eW6eQiZf6y3nPVRndjEp8rarTrxMPg=;
 b=zIdExSEqI6uIq5jW3qJTgJnlpeK+zdARBoTQmQKC2FMtjGONjAD9O3CEuItdaPBrL1
 o3gDiK0QVRnkvWwqDtUdWcS5Q0DXangpnS3SNmofUerA+9jFRTdUFcKbZSxz5REEWVUi
 7uim2sK35hxICGRx6rnX1fJs7Eyy3YnuoPJeQjEPdO0oTz2YydNlnbHQq47X1a0wpPA1
 AIcfiRGoK6l8DqR4RWlANWR2dvXxgb3hFcF/5nlzttdWUAWnLgGK5GFFDSeH0attfcwW
 A7SZAe2bWFwqaNspybeocCpbEd0vezKXLHpAE5dK//Gn87znCovFZTsfu1pGdI9kf+aS
 MpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721196119; x=1721800919;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OG5tWqvD7v5D7eW6eQiZf6y3nPVRndjEp8rarTrxMPg=;
 b=XL2glK51fb9dZcoWhPT6LYdDYiZa7O0bZLtqlV5LJ3Hf8YwKN+BDjrfrWW8JMe6O59
 wmg4tnpLBqzo2b+Fr+I3RnEhwUc8QE3/hgv4rpsrtdunnGkzUeUgf9nB+hYFMsaUe/DX
 WSitQk/1ukDdR91QbwwkeDDMen9p+eftKhNWp4FO7B59l6IQQzIhkIgd8SFE7Mu2UtQ2
 Yi4NlM7vchP22DN/YR6km6/Xi0tYI6DNR1fzxHWn7mth/KDZCNehY+5Jg+qcY4ELpfU3
 bl74PUlEw/pHMp1qVPhD/eWGpkngUHQNqQNzCatW13qCG/cVCrNPfmrczcUKJNLNEL/4
 zcfg==
X-Gm-Message-State: AOJu0YwxjI6wvI4nsfomtwE/6Xa5F+V7HO7sH+M6UmOsvmYQeL8fSXtj
 xkH1SUKBW/o5F7emPW75eQmMieApXkgmEHjucawAQGFzSC3/xFecqSdsUw20/gw=
X-Received: by 2002:a05:6a20:12ca:b0:1c2:8cc4:908f with SMTP id
 adf61e73a8af0-1c3fdd5338fmr822946637.48.1721196118657; 
 Tue, 16 Jul 2024 23:01:58 -0700 (PDT)
Received: from stoup.. ([203.56.128.103]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc27383sm68131575ad.140.2024.07.16.23.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 23:01:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 0/3] target/arm: Fixes for SME FMOPA (#2373)
Date: Wed, 17 Jul 2024 16:01:46 +1000
Message-ID: <20240717060149.204788-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: gI2pqzDyYqo2

Changes for v2:
  - Apply r-b.
  - Add license headers to two test cases.

r~

Daniyal Khan (2):
  target/arm: Use float_status copy in sme_fmopa_s
  tests/tcg/aarch64: Add test cases for SME FMOPA (widening)

Richard Henderson (1):
  target/arm: Use FPST_F16 for SME FMOPA (widening)

 target/arm/tcg/sme_helper.c       |  2 +-
 target/arm/tcg/translate-sme.c    | 12 ++++--
 tests/tcg/aarch64/sme-fmopa-1.c   | 63 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/sme-fmopa-2.c   | 56 +++++++++++++++++++++++++++
 tests/tcg/aarch64/sme-fmopa-3.c   | 63 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  5 ++-
 6 files changed, 194 insertions(+), 7 deletions(-)
 create mode 100644 tests/tcg/aarch64/sme-fmopa-1.c
 create mode 100644 tests/tcg/aarch64/sme-fmopa-2.c
 create mode 100644 tests/tcg/aarch64/sme-fmopa-3.c

-- 
2.43.0

