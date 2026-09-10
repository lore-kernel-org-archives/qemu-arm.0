Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC21BC79F9F
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Sep 2026 18:15:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x4jIm-0003tP-Ht; Thu, 10 Sep 2026 14:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x4jIk-0003rx-WC
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 14:15:11 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x4jIj-000727-4p
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 14:15:10 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4858303de5dso28546f8f.2
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2026 11:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789064107; x=1789668907; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=auvQxRv/L/Tm2MzJSSlg0H26UMesvAeamwrbPdUcFpY=;
 b=o4INtrBrDy7ReVYZWfMgcPIiJ6JpSS1OwPMUlH72EaxA9K5tNfdh+NS6wpwUsquD6f
 Pa6O5krk/KwU/omMf/CDzCn49dhJDjFHfrPbt6M22xVKamcX89sIUeHRMb0LctGjh6GW
 8VItoeJeXvAtUQ4+Fz2KUvn9b/B4N6WDaeDcOquSIr0iH54qPyxk68/BPMMxBB7cqADp
 jJ4DTO2nN6L4EW2hcdf+oulVFiS/MNdIVGDj5ErWfT9gWKliy3G/jYdndZa85YpQfGjS
 LHx2qOhHng6e55G8Wj2Utxnqs87kJGPwB+xr3zL3L60YUsWNn0gh3l105O3+W9SD3N+P
 c8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789064107; x=1789668907;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=auvQxRv/L/Tm2MzJSSlg0H26UMesvAeamwrbPdUcFpY=;
 b=JF9e5gWq0yaK5gzWAIrG/ijX8YZrmRn4hhHfx/M42CfWrb3xNHS0+3JHoTH+WHvSy5
 B0G0xTm60wIgxPIFbYH7RXuuZdvv4sSI7mV6DXM4c6D1dlDnapfydkWs47uMjvbSOnU9
 g8cOmn8GrpcCP0Ye+cv15FNdS/LySjNNENEoN44Or6gyS4Bs1jddjJkPk1CS9OK1lXbo
 KIdkZhAkacYPJihysF/pI+U/9Ge8dzIxRmwDlDyGSrh0315VpZm35ErVHoQNBq8ORPhy
 w+EZXgrFaXRf+JuNsyO0iN5EpmG3qQIm0aovcgRj/FZOX4QKubRt0+gSTrbQSLn8pDpr
 opqQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxDLUtQbPO1z/NGFIBObiQmNqbXpG/GrT65aPYIiwBU1GBmDna4VygRY07qDuoSmUX9YTnt0pJ4Yg==@nongnu.org
X-Gm-Message-State: AFuF++k35XoRY2fHqIuqjdQsecZGSegeBomGniYW66trI7TdzFHxmHU7
 0HEbY680weuvyqNNUHENflE+fryWS6AYiYXMPy9FOeRtJxP9vOxb98q5qT/DGaPDqIc=
X-Gm-Gg: AYBFou3EGszyekek6LID+9STrAh0DSCU0HpfKswHRxjIeQc+oidqSvqTAz3UvujH2pG
 PW8Ob3Yq+R2qDszBzlcj73mLLXCk1Dj3uua3RI32w53FgxCqyWsFyf85UG38KM8j6FZIHidkTe8
 UpyiP8rPVxX3O4En8PxE0RTMPFribVCckgZDCvzTHvls0l+Ls+7upy1Z73rXKAzmC1zsOGciDHC
 ouIdqOHyAUt8YyeweFSpiwoQU2EAoMh/zNQCgXpqPVQbXt3wfuYKTBZI3sB5epkapsQ24K1SYxx
 Yxi5bytWw9zZHd6wAjQ/tGHma7MHkjbP94UBdnV22cQgwZgeT2xE0hRvlV5eS55aaoO7iIDoaD3
 +PTh0kjsC0oLHXn7NiZpNXZWXRjgp90d0t9NSyEk+ZAefZTy9LctVSCRcN6qmmhln23TI7Dwz2W
 tj89TV4qLTbBPnMMhVsFKLxIvBQ032mazgcR+ueuPaXsyOyqTdMlDwNsWSA9yH9QXcNrMzZO4=
X-Received: by 2002:a05:600c:c049:b0:499:60bf:c6f7 with SMTP id
 5b1f17b1804b1-49e61992b43mr2853525e9.13.1789064107114; 
 Thu, 10 Sep 2026 11:15:07 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26be3e0asm93795445e9.1.2026.09.10.11.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 11:15:06 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 50BD65F9DA;
 Thu, 10 Sep 2026 19:15:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Song Gao <gaosong@loongson.cn>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 Brian Cain <brian.cain@oss.qualcomm.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH 3/9] tests/tcg: prefix meson built docker tags with qemu/
Date: Thu, 10 Sep 2026 19:14:58 +0100
Message-ID: <20260910181504.1010916-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910181504.1010916-1-alex.bennee@linaro.org>
References: <20260910181504.1010916-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/tcg/meson.build b/tests/tcg/meson.build
index d41a228fb3d..0604c4b90b9 100644
--- a/tests/tcg/meson.build
+++ b/tests/tcg/meson.build
@@ -255,7 +255,7 @@ foreach target, plan: tcg_tests
     image_name = 'image-' + cc_dockerfile
     has_docker = docker_host_arch_supported and docker_supported
     if cc_dockerfile not in image_targets and has_docker
-      cmd = [docker_wrapper, 'build', '-f', dockerfile, '-t', cc_dockerfile]
+      cmd = [docker_wrapper, 'build', '-f', dockerfile, '-t', 'qemu/' + cc_dockerfile]
       t = custom_target(image_name, command: cmd,
                         build_by_default: false,
                         output: 'no_output_' + image_name)
@@ -270,7 +270,7 @@ foreach target, plan: tcg_tests
       here = meson.project_build_root()
       cc = [docker_wrapper, 'run', '--run-as-current-user',
             '-w', here, '-v', mount,
-            cc_dockerfile, plan['cc']]
+            'qemu/' + cc_dockerfile, plan['cc']]
       has_cc = true
     endif
   endif
@@ -279,7 +279,7 @@ foreach target, plan: tcg_tests
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


