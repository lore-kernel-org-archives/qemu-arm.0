Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1260856ejt;
        Mon, 27 Nov 2023 09:34:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFv20WU6x1fDLAYP9Oqk76wkCl8Ua7cS/JUCIam1fPnin1ZQMUlZtR/u0zPqLBV87Fh2Shn
X-Received: by 2002:ac8:4f4a:0:b0:423:a49d:474d with SMTP id i10-20020ac84f4a000000b00423a49d474dmr9108279qtw.21.1701106444898;
        Mon, 27 Nov 2023 09:34:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701106444; cv=none;
        d=google.com; s=arc-20160816;
        b=W3+WGua+1cMyLRN56vJHF7GUxj/zDnhcIQ1AeC8ipOZAXJHLa69vKB6k1AKj+S6d9n
         uCUU77IcFgWrL+wD9/INKD/HoObybEtk10ayMNF5JF+eXiDkNSomZHmqOOZdCyFKiZxg
         p7bYp4nOoJNmNeS1qExeaRfPIZgAjKxMty72dMMfppowAGFmJSBvNvkH0olL9SzWaoHp
         Unc/z1xwNUx0Gq3+CDgczknbujlEemzpQ/nwc4qHsgJn0Bse4JoX7LfLANFQPK6o/Aya
         B2vGruqBAess+xGNcVY5E5AYOIJSkUaxpNfXEfa2QcJ9rJl3ypqHzoyCeiPeBKZZF4bF
         ZWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=VTmP2SfuKtFGsLKLcYsU/86EziA+M1ZnG6uDYIkwoU0=;
        fh=F/7X7Seg/K4ACCh75jVriQvONgYJZg8aichyAEsNj0w=;
        b=wOFbfsklXweRSmPhXDgYAvA3kX9sDcGwfEmndHMNYkShxKmLcrANDSXWVhmrSsDCSi
         Z0A6I0lTa3/C1vdUBOv0Erwb1C/LCPEzRc+7f4JgrtqqGFDUFGdrMROBOnBmkllBlTBk
         eJG5KAHv279SwDhjx/Yex0MUEkxlXvfiKQyOHJjAHxwvDAV+wtqEj/dX0Cz3aQLGY/vE
         Ru4BN5dDk9HfJaAb6eubS4Syh27yUx+TT60PGKyH6hQRzLl8VRn9ER2ZEhGe0lY9fEZT
         tvxwS3TFJkkz/Snk4B0C/aqU/ZVYt0Cdp8hHc3OEM6Ahwx/UK4EShEwOLMFohIMytFzW
         cANw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fs8oG/5o";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020ac85913000000b00421c3b9dbe9si9326936qty.208.2023.11.27.09.34.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Nov 2023 09:34:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fs8oG/5o";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7fU6-0003uv-NP; Mon, 27 Nov 2023 12:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r7fU4-0003uB-NC
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 12:33:25 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r7fU2-0000r8-Gw
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 12:33:24 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso36690095e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Nov 2023 09:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701106400; x=1701711200; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VTmP2SfuKtFGsLKLcYsU/86EziA+M1ZnG6uDYIkwoU0=;
 b=fs8oG/5oyyCJQTu8Ht66+THWnjlOz/oWCiQ4ImnzRGyAQTvllqCkgwX2VkaPL95X7V
 4ItBcc1aJiAYuBBz8JaFGFi1xAUtoVJbr/IGwHguhD45cRQLyRWOnqGAE6jzsfV2+gbu
 XggGKDT8x35ezVACgoalSocDlXpF3wtqyzdrE8PUWQ205wwrBoVfSnMQ2qQh43JFvFv1
 Gb3gwE5Avxcua/5kP60Z76X2mn3eHudD4ND4MjozY7YXTfy1lYv2kpVGh825Qcw6JMF/
 lUvFQvocGIxcBR7mGU1QFEtkI7uu37TgVWLhpUHUOVchvlp0Y6AO3G4J50gB1HvdFMx6
 BxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701106400; x=1701711200;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VTmP2SfuKtFGsLKLcYsU/86EziA+M1ZnG6uDYIkwoU0=;
 b=cUbzl4hV7YJ6syTA9pS3kU7hrthvHxqQNup9AL66b3vpAt3epccaZ3wLIJVqHynoFU
 4qTgvHOIHpu3ixiMnrNzFDOgrV6+FxJr/VwVPS5a4XXRUbK27U7K66/JWbOrgk1iHvwj
 j+yrgM8GHmBPlpR25uR1Fm/943wCNYVXBB+WQBRs1A1woVp38nd/xXiAWeHRWWez4Pke
 uQhUnhYhIGRn05roZ3jpbRod2QikvSSBZ8lxJZpb/zT2TQJ6jo0jN3IyYdz8S3uQShCS
 55PkbNqZ4vVnreEZJbACyV982rDxLiAkAzAd6haqzx4UouGh1IDXKUWqoYP0H40J3+XV
 m0zA==
X-Gm-Message-State: AOJu0Yz+2DvMor6TeM8XYjmipFSRU+u5HEraebD8MVHUqS9wKAGRUQhx
 WQwY8htv+aM6umv075t/i/PsbGlLmEvgmgLfl5U=
X-Received: by 2002:a05:600c:190a:b0:40b:3fed:cbeb with SMTP id
 j10-20020a05600c190a00b0040b3fedcbebmr5769424wmq.32.1701106399879; 
 Mon, 27 Nov 2023 09:33:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iv8-20020a05600c548800b004063ea92492sm14712187wmb.22.2023.11.27.09.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 09:33:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	qemu-stable@nongnu.org
Subject: [PATCH for-8.2] target/arm: Disable SME if SVE is disabled
Date: Mon, 27 Nov 2023 17:33:18 +0000
Message-Id: <20231127173318.674758-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: kBzwq639j3k8

There is no architectural requirement that SME implies SVE, but
our implementation currently assumes it. (FEAT_SME_FA64 does
imply SVE.) So if you try to run a CPU with eg "-cpu max,sve=off"
you quickly run into an assert when the guest tries to write to
SMCR_EL1:

#6  0x00007ffff4b38e96 in __GI___assert_fail
    (assertion=0x5555566e69cb "sm", file=0x5555566e5b24 "../../target/arm/helper.c", line=6865, function=0x5555566e82f0 <__PRETTY_FUNCTION__.31> "sve_vqm1_for_el_sm") at ./assert/assert.c:101
#7  0x0000555555ee33aa in sve_vqm1_for_el_sm (env=0x555557d291f0, el=2, sm=false) at ../../target/arm/helper.c:6865
#8  0x0000555555ee3407 in sve_vqm1_for_el (env=0x555557d291f0, el=2) at ../../target/arm/helper.c:6871
#9  0x0000555555ee3724 in smcr_write (env=0x555557d291f0, ri=0x555557da23b0, value=2147483663) at ../../target/arm/helper.c:6995
#10 0x0000555555fd1dba in helper_set_cp_reg64 (env=0x555557d291f0, rip=0x555557da23b0, value=2147483663) at ../../target/arm/tcg/op_helper.c:839
#11 0x00007fff60056781 in code_gen_buffer ()

Avoid this unsupported and slightly odd combination by
disabling SME when SVE is not present.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2005
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
'-cpu sve=off,sme=on,sme_fa64=off' crashes in the same way, so just
turning off FA64 isn't sufficient.  Maybe we should support
SME-no-SVE, but for 8.2 at least turning off SME is better than
letting users hit an assertion.
---
 target/arm/cpu.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 25e9d2ae7b8..0fe268ac785 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1743,6 +1743,15 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
             return;
         }
 
+        /*
+         * FEAT_SME is not architecturally dependent on FEAT_SVE (unless
+         * FEAT_SME_FA64 is present). However our implementation currently
+         * assumes it, so if the user asked for sve=off then turn off SME also.
+         */
+        if (cpu_isar_feature(aa64_sme, cpu) && !cpu_isar_feature(aa64_sve, cpu)) {
+            object_property_set_bool(OBJECT(cpu), "sme", false, &error_abort);
+        }
+
         arm_cpu_sme_finalize(cpu, &local_err);
         if (local_err != NULL) {
             error_propagate(errp, local_err);
-- 
2.34.1

