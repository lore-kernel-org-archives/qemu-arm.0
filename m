Received: by 2002:a05:7022:983:b0:97:989a:5032 with SMTP id bt3csp1283556dlb;
        Tue, 18 Feb 2025 23:20:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVGqsnEMFpzP9XUVkjfyscb+KZUP/LSDBag2Vsc2BqTqSxRgmNusHL0o86+LL2IoPLYUdqnp2aqHxkE4g==@linaro.org
X-Google-Smtp-Source: AGHT+IEsFmQtdcaF9ddnF4ett7lwMcfDhJ1jiTYa8fvgXVXeRmlPFDvmtOxfWzFxmcoln3teb9wd
X-Received: by 2002:a05:620a:4103:b0:7c0:b0d4:e12f with SMTP id af79cd13be357-7c0b0d4e1f2mr668710285a.41.1739949609871;
        Tue, 18 Feb 2025 23:20:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739949609; cv=none;
        d=google.com; s=arc-20240605;
        b=BTsHnVz2qZqXXuZIWp0vnWQn0/NUNYQFucjEHlDgPnJtBZeZlz7zPYus7NaKHo+AgX
         YnnS5HZAWwUN/Sl7xg+E65XIsbUBuINsdiXC5+CDH18szaWyMlJDtWAswKjzSe+DNGZu
         B7dWAapm51+jTu6aZVuw3jPwTgrupMrd+h43SqRRuyRBKNhbznqzwUGweh5HmH7o4nTt
         FdzJHRAArxBUe0mzld+7cNAXylbE4zmHEcXeaDprjTZYwM1rVf6VMA5mBpmuZdmzBJoq
         KSkXwof4+8NhsN4kykWJ2ke2HEBlHB0paGJGopYRPXxkfQGadF+QOC35Pd81WDTAon6s
         PlGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PlPFMKHIZqUiijOqOWSLCNW5Q2wg9wiVmhKoYX/sLe4=;
        fh=KhXLSX8c6wVmhLa/nUuNp/bImSZbg0QIIf+cCdMOZ3k=;
        b=NSs05WQiKsEWzBPT2KjLpXrhMcC/dDFQsXhET+VoxPE7F3lEWSXfbs/xmquLcOXxaM
         gLO45VhEgXwxGSlMTMSNxJKmKQIykky7OKm0KspgiQ8otIwYsDn/csNFTeDPSZGvsVfF
         iFN8groJKs9a6cNp1cK9UiFaHDb44PRE6kU8H0fkFYYdTV4liSagqbnCKOC9eRHuAnuh
         V9uyPiVQT38cqnXs2kast2E1OOSINZ7z48wpbEaxHf4CHP0kb6Gn2nkJR4xdSiyaH6De
         QvuGRU8MQhhw82hIIa/B2lV/a5xFSbwGLXHDMxRg4qUaOLEhW8ztkGhbsYNbtZnJOvce
         DqHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VWNUcE7L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0ade07c20si274145585a.625.2025.02.18.23.20.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2025 23:20:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VWNUcE7L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkeMD-00011Q-Iq; Wed, 19 Feb 2025 02:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIt-0002fk-QQ
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 02:15:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tkeIo-0005My-LE
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 02:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739949321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PlPFMKHIZqUiijOqOWSLCNW5Q2wg9wiVmhKoYX/sLe4=;
 b=VWNUcE7LCZ31vc/VS4iTB8AKBec3h6LoUZflHS082+ApVlWX5UQk5KuH6Cb17c0UhhCeog
 WZ9Om9lslUiJUmb09pNaoWA4cwKsReltbOqImyFzCz+IHTH3eyKIk9DVUAXpcPL6yZiutk
 3ZArTsRPjdcNIH9hPkulVVyAWrGqbVo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-16-knemTKSxNTS7pU25VpbGBg-1; Wed,
 19 Feb 2025 02:15:16 -0500
X-MC-Unique: knemTKSxNTS7pU25VpbGBg-1
X-Mimecast-MFC-AGG-ID: knemTKSxNTS7pU25VpbGBg_1739949314
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1A0B318D95E0; Wed, 19 Feb 2025 07:15:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.78])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A1AEA300019F; Wed, 19 Feb 2025 07:15:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8EFF41801B2B; Wed, 19 Feb 2025 08:14:33 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Ard Biesheuvel <ardb@kernel.org>,
 Michael Roth <michael.roth@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 graf@amazon.com, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 23/24] hw/uefi: add MAINTAINERS entry
Date: Wed, 19 Feb 2025 08:14:25 +0100
Message-ID: <20250219071431.50626-24-kraxel@redhat.com>
In-Reply-To: <20250219071431.50626-1-kraxel@redhat.com>
References: <20250219071431.50626-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.423,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: TAE9GxzB5i/N

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3848d37a38d2..56a3ca1afd0c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2801,6 +2801,12 @@ F: hw/misc/ivshmem-flat.c
 F: include/hw/misc/ivshmem-flat.h
 F: docs/system/devices/ivshmem-flat.rst
 
+UEFI variable service
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Maintained
+F: hw/uefi/
+F: include/hw/uefi/
+
 Subsystems
 ----------
 Overall Audio backends
-- 
2.48.1

