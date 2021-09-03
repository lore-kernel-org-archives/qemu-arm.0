Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1175361lfb;
        Fri, 3 Sep 2021 04:09:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyajsMaXFNBK4pqyOisYoG03qdg1tecy6nEi6yzjy3ZgExvvs8TPlgdUXkkZAE4tdbcI2/B
X-Received: by 2002:a17:907:7856:: with SMTP id lb22mr3484678ejc.264.1630667365117;
        Fri, 03 Sep 2021 04:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667365; cv=none;
        d=google.com; s=arc-20160816;
        b=FQICf95mb+uQej3jz1lo3pphwgStlIm2Egyl8qWoZPJ/NxYJokNj0uHTQx//2/XLIQ
         AmZ9yQZqlcKN+1q/q15F88b3dqW9mc45DCqM9qB7o1lK/Vck2rAG/gSBiq6/CQPuiGYs
         lGKiyVJsahWbSAkcdVyu0nTI6NbYtwa6UPnmGe19RXJVbWjIBvAEmkUNYTWZAnsVrYUz
         6psVpz7Cly9LwTvw6yOt1bt6J9zNTAoDHCHAAzjeV+MKkT2tdt8eHnV/gDwuyTujspsq
         AUBEnmbw7shYSe8xiIN4hD9u2RdLvyOJ9ga55zcc1k1uLFqp3EDP9FgEe4XpLJdNieU4
         ZVhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=n0triH/V2nmMAjnP2t96Jm0J8HMx9Dls9aYUNoC2xTc=;
        b=gVwoMLbc1nqzIfZiBNNGW9GTFa7YqO0Z7ShlDw3EnWwMetSqlTvS69IPLStpqSwa5X
         8v6QqAnXQ+fjKy9d+AoOrL6bunylI7jUPmlYgrTf8L+SPm8uSZQbJe58vYKiJloz7bTB
         CudPPbd5VKm7C79KPEuZRiS/CyQjYAt3eUyaU6icMLHyCpQw9ikEi7NKn/YMaGa3EN7Y
         72Mb9v+v9G37oYXJ28irwi78WFkEovpNADSs/d4bJMAB9jAYgZRrs+idy25CjHnzBYq9
         NNRyt8Yy34RfCmITD7FgowLCWHFuQmzEmT6tZ7J35SSE1AdeGNAuwZS0R6MM5M1D79Xj
         cOEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VKEXeGhx;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id l3si5706241ejd.313.2021.09.03.04.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:09:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VKEXeGhx;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n0triH/V2nmMAjnP2t96Jm0J8HMx9Dls9aYUNoC2xTc=;
	b=VKEXeGhx8qlYuyTw21/F7tdL9egVYD3Olt3IBKBoTrlevOYCyWRgQC1yUdCfuV6M0aGR80
	XrYEEed3gHR8J1odD0O/NlmIOu1Kb79LMRuEGW0o865E86f8yWvWoKObj1MAZ0yJqYf8u8
	oi5GroRLg2Q4GB34uOWgA6XepfiCg+Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-BjkiC2z4O7Cvs259OfP75w-1; Fri, 03 Sep 2021 07:09:23 -0400
X-MC-Unique: BjkiC2z4O7Cvs259OfP75w-1
Received: by mail-wr1-f70.google.com with SMTP id n1-20020a5d4c41000000b00159305d19baso1455830wrt.11
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n0triH/V2nmMAjnP2t96Jm0J8HMx9Dls9aYUNoC2xTc=;
        b=XKGvdKXhLadDqpbzii+W4uVRNVXOeyJFwTuhHNbTxgQF9v4He5jKPCcVKi45dJ18vG
         KKBs4T3nla3QU54PwYZkkP2RWI3Z+63ecVc3TYBvKBstsXcL9a3gW4dBYVt5HUn8r/oM
         kyZPowMxMZKJiwbOBcvN3hlYRtIEugAuik2CqBK84kJq3t1mKqcSOYxNifh46sGoB/nD
         //0u7yLHkjW/fjtqxavBoDyOs5J1LnOGoeLuSgzwIE3puMDIVTWaNWRUBTH7x9J4O7dq
         kGvGjXFM3y6f5ujjjFfo62Ny2gbi1iYIUL86Ls7of/eZ6qBNF21MOD658ZhrdFTlJ6cG
         tOuw==
X-Gm-Message-State: AOAM531uffyg86w5ofL37rIdUqtDYSxKfZ9m22+uIG/Jl0Z9j4RZ4taO
	HkiosF7zb97LagtpPInV/SfyfZpDX1c91p6uoCOVkU7BqiDxUXaoRRAlSioQRyoLy+eWviKThPf
	0yWsAOKsrFFOoEk1x
X-Received: by 2002:a05:6000:34e:: with SMTP id e14mr3400063wre.401.1630667361816;
        Fri, 03 Sep 2021 04:09:21 -0700 (PDT)
X-Received: by 2002:a05:6000:34e:: with SMTP id e14mr3400010wre.401.1630667361655;
        Fri, 03 Sep 2021 04:09:21 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id r25sm4622504wra.12.2021.09.03.04.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:09:21 -0700 (PDT)
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
Subject: [PATCH 24/28] tests/qtest: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:58 +0200
Message-Id: <20210903110702.588291-25-philmd@redhat.com>
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
X-TUID: 2F2gDlj4TEjs

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
 tests/qtest/libqos/ahci.c   | 6 +++---
 tests/qtest/libqos/qgraph.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c
index fba3e7a954e..8ef1bda7c1c 100644
--- a/tests/qtest/libqos/ahci.c
+++ b/tests/qtest/libqos/ahci.c
@@ -639,8 +639,8 @@ void ahci_exec(AHCIQState *ahci, uint8_t port,
     AHCIOpts *opts;
     uint64_t buffer_in;
 
-    opts = g_memdup((opts_in == NULL ? &default_opts : opts_in),
-                    sizeof(AHCIOpts));
+    opts = g_memdup2_qemu((opts_in == NULL ? &default_opts : opts_in),
+                          sizeof(AHCIOpts));
 
     buffer_in = opts->buffer;
 
@@ -860,7 +860,7 @@ AHCICommand *ahci_command_create(uint8_t command_name)
     g_assert(!props->ncq || props->lba48);
 
     /* Defaults and book-keeping */
-    cmd->props = g_memdup(props, sizeof(AHCICommandProp));
+    cmd->props = g_memdup2_qemu(props, sizeof(AHCICommandProp));
     cmd->name = command_name;
     cmd->xbytes = props->size;
     cmd->prd_size = 4096;
diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
index d1dc4919305..c2e7719bed9 100644
--- a/tests/qtest/libqos/qgraph.c
+++ b/tests/qtest/libqos/qgraph.c
@@ -93,7 +93,7 @@ static void add_edge(const char *source, const char *dest,
     edge->type = type;
     edge->dest = g_strdup(dest);
     edge->edge_name = g_strdup(opts->edge_name ?: dest);
-    edge->arg = g_memdup(opts->arg, opts->size_arg);
+    edge->arg = g_memdup2_qemu(opts->arg, opts->size_arg);
 
     edge->before_cmd_line =
         opts->before_cmd_line ? g_strconcat(" ", opts->before_cmd_line, NULL) : NULL;
-- 
2.31.1
