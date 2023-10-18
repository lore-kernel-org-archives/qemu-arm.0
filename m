Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4645936ejc;
        Wed, 18 Oct 2023 06:40:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP7sbT1XAmo/bSbxkf03/9bpOX96IQtZUSOcFfeAVVvLWPrrIn9PZb0+UT59EISpDb0LSN
X-Received: by 2002:ac8:59c1:0:b0:418:1727:fef8 with SMTP id f1-20020ac859c1000000b004181727fef8mr6001144qtf.35.1697636445823;
        Wed, 18 Oct 2023 06:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697636445; cv=none;
        d=google.com; s=arc-20160816;
        b=UhDYJIcaj9SFDJjAWXHrNx5Yjo/OM5BOW0Xx4UnCUfxLYZRFTNVv0FVejWlshN8MMu
         acAtTPd2zqes5fVn/7kGz61K0vkkLpYiYWEk1fu6cSe414AUb4ocb0dUYZ9qnnJeeBR5
         E0ih8uM/qUNjVVpD37cIgxae9zx5ZomNHce9Z89OEiqiatdFpgQvzZl5U0QfrxkYu3JN
         vOYVJXxhxb3v3qaB9l5icMxd9aY/COM/FmZJa9NKJ25LHZOAQS66xRk1XJHcEV3jqwz7
         BZE+sW9Fl7ziv+aVLdqQMywRSVL2eLtJfFQ0GZZyCHGaBnVKtoVt9c7gyjJemA5ujS80
         5thw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bL8Q4tRpKFiXZ007J62edoSfd9HZA/G0/kEtDSOWkDg=;
        fh=Szf62vI2mdRKxFE/n72kPzB8VnojR8p9hbcglhPNB2o=;
        b=mr/PsXGDMfFJ/iubLV9m0Lk7eMmRtacFzwjGwyfEyTob1EZ9Ra+bsFvi5d5YyaP3gE
         dBTCj5VRQDQLQfAuscnhEhiqwtEbqB753hnUhNk+7xdqhkzSwRrVSh1pPPCi3VGplt/m
         bW6b+m4HlX8/17vN+NTwt5LBTLuX2+uYhNxSOR5JxbWpldZG4gaAu7mE9h+W4EHl2A0Z
         GiP0SicPzm3xTghx3sLzgCrOFNdUa5NhtzCum9AW2sCmX/504vAwmSIJydQ+XInjg2x7
         AKL6Wc/VVOPIPQ+Fc2T7rmGuNr5QyqWvPWF+5INnuPVMFFYWCMOy+dlPbLDUv+R8CgDd
         CzxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ku1M02MI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e19-20020ac85993000000b00403c3fb27d8si2762839qte.678.2023.10.18.06.40.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ku1M02MI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qt6lp-0001Dx-Gv; Wed, 18 Oct 2023 09:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6lo-0001DL-Me
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:39:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6ln-0006JZ-AT
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697636370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bL8Q4tRpKFiXZ007J62edoSfd9HZA/G0/kEtDSOWkDg=;
 b=Ku1M02MIYXLjcRsUwCyFVSUBR3WqP8+3txX897YKbRMI0eumqs7aKn8TUkVj2JMkFRV9P8
 ZuPXHoZ7071zVaqtxSNcdZqbMJiKbQB8zQIw5C8NQQbdXtVySRfYaru/4XSb56PxTETAkr
 Z5HsHJUlci3yodkgKvlKE4qREDq2Wmk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-O3mZMfLdPWuCGS78qIMvbg-1; Wed, 18 Oct 2023 09:39:27 -0400
X-MC-Unique: O3mZMfLdPWuCGS78qIMvbg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAA54382255C;
 Wed, 18 Oct 2023 13:39:26 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03A5D2166B26;
 Wed, 18 Oct 2023 13:39:25 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v4 14/19] ui/gtk: -display gtk requires PIXMAN
Date: Wed, 18 Oct 2023 17:38:15 +0400
Message-ID: <20231018133820.1556962-15-marcandre.lureau@redhat.com>
In-Reply-To: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
References: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
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
X-TUID: mIJ7vPUj9qOe

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 3e5b6dc3eb..39b4632ed2 100644
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

