Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp644149ejy;
        Wed, 1 May 2024 11:31:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6ZBaN1Gp00jBcEvKMnLZkBgFBbLU923A9z0wLbN+MR//qsaF32sIV3VctoOcxh7jqxI2ZjEo1Cxcqu4Xvgk5UsLMQQFEw
X-Google-Smtp-Source: AGHT+IG/SnY3R8Y/nGov+zBq+j7J0KDLXSNlK8inlsTBMQpOmtIFusVxdGV2CL9Ib98kaIQYHcfj
X-Received: by 2002:a05:6830:18d4:b0:6ef:9e36:b7b9 with SMTP id v20-20020a05683018d400b006ef9e36b7b9mr2989364ote.5.1714588283562;
        Wed, 01 May 2024 11:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714588283; cv=none;
        d=google.com; s=arc-20160816;
        b=T/ANjS25cEYGel9f+oqHMeb3EsK9yBm6i1IinoMOefb8Kyx1RSVYpa3yIMRklFtTxd
         f3O52zj1E+QoBB9oHgYIQBbhHkNAjvVK6tZtJdr+RC1X4u/uUqo4DxBqXtXVQfCGMAvV
         kOqY0rrE13N9QlvTiWURJoIaTfYgcH5YavV4weyaq1wdJmbLMlx14f5X4fuWiIc2MubC
         CY3r0jbCS3ROgyXady/9M/zb7avZJP1wn81fLEDaamLHv6/1RUIE3Rr7ipt6hi8ZI/ps
         4AT16q71Yghr4NaN1nXNo6qim8z9HFlttJ9BXQQBbgDAg4P5SMkij9HHKW4PllWQS0EU
         +kug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YB7cR1t0lR/9NNcOkNXfOcxVeFr4MAisnSRdl+0uzHQ=;
        fh=+wZQXfkGrDFf08DRkV04g4pIKND0uH82z0Y2PgLJFoY=;
        b=Dw6k7eprrjPjHB6381h4+V3GUnsjvSdR7e8WoUBmBsjbZPUUhHXwMr6JTbI0irhh6I
         Y5XxnXInlWQVMHgawLhcR07gfQ1dT96Qjiba6bgyyy7CfNC3akiseadPiSzyv0Z02Sb5
         xECAMqm2huF0vUhkIzT/pOqOB1HH7XwAfX19hI+KEwLnLS8R0HfvvMMRYKpmBx8XSz14
         0XHsMx3xq7WaeL4cII96j2A47FVvvuk2temVVivqO4tIzoN4lzzqtRtBTTbwIRtVF/Ry
         TM2f4CbylOW94wxKdbwp++P/+GcWOask7qSV4T3dAxJtmVeUk64YLTg/m2XOAZsyaeQe
         LocA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BuS5Z0zq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj16-20020a05620a1d9000b00789ed541240si31373015qkn.330.2024.05.01.11.31.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2024 11:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BuS5Z0zq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s2Eim-00012C-KU; Wed, 01 May 2024 14:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2Eid-0000mq-Pz
 for qemu-devel@nongnu.org; Wed, 01 May 2024 14:30:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2Eia-0003gn-F2
 for qemu-devel@nongnu.org; Wed, 01 May 2024 14:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714588211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YB7cR1t0lR/9NNcOkNXfOcxVeFr4MAisnSRdl+0uzHQ=;
 b=BuS5Z0zqnG8dv99h3AkXyQSmQjx5abM0ataaUa+w9GxYEGbqMuTuEvneGahwJPA5Z8DRYM
 wO+7Gj9ZFrQbYJQGQ7Lyb5hWETnb+TnfzVwE2M3aXZVbsXWsVMkSio6YxDJSxjEOQWJAon
 YcnjSgUavWxcWFCIaPjT3aSsFJtLvcQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-PW1zqcQFPJuc7hJlCHJ-Dw-1; Wed, 01 May 2024 14:30:07 -0400
X-MC-Unique: PW1zqcQFPJuc7hJlCHJ-Dw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2ADD80017B;
 Wed,  1 May 2024 18:30:05 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.42.28.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E237AC6A;
 Wed,  1 May 2024 18:30:00 +0000 (UTC)
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
Subject: [PATCH 12/14] hw/ppc: remove obsolete manual deprecation reason
 string of spapr machines
Date: Wed,  1 May 2024 19:27:57 +0100
Message-ID: <20240501182759.2934195-13-berrange@redhat.com>
In-Reply-To: <20240501182759.2934195-1-berrange@redhat.com>
References: <20240501182759.2934195-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.897,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: tpUdjBY97g1h

The automatic deprecation mechanism introduced in the preceeding patches
will mark every spapr machine upto and including 2.12 as deprecated. As
such we can revert the manually added deprecation which was a subset:

  commit 1392617d35765d5d912625fbb5cab1ffbed8e140
  Author: Cédric Le Goater <clg@kaod.org>
  Date:   Tue Jan 23 16:37:02 2024 +1000

    spapr: Tag pseries-2.1 - 2.11 machines as deprecated

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/ppc/spapr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 2aad99a2f2..1b8fa71eb8 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -5140,7 +5140,6 @@ static void spapr_machine_2_11_class_options(MachineClass *mc)
     spapr_machine_2_12_class_options(mc);
     smc->default_caps.caps[SPAPR_CAP_HTM] = SPAPR_CAP_ON;
     compat_props_add(mc->compat_props, hw_compat_2_11, hw_compat_2_11_len);
-    mc->deprecation_reason = "old and not maintained - use a 2.12+ version";
 }
 
 DEFINE_SPAPR_MACHINE(2, 11);
-- 
2.43.0

