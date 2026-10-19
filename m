Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAAA606A31C
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 19:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ou+KUryA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xItAO-0000sW-MV; Mon, 19 Oct 2026 15:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xItAG-0000qG-Ex
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:36:59 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xItAC-0004kv-EE
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 15:36:55 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-48de72fc832so1883788f8f.1
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 12:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792438610; x=1793043410; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UbUrbLN/sDDEnFE7Xqo6V0rfU+vNo7qlgaeQ5BeX5TQ=;
 b=Ou+KUryACP8TQe41JIX5N3LAhWlwawHZXvoECfmrLTKgMrSIenpTl1/VO/qwtNONt+
 TTRHHCm8JejRmPyPbA20WExge7VtYJdO+VB+hDJ4yb8J6/ieaGN6cCtTpGdEH157zVxx
 9aWnCrVLHSl4IWq1bXscaC+BEwV4WQE0+EytdksZk+k82rPjSvSF49A/bmBDVmOah58U
 cl0mW6pX1pVpCEN9z+eRZ90WHs++4jp03aqwYpl6sUCDLh++tz0754iLBNgM50IMvxPt
 vhP41L298p2UOouOlpwBWlSDudLCMP1VukLcH9P3Z5KhL/ZOJAPZIIhdUBTjj8hUQa4n
 pvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792438610; x=1793043410;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UbUrbLN/sDDEnFE7Xqo6V0rfU+vNo7qlgaeQ5BeX5TQ=;
 b=IPoP8DqDwmSxD7BorDpBhGDDdT5K+oEfe1rNM1NcwPEPbHmVGCxZeDflY2xnV/snQa
 pmIgi6BviFaWdAyqamuAafErrp1LWZSsjyJF0sWIpc4MEMqyCDXlNQhKrSI0p+2pQxxo
 TO8yQYb7fCf65nvT61gcFi2bSbNdyohPZOSwyJjZb/1PwVS3kyh9agOnbUeL7ECr9UCw
 CyIQLaSIkbF45Y0DXA34mtpciMoTnS1JOxZ0MiXQtELTDEj7auVlPJgxR2TF2UFtHBLk
 +LhqeL/rh9wV940T5niFKF2h5a6+03DkQoVGeoeYp6ScddMBoOpixLUxue6KtVCOURGk
 w0kQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByVldm/ndW/fIOlH3sjE5jO5qAlAhNjTqNIV5SNie9LiQtqLAObI4h+dGaaNJwdcfcr3AOuMTbO0w==@nongnu.org
X-Gm-Message-State: AFq9FYIOGP1o+++XrBgwpRRW5pon21r/ASzjSNkaGacj7sJ2lZgsQVZ/
 gCZyvO4GX9pmdnd3v3zXf2aiFSwe6YQifwZys2/mhFKJ/MXBjh9yvoD9qYIsD2PencU=
X-Gm-Gg: AYBFou0zaP1iw03kJ42QYmzWF4BFD7e9/F6NJfLOkiI+vybwqYCiY+wbNtNjiayGnIa
 Dy/hVJV6oyCpBG2n9WEeew1rDNPq8f2QaRc6ZIjmvJH4E4aEQBKXC9WD6GB20DD3YcBAxteigaS
 zLweRVfjWNfd6ZGuwXXhHBFBChRDOaao7cuBpKIrRNviqh1AyRpaIl560VZd1zLHDmJoW8LGHgF
 xSXfFwXMxDGYh64LF1+1Dja2R3BoVj2gLnIdAqShMvXLyDXYQRQeL8ObN9Rvo65aAeTGD523ekp
 3B6aeWvw7pcXcXFKbKP8r1sM3uzXsGj53n2MMndaqDvVJMCWX+7KuljtylfP+lcYl1gTwLJ5v0/
 5KRhX2vfz1Xq+yr9iCgNPvwYy/v4QUvBs8r8nGaaGh5hWSj5vEeAG+lwSETVbfhfWRp6iOjCq+6
 sccLZIudOWnwa4XPyIrJv4AKLgGGVXj/WkzO6aG0WyjnTS/L2t383nh/4GdqKGhoZH5zlKTA==
X-Received: by 2002:a5d:6a11:0:b0:48d:e62f:db70 with SMTP id
 ffacd0b85a97d-48e07fb362fmr12832517f8f.48.1792438610459; 
 Mon, 19 Oct 2026 12:36:50 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d80f9dbsm856996f8f.19.2026.10.19.12.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 12:36:48 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D5D985FF9E;
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
Subject: [PATCH v3 18/19] tests/functional: update s390x tuxrun images
Date: Mon, 19 Oct 2026 20:27:03 +0100
Message-ID: <20261019192704.3220373-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019192704.3220373-1-alex.bennee@linaro.org>
References: <20261019192704.3220373-1-alex.bennee@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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

We now fetch the kernel from a different location to the buildroot
image itself. This is because we will want to access additional kernel
metadata in future tests.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - rewrote commit message for clarity
---
 tests/functional/s390x/test_tuxrun.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/functional/s390x/test_tuxrun.py b/tests/functional/s390x/test_tuxrun.py
index 086466af81f..8e0261e2b7f 100755
--- a/tests/functional/s390x/test_tuxrun.py
+++ b/tests/functional/s390x/test_tuxrun.py
@@ -17,11 +17,11 @@
 class TuxRunS390xTest(TuxRunBaselineTest):
 
     ASSET_S390X_KERNEL = Asset(
-        'https://storage.tuxboot.com/buildroot/20241119/s390/bzImage',
-        'ee67e91db52a2aed104a7c72b2a08987c678f8179c029626789c35d6dd0fedf1')
+        'https://storage.tuxboot.com/kernels/6.18.54/s390/bzImage',
+        '5efeb31754b211440e1595ab11355bb006fe78a2c0604ed0a8c55c4598b71aec')
     ASSET_S390X_ROOTFS = Asset(
-        'https://storage.tuxboot.com/buildroot/20241119/s390/rootfs.ext4.zst',
-        'bff7971fc2fef56372d98afe4557b82fd0a785a241e44c29b058e577ad1bbb44')
+        'https://storage.tuxboot.com/buildroot/20260924/s390/rootfs.ext4.zst',
+        '5ba18c4d18831c50a0c743990f7bdee1d3b520629d423c55b668d8fbbac9c6f5')
 
     def test_s390(self):
         self.set_machine('s390-ccw-virtio')
-- 
2.47.3


