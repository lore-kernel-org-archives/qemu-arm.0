Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0C4CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 09:41:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0d0e-00041L-OW; Mon, 22 Sep 2025 05:39:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czF-00028d-Md
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:37:36 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0cz4-0000cO-4O
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:37:33 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3f99ac9acc4so985970f8f.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 02:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533835; x=1759138635; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p7AJahUMqP4H52ZjgDIGUlzyg5ExoTqCJvWrQsOM+Os=;
 b=Bg/SRRFWdo1eoN1rrUiX+oMyQW5KptzRh/TvTfXBdhYWtscq65fuWo4pfjWACOWc0G
 MuEvFRbVQZ2CeQOJtSlBe09oJuiF4og/q2AEL9lAo+dAVSh9CKejD1XM9zKQWIF9FHt0
 IbEW/KERg5mq1LEJVdj9lYPxp9Gt2VXM6zpN9g/jEKejFJsZKzETa0dIGPhVpfqjMHmN
 lnI3DbL3mBVrn6zVTmmo7tOwXZBfeDuRe9R3Q6joQ3AXVRm1/KQUeZICju66YiH0PDvF
 TRa4di5yce/gtTtpzrJ/bB+aGTRO+azqbJk76AJoRlB9Lqt6vkegECf/HG8CAWeS4oou
 03MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533835; x=1759138635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p7AJahUMqP4H52ZjgDIGUlzyg5ExoTqCJvWrQsOM+Os=;
 b=VLAbmWLMz+xF7BxUGJCEMxR/Y/K/ljYgR4XT6rcXjKN4Aw+8vksavjVa5YGAlBfJcU
 Szh6fwlwXp0BjtlvvTpya0haqk+bum7O+xd892Cd/Ccyw8NgTRG1imc7f+0gXFymS28J
 uBHHe4wwYiewKmwPs4fonHDsQ6ziLLpLs229Z3SqL6sSYGO3HTU2dF5zZ1HVpiZ5t9Ep
 YU+VFWqO2cVn8DZM9t+diVXVrj8R4YdlB6x9y6o04pn4u7zU2YyM3V8Ag6S8N01yOp/b
 XUZzUxqq9l8wD7i9swMWed8hEdDyewIS3GoqEhD/LDCLIkHXWyq9YUuKOTKlndPzUftY
 MuCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiChNYVKjLUsnpWkSEsr9A56SqCyPFPqoPG4YtrfzSiWF0Jy/lDr73z4tzZqar6Tr+wVQsnqN9Ow==@nongnu.org
X-Gm-Message-State: AOJu0YwclcdxIm/NZbitjEA+CiNb6tTr32D/glujrryVxVGuKmyhgdWl
 82hMRYgfxguMEFHcccZfCapCjlNUlCX35DpGRHvSYF/I07LWzP6j7EELdumAL9Utn7U=
X-Gm-Gg: ASbGncsLLZU6ymymc8poIxB2VNkhcTna5+WWKd/mhsiQ12kb2mRjItWMJx/L6e8omSz
 O+s3u+LW3udzcr3CXUMMw9Zn1HID299OOJ4Z8p3cYRJndMeIi4vuCeU9Esa3gto7N/r3eCr45iB
 /6XLa/XFrE330u2FYLr2y6gFs9cSmGvc1LbZN02yOUs20jwdDwh0tPDmD/mLi2rKoJbz5AfiMkK
 Zz2UOrNRWpSI/fwvW5FgXDcFBiWQ66zLdYrYmmgVfRYUpysJQug+1pkYKY0naW0auu/ssPjPEK4
 jtHUxdrSGa63A4sll1m6fRG7O070GUQe/ebZD1HHqPHKIn7ewtVl4SdGiGWql91saAFtqk2JDTW
 aAch1dBJ8IZ/U4TcDSFTP2pE=
X-Google-Smtp-Source: AGHT+IEKJ52MYarnP5WeS3Ssw0avY2ayMO6o3vcUndbtS7T5aj3s7MrMaJEPUYVs8MIw5X3I4Ev1pw==
X-Received: by 2002:a05:6000:2c05:b0:3eb:2428:4a05 with SMTP id
 ffacd0b85a97d-3ee7bad11fdmr11043020f8f.3.1758533834747; 
 Mon, 22 Sep 2025 02:37:14 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbd63a2sm19048919f8f.48.2025.09.22.02.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:12 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C3D4D5F90D;
 Mon, 22 Sep 2025 10:37:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nabih Estefan <nabihestefan@google.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 03/25] checkpatch: Ignore removed lines in license check
Date: Mon, 22 Sep 2025 10:36:48 +0100
Message-ID: <20250922093711.2768983-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Nabih Estefan <nabihestefan@google.com>

When running the license check, if we are updating a license it is
possible for the checkpatch script to test against old license lines
instead of newer ones, since the removal lines appear before the
addition lines in a .patch file.

Fix this by skipping over lines that start with "-" in the checkpatch
script.

Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-ID: <20250916165928.10048-1-nabihestefan@google.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/checkpatch.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 91616c974f2..40b6955c698 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1816,7 +1816,8 @@ sub process {
 		}
 
 # Check SPDX-License-Identifier references a permitted license
-		if ($rawline =~ m,SPDX-License-Identifier: (.*?)(\*/)?\s*$,) {
+		if (($rawline =~ m,SPDX-License-Identifier: (.*?)(\*/)?\s*$,) &&
+			$rawline !~ /^-/) {
 			$fileinfo->{facts}->{sawspdx} = 1;
 			&checkspdx($realfile, $1);
 		}
-- 
2.47.3


