Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1974517lfj;
        Fri, 6 May 2022 11:03:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjPpZsw8jEUD40fN93gSXvjhjyu9t9ordf1Cp0dnlIe79mQ5jjpqsd6DFdKW/e92eScGIf
X-Received: by 2002:a05:622a:13ca:b0:2f3:b1ac:48f5 with SMTP id p10-20020a05622a13ca00b002f3b1ac48f5mr4013921qtk.125.1651860185465;
        Fri, 06 May 2022 11:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651860185; cv=none;
        d=google.com; s=arc-20160816;
        b=F5nkanQoWVjfc5CNIAhFY+sExlXjlrUV+SCssRTeSppfhGGVVHSs4QwySXtj4kzzF4
         iF/aLISGvlCefDb+q9VnryWbWAi1OBLw+A5wCjRL/cgk9wI2QPjsXNxt2LRaPe83Gex/
         vL2RNeKqv/iT1wQTSwdkK3+cxjLPn0v5TW6DcnryHa09Lgn9tfhgZ0ryz39jpjrZUAlA
         1nDSswOmTaz8YzVC2yu2HtGnvJOfN48A7xErzNNsmaB/J8Of70aoj0vw7rJ/CVMdLGTF
         obuOfMcXo9Fd1PeHixZWUm4iPwjMLJ/Mi7WqJo+6PPIJ2muahXG8lK2Q/Td2qak62mao
         QO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=NWD4Tg6DN3u0dhSlsiJ3CQzt9+zcyyxzJeNgLCVwvU0=;
        b=vvELh+XEFxW/z9iwk7BbSh1JHjCaoTWqB6JwVOVemd4+lEzkIJFEWi0yHhALUXzUDD
         2i5ZtFn8FNziP/5yezi/sB8g1gKngBlssCtgxkclxlB2G3wHr635M5vxzfzlhinDLD0o
         zCNqOKowMmugt8+zQncWMNOFMgkyqbttFM0xo4swJGDwIxfGGhdfzCrEesoZCSTuWSQq
         CohshKUYbgL5OpLwq8aXu/OpnC0/+kZ3XoQmecanBSQbc6H34UYkrEcToA495FfL3K8l
         DqrSFnskc7WAu7LQNUAenpofUdKCs/OP9QbYMOgCp6KkmPNMHPE2xb23QGrb0ILEGAKQ
         xPEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UChIhTWD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gf5-20020a056214250500b0045667133e6bsi3944538qvb.400.2022.05.06.11.03.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:03:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UChIhTWD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2IC-000563-Ur
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2Hx-00053D-DZ
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:02:49 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2Hv-0003nt-HO
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:02:48 -0400
Received: by mail-oi1-x236.google.com with SMTP id m25so8306404oih.2
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 11:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NWD4Tg6DN3u0dhSlsiJ3CQzt9+zcyyxzJeNgLCVwvU0=;
 b=UChIhTWDU3WaEehzMJEb3pSIvtCP9WzFl0Tifwpa4ZE01IsN7ZpgZuIov0OfgcdfX0
 x3uOKXW1FLepxMDJjYWRLF+0SXyjx7D1bNd9fqCUXkxyXbvBE3CeNO/Tkjr7p0WYnBPB
 VtZfHZuKYWD0fPAMYr7HyqmEsFW+evsytPTAC10c0NM7qep/ZRlQ45IKT5/Evv3eJKQ5
 50jT0tXQcrY7sqgLUBpP1eDZW0JDMj1yfE85M5ULphxGUwHeT20QmRpX3zaPOqEwb/H6
 OxaeUez7sMohLllzQUXf2fU2xdstPaxtPqYw6/mgQuH5M58NAfUmH98lxDra0otvyFRQ
 V+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NWD4Tg6DN3u0dhSlsiJ3CQzt9+zcyyxzJeNgLCVwvU0=;
 b=tMGqrGg41EaAtBfZEOriXUeUwAvtcGizmlg69HFe1Ubt1ujP7e250VBg2foRbZ3V0T
 viMwMEtMooFZ+NsaiJf0h09eOmRhQHgA1M913v8GKBDSPqs7QBh50th8laNn9ruSqGoU
 euzeBBRw5DetZMMZ8O+9sj6CME8XAoRJjEJqcEMAOeXVAVXCZCMb+MhLLNifcJTsZHLv
 KtJKc/MpnBH7160LGehnv29TA+fHERs0cgJf/hSLWmv55VB6qCzlECM6658QifB4O9UU
 JQhH2yT0CuI12O6eLIlOz7gzOWaqNCFwWZW42VPzEL4G9on7RNefmeYh+PPk6Sv7OnwF
 YUEA==
X-Gm-Message-State: AOAM530+lO9g2Tf6KlYhjgzmDwzU9DKr8gM9WK5qwp63wBySyVza7y7j
 ie0m83Mm+pabmzlpaWhQNVlUPg==
X-Received: by 2002:a05:6808:124c:b0:2f9:c7cf:146 with SMTP id
 o12-20020a056808124c00b002f9c7cf0146mr5430464oiv.54.1651860166052; 
 Fri, 06 May 2022 11:02:46 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:02:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 00/24] target/arm: Cleanups, new features, new cpus
Date: Fri,  6 May 2022 13:02:18 -0500
Message-Id: <20220506180242.216785-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 12uHX+7rMfXB

Changes for v6:
  * Expand the commit message for "Drop EL3 no EL2 fallbacks" (pmm)

All patches are reviewed.


r~


Richard Henderson (24):
  target/arm: Handle cpreg registration for missing EL
  target/arm: Drop EL3 no EL2 fallbacks
  target/arm: Merge zcr reginfo
  target/arm: Adjust definition of CONTEXTIDR_EL2
  target/arm: Move cortex impdef sysregs to cpu_tcg.c
  target/arm: Update qemu-system-arm -cpu max to cortex-a57
  target/arm: Set ID_DFR0.PerfMon for qemu-system-arm -cpu max
  target/arm: Split out aa32_max_features
  target/arm: Annotate arm_max_initfn with FEAT identifiers
  target/arm: Use field names for manipulating EL2 and EL3 modes
  target/arm: Enable FEAT_Debugv8p2 for -cpu max
  target/arm: Enable FEAT_Debugv8p4 for -cpu max
  target/arm: Add minimal RAS registers
  target/arm: Enable SCR and HCR bits for RAS
  target/arm: Implement virtual SError exceptions
  target/arm: Implement ESB instruction
  target/arm: Enable FEAT_RAS for -cpu max
  target/arm: Enable FEAT_IESB for -cpu max
  target/arm: Enable FEAT_CSV2 for -cpu max
  target/arm: Enable FEAT_CSV2_2 for -cpu max
  target/arm: Enable FEAT_CSV3 for -cpu max
  target/arm: Enable FEAT_DGH for -cpu max
  target/arm: Define cortex-a76
  target/arm: Define neoverse-n1

 docs/system/arm/emulation.rst |  10 +
 docs/system/arm/virt.rst      |   2 +
 target/arm/cpregs.h           |  11 +
 target/arm/cpu.h              |  23 ++
 target/arm/helper.h           |   1 +
 target/arm/internals.h        |  16 +
 target/arm/syndrome.h         |   5 +
 target/arm/a32.decode         |  16 +-
 target/arm/t32.decode         |  18 +-
 hw/arm/sbsa-ref.c             |   2 +
 hw/arm/virt.c                 |   2 +
 target/arm/cpu.c              |  66 +++-
 target/arm/cpu64.c            | 353 +++++++++++---------
 target/arm/cpu_tcg.c          | 227 +++++++++----
 target/arm/helper.c           | 600 ++++++++++++++++++++--------------
 target/arm/op_helper.c        |  43 +++
 target/arm/translate-a64.c    |  18 +
 target/arm/translate.c        |  23 ++
 18 files changed, 949 insertions(+), 487 deletions(-)

-- 
2.34.1

