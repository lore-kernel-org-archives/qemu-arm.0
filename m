Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15BBC982CC
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 15:38:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6rhy-0001lz-SZ; Wed, 16 Sep 2026 11:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6rhx-0001jz-JO
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:38:01 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6rhv-0003Mu-MJ
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:38:01 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f63546c3so784981f8f.1
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 08:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789573078; x=1790177878; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=cAgsbGsJR8UlzgK1nHztriprY/pdiSp4sfs5YZ9q3Ag=;
 b=LUlKgp6z1g1MklW6MvAv0iJnpF9xKyvGxbHNtiPaR6HsV3qoWKzmXQrDeHT3/l4wor
 XmYADrqXNtE4llrvWRIsPGfS7+MelCdgr6i/X3R3VLBX2O37fTBLDSJksEi+jaZAABiU
 FIHa/e7eoBaiWqj66wdMqYP4zJwVIFoa28NPG3ZWO+x0fqWmg/qc5XsfOqjeVF/dDMUB
 JiLoEIKxR86V3xAbYnuwQ43AS0/at2SHgt508du+mlB+DAs2wuEwVWmufood7mIqf2sN
 jWQHOYr2PKxbR4MonIQSZaozcGznyxsN9PVQmAPRjrJSAMsvEDIJwglCWRh5tZaYvq+D
 wzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789573078; x=1790177878;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=cAgsbGsJR8UlzgK1nHztriprY/pdiSp4sfs5YZ9q3Ag=;
 b=NAlLD28oVtqoqynhi2qzQmYNOw1tQkYba6gDw3r9pYlgO/1x1o0WXIPRdv02gPtOVO
 vOorOrZpz4YBKU5iNhkgaCsp6r5ADZiP8W+i+c1x/Y65/iLxedNNOCkUpQgfcNZn0CVI
 DIAQKro/2PdjDLacrZE43aZ6UfAgqu15Jpr6HVSWyIhfZWWE5nhMUYMWcB6B7X8WqJ8u
 yzAjbrRcB0tWEjnCD+6p7YlwgAdq6Vvs+0vyjfIhjpTPEFz9jleLMnzPaa2Fbrf7eENH
 fETikPua99YhRkzM5IKSybot2tGYcTk7R4y3WQWq0dJcg9Q/q3WFfmoiJzJbd4aidjdQ
 RnXw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwwMHIdgpn3JfBCWsQI4d4K+Q85MEMj5I35zlBD6AXDJBqAH3yyPG4Fi64r6Ye7esknWHeSjSO7wA==@nongnu.org
X-Gm-Message-State: AFuF++nZbmaTycYDPsCV/rkfpgQvL1hyA8JRAGbEnRAzBuMFTLd1Ijgc
 d0dplLOFz3i+LJZyWRpNTZn0UKRGTrYAza9e+UR46K2iOpqOLw/cEOXN5Rd3eR1WL6k=
X-Gm-Gg: AYBFou0xkgNJGomcb+piA7hL4u98BoI4zvJIZlRl5BtXINLxIQK+iQ1bHRzmRuerklN
 DyHm9/FUSqW2cmeOjbowk2pvcAOZ3oz3+rvvzPY3LcBYXHqqQ4Pk2v0g4tRWFhCklc9pIG+O699
 mt+tGJiaU0tSvS3HnEXxJxvpXH3kgIkNX2F9ouEVOuaLzRxSEGd6Qua0bNrdK2gaeU/ylfelrQP
 Eshk7aHd2F5MV4yN3P4j/p/8S/zt3A8opp6eyTGxh4b4SsCufjrKJzWxiSJ4QIy/mVDlpSbS5ca
 vGkh/BwWvu1D6PhpYYUZjZWN9iddnnVBE+2ur3tvD2h8s8DQbG6glMCO42PyRKa3EAd1/vQ+VWB
 bdKuMR3kJPcFVeMtNS0iVbKWfy+ec1BX9FgTdVqQFeMC5b5LVsU9RbdMgnKzXAPgFDxeUq5KjM4
 ue+7xBb/igc1cp5h0OT0Vdel5tNfPDZtSs/lynGs4o5MIrfTP9/hD6b1yLTo2QEEVjthtNMs9sG
 UX1og1rFw==
X-Received: by 2002:a5d:64c3:0:b0:487:11c3:b004 with SMTP id
 ffacd0b85a97d-48711c3b044mr1154909f8f.52.1789573077949; 
 Wed, 16 Sep 2026 08:37:57 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf27a41sm7464951f8f.18.2026.09.16.08.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 08:37:57 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2F5E861AF2;
 Wed, 16 Sep 2026 16:30:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-arm@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@kernel.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Kyle Evans <kevans@freebsd.org>,
 Eric Farman <farman@linux.ibm.com>, Brad Smith <brad@comstyle.com>,
 Fabiano Rosas <farosas@suse.de>, Helge Deller <deller@gmx.de>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v4 19/19] tests/tcg: Fix building outside of the source tree
Date: Wed, 16 Sep 2026 16:30:12 +0100
Message-ID: <20260916153013.2134555-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916153013.2134555-1-alex.bennee@linaro.org>
References: <20260916153013.2134555-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr2-x10.google.com
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Running TCG tests from a build directory that is outside of the source
tree fails with:

    [...]/qemu/tests/tcg/multiarch/libs/float_helpers.c:228:1: fatal error: opening dependency file tests/tcg/s390x-linux-user-float_convs.d: No such file or directory

This is because the build directory is not mounted into the container.
Add this mount. Do not bother with preventing overlapping mounts, they
are harmless.

Fixes: 27939ad414ca ("tests/tcg/meson.build: introduce cc_dockerfile and cc_docker_host_arch")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20260915110855.491985-1-iii@linux.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 6c675a554cf..c566820c097 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -259,7 +259,7 @@ foreach target, plan: tcg_tests
       mount = mount + ':' + mount
       here = meson.project_build_root()
       cc = [docker_wrapper, 'run', '--run-as-current-user', '--',
-            '-w', here, '-v', mount,
+            '-w', here, '-v', here + ':' + here, '-v', mount,
             'qemu/' + cc_dockerfile, plan['cc']]
       has_cc = true
     endif
-- 
2.47.3


