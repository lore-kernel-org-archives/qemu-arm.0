Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B34C5DF6D
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Aug 2026 09:23:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwcV6-0007nk-7O; Wed, 19 Aug 2026 05:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wwcV5-0007nD-Kq
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 05:22:23 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wwcV3-0001wi-MJ
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 05:22:23 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-495590dde14so9465955e9.0
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 02:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787131340; x=1787736140; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zEBSWmDHcpbyAT5+oxLyqv+4C5kL0TnHpRS3uvgoVbI=;
 b=XgWwhs70SAN8p+NmpeqpROpBSGqqskGycG0x1WYA9zkIdljZL0IaEJt5tCF9IfLgSe
 af5RAnRgsJB01+yznDf0hJirmLiGXZOcvtrB01VBS2XjqZFP3bOaNhW1YRDKaql4qQ/6
 cNvKp69mtARml8AwmrHk0KWgxl+f8G40h66gg229vWoWSnvvwfRaV6D0Qn9YQNDfn+4I
 XMG8IIu/RDBWwdRVazJN4TyDSGVq4wyE7yKZ9RyFqEY6pEJGdLOxOBk1vfsGGPXmQe3w
 ft3uHQv5DrRVkdNe25SzCCRJp4v1Q1quI07PxzUqXlngRLdch6sFRPXJtDMBAcMoAxtu
 yS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787131340; x=1787736140;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zEBSWmDHcpbyAT5+oxLyqv+4C5kL0TnHpRS3uvgoVbI=;
 b=QzgGI7Qu76Nv8rNFKuf2lJ+li/FU+QLxrdxco3cDc2i5IlbAFWgyj/iYf9bAmGuxW+
 RUvRTEUbGkW2tuITxuItHlRgt3FwtQE1bI54AXQwAFlanU3sUbTZlx6+SS3lfGKBb70C
 UFCBc45SktGenXE6YPPQkv8qp93rGu90BzOR+bYGkSqHwAEzMNVbEUvj9gDJI2FSKgSn
 T+zxXLYqhtesXRkyvMhKkye4sXOGRDGqEC/6m36apFg7TD5/y/D6yHEoZlvGydPiIFnV
 bT5SHGdXYp5FsMQT5fshBIVjO8QcWcw8XCuxz8VAbAj66z5iGwloynPL/xU0u3vzERyW
 IpNw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq3BuCKktwbP3gOX/wBDNKcbAHZyLEZzdvXHMCbVoPV7sz113qSdinnKFFlErhh+scKzQ2DCC9kyQ==@nongnu.org
X-Gm-Message-State: AOJu0YwCmW9TxpvY73Gtpe7xvgnbHCMnbHkWIrJeTBRK4xMvxpx/ppbz
 UTIzIjRFR7zIRzkj0bPOGqJW0PiZum4ISkZkx+aGtkrx8dA6k94IN4fLZVbx89TA9OM=
X-Gm-Gg: AR+sD13ebu0pOca9+QVXLFkgEinEWMzOQC707kCUExdQ7N0f9DDJ7TSgMmh5kQngyA5
 NHSMjanw3drE+8RMfm604lyU2/jFNGkoOwsX6BZyQGUW3YMGXLdHWIiWBjTrmDwfIQWTSn1WdT9
 2aFAh4eFbi4ouur15ia0BcpNh/ecypvfz+H9srs3eaoSznO/gg9GVSh2ngGqrtd6SjdfZWcweUw
 VrRO1Ox6/+YXULR94ozbBSpTWVjgDUlKmm2ig6jvmQOM9i1bWnwuzJonMRGhoehzQ8P57nH+u3W
 Tz3DFQUNvkxCBIZKFzAYgJa2cDxzvMRUx4vDyL2kF9lb65WnA/TouJvddOXST5CRaRBDf5k7wdj
 HIu1J7ShQKLa7lDCWNx28ZLoJCbgWNAYZUqBcnJlX34YYHqjNTNhX/qnAf7/ut6BZV7lx+3oAM4
 ABtFxR5/orNoNaa+abrDBfTosvhXTI06b+VSh7Wn6Ah2zRzjnJ7pzfz1eK+Clx
X-Received: by 2002:a05:600c:190c:b0:499:5282:f8d1 with SMTP id
 5b1f17b1804b1-499aa1ac47cmr54101095e9.12.1787131340217; 
 Wed, 19 Aug 2026 02:22:20 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1450e61sm4408686f8f.13.2026.08.19.02.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 02:22:16 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 663D25F898;
 Wed, 19 Aug 2026 10:22:14 +0100 (BST)
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Wed, 19 Aug 2026 10:22:03 +0100
Subject: [PATCH 3/6] gitlab: add arm-softmmu tests to the macOS build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260819-fixes-for-11-2-v1-3-b7981c2cc371@linaro.org>
References: <20260819-fixes-for-11-2-v1-0-b7981c2cc371@linaro.org>
In-Reply-To: <20260819-fixes-for-11-2-v1-0-b7981c2cc371@linaro.org>
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
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596;
 i=alex.bennee@linaro.org; h=from:subject:message-id;
 bh=B9ZSx+meoWvdNqJq36oJBwbjPxCumeybg4Iya8CkY5Q=;
 b=owEBbQGS/pANAwAKAfvQ2wlanipEAcsmYgBqhXXGWquFVetm/TQPeCRaIqpMdvkNgXP2Pe5Gv
 MiUAU1Rn2OJATMEAAEKAB0WIQRmha6Z51FnvK/I3zX70NsJWp4qRAUCaoV1xgAKCRD70NsJWp4q
 RNgJB/wIygNvGYLCcR6OOBZpVYQYPNJ9YUZ2FoQlAWuEHigXvwnQZXykBG9s0tTMvtOdfp3ecz6
 H226V/XnMRF43ZAzsQMI80N5HOhF3ZBu/9j/ztxr31FSReMszHh3rj9Jb4xkj2bFEBpmZJMvF6T
 eY+c7ZIEMLKvlutTKUYzTDYjEY71AZ3/mwixyyARMS6c5+KgrUR3cvYd+d9beyeF0duFUO11dZN
 hK2vKKtuVWz3N4WvR8RJTTfdoPurDwxpZ4K1USsIVt330YxOMOz5f7bLKXVQsH7/u3bdTsBXmz1
 Ml5NEOMS+g6T7s9CIa6cHrH+Jayjq6DxjdE1muhorCJu6Kbu
X-Developer-Key: i=alex.bennee@linaro.org; a=openpgp;
 fpr=6685AE99E75167BCAFC8DF35FBD0DB095A9E2A44
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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


