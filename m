Received: by 2002:a05:7022:1119:b0:6e:5a56:ff6c with SMTP id ou25csp1635275dlb;
        Mon, 30 Oct 2023 10:40:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIW9p5J+9L7z790HZNWvQZdJHhdEq08kx6zQuOAVCCQQ0bv4APMQat+E+4Yck2h+GI2vJI
X-Received: by 2002:a05:622a:44b:b0:412:3092:feab with SMTP id o11-20020a05622a044b00b004123092feabmr12092266qtx.50.1698687636727;
        Mon, 30 Oct 2023 10:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698687636; cv=none;
        d=google.com; s=arc-20160816;
        b=E/+WbbiRB2PW/Qqk946b/4JDJAfduml2m8HtjhI4Vwu44Xf7BSjHxAJU6jRg86PXwz
         /zDc5P1ZE5N+KB77OczLqHrHryg+xi5GEKA30fhYzLVPiMiFYlVpEkrrJhrmDh2w99Pz
         lUhc0QcFLTT5urX55yztsdHdzUyloqGLEaPaLUx+IsKdsegQAFOh/aQN2Hl/lH9raFhl
         R7NrwfnRvZpxh8Y0BEEz0ZKa8M72KAhDB2TXR1hjxqG/V1ioXUtiE6poquF7MRPOpuGN
         YVYCsY86nEDo/EAMASj7tNqbMc0EaaZudn/4Td3Qico6v5xqwKU2YUn0ea8fY/bDW8k/
         J5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=JSidavZgzvowrW64VxdmqiVfrHkIfq+Vecol2GK2W74=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=Jqoi5aUnC7Qwgov3fDZtlx3k5PjQmnXLaNatqNJtOIznMwp5oVkWoMMk+C+JKtYQDY
         NYqB37JFEtIALrZ8xNxvR/6cK11htHpZEZ5locL0sLkyF6+WVFMrQTeeoXkZ2UP4N52g
         Fli6p3nBkC9OyeNmVXODM0jkVkKAyq0C+faiB0UMbYaGNgxT8QqBjn4LXfE8yXoICiph
         bLu9t3siDGFwVMFWrygGLMBJI41+6RNtz4yD9Q09yuAt9yP2wRNTNU6Pz0tB7eP8l5Mv
         d8SjUBl5ZsD36IfunERHhASFk6AItuQKxo4BMuS/PJvsV7F3tCNuTBW/HaZPawRhN7bZ
         nQSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GS941/U8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12-20020a05622a100c00b0041cbf262514si6068075qte.19.2023.10.30.10.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 10:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GS941/U8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxWFH-0000WI-FJ; Mon, 30 Oct 2023 13:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxWFE-0000U9-QF
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 13:40:08 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxWFC-0000BB-4E
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 13:40:08 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-408425c7c10so37822525e9.0
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 10:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698687603; x=1699292403; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=JSidavZgzvowrW64VxdmqiVfrHkIfq+Vecol2GK2W74=;
 b=GS941/U84ca5QNuXttulTNHJVQCU8M32h23t98XjSy4DFMVzB2gteisZA5pXzBFkPC
 fjhHr43WfrzpYnhHkJJL9zc/0q7AUNDiBD56BO1kMqTuGFj6hTmDK5XT9h8wynczVVRG
 MET/hagWB3ZJlA7TsOLmZyLpQQsIa3k4Lcyw9ZYZkgwB3zQ35/Oe4p8sSUhw7AfdZZ3s
 5yYDpcPUxfdlNXrrS+JwjVrg2i32mZT3dkee8e8Eat/BPD9JV2N+Wm/Lb/Pwrcm/kHaU
 AE4NDl3fnSvs++3sHzXJ3ZysPbt/OkQhog2K33Ty9B91GcfDRhMSWrWk0n9EkyM+62ke
 1IsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698687603; x=1699292403;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JSidavZgzvowrW64VxdmqiVfrHkIfq+Vecol2GK2W74=;
 b=Gb7MnB525mv+ifnbNccK/yacQ6v19DqE0aYiFTfPckqhXujzr7aZoSVAqBTJRJUULW
 l4OXrqHG9BC6PvpNgNVgPSOY98Gu+cgR9ZY06GyfNHXI1Y/tYG4CxPsQpV4Y6P6EvrHm
 MKMQjJWtaddote/oGegnVAWq0YWm8wQ4UMa1dkzTCwkI4dM4dyN/be34OidmQbdh+WeR
 HFEeYVJPX/1sINKrqjHp65d6TeH16q2obwQ0jsTeGzk1ohCia+LDc3XDBvVf4EDclO7M
 YPjG6S9TEysfRfDeXiDjN2iDf8aXo5F53dDTUIwyU8IM4ESABdgafJ8JTpkzV78qeol8
 lu2Q==
X-Gm-Message-State: AOJu0YzPua+fDabmZnx6YkPmGbz1tD7kORnH4i291YDBFhyg0XbwQ4/7
 eqLfLgyS3mTrr+64SVGAF0ybwShrrP3qMlgkuNM=
X-Received: by 2002:a05:6000:1562:b0:32d:a01a:9573 with SMTP id
 2-20020a056000156200b0032da01a9573mr9358538wrz.8.1698687603097; 
 Mon, 30 Oct 2023 10:40:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a5d5950000000b0032f7d1e2c7csm5912914wri.95.2023.10.30.10.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 10:40:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: Fix various FEAT_MOPS bugs
Date: Mon, 30 Oct 2023 17:39:57 +0000
Message-Id: <20231030174000.3792225-1-peter.maydell@linaro.org>
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
X-TUID: Nj9Wq9aiDMEI

This patchset fixes some bugs in FEAT_MOPS that were encountered
by somebody trying to use it in qemu user-mode:
 * we forgot to set the SCTLR bit in CPU reset, so all the
   insns UNDEF
 * we weren't reporting the hwcap bit because of a uint32_t
   vs uint64_t mixup
 * we didn't handle the case of SET* with Xs == XZR correctly

This set of patches fix these issues.

thanks
-- PMM

Peter Maydell (3):
  target/arm: Enable FEAT_MOPS insns in user-mode emulation
  linux-user: Report AArch64 hwcap2 fields above bit 31
  target/arm: Make FEAT_MOPS SET* insns handle Xs == XZR correctly

 linux-user/loader.h         |  2 +-
 linux-user/elfload.c        |  8 ++++----
 target/arm/cpu.c            |  2 ++
 target/arm/tcg/helper-a64.c | 15 ++++++++++++---
 4 files changed, 19 insertions(+), 8 deletions(-)

-- 
2.34.1

