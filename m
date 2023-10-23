Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1292442ejb;
        Mon, 23 Oct 2023 04:33:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUuoA94fzIlWPYq7bljOlhhOY3SPrbCXuQJ2XB2IntpuNI+UUNY/Gnsluobpy/91hBjeHl
X-Received: by 2002:a05:6214:23cc:b0:65b:2ad1:14f8 with SMTP id hr12-20020a05621423cc00b0065b2ad114f8mr10993669qvb.42.1698060827942;
        Mon, 23 Oct 2023 04:33:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698060827; cv=none;
        d=google.com; s=arc-20160816;
        b=JsE3iXZoum7M2wq5XEo6lqIzof/DH/MSKBIYi1RCqyqbMTs4ULJI8RvEmUS8ReePmK
         rgbrb3gD2QTch0emPbWgT0kaHLCYwTainnSQpR8hjAsVQkWHMRg3ZBQhncQy6ljikrLC
         QqGXiloqDEanGXT4GrWRkhlz1qOmzkxR5qf3c8QS2UGrcfk07bnQPCGja/TN6aUcz0vp
         XI/np+Dv/rgrkg0oYVX8XYndSnr66yA6UWj/dLQN/iNvNwlTaTNQZOWRTRfv/T/TBjhd
         AStTD8xOm11qqzax2LZYrnXj2dwUr6Tb3sczi12BSxuPvZNW9RpbqSOVC30xkDnUwuuf
         4XKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sPh6YrTdQE54tBiI4AR3NRt+lQUfyV5D8LErvPDwHPw=;
        fh=r4fz3Foqx0ggjO5oI8v2vjNw5kzcdWLA6oCTkzfSTUk=;
        b=Axtlu37/jMR1B7lmKhUI0ZXeSw69eJcNm/PGGJtYAHPZa+jFiYCI8qOQYbGYoMYnaY
         HYVkZmgHKTwkCtB738umb9kMIbhuDYr+S91gBfM5jvxtbY0r3lt+6dam7z3QVZrofCB2
         UystDWHLBuJPQSTnU9hdqtNBiJ/Bq0rDh1W2wsGyxcTwB8/GGImrgvHfPY3HgwzRrA7T
         DE7W9tZqqsptN16enrTH6Jd5xiMNJovBhrCl1WJsRPmH9g3hww4JPqr7l5SKJtTTh8uM
         WA4z57mPN5KkgpqlGdlR/8ykHqTWXJYNgpyJwQ1I4FYJpUnSFGGN/XRpznfrLjK6T4ah
         8u6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eSMa32ku;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5-20020ad44ba5000000b0065b0fd973bcsi5133000qvw.271.2023.10.23.04.33.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Oct 2023 04:33:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eSMa32ku;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qutAk-0001yQ-Bm; Mon, 23 Oct 2023 07:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qutAd-0001I7-O0
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 07:32:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qutAa-0003mO-CJ
 for qemu-devel@nongnu.org; Mon, 23 Oct 2023 07:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698060745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sPh6YrTdQE54tBiI4AR3NRt+lQUfyV5D8LErvPDwHPw=;
 b=eSMa32ku+7ENL7TGY+6x+e9yaNZOwIEZs7CugkE5H6JizzVhUhfRj8sEo8/47uber9gPlm
 o6NHkg398q0EhXwieCrLcVczPPBaJ1Z1sJUS7+9CsFm5ZV+cJTSNX7Gv2BKjnR7qfotJ3r
 YuF+6jkxhzSJq6K7X4FRKRUC14uGvCI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-bS4zaWzPMAm7VhZ36YHJEQ-1; Mon, 23 Oct 2023 07:32:17 -0400
X-MC-Unique: bS4zaWzPMAm7VhZ36YHJEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49A363C1492D;
 Mon, 23 Oct 2023 11:32:16 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 974AD40C6F7B;
 Mon, 23 Oct 2023 11:32:14 +0000 (UTC)
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
Subject: [PATCH v5 19/19] build-sys: make pixman actually optional
Date: Mon, 23 Oct 2023 15:30:46 +0400
Message-ID: <20231023113047.2572137-20-marcandre.lureau@redhat.com>
In-Reply-To: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
References: <20231023113047.2572137-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Zv034qKXlPQ+

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meson.build b/meson.build
index dbc7af091c..6399321d72 100644
--- a/meson.build
+++ b/meson.build
@@ -817,9 +817,6 @@ if not get_option('pixman').auto() or have_system or have_tools
   pixman = dependency('pixman-1', required: get_option('pixman'), version:'>=0.21.8',
                       method: 'pkg-config')
 endif
-if not pixman.found() and (have_system or have_tools)
-  error('FIXME: pixman is currently required')
-endif
 
 zlib = dependency('zlib', required: true)
 
-- 
2.41.0

