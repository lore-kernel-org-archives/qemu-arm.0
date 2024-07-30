Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2222088njb;
        Tue, 30 Jul 2024 01:11:45 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVeuqwoIpI7Lc4m1I6lrbMw/v9vdbSGJgqLZMlnZrxEKsD+M+K/zs9Y/7poGtBDYIgzq6c2Eq+KonmvmEzgM5xqzGGieIdi
X-Google-Smtp-Source: AGHT+IHADaIMA0HVV/O/IQbMlYjUFDaykBe1lDkDWaTvikhNPMd5c9e/SiJqzVYsMsd8UmA/1Dzg
X-Received: by 2002:a17:906:6a0f:b0:a77:d63e:d8fd with SMTP id a640c23a62f3a-a7d3ffd510amr723782866b.12.1722327105682;
        Tue, 30 Jul 2024 01:11:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722327105; cv=pass;
        d=google.com; s=arc-20160816;
        b=QtrMw8cUozcE+yyqWf21AXVP62E/EiZ6yC8q1xLJbYgDNBOZjmLuHtwyxPVLEHWF08
         WVL1lHgMOru1UNvUNYTomPD5kSRn22pYRhLjYBvKk9KvpgXSedzASPXu/bfNk4iGbWTc
         vwpYOZ/Ct0/IzPTY2qpDfpKavKIw7wgKiSEa3fcLm2XtIU1f0RCpkosmGNnYRknev769
         rZjTTMGd1DfBskpe5L5PkVN+18x6tfHWMDIJdECg8TrbfZmYMdl1nJDlVqZQ8GKZ4ZhZ
         kgU4pHzvGCkiCUZ/av33WfFWVEuNY0u4PMlTlL0mA7ubAC+EkRPuuitWsPuaeqf7fOka
         cHhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=xMIEpCCl6zS+beX53hmPJoZEMmrLIy8jA6bJzpPwIu0=;
        fh=K9hvV5Ipi0VSlYxX/fm25RHJYlx13FFj5pikD+TSDpg=;
        b=U6KB84P5aeYlnSKOIpCmhYSGmeok4VvtlJop7CSfiwbPjdJotjs1dHBsMe48YuhaDR
         I7Cz2QraSEcD7A0u9W8abSOJCa2hKntIrbE/gppYBhXkyn7a2xOv57wJxZBC31/n+Frc
         Qo9QqMFaAXkmarKEmEmB1+ckZ/ojlrKQmAx+T1I3T8BmsGe8n7Mec+o+aXm2DuY7YMQm
         1QVe/brXUBksfhtKaBEmTqaK5Z/F8UG+9+1Ue0u1t1pLc+3nyynGaVOX+Y29jMn3IflY
         d5uMYtyUfdXfE4zA3fdJr6sWK69nk4qlMa2KjduoLC/bjQ8A3BVvgX4uytA+BBSTL+Po
         HWkQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DnoXdzWI;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-22618-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-22618-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-22618-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-a7acac694ffsi730443066b.647.2024.07.30.01.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 01:11:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-22618-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DnoXdzWI;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-22618-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-22618-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 467A91F21B49
	for <alex.bennee@linaro.org>; Tue, 30 Jul 2024 08:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B87193081;
	Tue, 30 Jul 2024 08:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DnoXdzWI"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEE7190468
	for <kvm@vger.kernel.org>; Tue, 30 Jul 2024 08:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722327054; cv=none; b=ILg2YIjUNu94LhjkqpM6kAbe2Ok/PufE1LMf4O+mom/LZ2P4+hIEz4ZCjStt/mCU/f4FhPYUbDQX5nURrNMY3M2iRCnEcXBHvDcp0X3In6dBTUgUEvQpz0yqZLkDSd94qUrBH+8iEcPxpz7oEcVGAHJhc0FBUCGJxwMt0RNa7P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722327054; c=relaxed/simple;
	bh=twDc1cKQz2XT/2iu7TIbqog+LY2eXLnENuSx64TaCsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=eK07LkxtEB0CwhWSi42PsD7K8Tls3afvrV0PDP5lXcjVEae12kWdcboKYyEoFsEQpYiEhv9/aVAn1TrJ+Z4wbSEdIHmSfWd86bhKhvbIZhVVbJMVkdfYIwtpyx/ul7EnR2CvUheJk7Hu5V2oJ1NA9aPKI02C06h2Gb3ANqdstwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DnoXdzWI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722327051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xMIEpCCl6zS+beX53hmPJoZEMmrLIy8jA6bJzpPwIu0=;
	b=DnoXdzWIzdP4iqF3hLbOScV144HAzuW5ZrgHYXo26XykObmdDWbfQRj7KNRWe4JITyDt8G
	VmicKMrXphI1J2lX1820G23y26YJjkz7PNmejSixatroIznkIRS5KWdA3tlicECoW3mpGR
	qHW0ZX1KIpN8s41pYj/TRNWKMrSWcKA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-1QwAeZ54PsiJK9zLtaKlnw-1; Tue,
 30 Jul 2024 04:10:47 -0400
X-MC-Unique: 1QwAeZ54PsiJK9zLtaKlnw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 714C519560A2;
	Tue, 30 Jul 2024 08:10:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.65])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 634E11955D45;
	Tue, 30 Jul 2024 08:10:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id DE17421F4B93; Tue, 30 Jul 2024 10:10:32 +0200 (CEST)
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
Subject: [PATCH 06/18] qapi/ebpf: Drop temporary 'prefix'
Date: Tue, 30 Jul 2024 10:10:20 +0200
Message-ID: <20240730081032.1246748-7-armbru@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: mkBVq6+zonWw

Recent commit "qapi: Smarter camel_to_upper() to reduce need for
'prefix'" added a temporary 'prefix' to delay changing the generated
code.

Revert it.  This improves EbpfProgramID's generated enumeration
constant prefix from EBPF_PROGRAMID to EBPF_PROGRAM_ID.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/ebpf.json  | 1 -
 ebpf/ebpf_rss.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/qapi/ebpf.json b/qapi/ebpf.json
index 166a9d0eb0..e500b5a744 100644
--- a/qapi/ebpf.json
+++ b/qapi/ebpf.json
@@ -42,7 +42,6 @@
 # Since: 9.0
 ##
 { 'enum': 'EbpfProgramID',
-  'prefix': 'EBPF_PROGRAMID',   # TODO drop
   'if': 'CONFIG_EBPF',
   'data': [ { 'name': 'rss' } ] }
 
diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
index 87f0714910..dcaa80f380 100644
--- a/ebpf/ebpf_rss.c
+++ b/ebpf/ebpf_rss.c
@@ -271,4 +271,4 @@ void ebpf_rss_unload(struct EBPFRSSContext *ctx)
     ctx->map_indirections_table = -1;
 }
 
-ebpf_binary_init(EBPF_PROGRAMID_RSS, rss_bpf__elf_bytes)
+ebpf_binary_init(EBPF_PROGRAM_ID_RSS, rss_bpf__elf_bytes)
-- 
2.45.0

