Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp40755lfc;
        Tue, 2 Jun 2020 18:29:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQdWnye3/Q+H90xDQYyyP96EqKYNHt2xQNFRQNSIiPratDBxed1RS6HWznBQoIvMM9U1hI
X-Received: by 2002:a5b:4c2:: with SMTP id u2mr35952184ybp.100.1591147796167;
        Tue, 02 Jun 2020 18:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147796; cv=none;
        d=google.com; s=arc-20160816;
        b=XGADgOtx6hnwkmK/W0eb3lH/aIoFO5D5JxtxugrPZiUqw0SRejJ0sfdmaBMIesNctI
         CQO0g2RrR/SlwL27gpzu7saKz0HNqkO/1D0ocsRSPIPc1+w286LhAWrATPtPmqX8K44s
         7j60oIlG3XQCMtRt8myl69neNc+cs0BF1iINlYovexN0FQusQruxg6VqFgo0pIt9yDBG
         IX9feb3PWFyqx1R+ufQVEb/2vPIKJ3sSmbdhB7esmUOCp2HtEF4nplzGjB0cJLEfh6Ux
         VUrEwgn7gLYphIvpAj9LcmVAACMm6fIBUSrb91ndhlh2QfkqkNDog+fmR53R9mLw1U/+
         PpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uaH1sngv9xlWH/X8rZjic7q7Jho9e1jf1ezwAdUAR9c=;
        b=OCK5bd53TXDxrPM/yjMOvQT0aBaGXwAAGwjQgCQ14wy0IMRJAPtm93MAR2eqIHxs9E
         0pVMM88dpj4A2/lXxQKTBvgf/rBbQFWULvzrAniwKg4y8iz1a6OkwB56hQQPaLC4cpor
         U1pzHRTPDddG5zlc7hPSO/FvMlsYBRdCsyvx4pVcwevLeEe6Rsqd9vdfDKWSSPMPs3Ht
         5KWAkCcz53tNsZqys3vZ8yVbMLUxT2ktOMHihTLkiHtjQ4R6nxYGOxrJQ7BAoyQ/MsUy
         3Euzh37usTI8dhMsqsZuV4yTRk6SMnDmJj+ko1xM/joAuTpwNL39vH9t0t9mg1KtEmxU
         YWMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W2VpHdhl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i201si333930yba.183.2020.06.02.18.29.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:29:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W2VpHdhl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgIE7-0002NC-HR
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyt-0005AA-81
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:14:11 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:35947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHys-0003hI-6Q
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:14:10 -0400
Received: by mail-pl1-x644.google.com with SMTP id bg4so205640plb.3
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uaH1sngv9xlWH/X8rZjic7q7Jho9e1jf1ezwAdUAR9c=;
 b=W2VpHdhlmXjJWldCJJ/AWBtSxY3UTYaz44DqxLhKEiskonM1uXUpPuN29hCgBFhPvP
 gA7YjjtvTHhJ8fx92XaeSMXl0EFMTDiukC9LU3Yk9lybiGySoCD1FPyYl6zvjVsQjQ/1
 bQ2EaThf9TApdkDsf/53X/YavAdnEWivRfC/g5t8sKJoQ31aoYdEOBXNRTkUlsEOj/HF
 pEy7asfNnWtpbtpB+r/l0jBmQgdZTeeqoGSkuw3PxtzqKW4l1RH1ulpfwhNN323u4vCQ
 18fu0Mjvz++aU6Vdi5E0zAATT6NdUkmOwx78uuxXr/TJyE2Pn5x+g6UZwh7ulqF3O9zU
 EG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uaH1sngv9xlWH/X8rZjic7q7Jho9e1jf1ezwAdUAR9c=;
 b=s8htN2Bq9dDrxd9a9904bzVJ9ClQVt4a098VSjW1QkM6zvvQOIIT/XqYBFGm3N84tt
 fxVCxuqU22rzViD3UaBoWlTYysLTw55mVQHUQ94pkPX2kF8YTKvq61Go/giGHE0Qz1AW
 36jFkwtBOZQRM618ioFCLpDpvC8CQ8OuCQZIVyAYzcXjvX7DHbwDYvcugcylwZOnlr/h
 9Cq5PzBgMYxsxxLxix0+k32PojWGBgrWNXfkc2/vNFW9I6Ab5mk99lcL2aEMM8mgQXBa
 EBBD8hjdnDEck/af5ZkIxkVZixeS1zymXJbmSE06vGMfTd0TkB+R9pnlfeuf7D8sZjm4
 4qMQ==
X-Gm-Message-State: AOAM533H+D1fsDKvVtSsCkQ+LSl1vMpz8lAwW1JFKOeOeWcrJJnNuFDM
 60ctUG6wmb5sEBtEV5ku/fN4Ig==
X-Received: by 2002:a17:902:d711:: with SMTP id
 w17mr28235658ply.122.1591146848946; 
 Tue, 02 Jun 2020 18:14:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:14:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 38/42] target/arm: Set PSTATE.TCO on exception entry
Date: Tue,  2 Jun 2020 18:13:13 -0700
Message-Id: <20200603011317.473934-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: li6nhwM4hsF4

D1.10 specifies that exception handlers begin with tag checks overridden.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Only set if MTE feature present.
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3adafc07f0..50717afa4a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9702,6 +9702,9 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
             break;
         }
     }
+    if (cpu_isar_feature(aa64_mte, cpu)) {
+        new_mode |= PSTATE_TCO;
+    }
 
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = 1;
-- 
2.25.1

