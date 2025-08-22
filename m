Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0BCCA0EED
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 13:56:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upSD8-0005kT-ER; Fri, 22 Aug 2025 09:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1b-0005lb-Bw
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 05:25:31 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cjchen@igel.co.jp>) id 1upO1Z-0007Bb-56
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 05:25:30 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-24458272c00so20901175ad.3
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 02:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20230601.gappssmtp.com; s=20230601; t=1755854727; x=1756459527;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2LelFaXu4nBaY9dT35+wlto5FIYzudNjlsl9EfmiZ5M=;
 b=2R5rzeR8InbtkyQo0P+AOoUt6iDP30ONkSIVG/0yTNb+ahyVL0I0n24yUL8floJWOU
 WTmXAuUX7mtKzkIDdmZm9zJ10BxRXHsvJvGyf2Lni0cZGrwKP2sWZciBCGXBPhs3iDr5
 rTtW3UXJ8w/eaAnit5w99PBOG9wHZTgWHwijCwuHJo7+NbLs1YQ/Rz62tfkNJ8IwT812
 XQ79chaVxbocuAHWZa2pY5QOvXI7iHVjCKhi/7/CimleexWo9qRWCXwT8T+Mf7lxyvML
 kDi0ieP6vfq71M7V6Yt9wMb9lTcgXIp3o/6iiA4uheBEKLt5bObQd3J83LvFsF/nsUj8
 pXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755854727; x=1756459527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2LelFaXu4nBaY9dT35+wlto5FIYzudNjlsl9EfmiZ5M=;
 b=HkTHgq573FEPaFF6bcJTbJ48orLH/fmQx20d9kHH/cNihyN6k/HLp+FjIamWgsJtv4
 vyTD6o+Dh0KFG2sM6NMsYWrhbiO/Knh2CnCfHFFkXAEhQH1o+/ZdbYMerf/I/iuviZdb
 m5oEbdqiYAt8UV+4prMbPiJLui9QVbmqvxbOG+NMEhzZ26ujYrA1Fw69ky9ZfLZmjREM
 oK0/tqppV8E3rLwdWG2nENZ66FTlnCuw9b0T7cFMkgPS8lppEZXt4ngDhUGU55/S3ysJ
 oIU9G2+699uVBY1gp8yymxM8OZ50eBqaup2IyezfV2+nt2U3V2xKC5dvHo28cqwAag4/
 +WBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxeswABOycUkaL201uoYrHx+J1bkS+ghawRL6YUJQ0m15gGcZDlhwygMZNYP+a1T8dDtXsgTlWBQ==@nongnu.org
X-Gm-Message-State: AOJu0YxaLl71yzL+qnjjo0LNzdRFUaU4RPrG7WnLSbjV12tqWdEabuz7
 Qm1q+n5vQhFO06L0AssU0FEIqw04ueMgI8lv/Vse0+eB7iJHTVlXAbBCE34Tjb2CVCU=
X-Gm-Gg: ASbGncsn9am8PT3IQIIDLzWrSIH70rYaweo5pYd/ZgYsUPRgQhnma4rvrJ7Pa9oSRb1
 PTKmSHH6z/WRi7YVqb59PT/N/4L3HAgGkEIXTWfftQtoTvvzLCd8Af9e89KAmssQlgpiBlS28Qv
 TCuP5+LlAvM396RupX4vUIguMy2/wat/e/mCIx3/r7RGBLQBXdNnyM701wjqoaHBUHpq29VhfDT
 8bF+Yd2PsO5qxeQKoP0OAFyg8TxjDPqa/KR2nlrhkxijUvP3w0IbTtRmvh4PbSd/2TR2ys5sdHS
 1imcphYbOg1Rp/U+x7UBKrGC9VMIYeWqEVaDzdrM5d5EWv8oDSIf+PmKJdWPte42wSrMgD+RHmz
 XDYiA8/4yinTEZ1rrmhZHW6nAcez92plPW+O7xwW0J7DT675zJhnP
X-Google-Smtp-Source: AGHT+IHwO6/ISB0j/F3Fu/FL8iXEouvPElKuNTjaAa80YP6la6HrQCx45MOnxFn2E7Ame5lgK/uVxw==
X-Received: by 2002:a17:903:94f:b0:246:4417:db76 with SMTP id
 d9443c01a7336-2464417dd58mr21785165ad.5.1755854727321; 
 Fri, 22 Aug 2025 02:25:27 -0700 (PDT)
Received: from warg.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4c6fb7sm78560215ad.89.2025.08.22.02.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 02:25:26 -0700 (PDT)
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
Subject: [RFC PATCH v2 4/9] hw/nvme/ctrl: specify the 'valid' field in
 MemoryRegionOps
Date: Fri, 22 Aug 2025 18:24:05 +0900
Message-Id: <20250822092410.25833-5-cjchen@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250822092410.25833-1-cjchen@igel.co.jp>
References: <20250822092410.25833-1-cjchen@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=cjchen@igel.co.jp; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Tomoyuki Hirose <hrstmyk811m@gmail.com>

'valid' field in MemoryRegionOps struct indicates how the MemoryRegion
can be accessed by the guest. In the previous code, the 'valid' field
was not specified explicitly. As a result, the CMB area could only be
accessed in units of 4 bytes.

This commit specifies the 'valid' field in MemoryRegionOps of CMB and
the CMB area can be accessed in units of 8 bytes.

Signed-off-by: CJ Chen <cjchen@igel.co.jp>
Based-on-a-patch-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
Tested-by: CJ Chen <cjchen@igel.co.jp>
Reported-by: Tomoyuki Hirose <hrstmyk811m@gmail.com>
---
 hw/nvme/ctrl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index fd935507bc..9dca718ca1 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -8272,6 +8272,11 @@ static const MemoryRegionOps nvme_cmb_ops = {
         .min_access_size = 1,
         .max_access_size = 8,
     },
+    .valid = {
+        .unaligned = true,
+        .min_access_size = 1,
+        .max_access_size = 8,
+    },
 };
 
 static bool nvme_check_params(NvmeCtrl *n, Error **errp)
-- 
2.25.1


