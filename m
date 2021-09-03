Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1175153lfb;
        Fri, 3 Sep 2021 04:09:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyd2kjJjmwI5w8rQ/1xss7Sie7Qf7/dhwkMTQ40k6KlSzsI+JPIbr7JwrkruIeoipf1q0lC
X-Received: by 2002:a17:906:f117:: with SMTP id gv23mr3406756ejb.406.1630667349891;
        Fri, 03 Sep 2021 04:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667349; cv=none;
        d=google.com; s=arc-20160816;
        b=tdW7i8uzPiLkhfove7ygpvPmHPa4t6F3BKapZS8qk7+Jps4R2E2vgYD7KYvjKLmFiY
         Yui1sMB5qgDzerUTmFqo9Xapmaorxu/PLUgOtwTy4NzCaolSllXqFUBCsbb1CVBt1n2T
         5a5GAQJHLUW4HOd9CWMEzvZd/t/HIlPGcjW36KtZOMVhp19vZt1IdPIe9KIkm9i7K2Bz
         rN1b8bdQS5jbuOcKaOlLwdD2IqXdFcPwSGzU03YVZ0bdL5XXRbZEoOGVCVZKv1Oj/+vx
         FLeMsy4vteDStYoTGZDwbYNfu4re6Keigpg7X0FCsuNSYf4/TsLuzuWOnF+D/GBlcNBx
         ZVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mHnJ0cVcteOlyXY2WQSoPOrlbaqqNkIp409L2/nVF/Q=;
        b=gh/qsHShzZ7tTaLLipQ9gyNvj0fehbpQTQ8/FgHgTNNrOenqoEOh6FerEXg1hWD0a9
         +1AqwJYCvnH01J49WSCwmNM7+AqSW/xIrMNxUd+1SX3hyvH2q6QIxkvigepFwxeyFOTo
         ouRFE2ziV2r7YWdac4T3hsQH6hdjHl6BAZawRP0kskqoRbdHZLXsyBy99DalIsQNyH4i
         53QRCTd3ZITinD5W20LQlrmrIvHitNlRJEc4761CdBG+zLCdIUVyxX/mc2VEfwWdUhYX
         HqOgAknXu1S50JFJKwMxTZMWD6IdF8yAwCr+FxCmCNQsfq7H0uLa9VM7GPxSwqSHUPWa
         hMhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UWh7Qwr2;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id k10si5567415edq.158.2021.09.03.04.09.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:09:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UWh7Qwr2;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHnJ0cVcteOlyXY2WQSoPOrlbaqqNkIp409L2/nVF/Q=;
	b=UWh7Qwr21f2LdytOSO0Wr3bdbzXbcK3JeAOWaPs7mSoKwLgWyAdAD0CHLbUu2YV6SnKH4I
	Qy7FecaEtv56gcbMqs2h4C450iY384qaTy0iQIF9nw39lgR/41BmlrFVbEKeIlmP397/U/
	O0iJiHgACl8rJZ6PdiFlVdEb9Et21No=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-ubNVYZj4N4maQEayAOpfhg-1; Fri, 03 Sep 2021 07:09:05 -0400
X-MC-Unique: ubNVYZj4N4maQEayAOpfhg-1
Received: by mail-wm1-f69.google.com with SMTP id c2-20020a7bc8420000b0290238db573ab7so2519454wml.5
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mHnJ0cVcteOlyXY2WQSoPOrlbaqqNkIp409L2/nVF/Q=;
        b=kYabqmcSRpBslqBOefDIbmNOjND0q6wlMI7c3bRR/PTgxXmOW4rWrr0iPW7i76AP+2
         GZwp2LL3YydP4NtmYbR/qWS3xjwvaLVRcUbJw0jDC9kg/GCl84pL5nxTR2zox6kNeJD/
         WQv3TQ30GOOkBqKeTOj5jjEYy12yCdlxYvG0tBxL7/2XQnPs2CimEfgSlhno3D47yHv/
         vbM0rmpU624VF51QuQV71Q8Hc7oVzuiM3JTjcAHwwt/zWSjnc1yyw9OWDgO9ZR1Ie/PA
         afq88vxsSxp9m67uIVdnIRAGKBk13JvVyBrYhMQUNBNG+GrXzsLcH0WN8PnRfWYlth6T
         GI6Q==
X-Gm-Message-State: AOAM530Kcr2OqD+7yQnGk5uBImW4vZbllzhtVyRcc/eUZrzhzXcHJM4D
	0TPZf0q+HfZjNwC0M3sUgLO+SeDlSmvk0XziPgWbId9o/wbEEb3OvuegTAub0fEW30S0H68D2Nm
	28mtt3lzrFUUTK55I
X-Received: by 2002:a05:600c:2210:: with SMTP id z16mr7583379wml.70.1630667344631;
        Fri, 03 Sep 2021 04:09:04 -0700 (PDT)
X-Received: by 2002:a05:600c:2210:: with SMTP id z16mr7583359wml.70.1630667344397;
        Fri, 03 Sep 2021 04:09:04 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id q13sm3880071wmj.46.2021.09.03.04.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:09:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Zhang Chen <chen.zhang@intel.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	John Snow <jsnow@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Xu <peterx@redhat.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH 21/28] ui/clipboard: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:55 +0200
Message-Id: <20210903110702.588291-22-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Wje7UERDD/Kf

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
TODO: audit qemu_clipboard_set_data() calls
---
 ui/clipboard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index d7b008d62a0..0e12a55d3e5 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -123,7 +123,7 @@ void qemu_clipboard_set_data(QemuClipboardPeer *peer,
     }
 
     g_free(info->types[type].data);
-    info->types[type].data = g_memdup(data, size);
+    info->types[type].data = g_memdup2_qemu(data, size);
     info->types[type].size = size;
     info->types[type].available = true;
 
-- 
2.31.1
