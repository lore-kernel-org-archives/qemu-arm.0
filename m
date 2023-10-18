Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4646528ejc;
        Wed, 18 Oct 2023 06:41:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpak10px7Njh+u/x+2ZJ7ps0QXjS54qo18khVEJ7/SePvNZGkgUHaUXCcSc/Btf+H8SwMV
X-Received: by 2002:ac8:5ac7:0:b0:415:15d2:b892 with SMTP id d7-20020ac85ac7000000b0041515d2b892mr6692078qtd.12.1697636499120;
        Wed, 18 Oct 2023 06:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697636499; cv=none;
        d=google.com; s=arc-20160816;
        b=eRxQjgb7sFjHHxD1D9SKxeFZQNKhlkYiSsQj5q06YlgI9sdg+qsW+Tz3r1Lr3Maq1e
         Uzj9wkXfODxwZ75gosh0Ci0gH/h8eR7tsZG/BdsFVKIkI9qYu80baFP1VdAw7JAGkIH9
         H5ZSQ4Jziu5kpKLSMD8r6Ad30r8zbsm40Pk0PzA7VjUwY1hQ/d9ed20EROUQVxjnNLiv
         Q4v/qxH3/Luf6FLeSBrhu2ln8iaMod7kIjupyXIngYQjNo8ClCvJfQYdUByKCaggPijp
         g/ctPiAHSIZUovs5e5oCrTlbP9WGp3I4sP8Lw1EKA/RFnjdMvrq8+WA3LhOExyAGbbDB
         ZrDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=D5d5Gb6DkGt949n06sUQVr9bQ2lIR+DaowCkum18rvg=;
        fh=Szf62vI2mdRKxFE/n72kPzB8VnojR8p9hbcglhPNB2o=;
        b=RnoyCGSMzdZf8GZzEIaihV15sxapCKdns/F2QM/vMorIgXTpPg4ctferLRmcMBZnD7
         D5P064b73c9QezuUO5S2b1L37jEEZsEHTlnstuRXroxYrfeA4+pHZFxe21DV5JTdYowV
         gLff6qIirYmWCOVZTVZXhqmHZP2T+r6QH0DJXf6p2jqY8zWQTEN4IFnpvf5bjf/S4nCB
         PSeb+S3O3dWqqFDnXjtt+k84NmbXwQak+CTHVx7IKPdhSYggPFFTbgixvfds9u2WwEH1
         loGpDl++tvPEU0MoDGQE6FZFl70zPc/H6TTcN0bM5CygNVO+DnNq8q0C78W4mcBuzP3O
         en6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DsIqKIl4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e3-20020a05622a110300b0041806027aefsi2708778qty.796.2023.10.18.06.41.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:41:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DsIqKIl4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qt6mF-0002ZP-8B; Wed, 18 Oct 2023 09:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6m9-00027c-VX
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:39:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6m8-0006Na-HE
 for qemu-devel@nongnu.org; Wed, 18 Oct 2023 09:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697636391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5d5Gb6DkGt949n06sUQVr9bQ2lIR+DaowCkum18rvg=;
 b=DsIqKIl4foniOBZ6L6ytsRgsMsXoaasMHSRoh3NXw8lHqgfP+828zDJE6AbBZRSUdQba1H
 hugLpgTgTezongeafMnTtbEMdGn0iav1+00OuMU5XPMYk6STFcVTpU+9c5Q2kmYgEJuyQ0
 DiRrdKstW1wEHMwXb2vgF7IgDvnPPJU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-k5vlKGDLN4OQfjyTbczXEw-1; Wed, 18 Oct 2023 09:39:48 -0400
X-MC-Unique: k5vlKGDLN4OQfjyTbczXEw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C549D857F8C;
 Wed, 18 Oct 2023 13:39:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B97521C060B0;
 Wed, 18 Oct 2023 13:39:46 +0000 (UTC)
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
Subject: [PATCH v4 19/19] build-sys: make pixman actually optional
Date: Wed, 18 Oct 2023 17:38:20 +0400
Message-ID: <20231018133820.1556962-20-marcandre.lureau@redhat.com>
In-Reply-To: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
References: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
X-TUID: TUPSezRFz0oj

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meson.build b/meson.build
index 39b4632ed2..77a3ca98ee 100644
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

