Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp526405ejc;
        Fri, 6 Jan 2023 11:45:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs5Ifr+qKwnQ87soswW70Sh+fVAei3V0tf8pAFasqnQVxxhZ3UjRNqnKBgPKm2L+vhyZ67Y
X-Received: by 2002:ac8:6999:0:b0:3a9:82a1:4fb with SMTP id o25-20020ac86999000000b003a982a104fbmr77017373qtq.34.1673034313913;
        Fri, 06 Jan 2023 11:45:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673034313; cv=none;
        d=google.com; s=arc-20160816;
        b=0ctmCgz803j6zuz193ggpK0nPBN63pUrRVduR/deiQ/Q+IKBP+l1z4e5q/OPpVt392
         EYbpfByI5xPBBewkGAxizvX/7jJfH50ZIbVCxFIsnAuGHIYDkmFniaTqmRVsl1u73ofd
         TBH9jsPkhSw+CCaqM2GvIzaeIOi8CIYxthrXi2Y5G9Pq5FZaLch3fsHs8G4JJWI8LEAM
         wXCe6niPFEKHSa29TJsW1/0DcizezRN/vOcdEuxLHZAoV0pQ9rYZoOW0Cyoj3voPcFRs
         9hkQd5G8LojoT7GIxLVRonCI+mGYxQayJ1xidXvCT3hjNJq7FjCeVEL1p7FpiRpO6uSR
         BNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=W12YtWqdEbMdRqFQXwJwxPYsU4QkPqBhgrstRSwXPCM=;
        b=aQNApBy4IqdPrpNZ9xuwtjViG5UezElb5Yfx2PB0EEJ/4AnytQWILBzBy4pzwpVFLe
         AzWEkqWnSI9V2lcBGQ/fLhMEDDEHvGFqrd4ug5+XqzOAy/d1RxNl+8wGGm+vt2zrNfeO
         nP3PaRxnLQV3IJNDAlniLpSRy6BThymch71oZfioy5CunM/c5HpjknCA1yegHb1ZJGTL
         7BdSHGHpy2XxWySL3ROv9n58P3gHqYVH+EGd9ICPJirRIVVSEkjD4nKYc9wjCzRzUXD1
         WAEZbMt04ve/x6p7npq9Ybm63z0k4rmiKwwYT0w6M4SDWv3+hIFJwYX4qivH1BAH/wxe
         NAUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NT1OxOtN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7-20020ac85687000000b003ab79797f51si1311357qta.58.2023.01.06.11.45.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jan 2023 11:45:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NT1OxOtN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDse9-0005gc-GD; Fri, 06 Jan 2023 14:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDse8-0005gM-OV
 for qemu-arm@nongnu.org; Fri, 06 Jan 2023 14:44:56 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDse6-0001ai-VY
 for qemu-arm@nongnu.org; Fri, 06 Jan 2023 14:44:56 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 c8-20020a17090a4d0800b00225c3614161so6181005pjg.5
 for <qemu-arm@nongnu.org>; Fri, 06 Jan 2023 11:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W12YtWqdEbMdRqFQXwJwxPYsU4QkPqBhgrstRSwXPCM=;
 b=NT1OxOtNCyV7iLjQEgYzS5lQdNAJpmEgt8PlfYSiMzP1n+r+UNYIYO3RhRiqtkm/rD
 KHAWhwId8/7re/uLVYl7Y2XfKrgxIjpY03U2T9rmJmSKilgagwW3MHKzaOW8VFpo8+8L
 bqeaJSNzLCO2++8Va9i/s79hyFtypXsTuc5hrx7jv2G0AUYNLlJw9fjPcDEra0LUmurD
 jeL7Negk9mbwbQlpXaeRwE+yc+2vwI4DnQeatlVuFvZjeHv8+iOSfgVY38ZXAnOVyUTY
 BwIixCJORll8alJa/fP4SxhNe40FjcbAwqa2AnLSN++1juzHYYl/QTua8aB6Lao31mOk
 pSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W12YtWqdEbMdRqFQXwJwxPYsU4QkPqBhgrstRSwXPCM=;
 b=Al5qt8yYUI+4FE20CkGqHCjwt8WzzPmzq6NaYS9gg7b5mZXHyNr2D8uPxXHkpDL9qa
 KB69hEQImq2nzZZkJw87aGQusPiGsA+/WrlCuH1RwwqdMFp/WbwuT4XJTXi0oSwdecGn
 2A5U6bqwsCMiz8MbXDS85dXVAOZ3NTEMJxztYKBPKwjoAVOpigKWmbjxOeu6Wuc0nMI4
 kyvvpVyucpAGISe0iJMENZV/BbIYfG8kxT30RtunLihWpci8TOnHOUeroQK6jdnukgYn
 9S39YIJAcukvuIDMdqtsH3U+5e9yeyasSswbpPfLI2+qCl9zBAsnixPQdhgYTrB1gk7y
 UrKQ==
X-Gm-Message-State: AFqh2kpqzEtszBb46OScFUcS5hA8x1PWrxteJGiiHOz8OscNh7OjPMSC
 HujzMmXNVokgkvfWlewcU5UD6Ag2WBt7rKBd
X-Received: by 2002:a17:902:7584:b0:191:35c9:db30 with SMTP id
 j4-20020a170902758400b0019135c9db30mr53748370pll.5.1673034293084; 
 Fri, 06 Jan 2023 11:44:53 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a170903228200b001867fdec154sm1277441plh.224.2023.01.06.11.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 11:44:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: Look up ARMCPRegInfo at runtime
Date: Fri,  6 Jan 2023 11:44:49 -0800
Message-Id: <20230106194451.1213153-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: xy7L1C7zy4aL

Here's a short-to-medium term alternative to moving all of the ARMCPU
cp_regs hash table to the ARMCPUClass, so that we're no longer leaving
dangling pointers to freed objects encoded in the compiled
TranslationBlocks.  (I still think we ought to do less work at
object_{init,realize}, but that may be a much longer term project.)

Instead of giving the helper a direct pointer, pass the cpreg hash key,
which will be constant across cpus.  Perform this lookup in the existing
helper_access_check_cp_reg (which had a return value going spare), or a
new helper_lookup_cp_reg.  The other cp_regs functions are unchanged,
because they still get a pointer.

This ought to be enough to re-instate Alex's linux-user patch
to free the cpu object after thread termination.


r~


Richard Henderson (2):
  target/arm: Reorg do_coproc_insn
  target/arm: Look up ARMCPRegInfo at runtime

 target/arm/helper.h        |  11 +-
 target/arm/translate.h     |   7 +
 target/arm/op_helper.c     |  27 ++-
 target/arm/translate-a64.c |  49 +++--
 target/arm/translate.c     | 430 +++++++++++++++++++------------------
 5 files changed, 285 insertions(+), 239 deletions(-)

-- 
2.34.1

