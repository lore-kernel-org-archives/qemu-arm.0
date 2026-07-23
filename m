Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3BDC531D0
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Jul 2026 23:36:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wn2xX-0004rP-Lf; Thu, 23 Jul 2026 19:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wn2xW-0004qn-9S
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 19:36:10 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wn2xU-0001bz-SW
 for qemu-arm@nongnu.org; Thu, 23 Jul 2026 19:36:10 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-448de0cc236so956152fac.2
 for <qemu-arm@nongnu.org>; Thu, 23 Jul 2026 16:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784849767; x=1785454567; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ucm9U4/bhrDdmIqQqv/La0eBnJ5MPcmWIKvzF9wOrXE=;
 b=I/OdFkFwm3X+E925gWl7KRLjjMLe0D6811cZTnt7dAmt35D+MlH2Pj8VYpMaUxN3si
 BpJDHbSPdAB3p47ughcmLn49BRS1b9c2b7TD8gFF70LeuoTiMmjdFsB2Uc6g+B1mFFGZ
 opaA5n2qgByFkgg7HS++MGftNMdk4OfH5DFOspz7KRJVa5EzcgkYbiBQMO0w5F4jG4vr
 6lo7Bgc45sIyX91Ro69i9JafIyCLvkJJxCjfk2B0T73uqjtpFMusBH+a6K8Tqb2qxFXr
 pAbhRNDf3WBaZvu5plOoHuZXvKbGvspldYzyQgSxpw+9csqmSP6cTGo5jP2jkRj2ehXp
 edEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784849767; x=1785454567;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ucm9U4/bhrDdmIqQqv/La0eBnJ5MPcmWIKvzF9wOrXE=;
 b=qnmA+pIxoPE4LKXwE6vbNiUsoU5BZVqXyGAQc/Okmle8KBjsCOz6OlEoLA0v0gla8Q
 1KOpOc5mK/p9M4k3XDctg+XDrk7ZGNHrs5Jv+lxvdF8SqmTX8HFW7T68BeWX354P8Mk5
 09+s6oM3caeNefPKqf43ePBKJ47vgxfaxQiRFzJbe7RwmepFX9OuqusuVyQ3Vs/9/9mv
 PuFt9V4gdSK5iXZbkiXmW2WLgExvw2+/IDJnxveUXza3rg49fuHTBq0FJAUJypPW2EDM
 ktdmkNTiOxWAwc0wjcOyAVUgQB7SBz5CsUTrxWIAJ1OazP4Qdxi0FgUENHisDxl1vy6S
 NhFQ==
X-Gm-Message-State: AOJu0YxMKBXT/CGE6EwsO40cnZEIffsaQ2PkAaOXDcFDU53jfO8mcK8c
 psZDFXdTRLN11HVmrhVBEbYvnYK+1OgyjO8dGM0u4SIR3cC7SC/UzrBp
X-Gm-Gg: AR+sD10ouJ/riqvVnrd7L0v3Fjl6dojUVMVxEqa/jnbrfzKwJITp/3Y/P619NlHwTUK
 dxuUfnvlihmsjIAT6i5hFAVCxPkOmhQhFa0symaQEoi/TY6fmKOXU5h3kbnmUdp0SJgoUBJ+URa
 n4tGAZxW43Wo4uCR/GVRbopekYrMMIP51EUDcZg2PnWUs5PWVFN04gD6RmsJx+4tpLzLDx9lVuU
 zEYXmO7fuyDWe/0iyy0aMg7SRNLVXoqhfgRVvYhmZFedqzodJWMsxAY5nFeABknAXp8rZY6Cjgi
 uyUvnGkx6R+AUrb5f7cIC8gqAgC0CxOw6F5FUmui1Ph7sqcln4ID/19+QSsVlMeLrk8xBp7dUQH
 JEQWwccanleDVLhAdOi3RB6DrmNtYCxRWS5pBbTComp02Yel7ic4mSPFhDwKdr27YoDhHsOCAQ4
 mJoSLG9+WjM4y13SgV/esK5+M=
X-Received: by 2002:a05:6808:14cd:b0:489:352c:5153 with SMTP id
 5614622812f47-4ab3544e31dmr2603583b6e.21.1784849767315; 
 Thu, 23 Jul 2026 16:36:07 -0700 (PDT)
Received: from HPE-2MQ6131DV6.home.local ([23.124.244.239])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4ab248c6667sm3631997b6e.0.2026.07.23.16.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2026 16:36:06 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Owen Giles <owen.giles@hpe.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Robert Elliott <elliott@hpe.com>, Simon Xu <simonxhy0404@gmail.com>
Subject: [PATCH 0/4] arm: add Cortex-M85, SSE-310, and mps3-an555
Date: Thu, 23 Jul 2026 18:36:01 -0500
Message-Id: <20260723233605.805-1-simonxhy0404@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=simonxhy0404@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

This patch series adds Arm Cortex-M85 CPU support along with the arm
defined machines SSE-310 subsystem and mps3-an555 FPGA board.

Reviewed-by: Owen Giles <owen.giles@hpe.com>
Reviewed-by: Robert Elliott <elliott@hpe.com>
Signed-off-by: Simon Xu <simonxhy0404@gmail.com>

Simon Xu (4):
  target/arm/tcg/cpu-v7m.c: add cortex-m85 model
  hw/arm/armsse: add Arm Corstone SSE-310
  hw/misc/iotkit-sysinfo: make sys_config2 configurable for SSE-310
  hw/arm/mps2-tz.c: add new mps3-an555 board

 docs/system/arm/mps2.rst         |   6 +-
 hw/arm/armsse.c                  | 229 ++++++++++++++++++++++++++++++-
 hw/arm/mps2-tz.c                 | 143 ++++++++++++++++++-
 hw/misc/iotkit-secctl.c          |  18 +++
 hw/misc/iotkit-sysctl.c          |  60 +++++++-
 hw/misc/iotkit-sysinfo.c         |  23 +++-
 include/hw/arm/armsse-version.h  |   2 +
 include/hw/arm/armsse.h          |   1 +
 include/hw/misc/iotkit-sysinfo.h |   2 +
 target/arm/tcg/cpu-v7m.c         |  41 ++++++
 10 files changed, 506 insertions(+), 19 deletions(-)

-- 
2.34.1


