Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1268CFF8870
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 09:34:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHepB-0003Oe-3u; Tue, 28 Apr 2026 05:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHep8-0003MD-Nn
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 05:33:46 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHep6-0007QM-V4
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 05:33:46 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso118176165e9.2
 for <qemu-arm@nongnu.org>; Tue, 28 Apr 2026 02:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777368823; x=1777973623; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2cvYLVcnk1qS3FA5lQP8W94koZO4vK3ygKeMeP+mRXU=;
 b=aeDDAU6SBs+NtD1I1J1pLZa0oKuSE4dJ/CGwLIpUWSNQhsPiGZb7l4hKGvvrCAgFr1
 HFGk0elPnj0+MTJ+8VJ7sTjlyBK1XI5btiNOjPQjNS//PKAR7kB42gTKNjmtxKzvY8iK
 DlbTqFr04jsDO4YJW6RI9KT8QNq/QMM+OPQ5FFXSxR8lf11b7n766ltbV0UdlN2LKtwN
 RZJZ+Iso8BSwER/Dsn/eqeunOPgNOWcrnrxKw9tV7EkPrVJ0Lt/x9cyQ6L33c8HH/BtS
 sdXw7w29JaYzrBNjmHxl3l0QUabpqEr6rJhLLR3wjQnAhNg+MipCEX0omptU6kad0e73
 9Omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777368823; x=1777973623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2cvYLVcnk1qS3FA5lQP8W94koZO4vK3ygKeMeP+mRXU=;
 b=U2DChWDnZ5Yk3ES4CfbiL4RIvGGHC+FJgXicWWx7nsr59Bmrv+NGbBwNd8I/B98c96
 IeJqjJuqmcpFhh0fC5DZTMwnYzxrP+u43F/NYg1GvMbgywbbD4PucYkj/rZqPPxCkZWu
 1RjJW0vaoZS57a4UgNYCewzkNpuJBHdUSRx/I0Srl76+zNVstKDVWYyRbs0cJrHm6IbI
 pZ3M/RhNxYg9cTMWHJ2mzdJkVqdE82/fNQ9NqlVPoaKY+p/O1LQ61CYpWY1GeqKtAWey
 HgNLjuS0nzDtj+1Zs1dkcq17NEoFyA2b2JBlTbAXiA/NQ8dpAN+IuAqWIXAKM4k2aKWr
 /qRw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+pT9NepQ1qv30tuKAfuPX4pAc7fifwxj4IIJ++5Fu4rlQAZZvrk/B92L0Eei4hZfQU2wYOsYVa6g==@nongnu.org
X-Gm-Message-State: AOJu0YwtMfSZYUs3aDShiLIETh5pCHffmC3I4fUjI2D6iq7Pnf2+ceai
 pWaFW9YBiv2Y9a+5eeFNcLeD/XOhMpc3Z/sKNYjCwwFcCDRekaWlonNg5HjSgbeuPr4=
X-Gm-Gg: AeBDiesbyo2b9eX6xbYH+Qcstj3yM/nf8rDmubkQShUsVA3eEMrBklTzSlBh2Bod1tL
 eFrYRWDIQJM6b453owMrNZdEZjdpFWeI7Ek7RXYmLxDzoYc1qj7a4OmPvoxRDfg3K6GNOBKrOjf
 7hZwPQPy/fFq5m94a1jEYmdFx81WgAucHbuaWZDdKI8/uon5+7fj8aJVNcPh1otmo/L/Mm+KC7d
 05VbPYzjexnq0xXzZKjFUVdt/L457PbyILNMU+4UzIfrYgZo9FJPDXyZJPOnODYDSM3K3PMdXMh
 M2Yvq0p0YnHcwGMQRT50nZJlVtVmPurmVHP3mMrxV6lp6dw0k9VJvPLu5JFPT/SS1IdCQFN/In7
 Kq8OsXob0Atiilg5Sahd3vZmALKV94gIHLKzH0hqx1bHzKgvb5FYOyAffhHdiiajDXMLgjMdPoN
 vVHfcDrjUfDCfTwfZdlUAvsAgIkuTzDDe+moRSmru3jy9t4ZkHcPY4TsQsVezZtZLin5zyqPGNW
 kP9rerR+b1s3qghG6sp7q2VY5q6Tf0T1rge+OPv6g==
X-Received: by 2002:a05:600c:3386:b0:488:a977:8de with SMTP id
 5b1f17b1804b1-48a77e64f29mr18307465e9.16.1777368823314; 
 Tue, 28 Apr 2026 02:33:43 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774d7a1fsm19665595e9.4.2026.04.28.02.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 02:33:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 1/4] hw/riscv: iommu-trap: remove .impl.unaligned = true
Date: Tue, 28 Apr 2026 10:33:36 +0100
Message-ID: <20260428093339.2087081-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428093339.2087081-1-peter.maydell@linaro.org>
References: <20260428093339.2087081-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

From: CJ Chen <cjchen@igel.co.jp>

The riscv_iommu_trap_ops MemoryRegionOps specifies that
unaligned accesses are not valid for this device but that
it does implement them. This doesn't make much sense, and
we want to add an assertion that registered MRs don't specify
this invalid combination of settings.

Drop .impl.unaligned = true, with no behaviour change.

Signed-off-by: CJ Chen <cjchen@igel.co.jp>
Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
Reported-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
[PMM: reworded commit message]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/riscv/riscv-iommu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index c3c9ed6469..f0de264a10 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -2433,7 +2433,6 @@ static const MemoryRegionOps riscv_iommu_trap_ops = {
     .impl = {
         .min_access_size = 4,
         .max_access_size = 8,
-        .unaligned = true,
     },
     .valid = {
         .min_access_size = 4,
-- 
2.43.0


