Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp81582njb;
        Wed, 4 Sep 2024 04:24:33 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVxOic2AbJ3sgvzAsVdmbdNoYNvJgjBneTrD26YYZ02mNjo2df75KnpsWuegx0uykNhrvM2K5KDzzPrlQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGbyRBR4/EK9EjWc2xLHwdPjTEVHFmt1vSr0Hi5GzyPu36jhe75oryChZwOLj57OowSMQVM
X-Received: by 2002:a05:6a00:1407:b0:706:5dab:83c4 with SMTP id d2e1a72fcca58-717457cf27bmr12317100b3a.14.1725449073142;
        Wed, 04 Sep 2024 04:24:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1725449073; cv=pass;
        d=google.com; s=arc-20240605;
        b=KBeJbcH2c6FNR1m5kP8W9Td/0iGJjhOS8AoQS+3DvasfSCyq2XizCGnQw4BbKjwwqn
         YtCUckcco/EO/XjpS+hlz1MGvTBi4woVYgdx9HO+22zPzUDkpeHE5Ph5eHPE2+efpfPh
         C3tHZzCXvV7ho+jqcCSqix8YrCMTTIvpzhFrEl6Q1MMNqoBjpAnhFlW4NWION73Oilg9
         B3V/Mz5xKoKj1VijbRcUshOxyHh+kamEc0VUdxlaj7xXORKcqZ7bsmMsfdpBAozMPCpK
         OMKxRKYiBdQsUgAIFL7M4hXh1Ik371RKMETyk14mXILyj5Pt7QMsDfHujHV4eGt4y0b7
         U9ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=70jMuVZso5R0028zPf4/S/G6TSwBNhjs4yo5beZEVtA=;
        fh=2RgeqnAYDZ5qP2GVxxraMbOq0lVKWzwDqa5qVTK9BeQ=;
        b=cDpzsqZdZa7HaojAiXJ4teO+tyEjt5dnnw4Hv9AkWzgARXf3OabqTQtp4YK2oMLNVx
         q9rNQCaGUQPhExvc/pPzLoamY5L5H40Fr5ek8nrBhS2vDvKoupWNpGRdE3FBSIp9ERMi
         1l/JHJRYhaXnq4UtaMuSDE9C7Z9i5HbHP9cCwZrjtpxf8B2/4ZJvmTe4f5BocB633J40
         rtea4ttGPlnLxzARqlcl24mubcdR4Y864kEIbIQ/nIacP1g+MiWg4KM/k3fI8PvrqMjd
         sgeBKRd2ihAIIJZlnoaG8r9JvlqWlkxAJgZcYFislAs8gUqRvoXzKW+a8DWxydrWdPi2
         uhEA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZI05ceR+;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-25867-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-25867-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-25867-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7d4fbda46b9si2021520a12.423.2024.09.04.04.24.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 04:24:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-25867-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZI05ceR+;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-25867-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-25867-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D75CAB21301
	for <alex.bennee@linaro.org>; Wed,  4 Sep 2024 11:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4CF1DA632;
	Wed,  4 Sep 2024 11:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZI05ceR+"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEAF1DA11B
	for <kvm@vger.kernel.org>; Wed,  4 Sep 2024 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448740; cv=none; b=k+0oV4/EHhWMrHrCTxS9Zsxg9i78GlfkK4ZKH5CESAMrGOcd3gNm+ONdSpIhZvJ5jh04C4s/JydVlL3wsDeyRBygLsaN5exj2Q3GkViFiQ7wS/IFDrNfyatSHAQwrhmWdgLduHv5bsv6U70VEEGDHy+L5GlEIbkjYNmOtkqGXD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448740; c=relaxed/simple;
	bh=OkWjOnxfa9hBNMiLH0LsjGmdle9M/soZOaHh1bdBpms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sf+Ud8KwqY/8GnkoM/Cm44HJvdiLyY29mvTGH3JAx2xPeV4XtHGkNscgkxR1jeix/RboYdasrnDDvktuavuLI3SPanAWT10aLdu9VR4C9/P1tXPwp4OBUEaEuhf+pF0bw0ats6yz5H5xWszwzK974UZhdapvV20OSNngaOqQLZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZI05ceR+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725448737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=70jMuVZso5R0028zPf4/S/G6TSwBNhjs4yo5beZEVtA=;
	b=ZI05ceR+wgWD+guNFVMq+v+Rf6MZpibkc44unsboy5LsKAL9MyVxJh8eynfi2+WYJBwzJM
	aussAnLNwm2X0+T/DQchoeef0kgKsLhgJ5+HTSkfPcRVQ/c3qqurt89BcHNS6gWImRxcJ8
	Hb8CMBmKCpRf9thjUBzNTekKwia15K4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-444-EQ1bwIKsP2y4bb1iuwKx4A-1; Wed,
 04 Sep 2024 07:18:51 -0400
X-MC-Unique: EQ1bwIKsP2y4bb1iuwKx4A-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7AACE1955D80;
	Wed,  4 Sep 2024 11:18:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.112])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E9A431956086;
	Wed,  4 Sep 2024 11:18:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id D25F121E682D; Wed,  4 Sep 2024 13:18:36 +0200 (CEST)
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
Subject: [PATCH v2 15/19] qapi/crypto: Rename QCryptoRSAPaddingAlgorithm to *Algo, and drop prefix
Date: Wed,  4 Sep 2024 13:18:32 +0200
Message-ID: <20240904111836.3273842-16-armbru@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: NPbf2c3jkiUq

QAPI's 'prefix' feature can make the connection between enumeration
type and its constants less than obvious.  It's best used with
restraint.

QCryptoRSAPaddingAlgorithm has a 'prefix' that overrides the generated
enumeration constants' prefix to QCRYPTO_RSA_PADDING_ALG.

We could simply drop 'prefix', but then the prefix becomes
QCRYPTO_RSA_PADDING_ALGORITHM, which is rather long.

We could additionally rename the type to QCryptoRSAPaddingAlg, but I
think the abbreviation "alg" is less than clear.

Rename the type to QCryptoRSAPaddingAlgo instead.  The prefix becomes
QCRYPTO_RSA_PADDING_ALGO.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qapi/crypto.json                        |  9 ++++-----
 backends/cryptodev-builtin.c            |  6 +++---
 backends/cryptodev-lkcf.c               | 10 +++++-----
 tests/bench/benchmark-crypto-akcipher.c | 12 ++++++------
 tests/unit/test-crypto-akcipher.c       | 10 +++++-----
 crypto/akcipher-gcrypt.c.inc            | 18 +++++++++---------
 crypto/akcipher-nettle.c.inc            | 18 +++++++++---------
 7 files changed, 41 insertions(+), 42 deletions(-)

diff --git a/qapi/crypto.json b/qapi/crypto.json
index 331d49ebb8..867b09d322 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -608,7 +608,7 @@
   'data': ['public', 'private']}
 
 ##
-# @QCryptoRSAPaddingAlgorithm:
+# @QCryptoRSAPaddingAlgo:
 #
 # The padding algorithm for RSA.
 #
@@ -618,8 +618,7 @@
 #
 # Since: 7.1
 ##
-{ 'enum': 'QCryptoRSAPaddingAlgorithm',
-  'prefix': 'QCRYPTO_RSA_PADDING_ALG',
+{ 'enum': 'QCryptoRSAPaddingAlgo',
   'data': ['raw', 'pkcs1']}
 
 ##
@@ -629,13 +628,13 @@
 #
 # @hash-alg: QCryptoHashAlgo
 #
-# @padding-alg: QCryptoRSAPaddingAlgorithm
+# @padding-alg: QCryptoRSAPaddingAlgo
 #
 # Since: 7.1
 ##
 { 'struct': 'QCryptoAkCipherOptionsRSA',
   'data': { 'hash-alg':'QCryptoHashAlgo',
-            'padding-alg': 'QCryptoRSAPaddingAlgorithm'}}
+            'padding-alg': 'QCryptoRSAPaddingAlgo'}}
 
 ##
 # @QCryptoAkCipherOptions:
diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
index d8b64091b6..6f3990481b 100644
--- a/backends/cryptodev-builtin.c
+++ b/backends/cryptodev-builtin.c
@@ -65,7 +65,7 @@ static void cryptodev_builtin_init_akcipher(CryptoDevBackend *backend)
     QCryptoAkCipherOptions opts;
 
     opts.alg = QCRYPTO_AK_CIPHER_ALGO_RSA;
-    opts.u.rsa.padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW;
+    opts.u.rsa.padding_alg = QCRYPTO_RSA_PADDING_ALGO_RAW;
     if (qcrypto_akcipher_supports(&opts)) {
         backend->conf.crypto_services |=
                      (1u << QCRYPTODEV_BACKEND_SERVICE_AKCIPHER);
@@ -200,12 +200,12 @@ static int cryptodev_builtin_set_rsa_options(
             return -1;
         }
         opt->hash_alg = hash_alg;
-        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_PKCS1;
+        opt->padding_alg = QCRYPTO_RSA_PADDING_ALGO_PKCS1;
         return 0;
     }
 
     if (virtio_padding_algo == VIRTIO_CRYPTO_RSA_RAW_PADDING) {
-        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW;
+        opt->padding_alg = QCRYPTO_RSA_PADDING_ALGO_RAW;
         return 0;
     }
 
diff --git a/backends/cryptodev-lkcf.c b/backends/cryptodev-lkcf.c
index 6fb6e03d98..fde32950f6 100644
--- a/backends/cryptodev-lkcf.c
+++ b/backends/cryptodev-lkcf.c
@@ -139,14 +139,14 @@ static int cryptodev_lkcf_set_op_desc(QCryptoAkCipherOptions *opts,
     }
 
     rsa_opt = &opts->u.rsa;
-    if (rsa_opt->padding_alg == QCRYPTO_RSA_PADDING_ALG_PKCS1) {
+    if (rsa_opt->padding_alg == QCRYPTO_RSA_PADDING_ALGO_PKCS1) {
         snprintf(key_desc, desc_len, "enc=%s hash=%s",
-                 QCryptoRSAPaddingAlgorithm_str(rsa_opt->padding_alg),
+                 QCryptoRSAPaddingAlgo_str(rsa_opt->padding_alg),
                  QCryptoHashAlgo_str(rsa_opt->hash_alg));
 
     } else {
         snprintf(key_desc, desc_len, "enc=%s",
-                 QCryptoRSAPaddingAlgorithm_str(rsa_opt->padding_alg));
+                 QCryptoRSAPaddingAlgo_str(rsa_opt->padding_alg));
     }
     return 0;
 }
@@ -157,7 +157,7 @@ static int cryptodev_lkcf_set_rsa_opt(int virtio_padding_alg,
                                       Error **errp)
 {
     if (virtio_padding_alg == VIRTIO_CRYPTO_RSA_PKCS1_PADDING) {
-        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_PKCS1;
+        opt->padding_alg = QCRYPTO_RSA_PADDING_ALGO_PKCS1;
 
         switch (virtio_hash_alg) {
         case VIRTIO_CRYPTO_RSA_MD5:
@@ -184,7 +184,7 @@ static int cryptodev_lkcf_set_rsa_opt(int virtio_padding_alg,
     }
 
     if (virtio_padding_alg == VIRTIO_CRYPTO_RSA_RAW_PADDING) {
-        opt->padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW;
+        opt->padding_alg = QCRYPTO_RSA_PADDING_ALGO_RAW;
         return 0;
     }
 
diff --git a/tests/bench/benchmark-crypto-akcipher.c b/tests/bench/benchmark-crypto-akcipher.c
index 225e426bde..750c7e89ee 100644
--- a/tests/bench/benchmark-crypto-akcipher.c
+++ b/tests/bench/benchmark-crypto-akcipher.c
@@ -20,7 +20,7 @@
 
 static QCryptoAkCipher *create_rsa_akcipher(const uint8_t *priv_key,
                                             size_t keylen,
-                                            QCryptoRSAPaddingAlgorithm padding,
+                                            QCryptoRSAPaddingAlgo padding,
                                             QCryptoHashAlgo hash)
 {
     QCryptoAkCipherOptions opt;
@@ -39,7 +39,7 @@ static void test_rsa_speed(const uint8_t *priv_key, size_t keylen,
 #define SHA1_DGST_LEN 20
 #define SIGN_TIMES 10000
 #define VERIFY_TIMES 100000
-#define PADDING QCRYPTO_RSA_PADDING_ALG_PKCS1
+#define PADDING QCRYPTO_RSA_PADDING_ALGO_PKCS1
 #define HASH QCRYPTO_HASH_ALGO_SHA1
 
     g_autoptr(QCryptoAkCipher) rsa =
@@ -53,7 +53,7 @@ static void test_rsa_speed(const uint8_t *priv_key, size_t keylen,
     signature = g_new0(uint8_t, key_size / BYTE);
 
     g_test_message("benchmark rsa%zu (%s-%s) sign...", key_size,
-                   QCryptoRSAPaddingAlgorithm_str(PADDING),
+                   QCryptoRSAPaddingAlgo_str(PADDING),
                    QCryptoHashAlgo_str(HASH));
     g_test_timer_start();
     for (count = 0; count < SIGN_TIMES; ++count) {
@@ -64,13 +64,13 @@ static void test_rsa_speed(const uint8_t *priv_key, size_t keylen,
     g_test_timer_elapsed();
     g_test_message("rsa%zu (%s-%s) sign %zu times in %.2f seconds,"
                    " %.2f times/sec ",
-                   key_size,  QCryptoRSAPaddingAlgorithm_str(PADDING),
+                   key_size,  QCryptoRSAPaddingAlgo_str(PADDING),
                    QCryptoHashAlgo_str(HASH),
                    count, g_test_timer_last(),
                    (double)count / g_test_timer_last());
 
     g_test_message("benchmark rsa%zu (%s-%s) verification...", key_size,
-                   QCryptoRSAPaddingAlgorithm_str(PADDING),
+                   QCryptoRSAPaddingAlgo_str(PADDING),
                    QCryptoHashAlgo_str(HASH));
     g_test_timer_start();
     for (count = 0; count < VERIFY_TIMES; ++count) {
@@ -81,7 +81,7 @@ static void test_rsa_speed(const uint8_t *priv_key, size_t keylen,
     g_test_timer_elapsed();
     g_test_message("rsa%zu (%s-%s) verify %zu times in %.2f seconds,"
                    " %.2f times/sec ",
-                   key_size, QCryptoRSAPaddingAlgorithm_str(PADDING),
+                   key_size, QCryptoRSAPaddingAlgo_str(PADDING),
                    QCryptoHashAlgo_str(HASH),
                    count, g_test_timer_last(),
                    (double)count / g_test_timer_last());
diff --git a/tests/unit/test-crypto-akcipher.c b/tests/unit/test-crypto-akcipher.c
index 7dd86125c2..53c2211ba8 100644
--- a/tests/unit/test-crypto-akcipher.c
+++ b/tests/unit/test-crypto-akcipher.c
@@ -787,7 +787,7 @@ static QCryptoAkCipherTestData akcipher_test_data[] = {
         .opt = {
             .alg = QCRYPTO_AK_CIPHER_ALGO_RSA,
             .u.rsa = {
-                .padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW,
+                .padding_alg = QCRYPTO_RSA_PADDING_ALGO_RAW,
             },
         },
         .pub_key = rsa1024_public_key,
@@ -807,7 +807,7 @@ static QCryptoAkCipherTestData akcipher_test_data[] = {
         .opt = {
             .alg = QCRYPTO_AK_CIPHER_ALGO_RSA,
             .u.rsa = {
-                .padding_alg = QCRYPTO_RSA_PADDING_ALG_PKCS1,
+                .padding_alg = QCRYPTO_RSA_PADDING_ALGO_PKCS1,
                 .hash_alg = QCRYPTO_HASH_ALGO_SHA1,
             },
         },
@@ -832,7 +832,7 @@ static QCryptoAkCipherTestData akcipher_test_data[] = {
         .opt = {
             .alg = QCRYPTO_AK_CIPHER_ALGO_RSA,
             .u.rsa = {
-                .padding_alg = QCRYPTO_RSA_PADDING_ALG_RAW,
+                .padding_alg = QCRYPTO_RSA_PADDING_ALGO_RAW,
             },
         },
         .pub_key = rsa2048_public_key,
@@ -852,7 +852,7 @@ static QCryptoAkCipherTestData akcipher_test_data[] = {
         .opt = {
             .alg = QCRYPTO_AK_CIPHER_ALGO_RSA,
             .u.rsa = {
-                .padding_alg = QCRYPTO_RSA_PADDING_ALG_PKCS1,
+                .padding_alg = QCRYPTO_RSA_PADDING_ALGO_PKCS1,
                 .hash_alg = QCRYPTO_HASH_ALGO_SHA1,
             },
         },
@@ -946,7 +946,7 @@ static void test_rsakey(const void *opaque)
     QCryptoAkCipherOptions opt = {
         .alg = QCRYPTO_AK_CIPHER_ALGO_RSA,
         .u.rsa = {
-            .padding_alg = QCRYPTO_RSA_PADDING_ALG_PKCS1,
+            .padding_alg = QCRYPTO_RSA_PADDING_ALGO_PKCS1,
             .hash_alg = QCRYPTO_HASH_ALGO_SHA1,
         }
     };
diff --git a/crypto/akcipher-gcrypt.c.inc b/crypto/akcipher-gcrypt.c.inc
index 8f1c2b8143..5a880f6638 100644
--- a/crypto/akcipher-gcrypt.c.inc
+++ b/crypto/akcipher-gcrypt.c.inc
@@ -32,7 +32,7 @@
 typedef struct QCryptoGcryptRSA {
     QCryptoAkCipher akcipher;
     gcry_sexp_t key;
-    QCryptoRSAPaddingAlgorithm padding_alg;
+    QCryptoRSAPaddingAlgo padding_alg;
     QCryptoHashAlgo hash_alg;
 } QCryptoGcryptRSA;
 
@@ -241,7 +241,7 @@ static int qcrypto_gcrypt_rsa_encrypt(QCryptoAkCipher *akcipher,
 
     err = gcry_sexp_build(&data_sexp, NULL,
                           "(data (flags %s) (value %b))",
-                          QCryptoRSAPaddingAlgorithm_str(rsa->padding_alg),
+                          QCryptoRSAPaddingAlgo_str(rsa->padding_alg),
                           in_len, in);
     if (gcry_err_code(err) != 0) {
         error_setg(errp, "Failed to build plaintext: %s/%s",
@@ -263,7 +263,7 @@ static int qcrypto_gcrypt_rsa_encrypt(QCryptoAkCipher *akcipher,
         goto cleanup;
     }
 
-    if (rsa->padding_alg == QCRYPTO_RSA_PADDING_ALG_RAW) {
+    if (rsa->padding_alg == QCRYPTO_RSA_PADDING_ALGO_RAW) {
         cipher_mpi = gcry_sexp_nth_mpi(cipher_sexp_item, 1, GCRYMPI_FMT_USG);
         if (!cipher_mpi) {
             error_setg(errp, "Invalid ciphertext result");
@@ -332,7 +332,7 @@ static int qcrypto_gcrypt_rsa_decrypt(QCryptoAkCipher *akcipher,
 
     err = gcry_sexp_build(&cipher_sexp, NULL,
                           "(enc-val (flags %s) (rsa (a %b) ))",
-                          QCryptoRSAPaddingAlgorithm_str(rsa->padding_alg),
+                          QCryptoRSAPaddingAlgo_str(rsa->padding_alg),
                           in_len, in);
     if (gcry_err_code(err) != 0) {
         error_setg(errp, "Failed to build ciphertext: %s/%s",
@@ -348,7 +348,7 @@ static int qcrypto_gcrypt_rsa_decrypt(QCryptoAkCipher *akcipher,
     }
 
     /* S-expression of plaintext: (value plaintext) */
-    if (rsa->padding_alg == QCRYPTO_RSA_PADDING_ALG_RAW) {
+    if (rsa->padding_alg == QCRYPTO_RSA_PADDING_ALGO_RAW) {
         data_mpi = gcry_sexp_nth_mpi(data_sexp, 1, GCRYMPI_FMT_USG);
         if (!data_mpi) {
             error_setg(errp, "Invalid plaintext result");
@@ -410,7 +410,7 @@ static int qcrypto_gcrypt_rsa_sign(QCryptoAkCipher *akcipher,
         return ret;
     }
 
-    if (rsa->padding_alg != QCRYPTO_RSA_PADDING_ALG_PKCS1) {
+    if (rsa->padding_alg != QCRYPTO_RSA_PADDING_ALGO_PKCS1) {
         error_setg(errp, "Invalid padding %u", rsa->padding_alg);
         return ret;
     }
@@ -482,7 +482,7 @@ static int qcrypto_gcrypt_rsa_verify(QCryptoAkCipher *akcipher,
         return ret;
     }
 
-    if (rsa->padding_alg != QCRYPTO_RSA_PADDING_ALG_PKCS1) {
+    if (rsa->padding_alg != QCRYPTO_RSA_PADDING_ALGO_PKCS1) {
         error_setg(errp, "Invalid padding %u", rsa->padding_alg);
         return ret;
     }
@@ -570,10 +570,10 @@ bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
     switch (opts->alg) {
     case QCRYPTO_AK_CIPHER_ALGO_RSA:
         switch (opts->u.rsa.padding_alg) {
-        case QCRYPTO_RSA_PADDING_ALG_RAW:
+        case QCRYPTO_RSA_PADDING_ALGO_RAW:
             return true;
 
-        case QCRYPTO_RSA_PADDING_ALG_PKCS1:
+        case QCRYPTO_RSA_PADDING_ALGO_PKCS1:
             switch (opts->u.rsa.hash_alg) {
             case QCRYPTO_HASH_ALGO_MD5:
             case QCRYPTO_HASH_ALGO_SHA1:
diff --git a/crypto/akcipher-nettle.c.inc b/crypto/akcipher-nettle.c.inc
index 21f27f8286..1720f84362 100644
--- a/crypto/akcipher-nettle.c.inc
+++ b/crypto/akcipher-nettle.c.inc
@@ -33,7 +33,7 @@ typedef struct QCryptoNettleRSA {
     QCryptoAkCipher akcipher;
     struct rsa_public_key pub;
     struct rsa_private_key priv;
-    QCryptoRSAPaddingAlgorithm padding_alg;
+    QCryptoRSAPaddingAlgo padding_alg;
     QCryptoHashAlgo hash_alg;
 } QCryptoNettleRSA;
 
@@ -184,11 +184,11 @@ static int qcrypto_nettle_rsa_encrypt(QCryptoAkCipher *akcipher,
 
     /* Nettle do not support RSA encryption without any padding */
     switch (rsa->padding_alg) {
-    case QCRYPTO_RSA_PADDING_ALG_RAW:
+    case QCRYPTO_RSA_PADDING_ALGO_RAW:
         error_setg(errp, "RSA with raw padding is not supported");
         break;
 
-    case QCRYPTO_RSA_PADDING_ALG_PKCS1:
+    case QCRYPTO_RSA_PADDING_ALGO_PKCS1:
         mpz_init(c);
         if (rsa_encrypt(&rsa->pub, NULL, wrap_nettle_random_func,
                         data_len, (uint8_t *)data, c) != 1) {
@@ -223,11 +223,11 @@ static int qcrypto_nettle_rsa_decrypt(QCryptoAkCipher *akcipher,
     }
 
     switch (rsa->padding_alg) {
-    case QCRYPTO_RSA_PADDING_ALG_RAW:
+    case QCRYPTO_RSA_PADDING_ALGO_RAW:
         error_setg(errp, "RSA with raw padding is not supported");
         break;
 
-    case QCRYPTO_RSA_PADDING_ALG_PKCS1:
+    case QCRYPTO_RSA_PADDING_ALGO_PKCS1:
         nettle_mpz_init_set_str_256_u(c, enc_len, enc);
         if (!rsa_decrypt(&rsa->priv, &data_len, (uint8_t *)data, c)) {
             error_setg(errp, "Failed to decrypt");
@@ -257,7 +257,7 @@ static int qcrypto_nettle_rsa_sign(QCryptoAkCipher *akcipher,
      * The RSA algorithm cannot be used for signature/verification
      * without padding.
      */
-    if (rsa->padding_alg == QCRYPTO_RSA_PADDING_ALG_RAW) {
+    if (rsa->padding_alg == QCRYPTO_RSA_PADDING_ALGO_RAW) {
         error_setg(errp, "Try to make signature without padding");
         return ret;
     }
@@ -324,7 +324,7 @@ static int qcrypto_nettle_rsa_verify(QCryptoAkCipher *akcipher,
      * The RSA algorithm cannot be used for signature/verification
      * without padding.
      */
-    if (rsa->padding_alg == QCRYPTO_RSA_PADDING_ALG_RAW) {
+    if (rsa->padding_alg == QCRYPTO_RSA_PADDING_ALGO_RAW) {
         error_setg(errp, "Try to verify signature without padding");
         return ret;
     }
@@ -427,7 +427,7 @@ bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
     switch (opts->alg) {
     case QCRYPTO_AK_CIPHER_ALGO_RSA:
         switch (opts->u.rsa.padding_alg) {
-        case QCRYPTO_RSA_PADDING_ALG_PKCS1:
+        case QCRYPTO_RSA_PADDING_ALGO_PKCS1:
             switch (opts->u.rsa.hash_alg) {
             case QCRYPTO_HASH_ALGO_MD5:
             case QCRYPTO_HASH_ALGO_SHA1:
@@ -439,7 +439,7 @@ bool qcrypto_akcipher_supports(QCryptoAkCipherOptions *opts)
                 return false;
             }
 
-        case QCRYPTO_RSA_PADDING_ALG_RAW:
+        case QCRYPTO_RSA_PADDING_ALGO_RAW:
         default:
             return false;
         }
-- 
2.46.0

