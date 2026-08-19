Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E87CC5DF85
	for <qemu-arm@archiver.kernel.org>; Wed, 19 Aug 2026 09:22:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wwcV9-0007sH-2H; Wed, 19 Aug 2026 05:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wwcV7-0007pU-NU
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 05:22:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wwcV5-0001xk-Bq
 for qemu-arm@nongnu.org; Wed, 19 Aug 2026 05:22:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-47f703a9d05so517712f8f.0
 for <qemu-arm@nongnu.org>; Wed, 19 Aug 2026 02:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787131342; x=1787736142; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iaAT8nwz/f/r3I4xJQrnagwmY7s7BG9goh2VAnx+Bdo=;
 b=d4laKpEAO2BWNMlUJ3pdI6yKyFJkFIls3cypWF5LbbonWuYKLZtRMHeEYmjR4Asto9
 zsZP01cyh0yQNA5ofMkvovxe9ejlZ4A5yOjHd7ZaZUiDBy0lmG5tQJq11aPRkEk22jkF
 kSw7RFZNWi92xfzVQiDJgsJG20H1A77PTf7FKuj7+EOUeG77mg+xqCii0gZLXO9JzL9U
 qr84hT3papF/uscgLlbPZ2uAqDlU9PY81gPD7GaQBuI+tkAYa+Ko4oXkrySPb3TZvcZe
 aTw/repSOYaxczE83/rbRJ/wziZ7rvX6I27lajZWeKFLJC0pASwK3gHsNd4Sx+MktoUU
 lWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787131342; x=1787736142;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=iaAT8nwz/f/r3I4xJQrnagwmY7s7BG9goh2VAnx+Bdo=;
 b=FRTvYoyQoWax659LHg49f811YFF3sFNWZzUiGdvMa8K1RlhOsDi5lc37LzssrC0mC4
 HRsaTGom8S/2reMe+WCvIDmqdaKFv8gbZeYL9QCEHKA1qAlVS6ho0djd/iZ4hXiyDEGR
 KA8E1/Gn4oyxA4+wkOYzSIraoPdVnDMhroXMLNnlfW5UoHCy9rUJTr6CowtkAoWni76Y
 FRmaBgJTAawxUHT0Yyfg792FEIbvJeTZqYdsVDxHy2nmQZ+6h4Br0Y6uuluuXVjypL7e
 M8l9yU40UERoB1AlxaS3OeiFR5OiuhIWeO8flr9fvuW9w4pGw+xrRl5ebBpKbI2W5rl8
 Ii0w==
X-Forwarded-Encrypted: i=1;
 AHgh+RqmXQfzSAwRo9exq1vBDL1E01LZvPFr7DZJHYkcmSIndT1SXdksJ4pugXnyskwE+bUxKZr2glSkKg==@nongnu.org
X-Gm-Message-State: AOJu0Yy1gpKu7oDl/RrzyviPgdNKNYWVci6XC29SyLM55Z4qHmzr6Ffi
 /GWYS6usHOwnJmPuffvF3oZF51/6Eb+/w+7IdZCGMJpj0wWei/cm3ng9Df4gvywWZVw=
X-Gm-Gg: AR+sD10KID1s/SFP6QvrtCXfvcTEdZ0kbV5B+Dfe3fZGSjnWE+c+VvgpZ18zgfEIAN9
 AIC7ifM0wRBnS3RY+68u+D6YdfN7eIC8+ZbvXi0LRIMCR++6tQQQZwJ/JG3N3zoVnC1A+3c1R4N
 q8bOyffOQDYcwq3gRqV+oM0M4EcHCYd97KfKz/PIz+4Cw8eSGQb/Eyc8sVdoo+b7DrvQfuVbela
 JGS+DXOlouY5lQbmQjc7OsXBqRu1HfJGQGPJ0ZqDxpJIO7wmem8J8/ffYkSj7cz4ka8hb0x+Tsm
 48cCT/6SGRfWB4Dm4ps5LRpE/fp4fSm6i83VqipwnhPJD6iqnWgfaRmyjJyjvFK1CQULO9fvF8q
 GPJ/CUtP7GieD4t2jDeKLaCl5151GDsx/s6VXocflaDp2xazIOYGyd02DYXX+KEgMira8KLuy5X
 40K+KZJ1jXyZt+XojP6sFUh1zdlXFh6QgnBmi66RlnzknMp4uIgls5GaitnP43
X-Received: by 2002:a05:600c:3484:b0:499:7a5e:4c3f with SMTP id
 5b1f17b1804b1-499aa14e6abmr69404585e9.1.1787131341756; 
 Wed, 19 Aug 2026 02:22:21 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa0fd7a9sm61725355e9.2.2026.08.19.02.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 02:22:20 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6D1C45F9CB;
 Wed, 19 Aug 2026 10:22:14 +0100 (BST)
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Wed, 19 Aug 2026 10:22:06 +0100
Subject: [PATCH 6/6] docs: deprecate virtio-crypto
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260819-fixes-for-11-2-v1-6-b7981c2cc371@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496;
 i=alex.bennee@linaro.org; h=from:subject:message-id;
 bh=LnZGeVc7wYy+BtyAMr/N70wRi+tYZ8yVbPE+MJ6dnI4=;
 b=owEBbQGS/pANAwAKAfvQ2wlanipEAcsmYgBqhXXGyf98LQqrkd9pc7pVXUICntv+8Iywp3UUS
 g0TmqcLkg2JATMEAAEKAB0WIQRmha6Z51FnvK/I3zX70NsJWp4qRAUCaoV1xgAKCRD70NsJWp4q
 RHiEB/0W+vnulxUs8yFacc39tyLzM9s/PsBBm6Kjr9XpgoNK4xDG28hOcguVfYZBwtsIBdamK1o
 VaLY1YOvLEKIIGjE2P6aAh9mYnLroFmOgbAP1ZbXkf6deFV5dFO96PoTX2nFbvtU4NmXsvqq7TQ
 FslhgdqNoIwsG8OSMCrbZIxA2ZucoQvGiLd/8UKA1XHEzw/kAoSElZHF+hQwficY1V/16QW0ZM4
 zxrDyOvNRsADb4t3pJEQpUb0j5nrVYDHp46idFVvmCdkm2XC41Mk3WM97wWPv8MH313qSS09nQD
 MhiGT5YgfeaifTw3miIu1k5D/VJaY3ujGgvBPKC5LeYpx3Hc
X-Developer-Key: i=alex.bennee@linaro.org; a=openpgp;
 fpr=6685AE99E75167BCAFC8DF35FBD0DB095A9E2A44
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

We have outstanding guest exploitable bugs in the code which is fairly
complex and needs some serious love to clean it up. As off-CPU
cryptography acceleration seems to be waning in popularity lets just
deprecate the sub-system with a view to removing it in a couple of
cycles.

Link: https://gitlab.com/qemu-project/qemu/-/work_items/3625
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Gonglei <arei.gonglei@huawei.com>
---
 docs/about/deprecated.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 0c656a968fc..3c22981fc8a 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -276,6 +276,20 @@ future release. Where no 'dh-params.pem' file is provided, the DH
 parameters will be automatically negotiated in accordance with
 RFC7919.
 
+Devices
+-------
+
+``virtio-crypto`` (since 11.2)
+''''''''''''''''''''''''''''''
+
+The ``virtio-crypto`` device emulation is quite complex code with a
+number of known flaws. It has never been migratable so is unlikely to
+be used in any serious virtualization setting. With most modern
+systems supporting on-CPU cryptography acceleration via their
+ISAs sets the need for off-CPU acceleration is also reduced. Add to
+that the kernel has recently removed the ability to use off-CPU
+acceleration suggests the time for this sort of off-load has passed.
+
 Device options
 --------------
 

-- 
2.47.3


