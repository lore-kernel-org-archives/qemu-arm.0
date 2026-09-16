Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CD0C982D0
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 15:38:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6ri0-0001nr-DV; Wed, 16 Sep 2026 11:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6rhz-0001n4-Og
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:38:03 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6rhx-0003NW-JU
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 11:38:03 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49e6598dd44so6227665e9.1
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789573080; x=1790177880; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5ZkOZ2c5yMGDlE1TB5Cp+fPuQbHl7TzaWx2TA+LzciY=;
 b=QopxOg/l39ZFi7Y7rJhgSoedHKBXGrruL3bIV2NawDDnj1iftzxmLDao68w2+1xErs
 Duc2DfvQ7OJFuXc8xBpFLl5ivoup/Fbtd3M4LagFFXqmxaDZP92w4DrcbPtTFZRRY5g5
 bm1GkUnJvqDzFT3USCRYniJ4xmqKU6v8QYIJ4S14ESz1inYAwWc7aaIQnZPuN/GGpMaX
 eJzSJZBx5zxsD+VnYM3QEfuejlNorRXMlogEyBE0N8JPvLexNtbZcJO561oapfj1xeVp
 EXQqe2WsGIKHkxXy68N866PDGn3KYe1L3ga90eIlE10GZKC9V31cIVJIhTyjIYV6T+DB
 xuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789573080; x=1790177880;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5ZkOZ2c5yMGDlE1TB5Cp+fPuQbHl7TzaWx2TA+LzciY=;
 b=cznNaZYlNET8dKUt32xmgrgMPTa1m1NLF4laDCySSMheQwdIaJZU2s2SdocsVNrBY7
 71my5VS8feiHcgzkxe3W3PU5BzVSYJxyFBH/4Zxb7wA4KS8L9bDnHd62XsybdBHQptR2
 WOA4rhFu1mq60Z/OfH5uDPyuBKOeYHcXtYhaHL4YtWmgj7wDqAbW1m0i7koAJeiNGA3r
 8xKn0s2ZHw9jHxCtzCu0SyybbT3JAqV+zjYEky57VYtWK4sFI8Uk4S46osI7bNoUe3Ha
 xoZ3Qo8eypXfOyQlkQ3dibOH00avB3RwneEVb7mgXyveQJZ4I7EGJJ1BMgsQF20Na/02
 452w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwKf+1zbixIaF8AnRkNcPNLb7JWuIDIBzCRPuGhYEPWXJ2orAVQpofCqsKpB8RdPVQ32/ncpLtczQ==@nongnu.org
X-Gm-Message-State: AFuF++nqZ0p2XAM5c7BKOpkynOIlCA+uOi8fsFQgNESbfA9JjskPXZGd
 WPn7yqQ224vt1LmN5QnR44vxsurofOWZAvy5iSNJ+h48nRWQASIYuPcISn9mU0tIkzw=
X-Gm-Gg: AYBFou11d0JYUkqCzEkOJi1nLcFHUzlBGVAc1MpXamkjehhzkCN+1WTuVq6lIc46CHV
 9xbJHQTnm8+K99i97M8cFT2sHqVR3gCJdHjsP4wKsWQIuHteeCmdBb2BRbRTafrD3PgXDXOM/Mc
 WmUdKlBpZ/PFkzjZanESW29Vu4PZ+tBYlXadXiQec8kQIG127mKcVf81PThGtCpDL44Ibdi+6Ka
 fwvAFbR1RqHAK3xF6AOYWr0me0JehW/foYEF8Ih0/kyMhb8aGN9DVNnTjPaRBtSnjVxyvhWmkzn
 JiSmMsFmIdSivSQTpQNIvzjfNVujFi+Oc5BUmQzdY9c15Thfof+B2l4rQuETbEAb/81LAv77PUD
 BTS8iDJmLORQP6ul7+7lc/byGJ3CT4lTnvZDFhUPvnT/imub9dU0ifmnPBJe8QnkN9vdvxTzgU3
 Uxr93gJsJpKnBvQ6GYMKDArM5ITVrP3kyKre9a7ePiQtIBXcu9Ph68RsKYZR/wIdrW7Z5EPao=
X-Received: by 2002:a05:600c:1d25:b0:49e:7c8c:361d with SMTP id
 5b1f17b1804b1-49fbd1ddf87mr245265e9.22.1789573079668; 
 Wed, 16 Sep 2026 08:37:59 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd1b0e9bsm585365e9.9.2026.09.16.08.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 08:37:57 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 156E961AE2;
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
Subject: [PATCH v4 18/19] tests/tcg: add console property to docker image
 custom target
Date: Wed, 16 Sep 2026 16:30:11 +0100
Message-ID: <20260916153013.2134555-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916153013.2134555-1-alex.bennee@linaro.org>
References: <20260916153013.2134555-1-alex.bennee@linaro.org>
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

According to the meson docs this serialises the target in a special
"console" pool which also disables the buffering of stdout. This helps
avoid the appearance of a massive stall when a docker image is built.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 80205f6f98a..6c675a554cf 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -247,6 +247,7 @@ foreach target, plan: tcg_tests
       endif
       t = custom_target(image_name, command: cmd,
                         build_by_default: false,
+                        console: true,
                         output: 'no_output_' + image_name)
       image_targets += {cc_dockerfile: t}
     endif
-- 
2.47.3


