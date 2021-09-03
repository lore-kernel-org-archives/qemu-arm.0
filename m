Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1174783lfb;
        Fri, 3 Sep 2021 04:08:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd2aeY7NZ7tjnoLt155QSwcABxXB7F3aAQec7LRN5Hpnt+TJhWqwUxIBOkt2nHtlBlORkV
X-Received: by 2002:a05:6402:1c1e:: with SMTP id ck30mr3416911edb.103.1630667325120;
        Fri, 03 Sep 2021 04:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667325; cv=none;
        d=google.com; s=arc-20160816;
        b=EShzryE0NqsRneU5V07l0XHelMhW61KQfRAn1Ab7IcfXeTcwk2Ahco73eTEMaY/zNf
         xSMxJPLvL05f6xzribzrzOWu19xpyI3ZCmLgS5JvnRg1J1kO8pzwFRMYqGBIRhLx2Qei
         sCVEPimqzwhvC+XO38Vjt+ZhISF3zsjm9ViqzRpsBEOM6Hv4r8xJpUSuZrBPmNZ8onEf
         VfArpkDUaXwUH0xdVbOE8ECANDQGPQcmH7B8h7Wfm1hafIqRJRjYiGh+iFfOi7Vu3ZF6
         dt9YUnf2muakmWZatSlO+V8H64xQYO7lHQMMFHVIIRFUtkLIm5it/oIkZQbbh6ztmaS/
         wDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dyVB6AzxmMS8BlTCGJx6yUBvjK62NisiC2d6bnlid2E=;
        b=khdFtLjU9yz4ju6BYEkg/Vk4CQvl6NhIcYs1O+FAOncp4QJxw/5fvt8Gl5g+3h+wgD
         gZZoSl/wkfH1BGGsJrNQR1KbASbfb5JPrpDzMxA0jZ13gJB89jMYDdrEe2WWiGDJXD4q
         Xur6cB1dBr1OkZIFTWUA1l5ygSCHrLo7tLHRHZnHrhe/ebhAWkP/6w//hXMSgByysQvm
         EQD1+ADAnRUpsaSCXyNzGgGNs/7CNZuvZtFtS1mExl+ZpcdDG9B1M2D049uIQzq4N3Bq
         RXflIZgXV6uGpG3+C4h10AI7PVt4DfPHe0YnCssr9lHT0BZW3xJ7cW0EwSHlvwu4sJ/1
         J9Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V4WrOfve;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 18si6146459ejc.508.2021.09.03.04.08.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:08:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V4WrOfve;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dyVB6AzxmMS8BlTCGJx6yUBvjK62NisiC2d6bnlid2E=;
	b=V4WrOfve+2o/sCv5zyC3jTO9ur6gUOUZr5C6+PFzI2mN9p7oPx/nLghhhfRIPPfw2pYG77
	hOczQ/GIlZiKaff2JxzX4E2skWqmU4rOZ9M536pvKczctqiO5GELGkOHtc0lUkYtTZp75k
	PjRAgPKW1DmRrh+OfxsoHqhRg9m1tAY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-QvtWTBIdO4eZPUpGUNNkLQ-1; Fri, 03 Sep 2021 07:08:43 -0400
X-MC-Unique: QvtWTBIdO4eZPUpGUNNkLQ-1
Received: by mail-wr1-f71.google.com with SMTP id j1-20020adff541000000b001593715d384so1464883wrp.1
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dyVB6AzxmMS8BlTCGJx6yUBvjK62NisiC2d6bnlid2E=;
        b=UJqH7pjz/SgE4CtDC2kgcYIeMleZPulyuqrvMBNKEDBps5ChTqlx5Bqz7wyqX0kVm4
         FUXY5HczBrbJ8Q0NExIRephZbg/A0WQB6RQiF4cpe/D09atl0NOyBPfliEHoOZunySX5
         acQUUdD4h+s0LjIkeHoutJCpQRHagWnUYLYsklP8JyhGlQwLYM5dbLIaorPGl+ftmWRw
         7IGxUE86X5vwFTB8pnXd0vZhl+kzG0fuj4WJIR4ww1ZwoHC8yXy0YEOIb1UM9aQXiJ4c
         Xue4EngLbjZg8Vagl1Q7uz2wDOa9Ut6D7u7ZnjwmQt1zzc6dOMjx4Fn/MYWP5pt8z7ud
         f/2A==
X-Gm-Message-State: AOAM530R+0msT4IwKp9BFw2n374qWpqec/6gcl0kSaYfg+ElMHv8korD
	NQlbCqyhwLmd1l2png1yJ7PyquGvUmOu/eVER+go4+wFgsFH4QoR+XbyCwh3pg3lzEMcF40IGLk
	nnOllemRMNJbqiV2o
X-Received: by 2002:a05:600c:5102:: with SMTP id o2mr2733911wms.104.1630667321941;
        Fri, 03 Sep 2021 04:08:41 -0700 (PDT)
X-Received: by 2002:a05:600c:5102:: with SMTP id o2mr2733882wms.104.1630667321792;
        Fri, 03 Sep 2021 04:08:41 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id w9sm4439669wrs.7.2021.09.03.04.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:08:41 -0700 (PDT)
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
Subject: [PATCH 17/28] hw/rdma: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:51 +0200
Message-Id: <20210903110702.588291-18-philmd@redhat.com>
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
X-TUID: UELY3kOoC0ap

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
 hw/rdma/rdma_utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
index 98df58f6897..9792b1c8ef5 100644
--- a/hw/rdma/rdma_utils.c
+++ b/hw/rdma/rdma_utils.c
@@ -71,7 +71,7 @@ void rdma_protected_gqueue_append_int64(RdmaProtectedGQueue *list,
                                         int64_t value)
 {
     qemu_mutex_lock(&list->lock);
-    g_queue_push_tail(list->list, g_memdup(&value, sizeof(value)));
+    g_queue_push_tail(list->list, g_memdup2_qemu(&value, sizeof(value)));
     qemu_mutex_unlock(&list->lock);
 }
 
-- 
2.31.1
