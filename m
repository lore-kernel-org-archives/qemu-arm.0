Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1761578dlb;
        Thu, 20 Jun 2024 10:03:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0Tf1WmsMlZ0k0w6DDhsFhOvOzY1J8fPPO5n/jMT8GryABlLTr6HYFXhl5C1d+FXcDNCcbASDJSqP7DZGn1UXpZfnKUzNN
X-Google-Smtp-Source: AGHT+IFd2z9S7e8FM3bVXtKga6McdKDQQ+32BKmyJoHOHNdg4gV96VDgZXCk7Pu7DWXQd8r1qZqr
X-Received: by 2002:ad4:55e3:0:b0:6b4:fda0:ce18 with SMTP id 6a1803df08f44-6b501e9f66amr60151586d6.41.1718902982264;
        Thu, 20 Jun 2024 10:03:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718902982; cv=none;
        d=google.com; s=arc-20160816;
        b=Vb4VDoxRVDVqjRTXypHM91ZRtqgKOefOenZUgxljUQVxaFtPn4UJRKnffLGQPJVvtV
         01F1QEiLwNrPxQAIBuM2N2e7KjaUXcfYWID6o6DoX2ONO0Pz0kVtXWRrRA34xiuGlkCQ
         NsvT7WPsQqfHS2h2xwM63Ef+BXhapB2Fe9M/EwMc86SRdZo+1yJ6c2SNH1Noqs4KtcQL
         zg8tPcRqGdLTxUR8xOzFm1SRc9A6ZdhzY/pSJGk4IzOwAgdi7r29lcXC1Lp6+OGg9lpO
         2MNa2UU9ECQlhU6MYUexgEiWkcXY0riDUV/LGGZ+3v24rXISNvht2FTWVmcfo34qF5Wv
         QpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cp5hTDyX0yXK7RBKij04gMtATUSvfKAIAWpFR+x0kC4=;
        fh=3Wd8C5ILZWfK4GrPw00UkAAsfCUTnUYMb3cFGB6sOew=;
        b=SKsCEz8ENzVtI8TxhMdOsjhSVAdZlDZOg1nta6B27nf8dRiJmXC5iNRgEVyn3ERUKM
         RsHpFeg4o/W/n5vjjjWc7x4eqeOE8ZpzpoqDnnAeTGsggDlnijbLyiNLIT+QA2QmRmoq
         Zt/0B2gWG7wDNTL1GObmbsydA2Njr/6SO+4nXgqKDo+nEIC6jz2fuXAvQ3oGflWaSTyK
         efrX5ZsV3YkWCusm1UY0dHdiUCzKbwU7dS5CbYo/2BiWR2kM4P4UUlW+6R9WZEXhmEh5
         0mtddrogY/sWREcG/3R1gBofYnPCw8ixG7Ygaq5JX49kkkqQ8hldGF34AFJKIoWN3m8A
         z84w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J1o6+BkE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b512bec8a5si20509006d6.134.2024.06.20.10.03.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 10:03:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J1o6+BkE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKL99-0001fx-Tk; Thu, 20 Jun 2024 13:00:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sKL8x-0001JR-KT
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 13:00:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sKL8r-0001QB-HL
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 13:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718902807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cp5hTDyX0yXK7RBKij04gMtATUSvfKAIAWpFR+x0kC4=;
 b=J1o6+BkEZfMna6uC/16WwNk4aFlW9Ha1PP8FbsWld7ejw621tG3WUpjyvqo08Bw8ghZjnN
 bGrEIlBH1xXDygqV1ujQBSImBO6l3m+MYk0rvGbuwIDdYxVpBcff5F7an4jrZVpmea2u9L
 XYx8fYzMCtd0JV/Q/sHWD9j4jbedrFI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-171-BEtTyNoYMYGeIfmCQyYrJQ-1; Thu,
 20 Jun 2024 13:00:04 -0400
X-MC-Unique: BEtTyNoYMYGeIfmCQyYrJQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8C66F19560B8; Thu, 20 Jun 2024 17:00:01 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.42.28.69])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 66BC019560AF; Thu, 20 Jun 2024 16:59:50 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, devel@lists.libvirt.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clegoate@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 14/14] docs: document special exception for machine type
 deprecation & removal
Date: Thu, 20 Jun 2024 17:57:42 +0100
Message-ID: <20240620165742.1711389-15-berrange@redhat.com>
In-Reply-To: <20240620165742.1711389-1-berrange@redhat.com>
References: <20240620165742.1711389-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.152,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: AWkFpnxtXweC

This extends the deprecation policy to indicate that versioned machine
types will be marked deprecated after 3 years, and then subject to
removal after a further 3 years has passed.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/about/deprecated.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index ff3da68208..bba12d1641 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -11,6 +11,19 @@ releases, the feature is liable to be removed. Deprecated features may also
 generate warnings on the console when QEMU starts up, or if activated via a
 monitor command, however, this is not a mandatory requirement.
 
+As a special exception to this general timeframe, rather than have an
+indefinite lifetime, versioned machine types are only intended to be
+supported for a period of 6 years, equivalent to 18 QEMU releases. All
+versioned machine types will be automatically marked deprecated after an
+initial 3 years (9 QEMU releases) has passed, and will then be deleted after
+a further 3 year period has passed. It is recommended that a deprecated
+machine type is only used for incoming migrations and restore of saved state,
+for pre-existing VM deployments. They should be scheduled for updating to a
+newer machine type during an appropriate service window. Newly deployed VMs
+should exclusively use a non-deprecated machine type, with use of the most
+recent version highly recommended. Non-versioned machine types follow the
+general feature deprecation policy.
+
 Prior to the 2.10.0 release there was no official policy on how
 long features would be deprecated prior to their removal, nor
 any documented list of which features were deprecated. Thus
-- 
2.43.0

