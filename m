Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp3717053ejm;
        Tue, 25 Apr 2023 12:34:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350YND672/BA8BlfjWG+tPsgLevFFsI9tFCBYv/ZDy8mf9vbKH85lgjQfTIpT98Dm+cn4+7+j
X-Received: by 2002:a05:6214:508b:b0:5ba:8af3:5d58 with SMTP id kk11-20020a056214508b00b005ba8af35d58mr29293595qvb.36.1682451285434;
        Tue, 25 Apr 2023 12:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682451285; cv=none;
        d=google.com; s=arc-20160816;
        b=ihJXvhLP15eIENmG3gL86ETR0YOgU7J/N40nqiS9koRU3wrweFTumuFUc4w2XvQNfd
         awHL0qyvJm9STz3P/kou5r76yXV6sMOgiPSjkjSTVuDRO/MsTvAiWjphKPxAB4PSH9gY
         1jjFwNZHi94EuDchaeVAXhBDErWljJKNHoKQkXI93d0JBVZ33lvhzeB5+zFM+9PRRo0q
         DtoBlux8S1Z5fXomA4gCwY3DQYnP+VMQ8vMfnv5qnpE61KfLc36NUb+0gmfXROjbu4Af
         k3TFvABQ49NGDqgpxpbUoWqZPoMtQ+PnM6R2W3a7NnZhuFIEmXxALmAt1lV+sQeT3TO+
         j1Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=a9PQZw7N1cpbJGxx9QlJTxfD8yUIeHJGfpj65uurq3A=;
        b=doWqwI8B8YKOEYHYNoM/U9yccA+1Owv+5nakdb6nqi33ZAbFC7ueJ2c2856NqpC8kx
         n9DlTl2qQMhy6SS9aAONmCe5jp+mK2GNJELNY/9hxdgVA+DbQvSRlhtF0hQoNpS15HfM
         T+1eXLsiR9rL8m3RKTlGuBPyb9acu+IOluEhBpacYRPeyLOmMcJSwouzr053lfuhDY1W
         4U9dhBzIis5oZa+fxRVdojI9hNXJdFi3Vx2UEqzx2ikpYR42Xm3iiUsW+d03IcjoNF7O
         OMjOE+XNod69iE6g18Q+wN+N4NaAOunTkdrmd5vFeGisc2oNFnhXrRGkqBtIAoaRBJH6
         rxGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rdHB5RvZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if2-20020a0562141c4200b005ef80b6ec3esi9456857qvb.568.2023.04.25.12.34.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Apr 2023 12:34:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rdHB5RvZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prOPu-0001jo-RC; Tue, 25 Apr 2023 15:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOPm-0001JJ-Pg
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:33:27 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prOPj-0004UA-8K
 for qemu-arm@nongnu.org; Tue, 25 Apr 2023 15:33:25 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4ec816d64afso26795287e87.1
 for <qemu-arm@nongnu.org>; Tue, 25 Apr 2023 12:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682451201; x=1685043201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a9PQZw7N1cpbJGxx9QlJTxfD8yUIeHJGfpj65uurq3A=;
 b=rdHB5RvZZMJvU4Hj2LXflPxFbf2BpqAdtXsnS6o0Yj+sy0tERwuJ8mDqky+Bh9ytEI
 g/lAiEykFS8K5piZ5simeCD2l9ktOcLnm3CIxjQDKTuknjk50c24VpEiTI5MX9XcHMFr
 ElGWLTKXte510RQ7Pr+GZvQDIt502TyOXA4NDMnVTLWkiPRCWGjde7px3TVBwW7BoN/1
 zqNq66gyZhMUiPTmOO6+kMaSaRVrVBqwMaCwPN9EhZkimuqXa65aHZn3qts1OZbU/t1Q
 SzJztr3qdYIdDfwsKGd2Hm8Sc8B7L9uESGv59yZaxvmkeLuceTT96zmpiLhQuVznSQZe
 Orsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682451201; x=1685043201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a9PQZw7N1cpbJGxx9QlJTxfD8yUIeHJGfpj65uurq3A=;
 b=f/WPbvJvDzxa5rvYG16A/uweXaztBKrJ2iuZ5UgYT1k6SURNK++W3rIL6apRFMw00O
 PMod0hemustYFXr88VRKS+b/WRmSVzOL5yn/bJfkkR9gS82tuaT8qvF92SZ8q8hR3+vp
 aWjlBPQa1KizGGVoqvbnQkXb1EOp5jTFyLP3//tLV25if9q/Z8OqxQtQlaMnx9mxv4C5
 vN7YuI45WpdHusaszRMEKY6vvo0PiwUNeNeN8LodidOy/vQP1Mnnojq56QCu5YTDUlOD
 IW8seUedeo+CUzc92HjZWbbCxzhRQax33a1GMbrKaQxFC7azMBKFz3BuACAYuv7jSMz5
 N5pw==
X-Gm-Message-State: AAQBX9cvH7nT5IteHMijFxREhecZ6X9GUj+OnEuhgSJJqZhKoJBxyp80
 c/IBWL37UHvjLxEFfsOstnZbZBwpEfa6Vu/F9f02cw==
X-Received: by 2002:a2e:800c:0:b0:2a8:e84e:4e5a with SMTP id
 j12-20020a2e800c000000b002a8e84e4e5amr4208459ljg.21.1682451201534; 
 Tue, 25 Apr 2023 12:33:21 -0700 (PDT)
Received: from stoup.. ([91.209.212.61]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm2160484ljj.67.2023.04.25.12.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:33:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 philmd@linaro.org
Subject: [PATCH v3 08/57] target/loongarch: Do not include tcg-ldst.h
Date: Tue, 25 Apr 2023 20:30:57 +0100
Message-Id: <20230425193146.2106111-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425193146.2106111-1-richard.henderson@linaro.org>
References: <20230425193146.2106111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x134.google.com
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
X-TUID: NqcBaxKIEDZQ

This header is supposed to be private to tcg and in fact
does not need to be included here at all.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/csr_helper.c   | 1 -
 target/loongarch/iocsr_helper.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/target/loongarch/csr_helper.c b/target/loongarch/csr_helper.c
index 7e02787895..6526367946 100644
--- a/target/loongarch/csr_helper.c
+++ b/target/loongarch/csr_helper.c
@@ -15,7 +15,6 @@
 #include "exec/cpu_ldst.h"
 #include "hw/irq.h"
 #include "cpu-csr.h"
-#include "tcg/tcg-ldst.h"
 
 target_ulong helper_csrrd_pgd(CPULoongArchState *env)
 {
diff --git a/target/loongarch/iocsr_helper.c b/target/loongarch/iocsr_helper.c
index 505853e17b..dda9845d6c 100644
--- a/target/loongarch/iocsr_helper.c
+++ b/target/loongarch/iocsr_helper.c
@@ -12,7 +12,6 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
-#include "tcg/tcg-ldst.h"
 
 #define GET_MEMTXATTRS(cas) \
         ((MemTxAttrs){.requester_id = env_cpu(cas)->cpu_index})
-- 
2.34.1

