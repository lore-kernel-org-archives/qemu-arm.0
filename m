Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1183C982C4
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 15:32:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6ran-0002BN-H5; Wed, 16 Sep 2026 11:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6rac-00025H-CH
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:30:26 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6raZ-0001NE-O4
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:30:25 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-485b1d2874fso359405f8f.0
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 08:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789572622; x=1790177422; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7FptWd5Jg1/aZvBoGje7ZffIe7jR1suwzb5Czmj9/aE=;
 b=hwZ91cCz2N9uNeiRNPrY2F6lCfoolTl7/XprI4NmDK98wVkupIS5IB3GS1NrZWSi+C
 G0UMaYtdPtBhkLSPogTygNvohDia3wK+uZ/8AMkFWTUARNpWdOiH7TnOyM0+b6JHWj9w
 dRBT/7cJ1ButmyN1419Wmn6wKcx5m8NG6B2DXXry8rhiy9cvYapwhFx9SpdFp4Dn3oxV
 Vq9cpozVx6vD1WMJ/d3Tpm4WM/WRpIy0w9o1uf9HkWNsdrnCcu8iX24By/V2HpsKE0OG
 4gtwR/numxei1UnGwaJ0SXDSfq1njX/yrtkc+nWnmySm3FhakqNbhR6xvQtKwSzqyuRG
 1gDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789572622; x=1790177422;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=7FptWd5Jg1/aZvBoGje7ZffIe7jR1suwzb5Czmj9/aE=;
 b=v38Is4g1ZqUB3u/ryyBh2+aOtXdZ7dzA9SOKMkDLE4xaHU5H5lhEXTPRmSnLKTnafF
 Vmv6iW2yydOg4ECI6EkoTWYWENci9GSCjAzcKETnbErMqxmOtmF8S+Pnqy7HoNGpDqBx
 iT+LKQDiE8bl05EXpk281CyW5Mx6mM5ZabhLrNfsFvRSS+B6BK1vI1HLTjGf+djRvTG4
 FbvcoRGP0da9/+kOKhVqAWG9h+DEis2dxT+fUx+rKMgsSNOrXXFPfTwd5+5QOxYLM320
 Itdnra2SejbW3C3gOshybOtpnugF2GIMub2hbqP4KMq/CS/5/j2uNycEKmlF78OmLvlZ
 zKqg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxiGk4WIW717tL2C8CKxHt8VMHlZfY3bLGZQZeOC72SIgsz7pWISOxjJuYZIqUM4fjyt+bKmNZxVQ==@nongnu.org
X-Gm-Message-State: AFuF++nxBXyu053zuJqGMV1yFaYy101uBcAm4qVR0gkJ0nfw26Vr+ULL
 8JkFoiTwZ4U+0drBww0cHr3on0VEy/ye4i11CBQ1w4U+kTLjWbdoGE4tb5XF/b/d/28=
X-Gm-Gg: AYBFou29hvIxjSGrRUfZiM06/+n2BFhb3hu326xlmWTed+ErnWGBM2yn+Xie6iUWg6s
 KqvIQ/0iCyXr1uqKjDYx/c5XcyZn1lDsK4X3gc8ntA+YvsmCDaRJ6yBwdaG/10tLWoYE72AM58j
 NEfuDLy7mpkl62AMsi9VWmCfE+26oA8Zoyx/qvtqH8J8zXK6zeNSd6M/SevIzsC9WRbSvucPRUB
 V2MwOn6KD0S8wlfJq+lxkg4m2zMgl9TcNaRWLNhoBE0kWOmOjTndMINx3Np3v9vC9NCaGa5hEFR
 zSaRrXceCUnBRJYefai70U+HCwzd6CPa5W5EwM3u40kedJ0Fbaub+n+giaddrGi02hdVuWosf1y
 GtH2XCo1wELbMIh8FOZa0SV2/hUDBETxi88WblD/MYa9jqwHR5cvwgCU5z00lC/mGlAHrQFzElB
 wnod8qWOiRoOpufQr8EivcFeX67R/29dAGnwvzKU8+KmT3izFY1i77zScvK2SwPG+bwGShWUo=
X-Received: by 2002:a05:600c:3e16:b0:49e:8222:3451 with SMTP id
 5b1f17b1804b1-49ea20b46ebmr40693715e9.14.1789572622122; 
 Wed, 16 Sep 2026 08:30:22 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd0efce2sm1100205e9.6.2026.09.16.08.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 08:30:14 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 99223618F9;
 Wed, 16 Sep 2026 16:30:13 +0100 (BST)
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
Subject: [PATCH v4 04/19] configure: correctly honour --disable-containers
Date: Wed, 16 Sep 2026 16:29:57 +0100
Message-ID: <20260916153013.2134555-5-alex.bennee@linaro.org>
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

From: Daniel P. Berrangé <berrange@redhat.com>

The configure script originally only probed for 'runc' command
in order to handle cross-compilation containers. The Makefile
under tests/docker would then probe again when used.

In order to eliminate the additional probeing, we changed
configure in commit c4ce04cfb7460d46c0262d437a7f35bb5c5fc449
to always probe for 'runc', so the result could be passed
along to tests/docker make rules.

That commit overlooked that the 'probe_target_compiler' func
was relying on '$runc' == 'no' as a proxy for the state of
the --disable-containers arg.

When we started unconditionally probing, that short cut no
longer works and we must explicitly check "$use_containers"
too.

Fixes: c4ce04cfb7460d46c0262d437a7f35bb5c5fc449
Reported-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 6084a7a065e..4c7bf406b88 100755
--- a/configure
+++ b/configure
@@ -1401,6 +1401,7 @@ probe_target_compiler() {
   esac
 
   for host in $container_hosts; do
+    test "$use_containers" = "yes" || continue
     test "$container_command" != "" || continue
     test "$host" = "$cpu" || continue
     case $target_arch in
-- 
2.47.3


