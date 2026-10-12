Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8C8CA9ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 17:07:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGJSA-0005XN-3O; Mon, 12 Oct 2026 13:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRV-0005Fw-Kb
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:04:11 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRN-00077O-Op
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:04:03 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so19417275e9.1
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 10:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791824635; x=1792429435; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=XfPEM5BX3bVPfsrHLuLo2HJrt7GpFGqt2nf+nCPNIxs=;
 b=KSg5mIvi1r+sDM/+YQmbhqT8xtKiQU0mmW+8RZus4l8GLbtVw6Ije58POfdPl1IRVc
 eOtVRXYB6Cp98I9BBYcRlQjcDvOiwyUTz2pUgz/qP5y2ZTcpz2uwBa69TmPS9QXFQgrL
 M4SPk9jRBB2oJqRKwNnisySTQNnZRWUTkWvbNNRjJwVN3e/qm4Rexy1ymNncK3vQ7L+v
 r1VnLtAdDdQqNCBT1xHZMoPLAVdzQJgMWInEQ9L49SXeGygqBYes24CViV8OmxfyvIZ/
 vljVqP9pORjUctLUbhen5NE+MiB0FZA2/Qz0B5+dFK95mDWIMGyZXFmqNnPQyLK4Vqpz
 23cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791824635; x=1792429435;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XfPEM5BX3bVPfsrHLuLo2HJrt7GpFGqt2nf+nCPNIxs=;
 b=Y6c+U5TnfFVbuGEJUWJhH08uy9+zBT22LJgDC/iOP1um+UKE5sxhwiYokwGR/nnRlb
 /lTDeDm0RE8XxZHH7k051EnCQp6lsxXvjrfvkdA6wyFe/3a1CeVLlUQabMemklWBxSGy
 mw77jCZQGYHKu7CzkF7y4JDoHG2Gl8+86sQxjhzIFuJslIWcCYplnya3cvmm8D+CnQlN
 mkt+LWm5A4xOZgrerG6wDvloyAbqH8EO47CzTnPCFC7ZV2GaUkkmd5prWN6CVcT73/F4
 rbEtAFgPwwZlIzjjvLpOm70VAHXrZAOujMh8wC/wALUd+4XWpaGSu5CpD6oLcvX/xvEk
 u0Nw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwV9doGmNcoVYY12F2ctN4MC648TVDwIOUfar5MI1brGZ0/L7Mz82TebBfFd3Hr1ky/MJrwG5Xb6g==@nongnu.org
X-Gm-Message-State: AFq9FYJlgtbzYC/1CFZCa7Iwa8loPZaJeMU3A7dU/Og/imOFHFLrM7Qs
 ynT6XHa+aUFlP/aFXeiX+iCMEi1yShiu/VVu5goFakd5MIPtFrekCDwSdooer2gBmwo=
X-Gm-Gg: AYBFou0f7IqXoKW3Oj+n4Hrgp6/vTgVMLMIeJ4ddsevJm0qY4IwOyE2tSbN+peMnAhi
 hklAYmc0HJoN9ksLbQfFQi80VRiKvoVWiUZxmuw8N9I4TI0gk3lNwR1NdBRyHdiYZ3eGYFPV/bh
 B2EAVQTF0jCRq0yQ05ghGzC8tovok/wX9DYdxntBsEsIf81bkVO6T3BIbJ6eLtJXtykxyeDY1ys
 eacjtRm9Vr2qdGx8cpleHIw2CoCrCO4Pf+ybSdNbft7YPy9lEhE7kF44hj2Bwairb5eUH8ryZA9
 igztD1n306oPlHn9TrekMaPb4/1LoAcnsZiENW4k1CSqGo4oKm/e9sk+hYIY6L21cJO9gTXMqUF
 FsobINu856eZ9NtiYdaGQWdobV3onMOOHOY5fWCLlah3PtkZ+upEvzaSarWI6sNcPjhREsv4E5P
 /9jzvYDfeH0S8mCgMpaaEm3qupxXpG0PqXhwopT2JG+omZsQ6DA98xEVPbq/n5G91VyaJX9Ho=
X-Received: by 2002:a05:600c:674a:b0:4a1:7cf8:5433 with SMTP id
 5b1f17b1804b1-4a18e443ee9mr185600485e9.3.1791824634573; 
 Mon, 12 Oct 2026 10:03:54 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e49792bsm483443235e9.4.2026.10.12.10.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 10:03:50 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B572A5FC2F;
 Mon, 12 Oct 2026 18:03:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brad Smith <brad@comstyle.com>, Ani Sinha <anisinha@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Keith Busch <kbusch@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Warner Losh <imp@bsdimp.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Song Gao <gaosong@loongson.cn>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 07/16] tests/guest-debug: add --kargs option to run-test
Date: Mon, 12 Oct 2026 18:03:21 +0100
Message-ID: <20261012170330.1144446-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012170330.1144446-1-alex.bennee@linaro.org>
References: <20261012170330.1144446-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

When passing kernel arguments to QEMU with --append we need to take
care that things are properly escaped. It's easier if we get the run
script to do it for us that constructed the nested escaped --qargs.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260930164649.433573-11-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/guest-debug/run-test.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index 838c1c26971..4aa24939b7d 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -25,6 +25,7 @@ def get_args():
                         required=True)
     parser.add_argument("--qargs", help="Qemu arguments for test")
     parser.add_argument("--pargs", help="Program arguments for test")
+    parser.add_argument("--kargs", help="Kernel args to --append")
     parser.add_argument("--binary", help="Binary to debug",
                         required=True)
     parser.add_argument("--test", help="GDB test script")
@@ -82,6 +83,8 @@ def log(output, msg):
             suspend = ' -S'
         cmd = f'{args.qemu} {args.qargs} {args.binary}' \
             f'{suspend} -gdb unix:path={socket_name},server=on'
+        if args.kargs:
+            cmd += f" --append '{args.kargs}'"
         # There is no guest program command-line in system mode.
         assert not args.pargs
     else:
@@ -93,6 +96,8 @@ def log(output, msg):
             f' {args.binary}'
         if args.pargs:
             cmd += f' {args.pargs}'
+        # There are no appended args in user-mode
+        assert not args.kargs
 
     log(output, "QEMU CMD: %s" % (cmd))
     inferior = subprocess.Popen(shlex.split(cmd))
-- 
2.47.3


