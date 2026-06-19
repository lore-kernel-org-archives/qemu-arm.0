Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68080CD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 15:59:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wabad-0007IH-Kp; Fri, 19 Jun 2026 11:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wabab-0007GT-Qt
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 11:57:05 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wabaa-0001Gp-2i
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 11:57:05 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so17197195e9.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 08:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781884622; x=1782489422; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VCz4sdZQwmVpN1Dl6excqHvfLCyZpHsFpGHRrAYjgDQ=;
 b=BUE7Yx3nzTNIZNRF1y8JZ5G7kLJ/pOUOeynv1lf3QtFl4CT7PrpxMRLTa5bj3wM8G8
 ktxmCJ013c+aZx1P84WRwKv/NZzKLBbLSm7SfIQX0FEqj/79e9rju5Z0GzLcVNNPluMC
 yh2t7dW5Qs0JLquenN0IAtdsQxu2n6OOAIcgUVumVA3URjgG3aFn/afSfRILz5Axtylf
 TjkW0rqmieoacJSsM4ITuHIxgGGL3fsX7AdnOwSEQ15GbS/2T8AstBxEHxQTrqAnId8U
 wQX7jMiNQTBy35FXDxAccvArB3QlyOwrONrWHQY3G3GQ3z76V7ZMkqHq+7TzNOBFQXJa
 1wHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781884622; x=1782489422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VCz4sdZQwmVpN1Dl6excqHvfLCyZpHsFpGHRrAYjgDQ=;
 b=b4MLWWZw/VAu71I/MGPgiGFuh5wfw7sn+zGYEvzUQ0RaI3lJJ5T/rlhplEU7mn1eek
 hxoX7FjTtfDMFs8Nt2vh3ZdwAb8qmSNCQ2OyreEA/DYsz+N4g9q5V3Esz12T6q+Uvxky
 q8NZsbhY2UlyJaLV0qfvZhSSZXGwlZTAH4IN2OP3WhaMcbMvol69mT6xGXSSbS9Hdd9e
 zAezdpLc5N7TySN3uyp+JADzIBv/FUzc2CR7dkfbDc7jMWqnv+Cs4p+5EGU1CFzqLo6P
 MFTvQQnlUA12/njwGFkUlvz3CX9+/eiljQvSF/ZG/JMOvfPbsuK/8tChkd7lOfikOWLn
 DgDQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8U6twb23Us4lmVJlNPUp7GaZc9yTSlG0rclctXsSfzEu7Rshhhv780JXLlH/GQRdFv/h4EtT9Wtg==@nongnu.org
X-Gm-Message-State: AOJu0YyCXZytYp/CxuXAEfiXPfolYzV3vZnSLls6nXQ7NmqVROFzSHbT
 eAvL6iTQKx+IFFTg5TVAJ8dBrfIj5z+EhrS1V/4Isn82ZGqdgo++OujeX0djeTO1Gpc=
X-Gm-Gg: AfdE7cnUfVWP+o6SGL+ea1Me40W3ZKmUxKeZATGu4V5CPm3BfpGpj1kO2zyWavSrqmk
 MACMsgDA02iIhXfSgO+2gmiPnh2MziBz/bkytSYtQvS7W3y7ERTXtcc7eJJYNOdfSCE4D9o/f2d
 RjyZVgH7voKJsjIpGSXTUEBdKF1l3knV4lCCdjJvojiXC7b4QRwrXqBI82jtVw/QNqi/EigM6Ah
 5wsRRiHRiI0/+CgyyOwz95VN1NdjvEyQxR4ib4ktL8dIdYPirSXv7qWXQTUtl9QzIq+vGmMXZQB
 DtdwGX7bNDG1qqNVFQypgljr4tQACNxQ9gxaFO+3j78vwowa0mO39Sfc3vxIncx9Tah+Vuv3t8v
 7BbEiPDY+EswZcWnOhrwwPwhZbyG9LNghtxc6wi+sk+qVKoUtqkqVy39HJGaD2xI/oofQiTefIn
 BH/cIqpxiKz7Ax
X-Received: by 2002:a05:600d:6451:20b0:492:3fb1:e9b8 with SMTP id
 5b1f17b1804b1-4923fb1f003mr57936225e9.12.1781884622337; 
 Fri, 19 Jun 2026 08:57:02 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fcb6db0sm57766545e9.0.2026.06.19.08.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 08:56:58 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 505CE5F814;
 Fri, 19 Jun 2026 16:56:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 John Snow <jsnow@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>,
 Cleber Rosa <crosa@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Subject: [PATCH 0/7] testing/next: python, pylint, gitlab update
Date: Fri, 19 Jun 2026 16:56:49 +0100
Message-ID: <20260619155657.944220-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

Most of this stuff is already reviewed but I've done a quick sweep for
other patches for a potential PR on Monday assuming I get a clean CI.

Alex.

Alex Bennée (5):
  python/qemu: split arg between base and harness lists
  python/qemu: split console from harness args
  python/qemu: dump a developer friendly version of cmdline to logs
  tests/functional: tell pylint not to check c-modules
  gitlab: remove build target hacks

Daniel P. Berrangé (2):
  gitlab: ensure "check-XXX' jobs capture functional test logs
  gitlab: update bug template for sec issues & tool assistance

 .gitlab-ci.d/buildtest-template.yml | 18 +++++++++---------
 .gitlab-ci.d/macos.yml              |  7 ++-----
 .gitlab/issue_templates/bug.md      | 11 +++++++++--
 python/qemu/machine/machine.py      | 29 ++++++++++++++++++++++++-----
 tests/functional/pylintrc           |  1 +
 5 files changed, 45 insertions(+), 21 deletions(-)

-- 
2.47.3


