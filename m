Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D010E9B250
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 12:11:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vurFe-0005fi-Su; Tue, 24 Feb 2026 07:10:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vurFF-0005Yv-MY
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 07:10:31 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vurF8-0005sa-8E
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 07:10:26 -0500
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-65b9608a9adso9174375a12.3
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 04:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771935019; x=1772539819; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IISN0lP+7dN54JpUiys6SOZxdXuDwh6wfFPA4+4FdvU=;
 b=gH5jitm/bAM/X68hve7qiaNds47pxuuiY7HTJ2Ownt1EZCMLyQr0GKLkhAqCg7t1/Y
 zURZxZr9s2SOjyvvv6m1wKc4CYO756YItcYKli9URiuzMIToscOusYivMT0N1HsVjVQ+
 oWjkgmYK8sCozMOuN0dAqOGJt6o4tNN3TJ9YfOdDWCyTWnWDYbRHTNuH6C7D4LwSjFPt
 GeB0hnDEk7XxA7tiyIqyTN6lLBFDl7Om/3UmbxKr9j7aMjVDpugH1U42oIhY/elNHMu8
 jy9tVXfo3mPw/aHRwfesBVF1fi8gKnhZ8cH7q2wvXnoauPo2KFYuaMMVpeCPcBiYmE/3
 Rofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771935019; x=1772539819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IISN0lP+7dN54JpUiys6SOZxdXuDwh6wfFPA4+4FdvU=;
 b=mqEyk1yp/peY2Laz5VUguiE5I8eEEM/kdKnL2ElDmIlDxUQpydPb5E+glTdD5RuOQS
 BvobXWACLfHun3VIJujtQjn92IvjgXwVM8UOqMTDKiDLPd/924BeHSVgtx7wHBjkmoIB
 /NNkEf9xNjeR4bI6+Wz7++3V4O/xIbOuQqSpt7WIZUxRkrS2t8Ibor40a54T9qrKaSYs
 NljAhUKzX0UO/6G1XoyCDevNBZjOGDlCHHgxlBM1G+zTKIjgPKL3U8FkCkWEDkL98n1w
 RsR5Ir1bAc6AarJi/bt0hFvILB7DQ/PgYfc6zLtgr66WG6v2ME6hav/zfUiJ4bvbXIEG
 AM3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJOmbJmXIQOF8exXUSGwzrrGEXsfgmmQI0JwiK6gIns9WMJfx/ncGm4TCBaoFZGAADFPhoRQmeGw==@nongnu.org
X-Gm-Message-State: AOJu0YyFVcX0oRmDSbChEWi9fLCyWrtIjs7vlYpTETxwarMfkUow1bnf
 G3t8W9sd/7ktDnn0IsBYzYjMCBHzCfwNvgU2njQ0bz4zOL7WuxuvHxVyB5i4+Q2ph4Q=
X-Gm-Gg: AZuq6aIZQG24LxvMVcx19EscrST5myBCo96A3TT3OGL/xMkWT9r/MNO3xtdnOe4XihO
 eiI2Y8paUfDpTD85KhIDQJHpswV/xCTvNoKwUukY0Ep+4p62T/lBgu9Hx5cquzzRbeU1JqcrfRa
 Vdx0EKnDnA4+/LOGC9A3pj+Ak55OKtIyVVvx7WAb45UL2hryGVUNZlEh1/7RnDq98BBuaTbD7pB
 K9lV1C2SDUMMiiX7lQw0GR9DTmh1CcRqtQU3VBTxMD5eFA0M3QkDcBogkEeV4HxHpQOobh3ETzM
 dACZGdn10xkeGJiWMJ1p5C9ao1gVYgYXhmuiBz1wzWwGFnZzSFAiUXQPtPoDR5QtGm4JcpvTZlQ
 syDvapiwQ57KKe6rlCG57epspoOAP6S9jmpVXoiIAQHaHy5h3MjUYJQZo3xrlTKCRBjOQyGdYac
 rRIPGTUyto190odQdFfArwX6M=
X-Received: by 2002:a17:907:3cca:b0:b8e:2a8a:4328 with SMTP id
 a640c23a62f3a-b908191f26amr653879266b.7.1771935018759; 
 Tue, 24 Feb 2026 04:10:18 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9338baee1dsm10580166b.58.2026.02.24.04.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 04:10:16 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BD8055F8BC;
 Tue, 24 Feb 2026 12:10:14 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/8] .eca: basic configuration for Editor Code Assistant
Date: Tue, 24 Feb 2026 12:10:08 +0000
Message-ID: <20260224121014.279248-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224121014.279248-1-alex.bennee@linaro.org>
References: <20260224121014.279248-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x543.google.com
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

This is a basic configuration for eca which is a editor agnostic frame
work for connecting skills and tools to an agententic workflow. This
is important if you don't want to be tied to a particular platforms
editor choice.

These would often be user specific but I've included them in this
series to show what sort of things they can do.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .eca/config.json                | 43 +++++++++++++++++++++++++++++++++
 .eca/skills/checkpatch/SKILL.md |  9 +++++++
 .eca/skills/gtags/SKILL.md      |  7 ++++++
 3 files changed, 59 insertions(+)
 create mode 100644 .eca/config.json
 create mode 100644 .eca/skills/checkpatch/SKILL.md
 create mode 100644 .eca/skills/gtags/SKILL.md

diff --git a/.eca/config.json b/.eca/config.json
new file mode 100644
index 00000000000..81b0c97782e
--- /dev/null
+++ b/.eca/config.json
@@ -0,0 +1,43 @@
+{
+  "customTools": {
+      "gtag_find_symbol_definition": {
+          "description": "Use GNU global tags to search for the symbol defintion. Return in ctags-x format",
+          "command": "global --result ctags-x -d {{pattern}}",
+          "schema": {
+              "properties": {
+                  "pattern": {
+                      "type": "string",
+                      "description": "an extended regex pattern or literal string to search for"
+                  }
+              },
+              "required": ["pattern"]
+          }
+      },
+      "gtag_find_symbol_completions": {
+          "description": "Use GNU global tags to list potential symbol completions for a word stem.",
+          "command": "global -c {{stem}}",
+          "schema": {
+              "properties": {
+                  "stem": {
+                      "type": "string",
+                      "description": "an string stem of a symbol"
+                  }
+              },
+              "required": ["stem"]
+          }
+      },
+      "gtag_find_symbol_references": {
+          "description": "Use GNU global tags to find references to a symbol. Returns results in ctags-x format.",
+          "command": "global --results ctags-x -r {{pattern}}",
+          "schema": {
+              "properties": {
+                  "pattern": {
+                      "type": "string",
+                      "description": "an extended regex pattern or literal string to search for."
+                  }
+              },
+              "required": ["pattern"]
+          }
+      }
+  }
+}
diff --git a/.eca/skills/checkpatch/SKILL.md b/.eca/skills/checkpatch/SKILL.md
new file mode 100644
index 00000000000..49c556bed2e
--- /dev/null
+++ b/.eca/skills/checkpatch/SKILL.md
@@ -0,0 +1,9 @@
+---
+name: checkpatch
+description: run checkpatch on a file or patch to validate style issues
+---
+
+# Instructions
+Run `./scripts/checkpatch.pl [FILE]` to check a file for style issues.
+
+You can also use a GIT-REV-LIST to check against git, e.g. run `./scripts/checkpatch.pl HEAD^..` to run checkpatch on the last commit.
diff --git a/.eca/skills/gtags/SKILL.md b/.eca/skills/gtags/SKILL.md
new file mode 100644
index 00000000000..b158981b1ae
--- /dev/null
+++ b/.eca/skills/gtags/SKILL.md
@@ -0,0 +1,7 @@
+---
+name: update gtags
+description: update the GNU global tags file.
+---
+
+# Instructions
+Run `make gtags` in the root of the source tree.
-- 
2.47.3


