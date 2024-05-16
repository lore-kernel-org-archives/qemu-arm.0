Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp1206861ejl;
        Thu, 16 May 2024 01:41:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKFSHe8Oj8C4IUD9PnloLuCSwEE4sYvPEIVMJLGCLLYpQ0wi2PfdaYW5+3andmkXhLoLxHvfRSro25vSY/UosRL5g9w7p0
X-Google-Smtp-Source: AGHT+IGC5lc6bVP7TtXiEu2kgrZnYqctrjgqGQ2Tz7nQuLBaaqkyaQwHH1f/utKhmXRhIwbz8t8g
X-Received: by 2002:a05:6214:5c03:b0:6a0:e9f2:75e4 with SMTP id 6a1803df08f44-6a168167a06mr192009116d6.20.1715848860237;
        Thu, 16 May 2024 01:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715848860; cv=none;
        d=google.com; s=arc-20160816;
        b=IJThIVPISu9TW+Bd7ogZzd99x4wTzWjfIf3T9VLDvvg60sb0RSTH3b0b/5MmeTqlnI
         DXTGy87TC9FgkGFIIR4hk9+ycnRVvC6FZYo/Nhr4Wrx1+b0NySR3tL/Cw50DbyfRgEkH
         WPfd1YuAdKgWd20VcGk16dIlMr6G3rA3T8gGJcm31DfcNZoXna4hGQlQ+SY3KEn+X9R7
         G0o8FC9pSIXS6Z85Gy5PkNMKu+HpaR13ZVrnOzKfhF6DWIxVlBTnoMGwDi4FzL6wwW6u
         bKjJ5Z/FDjp9VGOhS/+mbp3JolkVnacEHd5p6/4N/0phEY6jw64XrHLoFIG/8LKjL3iw
         rkPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=p3/MmczGxyTXcugQUY7v5Ea0HYsjt7KFh3KUmk21BK4=;
        fh=3rKrmVGlLGnE8IV3p8v3FKLInAe/rTYQZyGxjdKIRRU=;
        b=mSs0L1jWzsdIYPkMewiWict5bpouCtb6rITOXGN1qsR2DvjblpZC/khZDcF9JQiELO
         TgmNdEr1xVLZuecJSn8HkDYm7aSnGuoNVHf/aBMzvK/Kz3qQgfNLwyIoRQIYaGSp5LZe
         nD5lwBHKBy03rhFfR901/YIH0A9mrTWr5BobpfODC3YyYzdW0csxdQoAB7Szw5b1IhYb
         PxvQVgly8ra1KZ15SBkgJqgUBH4tQPq44utIvtnsuCMCp6y7ddk8yyMmHOQ0wg4B5c5w
         DGHQORlRHtOBxAzsIWC4DdB/lKgCARkdSyLmtJLtBv7EhAhv93e3nJhBaYz+8vLg3DEk
         MJRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FXnjnrfY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f1d73f6si7052546d6.107.2024.05.16.01.41.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 May 2024 01:41:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FXnjnrfY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s7WfJ-00036B-96; Thu, 16 May 2024 04:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1s7WfG-00032R-C2
 for qemu-devel@nongnu.org; Thu, 16 May 2024 04:40:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1s7WfE-0003VB-R8
 for qemu-devel@nongnu.org; Thu, 16 May 2024 04:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715848836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p3/MmczGxyTXcugQUY7v5Ea0HYsjt7KFh3KUmk21BK4=;
 b=FXnjnrfYOzIBaaCar/EUMZmvpXQjyx8Dz4pBQj4fN/iMiSBGhyoDAS8eimyPi0Ua5q9AR8
 Sy9BffHbbTdppa72TzO9T+9YimzufB1PXOE8xbqSJ6M4SjHnXFEDyiCn4tULHNzO9D3JuT
 +QT4NZ/AmRB/OqtWnjWwF/rg2GJi2V4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-539-i58lFY68N5CXSes8klEyWQ-1; Thu,
 16 May 2024 04:40:31 -0400
X-MC-Unique: i58lFY68N5CXSes8klEyWQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B6423800090;
 Thu, 16 May 2024 08:40:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DB012026D68;
 Thu, 16 May 2024 08:40:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Fiona Ebner <f.ebner@proxmox.com>, Fabiano Rosas <farosas@suse.de>,
 Yanan Wang <wangyanan55@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v4 1/3] migration: add "exists" info to load-state-field trace
Date: Thu, 16 May 2024 12:40:20 +0400
Message-ID: <20240516084022.1398919-2-marcandre.lureau@redhat.com>
In-Reply-To: <20240516084022.1398919-1-marcandre.lureau@redhat.com>
References: <20240516084022.1398919-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.935,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: nrX+ig6TPgNI

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 migration/vmstate.c    | 5 +++--
 migration/trace-events | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/migration/vmstate.c b/migration/vmstate.c
index ef26f26ccd..b51212a75b 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -128,8 +128,9 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
         }
     }
     while (field->name) {
-        trace_vmstate_load_state_field(vmsd->name, field->name);
-        if (vmstate_field_exists(vmsd, field, opaque, version_id)) {
+        bool exists = vmstate_field_exists(vmsd, field, opaque, version_id);
+        trace_vmstate_load_state_field(vmsd->name, field->name, exists);
+        if (exists) {
             void *first_elem = opaque + field->offset;
             int i, n_elems = vmstate_n_elems(opaque, field);
             int size = vmstate_size(opaque, field);
diff --git a/migration/trace-events b/migration/trace-events
index d0c44c3853..0b7c3324fb 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -58,7 +58,7 @@ postcopy_page_req_sync(void *host_addr) "sync page req %p"
 vmstate_load_field_error(const char *field, int ret) "field \"%s\" load failed, ret = %d"
 vmstate_load_state(const char *name, int version_id) "%s v%d"
 vmstate_load_state_end(const char *name, const char *reason, int val) "%s %s/%d"
-vmstate_load_state_field(const char *name, const char *field) "%s:%s"
+vmstate_load_state_field(const char *name, const char *field, bool exists) "%s:%s exists=%d"
 vmstate_n_elems(const char *name, int n_elems) "%s: %d"
 vmstate_subsection_load(const char *parent) "%s"
 vmstate_subsection_load_bad(const char *parent,  const char *sub, const char *sub2) "%s: %s/%s"
-- 
2.41.0.28.gd7d8841f67

