Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp645296ejy;
        Wed, 1 May 2024 11:33:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULJjXiXidJI9Ol/JxJih3VNgkmRNPpHtRrz6roYHWxBaoVA8uok6nqjOKYAV6sB8WaZ4TJZJvQt14cDCP/jhmLbtKiTNV+
X-Google-Smtp-Source: AGHT+IF22g4pTndvF+BD4vXOBppzvWCFS2AzEX/Ixz3Cx2Z/ACRlA2zAc6rSiMw052BIgIZ4bM51
X-Received: by 2002:a05:620a:199f:b0:790:f5b4:1a48 with SMTP id bm31-20020a05620a199f00b00790f5b41a48mr3848693qkb.12.1714588405961;
        Wed, 01 May 2024 11:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714588405; cv=none;
        d=google.com; s=arc-20160816;
        b=W53FyVOWK0x/zZvzuMSPaGgqns1K//cP/2csq/0n1WWvRacBiCbKqTRzfEh+aQXWVS
         8jnuSTl6rBNJIQBbRZbJOKxTlFy9TA/r6PTPTEbHWLPM+pjRfADxaOTBIjbwgli6ejbg
         WKNps2DHgdiAelFeuG4iPAuD19neMwJo8GqC0Mv1/xvLn2JPP7lspnsikKaPGlsvSsep
         uhrfk91H1af/hX9lH/YTzbmJ5titzi4xk3rxgK46BXJnH+MJMIKyPML/KQWoFac4iZto
         HLPLdpg8nBv2JLgsayrAjfYVbGjzNUs4zQp0hfEPE+7xtdb6+YWjmA7HGJEgCywpOaJZ
         o9IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qw8atOBPdCUegCfiLQoTw0dka9Jo7NFjTdIkCzwC7Kk=;
        fh=+wZQXfkGrDFf08DRkV04g4pIKND0uH82z0Y2PgLJFoY=;
        b=AfXTBsXYmah1QR6sEdrPqO7a2+6qOQWjw26VR6ppQ276BLSWKuAaQypQEvIcqbFTy0
         IE60ZOudFbNi8LrOtRSXAAq0mYsZ8VB6slieNUVfdQg8pOOK/8J3er6azXaL2eKYIreO
         nfIZDmoB5uUTrSsbiNUvyfP245PkCtcB21xV6WEJilvzL2b2Oh6oVAJL9VNzOn2H2WTr
         7cqNx42uRmch3IZ71ij4ge7ZtOPzFLTBgDTH9eAxDRkKNU60ltWDijkCv2467/LrdNjD
         Lr8JuAD22MVPjvHfBXwLcOvgeUvp4XrmtR5a9RkkjJtREB6hgrY5O4J3XOq1Z4rfA8mu
         YCUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F0S4CPBL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dz13-20020a05620a2b8d00b007926bc3814csi1579457qkb.508.2024.05.01.11.33.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2024 11:33:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F0S4CPBL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s2Ejf-00023B-CQ; Wed, 01 May 2024 14:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2Eim-00019a-4w
 for qemu-devel@nongnu.org; Wed, 01 May 2024 14:30:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2Eik-0003ia-AC
 for qemu-devel@nongnu.org; Wed, 01 May 2024 14:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714588221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qw8atOBPdCUegCfiLQoTw0dka9Jo7NFjTdIkCzwC7Kk=;
 b=F0S4CPBLRHQHU62kgOubdMRVBpEH/h+JHzDw8bk+2WiQ1ImvSjjnR0XKKKkwB38dohNmZD
 HDAJZq63oNQrwvGLPxvNYx9HBJX987xe7MtIL1gkHiTcPOxdaVfi5L7P6nktzxLws+uMvF
 trENZ90QAaeTfCgJRIitN30fybd2VRA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-yVh6gb_HOmG9yx9bOLjtww-1; Wed, 01 May 2024 14:30:17 -0400
X-MC-Unique: yVh6gb_HOmG9yx9bOLjtww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB3BD80B935;
 Wed,  1 May 2024 18:30:16 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.42.28.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3204EAC6A;
 Wed,  1 May 2024 18:30:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clegoate@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 13/14] hw/i386: remove obsolete manual deprecation reason
 string of i440fx machines
Date: Wed,  1 May 2024 19:27:58 +0100
Message-ID: <20240501182759.2934195-14-berrange@redhat.com>
In-Reply-To: <20240501182759.2934195-1-berrange@redhat.com>
References: <20240501182759.2934195-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.897,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: eFc22dG2ciVQ

The automatic deprecation mechanism introduced in the preceeding patches
will mark every i440fx machine upto and including 2.12 as deprecated. As
such we can revert the manually added deprecation which was a subset:

  commit c7437f0ddb8ee45bf96d949ddfcbb7697ae3d415
  Author: Thomas Huth <thuth@redhat.com>
  Date:   Fri Oct 6 09:52:47 2023 +0200

    docs/about: Mark the old pc-i440fx-2.0 - 2.3 machine types as deprecated

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/pc_piix.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 9f92504cc4..4137e03f6f 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -812,7 +812,6 @@ static void pc_i440fx_machine_2_3_options(MachineClass *m)
 {
     pc_i440fx_machine_2_4_options(m);
     m->hw_version = "2.3.0";
-    m->deprecation_reason = "old and unattended - use a newer version instead";
     compat_props_add(m->compat_props, hw_compat_2_3, hw_compat_2_3_len);
     compat_props_add(m->compat_props, pc_compat_2_3, pc_compat_2_3_len);
 }
-- 
2.43.0

