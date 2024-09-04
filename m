Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp81165njb;
        Wed, 4 Sep 2024 04:22:54 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWH0UOl0Yp13V9BUJYyoB2MgnCFHPpVKNv8JGx/vFntEJuyeHnKGDIPaOTswq6kVrxqbw7u0L7k4gEirA==@linaro.org
X-Google-Smtp-Source: AGHT+IEScFVIZvEV/wF3oPzoSHEzGytsub0OelcP3anmyxFzl+bzpBEuFZcveg/AjOMi8wDCJbY/
X-Received: by 2002:a05:6358:5498:b0:1b5:eda9:963f with SMTP id e5c5f4694b2df-1b603ccaed3mr2263810555d.29.1725448974740;
        Wed, 04 Sep 2024 04:22:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1725448974; cv=pass;
        d=google.com; s=arc-20240605;
        b=OgPBOHcSNejEIxCgWglE7T4Lb7Wct7ktLHOq3ggMjfBjGfU7ILXXux20RL8q+d4VLQ
         vjALprMWpKY5cFvPLAwpfXwgszdXezVGtWaOsafKwWssKyL+5UsWVVYwsOv+faeWJz+Z
         1f5eRK/pCkw50loSXWHf6YDZYT5vQrZVHU3irEsSxnuSS7FT8U7edy6XJHJnzn9W+Gkc
         BrIJSIrjt2bQpIvFNQizfhD2DI2hwOnqhY0S6GdWvbzyWmzucYcdCyEBVpbjm0nJuHNt
         GUxL2FJ8AnUJBWD5MKftWsyHdmHnvoL4iXMIWEUeKlgVcGD+aCIeCN6C5nZJ1L03cAUM
         pRGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=60/S7nrmH8dWcOxOWOtd93pxbq0cOxGZapRifYABfNs=;
        fh=2RgeqnAYDZ5qP2GVxxraMbOq0lVKWzwDqa5qVTK9BeQ=;
        b=iwu98o1p9wuQmRYsbO/amTdCRcLbVH82LqPvjxctzl1lEDpzqJq9Z81V+OUUAP2Ozm
         ALw1u7hT7GbnMFwnMujyjA+OiSdRHxOn4WzlW0DtsPf/U/EQ5NlANpK1MdVccvJvODUD
         x0m8+vPBqIckwWkWaAXLp4xxlzB0DFAaZzRY45tQuvhefOSup3hns6B6Vb/TP/XfiMTK
         Svct2x9hTGZhc14iPjf9TM1qc5iTBCvjG2su27EVUQ/EXUnMEGoHXct0bjfqeNuX/S5N
         MRPddWcuJ2M5fUSFuuJkwy/JFRbFA9ChZbvQbQhfzsgsEah1A4rvhIzDuDLupLWBxOdD
         F/Tg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DQcGWjYY;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-25850-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-25850-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-25850-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7d4fbd807b8si2125235a12.66.2024.09.04.04.22.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 04:22:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-25850-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DQcGWjYY;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-25850-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-25850-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3748A28165B
	for <alex.bennee@linaro.org>; Wed,  4 Sep 2024 11:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1BDE522F;
	Wed,  4 Sep 2024 11:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DQcGWjYY"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191881CF7DA
	for <kvm@vger.kernel.org>; Wed,  4 Sep 2024 11:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448732; cv=none; b=hjEHeo88vy29knVL8H1dYa0Tql62pKpLHF4+E3KbjcuNC9TDDN2RMkoCjcdaLFVez4X8cjF+tBxZmmVteYcvOHh663lRzwBA0CbOQA4NHTbMLeRP8vx+DvDSNkWiNcYQWlfSq7MHWYGDLWnEqmBliHX3Xox7Z9ClaQAITvrFvPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448732; c=relaxed/simple;
	bh=rz6wNtjI6EAnAbpnIHz2TpGU//T4hwN2jOndCFi3guo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=E9qnIwEzoKDH/KB2EnYV50ZaPM60y9rd7+CUQfYi3KvHu5jqz7FTi4Hy9guCMjqXqJyIyiL7p6dF1G26luyZDxE27UfX9HKtWHzmiMqV24WtjVpA4bsmfErv5L+4iWl8evmySplLf2VHC9xXAq40P4G44UnPgjoeD8j23Oec1EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DQcGWjYY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725448729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=60/S7nrmH8dWcOxOWOtd93pxbq0cOxGZapRifYABfNs=;
	b=DQcGWjYYr8lUzgA1lCi7K0At/9t4ekyuBZtMT8jIzTUFRQK9zBjerSVD+SCNT2mFp+qZ0Y
	yWAKZvTx4EuA+Y7ZU9OMUPDNqzNiv2VQZyLtUyUFsR9wDaYXxT1J2F19J+s04T6oGWZjjH
	fcLWR5QRU8n6hp2w9FAXDiPExzdnXV8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-sjpFcQu1MvupF4SYoECIcA-1; Wed,
 04 Sep 2024 07:18:46 -0400
X-MC-Unique: sjpFcQu1MvupF4SYoECIcA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D3DE71955F56;
	Wed,  4 Sep 2024 11:18:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.112])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA1FB19560AA;
	Wed,  4 Sep 2024 11:18:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 97E0921E6939; Wed,  4 Sep 2024 13:18:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com,
	andrew@codeconstruct.com.au,
	andrew@daynix.com,
	arei.gonglei@huawei.com,
	berrange@redhat.com,
	berto@igalia.com,
	borntraeger@linux.ibm.com,
	clg@kaod.org,
	david@redhat.com,
	den@openvz.org,
	eblake@redhat.com,
	eduardo@habkost.net,
	farman@linux.ibm.com,
	farosas@suse.de,
	hreitz@redhat.com,
	idryomov@gmail.com,
	iii@linux.ibm.com,
	jamin_lin@aspeedtech.com,
	jasowang@redhat.com,
	joel@jms.id.au,
	jsnow@redhat.com,
	kwolf@redhat.com,
	leetroy@gmail.com,
	marcandre.lureau@redhat.com,
	marcel.apfelbaum@gmail.com,
	michael.roth@amd.com,
	mst@redhat.com,
	mtosatti@redhat.com,
	nsg@linux.ibm.com,
	pasic@linux.ibm.com,
	pbonzini@redhat.com,
	peter.maydell@linaro.org,
	peterx@redhat.com,
	philmd@linaro.org,
	pizhenwei@bytedance.com,
	pl@dlhnet.de,
	richard.henderson@linaro.org,
	stefanha@redhat.com,
	steven_lee@aspeedtech.com,
	thuth@redhat.com,
	vsementsov@yandex-team.ru,
	wangyanan55@huawei.com,
	yuri.benditovich@daynix.com,
	zhao1.liu@intel.com,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	kvm@vger.kernel.org,
	avihaih@nvidia.com
Subject: [PATCH v2 03/19] qapi/block-core: Drop temporary 'prefix'
Date: Wed,  4 Sep 2024 13:18:20 +0200
Message-ID: <20240904111836.3273842-4-armbru@redhat.com>
In-Reply-To: <20240904111836.3273842-1-armbru@redhat.com>
References: <20240904111836.3273842-1-armbru@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 1g73hYxxfXma

Recent commit "qapi: Smarter camel_to_upper() to reduce need for
'prefix'" added a temporary 'prefix' to delay changing the generated
code.

Revert it.  This improves XDbgBlockGraphNodeType's generated
enumeration constant prefix from
X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_BACKEND to
XDBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_BACKEND.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 1 -
 block.c              | 6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 452047102a..a7ae2da47b 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2011,7 +2011,6 @@
 # Since: 4.0
 ##
 { 'enum': 'XDbgBlockGraphNodeType',
-  'prefix': 'X_DBG_BLOCK_GRAPH_NODE_TYPE', # TODO drop
   'data': [ 'block-backend', 'block-job', 'block-driver' ] }
 
 ##
diff --git a/block.c b/block.c
index c317de9eaa..7d90007cae 100644
--- a/block.c
+++ b/block.c
@@ -6351,7 +6351,7 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
         if (!*name) {
             name = allocated_name = blk_get_attached_dev_id(blk);
         }
-        xdbg_graph_add_node(gr, blk, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_BACKEND,
+        xdbg_graph_add_node(gr, blk, XDBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_BACKEND,
                            name);
         g_free(allocated_name);
         if (blk_root(blk)) {
@@ -6364,7 +6364,7 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
              job = block_job_next_locked(job)) {
             GSList *el;
 
-            xdbg_graph_add_node(gr, job, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_JOB,
+            xdbg_graph_add_node(gr, job, XDBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_JOB,
                                 job->job.id);
             for (el = job->nodes; el; el = el->next) {
                 xdbg_graph_add_edge(gr, job, (BdrvChild *)el->data);
@@ -6373,7 +6373,7 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(Error **errp)
     }
 
     QTAILQ_FOREACH(bs, &graph_bdrv_states, node_list) {
-        xdbg_graph_add_node(gr, bs, X_DBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_DRIVER,
+        xdbg_graph_add_node(gr, bs, XDBG_BLOCK_GRAPH_NODE_TYPE_BLOCK_DRIVER,
                            bs->node_name);
         QLIST_FOREACH(child, &bs->children, next) {
             xdbg_graph_add_edge(gr, bs, child);
-- 
2.46.0

