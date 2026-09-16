Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E204C88E5C
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 08:56:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6lOv-0007rq-Pc; Wed, 16 Sep 2026 04:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6lOo-0007kx-HX
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 04:53:51 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6lOk-0004yx-I8
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 04:53:49 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f635552aso477146f8f.2
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 01:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789548825; x=1790153625; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=mSaP61w2ef61XVdqt6Pu/Eepkm21Cmp+IAt/GQuQKG0=;
 b=Fg/okfY0qaiJwJ3j1TeYT4SxWv2X08a3YFOTn3HJCjNj5uXSseWzvyFy8H5ZKQcbIG
 Wagrv2wwr2uBsJUD57QEhZjEoxFesZpRSzkdEGCZjIHSRepmYI8pCm7Y82ZfWPKD5ICL
 5VzvfbOGb8DTNo9U75Y4jjOmIStx0VZ4CNglkU9jvZ+h+AUn2l8W9VeIOaNb47NUpHQh
 iEMWY1iXFGQIYBuPCmqxosgYlAwARPJcSO3ulkVP/sBFE5R/pLfSsuK6Sk8sY3A8/645
 kUGJI2plF7BOyJOnoSz8xQQqLRrMMdwWd78avDJXcnhqJhd7HKeOyAtXSikt93v7r2nm
 8bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789548825; x=1790153625;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mSaP61w2ef61XVdqt6Pu/Eepkm21Cmp+IAt/GQuQKG0=;
 b=Z1ueyLU9P0WSLGBeX2QvgvG/ZYPI3xGBKXw53TEvR1dBFbRhd2TlA2cSZBQw2AtcYN
 KlzTiFFQkgvI9+Iivm2f5Oa88LMBhTvZk9A7jkct3WVQWdYPGXY2PA2NjFBkOuwPcm0w
 6QNxgRZeNxKMGAJUO3fkqEEC+d3skq960yNvbtokl8JuWak4HiNxMjuNajolHuI9f7l7
 A6YxwHwliRQWT++dNAJrojQyY4Am278nAjfyNwWWyIacpwy3FJeXW3bOOCH/BC31K+u7
 mcFKxGa48bVrKFGCEk+KLWu+slovI1c6+NX3BQb6vR8gNPpwRwU/SOjA73h0k33o8NZD
 ubJQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx76yZsDIyUNsfbAT29/U1J0rstt4hyRtHxWw+tQHJt5Oao/si4+NBZTrczNa0oA8fIUWW6CJTKbg==@nongnu.org
X-Gm-Message-State: AFuF++mYUMtnM8lYHkUY5j+tgGClAxuWXfbtMKRI1A2HpVvFaWdYLqgy
 gsiPzpORiXO0g5RNPsi9FXA2fitU9jWzbsO0B25eYeiI8nOAfemVtbOyPVtsBO03dvm0ZxJbkiF
 50IYxjVc=
X-Gm-Gg: AYBFou0TTR3IoALJz/O850GC2K5crz50lSUQ23XiWsYgaqY8jnxzZnjiYm5tVzqp1Pj
 ncV118u5FiZfsxfnjE92KcIMDbRPhfvJj5QAbLvW5UBRUOgqEzkuNP1kouCVedhoR7WMrUJqXgp
 r9iWbPkXc1NEcSfny8hMsEIHAlJlvp8IR6pCFPsShx5bILIWRPG7bfeQVT/JsH6w7toosZoP51p
 06lNGw2a2kAP4MpMRIXqwz+qxDxr96ZQatB5Ehh+/Y0EuqR+cZZsroWVjnToJtmax7umDJmNJUV
 pRuG0GikwzhI6H0pEuqUBfkXakJoNqgSNNiuFtOnlzvZK2PRvfBYUMIB8rnPjtsQfYo54cMaiYP
 yIS/pKC1Y0F5BJrFDHAqqyvpNrujGKsvQ+vmXYLPBWQW5tR5ZzNu5KF2bdVw4qILJDqNoM00WnI
 RmPddgoc5GRIUKVeHyRLiT6PPLospcqhvORhLt8YCs2CJgGRjq1gMF2Isj6A3YmgIn0g4GfBY=
X-Received: by 2002:a05:6000:27cd:b0:487:d8f:27a0 with SMTP id
 ffacd0b85a97d-4870d8f282amr1158346f8f.32.1789548825145; 
 Wed, 16 Sep 2026 01:53:45 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf1fad3sm4991690f8f.12.2026.09.16.01.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 01:53:42 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D0A816182C;
 Wed, 16 Sep 2026 09:53:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Helge Deller <deller@gmx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Warner Losh <imp@bsdimp.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Song Gao <gaosong@loongson.cn>,
 Kyle Evans <kevans@freebsd.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Eric Farman <farman@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v3 04/17] configure: correctly honour --disable-containers
Date: Wed, 16 Sep 2026 09:53:27 +0100
Message-ID: <20260916085341.1692742-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916085341.1692742-1-alex.bennee@linaro.org>
References: <20260916085341.1692742-1-alex.bennee@linaro.org>
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
index 25d26376f12..86cc8d0a942 100755
--- a/configure
+++ b/configure
@@ -1398,6 +1398,7 @@ probe_target_compiler() {
   esac
 
   for host in $container_hosts; do
+    test "$use_containers" = "yes" || continue
     test "$container_command" != "" || continue
     test "$host" = "$cpu" || continue
     case $target_arch in
-- 
2.47.3


