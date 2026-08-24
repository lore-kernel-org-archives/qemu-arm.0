Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983DFC5DF94
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 15:28:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyWXx-0005am-OU; Mon, 24 Aug 2026 11:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wyWXv-0005U2-T7
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 11:25:11 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wyWXs-0007Bj-PN
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 11:25:11 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6a0a4a28cbdso6397325a12.3
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787585107; x=1788189907; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zEBSWmDHcpbyAT5+oxLyqv+4C5kL0TnHpRS3uvgoVbI=;
 b=jwtvpKCrwpYLN+4FtoeNfNykkRmFg6x/SUepBuNNRu80ibLt+YxhGPQ8/f86e0IMT2
 Gv7PspdC5YTgpwZOP/QsOhqsQ9VygvCOuE6WUp2kmwRzKWRhcXj5x0xkG/gBe6w6h5Nv
 0siaL2Nlvo8BlBT87/Wz3xpauVTtzTCGgHG/lSLlLd3vtOcPnnm3UEPQPJ/2bet0sXRx
 uWb0/iMGdkmLVx5eoOhaYxehjA5kHhDAMqWzbuQ3l7F1M7WSTFk7EkQD+dEWol49hROd
 MIYKHaUWXzfUm6gTrwMA4oRExntuPdAW09zibOUSSo4OS34k7tBYnZmr/FCwpT7437H9
 JCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787585107; x=1788189907;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zEBSWmDHcpbyAT5+oxLyqv+4C5kL0TnHpRS3uvgoVbI=;
 b=kBINSodoedrprJlFl82zOMCroW4fAyesDb93wvZaMjUlKQuH6BPxh/gM56511JqwEJ
 CdRaijDxtClv8RLShBgtWjCauJUAISV4dLaY3+yII+cTWrG1+TtrCwZJnQDiAwKOosMX
 1K31xCMvW3EROzQaaWyEbIGNIRyl9IhZteXr34nHrh20Ni2TYx2yBCsbU+1szPHq5QxB
 KBhxzpNJwa0m9jNby7Ki+8LG+6k938qI4/+LTMV8WdNvAjylE1juttgUpEPjHqLOC/aC
 xlmEq307n1xB0np2d/AWBzsONOakmhTXQreIu1iwZTTJcIPsr8d2pHurWHQxqJHhdgRR
 u08w==
X-Forwarded-Encrypted: i=1;
 AHgh+RpDpJo9FYFSSoYemaY8+sbn2GG2RDCvGa66VOBHZOO0txEEJIhugf1XO6iedoXgTpzitdHNAPIZOw==@nongnu.org
X-Gm-Message-State: AFuF++n5PLpvtvCxmJ9QoyYl5x8BU29luOOkrYvh/IHAGE/k8PpmlSAa
 icFIPvE2l+ZA2/fPcLp7tP9zPOQbPzbWYEWKWVZwQ0IcYc+FiOsAz8ReWfnAEKNEhSY=
X-Gm-Gg: AR+sD12wYxNgRowovRL8B9b0YCVn2exBXDfdOLL/iUZ2C6+bMOEsJCfi8klADHH1mCt
 AcKRxCSsnEifVZfmXM4BEbcarGcN5MlipWkWiaqGEk4fg2UEgT0awDYbTa0UgyTf24iptOhmZNw
 ags5q/ApGW1aH/gD3rKP7VbPkhDH4iOL8vrifaaBhs0aG/0b3IgdoWiDwq3f7D/AUEfOERe6cub
 eN9PeTIm2IWrnROa0ZUUBBf9PXCoMdYwgHPw8g0pDfG6Eoz4IKnT6f9sWMRV9Z7dVg+0Hma7XHr
 qGiu73B32yqQDs4Qx/mSc4PnFj1hrxjxtuJDD0eTCuQTOYnc5oGkg/UyWyxlVhPk71q+HL4/Cra
 NpRfdSV/zMUUBZOFAqFJJ0l8ZmRwDDlNe9xFYw20ma4cuaiwl2fjsWBaDZ0/6UHUhdxuZnxoGFQ
 NhS6irwCj95ZUOsK302H1EJi/zNnB5TgTEURq1FSF1UbDipk8qnWV38dV52I8x
X-Received: by 2002:a05:6402:1f4f:b0:6a0:6978:bee0 with SMTP id
 4fb4d7f45d1cf-6a582b62783mr24037052a12.9.1787585106912; 
 Mon, 24 Aug 2026 08:25:06 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a59e001095sm9806117a12.6.2026.08.24.08.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 08:25:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 630795FA11;
 Mon, 24 Aug 2026 16:25:02 +0100 (BST)
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Mon, 24 Aug 2026 16:24:50 +0100
Subject: [PATCH v2 3/8] gitlab: add arm-softmmu tests to the macOS build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260824-fixes-for-11-2-v2-3-352c6b890402@linaro.org>
References: <20260824-fixes-for-11-2-v2-0-352c6b890402@linaro.org>
In-Reply-To: <20260824-fixes-for-11-2-v2-0-352c6b890402@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 zhenwei pi <zhenwei.pi@linux.dev>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 qemu-block@nongnu.org, devel@lists.libvirt.org, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596;
 i=alex.bennee@linaro.org; h=from:subject:message-id;
 bh=B9ZSx+meoWvdNqJq36oJBwbjPxCumeybg4Iya8CkY5Q=;
 b=owEBbQGS/pANAwAKAfvQ2wlanipEAcsmYgBqjGJNnu7NhMoxC7BsjB9Zi+XIJSWsI3a7ytnwa
 j94NjxmHuOJATMEAAEKAB0WIQRmha6Z51FnvK/I3zX70NsJWp4qRAUCaoxiTQAKCRD70NsJWp4q
 RHjcB/wNGlY9qSB9kIBU3maa+79vGLdbJ2bOgAlw7VnFCdkASaXJsmK1+gE4nIrqak+Ah+f3Vfn
 Ki/UrABJsC2/EVzzPOD0Jx21xwdzwYT4mMcJUuWhwUpLE6A4zMPZNFs0G2LsQEA99z2E770Sc3p
 igV7R4ldS3BzjSIvy9mnB4hI/Z/pMXhm7YsmiMtM/8Rz8HhS21wbnxnkl+Kd0oOgAFlsWiK8Q8K
 TAonKqYIfe177YT2A0c6qpuxq3Q3JbsVKvjtn4G97TpFybCtya2qnWT902uq7fgoOCUyfxibcYf
 HOk8uvBJoCfeaVd1rgEFAwQeVl4mswo411ZqHR652ohbR0Se
X-Developer-Key: i=alex.bennee@linaro.org; a=openpgp;
 fpr=6685AE99E75167BCAFC8DF35FBD0DB095A9E2A44
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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

Now we have fixed the compiler issues lets have at it.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Message-ID: <20260723200904.224413-4-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/macos.yml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/macos.yml b/.gitlab-ci.d/macos.yml
index bdb3eae18f0..40b9b637b3b 100644
--- a/.gitlab-ci.d/macos.yml
+++ b/.gitlab-ci.d/macos.yml
@@ -22,7 +22,7 @@
     - export PKG_CONFIG_PATH="$PKG_CONFIG_PATH"
     - brew update
     - brew install $PKGS
-    - brew install aarch64-elf-gcc i686-elf-gcc x86_64-elf-gcc
+    - brew install arm-none-eabi-gcc aarch64-elf-gcc i686-elf-gcc x86_64-elf-gcc
     - if test -n "$PYPI_PKGS" ; then PYLIB=$($PYTHON -c 'import sysconfig; print(sysconfig.get_path("stdlib"))'); rm -f $PYLIB/EXTERNALLY-MANAGED; $PIP3 install --break-system-packages $PYPI_PKGS ; fi
   script:
     - mkdir build
@@ -40,8 +40,9 @@ aarch64-macos-15-build:
     PATH_EXTRA: /opt/homebrew/gettext/bin
     PKG_CONFIG_PATH: /opt/homebrew/curl/lib/pkgconfig:/opt/homebrew/ncurses/lib/pkgconfig:/opt/homebrew/readline/lib/pkgconfig
     CONFIGURE_ARGS:
-        --target-list=aarch64-softmmu,i386-softmmu,x86_64-softmmu
+        --target-list=aarch64-softmmu,arm-softmmu,i386-softmmu,x86_64-softmmu
         --cross-prefix-aarch64=aarch64-elf-
+        --cross-prefix-arm=arm-none-eabi-
         --cross-prefix-i386=i686-elf-
         --cross-prefix-x86_64=x86_64-elf-
         --disable-plugins

-- 
2.47.3


