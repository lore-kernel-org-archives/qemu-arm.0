Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp81577njb;
        Wed, 4 Sep 2024 04:24:32 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWM4Ami4HYPpu/2Z/CdyZ1StW9EzgxuGGzo99ExTIntGGnP3UlL3ZcvtKtLHK4nGqFnTdHLE2p4uGAf8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFMvywRtx7bewTRB2of8N5aXA3r8jpQtO8HJMSMaifu7tQ3IsDKMPk1Ir/DQ8+XVvNkzO/L
X-Received: by 2002:a2e:511a:0:b0:2f6:5f0a:9d00 with SMTP id 38308e7fff4ca-2f65f0a9f7dmr6723271fa.1.1725449071873;
        Wed, 04 Sep 2024 04:24:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1725449071; cv=pass;
        d=google.com; s=arc-20240605;
        b=AKGLjpJjPT3xaSfFRaxl3av6aj7oARAz399VyhpDUOq+9zWop+5rTCdyYCh83pxW6R
         wzMrH61MoI3zRWBB8DZpzIZZaFpa56gire1jfSkElYp2ffPsxnagFPu88eWG1ap0w6za
         T9JQvArOrwldq+xDB2hGtanHfblaxJpPC69Uaulul3IsPCegkE1GGffaF9LMFCmVYLQm
         FuCHm9GB7drMHnaCT2vl1CTV9QyEDWKIh2xd4jRUP39HvNkKna5jqHRze5h4MrwwjH1a
         LS4p0PWAB5Fn/ooQ/ZrkRP3DA9XTzysLiPq+YkpdAmaFeY9yDTeUfZbePN5mtAtqYwVx
         WW8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=MjUHoQUWEQZufLYm+5meP3FvBAhucIo90QTzT/mE2fg=;
        fh=2RgeqnAYDZ5qP2GVxxraMbOq0lVKWzwDqa5qVTK9BeQ=;
        b=dy4KDykjZbVENJWtZHuiPnQc4kdE9uS69j5Yy8wzSwExkShBIIz2nIHXS6HQg6YkqK
         q2SuPzq/1gPoh+AAkrzZImwHFpP2Ha3i3MRpwwW4R/f6qIk5XWlltVXVnbSRCsr0ZLdt
         gDO2jOJjkTWoUcnAtGpml2db34SQjWUSJjkjtKp/J6pZFlLTfcyLQcJ7RgEZhVZ/qa5M
         xDQSQSOD/dP+7QEQSV7tIwLliM9+l4XM4cfkAE7fxufgqmkYjYlgHqTbqXbM+Dnj9N0e
         PLI9cm3GMXAvViICfpdXQhLsc8ZjRkGCBEle3i/c4UrnqHH1H92TqS3q6C0zpr8Sf92s
         8rSQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WLuO6AeR;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-25868-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-25868-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-25868-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5c24f29c2ffsi6252388a12.192.2024.09.04.04.24.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 04:24:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-25868-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WLuO6AeR;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-25868-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-25868-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 422841F22699
	for <alex.bennee@linaro.org>; Wed,  4 Sep 2024 11:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370F71DA624;
	Wed,  4 Sep 2024 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WLuO6AeR"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4A71DA10D
	for <kvm@vger.kernel.org>; Wed,  4 Sep 2024 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448741; cv=none; b=Mj9FmRYeq+9GLnBdnXfaKO6+0fn6uG/+L4SvH70JZr0Di5aI8QsLR7B1+qXdjb7ZjKivBG1oe2s+/HQH8xDPeDUvT7idk3x9CC7o4DAJDjTdup5xUcf3JF5mXUZ5tw0EyDdVJX5BpP5KvX1IUxtG1TJCuLnJ27eLsVGrbPCsQWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448741; c=relaxed/simple;
	bh=GeIXOItTnRU6mjSzcDZrn5ve5B2kkMOZfL5J88jWn80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ao7eA9zVvTiIv4dobpYIz615nusAGZN4yhbZ7NqhFks5oPvr/ujCMWZgm0ma7LmuEA/VFZ6jWErnhUllAzuddK03zhTeuPLoACeDgQA+HgHzjmv1a7RuFB3s5XkVf+4EmHWmxEljvdeeH8j/0B4kd7UbBpCUKev4/viRiU82M/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WLuO6AeR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725448737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MjUHoQUWEQZufLYm+5meP3FvBAhucIo90QTzT/mE2fg=;
	b=WLuO6AeRAY5iZP4ys0L/7QkU2UYG+2fR9PZZgg0rmhvmR+NR8WrEH6MoENzlsXLGinwFNt
	hfLDg3goYmPJRZkKh+e7UDTlMUD3rSwQK7Lj5FnN8Jdz3DkuIH+TzeqemsnaB1CnCjBUCi
	bBmMNKNAicTPZWatXVUTgbAYKBRI9nQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-599-OsK3oRsuOyiaiP7MSTnNqw-1; Wed,
 04 Sep 2024 07:18:51 -0400
X-MC-Unique: OsK3oRsuOyiaiP7MSTnNqw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 660E019560A3;
	Wed,  4 Sep 2024 11:18:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.112])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A08D7300019A;
	Wed,  4 Sep 2024 11:18:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CDA0121E681A; Wed,  4 Sep 2024 13:18:36 +0200 (CEST)
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
Subject: [PATCH v2 14/19] qapi/crypto: Rename QCryptoAkCipherAlgorithm to *Algo, and drop prefix
Date: Wed,  4 Sep 2024 13:18:31 +0200
Message-ID: <20240904111836.3273842-15-armbru@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: M920aObynY4t

QAPI's 'prefix' feature can make the connection between enumeration
type and its constants less than obvious.  It's best used with
restraint.

QCryptoAkCipherAlgorithm has a 'prefix' that overrides the generated
enumeration constants' prefix to QCRYPTO_AKCIPHER_ALG.

We could simply drop 'prefix', but then the prefix becomes
QCRYPTO_AK_CIPHER_ALGORITHM, which is rather long.

We could additionally rename the type to QCryptoAkCipherAlg, but I
think the abbreviation "alg" is less than clear.

Rename the type to QCryptoAkCipherAlgo instead.  The prefix becomes
QCRYPTO_AK_CIPHER_ALGO.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qapi/crypto.json                        |  7 +++----
 crypto/akcipherpriv.h                   |  2 +-
 backends/cryptodev-builtin.c            |  4 ++--
 backends/cryptodev-lkcf.c               |  4 ++--
 crypto/akcipher.c                       |  2 +-
 tests/bench/benchmark-crypto-akcipher.c |  2 +-
 tests/unit/test-crypto-akcipher.c       | 10 +++++-----
 crypto/akcipher-gcrypt.c.inc            |  4 ++--
 crypto/akcipher-nettle.c.inc            |  4 ++--
 9 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/qapi/crypto.json b/qapi/crypto.json
index 3e6a7fb8e5..331d49ebb8 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -586,7 +586,7 @@
             '*sanity-check': 'bool',
             '*passwordid': 'str' } }
 ##
-# @QCryptoAkCipherAlgorithm:
+# @QCryptoAkCipherAlgo:
 #
 # The supported algorithms for asymmetric encryption ciphers
 #
@@ -594,8 +594,7 @@
 #
 # Since: 7.1
 ##
-{ 'enum': 'QCryptoAkCipherAlgorithm',
-  'prefix': 'QCRYPTO_AKCIPHER_ALG',
+{ 'enum': 'QCryptoAkCipherAlgo',
   'data': ['rsa']}
 
 ##
@@ -649,6 +648,6 @@
 # Since: 7.1
 ##
 { 'union': 'QCryptoAkCipherOptions',
-  'base': { 'alg': 'QCryptoAkCipherAlgorithm' },
+  'base': { 'alg': 'QCryptoAkCipherAlgo' },
   'discriminator': 'alg',
   'data': { 'rsa': 'QCryptoAkCipherOptionsRSA' }}
diff --git a/crypto/akcipherpriv.h b/crypto/akcipherpriv.h
index 739f639bcf..3b33e54f08 100644
--- a/crypto/akcipherpriv.h
+++ b/crypto/akcipherpriv.h
@@ -27,7 +27,7 @@
 typedef struct QCryptoAkCipherDriver QCryptoAkCipherDriver;
 
 struct QCryptoAkCipher {
-    QCryptoAkCipherAlgorithm alg;
+    QCryptoAkCipherAlgo alg;
     QCryptoAkCipherKeyType type;
     int max_plaintext_len;
     int max_ciphertext_len;
diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index 2672755661..d8b64091b6 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -64,7 +64,7 @@ static void cryptodev_builtin_init_akcipher(CryptoDevBackend *backend)
 {
     QCryptoAkCipherOptions opts;
 
-    opts.alg = QCRYPTO_AKCIPHER_ALG_RSA;
+    opts.alg = QCRYPTO_AK_CIPHER_ALGO_RSA;
     opts.u.rsa.padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW;
     if (qcrypto_akcipher_supports(&opts)) {
         backend->conf.crypto_services |=
@@ -318,7 +318,7 @@ static int cryptodev_builtin_create_akcipher_session(
 
     switch (sess_info->algo) {
     case VIRTIO_CRYPTO_AKCIPHER_RSA:
-        opts.alg = QCRYPTO_AKCIPHER_ALG_RSA;
+        opts.alg = QCRYPTO_AK_CIPHER_ALGO_RSA;
         if (cryptodev_builtin_set_rsa_options(sess_info->u.rsa.padding_algo,
             sess_info->u.rsa.hash_algo, &opts.u.rsa, errp) != 0) {
             return -1;
diff --git a/backends/cryptodev-lkcf.c b/backends/cryptodev-lkcf.c
index 6e6012e716..6fb6e03d98 100644
--- a/backends/cryptodev-lkcf.c
+++ b/backends/cryptodev-lkcf.c
@@ -133,7 +133,7 @@ static int cryptodev_lkcf_set_op_desc(QCryptoAkCipherOptions *opts,
                                       Error **errp)
 {
     QCryptoAkCipherOptionsRSA *rsa_opt;
-    if (opts->alg != QCRYPTO_AKCIPHER_ALG_RSA) {
+    if (opts->alg != QCRYPTO_AK_CIPHER_ALGO_RSA) {
         error_setg(errp, "Unsupported alg: %u", opts->alg);
         return -1;
     }
@@ -518,7 +518,7 @@ static int cryptodev_lkcf_create_asym_session(
 
     switch (sess_info->algo) {
     case VIRTIO_CRYPTO_AKCIPHER_RSA:
-        sess->akcipher_opts.alg = QCRYPTO_AKCIPHER_ALG_RSA;
+        sess->akcipher_opts.alg = QCRYPTO_AK_CIPHER_ALGO_RSA;
         if (cryptodev_lkcf_set_rsa_opt(
             sess_info->u.rsa.padding_algo, sess_info->u.rsa.hash_algo,
             &sess->akcipher_opts.u.rsa, &local_error) != 0) {
diff --git a/crypto/akcipher.c b/crypto/akcipher.c
index e4bbc6e5f1..0a0576b792 100644
--- a/crypto/akcipher.c
+++ b/crypto/akcipher.c
@@ -115,7 +115,7 @@ int qcrypto_akcipher_export_p8info(const QCryptoAkCipherOptions *opts,
                                    Error **errp)
 {
     switch (opts->alg) {
-    case QCRYPTO_AKCIPHER_ALG_RSA:
+    case QCRYPTO_AK_CIPHER_ALGO_RSA:
         qcrypto_akcipher_rsakey_export_p8info(key, keylen, dst, dst_len);
         return 0;
 
diff --git a/tests/bench/benchmark-crypto-akcipher.c b/tests/bench/benchmark-crypto-akcipher.c
index 0029972385..225e426bde 100644
--- a/tests/bench/benchmark-crypto-akcipher.c
+++ b/tests/bench/benchmark-crypto-akcipher.c
@@ -25,7 +25,7 @@ static QCryptoAkCipher *create_rsa_akcipher(const uint8_t *priv_key,
 {
     QCryptoAkCipherOptions opt;
 
-    opt.alg = QCRYPTO_AKCIPHER_ALG_RSA;
+    opt.alg = QCRYPTO_AK_CIPHER_ALGO_RSA;
     opt.u.rsa.padding_alg = padding;
     opt.u.rsa.hash_alg = hash;
     return qcrypto_akcipher_new(&opt, QCRYPTO_AK_CIPHER_KEY_TYPE_PRIVATE,
diff --git a/tests/unit/test-crypto-akcipher.c b/tests/unit/test-crypto-akcipher.c
index 86501f19ab..7dd86125c2 100644
--- a/tests/unit/test-crypto-akcipher.c
+++ b/tests/unit/test-crypto-akcipher.c
@@ -785,7 +785,7 @@ static QCryptoAkCipherTestData akcipher_test_data[] = {
     {
         .path = "/crypto/akcipher/rsa1024-raw",
         .opt = {
-            .alg = QCRYPTO_AKCIPHER_ALG_RSA,
+            .alg = QCRYPTO_AK_CIPHER_ALGO_RSA,
             .u.rsa = {
                 .padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW,
             },
@@ -805,7 +805,7 @@ static QCryptoAkCipherTestData akcipher_test_data[] = {
     {
         .path = "/crypto/akcipher/rsa1024-pkcs1",
         .opt = {
-            .alg = QCRYPTO_AKCIPHER_ALG_RSA,
+            .alg = QCRYPTO_AK_CIPHER_ALGO_RSA,
             .u.rsa = {
                 .padding_alg = QCRYPTO_RSA_PADDING_ALG_PKCS1,
                 .hash_alg = QCRYPTO_HASH_ALGO_SHA1,
@@ -830,7 +830,7 @@ static QCryptoAkCipherTestData akcipher_test_data[] = {
     {
         .path = "/crypto/akcipher/rsa2048-raw",
         .opt = {
-            .alg = QCRYPTO_AKCIPHER_ALG_RSA,
+            .alg = QCRYPTO_AK_CIPHER_ALGO_RSA,
             .u.rsa = {
                 .padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW,
             },
@@ -850,7 +850,7 @@ static QCryptoAkCipherTestData akcipher_test_data[] = {
     {
         .path = "/crypto/akcipher/rsa2048-pkcs1",
         .opt = {
-            .alg = QCRYPTO_AKCIPHER_ALG_RSA,
+            .alg = QCRYPTO_AK_CIPHER_ALGO_RSA,
             .u.rsa = {
                 .padding_alg = QCRYPTO_RSA_PADDING_ALG_PKCS1,
                 .hash_alg = QCRYPTO_HASH_ALGO_SHA1,
@@ -944,7 +944,7 @@ static void test_rsakey(const void *opaque)
 {
     const QCryptoRSAKeyTestData *data = (const QCryptoRSAKeyTestData *)opaque;
     QCryptoAkCipherOptions opt = {
-        .alg = QCRYPTO_AKCIPHER_ALG_RSA,
+        .alg = QCRYPTO_AK_CIPHER_ALGO_RSA,
         .u.rsa = {
             .padding_alg = QCRYPTO_RSA_PADDING_ALG_PKCS1,
             .hash_alg = QCRYPTO_HASH_ALGO_SHA1,
diff --git a/crypto/akcipher-gcrypt.c.inc b/crypto/akcipher-gcrypt.c.inc
index 2c81de97de..8f1c2b8143 100644
--- a/crypto/akcipher-gcrypt.c.inc
+++ b/crypto/akcipher-gcrypt.c.inc
@@ -59,7 +59,7 @@ QCryptoAkCipher *qcrypto_akcipher_new(const QCryptoAkCipherOptions *opts,
                                       Error **errp)
 {
     switch (opts->alg) {
-    case QCRYPTO_AKCIPHER_ALG_RSA:
+    case QCRYPTO_AK_CIPHER_ALGO_RSA:
         return (QCryptoAkCipher *)qcrypto_gcrypt_rsa_new(
             &opts->u.rsa, type, key, keylen, errp);
 
@@ -568,7 +568,7 @@ error:
 bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
 {
     switch (opts->alg) {
-    case QCRYPTO_AKCIPHER_ALG_RSA:
+    case QCRYPTO_AK_CIPHER_ALGO_RSA:
         switch (opts->u.rsa.padding_alg) {
         case QCRYPTO_RSA_PADDING_ALG_RAW:
             return true;
diff --git a/crypto/akcipher-nettle.c.inc b/crypto/akcipher-nettle.c.inc
index 37a579fbd9..21f27f8286 100644
--- a/crypto/akcipher-nettle.c.inc
+++ b/crypto/akcipher-nettle.c.inc
@@ -61,7 +61,7 @@ QCryptoAkCipher *qcrypto_akcipher_new(const QCryptoAkCipherOptions *opts,
                                       Error **errp)
 {
     switch (opts->alg) {
-    case QCRYPTO_AKCIPHER_ALG_RSA:
+    case QCRYPTO_AK_CIPHER_ALGO_RSA:
         return qcrypto_nettle_rsa_new(&opts->u.rsa, type, key, keylen, errp);
 
     default:
@@ -425,7 +425,7 @@ error:
 bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
 {
     switch (opts->alg) {
-    case QCRYPTO_AKCIPHER_ALG_RSA:
+    case QCRYPTO_AK_CIPHER_ALGO_RSA:
         switch (opts->u.rsa.padding_alg) {
         case QCRYPTO_RSA_PADDING_ALG_PKCS1:
             switch (opts->u.rsa.hash_alg) {
-- 
2.46.0

