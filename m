Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897DCCD5BB1
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:20:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3IE-0004rZ-TV; Thu, 21 May 2026 09:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hn-00047A-SL
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:18:06 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wQ3Hg-0008Sa-U1
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:18:03 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso54638235e9.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779369467; x=1779974267; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0vQvKh3fZXzRV5TUvdZxMC40kkD4YY8a2zsCu4sYd+U=;
 b=Fi7VNZOktNePWz60WgeDJ6a2cF0jOWLSvvk/VldjNRr9DV/igQW3NcBohAg+tkFM67
 E+pqkguAjzGJ1qvVga9JNFwrcWxNwBSMFoVLSw+Ir+wuYFRfsK2+AprO7iWCA/yTuty+
 b9dxvY62RlrfGylylkcx/gTXafvSEacDlSlAYSrJyhuGvfDMAsFsnlFl1tuN9iJyYAvU
 IbET1ltPl8aaad0xLqd6hqFqBUrVnNrvyx3E9GcJQP1rls5Rof4mwczR6JJNmYbeMNmw
 5zkWn7GEcwvVyGcZFtLDq04Vb+BI5TJn9y5CN++ySfBq31x6NrzaQsYLtiUwVeqqXQQe
 UmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779369467; x=1779974267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0vQvKh3fZXzRV5TUvdZxMC40kkD4YY8a2zsCu4sYd+U=;
 b=Y9cQWw1ZhsTSRFvDU8NGdww08IMzJwK3uQqhmHbyWYacBCFmHPFRdYHBS73vDSpEod
 NiQilelywVpUuMHnxR0uCzFM4KOAOLlb16ADDNX0OpLt+lMxfLMuczNm27Ua2wAJ5xvA
 VKV/lBlZl8/qVlnT1sM2lMKzqfngbTartdIar/iUw94ZqyNiRKq0LyrlMhhEsWNdcTl9
 4WQYiNjsNFQ+ebOUPrp1aXmFumbzNIDCz6CJtRE6iaI41I53vpUHUORHDMQiu8m8tj4Z
 1wi4yjhBmiqiKhmPSh+BL5mfSkBXT2oe4spiLMF0dMVWvMDGTrJ5Yk4g9vDnhE1FMEXi
 DxPg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/XFyfLn608twNK1IrINi2nOnRFG+F4p91aqzf0x3Na+1W0C3K/wtV26aoFLt96OZYG04LNsHn2Tg==@nongnu.org
X-Gm-Message-State: AOJu0YyjLP7zI4jcfC3Rh6JCFN1Bgk4j6WpyA1jmh/sWy8156ST+4b+b
 c554xIaqX2R+A1jlr1I+DssblSxuqhJzbptKTeqkd/TtoViKMRnDVKgC/h6tJZ2Dnjk=
X-Gm-Gg: Acq92OGR5Pq2mxxploWglCVrxPKTKRohjxCeo308MYWxxq66SlQoOejc8uxVpLb+9nN
 /y8DPoZlAdJdVfIv6B8dFZmeDyjHxYtPxhJ3MB8dc0negQC9wxCZwAsLf+4f1gm1Ju0QBptMtAc
 rjfUi55CQ+Tb3q2nxhO1xMBMJ29rcj/m85I4QoqhGn8Laoh9mkYag4ZKLJ60E+nNkvcuXlSU9nH
 /qMRiTNGiIyuF9b1zxXTXpV6d+AyqMaqzb4g3r2RVK8pjTp0O8Jgo7qsLE/W5P6pkqFWMCELU2x
 aSB+xILsmKiOJs8BpnKoycHTKTTmaNk/G0TKJKgwserYBBMypje+KVO1SyGJyFslCn+2nsl9VEi
 cwkItQf/xIjZf899WMLmQcqKtRs/FFaQNN9kBglzR+8WdrdpnWtbCnTB4AewYuBBZXwoTNmZapy
 h2ZBvg/i8ZZX1XO4dp4lTzw1WoaBFeVcyHew==
X-Received: by 2002:a05:600c:8b45:b0:48e:635a:18d2 with SMTP id
 5b1f17b1804b1-490360341c0mr45493785e9.2.1779369467248; 
 Thu, 21 May 2026 06:17:47 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d52a0bsm60184105e9.7.2026.05.21.06.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 06:17:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2052A60360;
 Thu, 21 May 2026 14:17:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Song Gao <gaosong@loongson.cn>,
 John Snow <jsnow@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v2 09/16] MAINTAINERS: add a section for AI agents
Date: Thu, 21 May 2026 14:17:31 +0100
Message-ID: <20260521131739.540157-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521131739.540157-1-alex.bennee@linaro.org>
References: <20260521131739.540157-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

For completeness add a section to MAINTAINERS to catch changes should
we decide to merge this.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b75f3222f2f..6b61a23893a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4576,6 +4576,12 @@ M: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
 S: Maintained
 F: docs/
 
+AI agents
+M: Alex Bennée <alex.bennee@linaro.org>
+S: Maintained
+F: .agents/skills/
+F: AGENTS.md
+
 Build System
 ------------
 Meson
-- 
2.47.3


