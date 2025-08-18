Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B080CA0EE4
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 04:25:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1unrQj-0008AA-Dg; Mon, 18 Aug 2025 00:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1unrGU-0005tV-J4
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 00:14:37 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1unrGS-0002EF-Ec
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 00:14:33 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-323267b98a4so3015867a91.1
 for <qemu-arm@nongnu.org>; Sun, 17 Aug 2025 21:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755490471; x=1756095271; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JIkeU3rXeazXD0joqAFpWiHN3iI9fKZ4K7whY5dqlfg=;
 b=rz4l0JzXbI2acaneu2ggPhjUHbo4xD0/pVc5YWFchotG+7W7rq58ucPVUJZSud4iId
 Uz0TLYotvEivjgw8gCEjKtNlJA0FN0jd+xmHfU/iGjF/+3eBygKPPb4gEPK0WpgRNO1O
 Oq292icKMPHzd1cc6n1KV8wRNMVkD0WtF083rwu9THnw7RD644aXzpPzu4NyX4nte8jc
 O6veB//44EAT/NQTr33x7tTT4qTho//PVcwn2+ZkORPzPM/NvLYiCIZ4v6k3HtymhuDA
 p5HNMRCgKNR9pN3AUJX7rI8Rsrcd1S5rouMZFqVP4Slen3oa1l4ECmVRelk+jn90laMJ
 KIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755490471; x=1756095271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JIkeU3rXeazXD0joqAFpWiHN3iI9fKZ4K7whY5dqlfg=;
 b=KPXJNDrp2Wp1Q6NSO3k4/k6oXEXf11T+OxsVM/zRT/ZGEdWeoYFRMYpT/K+Dgz0Cjx
 1x4gMd+U/SbniEoGD6VLa2sPMK+kNkWEv5dxu55jIPjNwjIhRjLQc79a6q+WQBl892Q8
 7/Npb2FDw7zZyRjLdO4C+lroOHRxGHwohd2EWf4oo8V1K/HS4YZlTvd3L5tSP93B7iKq
 yPOwX10IbRIwtZgJenhZz+Kts0pVtgAm+PY26+vWA9uNsom0+gQJyXapqIrrXNwyJvGd
 rmDd0INksXIZt0R1nmVwloS9dYpIypNOCnuidTRSvJgUHfk+cZR1/Q9cgDJ9u7XKgKE0
 dkag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIzH3T6N//95KMedB9+3UAxK/ysEqAzhvIUqmxBB3ohQd3D27PiK+A/Og/Q+Rudn0tUHFf9XJCVA==@nongnu.org
X-Gm-Message-State: AOJu0Yxf3f4+J+oSydreWg3ocvguCnwxFW0nzokEuU09zcdlCXNQHdj9
 zWOKEltfpD2cxRaOznt8cdHfNwjRj4Nj2qWzsaxvWsObAT9bqWjKik+0/UQlkKt0utk=
X-Gm-Gg: ASbGnctzbTWETqx6nDnvcnFEj1Ti10c0nTqA9//3zN/r1AHw+jm//7Cmd0liS/OxsYt
 7UI7x4J4AkYV2ApZ+2X12bnelF9NGv9A3fZVZ5hEke0zEPM1t5SwlvNz5/FsUo8gGgVCRCTQjpL
 YNrqP533Xtxpqz9X0HP+A52u9zk9Urn8p3p3+iYZhsfOwq65JeZiQyeL7RuBRshWxvOYNnNI63j
 fN6aROv4Vf8cKghxV10Pn4t//fbWi96nbA19jyJRTTHGhKQwhICtTGMO3qfL8ZnlcKFi4ZTK0qo
 oFw+cahWc7dMexYvwqWPVECexF5XcRmkGUJmAbYWr0Aa1rs4KlOyx/4W0uUwySoycjAzixyjMiW
 AoBD3ffonaSoGc92ohyq8ydhGzbL/ngfDggnVhiBLr2edTAJwhcOazvaSYQ==
X-Google-Smtp-Source: AGHT+IG7SBAsjQzbExG2k+dQNmBqRLaEeCDm1wbUTOud53d2Z6VubTzkwoRqxIBLHWLbY+a2fj0LXQ==
X-Received: by 2002:a17:90b:1fc5:b0:31f:32f:3a87 with SMTP id
 98e67ed59e1d1-3234dc4f06bmr10018049a91.26.1755490470773; 
 Sun, 17 Aug 2025 21:14:30 -0700 (PDT)
Received: from localhost.localdomain ([206.83.122.207])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3232f8c8e4bsm5498344a91.2.2025.08.17.21.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 21:14:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk, agraf@csgraf.de, qemu-arm@nongnu.org, philmd@linaro.org
Subject: [PATCH 7/7] target/arm/hvf: Sort the cpreg_indexes array
Date: Mon, 18 Aug 2025 14:13:54 +1000
Message-ID: <20250818041354.2393041-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818041354.2393041-1-richard.henderson@linaro.org>
References: <20250818041354.2393041-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 647eb675ef..88ed96be11 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -925,6 +925,9 @@ int hvf_arch_init_vcpu(CPUState *cpu)
     arm_cpu->cpreg_array_len = sregs_cnt;
     arm_cpu->cpreg_vmstate_array_len = sregs_cnt;
 
+    /* cpreg tuples must be in strictly ascending order */
+    qsort(arm_cpu->cpreg_indexes, sregs_cnt, sizeof(uint64_t), compare_u64);
+
     assert(write_cpustate_to_list(arm_cpu, false));
 
     /* Set CP_NO_RAW system registers on init */
-- 
2.43.0


