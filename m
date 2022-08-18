Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp177038ejf;
        Wed, 17 Aug 2022 23:57:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5TEIJ5Cv72n7u1u6pYwplSA6XWvQFZ/VCh5bm29tDEDvb76uyaXQgUi9va5jIg0Ei3APXl
X-Received: by 2002:a05:620a:12fb:b0:6bb:4ba4:aa85 with SMTP id f27-20020a05620a12fb00b006bb4ba4aa85mr1100538qkl.704.1660805827577;
        Wed, 17 Aug 2022 23:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660805827; cv=none;
        d=google.com; s=arc-20160816;
        b=rZuMe1uapCvkyDIRxg5Xt7I4Uqp7IdsCkFQusWkZvw3R5oL65v8zJWKZ9qrzPZsXf/
         VnsVlv76VjUjlmnWKIjo7JC/Dd0jwU6bKkLJNSeQ2N8tIMN4rsVovV1JyyvZ/1ueft8J
         mZ7ErIEsd5chbeqIfoB+3Y6pxRmO2pNZtvxvIrkPN2H2ABCaDhaJFaZKyZzQOWxVf9dw
         IM7e2UbW+lk9QM4EvCnYWF0pvb7xlPxk9ZhLltj8fMU8zVaHojY0QWBkTGosupUpcBab
         pwU17NmDMF11+YwMos6h3JZ5EeFjvfUWzK4oNhkL6UG8AmLYAGr6mpPKdFxSqNXcKPoH
         Rl6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=9sBYHkhNWLWCpMuLEqiidcJQU5cBmt+xG7T5T/DHmqY=;
        b=v0dEl9OzX8b6DkOrfXRFxG4ZAtopt6vdo7s12IWHmtoH/3sq1zOSjmxnDLdzZcvpc5
         Tts1TZiEGZD0TCslxOfkHEFaCtjJ3e7crKCd8NjTll6xAAQd6NU0TnJIkYGzNJS9PZyI
         Fl60wYF6tFX9H0DehxkhOX+vaqOTJUrCu+qQZ0LCD8KjPLtRBUSYO6xtaRRxyaEjkSIc
         2myHaicGTLdGW9YexyXYLSoDkUXC6KfL8wKcHXRFRmjix2p+nhhwrJCyHZmEjPVMbAGA
         LxUvB1AUM/+bw9XFe68YmgkOQb6jSxZKHW6C7t9ZjhgpVVD2K1ewYn0q+RqxO4u8epu2
         XDbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A8QTmXjC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a05622a17c700b0031e9fbba5bfsi311964qtk.668.2022.08.17.23.57.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Aug 2022 23:57:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A8QTmXjC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oOZSk-0007vD-VK
	for alex.bennee@linaro.org; Thu, 18 Aug 2022 02:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oOZSO-0007u7-Je
 for qemu-arm@nongnu.org; Thu, 18 Aug 2022 02:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oOZSK-0001gi-Dm
 for qemu-arm@nongnu.org; Thu, 18 Aug 2022 02:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660805798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9sBYHkhNWLWCpMuLEqiidcJQU5cBmt+xG7T5T/DHmqY=;
 b=A8QTmXjCRZwVCuUv74AC+D+0NWG9YJo/Mv9UkmGVZvyNkA9sx0QsrDmC1WLWH4wXktHo7r
 SxoBI8Pfqs9//JNi+77mUJYHKGucgwSQGY9TgpsQo6cxI1fLog2kTjh4+u02TJKkYPnLSl
 eWcKhAUtnKIRrl2yj/f0lYbofFacAhM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-11IqFTNkNVuourhLVn6PwA-1; Thu, 18 Aug 2022 02:56:35 -0400
X-MC-Unique: 11IqFTNkNVuourhLVn6PwA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 867DE185A79C;
 Thu, 18 Aug 2022 06:56:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C128B40334F;
 Thu, 18 Aug 2022 06:56:33 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, qemu-s390x@nongnu.org
Subject: [PULL 0/3] Fixes for QEMU 7.1-rc4
Date: Thu, 18 Aug 2022 10:56:28 +0400
Message-Id: <20220818065631.324170-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k8gKddj1J9xW

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The following changes since commit c7208a6e0d049f9e8af15df908168a79b1f99685:

  Update version for v7.1.0-rc3 release (2022-08-16 20:45:19 -0500)

are available in the Git repository at:

  git@gitlab.com:marcandre.lureau/qemu.git tags/fixes-pull-request

for you to fetch changes up to 88738ea40bee4c2cf9aae05edd2ec87e0cbeaf36:

  ui/console: fix qemu_console_resize() regression (2022-08-18 10:46:55 +0400)

----------------------------------------------------------------
Some fixes pending on the ML:
* console regression fix
* dbus-vmstate error handling fix
* a build-sys fix

----------------------------------------------------------------

Marc-André Lureau (2):
  build-sys: disable vhost-user-gpu if !opengl
  ui/console: fix qemu_console_resize() regression

Priyankar Jain (1):
  dbus-vmstate: Restrict error checks to registered proxies in
    dbus_get_proxies

 meson.build             |  2 +-
 backends/dbus-vmstate.c | 13 +++++++++----
 ui/console.c            |  6 ++++--
 3 files changed, 14 insertions(+), 7 deletions(-)

-- 
2.37.1

