Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE12310FCAC9
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 20:18:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w820v-0002I3-5S; Wed, 01 Apr 2026 16:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w820u-0002Bo-7D
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 16:18:08 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w820r-0001Yv-PS
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 16:18:07 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4888244e9f9so1010255e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 13:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775074684; x=1775679484; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jYDlzgPnnjYZuG+tzOHNfiGffF7GaOFfYwOhZf2SBPc=;
 b=ye+cowO3ELlTZRwNLkD4ko6fuWAJMYI5gRTdNcbGmI7YjDBeqnl6x5m6s/YGaJ4aF0
 1KKLImXdt+BwQQeotx7sm1iCilXyNDl5c5BD9Bzi2Zhu55FSfeLkX4LDXPrUS4YWiicW
 oRt/E8s6zQhf0PWFUbrmBZswuwkkVlW2BTQFbye1mYKvJ5jyOmNzuA5QFZpUcnCjXomr
 kvVqdPTH3iIbo+Q6av7zI5H84089A15hPlCSox2ki4OL8iyt9INIrod882zgfwuiqRyK
 gqb5z7tB7mdEHpQDFq/82PfzQVyHfBkTz8BEN2gjgnlL1Q9tFuFqxwZK44V4kaDGijgD
 JHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775074684; x=1775679484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jYDlzgPnnjYZuG+tzOHNfiGffF7GaOFfYwOhZf2SBPc=;
 b=jT8h/6M1GQ5SGPfTQENK9AlFa9Z3+FpD0Jf11eGUD38ZSs9cvYyYIRUYsslhVjwofx
 IF0MRagWXrHy1lXh1OJxHObMRISjQ0EtVbUKHmmv5o0KYmA7NXhH6WlxDxuNrxDRClbw
 3Qahz+Z8uvTtUhJ5Ryhy229hJLz2/h3n5Ry0mPMauFp3vrcE2cdPMscFb/yn6LLkpXKZ
 bW0s/P6ilNXR41mkKImsBc3TVu9QXHE6GnqpamfJuml7c1tGRSNz/m4azZjc/dcC1TtR
 BEmoDgZPpoJwWkNRwlg5PN2/rhkusEBjHCKVhwHdM1DQIyygGRsPJcxQtwOxvn/yyfgL
 Ld3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDrKNSDxbIwNnqhldgpCIho/TwOgk7VrdbFAiIVJ8vtxL58JEakL60nm6YI/7NokyYuJ5BgK0ISw==@nongnu.org
X-Gm-Message-State: AOJu0YwWTGCCcTg/RoEoo84xOwNigHPWzr8a0cFeXonlTt08wn6EpI1z
 9a2fCSF4EBgsf6AoU1WQhVu78n7xhsHvYM68t4rEZbLIJ6VW225bh3XqQqd9ojUNjp8=
X-Gm-Gg: ATEYQzx7D8Ne7nQDJ6ha5Qkc+pbuqgt8g+cvhl6oIMGG/UVAn+XVMp3jvTyeAfZkSPy
 GQ1Dbsz10vyzZxS/uK4lCkmv0NevdcMTBUidrl4/DayJ05dtMkDJpTJdIfrdi+QYdGjpf0WNSfu
 /W03iXcxpZnM4Jfkg2KqV7EAhsR86W45iJoMRWVbY8jJVXi+nJfrvT8jhOYVRtuS4gfFqQurz1Q
 uhRNBNSKVHT4zExo4z/Eswd8XR9xFccV8sfdznEfZ7JCo+rBqKOlx7qO93PHX9Olqju4pZBd01Z
 w8d4adlWS/bCjvAHgLeyjeR+uZUOLm4P3bjeqAq/2Mkvo5oQMFsHT6EPPGEKZM+YgcR88pu5cVv
 sl946xi+zck5q+qPF83jEWRv1vfgh8LC1YRgghb2j8bQjG4kpiZXM2GnhVRUn7ioMZYnHNu7056
 M6N96Hh3i0hoPLBIloEvh2Jn8cqCdN06UgW3ZRz/wqLi7KnNnKjifQKcUlIK+ZM10z4xQShN007
 bNCpIQS5mc=
X-Received: by 2002:a05:600c:41c1:b0:488:8b52:f7de with SMTP id
 5b1f17b1804b1-4888b52f8d1mr6554095e9.12.1775074684000; 
 Wed, 01 Apr 2026 13:18:04 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e952b0bsm126418075e9.12.2026.04.01.13.18.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Apr 2026 13:18:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-riscv@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Pedro Barbuda <pbarbuda@microsoft.com>,
 Anton Johansson <anjo@rev.ng>, Song Gao <gaosong@loongson.cn>,
 Weiwei Li <liwei1518@gmail.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Chao Liu <chao.liu.zevorn@gmail.com>, Bibo Mao <maobibo@loongson.cn>,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-11.1 1/8] accel/kvm: Include missing 'exec/vaddr.h' header
Date: Wed,  1 Apr 2026 22:17:45 +0200
Message-ID: <20260401201753.92290-2-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401201753.92290-1-philmd@linaro.org>
References: <20260401201753.92290-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

Commit b67be03e3ac ("accel/kvm: Widen pc/saved_insn for
kvm_sw_breakpoint") used the vaddr type in the kvm_sw_breakpoint
structure but forgot to include the header defining it. Do it
now in order to avoid when refactoring unrelated headers:

  include/system/kvm.h:404:5: error: unknown type name 'vaddr'
    404 |     vaddr pc;
        |     ^~~~~
  include/system/kvm.h:405:5: error: unknown type name 'vaddr'
    405 |     vaddr saved_insn;
        |     ^~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/kvm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/system/kvm.h b/include/system/kvm.h
index 5fa33eddda3..12f7fc8fb58 100644
--- a/include/system/kvm.h
+++ b/include/system/kvm.h
@@ -17,6 +17,7 @@
 #define QEMU_KVM_H
 
 #include "exec/memattrs.h"
+#include "exec/vaddr.h"
 #include "qemu/accel.h"
 #include "qom/object.h"
 
-- 
2.53.0


