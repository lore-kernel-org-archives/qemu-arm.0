Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6190CD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 19:48:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL4hZ-0002mV-49; Thu, 07 May 2026 15:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wL4h9-0002kq-9C
 for qemu-arm@nongnu.org; Thu, 07 May 2026 15:47:41 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wL4h4-00068H-2H
 for qemu-arm@nongnu.org; Thu, 07 May 2026 15:47:36 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488b0046078so10849495e9.1
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 12:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778183251; x=1778788051; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pf+jLrVl4oyiA9pwlLT4ybXiMl4Kj2Xt1plN+KOpDdA=;
 b=bwojZlbmWegqOfWvuJq3ipdtEeSvT/QtMquwrzyKopbfMbQT6Ok+1lUR3ZG1hNaQQa
 JOUrsFBDr9y6ha615lewi2CfFuc8ZtVQL37FhITyAUQkEvD36prWmnQl+5sUQBYBhIg8
 91Srl+PwwITawCxAAt/SRpq2GLdcZKq38UnRc38eTFDV7+y4XbfB1s2feny6E7eAkT94
 ykGKT3OKnOqKO+1tOJ5atph6dVDmliXDoSMw6oWo3p0VgTT6LrVDPAJ6bNiw+EIhnUIo
 KpgZsmvzgfWP57ardRd1P990XcGoY6z6Iav6R4PHUvD47LMwl3MIP/igit4TzcOw9ewF
 CD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778183251; x=1778788051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pf+jLrVl4oyiA9pwlLT4ybXiMl4Kj2Xt1plN+KOpDdA=;
 b=VPdnqVCWurb1C4uecnUkQfOlz0b9p+dbv2uBUFPL0Hq4CB0fMsWCrYoB+X89Udb6x1
 oI1W1ERp4v/EwzhJPOqRLWM8wj2cx/lvVh9kF4dhPR2TJ8J/JYaz3OK5gOJhZEvtj7u3
 axIFA8JY2ODplyXJmPbTNdo1sTuKlrC4QswS/GmAbMMNwR3hQwyXrAOHw4WjQw4miCMO
 aJ0UJHrQT5OyUTnP0Z1sEtI28SsOptOaRDjufHfE2+pP9Pf7xIZqktZFm0n9ITE8X0Go
 akBSj5dFx9xEAgKc+yoTxFD1W5Em/L3yO7Oei9C06Lmed1oFrRSIDTYgVroGq47rLSXa
 Z8gQ==
X-Gm-Message-State: AOJu0Yy/luLIN14wBLShK7bR11lrir4MbXdTaQb7x1ykS3Q8j3Jl15I4
 NBLi5cfhq2bTT/LpgcIVGXGXoEQNwCAtn/kx0QCUHGbpafRnljsogsl4gwC698PLytH2DOtDiq6
 o59PH
X-Gm-Gg: AeBDiet3zIIV8rCKQ4iuUu+itaLDIiY+J+lEE2zfMQt32h+SXePA3v2U9wmwuUWB4w/
 5R7o04wi+UqYFQg7B5SyIzlo3orF6gseDveJe3qrqQN4wL0SEPjIBFK1VYmsAyR4PozoaSC/J8m
 hn8dU13pK7DwNzJe34EzgLTTYg1Mlu3FiiNbE0qfYObquQZkf0VOXS7ybaF6j78CkUfVA6fYwVk
 5uxcf/oVWgdNa1hA2s9pzHHFiI3ianbhxvisI9ZwWoON7QJnIAN5Sc39iziU0lqo/XWyh+wke60
 NDwGKzj08Wrks9kEph75/HKrWN4AnH6qvMZPi8GJlHWsNWARonJJ7H3cl/clIBudCLxTAF5SF7D
 1ZLw5sJwgkvnDlzvkusM8J25QTW+p3sarwJPxnr0S45JCGSgcva2aq6sQgkMAbU6lq+lqJtrn32
 /L3daKZoRQlGpPAWPOajPhSzll0h8iNH26/boIMhweBjQt5f9ftLy/AaBt+ROoUTRNH/tseOiW7
 Z+7TtEMEQWD3wmtInCZW7y07PNB0sQ=
X-Received: by 2002:a05:600c:1d18:b0:489:149a:f9e7 with SMTP id
 5b1f17b1804b1-48e51f483d8mr145492405e9.27.1778183251314; 
 Thu, 07 May 2026 12:47:31 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e65c145aasm958375e9.25.2026.05.07.12.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 12:47:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 1/6] hw/remote/machine.c: Mark x-remote machine as OK for
 AArch64 and AArch32
Date: Thu,  7 May 2026 20:47:23 +0100
Message-ID: <20260507194728.2034696-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507194728.2034696-1-peter.maydell@linaro.org>
References: <20260507194728.2034696-1-peter.maydell@linaro.org>
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

When we updated Arm and AArch64 board types to mark them for the
target_machine_typename() filter, we forgot about the "x-remote"
machine type, which meant that it disappeared from the set of board
types exposed on the qemu-system-arm and qemu-system-aarch64
binaries.  We didn't notice this, because although we have a
functional test for it, it requires the KVM accelerator and we don't
run the functional tests on an AArch64 host in CI.

Mark the machine as being OK to expose in qemu-system-arm and
qemu-system-aarch64, in the same way we do for the "none" machine
type. This fixes a check-functional failure on aarch64 host, where
it would otherwise fail with:
   qemu-system-aarch64: unsupported machine type: "x-remote"

Cc: qemu-stable@nongnu.org
Fixes: eb796c55513d9d39 ("hw/core: Allow ARM/Aarch64 binaries to use the 'none' machine")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I couldn't figure out which git commit started enforcing the
filtering of machine types based on the TARGET_FOO_MACHINE
interface markings, so I picked the Fixes: commit hash for when
we added them to the "none" machine, on the basis that that's
the point at which we logically ought to have also done x-remote.
---
 hw/remote/machine.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index ced782f6a9..df08f64019 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -24,6 +24,7 @@
 #include "hw/core/qdev.h"
 #include "hw/remote/vfio-user-obj.h"
 #include "hw/pci/msi.h"
+#include "hw/arm/machines-qom.h"
 
 static void remote_machine_init(MachineState *machine)
 {
@@ -148,6 +149,8 @@ static const TypeInfo remote_machine = {
     .class_init = remote_machine_class_init,
     .interfaces = (const InterfaceInfo[]) {
         { TYPE_HOTPLUG_HANDLER },
+        { TYPE_TARGET_AARCH64_MACHINE },
+        { TYPE_TARGET_ARM_MACHINE },
         { }
     }
 };
-- 
2.43.0


