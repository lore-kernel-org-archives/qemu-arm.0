Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2222151njb;
        Tue, 30 Jul 2024 01:11:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUBWkKOYwTESUQemoeglLD0BHuOXEJOHlxLZw1+Qrx0koW+zuZIHY4+xz/rX0OZf6n2Xv9IV/fs374npTd8LEFkgZdy4bm6
X-Google-Smtp-Source: AGHT+IGVJUsUGrvp/Y6Eporg1qdzL1PZdP1ZlIRX71BNzisuvzSPSWc0wiuXJ0VGewObUGbypOt6
X-Received: by 2002:a05:620a:f05:b0:7a1:e331:54c5 with SMTP id af79cd13be357-7a1e5247ba8mr1171204785a.24.1722327112610;
        Tue, 30 Jul 2024 01:11:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722327112; cv=none;
        d=google.com; s=arc-20160816;
        b=WLqsDuFqON1zvWuvetm0j7GGDDhvX9xxBt9Ue5D7tByMG5T8TALAiurhAhkUnHM5NN
         +d4clgyx8fRsvNNILjzfigtG2+KUKlZ28rsgv04bAdFkJ2+lvutDQGANV3g/buM7W5oe
         UVVGVOjLScI0jSz/r4DqFkdwbAAiooB6WWIPXj+WaeSjXKjQsUx2/BACN6aJ1f9w7kz0
         6ozss/Oyj1HpsvslbCQf3qWOm7UJQPda2TFU+Gy3NTjbaClEh/uXRMXx2dXrX4MnCeUz
         Eg7G6j61fsVigjnjOj8hJFJ1nwBsAnryFKng3h4iloxZWKWpfkzm7vDAgVOFq5RjhVsM
         rMXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YMPCHNQfy3tZ+ovqltmhnjAU4FtimTeV+sqHt5QzZ78=;
        fh=K9hvV5Ipi0VSlYxX/fm25RHJYlx13FFj5pikD+TSDpg=;
        b=nUzJoh5PnEGYj+urWhvXYQQlwLZmElHIVQ1hlEj7Euw12FQZx85MNSkQrlCADk+xcN
         246CH03tf3kGeXW00M76xGT2fpht/+XdiyZiaVIzKRZ6ssL7DR60GaTl0Pd6fbgl+6d7
         oz+h0txOuBoZh7OUET0JNEFDMObYyW5FKvoEjOU9fg2FVfZ0XSdFZBJEVMr4D7mXnyDr
         AENDvulaN3g1rQCZMIiell/ZHItfWyZru7U3OYvvRUbBxsnV0+qPcsOpEeLTPPnNjU7L
         GvLnDxrJ9hxikrrBCw6lnizBBr91TO2MwltNBkS7efzIW/b4yOPQzGymKMTXiBFjCUu0
         Gzfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cT1Avi2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d7445ca8si1255938285a.230.2024.07.30.01.11.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 01:11:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cT1Avi2D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYhx8-0007Jv-V5; Tue, 30 Jul 2024 04:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sYhwu-0006GM-GJ
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 04:11:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1sYhwd-0001Js-Sx
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 04:11:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722327055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YMPCHNQfy3tZ+ovqltmhnjAU4FtimTeV+sqHt5QzZ78=;
 b=cT1Avi2DasV/JYSCTqbh5Qxe1pnaGge0FohfTm3RZNhj3rkf11lkHZwHjYs9rwWGWXtzv6
 CMVRvwS0NjwhJAda6l3XZl0OuQpiaBZGeMT6gmY0uoHfCeGwB0oCJGoNDotBe+kGT9g59n
 6+jwTSkf21O5CIkXgdHuuJSDUNhFbGc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-IO6leV3RPVaLPwJzSj45SQ-1; Tue,
 30 Jul 2024 04:10:50 -0400
X-MC-Unique: IO6leV3RPVaLPwJzSj45SQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5F36E1955D56; Tue, 30 Jul 2024 08:10:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.65])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A3D571955D42; Tue, 30 Jul 2024 08:10:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0EAAD21F4B9B; Tue, 30 Jul 2024 10:10:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, andrew@codeconstruct.com.au, andrew@daynix.com,
 arei.gonglei@huawei.com, berrange@redhat.com, berto@igalia.com,
 borntraeger@linux.ibm.com, clg@kaod.org, david@redhat.com, den@openvz.org,
 eblake@redhat.com, eduardo@habkost.net, farman@linux.ibm.com,
 farosas@suse.de, hreitz@redhat.com, idryomov@gmail.com, iii@linux.ibm.com,
 jamin_lin@aspeedtech.com, jasowang@redhat.com, joel@jms.id.au,
 jsnow@redhat.com, kwolf@redhat.com, leetroy@gmail.com,
 marcandre.lureau@redhat.com, marcel.apfelbaum@gmail.com,
 michael.roth@amd.com, mst@redhat.com, mtosatti@redhat.com,
 nsg@linux.ibm.com, pasic@linux.ibm.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, peterx@redhat.com, philmd@linaro.org,
 pizhenwei@bytedance.com, pl@dlhnet.de, richard.henderson@linaro.org,
 stefanha@redhat.com, steven_lee@aspeedtech.com, thuth@redhat.com,
 vsementsov@yandex-team.ru, wangyanan55@huawei.com,
 yuri.benditovich@daynix.com, zhao1.liu@intel.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH 14/18] qapi/crypto: Rename QCryptoAkCipherAlgorithm to *Algo,
 and drop prefix
Date: Tue, 30 Jul 2024 10:10:28 +0200
Message-ID: <20240730081032.1246748-15-armbru@redhat.com>
In-Reply-To: <20240730081032.1246748-1-armbru@redhat.com>
References: <20240730081032.1246748-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6B642c7M6zzG

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
index 996853cecf..5ea16c69e0 100644
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
2.45.0

