Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1847990lfg;
        Fri, 19 Mar 2021 21:28:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/ucGdCJyx4i/bKuUNF60/FWtfu+qZWsMxI+89OXj6qb78nzZqwItSZpYH1M7T7ZilDG0r
X-Received: by 2002:a25:6e02:: with SMTP id j2mr10795814ybc.247.1616214495130;
        Fri, 19 Mar 2021 21:28:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616214495; cv=none;
        d=google.com; s=arc-20160816;
        b=ln1w+3MfZIrMSeoS94w6OBBz6vHfL3IWZ4T0OMZbxFT+r+t6BVMlWvfPbGK9bq7kOo
         XK7CMnSN/ZWJj1dmej0MiUbY0Vt7RT2sa/ouIQsd+FhrTgkmfXWMSUKcqOw/C98acmF4
         lVR0JbUZoIhfUosPmoUq6NaRcq0tWP5w6OYBRZ4toljoctjGk+0h6dbyNC/a4LaZMQ+K
         3mQApHjGGYAu9F9dpdUTv0IvQTCwD9cc465wQP6oL0p+6bvpc2Yo7mBr1mlomQsKaPUw
         +51Atd0ADdMDZSpP9DlkE78azk0KDdswhgbAWcRlFxx/tfBp34n01xRqoqE+AxBFXp58
         msHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=STHBigC9zOUX7xxEBlmHILG8isdhRzWSAUi/7LwDKCo=;
        b=czhFSQt3DjRlE+PaI7BCusq7vHRaHkM3XyhTWHbr5tclVZWHLyr0hdrysnMugQEoIL
         SgLcQA0FUe+xwkx8IH4XnAMLqyxVHBqKmlYiI0OzXF1EaeDlChIDzDeKrueEwfqXYuEn
         etSuYKe1+gq94QgNArVg/N1Srr0eaPbF+3lJNm+RSFmb7YhRvG2iHVJGjGYYJlU16CZw
         Ujao/bfnLPKSvtatXmWZUGCYFfcwK7sXIZaNvECkNZcWwn8MM2vKxeoRYpCScHXa0AVD
         OjvXBa4K6GZi25r5caKzFNQ+zSQU3sI+nI0j15aS1k8niuE2ZeMQnV2e7O+lQpfhoL7g
         8EUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WmHpr103;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si4051594ybo.455.2021.03.19.21.28.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Mar 2021 21:28:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WmHpr103;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lNTDi-00060a-F9
	for alex.bennee@linaro.org; Sat, 20 Mar 2021 00:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNTDZ-0005yh-Ci
 for qemu-arm@nongnu.org; Sat, 20 Mar 2021 00:28:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lNTDX-0007OY-BR
 for qemu-arm@nongnu.org; Sat, 20 Mar 2021 00:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616214482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=STHBigC9zOUX7xxEBlmHILG8isdhRzWSAUi/7LwDKCo=;
 b=WmHpr103O7LJrP3P0ID7arLup0wUS9HRMMQsrGCSX+yij3jpYZDdwaG1Y1KWbgNttDJ/Uz
 zOAX2Krs7E32++drP/iDSvuu/mzDbKVBw2NsOwNrPyKpg4KD/HhnzC/9N+kQEGt3RRlTXz
 Q9RM8sBDl5RsVo2Dch5Sywic4hHMDkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-97RQvim7NAOGHLWKMdMEEg-1; Sat, 20 Mar 2021 00:28:01 -0400
X-MC-Unique: 97RQvim7NAOGHLWKMdMEEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 793C8180FCA6;
 Sat, 20 Mar 2021 04:27:59 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-40.bne.redhat.com [10.64.54.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 780991B5C2;
 Sat, 20 Mar 2021 04:27:56 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Improve alias attribute check
Date: Sat, 20 Mar 2021 12:27:53 +0800
Message-Id: <20210320042753.69297-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: r5gN8sG4Djuk

It's still possible that the wrong value is returned from the alias
of variable even if the program can be compiled without issue. This
improves the check by executing the binary to check the result.

If alias attribute can't be working properly, the @target_page in
exec-vary.c will always return zeroes when we have the following gcc
version.

  # gcc --version
  gcc (GCC) 11.0.0 20210210 (Red Hat 11.0.0-0)

This abstracts the code from exec-vary.c and use it as indicator to
enable gcc alias attribute or not.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 configure | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index f7d022a5db..8321f380d5 100755
--- a/configure
+++ b/configure
@@ -75,6 +75,7 @@ fi
 
 TMPB="qemu-conf"
 TMPC="${TMPDIR1}/${TMPB}.c"
+TMPC_B="${TMPDIR1}/${TMPB}_b.c"
 TMPO="${TMPDIR1}/${TMPB}.o"
 TMPCXX="${TMPDIR1}/${TMPB}.cxx"
 TMPE="${TMPDIR1}/${TMPB}.exe"
@@ -4878,13 +4879,38 @@ fi
 
 attralias=no
 cat > $TMPC << EOF
-int x = 1;
+static int x;
 extern const int y __attribute__((alias("x")));
-int main(void) { return 0; }
+extern int read_y(void);
+void write_x(int val);
+
+void write_x(int val)
+{
+    x = val;
+}
+
+int main(void)
+{
+    return read_y();
+}
 EOF
-if compile_prog "" "" ; then
-    attralias=yes
+cat > $TMPC_B << EOF
+extern const int y;
+extern void write_x(int val);
+int read_y(void);
+
+int read_y(void)
+{
+     write_x(1);
+     return y;
+}
+EOF
+
+TMPC+=" ${TMPC_B}"
+if compile_prog "" "" && ! $TMPE; then
+   attralias=yes
 fi
+TMPC="${TMPDIR1}/${TMPB}.c"
 
 ########################################
 # check if getauxval is available.
-- 
2.23.0

