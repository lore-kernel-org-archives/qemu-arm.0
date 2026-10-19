Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16CE606A31E
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 19:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=V06Ow/eP
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIt2O-00020j-G5; Mon, 19 Oct 2026 15:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt14-0000W3-Ak
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:28 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xIt10-00037M-SG
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:27:26 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a1d484b4a9so32671225e9.0
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 12:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792438041; x=1793042841; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=LvwOWBSv5bjU3IQiTRgBXtkpjY1ZO4xJW05ChFwIZuI=;
 b=V06Ow/eP0YneNeTlN6sPOXzFRv5v864gEnbnqyXkAXnjhkqGQaPGi8R47L5o3Z5XvL
 QiPxZ8/YjrioeLeVonzKzdMnLZeYfuvtl0CcctWR1o4w3Gs0iX6B2e+mjnqTU8F5/3Mn
 YWcT71lX7ryUelkfkYNYd2bS61496sWhe6ZOFxTZeTY0Cf7xDdxfCn9qaoTX8ukIKYTG
 79U0jyNjlTmORp3zVBp89Vfr1rSPWeciNqUA8FXpd5nSinVdplpFQhhvxzR70EqqobQm
 qe+/oAUoAd/1woVz4LChM53n4/8N1e9I6h7jHjwL6hJFKAMVM7kt9cQyd1WmXcTSn1d/
 qd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792438041; x=1793042841;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=LvwOWBSv5bjU3IQiTRgBXtkpjY1ZO4xJW05ChFwIZuI=;
 b=wcuOVSV2FvPf8MbhxWMY/ZHnmsLkmABjXtiiU7wJFbrdTvOih4D9BL8PLIW9RUyDB2
 NpMUWRxfhEUpByCKe48N9Y52PsvOkCrN1+nhhe4XR09SjyLQuwxCxfAMJeNLUgGxVeoC
 lHE2ueSULhKESxSxGMoANQhyRx7qDgdCNwGqjJOpA0jMUxeL9SZDyOTUDJqT/zwiP3z5
 dB4HD80nrtwJ+/LG+hZQztR44JDX57UomtfB4hovCOCU3Lcvii5nR8//UkYZXZwbrQSV
 fi8hyWxjrs9tdpXLWe7WEw9AXFrTBWANMqmdAxyGtHMM/AQQfAgQwOL3svo04aMteMx7
 gQkg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxbesOsrmiXsvMhmRMoA2ZN5KScp8GAH9j9DCkrxK3tU3Q+FnTIlj+rn8BK/0IF2IXNq+/h6x182A==@nongnu.org
X-Gm-Message-State: AFq9FYJ2ar1ZCXtBluywgdBir3LO+cEMLRVDS5UsMfRkqTHrZYzcV2xm
 2HI//y/3Mgn/uK+5oTPvEyEBvIywXpQGEee4fpFwPLh8F6su2idEZ4gMXoqg/SA09+M=
X-Gm-Gg: AYBFou2XBJ2sx3bbg0ct+60n5RugQl0zwsdnR4Zds/nOrndZpa8/gofM9cvO8A5EFPG
 UiIvICuQYDJhcmKoshC6qVuc1MG8c0/P8YThf4LXYU6HVReVBYWSoWHVOY4u8mvZz7sC9+n++nh
 NnOWDbC8i+i0OZUMpzJ2zuV3OYUI4PNXoeggMtWnZ5waXRTNTM3XZAsH7q6TQa55974zZ/iqkhJ
 GiCfXzpLsBwjNEuMvn8dp8rrdhG+hGsqd5kKtDli5Th1HE7/KfJUNacXa8u/fxzJ8U3rCoJDkFf
 v60fSWv6LkkvFayju3+bK4BtXVpQf4EobCtnB4tYjN7WfXZW4eBdtw2FyUO3ozR5cWu8r/O8li0
 gh/C+swhpqXMukJnMOjELM1qOcuyDWVFk97JFA5L+HNuIVUtegvS1N6D5tX19BaYlvATqfBgpL+
 nl8YntpS045MQBAXjq8PJ6sVL6Xkfj29VB1VpM0jEwXBwBHf9ba/+iS1nAkHh1ZhmIzK9qkg==
X-Received: by 2002:a05:600c:4691:b0:4a1:ebf0:43ed with SMTP id
 5b1f17b1804b1-4a1ebf04495mr60140065e9.24.1792438041180; 
 Mon, 19 Oct 2026 12:27:21 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f2d569d4sm13621795e9.10.2026.10.19.12.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 12:27:13 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id ED7315FB54;
 Mon, 19 Oct 2026 20:27:05 +0100 (BST)
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
Subject: [PATCH v3 09/19] tests/guest-debug: convert cmd to an qemu_cmd array
Date: Mon, 19 Oct 2026 20:26:54 +0100
Message-ID: <20261019192704.3220373-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019192704.3220373-1-alex.bennee@linaro.org>
References: <20261019192704.3220373-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As with gdb_cmd passing a plain string to a subprocess involves making
sure the escaping is correct so the underlying shell doesn't get
confused. Do the same as gdb_cmd and make the whole thing an array.

There are a few minor wrinkles with when args.binary is expected so
add some comments for that.

Suggested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/guest-debug/run-test.py | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index e8b69f85cd1..d5ffaaa9ffc 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -79,27 +79,32 @@ def format_cmd(cmd):
     socket_name = os.path.join(socket_dir.name, "gdbstub.socket")
 
     # Launch QEMU with binary
+    qemu_cmd = [args.qemu]
+    if args.qargs:
+        qemu_cmd.extend(shlex.split(args.qargs))
+
     if "system" in args.qemu:
-        if args.no_suspend:
-            suspend = ''
-        else:
-            suspend = ' -S'
-        cmd = f'{args.qemu} {args.qargs} {args.binary}' \
-            f'{suspend} -gdb unix:path={socket_name},server=on'
+        # for system mode we assume qargs has set-up for binary
+        qemu_cmd.append(args.binary)
+        if not args.no_suspend:
+            qemu_cmd.append("-S")
+        qemu_cmd.extend(["-gdb", f"unix:path={socket_name},server=on"])
         # There is no guest program command-line in system mode.
         assert not args.pargs
     else:
+        qemu_cmd.append("-g")
         if args.no_suspend:
-            suspend = ',suspend=n'
+            qemu_cmd.append(f"{socket_name},suspend=n")
         else:
-            suspend = ''
-        cmd = f'{args.qemu} {args.qargs} -g {socket_name}{suspend}' \
-            f' {args.binary}'
+            qemu_cmd.append(f"{socket_name}")
+
+        # for user mode binary and args always go at the end
+        qemu_cmd.append(args.binary)
         if args.pargs:
-            cmd += f' {args.pargs}'
+            qemu_cmd.extend(shlex.split(args.pargs))
 
-    log(output, "QEMU CMD: %s" % (cmd))
-    inferior = subprocess.Popen(shlex.split(cmd))
+    log(output, "QEMU CMD: %s" % (format_cmd(qemu_cmd)))
+    inferior = subprocess.Popen(qemu_cmd)
 
     # Now launch gdb with our test and collect the result
     gdb_cmd = [args.gdb, args.binary]
-- 
2.47.3


