Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73413FD8FF5
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 18:54:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvgUE-0008FF-VJ; Thu, 26 Feb 2026 13:53:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvgU5-0008Ct-Er
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 13:53:14 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vvgU1-0003Ws-7O
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 13:53:11 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-65f771c6b89so1882467a12.3
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 10:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772131988; x=1772736788; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gVtMJo46t96oZ1ya/vn5y1AlDQXHYekuQeJieX1c/BY=;
 b=UJLmzAui3/3zs+2OVP94JVaSfdHa0xvcRhbmDg+NgDd13SCAV84Oxb9Uym1FpPXK2p
 ILstSwjCD9DwxPfVu1ptpMa0euFgeJyX8GoxIdRH+aG7RnDxNZ7OyAf/v8SylVZyQNmG
 omvt4mTvE/NeQpb9DmWNImQNOYhkseGrFR8lAC7JW7hGb2Z3aFG/4pPVjb//EhDY9i3H
 BpxeEOKEdO6FMPkYMABOGvkaU/o/OfeaucTOhbtZSsxdqwZddO22cY5jcyyiJcObwgrz
 nM2hz+K//9DF+bptiSyyBbkgvHhK6nw3y0leri22YEAKkWTTaoL7iuf30f1qPSgPWC+r
 2cYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772131988; x=1772736788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gVtMJo46t96oZ1ya/vn5y1AlDQXHYekuQeJieX1c/BY=;
 b=PcaQaS771LpeZNBbs0WOhiTSR6szBdr/JfN5HJrnNe85d9ZHL0EpUygKkd9UBS2pu3
 bJgmSrKKDtJkBHyGRNEYOdDj+OfXKZGqaE0NeuwJxat+RUDzzfT2Tnr2vodTxCkCSTFG
 NgGhan2s72wboEPRty9YVd0whRPZIUBokPvExy7DKlzyts3zfnfB7osc7vrjEkWfZtu9
 aw8mLMZppRBtXY+0sOUD+K4TsQ19Zt0Um+ZYayNGViUWUaRxG9r8/Ts27CZ8m51SQtmO
 5ec94sRnqTtC9OCXDfGSTgQ6/mmPLn9xZUtqvOFEZj5qglMB1CJMiMakVKcHoVFAKSmV
 lHPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiWEZtvcd8Os/2/cpw356m3X/bpFAecIokPH03g3Hhs2erEQUs/3DNxVLD2Z7dXvVVPKKcLQMKlQ==@nongnu.org
X-Gm-Message-State: AOJu0YxdAJ4mYpu5Vm/ANlOPEm/UBiGLR8YwQAhx/8nGx6r8ymDYmDfg
 Gzh8M7abYm9HiKdmdI1xm/phpGoHbq7m6rf6uj9FujyWjrw1VGZWj6VcaOhxPU3/Vzo=
X-Gm-Gg: ATEYQzzQ8lnC1oRIf6X7mvRCIHskipa/c4O7pDDiUCcvyChFsTunPBRymOxdTjRHgx6
 uiT8DDX8i4h7d5JWls4va5SZ9ouq1xNg7SakLMxRFZqQ8sk1LnflYrwl2lXnsxHlwNLPGHHT5NM
 HzZTk2TL9SFUmAA2KlRWLxHrvlA2pz3TldoS5Q9TJ8U76GEreUn1fvJ7ypCS6Aqwlr+c4hFWepS
 5bS1ZXkTC+lCN1uOinLymHyaRm5H4Om9tyAsHSaoqy9w2ZlqODZSUCWBH7XpKBocSPNxYViK3XX
 +hQ2t0cA8dZ8HYeFucaDaYe1OJ46foltHvqxIj4R8wxzXnIuU/EIZoXUL6vraNNVU96VY8r0yz0
 dIRU+FJmjRXDnETyjxqC6B4hTS5KcbrmQBh2JemxLwzMZav3jqEz+zATSpZoEl+AbMrC0j+fmdz
 k4EAwnv0gokPVKDYlPV8hs7nQ=
X-Received: by 2002:a17:907:86ab:b0:b88:5e4c:f842 with SMTP id
 a640c23a62f3a-b935b931214mr231810566b.47.1772131987515; 
 Thu, 26 Feb 2026 10:53:07 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b935a597d02sm82378566b.0.2026.02.26.10.53.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 10:53:05 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CAA8C5F8D0;
 Thu, 26 Feb 2026 18:53:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 4/7] tests/vm: remove unused import
Date: Thu, 26 Feb 2026 18:52:59 +0000
Message-ID: <20260226185303.1920021-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226185303.1920021-1-alex.bennee@linaro.org>
References: <20260226185303.1920021-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20260213154859.1551283-4-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/openbsd | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index d1289d78d24..9aabfeec963 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -14,7 +14,6 @@
 
 import os
 import sys
-import socket
 import subprocess
 import basevm
 
-- 
2.47.3


