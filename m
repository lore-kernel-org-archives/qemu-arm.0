Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DC4CD5BB1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 11:04:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRpZ6-0002iH-Mp; Tue, 26 May 2026 07:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYq-0002bG-7z
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:03:00 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wRpYl-00069P-Qh
 for qemu-arm@nongnu.org; Tue, 26 May 2026 07:02:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-490426d72f7so37494675e9.3
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 04:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779793373; x=1780398173; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wVKvvcFZA7qeNP1zeIYLgBVKsLe8igaQLT3KMhNnesE=;
 b=ts/5J7rPkqtqjA81NzA4BrnBkCvsmQshMT1uCBqbjL+mmHQ+FvG4mcL+TtD5/MFEiW
 2d2HHhT9GOm5Wr3Tp8P0eX/pwMlKvIVXN09mI/G+t0J38uFHuuZ1iYD7AtKG/uDutCeb
 /Hl5kUJY41w3XsB5iYLh9DCwui+dT8Wa0KI9qOkHwCr2V1iiJN8RSF1zLhSz0iHr3MyL
 Q+0JyKqLHyloXc4cS1ZABaFayTzitbQuOVg7kn4rFXTonBzCx14L4nPM6tJnQ030GNqD
 dsbanrGj6aUG3kwcRgWZP2jwgKJlLprmYetYLZCSPffwkwgo1dCtnHRr2zmrsglaG3Mv
 B4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779793373; x=1780398173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wVKvvcFZA7qeNP1zeIYLgBVKsLe8igaQLT3KMhNnesE=;
 b=iWAUZQ0WalRi0tSZhh+R4nyzhl2K+rtOnjFNGzOdbL77KHHRllbsujRtRXl8uWbZUJ
 psCjNVTzaIyFXdfw0xO7O5EMgXsb9XihDRXyfg/+eCxmtCBDxm+/7QxjyvacLlOPEEdb
 EQlofyeixuuNWfuPvk7D09IC7Cuf//wEE8CJuEs/K0X9o5TMPQwnsI8So325fAz0XhRM
 4g9CumgAz24dgDlgcjAx4A93ErVlQiQM78CF+sOsEkchc1nKJrvc9f7TTTLul+yjrdNm
 LWMJ5b3eel8atj0ageI1hFVuxkYGBmQcUNh+nbhvvjKdKuv3yBiXrqM3MxSnRgddKbiI
 zKNw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/7dz4Ph5x3FC7EsPVtfK35+RVOlH2QPiCm9GcjH++hw6upfzc4LhJzBfY9Ixlj5gDuaSUBxTnBRA==@nongnu.org
X-Gm-Message-State: AOJu0Yyk7bvKjZoWEXad1Vx3pUZ0fVgZUhPDbrhWjbQlqqVKIeDfyZSk
 4wDmaYoGkclndcrlF0Mpe+CsYxIN5D68VlVCkyV2NBebSxG1pc488yQomzJcDHrNXIk=
X-Gm-Gg: Acq92OEB3nE2o7GdUgsPJvq0jAsvOyvNo/trWciPcGPf2plVhbwJ6/DRgogYPktckiD
 HGrp77Di2SbaV3pQ6L5UPitTDR1bKT7lAoY81eHFy/7D3ariVW1ZLknQE63KmPuFBZamaQwLdTI
 TRisRUxH+N3+fYtAG+xfXSIYTbzSW6Co+ad0gFRXtDpSq5tWB4Ug3cislWfz2ON0o1u95c8+t/A
 PIJ38+a4g/iYlgFgKy9g0j7xc71V+mjIQZfbbk8Gpt0K8i3S0bTOvMHNMcqxRRveP5ANEFB0ZLl
 8xah6g7I2DmNqfuD+AsvAjSVDRbo+d8/P/AZRUw5hZsOo6M2reWIjg/K6iu5RDSap74p7C2XDSu
 HMfpeXjHocgGYntaHvRoAc9/EDT8q2V/OoHYJHSKNxxP7lmppg29VmZ51MxiEpzd8WWM7y4fmrm
 Q/esOPj3M+pzZJeJIfe7yHG3U=
X-Received: by 2002:a05:600c:a402:b0:490:3d62:eb0 with SMTP id
 5b1f17b1804b1-490426d7019mr248024605e9.24.1779793373391; 
 Tue, 26 May 2026 04:02:53 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d5cb9asm37363433f8f.27.2026.05.26.04.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 04:02:51 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C3A81604B4;
 Tue, 26 May 2026 12:02:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Kyle Evans <kevans@freebsd.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Subject: [PATCH v3 13/14] MAINTAINERS: Cover debian-tricore-cross.docker with
 TriCore section
Date: Tue, 26 May 2026 12:02:41 +0100
Message-ID: <20260526110243.470002-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526110243.470002-1-alex.bennee@linaro.org>
References: <20260526110243.470002-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Message-ID: <20260518102222.80735-5-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a534f91e87a..08363ab5449 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -458,6 +458,7 @@ S: Orphan
 F: target/tricore/
 F: hw/tricore/
 F: include/hw/tricore/
+F: tests/docker/dockerfiles/debian-tricore-cross.docker
 F: tests/tcg/tricore/
 
 Multiarch Linux User Tests
-- 
2.47.3


