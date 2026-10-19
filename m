Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246AD606A31C
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 19:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YQaKC2PW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIt3M-0003Qh-HZ; Mon, 19 Oct 2026 15:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt18-0000Zb-Ji
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:32 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt16-0003A2-Ju
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:30 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48b042c0728so700538f8f.1
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 12:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792438047; x=1793042847; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=iFID69NcWz9vXlIEc3jHs50omc79b9q17ny7SoNjtkw=;
 b=YQaKC2PWWdG7T0yN2t4L4ztMB4yAbB3c/7eOdA1xLAEK7i+OuHxPvKn0G5mWzZCuxX
 tPxdEJ5YdC0FbOdjDTs9qWPgmYoQCwwpgg6i9MYyaBV79H/3IE2LrIva3ZRDj2Vz3EU9
 tim8GISNqqfgcObzumO1vuN7kLuLBI3FZfGnKbecYPa4vMx0jfe3bMzNttkmgQMBuRX1
 r8t+EiWvBX0UmIXXKUVMa7YyX7eEJU5Jcwrip4AB0TvrlFqQVM4seFQxM5ZLMq7/gER3
 GQOLyf0uZY6pv7Uy6qrjPx4/OxSvW8Do0OvPeDR532Q3/k9V4dVAkKl0dsnRo21rjQ/n
 Is4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792438047; x=1793042847;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iFID69NcWz9vXlIEc3jHs50omc79b9q17ny7SoNjtkw=;
 b=26eu5IvRuRphhuFIE69syQDJFKOgHFWFjySKATr+B3m4IDmlNYYnAmRBZZ9vWdJv3r
 0jQTzVAHYt3ZMerPR5QpVKl/uwIOgUWKY0gx/TpdkAzfKUj5yEIP69b2LFHkkueASkqS
 HqorpLhjF58RQs6r2cvX6PkH1jmaX9ugZx08VrN60HE2zwYO1CWMVwfOVerpo/w8+GVu
 xojNGvJhMGDRSjv2XfWrkfYl3xFF7Co1e/7VFxVERd9/d9Kn7a8KSBfENvYWSStxiV8S
 y9kYgHsYheBFLgb96ZDJcNlcFgVVvHgVoJvzPokG2UnNatPEDZ+QS5pDuLDMq6q1wxJu
 a0iw==
X-Forwarded-Encrypted: i=1;
 AKwUvByhrlnlz0SvNhtsJvx3bNCYV63ZPRb28hHxubTdann7Au/dAofdT74u0AzwiQ3NMykXvs01f3rsVw==@nongnu.org
X-Gm-Message-State: AFq9FYLuDELOaMtE2bcaBdiP/W3g4uIcnUS08YbomK7kwylGxZZUQVw9
 SzKiGFjWmSWwFzhirUenSZZLIkggA0M6Mhv+tLDABrJAgWL/YHgsEZts2Gz31+uWgDk=
X-Gm-Gg: AYBFou3sLd+bhBgz28JhjSPyQgEpj8Ji8iKg2kVhd3PV0nk/AschIRV1+vW5Wr8bjvl
 PPbWLxLRrn3QpHYHXwbrxwWz7hRYbzvI5zPNs6XkoJi9lrDz9kUwmhLhfhtGgMCXAPxyfABvWPp
 d9fnd+R570E1Lr1Jc3Iy0GG0sE43E8BSOinKuqALRwG2scsfcIYhVOkbR9TfV4B5TIg8Lt+9ba+
 lspeInZSI3raa98Fikvrlot8lIBHrzp0KdVmgf3vVLCm+Yc5DzfaGYzm9JB4/aNZKYj3w2guq1M
 zY7LVHu/yUapXjtxcv0pbfbalHQGattrJ4XqPGoLkTyGv9NTp4Ppko55MsbqdPCxGOqsra3Ek5W
 w2clh2wCLjmXSWt4So11E/txewQd7gclWndF6dwAOP7jfIaDkQSYgE1V9E95coKWB09jdBUZWMD
 2tP5oOaHl1lFFQ0Bn/nVGwFYfNJ7S4heksjX21Sg3b96X2sZWwNNMcttNXmSn0L+kjhkkvFoo0s
 Rbi8+tK
X-Received: by 2002:a5d:60cc:0:b0:48d:f14a:9177 with SMTP id
 ffacd0b85a97d-48e07fb9180mr12657017f8f.56.1792438046511; 
 Mon, 19 Oct 2026 12:27:26 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d6dc034sm827547f8f.3.2026.10.19.12.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 12:27:20 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 292985FCBC;
 Mon, 19 Oct 2026 20:27:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Keith Busch <kbusch@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Zhao Liu <zhao1.liu@intel.com>,
 Ani Sinha <anisinha@redhat.com>, Anders Roxell <anders.roxell@linaro.org>,
 qemu-arm@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Brad Smith <brad@comstyle.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Klaus Jensen <its@irrelevant.dk>, John Snow <jsnow@redhat.com>
Subject: [PATCH v3 11/19] tests/guest-debug: add --symbols option to run-test
Date: Mon, 19 Oct 2026 20:26:56 +0100
Message-ID: <20261019192704.3220373-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019192704.3220373-1-alex.bennee@linaro.org>
References: <20261019192704.3220373-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sometimes the debug symbols are not in the kernel binary image but in
a separate elf blob. Provide --symbols to facilitate using them.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260930164649.433573-12-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - fix merge conflict now we use array for gdb_cmd
---
 tests/guest-debug/run-test.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index 782c0c5da19..e74bb489ee1 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -28,6 +28,7 @@ def get_args():
     parser.add_argument("--kargs", help="Kernel args to --append")
     parser.add_argument("--binary", help="Binary to debug",
                         required=True)
+    parser.add_argument("--symbols", help="Symbol file for binary to debug")
     parser.add_argument("--test", help="GDB test script")
     parser.add_argument('test_args', nargs='*',
                         help="Additional args for GDB test script. "
@@ -127,6 +128,10 @@ def format_cmd(cmd):
     gdb_cmd.extend(["-ex", "set confirm off"])
     # connect to remote
     gdb_cmd.extend(["-ex", f"target remote {socket_name}"])
+
+    if args.symbols:
+        gdb_cmd.extend(["-ex", f"symbol-file {args.symbols}"])
+
     # finally the test script itself
     if args.test:
         if args.test_args:
-- 
2.47.3


