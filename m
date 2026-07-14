Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9A3C44501
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Jul 2026 09:18:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjZHL-0005be-A6; Tue, 14 Jul 2026 05:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjZHI-0005Qm-7s
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 05:18:12 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wjZHG-0006mG-P0
 for qemu-arm@nongnu.org; Tue, 14 Jul 2026 05:18:12 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-493b27c7451so8540045e9.0
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2026 02:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784020689; x=1784625489; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2hgfs2y/j+tMQqWxnh31WAyHqY34QBYRvtZUwFbc0xg=;
 b=q7pdJ8bLEsf+rzXFfjudbn5yWDZEdeLFHkXwC1xvW1raapdH+WFzx6dF755wLvM8nX
 0JMxCwfPZifav40tYDbS9vaT02UTzGuoJe2Ng+lXPwuQxxeAk8b+694R5k75RoZI8bFT
 dkXAKp6BA04ToPdZ5aOoB3AJdkOXtlktk3hOaozOxPRwAKu3vizM49ED7Uljl3EDPAB8
 cxgUCxt8LwchM55zkD+YxE8dB0UzgYGpLJxmrDErWibAaRhAFuCAZOamcbb/INv0KBhH
 lZTyxq+WwYk98LvQUDiOb0j4GpPZUe/tWjs0RVfElypaP3PpD6GiZuF349vxSi84xPoi
 FhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784020689; x=1784625489;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=2hgfs2y/j+tMQqWxnh31WAyHqY34QBYRvtZUwFbc0xg=;
 b=ZT3FPj+lDWsP1/q+F9HQzzqzDqsyZCs9yIA+QDkKA7XRUup4BB71AQBF/hPk8m+SOq
 ZRizcR6/OWVQeCxPJc9r5xusgJU3y72ejgJyWaif6JvgM8LHzHzFzEhVYx2yE3W/NoYW
 DB+LXM97vyv4IrYlOyND81DF6raRloHMZNJ+9qRDRsp6p1kZ1WMjgU2jL6RkQpbcRQw4
 RYplhraKQpHe2OYsdObuHYgdOL3D0y7qYNtFkwh9axIAtjhkMudLqjH0z8CKzXYeZ0tn
 XQLLxLmR15V/tbNDkFnxwb5abZ8j8nmWAPojSvN3VKx/+Qbj/+IW4rVZJca0/cSAOvLR
 IwbQ==
X-Gm-Message-State: AOJu0YyF1uY4blIEoojMP4nNZqHA52e7t69tduLbn+lpiCa0hNZ2757B
 8OYsj14wBzx18PQe8gg2+FnuCBN/72z2U+rsXJ/+pAWQd6uqvAbi7KNBzzJYOQmsy7wLMo7AR+I
 fGm3om77aBA==
X-Gm-Gg: AfdE7cmFu9Me33y55bGcoNWsyAlD02/UQEqsffGCPjtHXbjSd4CuOWGw8Byl6dhCTBI
 KtLvl2w7fhO8TFt36VD1S+AUU6hTySG3ZZRwSOTjViFICzsj1Yp1vrZKnn2UG+Ga1vmrriM4Vkm
 xbRipkhzF5pNl5aCuhkRxSOrOVf630RTXi0+tj3uoWCwS0IcO4uNdl7swXCQe/il1hf9L6m/zvH
 YiDypJz4BlDwJHwCQCRRbHxS12xMOdn4oUmg1n2msgST5/+/wddc8orPvld0JNgq8AWcwsJss+n
 +ywbe0cI0Bd0BX/+9jNtl1w/5eDtkQ+QElvCucX2/9h8wNj/sqJFqgjHw/LKa7QYv5jxehlYq0S
 lV5bsJ5DmkBlkBvIgyYhF6bVyOdmU4Oc9Kvj074yCfiWlmRwV/jObkcwkSwGO+cBnQwUH+WKwav
 v1TPjZYuE/bHZFzMvRvNSo395PwGVgJ568430Sa+SOGTIOiZH0qrPCNstmKs187hjBvrcDESZvD
 jV5F2O8VBfYf05Box6+xctCGg34N2sT
X-Received: by 2002:a05:600c:c8f:b0:493:ee34:d875 with SMTP id
 5b1f17b1804b1-493f88bd7famr121889025e9.10.1784020688923; 
 Tue, 14 Jul 2026 02:18:08 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4950a322bcbsm69927185e9.9.2026.07.14.02.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 02:18:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: Minor GICv5 cpuif bugfixes
Date: Tue, 14 Jul 2026 10:18:04 +0100
Message-ID: <20260714091806.3568281-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

This patchset is a couple of fixes for minor bugs in the GICv5
cpu interface code that I noticed while I was working on adding
virtualization support to it.

thanks
-- PMM

Peter Maydell (2):
  target/arm: GICv5 cpuif: gicr_cdia_read() ppibit should be 64 bits
  target/arm: GICv5 cpuif: Writes to ICC_APR_EL1 can change IRQ/FIQ

 target/arm/tcg/gicv5-cpuif.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.43.0


