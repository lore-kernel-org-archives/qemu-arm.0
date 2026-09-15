Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683D5C88E77
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 20:16:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6ZZz-0006x2-UL; Tue, 15 Sep 2026 16:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZZ-0006s3-JF
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:11 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZW-0003Gs-Gm
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:09 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-485b1d2874fso46192f8f.0
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 13:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789503364; x=1790108164; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=D29PZr3H3cfpO+id91B+HGAP+7sHnoWBt0JbrktTLys=;
 b=W4V0HeWa51g4WF51GkQHEX6u0Pd6zwGdXUVV2B7dc9L/9A4Jr5E9bvYpoS6ZNoDTxt
 2gaC54Yk7LtdB9N/Nt52lrINbsnbSPlh280t75nSumaoLSfqDesRZmOpEyyIvuFi+Dbf
 8tGUMZ4J9+S+7JexbKmXfDzN+jt0Gd/d2dt7JxdcMa/DFNaAJv+3buoLBGEdlDg7cAon
 g/zpnwgDSBjPgMQJZdmrq7FzHnQUvXcAp8qWA+mPQ2NCb8C8DrXgCPoA4YJ9GEm5mHDe
 kCT1qL4VPXFX+gy/TnUneufPJDkA0m7gWH+kXyKs4UwVRf8powcw8F8GYYwsdhz5RXwS
 Xl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789503364; x=1790108164;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=D29PZr3H3cfpO+id91B+HGAP+7sHnoWBt0JbrktTLys=;
 b=Fztkb1N2/Elue4huvW1zUALCrX22sKwEcwDVTQiBJhyb9G8lL4sznjk9kQ6yMxOxTy
 KVwSNxVG1ysx0qDxi2mmT4CuUXfMRq8xfhOQJAMgWAt0YSVgp2gb8wZBspOckN2vHRF+
 TsA3aiSd2FzEuSoXNt8S/0oymLLBM+I04Ip8RFYcKBNZcPn1ijjfBlO0Di8m8MaF3IrQ
 qTyf1nakmt4+CCliBNp07wb7E6LQOF8tlbwkARXkmO/m8Oihbwqh/UY3LPL5aCLfYmAY
 HW3dcmF1v/9vidXm6LOB2pbkvHaUJju/Yd18iGW2Nvu1ZvW3uqk4ugmZvibmTAUxhIlZ
 pMng==
X-Forwarded-Encrypted: i=1;
 AKwUvBwlNylN8/frGsxrQ8pCs4bGjJxmm3zPF2hi2EYfDcfozhQj74/f/SUoc14D8DCXHcnRv1Xs8/L0Og==@nongnu.org
X-Gm-Message-State: AFuF++mQPPGU5N9XS5e8JcfJB6xW/HSA/CMTya+MEu3i7vcsBcaFKNb3
 hXUvRO9A41TA4vZWLu3A4OlT+IUqoyRL1lLl+oA86ExuJL/GST5WAY7uY1sbwF1yt6A=
X-Gm-Gg: AYBFou1ippgUM9WUbBHWdWL6Bck6sV+RAkXBSSBTU/EBo2EH3XLWj08t3o1Utu8gbsc
 VFnpRmNDfyK7uYefDCWXiY6uWto9yxr1WR28/nXMmO3eSOPEbEdTRTWPhYNS+HpGhF0/IgnN8sD
 AiVxOT2nBDLuWMT5wnontd8Y9T52LvuFBRSxOxlK4Waq5mnGeY7RpDSjixWKEjLl4HrTzCzPrAO
 ddSfjaFPsElwppIMux2jALgkZ9UdthGi3Ep0mDZ3w7KFkoSY2NCrb33A/6L4WwmLLffjO5Ec0eh
 Pr0O/613LZS0aOrCIzQpCY09GugY6FQzidAe+TtIpujwzXEapksTkls1L88l38SYfwtUNwxgSKa
 PF4k1dJGOQbnUqROyZSBiwV01a2QMzCoOycDvRq3chExWwPPiClGe1i1aYSJR2dqDhSN62OGrP1
 tkzQGKeTZa0qKiFiohJo1P7dSHDtF0/a2mEPdXcETe/51pTSw7QxMthKkLAg98UL6fgDuU+d4=
X-Received: by 2002:a05:600c:3104:b0:49b:8f5e:51fb with SMTP id
 5b1f17b1804b1-49e7d722a60mr70912635e9.3.1789503364137; 
 Tue, 15 Sep 2026 13:16:04 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e83d9057dsm18521725e9.3.2026.09.15.13.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 13:16:02 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0B4E86182C;
 Tue, 15 Sep 2026 21:16:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>, Kyle Evans <kevans@freebsd.org>,
 Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Brad Smith <brad@comstyle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH v2 04/15] configure: correctly honour --disable-containers
Date: Tue, 15 Sep 2026 21:15:49 +0100
Message-ID: <20260915201601.1207839-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915201601.1207839-1-alex.bennee@linaro.org>
References: <20260915201601.1207839-1-alex.bennee@linaro.org>
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
index cec6f18f857..7fb90d26e5c 100755
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


