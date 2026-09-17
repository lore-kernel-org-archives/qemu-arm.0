Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4682C982D2
	for <qemu-arm@archiver.kernel.org>; Thu, 17 Sep 2026 16:58:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x7FQL-00008V-QO; Thu, 17 Sep 2026 12:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FPI-0007gi-1r
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:20 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x7FPF-0000gE-OG
 for qemu-arm@nongnu.org; Thu, 17 Sep 2026 12:56:19 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49cc9f581c4so4040365e9.0
 for <qemu-arm@nongnu.org>; Thu, 17 Sep 2026 09:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789664176; x=1790268976; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=JXpVphXRIh7g4WkdtW+BhWHeeKOUjgRrLGK1rEdpKSw=;
 b=hlEGm8fAtIAA4p6oF/yEGodk77r51PFj3Ja7JxlxfSwoyUtHOByySEBLOv7y8wlIT+
 5xLMROiGmxW8KBWYc19LiT1e02/tvz3HPD0qgN8hxsExM91xW6i72tGx9lCPiGNAs5Hf
 zr0ZpVgDiWfJlorfT4bJpiexgYqqxvd89MW+cqL3/m7aUcpLZYGGp/LQLiZB7kPDTqFG
 jWtMcW0Or5zJhPo/QsED+qOtKm1A1n8Av5Ici0SDTjUbCYjgnp2jQ1cMO6v/+RpjJ5za
 IzP7rnqjSZEU/xVjJf7CY6HEiWx+rZY0+/LCd7NxLaD5ABl7z/5W8q5kjLgps1IX/q9F
 8wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789664176; x=1790268976;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=JXpVphXRIh7g4WkdtW+BhWHeeKOUjgRrLGK1rEdpKSw=;
 b=fNoP4NiYgbT5lsl4b0a6jnGN2wnYRj1oXozb2STxEpQaZs/nQ3u/TIcQ0LRuplKjHQ
 TlWYX4dbrIrXrig1fGFCYjBPFwIb6K3+Yedf3MnsAJJn8z6y8GCeww3fVb341jZrtelO
 i0lRn30vM8X7wCY3FTx1IZyaE2ocamm8TGea47/6MN1+AKTCt8ZVHDD9gzDccka1wIm2
 oypPDUHlu2B2oOO7EhBeReJsxow2tRZk3O+QxbgQ34zvSX5uBzx01/PB4CTgfvW8/Cqp
 FZ2ooX4ckcNENkWuSM29Wjw/tU+m60NuqhDxq9wrhBIXXqOqfAgtldp6GSDVVX+BHSUO
 kLSg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx9tgiUs9hPn299tA3+4qbCc7e1e8FJ3lpD13NMEwzjRFdtdkalSqYDzgnNp1H3mcuUXWOio7lvVg==@nongnu.org
X-Gm-Message-State: AFuF++mAWYq1MDl5xKgn5bVuYNF/ZEAWMCMcEDpLaqf7tAnQuTA30LMe
 N/7GZN1wYEsy81fyHqi5YjKrrjW6eOfFogjv3v0xnjhKqKAu4OvuJwXSwyGzSZtZCOE=
X-Gm-Gg: AYBFou2cmN0NAjnRyDPfBJIZiDviZj3YDO+VxRaVgY63JNKmxSkb1bsIACfjBN5DuPJ
 PDfRnrwbkEZcJgyabMxq6kZkltKKOjzBTOkC2/Qvc7YIAnSFGOCE/JU/IWaSIEB87nLhI6qvKEe
 wvD2rCi2FLjrcAQoZScTi98stM+U4EV42dLNOaV3/ZgEnpV48tYLnOp1fYY6Xuvd/3WmOyKhjOT
 bPPPpmhwNi1oeymrA/S2BFpKZ3dbZAHZqY4PgedU6Hd4xQrnxoKQoSyyqrJa10jTljH5EVIxk8y
 JhsfcDLrTYxb3B34RiOVY9WI9thkwOBMQvUnepz4kKTqcK0i92n7UaGsftMRTPsxBCYVfB/UFrA
 Q52vP1d9hQgSKIPpthB7+nZTFgI/k/aQMTS2HjUOkgkHis8CanBDkW4XG/YMSzlJbg7B8uu3SfU
 kETDsBgHStRPO1OFZ+ES2DPfb2+qXvYB6rZ8Et0GHJfSSC18I98EFhjUJEGD7yud9jJH1Qb6M=
X-Received: by 2002:a05:600c:1554:b0:49f:c1fd:60e1 with SMTP id
 5b1f17b1804b1-49fc1fd60e5mr26624315e9.15.1789664175949; 
 Thu, 17 Sep 2026 09:56:15 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fc4855b92sm257955e9.3.2026.09.17.09.56.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 09:56:06 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7077F5FA18;
 Thu, 17 Sep 2026 17:56:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 Brad Smith <brad@comstyle.com>, Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v5 03/17] configure: correctly honour --disable-containers
Date: Thu, 17 Sep 2026 17:55:47 +0100
Message-ID: <20260917165602.3405537-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917165602.3405537-1-alex.bennee@linaro.org>
References: <20260917165602.3405537-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm2-x10.google.com
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
index 8f8fec4efc8..04e312a111a 100755
--- a/configure
+++ b/configure
@@ -1397,6 +1397,7 @@ probe_target_compiler() {
   esac
 
   for host in $container_hosts; do
+    test "$use_containers" = "yes" || continue
     test "$container_command" != "" || continue
     test "$host" = "$cpu" || continue
     case $target_arch in
-- 
2.47.3


