Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp644980ejy;
        Wed, 1 May 2024 11:32:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZuJnJLj8JWUH6a9tKch2lx6CdilpsfBq9+PRL7kWTCuj9iSTL3wPdEKtjIdWjBTVc2xLDBHy+jzXMtE5n02npMlQt0l53
X-Google-Smtp-Source: AGHT+IExIo6ILow49q28uF4wzo8qBjCEOjR06FilSF/W4FJE1z7PxpFfGNjyI3ER9ZtomoRtkqXq
X-Received: by 2002:a05:622a:5e8b:b0:43a:7b64:2fcc with SMTP id er11-20020a05622a5e8b00b0043a7b642fccmr937176qtb.7.1714588371420;
        Wed, 01 May 2024 11:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714588371; cv=none;
        d=google.com; s=arc-20160816;
        b=whilfeV5Z05pqiA7jvlTujuEqRtdX1NGioEb7m/KZ8S9Z7P5mFjosQ1WZWMyTipPc3
         BRAV4WENcDumLKjpDsmCeOOzCyzeWi8wqRT46PsJMp1auNqngPOpSGAKqvptRE3GaTyv
         kPFvlMRb+DFNa610KpESUe6VqR3hVBBcQkLqRZQpF7Ufd4XAnESyaZd0C5IW7xJp2thH
         LU1g8T7BYLUxqAYPAD8PcLXQ+gvrUKYqjvX6Hu/2JmeWzTm3S0nOfVkwcUllU9CtwDj+
         GC1W33hg8ylUQxbBNy0n8qFGOLk3017a0eEHad02nmIhQUt+Jisq98Nk6kdCEfdem03V
         2ZMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=55LYe09ZkKTt5KEzMkOfymT9wIM5eYrex0lvCFU2yqA=;
        fh=+wZQXfkGrDFf08DRkV04g4pIKND0uH82z0Y2PgLJFoY=;
        b=CMjzr0vRj3C4MEfqnP0pI/RVdcxI4EQb9xXODDDYYp4gp4k3gVf3EE40rp1VxNvpns
         w/X/8KvED19Ius2ru10cD0nnvXehRHZf4HdLbipAsJGEtMTbhDmyKXt598ulXJee+SVe
         H7cYa1I8slQPqF0eYHOZYhXL4aihIEHpHyRPG5gotnZ/ghKQJimKdmH0E46Dp3spaUFi
         uSRf8c/xaw7Xnnfbq0oZaDWqFmCx/WlEqnFmtMm8aUSK6Gcoe+mteP2324S2icH015sz
         Ha4D1mEIEEJXOjStaUPda7aahaukP5Cy9f6QAIWZFC3HhcqltmBkOsoC6cL+jYbR6Pqj
         fB+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cYHSMzXl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6-20020a05622a000600b0043afc329931si6935488qtw.69.2024.05.01.11.32.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2024 11:32:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cYHSMzXl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2EkU-0003PI-Df; Wed, 01 May 2024 14:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2Eix-0001P2-AE
 for qemu-arm@nongnu.org; Wed, 01 May 2024 14:30:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2Eiu-0003kF-89
 for qemu-arm@nongnu.org; Wed, 01 May 2024 14:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714588230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=55LYe09ZkKTt5KEzMkOfymT9wIM5eYrex0lvCFU2yqA=;
 b=cYHSMzXlQe5aamS6p/p4m3XgAp8OBomFFBXoxXl9J2fEzjTTNQoN2Tm3DsxfCUBqmKXzKR
 dn0V2vy7/jcKpNS15tODNWD6DoussUh6xXPE+j9+6X+32Rh77KtkQzg2ihouEB9daqMie8
 MpXmyfFEydELlWY2MCNXRaV/0jAO0Nc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-3vzO9TcOM86q7dj0xX7y_w-1; Wed, 01 May 2024 14:30:28 -0400
X-MC-Unique: 3vzO9TcOM86q7dj0xX7y_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFF3A80E95D;
 Wed,  1 May 2024 18:30:27 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.42.28.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2470A8C4;
 Wed,  1 May 2024 18:30:17 +0000 (UTC)
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
Subject: [PATCH 14/14] docs: document special exception for machine type
 deprecation & removal
Date: Wed,  1 May 2024 19:27:59 +0100
Message-ID: <20240501182759.2934195-15-berrange@redhat.com>
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
X-TUID: +owZ96dFCDIJ

This extends the deprecation policy to indicate that versioned machine
types will be marked deprecated after 3 years, and then subject to
removal after a further 3 years has passed.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/about/deprecated.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 7b8aafa15b..55120e774c 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -11,6 +11,18 @@ releases, the feature is liable to be removed. Deprecated features may also
 generate warnings on the console when QEMU starts up, or if activated via a
 monitor command, however, this is not a mandatory requirement.
 
+As a special exception to this general timeframe, rather than have an
+indefinite lifetime, versioned machine types are only intended to be
+supported for a period of 6 years, equivalent to 18 QEMU releases. All
+versioned machine types will be automatically marked deprecated after an
+initial 3 years (9 QEMU releases) has passed, and will then be deleted after
+a further 3 year period has passed. It is recommended that a deprecated
+machine type is only used for incoming migrations and restore of saved state,
+for pre-existing VM deployments. Newly deployed VMs should exclusively use a
+non-deprecated machine type, with use of the most recent version highly
+recommended. Non-versioned machine types follow the general feature
+deprecation policy.
+
 Prior to the 2.10.0 release there was no official policy on how
 long features would be deprecated prior to their removal, nor
 any documented list of which features were deprecated. Thus
-- 
2.43.0

