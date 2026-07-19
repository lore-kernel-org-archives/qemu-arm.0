Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9F3C4451B
	for <qemu-arm@archiver.kernel.org>; Sun, 19 Jul 2026 17:49:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlVdc-0000eI-WC; Sun, 19 Jul 2026 13:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wlVdZ-0000dC-Hy
 for qemu-arm@nongnu.org; Sun, 19 Jul 2026 13:49:13 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wlVdX-0003BP-Ky
 for qemu-arm@nongnu.org; Sun, 19 Jul 2026 13:49:13 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-ca12086c06eso7783860a12.0
 for <qemu-arm@nongnu.org>; Sun, 19 Jul 2026 10:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784483349; x=1785088149; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=jvhwrz3QUtBdJbahnB86ovvH4HEqE5WZvjP++ZS8f1c=;
 b=ELRL1CScQA5YOnLJAVs8AkByw6L7c/6ySWSzhbr2OJDQ7KXOWytZWxKPbU35FjSlVD
 k6LnKmfThErcZJqEjIudukP8vZxKbJ5qh/dmGzx7qSHRev4v3q0CGgbpTP1xrHrH9nW3
 HczD2mJ6ar7omMdYGk6/GTckuRvbz70zuYNrrDFNaRhVkVMdVCp8Im+2TfwImw5GawlS
 qC9OwzRF7H/m6g/gXs/XPY/tzmFJRfkbiHoCHM6dyNQMkMssmFy2NQlMhGi1drFPiRb+
 mxZo7cPxt6sEdv70gKwhH5f6zho8lZBxx9f3FUL7xiDprkpepr6e+bPHLcc8NirR4ytc
 4PJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784483349; x=1785088149;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jvhwrz3QUtBdJbahnB86ovvH4HEqE5WZvjP++ZS8f1c=;
 b=l2SsczIq29KUI3ZCp7U7hMatMXQO8mRIPPQe6XPpgma43NgJog40FWLCBzgzA0KKJl
 SVjUemGpklasTVRWONgLG36LUj/sMvB9XHq0JESzDAibUnExsrTInNDxICC8DKR+OS2x
 4VWXl4sdLquKVAVkXd+9Hb/MW16spblC/y/OJy6/HaTlfbb4c/XUr1bDQewSxAzN3ZHI
 /GrpjrT4JV2gbgyO6dBkKfn6gc0UPxD+Nt1tTfft1Mat8pXbBIILNdr5z5pwMU94kTi4
 GZXmmK/eiGWwfcnV5AAdCAbmFpv+h+efmn7ONXR9ftoP16gPjpolvUAxcMAIBcBtwTf4
 yTHA==
X-Gm-Message-State: AOJu0YxJ0eIkagu6v9sxUFc8vZt9EGJ8PsabhZkuOs0y1uMBDPbsjycN
 lt9B0ZNMDYmD4zWtdAVYPf0UPZ3xzXRISKqCrWc1ksyEuXQgTcSyba8EtOLKrzj+NoANB5//Sek
 RI3nq
X-Gm-Gg: AfdE7cnjgiRXmT1AaLzU9Y9Jvk5uu+lEBjD17c5tzJPke7/Qz1iNWG0labZko8347kv
 M8v3shlNIKIS6sNW/IxW+xGiLNTrvMOKsJejbxJwUm/Eg9b5Ox2i9/kp8CVhwdCG7H6/sPK7CB3
 OwJo6AECRuNoAzXzSxfFbNiqKuLC1QMIvblqomcx3+Y6Vp5cJUQIyCf69kNR9PPmKRlsBlD/AvF
 C7rwgqlsJUg9shTe8gGQtelrsCVglEdI/GDXQOrsFcOqhEmWmRxXfjJ0QhIIm7iznXKf3N08V4+
 /O26qF4y4Mv9V3HQxprbAVjWKjCJvr5iOp6AaEbx0bdvHHQmugKfgzJWC0PCAQqPC+Xsf+2YpnG
 kcocPAyK8y/dNOBzJaNYDwXoulem7Tc1eHcRG9hhiYtiEHkrgvBisdxpJr3ie4O5k5AbJ5x3PhH
 hMsoLYrV2Ort14fa0kVw==
X-Received: by 2002:a05:6a21:7d06:b0:3c0:e552:f2d with SMTP id
 adf61e73a8af0-3c3ad859f3cmr12101775637.34.1784483349353; 
 Sun, 19 Jul 2026 10:49:09 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3142a20c158sm30471881eec.29.2026.07.19.10.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2026 10:49:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-11.2 0/6] target/arm: Implement FEAT_SME2p2
Date: Sun, 19 Jul 2026 10:48:59 -0700
Message-ID: <20260719174905.420725-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Based-on: 20260713230244.70174-1-richard.henderson@linaro.org
("[PATCH for-11.2 00/10] target/arm: Implement FEAT_SME_TMOP")

One final pair of insns, FMUL (multiple and single vectors) and
FMUL (multiple vectors), which are not covered by a sub-feature.

Finishing SME2p2 allows us to finally enable SVE2p2 in -cpu max.


r~


Richard Henderson (6):
  target/arm: Split zdn in do_z2z_n1 and do_z2z_n1_fpst
  target/arm: Split zdn in do_z2z_nn and do_z2z_nn_fpst
  target/arm: Fix b16b16 feature test for SME2 BFCLAMP, BFMAX, BFMIN
  target/arm: Split decode of BFloat SME FMAX/FMIN
  target/arm: Implement FMUL (multiple/multiple and single vectors)
  target/arm: Enable FEAT_SVE2p2 and FEAT_SME2p2 for -cpu max

 target/arm/cpu-features.h      |   5 +
 linux-user/aarch64/elfload.c   |   2 +
 target/arm/tcg/cpu64.c         |   5 +-
 target/arm/tcg/translate-sme.c | 180 ++++++++++++++++++---------------
 docs/system/arm/emulation.rst  |   2 +
 target/arm/tcg/sme.decode      | 118 ++++++++++++++++-----
 6 files changed, 201 insertions(+), 111 deletions(-)

-- 
2.43.0


