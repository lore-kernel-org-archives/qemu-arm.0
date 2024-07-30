Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2221917njb;
        Tue, 30 Jul 2024 01:11:18 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU6g7tGcmf1w9KJHP4sO6Fg4A2503Bk4j30OaDH5u1EUBs7qVSzfQLIAZLOHwXk0wZuqozmOMrsGxLxHNjDjybcYqPGQfas
X-Google-Smtp-Source: AGHT+IEjs4dFm92O5C9Ne+dDqPs13nCElF5i2BHhU9NsKYxlTRHLwylKreB2HPrJRgKpF7DhNEIk
X-Received: by 2002:a05:6a00:948c:b0:70e:92e1:1366 with SMTP id d2e1a72fcca58-70ecea3af64mr7449479b3a.16.1722327077999;
        Tue, 30 Jul 2024 01:11:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722327077; cv=pass;
        d=google.com; s=arc-20160816;
        b=LJovkChv9VfJacF4G24AIGeKSY5bE2/JQX637yN/oaztHfLmbUPBn/1N0HWzChquDv
         /s3l1YnnySO9OH5yKiGNPgcby7M85ZGYpQRSb5xuFLW62OjW1+4sdZRLCFrJ8ZH3Qtxe
         XjUZP6jtDrLpKAa7Y+7NF+TSfWTUMh74AZjjRTfRXIC7hSpbzoZQiIr7CN6Lg0J+9FdF
         Qr2uRXuV2l7aacE7xQqbC3qutby0ci5KBvQMQwwbAvSkWQekGO102ECnA/QAe01eAQMG
         rdGjLx4EEbTYpZw//ggljzT4dmDDdTggxqCV04QhxGCKl3qH1Wdi/JdEqPFN9AoB8UBD
         71Mw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=GV+6KPGe99/i1xPJ5kS7xN1XeiEsEAI7uvO5HniHNZs=;
        fh=K9hvV5Ipi0VSlYxX/fm25RHJYlx13FFj5pikD+TSDpg=;
        b=t9RsPHZkGmVrtd/OnUshxiNKJ1qkJDJk4guwuLId78pFpJ9f2gVB5oENKqHJaYYudn
         zRx6mh5buG7/nbZG/Vpr5b1kCVmVKa6D0SRkrsN8baLKkljqvdxNwZVpbY/Yth61gvwz
         iO//BxiO7QqSAqdxwitu95BJZraP7Gq9NJsFGB6omJn5phaf2Np5cmmawrXAFKngeaOC
         KfKgn8FSFDiC5O14Tl09DLgiwbtCfy+vFT2vD9v1IYsbJ65009NA0C+qQ1GpNFTVyhYc
         coKjDmtsCch/Ru6nRYa8w5TQLoALVSFsyN26IHyqoY7AoJXHUzBP5N9XUcJL4MP//RPE
         F46g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gLpPimKU;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-22613-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-22613-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-22613-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7a9f8461c24si11692010a12.357.2024.07.30.01.11.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 01:11:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-22613-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gLpPimKU;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-22613-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-22613-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2734B236B0
	for <alex.bennee@linaro.org>; Tue, 30 Jul 2024 08:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC04190469;
	Tue, 30 Jul 2024 08:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gLpPimKU"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE8018FDD8
	for <kvm@vger.kernel.org>; Tue, 30 Jul 2024 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722327053; cv=none; b=iL0o7fCnlmQx+9Sv7DlifwkNBPtq5Nxp9MEO6YwIxLnHZrCCcFHKxhrqqpAe/xUnsQaRK6eqH6RSieczBGdNjQZ9S0BhzdNLm/3w5zrnlxfVVmwiZ8ywvLtfeQ+sCrIbu+bhWYnCFhm9UeliKPPUYxWKXIhIpLtU81FEcArsXw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722327053; c=relaxed/simple;
	bh=DxD7JxVEL8p/tBU4P3h6u4n014PGQ5qfjhpv2h3H6to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=sXYAj1QG6JQ7cNNwD+7nB85jLh5b5AwcYmf9zNujCR/pri2ugwrL7lxaA2ufLsbFeXzQ9Z7nddnmdFpeoziRPKa5G1NBPHQ1IcvX9+UV0XtYw17sT04d7wonh1ejU8ZlCzgvKq0cH4d9sWNWRDp42Gf1xgpgZGUjL+Ey4aO7jLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gLpPimKU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722327050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GV+6KPGe99/i1xPJ5kS7xN1XeiEsEAI7uvO5HniHNZs=;
	b=gLpPimKU5ItFMToj27m98+VMe9kIr1oGMmxCqJGJJV0xhdyqTmKl1DGABRYcAMsIGHElTd
	5y3GoaUFnJqRwyKwMWL02DUU2hw/IbNpwDOya2/gillgKuYlAPxIIPTGpsbWzJlhtdU8V+
	HMtGo7+a/bErvMK5yamPHGYPVUX6NZ4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-231-sUDGu6JOPuGkNhrx1I6LIA-1; Tue,
 30 Jul 2024 04:10:47 -0400
X-MC-Unique: sUDGu6JOPuGkNhrx1I6LIA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3930E1956088;
	Tue, 30 Jul 2024 08:10:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.65])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CBC1E19560AA;
	Tue, 30 Jul 2024 08:10:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D15BE21F4B8D; Tue, 30 Jul 2024 10:10:32 +0200 (CEST)
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
	kvm@vger.kernel.org
Subject: [PATCH 03/18] qapi/block-core: Drop temporary 'prefix'
Date: Tue, 30 Jul 2024 10:10:17 +0200
Message-ID: <20240730081032.1246748-4-armbru@redhat.com>
In-Reply-To: <20240730081032.1246748-1-armbru@redhat.com>
References: <20240730081032.1246748-1-armbru@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: cFiYU70a6tIt

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
index 897bc7e0e7..d4c869ac64 100644
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
2.45.0

