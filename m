Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66712CA1012
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Sep 2025 08:15:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uu565-0007gK-8s; Thu, 04 Sep 2025 04:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54p-0006QP-An
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:18 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uu54N-00044d-5t
 for qemu-arm@nongnu.org; Thu, 04 Sep 2025 04:12:11 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ae1e8so921269a12.0
 for <qemu-arm@nongnu.org>; Thu, 04 Sep 2025 01:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756973505; x=1757578305; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=myCatgpniSey/NjO+dQuRIOhbIuhsJO0uetvy2+5HH0=;
 b=UaJLq9RvgqbWjXerA6qHandWRZlhvFLhFuvwqempVR4Y1VOcVp5KQ9KkRuvk+b2rdJ
 UkjtUub0ffAoegkfUbtZiVqJlRamTLe1fBsm7Hyv3mnwW5nOu0yAXEx5kyG0ULZtIzCQ
 3DQQFySDVSG+6GRspdYGPBPE8mqYSHr6AioGR86rxNhRrKGqLv8v3YRJV+2BpZ7MT9Ql
 22PQQ41YWAALoz3n93L97oz0YtEUk2xiq0AFVf3ZKsD/XAaJzoNsCfleC24L6VjJDk9o
 bsUwEHjgllV4+jMMiWX+8POR1joL6tU1pqm9Ey7h26XaDPTs1bGl4EJx/4vqYHP7mqrr
 DgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756973505; x=1757578305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=myCatgpniSey/NjO+dQuRIOhbIuhsJO0uetvy2+5HH0=;
 b=tPi7RmLSA5d9Jf0yiyd8mDhZSzS1wWwwJQ2f3ijODpJqsq4z7ec7G0emK+Yl74yza0
 r1cvfZ50u9c3Qllmk5RuYZ7Z8/zjJUK0ZcGtpkS98R9ynwqm/LbX1fD9/OafmGa6rH7B
 b5Ti10T4pINBxIa0ls2DVW2wLO7UlWnJ4S6WrohjSx0jdCIw28xMwPXwRVcTdNNeF+PP
 GYVuX8mZlcvejaGffl+yKpM7L7wH/7PJ0IUGGF2PWKUbynBCbm0oqK+9OWCOyjnKW40Q
 yRXL/3fhGDWjggwRSbRCc7AQ33krzHQ3UZgzjWjy9YTbU+JyeWDW63HjCH2xHfDbDDjr
 RCNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXo8wBOhM2HYBHd7uxByV1cGcCFyKbByHdS/nA0x90yeNtthGYu/NtIQ9HVdVFIVbZO66WqrO3cKA==@nongnu.org
X-Gm-Message-State: AOJu0YxGesgwtfjwwyYRFPdZrWFAUfvlntjlCZJ45G1PxXkGBgAFAf/X
 gsKDogs6lE/GI+7ddX6oEw7QBTEA7j7GPRdxRmLYPeR1RMI3N9btJoIUfHCjT7ifkdQ=
X-Gm-Gg: ASbGncsvwlbg0Chr3QsR+OL7VfbX2QZuAh/tkbk2ff4zr85WnUB8YdotlEhZAFaHs0S
 wixA6/tkj9HfCMibICvuuzQbqeCtnnAqX5BKYVtxDWLP3svxZGc7yevlAGoEh0xi4cgtimToz5h
 jkls4bnjnKU7rtt1diGhF6mQnofUdmV3JzWAS3FrzS6VTJROOoKxeZi8U6Zr1k+HXniWjNqdg4M
 hJVm/hB11JG6bEHLOFKjOJa8rszJ4c4TTP6Ds+twwPMUdtphYVJPJV3H5xSBB+n2AdUrqbaYqW0
 UL25N9CK84EgM+yNtGoLlrs6WftyEPSOhIzI2kDFX4iVzSNTBv2RLOG/APrLNdK37TFKedYMAtq
 tlNqoxBIuJDQg0TfDyMyGYCE=
X-Google-Smtp-Source: AGHT+IEuyqOsBrzLCtRtz3ZGL3L8oWSxERikJvSzK/DjrCCbhnw6SHIARMpI8FBk99Mc9QXgkRKGxw==
X-Received: by 2002:a05:6402:1d53:b0:61e:ae59:5ef9 with SMTP id
 4fb4d7f45d1cf-61eae597472mr9312473a12.11.1756973505168; 
 Thu, 04 Sep 2025 01:11:45 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc579ba9sm13465044a12.52.2025.09.04.01.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 01:11:43 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 16B025FA31;
 Thu, 04 Sep 2025 09:11:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Helge Deller <deller@gmx.de>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-rust@nongnu.org, Bibo Mao <maobibo@loongson.cn>,
 qemu-riscv@nongnu.org, Thanos Makatos <thanos.makatos@nutanix.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Riku Voipio <riku.voipio@iki.fi>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, devel@lists.libvirt.org,
 Mads Ynddal <mads@ynddal.dk>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Peter Xu <peterx@redhat.com>, Jason Herne <jjherne@linux.ibm.com>,
 Michael Rolnik <mrolnik@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Kostiantyn Kostiuk <kkostiuk@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Warner Losh <imp@bsdimp.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Chinmay Rath <rathc@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Song Gao <gaosong@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Michael Roth <michael.roth@amd.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, John Levon <john.levon@nutanix.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 016/281] tests/functional/meson.build: Allow tests to
 reside in subfolders
Date: Thu,  4 Sep 2025 09:06:50 +0100
Message-ID: <20250904081128.1942269-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250904081128.1942269-1-alex.bennee@linaro.org>
References: <20250904081128.1942269-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
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

From: Thomas Huth <thuth@redhat.com>

We are going to move target-specific tests to subfolders that are
named after the target (and generic tests will be put into a "generic"
folder), so prepare the meson.build file to allow such locations, too.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20250819112403.432587-5-thuth@redhat.com>
---
 tests/functional/meson.build | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/functional/meson.build b/tests/functional/meson.build
index 356aad12dee..8c24ac1cc2d 100644
--- a/tests/functional/meson.build
+++ b/tests/functional/meson.build
@@ -423,7 +423,13 @@ foreach speed : ['quick', 'thorough']
 
     foreach test : target_tests
       testname = '@0@-@1@'.format(target_base, test)
-      testfile = 'test_' + test + '.py'
+      if fs.exists('test_' + test + '.py')
+        testfile = 'test_' + test + '.py'
+      elif fs.exists('generic' / 'test_' + test + '.py')
+        testfile = 'generic' / 'test_' + test + '.py'
+      else
+        testfile = target_base / 'test_' + test + '.py'
+      endif
       testpath = meson.current_source_dir() / testfile
       teststamp = testname + '.tstamp'
       test_precache_env = environment()
-- 
2.47.2


