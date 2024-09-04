Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp81276njb;
        Wed, 4 Sep 2024 04:23:20 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVOZi1C0jqQz8KMzGTSD2my6qzn91T2Veo1TXR0CKn4bLUUJj2oWy4Li6IpCPeXHZat8m/SFKl11rwevA==@linaro.org
X-Google-Smtp-Source: AGHT+IFdP9jhXFnMqReAd+pn13CSmf2JpzakBeErJybsPCdyqwYuZnVJcuFRjYe9gbS3sdMGjZEA
X-Received: by 2002:a05:620a:2801:b0:7a1:d431:8408 with SMTP id af79cd13be357-7a8fa610857mr1679065485a.37.1725448999904;
        Wed, 04 Sep 2024 04:23:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1725448999; cv=pass;
        d=google.com; s=arc-20160816;
        b=a3XaRtbJEwJRemGvicgj3zUu0Ts8TjFCDsr0eaXnit56P9/st5kM4gCM41JjkvX4z3
         gP9hsoXwSHd0cgmPvWlrIUWnxKk1cfjCU2WS2RPD31WtS341Zhh/wQXujpdqEDamVadF
         Q6NI5Kk1/9FfFIBY6c9kATbbzgBY9PUPAIN2HjSM0Y9x28qMnRfu6OcliwYHjxxgb0Sc
         BOqDBeCmCEU/vROwScZSuMxo3ZFdUm89Qhs+VD/ryJpkoIvhmiJuhVWHU+hu5yrmP43y
         gOWkzOcQbqHH8I2LuF0xqr2EZdQvwMUKP/y7r8tE9if5IQfhxFJ3+G5jD/iRc7BHRU05
         RXeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=u8HGx870TvahmH1JUtPzVJvMkaa7TMgcPX/CncVr9MI=;
        fh=2RgeqnAYDZ5qP2GVxxraMbOq0lVKWzwDqa5qVTK9BeQ=;
        b=mszoE1hbhqqSCr5gEDyxbpSe9qLYMGFl7FyBezee5nPR+WGE3MVX2oxu3FTUwIvblw
         lZCN6WRIgqPb0XapBspakU0uCOE23YQE4wQ7puvlUoHKkqYqH3qjNDyCnnXfCxZkNlf+
         kKxZmsVHE2y951eURknOwveHn9ISi4JO+Z/jAYQeRiKstd79cu2aYvpuqpQ1mbDCKk9b
         NcNYGHSW8yK9UFgDtBgZCrMAf4hfkHzzmIgQhKBt7sckj7k6i8TDulFoZGlEjjtwuLni
         voPuPYj8YrwxTc+m2Je4exd8F2rD7CijZ41eXq3cCAzzE6ATUownfsfiArNh4iHYJQCo
         0x6g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fItLyyIK;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-25855-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-25855-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-25855-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id af79cd13be357-7a806d8308dsi1466448085a.387.2024.09.04.04.23.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 04:23:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-25855-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fItLyyIK;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-25855-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-25855-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99AAB1C223CD
	for <alex.bennee@linaro.org>; Wed,  4 Sep 2024 11:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4391DA0F7;
	Wed,  4 Sep 2024 11:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fItLyyIK"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F69C1CF7AC
	for <kvm@vger.kernel.org>; Wed,  4 Sep 2024 11:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448737; cv=none; b=LCPCIjNxSTvjKbPW4GCnOqOSHj6C8MORi7plnicrMa8ee5GPrKQkcvn/xoXgcPfQDSvj6dwlsn5lPEB6vGCgQwtbiGvkMja57mVWIbBQyB5BWGwicmJRg55aS9KBYovN/Y/GHFthv7xpuhjrG3PGaI0Ech+mjKfrR1b0l3uEVXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448737; c=relaxed/simple;
	bh=7umYFkrqB0aOyE1OYiqdbbd+1oL4ufSCPqsef9TliNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Syu9pRmcFTRfyUd1svmxKtxUl4FUzxZJf0FqnryFufNhB4MmgWIfZN0c1Y/xeV8HoPZq5Tv22lSqTDZTHI94PT63mobb54OeVdTnHWmpHVVPb9gnR9pMowJInbyjcWBgU78uwC1EKElqhcmsDw7nuPN73J413VGCJlfNCxmZzPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fItLyyIK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725448732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u8HGx870TvahmH1JUtPzVJvMkaa7TMgcPX/CncVr9MI=;
	b=fItLyyIKNNEcu8ooloHu1t5H6qN5y+d4WxQ4/O3KQXeDwmGOMCZDu2K1lxyEOXJbEcFwg7
	xlo65giuU10bRZ2imhIAG+Xnm3lR19fekpmooyIqKV/3YukE91V6bNzxFp3K4vHvRcD/6a
	p5bvAf3Zx2xjB8Kjwb5+TxDGUHKOfVE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-669-8yEoSOX5PNa8sItUOf5ZuQ-1; Wed,
 04 Sep 2024 07:18:47 -0400
X-MC-Unique: 8yEoSOX5PNa8sItUOf5ZuQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1BD001956048;
	Wed,  4 Sep 2024 11:18:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.112])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B01361956086;
	Wed,  4 Sep 2024 11:18:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 937AE21E692E; Wed,  4 Sep 2024 13:18:36 +0200 (CEST)
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
Subject: [PATCH v2 02/19] tests/qapi-schema: Drop temporary 'prefix'
Date: Wed,  4 Sep 2024 13:18:19 +0200
Message-ID: <20240904111836.3273842-3-armbru@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: 03kUE4+CYSid

Recent commit "qapi: Smarter camel_to_upper() to reduce need for
'prefix'" added a temporary 'prefix' to delay changing the generated
code.

Revert it.  This changes TestUnionEnumA's generated enumeration
constant prefix from TEST_UNION_ENUMA to TEST_UNION_ENUM_A.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/unit/test-qobject-input-visitor.c  | 4 ++--
 tests/unit/test-qobject-output-visitor.c | 4 ++--
 tests/qapi-schema/qapi-schema-test.json  | 1 -
 tests/qapi-schema/qapi-schema-test.out   | 1 -
 4 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
index 024e26c49e..5479e68237 100644
--- a/tests/unit/test-qobject-input-visitor.c
+++ b/tests/unit/test-qobject-input-visitor.c
@@ -720,7 +720,7 @@ static void test_visitor_in_union_in_union(TestInputVisitorData *data,
 
     visit_type_TestUnionInUnion(v, NULL, &tmp, &error_abort);
     g_assert_cmpint(tmp->type, ==, TEST_UNION_ENUM_VALUE_A);
-    g_assert_cmpint(tmp->u.value_a.type_a, ==, TEST_UNION_ENUMA_VALUE_A1);
+    g_assert_cmpint(tmp->u.value_a.type_a, ==, TEST_UNION_ENUM_A_VALUE_A1);
     g_assert_cmpint(tmp->u.value_a.u.value_a1.integer, ==, 2);
     g_assert_cmpint(strcmp(tmp->u.value_a.u.value_a1.name, "fish"), ==, 0);
 
@@ -734,7 +734,7 @@ static void test_visitor_in_union_in_union(TestInputVisitorData *data,
 
     visit_type_TestUnionInUnion(v, NULL, &tmp, &error_abort);
     g_assert_cmpint(tmp->type, ==, TEST_UNION_ENUM_VALUE_A);
-    g_assert_cmpint(tmp->u.value_a.type_a, ==, TEST_UNION_ENUMA_VALUE_A2);
+    g_assert_cmpint(tmp->u.value_a.type_a, ==, TEST_UNION_ENUM_A_VALUE_A2);
     g_assert_cmpint(tmp->u.value_a.u.value_a2.integer, ==, 1729);
     g_assert_cmpint(tmp->u.value_a.u.value_a2.size, ==, 87539319);
 
diff --git a/tests/unit/test-qobject-output-visitor.c b/tests/unit/test-qobject-output-visitor.c
index 1535b3ad17..3455f3b107 100644
--- a/tests/unit/test-qobject-output-visitor.c
+++ b/tests/unit/test-qobject-output-visitor.c
@@ -359,7 +359,7 @@ static void test_visitor_out_union_in_union(TestOutputVisitorData *data,
 
     TestUnionInUnion *tmp = g_new0(TestUnionInUnion, 1);
     tmp->type = TEST_UNION_ENUM_VALUE_A;
-    tmp->u.value_a.type_a = TEST_UNION_ENUMA_VALUE_A1;
+    tmp->u.value_a.type_a = TEST_UNION_ENUM_A_VALUE_A1;
     tmp->u.value_a.u.value_a1.integer = 42;
     tmp->u.value_a.u.value_a1.name = g_strdup("fish");
 
@@ -377,7 +377,7 @@ static void test_visitor_out_union_in_union(TestOutputVisitorData *data,
     visitor_reset(data);
     tmp = g_new0(TestUnionInUnion, 1);
     tmp->type = TEST_UNION_ENUM_VALUE_A;
-    tmp->u.value_a.type_a = TEST_UNION_ENUMA_VALUE_A2;
+    tmp->u.value_a.type_a = TEST_UNION_ENUM_A_VALUE_A2;
     tmp->u.value_a.u.value_a2.integer = 1729;
     tmp->u.value_a.u.value_a2.size = 87539319;
 
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 0f5f54e621..8ca977c49d 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -119,7 +119,6 @@
   'data': [ 'value-a', 'value-b' ] }
 
 { 'enum': 'TestUnionEnumA',
-  'prefix': 'TEST_UNION_ENUMA', # TODO drop
   'data': [ 'value-a1', 'value-a2' ] }
 
 { 'struct': 'TestUnionTypeA1',
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index add7346f49..4617eb4e98 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -108,7 +108,6 @@ enum TestUnionEnum
     member value-a
     member value-b
 enum TestUnionEnumA
-    prefix TEST_UNION_ENUMA
     member value-a1
     member value-a2
 object TestUnionTypeA1
-- 
2.46.0

