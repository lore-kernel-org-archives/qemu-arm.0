Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp171394lfq;
        Fri, 8 Apr 2022 17:08:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwx+LtQmpDE4ec9MZ+9LbdRLQkQoQAjfnHqW802Wkf018+/bFuRBN3OfivTdTt1eNlxybeM
X-Received: by 2002:a05:622a:4ce:b0:2e1:e18f:5b33 with SMTP id q14-20020a05622a04ce00b002e1e18f5b33mr17688013qtx.565.1649462897762;
        Fri, 08 Apr 2022 17:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649462897; cv=none;
        d=google.com; s=arc-20160816;
        b=APLuCdIxio29JIAnE+RTDaeiKPVVVb4I6s7tPc5byUmkjYzB2CzoYzbpInXgKDhCTC
         ojkLe8VhUVxBnHD1fIQs7fZIQY+bJd9NXF6zs18kiTBT1OzDMulGtbNT3J19+J8e/ZZQ
         T/mCflncxsoOtwkvSFJKcO2WXfHTnHQfyZF8z5E0Ik7s1g1s8bTqJ5E/Me9F4lLUS1dc
         l25GiS14fYXIjn7JIcFnoYEfur8QrIHCVh1evwDG2gAlZ96mLvf0EwEvO6gUZPLPAdDt
         W2744+UHCwCNLbSXc401g6+71FSp8fhRaGQhQ5R79oTArB9jQCPD8+3qxu4EXr32Vvva
         4r5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=efcVigAnKX7p9IGBQV/mR+zwRePp2DOJ0O08PYshorU=;
        b=C6e6wYV8TTdn2bIyPuKeCKt8Aorltc7oLZcsRiw4QLt3cDvTGr768wKKmHjCnza9Qu
         n1WhmC5/zdKozhifFDJw4vMqA5xqWNUDDk/o+KBCZz2RMPkGnBW0rHOGAOI4006avkd2
         +/UAgNLN32l8A2vOZGzZH95ew1N0uNfL6MC+YC7Fc989CqagRnGO+65e3mQ19BTTwx0u
         NKu+jDox0QKzaeHGl7bpdMawuKNFRdBk9Tn7IDqsUUMXou30MR3yjh/rH+hndjz+7nmd
         BRPDQWpeDOOe0/yPrq6Sw/GKBTVYO3KWgtH7JXOObjKe0Z7Auk8KltZQUjHiK2xLnrFw
         3vZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RMz0M1qN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d132-20020a37688a000000b0067e4be23a34si1216814qkc.633.2022.04.08.17.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RMz0M1qN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncyeH-000892-8n
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydm-00088R-TU
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:07:46 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydl-0003PR-6d
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:07:46 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so6692517pja.0
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 17:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=efcVigAnKX7p9IGBQV/mR+zwRePp2DOJ0O08PYshorU=;
 b=RMz0M1qNij9T72smGZrtPnrGAAWANBm8Z/4WTi7rhod4aXRrheGETcWaII7v6vX7Mf
 05kLscoTOnxUb+B0VqDV/ziLj/Xs1750zAI/ytLMgjVRtCkqGHLk0shHGC23GF5CgLE+
 4zbM4MCS1wYvmHktEMl7DoEDV0DxnmVUtDjMT/tAZq8JM/iIgHzkCY9QO6cHn9uf962/
 1ao0qMNrn9JHksxWwfeUC7Va9+DHG4K8VBiaVNDqs7EComFJo4+vT0HEI6GqxHJhXVPK
 j64w6Yg8WDkc+YmmdQsAnOguZl08Ct5eR0ViaZryMnvIPLuQ5mA9AYNVnUrhK01rLvi9
 yqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=efcVigAnKX7p9IGBQV/mR+zwRePp2DOJ0O08PYshorU=;
 b=JyEo9zgtwSzQBkVJvGayN/Di1NKUd1OH7BUOf0hnRVSbJCyB7Ww1kw50Ua2fFm/QlX
 KJO46u9AOk7pqp9mV3wLjmpyXDZ1TMPOrgFJjE9eTr/SPgIXSvXdeI8BwAtVZUcTMPNK
 hyCzc9Znoo1iit3vvBdc7oRmJ7eeRje491/H1qilKwogFB07d1o1BrcefaPEjveQ9KTx
 Qyxo3uJSJaAI6/az732yQkHblG4Cer8T3+zXRRDPndSpo4DEKMC/jC6fABniHa/eabWe
 w31YHCNNaWndNkFwCi3UVNbAcaS7SgQawZ+aSxC6HhGZbAWEnR1lSFaT0F6rMy+CgJNy
 2oZQ==
X-Gm-Message-State: AOAM533HsIqPhMyuYWHXWfCNqgNSintnSbAFMIgMELKpz0WEEZRbypZr
 E7WOuHRGVugOmdjamNF0m39P6lLf2oL3kA==
X-Received: by 2002:a17:902:854c:b0:158:35ce:9739 with SMTP id
 d12-20020a170902854c00b0015835ce9739mr982390plo.150.1649462863375; 
 Fri, 08 Apr 2022 17:07:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/16] target/arm: Implement features Debugv8p4, RAS, IESB
Date: Fri,  8 Apr 2022 17:07:26 -0700
Message-Id: <20220409000742.293691-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gUDREpYXAFd1

I'm implementing the non-JTAG portion of FEAT_Debugv8p2, which
is just making sure that CONTEXTIDR_EL2 is present, even if VHE
is not enabled.  Then Debugv8p4 is a trivial extension that only
touches the JTAG interface, so turn that on too.

I've got some cleanups to the setting of isar features for max.

I'm implementing a minimal version of FEAT_RAS, which has no source
of physical SErrors and thus no need for Error Records.  It does
implement virtual SErrors, which can be injected by the hypervisor.

Since we have no physical SErrors, FEAT_IESB is a nop.

Finally, I'll note that with Peter's GICv4 work, we have all of
the parts necessary to implement the cortex-a76.


r~


Richard Henderson (16):
  target/arm: Add isar predicates for FEAT_Debugv8p2
  target/arm: Adjust definition of CONTEXTIDR_EL2
  target/arm: Update qemu-system-arm -cpu max to cortex-a57
  target/arm: Set ID_DFR0.PerfMon for qemu-system-arm -cpu max
  target/arm: Split out arm32_max_features
  target/arm: Annotate arm_max_initfn with FEAT identifiers
  target/arm: Use field names for manipulating EL2 and EL3 modes
  target/arm: Enable FEAT_Debugv8p2 for -cpu max
  target/arm: Enable FEAT_Debugv8p4 for -cpu max
  target/arm: Add isar_feature_{aa64,any}_ras
  target/arm: Add minimal RAS registers
  target/arm: Enable SCR and HCR bits for RAS
  target/arm: Implement virtual SError exceptions
  target/arm: Implement ESB instruction
  target/arm: Enable FEAT_RAS for -cpu max
  target/arm: Enable FEAT_IESB for -cpu max

 target/arm/cpu.h           |  33 +++++++
 target/arm/helper.h        |   1 +
 target/arm/internals.h     |  10 +++
 target/arm/syndrome.h      |   5 ++
 target/arm/a32.decode      |  16 ++--
 target/arm/t32.decode      |  18 ++--
 target/arm/cpu.c           |  61 ++++++++++---
 target/arm/cpu64.c         | 150 ++++++++++++--------------------
 target/arm/cpu_tcg.c       | 166 ++++++++++++++++++++++--------------
 target/arm/helper.c        | 170 +++++++++++++++++++++++++++++++++++--
 target/arm/op_helper.c     |  45 ++++++++++
 target/arm/translate-a64.c |   7 ++
 target/arm/translate.c     |  10 +++
 13 files changed, 504 insertions(+), 188 deletions(-)

-- 
2.25.1

