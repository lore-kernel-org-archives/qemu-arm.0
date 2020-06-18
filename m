Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1266997lfm;
        Wed, 17 Jun 2020 21:40:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS15EQR0NgIpZ5ooyrKxK0ThQTw9EkYeKJ89rbybWJVmAqzwXTEByEYl+Hq13gLxS4FdYc
X-Received: by 2002:a5b:c02:: with SMTP id f2mr3689180ybq.151.1592455206993;
        Wed, 17 Jun 2020 21:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455206; cv=none;
        d=google.com; s=arc-20160816;
        b=RuSR+IFv310Uc5u/y311TKKmDaH+MnDbbJTUDR6j2FOMiKOlMz09uUnQKmQdGTtwgf
         4TAZKbnir6VyAJyZdMCPyoLUx7yXhX0g0DkWJ0PhY4IBmi+uuorMhxPXx7G6xFd65sWm
         wrK1qoKNkDb8DObESqZRIGK6XUpUtfKcsKtC2VQN2mx655gvrjzBIiTrscO21zDBM3Pp
         rHshMyVj1ftBccVXV49z5S2XeXkYyMTUimCNai+fV/jF0jeYddXC/pc27ELFXh4cj8x6
         xBtb0qM1VttxkXF45QD//hIVXjCsNsgS05hizIiAT8CUG8NLR8AY9YHh0AQLufAkQHp+
         ZP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7e8M8ic84VXGl26VraVqHK13nZ7Td4XreFuki7rY3nc=;
        b=gu525Yqh+iLT9AatH7mAsLj9bMDpl2eBV/IdoaIFitW4dUczq9bMstoLkq2XFjCr9C
         Xvev1+15eFYaCzZw+66/2hFW5OxLY8dyrUpxIvFH9jcBZWr0g+TQCcnegqOwWeGVu7oN
         syK9p8/+g6Az/xb+9cEbrXxxw2t2+Y+l/YgojtbEqm+gNuIZB8xC2/sgYPsn41nK9TDZ
         Z/t44oLvutybDSbq1/uPCID5qaVoFqn4MsglQdassb0NoQgGkyeFVfX0EQLduW0vMSGq
         LD2uYQ3D82NdJsYW6x3ozl3KMTJgHige3QSuxQz+1QMkDiRBC7IEdB0xDCsPY4JHf4+d
         VV6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RD4ciCcl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7si1385188ybo.264.2020.06.17.21.40.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:40:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RD4ciCcl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmLO-0002ru-9H
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmA8-0004iu-1a
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:28:28 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmA2-0002Xy-LP
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:28:27 -0400
Received: by mail-pl1-x631.google.com with SMTP id bh7so1898272plb.11
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7e8M8ic84VXGl26VraVqHK13nZ7Td4XreFuki7rY3nc=;
 b=RD4ciCcl46CugQHElWtxOsDymijcKjYDoncjVmfVP3hit2Vjx0htsVBMIt/2RWRa+l
 g2/IYf3FiBFmSXshXOUUKUct5kY/mQIPb2CnVWEzb4hfeytO+4mz2l+4akcXJxq2HfCR
 nBUX1HW5n6CSg+XfDLLIRbxerL69WYMqjyYn7zBfxnKWZWcqgSejQtRYz1pvHSAeKLj4
 3jAK8E93q4emGxz9xOextxflmXrAepkRWTOTkt/oWNqloy6zbLerlx3+v9/UdgvGRS9e
 YysfSYVKLvUnVpVEVUl98KBtfhU53KJRgQ/b4dFTJTLJugLcmwPBQwAJsiNEt1Z88m9j
 93iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7e8M8ic84VXGl26VraVqHK13nZ7Td4XreFuki7rY3nc=;
 b=McAvtg2Asezwkj7RqusdvGy16+OqF925k8b+zyGLzgEzFh67NbpoApGiKA4x4WLC04
 W8NuJ1uo8VtFt/8W/Z+CyJRgw5N9i2njI1bqRYktJYMovn9z6KCBU8mKC4lc29aMcA69
 moqtHBvtvL1niHW1pDXGTt/oCEKynHs67k6QbNh29xHIY+yetk46Yl/5qzvZ7WmcI6ZP
 yWCwLIkRFNYf7nHOyNrcw+FKbXzyLWyr3SUT4uiy8cUdt7UoOJDf+WmC3Ydb6VqlS5ld
 ppUzcgL12TRqQaEynlF6/MLhU0uV2W7/BZj5tR3+OmNkPOrNRhuMMVBz7uo7RtSTdX/t
 /JVg==
X-Gm-Message-State: AOAM533SSDfV40y0pIEezzyGOrzCimqCEN78R/fMrxzIUNn5TEMb9lX6
 TQV29mYtwm0rbssxoy0v+7FCHA==
X-Received: by 2002:a17:902:aa0c:: with SMTP id
 be12mr2181716plb.45.1592454501353; 
 Wed, 17 Jun 2020 21:28:21 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id l134sm1154412pga.50.2020.06.17.21.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:28:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 025/100] target/arm: Implement SVE2 integer add/subtract
 interleaved long
Date: Wed, 17 Jun 2020 21:25:29 -0700
Message-Id: <20200618042644.1685561-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8TugZm4ydjCa

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      | 6 ++++++
 target/arm/translate-sve.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 84fc0ade2c..91e45f2d32 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1181,3 +1181,9 @@ SABDLB          01000101 .. 0 ..... 00 1100 ..... .....  @rd_rn_rm
 SABDLT          01000101 .. 0 ..... 00 1101 ..... .....  @rd_rn_rm
 UABDLB          01000101 .. 0 ..... 00 1110 ..... .....  @rd_rn_rm
 UABDLT          01000101 .. 0 ..... 00 1111 ..... .....  @rd_rn_rm
+
+## SVE2 integer add/subtract interleaved long
+
+SADDLBT         01000101 .. 0 ..... 1000 00 ..... .....  @rd_rn_rm
+SSUBLBT         01000101 .. 0 ..... 1000 10 ..... .....  @rd_rn_rm
+SSUBLTB         01000101 .. 0 ..... 1000 11 ..... .....  @rd_rn_rm
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 13b3ef1a2c..14508cab07 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5582,3 +5582,7 @@ DO_SVE2_ZZZ_TB(SABDLT, sabdl, true, true)
 DO_SVE2_ZZZ_TB(UADDLT, uaddl, true, true)
 DO_SVE2_ZZZ_TB(USUBLT, usubl, true, true)
 DO_SVE2_ZZZ_TB(UABDLT, uabdl, true, true)
+
+DO_SVE2_ZZZ_TB(SADDLBT, saddl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLBT, ssubl, false, true)
+DO_SVE2_ZZZ_TB(SSUBLTB, ssubl, true, false)
-- 
2.25.1

