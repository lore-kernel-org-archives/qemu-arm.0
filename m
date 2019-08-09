Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9358691wrv;
        Fri, 9 Aug 2019 08:43:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyi27KTkR/EhNHSIkRtb4we1nkhMaH8xN5g5A2L8UEJ68mIabjgVot//b7D9ppqEq4IC41W
X-Received: by 2002:a17:906:80da:: with SMTP id a26mr3881638ejx.222.1565365411999;
        Fri, 09 Aug 2019 08:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565365411; cv=none;
        d=google.com; s=arc-20160816;
        b=j3729/lCFg31XK2UgR7yFdOAP4cjWJvpiZpHlOEPCozlQikN9/U1lVObHOOhX1/QLN
         kb0j0wCj3iR064xZX8bp4zZPzGEpEKbfZuFc7ImZjOnx0mAYdn2TWD5NM+Obfb9bslwp
         SRbwEGg+hKtNIVuRcUzAA+jbGBelmSy6m/5uq6SRxoxgZXLGPfgPi3/mApp6WZ+twMsF
         7ik5I5rokFmRneDIBKJX6/45I/Elk1ug/aQ98tfDqOt/Z+DwLBQBz8eJSssAi0LuvCRQ
         MKG7hXeRnD5O9h1r2Vi/noy33L9+hhYqNbuKSxgUWsxUcWwcN4maiwMN1GI+ENgJ4uc9
         YMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=leHpSxHzVUfQCq35SXdIhrfSJv5bGUxlfMEN59fKGs8=;
        b=dfaEVKs9MaalcrFbi9WlXWivpV6ujVj80jwAJWt9wh19ZFdqAQuT8AWdqsx/h5cSYP
         dU/3cfinRZ6/b7IoCB4MtirlRZI+YIyoK3YnOm35l6N9jwagm778TDrYItiSp4TWXvp/
         EZN7AbY+v/xJEJgQ6v4H2SJqmNMZjD6AzR4utYnBf9dOlzShLcY3MSov/lnOzQG1TURU
         fTwv2Jr6lRssMY0u3y/c1y+/nhBeRWybvBMw/+kEUjXZUheal0CBkDjWeR5F/xKCOtRz
         8mHMSgAs/rjmqWtFAyLPFDLZy5SFSRuZEvWf2tr9CvPhcNnc3319mzT9ba3+98JC0TrM
         E/Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R+x9JWNG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s25si33701445eja.243.2019.08.09.08.43.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 08:43:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R+x9JWNG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw73D-0002Hj-41
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 11:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50813)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hw71p-0000eR-5y
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 11:42:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hw71n-0008Ur-Lj
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 11:42:05 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42660)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hw71l-0008RA-LP
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 11:42:03 -0400
Received: by mail-pl1-x644.google.com with SMTP id ay6so45162176plb.9
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 08:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=leHpSxHzVUfQCq35SXdIhrfSJv5bGUxlfMEN59fKGs8=;
 b=R+x9JWNGRCUyPT9qY3gVRkx/94Jp2YtcuNACFzBuhhxhqF95so80+Jb8LzC7mqvsLE
 PC1JIijvAdAWGOxKse6YwXT0dF8oVgKkcY4NyvZYiY9uV7qkFrkRJh6qZcs7DHqC/Hrw
 DZohBIcvGacA/E0rBf7QTEmwaq9UQlQEF7IYM/eUVmlgtqPtgnV2gPIu+UZsGPtIQ3HT
 +iZ27v7taX0V46y2bXnJWuseXxxFPGoozjGC3faiJmbLMWbH9eGtJ6tMM1X2qCp2ii7x
 +AWyzWzDTHpxRPIEDUXvlKn5rPoOeMXZeDR332BiSIOBsgiC2Y4k3d862xbmCtgufaJk
 clnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=leHpSxHzVUfQCq35SXdIhrfSJv5bGUxlfMEN59fKGs8=;
 b=XACmY2iLAFVN/3uIEf8A7vIXA4zTlWCtRy3BP/e8mBWf7AtV2vPM9+7UUF8wAwsJ1l
 ULOE5n5KZooI4mll3UW+Tcb8EQ5fgApV2E5K23edVbVQv+/Dc/jYprJ2qiyboMAslb63
 4tfJ0uEjnyCR6naaY6CNXqtCnFWPTnzxYDHjt+prUSjtwIbn9sJ+9Ph1+k3cfvOXHa4n
 B38AEkfRdlP0/TJ8w6XrypVKUOTGHm7GOXga+dOkifUd2umm1SzmYeR3epHCjn/9pkf3
 6xv/zZPwCF2FaX7Fj9yT6FGsd5LWUzxN3aSGKgsxy1XjHWcG070bJZxpl1qGUpPjRZcw
 2PqQ==
X-Gm-Message-State: APjAAAWp9oP7yaL16o5vrlTWsd26P8ULuwLNKHkV1UgJgHNsoS1uhcRM
 Q6jxaAfZaM3fgDFZGW79qVYl0OW0bgI=
X-Received: by 2002:a17:902:7d86:: with SMTP id
 a6mr19609862plm.199.1565365318747; 
 Fri, 09 Aug 2019 08:41:58 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id 67sm80452179pfd.177.2019.08.09.08.41.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 08:41:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  9 Aug 2019 08:41:52 -0700
Message-Id: <20190809154153.31763-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190809154153.31763-1-richard.henderson@linaro.org>
References: <20190809154153.31763-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-devel] [PATCH 2/3] decodetree: Suppress redundant declaration
 warnings
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Alistair.Francis@wdc.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: leBLu92A6WKB

We can tell that a decodetree input file is "secondary" when it
uses an argument set marked "!extern".  This indicates that at
least one of the insn translation functions will have already
been declared by the "primary" input file, but given only the
secondary we cannot tell which.

Avoid redundant declaration warnings by suppressing them with pragmas.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 scripts/decodetree.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index a2490aeb74..f02c8acca1 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -33,6 +33,7 @@ arguments = {}
 formats = {}
 patterns = []
 allpatterns = []
+anyextern = False
 
 translate_prefix = 'trans'
 translate_scope = 'static '
@@ -485,12 +486,14 @@ def parse_arguments(lineno, name, toks):
     """Parse one argument set from TOKS at LINENO"""
     global arguments
     global re_ident
+    global anyextern
 
     flds = []
     extern = False
     for t in toks:
         if re_fullmatch('!extern', t):
             extern = True
+            anyextern = True
             continue
         if not re_fullmatch(re_ident, t):
             error(lineno, 'invalid argument set token "{0}"'.format(t))
@@ -1191,6 +1194,7 @@ def main():
     global insnmask
     global decode_function
     global variablewidth
+    global anyextern
 
     decode_scope = 'static '
 
@@ -1251,6 +1255,19 @@ def main():
     # A single translate function can be invoked for different patterns.
     # Make sure that the argument sets are the same, and declare the
     # function only once.
+    #
+    # If we're sharing formats, we're likely also sharing trans_* functions,
+    # but we can't tell which ones.  Prevent issues from the compiler by
+    # suppressing redundant declaration warnings.
+    if anyextern:
+        output("#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE\n",
+               "# pragma GCC diagnostic push\n",
+               "# pragma GCC diagnostic ignored \"-Wredundant-decls\"\n",
+               "# ifdef __clang__\n"
+               "#  pragma GCC diagnostic ignored \"-Wtypedef-redefinition\"\n",
+               "# endif\n",
+               "#endif\n\n")
+
     out_pats = {}
     for i in allpatterns:
         if i.name in out_pats:
@@ -1262,6 +1279,11 @@ def main():
             out_pats[i.name] = i
     output('\n')
 
+    if anyextern:
+        output("#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE\n",
+               "# pragma GCC diagnostic pop\n",
+               "#endif\n\n")
+
     for n in sorted(formats.keys()):
         f = formats[n]
         f.output_extract()
-- 
2.17.1

