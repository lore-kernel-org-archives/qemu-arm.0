Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F7AC982C4
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 20:17:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6Zal-0007Co-Us; Tue, 15 Sep 2026 16:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZb-0006sE-C7
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:13 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x6ZZX-0003HV-Kj
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:16:10 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912df756so1504825e9.3
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 13:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789503366; x=1790108166; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Oc6yr6zbpyTI1sBnf60D2N+15kHWjne7Pv8s7CbUCQc=;
 b=nRfvcP/Q17+u97qLF5BUbSfv+9qANozmW7G4OfaNzBH7S5NeYA6Lcxiluud/O/zr3g
 m+5seFw9hpqB8uIPPGFLntFD1zBHs0r5vWuZ9XXQ3CAafFThePyjthtKJpxEkZ19sCVz
 /BXoS5hZCysOmMZSRdmLIg8Me+w1rnZtbvkx66Zq9fagvZbrNJdJFb2CpXvSsj5bQuir
 idF0E7negfHywBzsBCUhbwByCBxCbfoHVT7/a33x1WoVxR8eY0kzmhoT7L8k0PZQsc3F
 Uz0SyLQeVBbmK0WGSIxdPYI0VJTSm/3lg8KzR8q4g3YFDcim2+0l08wJfyWK2okMBJVY
 RxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789503366; x=1790108166;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Oc6yr6zbpyTI1sBnf60D2N+15kHWjne7Pv8s7CbUCQc=;
 b=zSQVgVcfydbR8XPJtpBmZ8cic1MAgX6xg09nRjkndQD0xd2twA6+RICntoqconhCk1
 BJLXfmO6WcMpWBjiF/G5Q2Z/3bjGKLJ3yMVPdfzjrrdfTDJCrGfi9UvU8GGENLY+yK2F
 yDKCN/pTF2REQbrhF+Erf9drSwNY0YFKETT++HuC6rSrHoqu+pv4aNMSG1tVU6A/39PY
 d7S2U9zkVB7Rud/AASZvh7aB+K853zGWXd49sA4vIcsIlk2Wij8zGUDNL4LuNTc2VCcb
 52N6q6ZTCQtzCCQxeNhhw9AjNQgP5BeIFlqRy7bC8834/zdVwuhY6ZPc6Fugnsp2EJnv
 A+Iw==
X-Forwarded-Encrypted: i=1;
 AKwUvBx5WJBbMHFWljeFuORl4JbQU/zwX3s1juV3JpFkvQHE94pKr8gTEuKt8RAToXSN/UvQo7tUQuy+vQ==@nongnu.org
X-Gm-Message-State: AFuF++k2l6bl7ts6D5S7g+Ui3lq4U3ZwyXfrPitpXyJms/QQI3RyusJp
 oC0p5CVc1dLbb8on0IIJpKI1qbs07Q3KJmQkHABGNrDg+MZaL5cTNcbd2dr7Kct/g98=
X-Gm-Gg: AYBFou1LO1tqR+K8VNNGdHkjgV+y9OZl532GW3DDDv8cmgo1mBq2GylP2x/EeMnNZ0s
 GFJMsAXnzzp0iWz1eedZgUrPyERrKNYOLtkShdjQm/2IzXaTeUF8xMr5kMjoc1ZgnjwBB/MiVeV
 vDIRJDnfjj0hvJhwuEFulOAQjlmHgC8UylxaA0/gc22JLng7lgEODpfDJczJCxKory7JB06WC4Q
 Lqj5REweYt/cz49s7K0OlY3zS3tpgmD1xmq/6DSB0Fn214BexU2Z96xZB51Az+sfF/zAfhNi8z+
 4hNDMaw68tjCmVmOkNqcoBTKS1a3YZ61CtZ2N3LiB1twJD4bYt8dx7lORwOXFJBi2jZtUJ8pmk4
 b6wPaHx/d/v8Z3bmhr6inWoI+N56nRBZudR05KVINjZ8XF4B71ZoIZ8FY/Dx64qMyNHcgOnAhPF
 QzPtrzmZdT3O/q5WLq2eIb/atLPTBtOQTc84A3SDskfHo89K7zCyKzilp2GbJOSBxgg1ZVG04=
X-Received: by 2002:a05:600c:4743:b0:49c:fe46:7219 with SMTP id
 5b1f17b1804b1-49e8227fd96mr36589545e9.20.1789503366100; 
 Tue, 15 Sep 2026 13:16:06 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e83d9e77asm14611505e9.7.2026.09.15.13.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 13:16:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5F28E618C3;
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
Subject: [PATCH v2 07/15] tests/tcg: prefix meson built docker tags with qemu/
Date: Tue, 15 Sep 2026 21:15:52 +0100
Message-ID: <20260915201601.1207839-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915201601.1207839-1-alex.bennee@linaro.org>
References: <20260915201601.1207839-1-alex.bennee@linaro.org>
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

With the meson changes we now build the images directly by calling
docker.py. However the Makefile.include builds prefix all the images
with qemu/:

  # General rule for building docker images.
  docker-image-%: $(DOCKER_FILES_DIR)/%.docker
            $(call quiet-command,			\
                  DOCKER_BUILDKIT=1 $(CONTAINER_COMMAND) build \
                  $(if $(DOCKER_V),,--quiet)		\
                  $(if $(NOCACHE),--no-cache,		\
                          $(if $(DOCKER_REGISTRY),--cache-from $(DOCKER_REGISTRY)/qemu/$*)) \
                  --build-arg BUILDKIT_INLINE_CACHE=1 	\
                  $(if $(NOUSER),,			\
                          --build-arg USER=$(USER)	\
                          --build-arg UID=$(UID))		\
                  -t qemu/$* - < $< $(if $(DOCKER_V),,> /dev/null),\
                  "BUILD", $*)

So to ensure we don't end up building every container twice make sure
the naming conventions line up.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index e966774c8c2..5e2ee3e6e3f 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -217,7 +217,7 @@ foreach target, plan: tcg_tests
     image_name = 'image-' + cc_dockerfile
     has_docker = docker_host_arch_supported and docker_supported
     if cc_dockerfile not in image_targets and has_docker
-      cmd = [docker_wrapper, 'build', '-f', dockerfile, '-t', cc_dockerfile]
+      cmd = [docker_wrapper, 'build', '-f', dockerfile, '-t', 'qemu/' + cc_dockerfile]
       t = custom_target(image_name, command: cmd,
                         build_by_default: false,
                         output: 'no_output_' + image_name)
@@ -232,7 +232,7 @@ foreach target, plan: tcg_tests
       here = meson.project_build_root()
       cc = [docker_wrapper, 'run', '--run-as-current-user',
             '-w', here, '-v', mount,
-            cc_dockerfile, plan['cc']]
+            'qemu/' + cc_dockerfile, plan['cc']]
       has_cc = true
     endif
   endif
@@ -241,7 +241,7 @@ foreach target, plan: tcg_tests
   if has_cc
     summary_cc = plan['cc']
     if not cc_from_system
-      summary_cc += ' (from \'' + plan['cc_dockerfile'] + '\' container)'
+      summary_cc += ' (from \'qemu/' + plan['cc_dockerfile'] + '\' container)'
     endif
   endif
   tcg_tests_summary += {'cc for ' + target: summary_cc}
-- 
2.47.3


