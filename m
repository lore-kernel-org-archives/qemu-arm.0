Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93A5C88E5C
	for <qemu-arm@archiver.kernel.org>; Wed, 16 Sep 2026 08:55:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6lP8-00089b-HG; Wed, 16 Sep 2026 04:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6lP6-00086K-Pl
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 04:54:08 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6lP5-000534-4d
 for qemu-arm@nongnu.org; Wed, 16 Sep 2026 04:54:08 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6350f91so334779f8f.1
 for <qemu-arm@nongnu.org>; Wed, 16 Sep 2026 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789548836; x=1790153636; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=wmW/Q26iQQbJTF6ctnQiMypy9sc56eqF6OAXKZ20AB0=;
 b=Byl3JbAQFBpfpw9kkMjGtxKu0MyyxeDJ7MpRrMOgzYREd5orbDSBlY761fSCmNfovF
 gCCpNyXPHipTV7iVjx1E4/dCgSiXDkuNV0gibk+bM6LftALSfbiTwvt63cvlQpKMuchg
 xHLQ6/8ByCvZ0mUkjvpL0ByUgKbz7tuLUt2JO7g0VZTrMn5n0WLQExRbtTVv5QoVvdNE
 5FF9/hpKeKkzbsItrjh9rq0LieQ7hkzmKWrDEVLy4/FqJqYnBg9ikncre9/9Vbf6yV7S
 CF7nYnYyE4g1Sjq1UOgPWZkFeLKSyU8mscZEEMl/H/EFzT+hkqjLodjAU8YxupvqLuj9
 xIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789548836; x=1790153636;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wmW/Q26iQQbJTF6ctnQiMypy9sc56eqF6OAXKZ20AB0=;
 b=Wy95+oSCLY76n5zSZSw6f00mey6alxdLOV4YBQjBymwGG7mcRRhGhaEbimQC1NIjWS
 +0CrWpuWLCMrsX/gnzLoFZq46p2RcEYB5MsAAhJ+4bBdItZ+0tuO03PkIt4zA+ujRIR1
 0fgDUPNoYQP9Dgj/7Nc2+ZpC4sW6Ja4hA1KY2N/lbiDPyO+r5X605NUgG1+fYmD36ZNF
 0bJYGInKZ1FXrzUsd+g8vKSHF6QrHixY6UNE9YNoHtG0pD21P8/O+zsrhFBgo7f0AaKm
 xnODPnJfaS4W8+HOq52lF3gspO4PA5SiPa5mSWitnXpOedeTDmciZIpkTMcqupKH7MeV
 LnJg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxtLWKS2ptkm3mqsLOPktypsY5aBzrvUjWunmrV9X8Z0znS2qzGz03/LVxoADCiubStCT1hDfnmIw==@nongnu.org
X-Gm-Message-State: AFuF++lHIbxyk2+aQJUiFvQVPrkVHYkIQcqUK1uompu01IQXgEYI02gE
 8QAgsbMIc7keYKSjFpbhx8jCKfqucmvIX0HR3K26IEg0EZqNr4x6gXN+wxRLZ7bckq8=
X-Gm-Gg: AYBFou3NpIcJRGg9Lu39nRBseiR51eN6eDpu3RJEfEkVebDtdWWppwfeHxp40+6jFh3
 6GZEx8YgjGpo1GU/TvXgOc42VCN68Y1vvIlzS3pvzigXw4EakxU7VPSviJKKLHSxR/Ac9hkChVB
 blwmCdMpKWujkhJzjw6+RawvKawMcHVBx8VgYe4jhU6s2SfLhfG39B1rpHZtAEb3+s1D6nqYVyc
 Do68HSc79WrW3zLOFlXwASDlXKeJR+7NA/9bqQHJ/8BkE6CMq2U9hWamIcqtJu2qg45q0AIzqRE
 OKfk42dWCsE5nKIm7dASIYcfghadaAO4Jw+Acx9FxpaT1nMUM4jjkqv3DpeY41vVREwX9+aJEyC
 UH3a9jKgNiNylo8BCAD/OrvvH8dcauvxDBxBAFM8FzoSKBSTuamdrJ9gs9dU7e2x5UzuM2aAWNH
 odrqjkYE4ktKFnKjgW25exWHzm9PmbyfsoSj9pmKJfwyUk5KI2aWGW+dQumNdqwe+CAyrV/go=
X-Received: by 2002:a05:6000:490d:b0:486:f404:e833 with SMTP id
 ffacd0b85a97d-4870d16d340mr1980516f8f.44.1789548835696; 
 Wed, 16 Sep 2026 01:53:55 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf344bfsm5273051f8f.27.2026.09.16.01.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2026 01:53:51 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 44D1C61996;
 Wed, 16 Sep 2026 09:53:43 +0100 (BST)
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
Subject: [PATCH v3 17/17] tests/tcg: add console property to docker image
 custom target
Date: Wed, 16 Sep 2026 09:53:40 +0100
Message-ID: <20260916085341.1692742-18-alex.bennee@linaro.org>
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

According to the meson docs this serialises the target in a special
"console" pool which also disables the buffering of stdout. This helps
avoid the appearance of a massive stall when a docker image is built.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index 17974e4d15c..baa22e19336 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -227,6 +227,7 @@ foreach target, plan: tcg_tests
       endif
       t = custom_target(image_name, command: cmd,
                         build_by_default: false,
+                        console: true,
                         output: 'no_output_' + image_name)
       image_targets += {cc_dockerfile: t}
     endif
-- 
2.47.3


