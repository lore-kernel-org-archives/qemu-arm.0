Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372D3F9EDCB
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 13:07:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFXIz-00010K-5Y; Wed, 22 Apr 2026 09:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXIw-0000zy-G8
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:07:47 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFXIv-00036H-3b
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 09:07:46 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6715594a4c2so6336989a12.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 06:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776863262; x=1777468062; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LHt/fkh4CQTgDK0U2IQzNp32v6ZUUxM/zBvWXPy5kqQ=;
 b=uzNfDmohUxlNn8EkYyASA6JCVIlLoyuZ9U5RoSw0lC/RrUha/nkigbY22fUbzl8MEU
 nwwbTqmakaKZrPOKRY0VyuQ48BtS89B2DhKQbNDbaQ9bvVeJ76BUihSP5DIIJP/XX7rZ
 SFvWx0bGTPZxMrxZ+XgWjEuKrDiyjUDs0YrL9M9tggO1OW9YKKhLkq6SdtIS2CBJ6pVI
 X4UqAYICYhydTtC2EuD+p5sccVrrYKpwIHlp76GFiHxhfDAWs4srd1aDdvTruTDvZjEN
 YaOzf07mqqsp6ILol99Uosp5N9efRHpZx40AG9++62Bktc7jM+dN1gfZPp4rhbMgBhma
 b0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776863262; x=1777468062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LHt/fkh4CQTgDK0U2IQzNp32v6ZUUxM/zBvWXPy5kqQ=;
 b=Y5zgXhzZtzNjDCiZoYvqwQtXJZRQ9Y0/YDPSi2ROLKVztCt7cXfLHHFCfHmtz52iJP
 pqFBGXoHbN8Z421kzpY9zB4JVbo+o38QVE0tHfeFQ4+MGq1LHs7sS1VWa/pgsYkFAN/l
 alaJWPhu577YbbvMgBkguWrxoRC8rBB8du3nEDipt4MGpzO8ZoZrqdwIZLLk/BsLP0WD
 SaunIgsY9WLM9MkWpUqpYLLLBezTy9epkaaxvTrU5EviKSvwBZ1GIrofulxcLbuRRQxj
 hUd9B8YLc0Qq16o6ODXD9QHZCoQqHjGOFcKFnyzRLAfUBFhyieFNJAwhs2AA6JjPry0F
 D3EQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+zUnYw3vkL/cASkoQe5ihkzTUuISWbu74D7HP2+Q4ELaxnCFg8Z2zJO5BoXnzTKTXZ9hP624VAHg==@nongnu.org
X-Gm-Message-State: AOJu0YyeYPIwAc08DmwcQP+51aIIATt3SNBPCT91YwehGbR+dWnJID+p
 LxMHWIBiwOfm3rqhaDEihXN0Qd1dHOZqq2VxQMCS4bWtddaDAnWKHTNeZQIQYzaPOKtoLrpKXs1
 uJMiG18w=
X-Gm-Gg: AeBDiesyItLncLmTdtab4NaCFJdbt3+fp2cExMQ+ajygCQK/1EI99hSkkvOgzfEdH7g
 jtv7A75uzOxqO10EU6TlDxfJ6qaaokBsj5CaaHF2SmOzkNlG1KdWU9zm8MHEFiOasPUPSIciQn8
 cKYSqdJjMRcgojAUfpk3kgvChVSayVwy37Dc2RSyDpbFj21gz9U1IeCt0tjcreARuPDgjjFfE5t
 mOXrMiIgkdjYUQCDGV0YYI2L0DxpRan6shP/ZB5sPNiSybzIl+b/wYx8rGEdsyMveQAgaeku0jT
 UNo0v4TOPMiApADNEkFVPFn3QLyjRr17gbb25Fcc9ymfWcSC5UDtdeaFrIQJEviTFt9JtZGHwDc
 uaj8aqli2nQUTQmxrcLs0NT5Bo39JY/bo6X1zU1zzeXg3hgh2AcPZ1eMp+2S3ZTrogN0ScPz+/X
 4JNcILP6zFsBn8CwsBa2qic2gK1JGQfYVyjA==
X-Received: by 2002:a17:907:3d4c:b0:bab:1e1d:40b9 with SMTP id
 a640c23a62f3a-bab1e1d40fdmr140947566b.44.1776862950837; 
 Wed, 22 Apr 2026 06:02:30 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4d6casm41420944f8f.32.2026.04.22.06.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 06:02:27 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 15D7E61667;
 Wed, 22 Apr 2026 13:52:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 26/32] target/arm: ensure aarch64 DISAS_WFE will exit
Date: Wed, 22 Apr 2026 13:52:43 +0100
Message-ID: <20260422125250.1303100-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
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

This mirrors the logic for DISAS_WFE in 32 bit world.

Fixes: 252ec405768 (target-arm: implement WFE/YIELD as a yield for AArch64)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/translate-a64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 073454b9195..d79c8ab431b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10917,6 +10917,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_WFE:
             gen_a64_update_pc(dc, 4);
             gen_helper_wfe(tcg_env);
+            tcg_gen_exit_tb(NULL, 0);
             break;
         case DISAS_YIELD:
             gen_a64_update_pc(dc, 4);
-- 
2.47.3


