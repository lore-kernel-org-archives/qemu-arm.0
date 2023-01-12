Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4791580ejc;
        Thu, 12 Jan 2023 05:50:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs9GZl9cO/D0h+t9RjfhkST+L7GQoqvFBLy5CPGqWZUhBxCSxl0lHvBEDGSwKA5Y7DUd7Xt
X-Received: by 2002:ad4:4987:0:b0:534:672e:5c3 with SMTP id u7-20020ad44987000000b00534672e05c3mr1486988qvx.33.1673531429918;
        Thu, 12 Jan 2023 05:50:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673531429; cv=none;
        d=google.com; s=arc-20160816;
        b=0bwdt4lLKs7gY2/6jraYML/x+WVXFtcv5OV85+U43EZAZ7SxBCXLMo764hP9EyklkW
         /TQ00wmH3WWoBSu+C+H6kUqwHDq0ccJmZ5nFUaCnHSK5CYnFpdHb38VM0lTg7eXqt5wE
         VYptRSxqRNq8q2XXYSgEel08Hws6gbF7jAHXnY9cb5L6jR6THJTwtNYZJkdD/whPgEwM
         LceVg71KKYqNqxQnp9VkzPUhhrrNTmOk8zFxwHxwHoAZCWcUGXsKiUj9Bd6u+5jWWVy6
         qpa+9LNNtUs3/OEQQl5Ww+4z/RPaiN+gtoUxwlqdnxq7AMylj9tKMYGiqaFmGhh99lp3
         ZoHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3qD4ndr8yIl/ZBVBvbiwIXGY8SdSYcDtBxXg5KJCkME=;
        b=nrsUdVDkWEUidgM5dcN228d6mU5WGKifreDWkLe80OssIME/Qi1Jlu138DbQFmDALG
         jvlbUnV5zzVs3aczn515FTWALguormoQ0KfiGJIKbT4KKQ360knTxPXV/XpTLKmWG+mw
         d9Ebup5GaDqv3VsahCx75W6bz4Oh9vLnDqYlr7Lqt9iAYA3oepP5tsrfQgOzsT42bn7V
         Mthg+g4sJgZk40SUkmJFiCkdXBffyDiYRBl5BITZYAzJRDn+c4dmOhpZi7MgcKYJAXQF
         jO6gY+RDDC9cHR0J0Bp7zRp6ClQsLREHNIAU6fCdWuL9QwIgm8q6KtXlSyb0kVciP/TB
         LUhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XmbwVEFW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r11-20020a0562140c8b00b004ad1fd02c0dsi10554213qvr.552.2023.01.12.05.50.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 05:50:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XmbwVEFW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFxxe-0001aO-5H; Thu, 12 Jan 2023 08:49:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFxxZ-0001TW-LU
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:49:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFxxX-000369-MI
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673531375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3qD4ndr8yIl/ZBVBvbiwIXGY8SdSYcDtBxXg5KJCkME=;
 b=XmbwVEFWaXIMlSlSNjkBCPJwDGyW6lcQsZwZkyiyhZnf2hd0hCU9UMcmtXoQieYfT99t/j
 8lDoA5B9uQzoKY/6aIJnlNa4GExq8JXPz71m0zCBs+LX4xNL5q0JsiIJYaqXV4x34WXqS0
 2ZIoGqCehiptC6cygr8dO/p8pI3CqYU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-At0Y7tupP_6tQYExP8BgWw-1; Thu, 12 Jan 2023 08:49:33 -0500
X-MC-Unique: At0Y7tupP_6tQYExP8BgWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9E1D3811F3D;
 Thu, 12 Jan 2023 13:49:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E00BD40C2064;
 Thu, 12 Jan 2023 13:49:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH 1/7] hw/display: Move omap_lcdc.c out of target-specific
 source set
Date: Thu, 12 Jan 2023 14:49:22 +0100
Message-Id: <20230112134928.1026006-2-thuth@redhat.com>
In-Reply-To: <20230112134928.1026006-1-thuth@redhat.com>
References: <20230112134928.1026006-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: mI7dWhF3ZGny

From: Philippe Mathieu-Daudé <philmd@linaro.org>

While only used by the ARM targets, this device can be built
once for all.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221209170042.71169-2-philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/meson.build b/hw/display/meson.build
index 7a725ed80e..2cab7a8ff2 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -111,7 +111,7 @@ if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
   hw_display_modules += {'virtio-vga-gl': virtio_vga_gl_ss}
 endif
 
-specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_lcdc.c'))
+softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_lcdc.c'))
 
 softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-vga-stub.c'))
 modules += { 'hw-display': hw_display_modules }
-- 
2.31.1

