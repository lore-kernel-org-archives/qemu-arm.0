Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1449725ejb;
        Fri, 15 Sep 2023 11:55:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8BHZyZnXo/2dfhqgqbpJP8R8iAVO5KVenXG6VvNPIP3GdG1VooJaG1O0cx75zsqceubk+
X-Received: by 2002:a0c:e252:0:b0:653:583d:d400 with SMTP id x18-20020a0ce252000000b00653583dd400mr2561367qvl.52.1694804145553;
        Fri, 15 Sep 2023 11:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694804145; cv=none;
        d=google.com; s=arc-20160816;
        b=CK8UNnWUB0hikb43kdSt263y4P0M3TSyE8J95EX1SWrt3YPKtmouqcjWJ2fVH0tMVc
         e1r8P8SGfy/RKl8Q4Y5mIEPsdy8AkLRJtEtLfMFJStibVu2NSlGWhZrmmnJJgP4gC0aE
         mp4ssX7Kbt0yStv8m/wfq4f0EHsfMGgSjPgBIGRfktQyWPCyvX9HH5eqRLXsO5jdGMXI
         mGR2gYsRQJHAOAymsaAukte/sZ/9m6KCO9niCDnN6xX/ByU1IXtQkivwNJDf75xBS34w
         ihBWGVLSmBcIAqEelmCXwi6MDZwHvjd+haGOREzifcHNDce49n/RMv5FdUHuQAYv5+Nn
         OgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=9jgPK6u6/IaW71TDmMBW+04LLarvxg3GzKR6+7/W36I=;
        fh=nwESBDOyclRGtn6Eb3BvmV07s41NPEOkjsujT6WbZfE=;
        b=HIeowv6lGAMBMpPnpS6BuTZIf3juTzNVNxwU33dT4Bv6x/zWjJZEBENJ0ezZmNpz4p
         ZgUKNgfDUPYfLlmAi1ewgbt/M11JodBRrm8VmmhmO0gccTOc7ha8U7HDf6mOf3sf0UkG
         seWKog4UHM9fg36qKADJ1OyETbgKM3AsprePqiG8ybQhRRF80LxINnGLaRXPqx1S93Ai
         o6Np/EZyVOdoFOfjspmFMWaDNn4KfRZLT2tKpziMx7u12ct5Vbzuha7S7l3ywaOUtaMm
         PboA93wUclrcrFhF3MZu9IqTmaxzj10+1eTBRdYax0oGzDWcic+ZrjPla3Khme5F7+8p
         3z4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ta4h9gdR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13-20020a0ce24d000000b006515ec4b067si2690772qvl.434.2023.09.15.11.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 11:55:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ta4h9gdR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qhDyL-0000Ts-IB; Fri, 15 Sep 2023 14:55:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qhDy9-0000Oq-RC
 for qemu-devel@nongnu.org; Fri, 15 Sep 2023 14:55:11 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qhDy2-00063M-1G
 for qemu-devel@nongnu.org; Fri, 15 Sep 2023 14:55:05 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-403004a96eeso26774115e9.3
 for <qemu-devel@nongnu.org>; Fri, 15 Sep 2023 11:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694804095; x=1695408895; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9jgPK6u6/IaW71TDmMBW+04LLarvxg3GzKR6+7/W36I=;
 b=Ta4h9gdROmjl2SiWajZ1oDADCjUSgiieRMWbF4gM1PFH05AWb8cOgsrdPkcPatIzPr
 cM6MLL9it16nIsPI6aCx/NxbSBsR62dqPsecNThI9jRKxObHdowv33nETiprn3B5uC/H
 UBt/74tOsr/a8oQHnKVj1L6TRYPDTu4yLTiYDmd7MWr9pKbDUZ/jRCnnuynpIisekfkp
 EWh3liFvwN0Ma519br1pYjlXNxLTf1Wde99jHH2H2ue4Igrj+JvJkTowZ8EcMfPzYsjq
 ME4tI2x/Qr/NMPL+5vv0eQdNAT52TORAB0kGxyaQ39XqdUd3kKaNKfd0rRBX7coTM5Um
 ymwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694804095; x=1695408895;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9jgPK6u6/IaW71TDmMBW+04LLarvxg3GzKR6+7/W36I=;
 b=DOLQ23KfjXeKSME6Sn/KgfmoIfCSdQvLPQyheJ/hK6EXWXu4TJtYPdqWS62S8/Akkp
 YDuG+81DdLuZSUM1e3Nn4ojswaqHt4q20PBmVufBpkAkNVUaZQMlF51mCqt5l0TrbvGy
 75izvrloX3lf959MO5IvnGuOwNmAoTLCJQAEDWLNmUS80ybNbwCoMFx7kdX8elEsrh8t
 kYi4HigWOjktj4X+30dtWRO+ABTpV8cF4UbZSkuh1y8By8UJ21W3Vet8k2NxhPJuSCgW
 XGluDnG823pU7/+M9UJ+9ij4Jxs2Xhsh1ZjDoDr1WA7mfXyJWakCuBMAeyoKJw99aK+l
 Td4g==
X-Gm-Message-State: AOJu0Yztfcm2rxkZyzhqrBpwYrMFvMomdRvUyAkCJRgv3gDUnQkj6Lfh
 aM9568jY+YBmJjFUKFzknQviwg==
X-Received: by 2002:a1c:770f:0:b0:403:af4:3178 with SMTP id
 t15-20020a1c770f000000b004030af43178mr2459667wmi.1.1694804095442; 
 Fri, 15 Sep 2023 11:54:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a05600c294c00b003fee777fd84sm5298849wmd.41.2023.09.15.11.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 11:54:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH 0/2] target/arm: Implement Neoverse-N2
Date: Fri, 15 Sep 2023 19:54:51 +0100
Message-Id: <20230915185453.1871167-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: rMos8NH6fVXc

This patchset implements a model of the Neoverse-N2 CPU.
Because it's very similar to the Cortex-A710 we don't
need to implement any new features for it; but because it
supports 48 bit physical addresses we can use it in the
sbsa-ref board.

Patch 1 fixes a few minor errors in the A710 definition
that I spotted while I was cross-checking it against the
N2 TRM to see what had changed.

Patch 2 is the new CPU model.

thanks
-- PMM

Peter Maydell (2):
  target/arm: Correct minor errors in Cortex-A710 definition
  target/arm: Implement Neoverse N2 CPU model

 docs/system/arm/virt.rst |   1 +
 hw/arm/sbsa-ref.c        |   1 +
 hw/arm/virt.c            |   1 +
 target/arm/tcg/cpu64.c   | 114 ++++++++++++++++++++++++++++++++++++++-
 4 files changed, 115 insertions(+), 2 deletions(-)

-- 
2.34.1

