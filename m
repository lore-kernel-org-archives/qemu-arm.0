Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp260921ejc;
        Thu, 31 Aug 2023 16:25:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHtHmjBhgijV0xudmBaDB8DDjNd9MMtWrWyTKdpjiRNSu1pTVi+FWaeVbfbVjZhV6pUfu6
X-Received: by 2002:a05:620a:f14:b0:76c:9eab:41ad with SMTP id v20-20020a05620a0f1400b0076c9eab41admr959285qkl.32.1693524324713;
        Thu, 31 Aug 2023 16:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693524324; cv=none;
        d=google.com; s=arc-20160816;
        b=zc7vtFzKJTMBPv0xxEmd7jCnwveaS0z7R+AxV9P7UtTovxQQA9yGYlM4Qcqz1qgd+e
         YIEd7h7mDHFPewEFs/Rs+rLd7eMx8qez2GJ5+PAMO3Y2TO7s7n/GuMjN9X4EA5lzSrem
         XFcjP/zk4NLv4/rSuZz5sPIf4AHKfqSYTiTXvgDVRRDc56Z5KoaoxRoRpUnz2LAm71d/
         kXI8Qg4DATdDFoLeREq9jE22qtdoXXy1krHl4rlBmXTH1D+yBSdAVE2fb9s0LTs/xGck
         8EcsP7bz6BJLQ+WX31ilIjSextqreTwq0+XiwmMk6ctz4srOeuuX3wtXwgJE90GCjX8d
         AjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=cYadnNUzS+EStUScAbd7zg63A8xSjmBqfglid51vMNM=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=EEV39RnlVYodJ04ZNdllt6/pk98VItwJvKIWSlG9+tCbyER4EhcYpbLayvqykdyAeN
         hbKZOoFxvLagpCRC2PYdcCmO2+ynDxdvpUYsZ41acJxTA1dXVdStkIq8/ld+uMOuHSkA
         FAMuzgR6w+geccOBwbdYdGEHN939UlYljoqnj/ho+tWr7+yHG7EnC9uSntxIMzKqF6v1
         RvKyKRFn8RX1sL2DJwd1eswgzIfhJqsO6dvjwJizzM//fyTWfp/u+Pt4HdSov/1KQ0nO
         In/d5WJJDMOYOxD+R2FyqMVwJ86THBJK3crxgKrj8CQbtDyb1Zp04pFUbz2o/WMqDlCy
         AbZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QBwIEaku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3-20020a05620a290300b0076d937716bfsi1636563qkp.514.2023.08.31.16.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 16:25:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QBwIEaku;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbr1x-0006mT-Lz; Thu, 31 Aug 2023 19:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbr1v-0006lx-Gc
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 19:24:51 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qbr1p-0002Gv-Mp
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 19:24:51 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c313f8c6c9so2945735ad.3
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 16:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693524282; x=1694129082; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cYadnNUzS+EStUScAbd7zg63A8xSjmBqfglid51vMNM=;
 b=QBwIEakuGpcuvTEcoH96wbCul7hGrca3XVkdicJbd9ZqzcOeQqgRzalJSmSq6o1IEK
 as8/pkZIjnFJJC5JPKvafp6FMQW4HgqohvFX+SybqqnhnELcoZIPfaGjz7zvBkjb4KpP
 C3FbA0ljMyAARcIpkwp/kG3FzkkryrM4pZ7aMnF2PZX+dvJxMovRUlWVxr6OwGXSH1XI
 z++/UxOLNOvk2T4RPkrPBULCk5FGxz1jhPgrznT76d5GU3pJvDA1H0pW6mgVZ900ag5z
 +4ITBDILTaeoR/oay1yZO9ZJ9U4mmoDicGpdM+TZhD9T7MRxF3OQgdOcRILkTR5mdTq5
 O7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693524282; x=1694129082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cYadnNUzS+EStUScAbd7zg63A8xSjmBqfglid51vMNM=;
 b=KCi8Arf6/8/pOdiZ/v+lunjMK14rFlu6XzJWkz+J8oKTBK2BGV6RwiLMjoM8DYq7S6
 XfMgQj7OuMIAmjk5uDU8fMftiZmpg4mHn99V6lMOmb/7NoA4XXxWerfRk7IUNQqhV3zf
 0Suy50BFCaqxGKPgh59xnhL5d6LNkcvCW5MX6S49+khIyDQxXbHZ6zl6DrJ5zQq0VZ4i
 Op+dJOLsa3/rsMX8SiKgp+ktddcoU/pEjs5/XUz+hPYjB7KsNd0hZRur5SNjEn1PY59C
 7YuWOrXYmutjvYw3GASTWBvRNjxXDutf4IR38lh2QYVccjgshNDu2I+9qCWstxPbKQqV
 H5yQ==
X-Gm-Message-State: AOJu0Yw4MyFjPW30R+lbUIX934XYfCTg8bBQJe8l0DzEgFYMKYuXdYTI
 QViOR6YWiDM6HKUg83683yXJ4Q==
X-Received: by 2002:a17:902:d3d5:b0:1b6:c229:c350 with SMTP id
 w21-20020a170902d3d500b001b6c229c350mr1195958plb.18.1693524282543; 
 Thu, 31 Aug 2023 16:24:42 -0700 (PDT)
Received: from stoup.. ([71.212.131.115]) by smtp.gmail.com with ESMTPSA id
 jd5-20020a170903260500b001bb8895848bsm1732711plb.71.2023.08.31.16.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 16:24:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 0/5] target/arm: Implement cortex-a710
Date: Thu, 31 Aug 2023 16:24:36 -0700
Message-Id: <20230831232441.66020-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: t677TXuoP1Mu

Changes for v3:
  * 9 patches upstreamed
  * Implement RMR_ELx generically, as a stub.
  * Implement TIDCP and the closely related v8.8 FEAT_TIDCP1.


r~


Richard Henderson (5):
  target/arm: Implement RMR_ELx
  target/arm: Implement cortex-a710
  target/arm: Implement HCR_EL2.TIDCP
  target/arm: Implement FEAT_TIDCP1
  target/arm: Enable SCTLR_EL1.TIDCP for user-only

 docs/system/arm/emulation.rst  |   1 +
 docs/system/arm/virt.rst       |   1 +
 target/arm/cpu.h               |   5 +
 target/arm/helper.h            |   2 +
 hw/arm/virt.c                  |   1 +
 target/arm/cpu.c               |   4 +
 target/arm/helper.c            |  64 ++++++----
 target/arm/tcg/cpu64.c         | 213 +++++++++++++++++++++++++++++++++
 target/arm/tcg/op_helper.c     |  33 +++++
 target/arm/tcg/translate-a64.c |  21 +++-
 target/arm/tcg/translate.c     |  33 +++++
 11 files changed, 353 insertions(+), 25 deletions(-)

-- 
2.34.1

