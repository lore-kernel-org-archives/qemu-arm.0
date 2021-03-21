Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2457803lfg;
        Sat, 20 Mar 2021 17:18:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyr9NyQKlLqNsG7/ofyqjKhXwfO9UeX5DyeeSZdvb5JQeONlY777YkeXOTfFdkmAKstzVwK
X-Received: by 2002:a25:c503:: with SMTP id v3mr15571475ybe.397.1616285887496;
        Sat, 20 Mar 2021 17:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616285887; cv=none;
        d=google.com; s=arc-20160816;
        b=FPsRYYFlgk4PSN6Ez2mWbyFDQncvbYAoUo4nwD2ALq/4Mbews72KzBdgCgJyG//bfh
         HSA4UkXL/RMPZ+41F+J2m74SHo+PpJ40cn3zMhR48dP/oWwrt5/m+6273j4NQyROlwlS
         uSqsK4433VNGIGILcujFxF+KNB8oJdxyjzyFs8K5SbrO2z8Lde92I4dM03dwwzYk1j0M
         E+fZcnVG2pGKnICRVCtIoD+KeobAaQYd//VTT6UH3sjyqgVFYuURgsyjJ3Wda2+vO1Og
         5QAVmvSnimoCAoxaG1TCqAU+BLFca/+2eiIH7UhVYJDmIPd8thzV6ehBZ3ImzWlYunyR
         drwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=aYPwvSgnhWAsxh3hJG6v5tYsgoqFzU/vN+37ZxzRNf0=;
        b=FuWpAXqVRw0aCv0p2XpxOByNhiIITqdEPL+a4if8xT2Z0gm1WBpJWrEw/T7h0yifaG
         k7OSbi9NaFGr708gk1mjY7Sxcss0+TQN1Bl+gsgwKgs7sSETS9xry2N++OLwooGESupV
         NUF9dV2FZ5XeOT6mDBM8T7AnskvXQjBVH+o95uxcIxrS1fXCeAwlcPVrUT2zeawm1TkJ
         x0k5mNuAoDBpDwxcKBB4C7vv7/XjHC/FUGAgfCZroF7ADsNkj086yqyOULcPubHECutc
         bwrawotsnqOtqfzYRpbg86/Jrm76xV6P5L7Y6ltENV4ty63vvxTMDJ2ZKxP35EDbuk4x
         KwDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="bOu0vr/N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e198si8823484ybh.25.2021.03.20.17.18.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Mar 2021 17:18:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="bOu0vr/N";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lNlnC-0006L9-Rg
	for alex.bennee@linaro.org; Sat, 20 Mar 2021 20:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNlmS-0006Kj-3q
 for qemu-arm@nongnu.org; Sat, 20 Mar 2021 20:17:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNlmQ-0000ZZ-Fy
 for qemu-arm@nongnu.org; Sat, 20 Mar 2021 20:17:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616285837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aYPwvSgnhWAsxh3hJG6v5tYsgoqFzU/vN+37ZxzRNf0=;
 b=bOu0vr/N3M/Ew7LC8X/dQqw8UJMZ7VdcoHGAQtX1CoLU9IiPTsUdklnO8Y7lHqeZLRFpcK
 lzScWO3vCRPQobxhxbppX2enB6X5qTkFdOCyPlbILJv58CtFpCx8km3IwyWo87AOSatEfu
 BFzLOSXPLVR1XNww5+tSwM6/7wo00wc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-I2ZzHqLfNrWX-1jwRf5ATQ-1; Sat, 20 Mar 2021 20:17:14 -0400
X-MC-Unique: I2ZzHqLfNrWX-1jwRf5ATQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2F5081425A;
 Sun, 21 Mar 2021 00:17:12 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-40.bne.redhat.com [10.64.54.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28F775D9F2;
 Sun, 21 Mar 2021 00:17:08 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] configure: Improve alias attribute check
Date: Sun, 21 Mar 2021 08:17:03 +0800
Message-Id: <20210321001703.81812-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5OhKIruGQfvu

It's still possible that the wrong value is returned from the alias
of variable even if the program can be compiled without issue. This
improves the check by executing the binary to check the result.

If alias attribute can't be working properly, the @target_page in
exec-vary.c will always return zeroes when we have the following gcc
version and the combination of options "-O2 -flto=auto".

  # gcc --version
  gcc (GCC) 11.0.0 20210210 (Red Hat 11.0.0-0)

This abstracts the code from exec-vary.c and use it as indicator to
enable gcc alias attribute or not. The gcc alias attribute is disabled
for the cross-compiling case as the compiled binary isn't executable.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
v2: Disable gcc alias attribute for cross-compiling case.
    Return 0 on success from test program.
    Wrap lines of test program and improved commit log.
---
 configure | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index f7d022a5db..77d7110e5c 100755
--- a/configure
+++ b/configure
@@ -75,6 +75,7 @@ fi
 
 TMPB="qemu-conf"
 TMPC="${TMPDIR1}/${TMPB}.c"
+TMPC_B="${TMPDIR1}/${TMPB}_b.c"
 TMPO="${TMPDIR1}/${TMPB}.o"
 TMPCXX="${TMPDIR1}/${TMPB}.cxx"
 TMPE="${TMPDIR1}/${TMPB}.exe"
@@ -4878,13 +4879,27 @@ fi
 
 attralias=no
 cat > $TMPC << EOF
-int x = 1;
+static int x;
 extern const int y __attribute__((alias("x")));
-int main(void) { return 0; }
+extern int read_y(void);
+void write_x(int val);
+
+void write_x(int val) { x = val; }
+int main(void) { return (read_y() == 1) ? 0 : 1; }
 EOF
-if compile_prog "" "" ; then
-    attralias=yes
+cat > $TMPC_B << EOF
+extern const int y;
+extern void write_x(int val);
+int read_y(void);
+
+int read_y(void) { write_x(1); return y;}
+EOF
+
+TMPC+=" ${TMPC_B}"
+if compile_prog "" "" && $TMPE >/dev/null 2>/dev/null; then
+   attralias=yes
 fi
+TMPC="${TMPDIR1}/${TMPB}.c"
 
 ########################################
 # check if getauxval is available.
-- 
2.23.0

