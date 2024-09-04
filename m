Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp81472njb;
        Wed, 4 Sep 2024 04:24:11 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXZ8re8ZaXWd5AgpyL/6fdtoRpt4A8/nsNSwmuk57EQ25wyvPr3ofXgnz9Zdm0zYp/N+N8XJsVnRH9umA==@linaro.org
X-Google-Smtp-Source: AGHT+IGrK1znJFGLqSKpidp5YqswZlWA6bE3sxMUS0b6eZFg6YQIjjLrKh6Wi1G0LRToNtQ4qGG5
X-Received: by 2002:a17:906:6a1a:b0:a73:9037:fdf5 with SMTP id a640c23a62f3a-a8a42fb11bbmr221868366b.6.1725449051434;
        Wed, 04 Sep 2024 04:24:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1725449051; cv=pass;
        d=google.com; s=arc-20240605;
        b=dbPl921M1ZlkZzL2u3H6FleV/am8c+FvW/xHhzSCpXW9hu5q+EJ8gLqDPj3r0ivnWW
         ldgJzjy+0X4Nx+IFgioUltQzZSr1NnG+41CB9km4p+9okgxoUYuYtF+N11t4KpZq3sDb
         KCWBopj2cSJT561MlzPum+NlulBGonfqZ8Wsdd/ueSH0cJRVa7yGoRNiiLEyBtlmfKMa
         cuXDSnKIys1wdx/Plc0TJNAUlOao8YoLrA4YmjiyZ0EbwWr53JuvsU6xNiUMfCCw4wTu
         bHRA6rjcwl8k0jgqVNvVVCAj2VgjRo3+o65U3USy7YSy6qONxxkUP7XPBZqaKYonp8Hx
         Uzjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=nUroX0vXvKhL/8z7tcNdIRkDute+jOG+hDXiUvRu6WU=;
        fh=2RgeqnAYDZ5qP2GVxxraMbOq0lVKWzwDqa5qVTK9BeQ=;
        b=XEvbRldQYo7jC7UVIC352kg0FpyxbNByvHvP6CHonjHhpJrtbLl+tjoabCf0fiAT2X
         L2jYgL431KMOF9w3Z+xuM14DmiQwJYH4B+xvqrRSQu0w3yaPAlpqA+3s838xHTKEZC2n
         pX/Iebx+qTrq9YTsc7cPT4ZHeKyM8uisWus4rHsG6En19umjDIIFTflFmuLtBgIZpI/G
         HpVA5+NHRe1IrfMrRXXzkKBLu4lsFRlx44/HTbrPIfcO2gvKtgvCbG3rrCO9rP7WoTNR
         bBiTk/eOW8P6ipfI0rNLSPih8+1fch7SxNi1NbRSMPy1EFeHsoLejIz/gWh0alkV2tH0
         na/Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FQhVVcUO;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-25865-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-25865-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-25865-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-a898912f9f2si1061762066b.426.2024.09.04.04.24.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 04:24:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-25865-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FQhVVcUO;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-25865-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-25865-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D34C91F21FF4
	for <alex.bennee@linaro.org>; Wed,  4 Sep 2024 11:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F59B1DA2F2;
	Wed,  4 Sep 2024 11:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FQhVVcUO"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB461DA109
	for <kvm@vger.kernel.org>; Wed,  4 Sep 2024 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448740; cv=none; b=j7L3XTPEXEKVVyGTz4nbLUHNsmCv+NkMoGRmhxaxLqGVF8HGnfBN9iVWcZ3wyzsAdL+3BdCL2TfD6rgi9TpZfY7T0Y83XGyhP+oddZak0z0HWidWVSDLEN4kuJU7ooGNSEeIUTnT9hgujkIRtlTz+6xYw3xO8vwoE2ZePQqvnuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448740; c=relaxed/simple;
	bh=0jy4JiylNSXTK/G/B7+8GtZKD1NoNvpHBfZHXNcO6SM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dIVESQkKCAPirED2iblpPeCII28uM6bN6XWolwkK/6B2tX4FJ7EWXA3fz/UOTHSQq1XMzAKCNgavP+Zoc//KISNqIZy65nOhZkMPCQ+sRfBzFPUuX9Dw27uXNrrJ0XVzH5qYVcb1c1Mb+qF/l0lmHt1BIV16Bj/NJUw2Vsc3iPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FQhVVcUO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725448737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUroX0vXvKhL/8z7tcNdIRkDute+jOG+hDXiUvRu6WU=;
	b=FQhVVcUOiiVt/Rog4+ELHA5LxBrwo0+/fguNY0/K6xt4KzBcQfKkNiFWpjG1W8PvDp2RwR
	dHdZ3fATRaS498wgJDHINCTiYQGX8+aWS5cE8V1quprGVaJCUi+n7ljf9nnAz/wxLYgubj
	2k6bQovTZd8npgKFTzajEooVBhmWwyE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-iYG9wXhTNGKOqN7f6QET-Q-1; Wed,
 04 Sep 2024 07:18:50 -0400
X-MC-Unique: iYG9wXhTNGKOqN7f6QET-Q-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AF1DD1955F25;
	Wed,  4 Sep 2024 11:18:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.112])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BCA411956052;
	Wed,  4 Sep 2024 11:18:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A118621E688F; Wed,  4 Sep 2024 13:18:36 +0200 (CEST)
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
Subject: [PATCH v2 05/19] qapi/crypto: Drop temporary 'prefix'
Date: Wed,  4 Sep 2024 13:18:22 +0200
Message-ID: <20240904111836.3273842-6-armbru@redhat.com>
In-Reply-To: <20240904111836.3273842-1-armbru@redhat.com>
References: <20240904111836.3273842-1-armbru@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: /8ajgA6b0qk+

Recent commit "qapi: Smarter camel_to_upper() to reduce need for
'prefix'" added two temporary 'prefix' to delay changing the generated
code.

Revert them.  This improves QCryptoBlockFormat's generated enumeration
constant prefix from Q_CRYPTO_BLOCK_FORMAT to QCRYPTO_BLOCK_FORMAT,
and QCryptoBlockLUKSKeyslotState's from
Q_CRYPTO_BLOCKLUKS_KEYSLOT_STATE to QCRYPTO_BLOCK_LUKS_KEYSLOT_STATE.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qapi/crypto.json               |  2 --
 block/crypto.c                 | 10 +++++-----
 block/qcow.c                   |  2 +-
 block/qcow2.c                  | 10 +++++-----
 crypto/block-luks.c            |  4 ++--
 crypto/block.c                 |  4 ++--
 tests/unit/test-crypto-block.c | 14 +++++++-------
 7 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/qapi/crypto.json b/qapi/crypto.json
index a192641a03..fb00c706b2 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -157,7 +157,6 @@
 # Since: 2.6
 ##
 { 'enum': 'QCryptoBlockFormat',
-  'prefix': 'Q_CRYPTO_BLOCK_FORMAT', # TODO drop
   'data': ['qcow', 'luks']}
 
 ##
@@ -360,7 +359,6 @@
 # Since: 5.1
 ##
 { 'enum': 'QCryptoBlockLUKSKeyslotState',
-  'prefix': 'Q_CRYPTO_BLOCKLUKS_KEYSLOT_STATE', # TODO drop
   'data': [ 'active', 'inactive' ] }
 
 ##
diff --git a/block/crypto.c b/block/crypto.c
index 4eed3ffa6a..80b2dba17a 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -682,7 +682,7 @@ err:
 static int block_crypto_probe_luks(const uint8_t *buf,
                                    int buf_size,
                                    const char *filename) {
-    return block_crypto_probe_generic(Q_CRYPTO_BLOCK_FORMAT_LUKS,
+    return block_crypto_probe_generic(QCRYPTO_BLOCK_FORMAT_LUKS,
                                       buf, buf_size, filename);
 }
 
@@ -691,7 +691,7 @@ static int block_crypto_open_luks(BlockDriverState *bs,
                                   int flags,
                                   Error **errp)
 {
-    return block_crypto_open_generic(Q_CRYPTO_BLOCK_FORMAT_LUKS,
+    return block_crypto_open_generic(QCRYPTO_BLOCK_FORMAT_LUKS,
                                      &block_crypto_runtime_opts_luks,
                                      bs, options, flags, errp);
 }
@@ -724,7 +724,7 @@ block_crypto_co_create_luks(BlockdevCreateOptions *create_options, Error **errp)
     }
 
     create_opts = (QCryptoBlockCreateOptions) {
-        .format = Q_CRYPTO_BLOCK_FORMAT_LUKS,
+        .format = QCRYPTO_BLOCK_FORMAT_LUKS,
         .u.luks = *qapi_BlockdevCreateOptionsLUKS_base(luks_opts),
     };
 
@@ -889,7 +889,7 @@ block_crypto_get_specific_info_luks(BlockDriverState *bs, Error **errp)
     if (!info) {
         return NULL;
     }
-    assert(info->format == Q_CRYPTO_BLOCK_FORMAT_LUKS);
+    assert(info->format == QCRYPTO_BLOCK_FORMAT_LUKS);
 
     spec_info = g_new(ImageInfoSpecific, 1);
     spec_info->type = IMAGE_INFO_SPECIFIC_KIND_LUKS;
@@ -1002,7 +1002,7 @@ coroutine_fn block_crypto_co_amend_luks(BlockDriverState *bs,
     QCryptoBlockAmendOptions amend_opts;
 
     amend_opts = (QCryptoBlockAmendOptions) {
-        .format = Q_CRYPTO_BLOCK_FORMAT_LUKS,
+        .format = QCRYPTO_BLOCK_FORMAT_LUKS,
         .u.luks = *qapi_BlockdevAmendOptionsLUKS_base(&opts->u.luks),
     };
     return block_crypto_amend_options_generic_luks(bs, &amend_opts,
diff --git a/block/qcow.c b/block/qcow.c
index c2f89db055..84d1cca296 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -831,7 +831,7 @@ qcow_co_create(BlockdevCreateOptions *opts, Error **errp)
     }
 
     if (qcow_opts->encrypt &&
-        qcow_opts->encrypt->format != Q_CRYPTO_BLOCK_FORMAT_QCOW)
+        qcow_opts->encrypt->format != QCRYPTO_BLOCK_FORMAT_QCOW)
     {
         error_setg(errp, "Unsupported encryption format");
         return -EINVAL;
diff --git a/block/qcow2.c b/block/qcow2.c
index 70b19730a3..dd359d241b 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3214,10 +3214,10 @@ qcow2_set_up_encryption(BlockDriverState *bs,
     int fmt, ret;
 
     switch (cryptoopts->format) {
-    case Q_CRYPTO_BLOCK_FORMAT_LUKS:
+    case QCRYPTO_BLOCK_FORMAT_LUKS:
         fmt = QCOW_CRYPT_LUKS;
         break;
-    case Q_CRYPTO_BLOCK_FORMAT_QCOW:
+    case QCRYPTO_BLOCK_FORMAT_QCOW:
         fmt = QCOW_CRYPT_AES;
         break;
     default:
@@ -5306,10 +5306,10 @@ qcow2_get_specific_info(BlockDriverState *bs, Error **errp)
         ImageInfoSpecificQCow2Encryption *qencrypt =
             g_new(ImageInfoSpecificQCow2Encryption, 1);
         switch (encrypt_info->format) {
-        case Q_CRYPTO_BLOCK_FORMAT_QCOW:
+        case QCRYPTO_BLOCK_FORMAT_QCOW:
             qencrypt->format = BLOCKDEV_QCOW2_ENCRYPTION_FORMAT_AES;
             break;
-        case Q_CRYPTO_BLOCK_FORMAT_LUKS:
+        case QCRYPTO_BLOCK_FORMAT_LUKS:
             qencrypt->format = BLOCKDEV_QCOW2_ENCRYPTION_FORMAT_LUKS;
             qencrypt->u.luks = encrypt_info->u.luks;
             break;
@@ -5948,7 +5948,7 @@ static int coroutine_fn qcow2_co_amend(BlockDriverState *bs,
             return -EOPNOTSUPP;
         }
 
-        if (qopts->encrypt->format != Q_CRYPTO_BLOCK_FORMAT_LUKS) {
+        if (qopts->encrypt->format != QCRYPTO_BLOCK_FORMAT_LUKS) {
             error_setg(errp,
                        "Amend can't be used to change the qcow2 encryption format");
             return -EOPNOTSUPP;
diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index 45347adeeb..7b9c7b292d 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -1861,11 +1861,11 @@ qcrypto_block_luks_amend_options(QCryptoBlock *block,
     QCryptoBlockAmendOptionsLUKS *opts_luks = &options->u.luks;
 
     switch (opts_luks->state) {
-    case Q_CRYPTO_BLOCKLUKS_KEYSLOT_STATE_ACTIVE:
+    case QCRYPTO_BLOCK_LUKS_KEYSLOT_STATE_ACTIVE:
         return qcrypto_block_luks_amend_add_keyslot(block, readfunc,
                                                     writefunc, opaque,
                                                     opts_luks, force, errp);
-    case Q_CRYPTO_BLOCKLUKS_KEYSLOT_STATE_INACTIVE:
+    case QCRYPTO_BLOCK_LUKS_KEYSLOT_STATE_INACTIVE:
         return qcrypto_block_luks_amend_erase_keyslots(block, readfunc,
                                                        writefunc, opaque,
                                                        opts_luks, force, errp);
diff --git a/crypto/block.c b/crypto/block.c
index 3bcc4270c3..899561a080 100644
--- a/crypto/block.c
+++ b/crypto/block.c
@@ -26,8 +26,8 @@
 #include "block-luks.h"
 
 static const QCryptoBlockDriver *qcrypto_block_drivers[] = {
-    [Q_CRYPTO_BLOCK_FORMAT_QCOW] = &qcrypto_block_driver_qcow,
-    [Q_CRYPTO_BLOCK_FORMAT_LUKS] = &qcrypto_block_driver_luks,
+    [QCRYPTO_BLOCK_FORMAT_QCOW] = &qcrypto_block_driver_qcow,
+    [QCRYPTO_BLOCK_FORMAT_LUKS] = &qcrypto_block_driver_luks,
 };
 
 
diff --git a/tests/unit/test-crypto-block.c b/tests/unit/test-crypto-block.c
index 42cfab6067..2a6c6e99e5 100644
--- a/tests/unit/test-crypto-block.c
+++ b/tests/unit/test-crypto-block.c
@@ -39,14 +39,14 @@
 #endif
 
 static QCryptoBlockCreateOptions qcow_create_opts = {
-    .format = Q_CRYPTO_BLOCK_FORMAT_QCOW,
+    .format = QCRYPTO_BLOCK_FORMAT_QCOW,
     .u.qcow = {
         .key_secret = (char *)"sec0",
     },
 };
 
 static QCryptoBlockOpenOptions qcow_open_opts = {
-    .format = Q_CRYPTO_BLOCK_FORMAT_QCOW,
+    .format = QCRYPTO_BLOCK_FORMAT_QCOW,
     .u.qcow = {
         .key_secret = (char *)"sec0",
     },
@@ -55,7 +55,7 @@ static QCryptoBlockOpenOptions qcow_open_opts = {
 
 #ifdef TEST_LUKS
 static QCryptoBlockOpenOptions luks_open_opts = {
-    .format = Q_CRYPTO_BLOCK_FORMAT_LUKS,
+    .format = QCRYPTO_BLOCK_FORMAT_LUKS,
     .u.luks = {
         .key_secret = (char *)"sec0",
     },
@@ -64,7 +64,7 @@ static QCryptoBlockOpenOptions luks_open_opts = {
 
 /* Creation with all default values */
 static QCryptoBlockCreateOptions luks_create_opts_default = {
-    .format = Q_CRYPTO_BLOCK_FORMAT_LUKS,
+    .format = QCRYPTO_BLOCK_FORMAT_LUKS,
     .u.luks = {
         .key_secret = (char *)"sec0",
     },
@@ -73,7 +73,7 @@ static QCryptoBlockCreateOptions luks_create_opts_default = {
 
 /* ...and with explicit values */
 static QCryptoBlockCreateOptions luks_create_opts_aes256_cbc_plain64 = {
-    .format = Q_CRYPTO_BLOCK_FORMAT_LUKS,
+    .format = QCRYPTO_BLOCK_FORMAT_LUKS,
     .u.luks = {
         .key_secret = (char *)"sec0",
         .has_cipher_alg = true,
@@ -87,7 +87,7 @@ static QCryptoBlockCreateOptions luks_create_opts_aes256_cbc_plain64 = {
 
 
 static QCryptoBlockCreateOptions luks_create_opts_aes256_cbc_essiv = {
-    .format = Q_CRYPTO_BLOCK_FORMAT_LUKS,
+    .format = QCRYPTO_BLOCK_FORMAT_LUKS,
     .u.luks = {
         .key_secret = (char *)"sec0",
         .has_cipher_alg = true,
@@ -572,7 +572,7 @@ int main(int argc, char **argv)
     g_assert(qcrypto_init(NULL) == 0);
 
     for (i = 0; i < G_N_ELEMENTS(test_data); i++) {
-        if (test_data[i].open_opts->format == Q_CRYPTO_BLOCK_FORMAT_LUKS &&
+        if (test_data[i].open_opts->format == QCRYPTO_BLOCK_FORMAT_LUKS &&
             !qcrypto_hash_supports(test_data[i].hash_alg)) {
             continue;
         }
-- 
2.46.0

