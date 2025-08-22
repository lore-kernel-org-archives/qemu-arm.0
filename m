Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916AECA0EED
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 13:55:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upSDA-0005lv-P8; Fri, 22 Aug 2025 09:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1R-0005dj-3q
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 05:25:21 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1M-00078x-9o
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 05:25:20 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2445806df50so16606205ad.1
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 02:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20230601.gappssmtp.com; s=20230601; t=1755854714; x=1756459514;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mlo0VNE2LkX+k6ixV83bmWbI8LIl4VVBBmVNmXeQQcY=;
 b=gHlpWm/esdPlDf6OBTQA7j9IL58URUKNJ0ypl7KeyPyy08LqL136YGcVIR5dnkvhRM
 D31OB5pb2A36D7g9zEb8ePHOJPr7cdsNh17PgXh4SQaLp6GvjkAuKeD1qVoL2XvDPueB
 LmmTrstfjrYf8b+fKHtwP01Ch/obmqPSUI5hebbJ86QYdt0qHVYzHlQsa3u+1z5AiF/k
 nyyE5JhkLvgRS/cOnxTLmoMavA4IARyEM0sbEzJdzHfZqnQwAOXJtF2AvR8QnPmHnpY+
 80ufSJoKrpnPDXps6WynkWrmvAtTbD+qjVzBLInJun54WGVFd8lC2xmW+hhRGTPUaCmq
 fY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755854714; x=1756459514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mlo0VNE2LkX+k6ixV83bmWbI8LIl4VVBBmVNmXeQQcY=;
 b=v8UcVN3YPZSx8+e2YbJ312n6fJ2veLSC53f4lEPgCmWSEyKZNThltLSwlpo5nmvMza
 7VX0ZzdPBPjcGdJWryMdwn0e9J+z+I6NMQWddQsMJ7q+WZQ/lDC76k+TBsnP4tNV5evZ
 W26AI8FEx+MwTx0vDPbvMFzdhkNue5xdOvNRCOEvU7JyDA22JHECDD6FBetx5jz8NCVf
 9krOv/J0sPxm4Sw1jQBNb9C94/uAB4huS2FHp53R2V3BauFq83YY5ugWy/VlWAPD9yqM
 LFC8eg1LmtqKmBYuUg1/9/O9uH4CaEA9JBKmRarX3dmdr1wcyxSrwVekGmqKJa1pf4Fc
 i+sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn0HuMZ8AlFPo225+9cgenIbSouVz0TzlQ0mM1a99mVzPFNvZdbAgSBePEh1to+0YACNE5BqF9+g==@nongnu.org
X-Gm-Message-State: AOJu0YztDLtRIa3wnNoEriPKY3b0CfF2yiXD82do6sq020T4kk9sTOMy
 TZlgqnvSAqRY06ifSvZwltge7adx0TxFzvZDgrHEpcCBP8qMg3SNLr+5OAFXM9xcAdk=
X-Gm-Gg: ASbGncuNL4vY14lFdi2fT4eUdzN5jKWxkzawdf+J7XdODGJ5OgVMorjjSAzDLO88BWY
 AQqxfg4XGsqMe3oZSmMesyjArZWEu2/QYmFeVCdEZTI7he7fPX6dlm+gFQF5g9WDZ5HPIWc2X/T
 S5VL79T9BM6BWID1yxWnDvxCQt8ULozkWxa/ZuHNRY2MHw/rBkKEg2H6GM03UKu8OY7fWXYvdPg
 fzsJg9jDL1vNKCLZMETxIAVrNrodrQTGcuGta5Xg6hdoW7Fbgp7P+rfYzhoC4RFkxFDXKBnOfNk
 b6zACseZQeZcbrfnYDTwNLz2Zq5SGaV1y1pTlYXAEp4oqUCUXbLuWV7fQFHn6wK/puO8btkcQYU
 Wni3IcH4YbRfngzIdM3+D5bajVpAq0XVnnbNOqYJbMOrJ80iMs6UesNPujnVQ464=
X-Google-Smtp-Source: AGHT+IEqxrEnh0zkYioghUeAJylIvzfIK34NEJeRhP+7uR5uCgzNq3nYAwgrwA28HLoaAtq27/RD1g==
X-Received: by 2002:a17:903:2302:b0:240:3b9e:dd4c with SMTP id
 d9443c01a7336-2462ef446b7mr34309165ad.36.1755854714249; 
 Fri, 22 Aug 2025 02:25:14 -0700 (PDT)
Received: from warg.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c6fb7sm78560215ad.89.2025.08.22.02.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 02:25:13 -0700 (PDT)
From: CJ Chen <cjchen@igel.co.jp>
To: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Tomoyuki Hirose <hrstmyk811m@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, CJ Chen <cjchen@igel.co.jp>
Subject: [RFC PATCH v2 2/9] hw/riscv: iommu-trap: remove .impl.unaligned = true
Date: Fri, 22 Aug 2025 18:24:03 +0900
Message-Id: <20250822092410.25833-3-cjchen@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250822092410.25833-1-cjchen@igel.co.jp>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=cjchen@igel.co.jp; helo=mail-pl1-x633.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 22 Aug 2025 09:53:38 -0400
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

Since riscv-iommu does not support unaligned accesses, drop
`.impl.unaligned = true` to avoid the contradictory pairing with
`.valid.unaligned = false`.  This makes QEMU reject unaligned accesses
for this device and prevents the assertion in memory.c that previously
caused `make check` to fail.

Signed-off-by: CJ Chen <cjchen@igel.co.jp>
Tested-by: CJ Chen <cjchen@igel.co.jp>
Acked-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
Reported-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
---
 hw/riscv/riscv-iommu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
index a877e5da84..277746598a 100644
--- a/hw/riscv/riscv-iommu.c
+++ b/hw/riscv/riscv-iommu.c
@@ -2288,7 +2288,6 @@ static const MemoryRegionOps riscv_iommu_trap_ops = {
     .impl = {
         .min_access_size = 4,
         .max_access_size = 8,
-        .unaligned = true,
     },
     .valid = {
         .min_access_size = 4,
-- 
2.25.1


