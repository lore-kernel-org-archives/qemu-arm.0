Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q5-20020aa7cc05000000b004129baa5a94sm9361938edt.64.2022.03.15.05.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 05:12:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 635B01FFBD;
	Tue, 15 Mar 2022 12:12:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	sw@weilnetz.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aaron Larson <alarson@ddci.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	Jason Wang <jasowang@redhat.com>,
	Michael Ellerman <michael@ellerman.id.au>
Subject: [PATCH  v1 5/8] mailmap/gitdm: more fixes for bad tags and authors
Date: Tue, 15 Mar 2022 12:12:48 +0000
Message-Id: <20220315121251.2280317-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315121251.2280317-1-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sdW22NbjLCzB

I was running some historical tags for the last 10 years and got the
following warnings:

  git log --use-mailmap --numstat --since "June 2010" | ~/src/gitdm.git/gitdm -n -l 5
  alarson@ddci.com is an author name, probably not what you want
  bad utf-8 ('utf-8' codec can't decode byte 0xe4 in position 552: invalid continuation byte) in patchm skipping
  bad utf-8 ('utf-8' codec can't decode byte 0xe4 in position 342: invalid continuation byte) in patchm skipping
  michael@ozlabs.org  is an author name, probably not what you want
  Oops...funky email nicta.com.au
  bad utf-8 ('utf-8' codec can't decode byte 0xe9 in position 232: invalid continuation byte) in patchm skipping
  Oops...funky email andreas.faerber
  Grabbing changesets...done
  Processed 76422 csets from 1902 developers

The following fixes try and alleviate that although I still get a
warning for Aaron which I think is from 9743cd5736.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Aaron Larson <alarson@ddci.com>
Cc: Andreas Färber <andreas.faerber@web.de>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Michael Ellerman <michael@ellerman.id.au>

---
v2
  - added Aaron's acked by
  - dropped Peter Chubb from CC (bouncing emails)
  - used Michaels preferred coding email
  - dropped the identity map in aliases (I think gitdm still gets reported by correct)
---
 .mailmap              | 6 ++++++
 contrib/gitdm/aliases | 4 +++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 5113f55b3a..09dcd8c216 100644
--- a/.mailmap
+++ b/.mailmap
@@ -28,7 +28,11 @@ Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-71466251a162>
 malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
 
 # Corrupted Author fields
+Aaron Larson <alarson@ddci.com> alarson@ddci.com
+Andreas Färber <andreas.faerber@web.de> Andreas Färber <andreas.faerber>
+Jason Wang <jasowang@redhat.com> Jason Wang <jasowang>
 Marek Dolata <mkdolata@us.ibm.com> mkdolata@us.ibm.com <mkdolata@us.ibm.com>
+Michael Ellerman <mpe@ellerman.id.au> michael@ozlabs.org <michael@ozlabs.org>
 Nick Hudson <hnick@vmware.com> hnick@vmware.com <hnick@vmware.com>
 
 # There is also a:
@@ -70,6 +74,7 @@ Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
 # Also list preferred name forms where people have changed their
 # git author config, or had utf8/latin1 encoding issues.
 Aaron Lindsay <aaron@os.amperecomputing.com>
+Aaron Larson <alarson@ddci.com>
 Alexey Gerasimenko <x1917x@gmail.com>
 Alex Chen <alex.chen@huawei.com>
 Alex Ivanov <void@aleksoft.net>
@@ -144,6 +149,7 @@ Pan Nengyuan <pannengyuan@huawei.com>
 Pavel Dovgaluk <dovgaluk@ispras.ru>
 Pavel Dovgaluk <pavel.dovgaluk@gmail.com>
 Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
+Peter Chubb <peter.chubb@nicta.com.au>
 Peter Crosthwaite <crosthwaite.peter@gmail.com>
 Peter Crosthwaite <peter.crosthwaite@petalogix.com>
 Peter Crosthwaite <peter.crosthwaite@xilinx.com>
diff --git a/contrib/gitdm/aliases b/contrib/gitdm/aliases
index 4792413ce7..e26b00a71d 100644
--- a/contrib/gitdm/aliases
+++ b/contrib/gitdm/aliases
@@ -34,8 +34,10 @@ malc@c046a42c-6fe2-441c-8c8c-71466251a162 av1474@comtv.ru
 # canonical emails
 liq3ea@163.com liq3ea@gmail.com
 
-# some broken tags
+# some broken DCO tags
 yuval.shaia.ml.gmail.com yuval.shaia.ml@gmail.com
+jasowang jasowang@redhat.com
+nicta.com.au peter.chubb@nicta.com.au
 
 # There is also a:
 #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
-- 
2.30.2
