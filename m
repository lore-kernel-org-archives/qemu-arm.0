Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1292423ejb;
        Mon, 23 Oct 2023 04:33:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvSbxXoSx5Ifkc9TPtXka1ZT0mLep2H1amOoQ1ZxjXzHpKN967Vb5Z7qzVtU2yCCkXRGmS
X-Received: by 2002:a05:620a:4bcc:b0:76f:1808:997c with SMTP id sw12-20020a05620a4bcc00b0076f1808997cmr7688965qkn.20.1698060825478;
        Mon, 23 Oct 2023 04:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698060825; cv=none;
        d=google.com; s=arc-20160816;
        b=o9oc4MvuUnb16+9xdwGbWJy/lLVug9y0HcDQMpF4Tsal23a0+1kbi6WTHkBr1/yBkC
         4lZnYPQ4fB7ik79q1HYEhfUXX6AxgbFw6h9/bWPZw3TwOvWoh0pt8GVBBugQG5jevSm1
         emJImeGa/Gh1zO4Imi9vn7x27+484/LOU11L6Jss/u6XEas+gN/O4D+otop2Ry0DaAtR
         cjr1mp9ap9bf3wupGvOam0eVTmPWX+ST16YqK35q0h4FjnR4az6Xpa5cBS2Mlwmyd6E4
         ZEmxDVYE4IP7ouCyhZQBxt3ki0uoiOoz5e2UFm0RtWV13SImtStpc1qiaQNBi3wj9WmW
         sciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=57TVdxGyNAJi1cI0andU5/2uWsnO2QLQ7cg3JIKUwmk=;
        fh=r4fz3Foqx0ggjO5oI8v2vjNw5kzcdWLA6oCTkzfSTUk=;
        b=lpq2bzn7kP3bKcBmj2Nm8rxDRz2PtY571xkEDNq/YSGSwfx5tID+97AeY0MtOG7TeB
         hyc6oUaNIrt81GTMS0LiEK1IV6sO09+4/RTToybRcuE9QUO/3ASMGl/vdKSgsfecpYb/
         6BAGj84/OT3opPLn2VAc9BWrDy4QUFT3VKDaUgj3bjAGT0wHVkb8Za1MwgD/G08a2dtW
         93ctu7EaKD7rgF4s/pCUlT/ZETttTbJ1883KxeJsswKTDvmd2GD/oJKZgtfopcB+P6tK
         KpoRPmWg50n9XvQYqo4urWtUKi/2hn1g7SSqINNe8fbyLt4owGwWAfagx2srhn1Bi/1A
         F83A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZJOO8VU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5-20020a05620a118500b0076da9a05a45si5409279qkk.134.2023.10.23.04.33.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 04:33:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZJOO8VU3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qutAm-0002F3-ES; Mon, 23 Oct 2023 07:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qutAT-00012D-0g
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 07:32:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qutAQ-0003l0-Vr
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 07:32:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698060737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=57TVdxGyNAJi1cI0andU5/2uWsnO2QLQ7cg3JIKUwmk=;
 b=ZJOO8VU3I9Ej1sxKzQU9Ahoih6XtWUEY3rtRWTrRV9KN0V3cNCupzYtYCseEWoCVwj4NmK
 lem717DYtbbqUkfhlBO1D0ljXBwtpVJD8e/7cGqIIMG/ZHosaXNN9L3Wg42h38ZAWRxPel
 Ru0G+lvJYMTpBv0PRWfPQ5CWtH6E+Ww=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-iOXlmI2xP0-5gr-GdeezAQ-1; Mon, 23 Oct 2023 07:31:54 -0400
X-MC-Unique: iOXlmI2xP0-5gr-GdeezAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96E0B185A79C;
 Mon, 23 Oct 2023 11:31:53 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E8CD2166B27;
 Mon, 23 Oct 2023 11:31:51 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 14/19] ui/gtk: -display gtk requires PIXMAN
Date: Mon, 23 Oct 2023 15:30:41 +0400
Message-ID: <20231023113047.2572137-15-marcandre.lureau@redhat.com>
In-Reply-To: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /PTUIltLgnpw

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 3d6e41d1fb..dbc7af091c 100644
--- a/meson.build
+++ b/meson.build
@@ -1507,7 +1507,11 @@ gtkx11 = not_found
 vte = not_found
 have_gtk_clipboard = get_option('gtk_clipboard').enabled()
 
-if not get_option('gtk').auto() or have_system
+if get_option('gtk') \
+             .disable_auto_if(not have_system) \
+             .require(pixman.found(),
+                      error_message: 'cannot enable GTK if pixman is not available') \
+             .allowed()
   gtk = dependency('gtk+-3.0', version: '>=3.22.0',
                    method: 'pkg-config',
                    required: get_option('gtk'))
-- 
2.41.0

