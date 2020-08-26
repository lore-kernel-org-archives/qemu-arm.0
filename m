Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp817663lfc;
        Wed, 26 Aug 2020 07:43:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9btA1vXvfhp5gLEQ4CeT788uQPT6yN/XYPYXx1ctdotbGxPgkCtJkwj/BoPLa/dXbFTob
X-Received: by 2002:a25:cfcc:: with SMTP id f195mr22446749ybg.490.1598453005217;
        Wed, 26 Aug 2020 07:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598453005; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/gE/E4wpIlgsZEFEZT0vi40A6oHFPxHSe9wv7hhSogZ/jDaB51+tLK6TmJWN+QujE
         5GU3kZp7GeTj/OtT+Ogek32S+HykjnToWNMUTyCXJWvLSV66H0CYlqjMEjo5T2n4zXKO
         nN5LfZPIxxiyU3D+HJIYQ9OMAjvVkCpj1CD6y+2sZIEd1ZHSJeMSZM/49o0ZVzp2TOQM
         fPtLykU/IziOH6DYiNNTxGU3uRfL+t5p6ZTFjlnby9FlMHMoKhoW6WP93P6jj5l0ZC5h
         9ZzT8X4bfswS1YKXTpUuiGH72urMI6GJ3ASMURL7tQuKr8B0/Vaf0JsnAu+6kvbb7Oad
         AQwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Y7WEAFw6lxhAjAKjrEuObXUZF982ZbZDNmE/a7NNAaA=;
        b=mvuWkA42JZC79WGfMr+cJpwd+3oxHc6kTNwaNMLz6dayE5oMz0cxaY3NNIzHBCDs4s
         605ES2sbqNW4Uj7mdZx1rR1ZcuaIesj6GEF9yUjTZVcCj+2rZdFeTWsUFqI7H9upqyen
         1TSy3Sl/gzXWPgzCIGhAf8KKo6YcwW9yQmNz2QHNLnjXhj2hF9K9rPzwZw1ZvC5m5M4u
         fEaOhSW3Lz6yHzGfu63kGWx0dKnaLbZYnUfyOKXsS0mQNwLnHSpBA3GPp2n0c5rBGj9U
         FdyVfk2qtz/r9u4NI3y844rLaQ1ggok5sMMl07IxbEilpWWzelCYbQpOpRPJOibL2s2I
         loZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=acsM4ALR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18si2110779ybr.89.2020.08.26.07.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 07:43:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=acsM4ALR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAwe4-0000fY-Hd
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 10:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kAwb8-0002lp-Dq
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 10:40:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39469
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kAwb6-0006Wr-B0
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 10:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598452819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7WEAFw6lxhAjAKjrEuObXUZF982ZbZDNmE/a7NNAaA=;
 b=acsM4ALRo9AaV8xTdzP4VwHeEFualNBohodoQbm4EGDpbi6zj2mQmAcWU+hOTgYgju7d9U
 NWojv/3tQ6dmcWt3exhd/Dk0m1fxZZg8cFEG+VONpoLzgUzI8ZYWr8mo/uumb9xdrPYH0e
 zW715Ta+HeCrJeQZBinl7vA8ijzlKRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-1LXAvbqFOiiz84R7l3VDpw-1; Wed, 26 Aug 2020 10:40:15 -0400
X-MC-Unique: 1LXAvbqFOiiz84R7l3VDpw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F8EC801ABC;
 Wed, 26 Aug 2020 14:40:06 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-115-59.ams2.redhat.com [10.36.115.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 937ED8AC03;
 Wed, 26 Aug 2020 14:40:01 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Xu <peterx@redhat.com>
Subject: [RFC v6 13/13] memory: Skip bad range assertion if notifier is
 DEVIOTLB type
Date: Wed, 26 Aug 2020 16:36:51 +0200
Message-Id: <20200826143651.7915-14-eperezma@redhat.com>
In-Reply-To: <20200826143651.7915-1-eperezma@redhat.com>
References: <20200625191651.5817-1-eperezma@redhat.com>
 <20200826143651.7915-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eperezma@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 03:56:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Avi Kivity <avi@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J3fyoxfwmGLY

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 softmmu/memory.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 4ed63f4d0d..d2797e996a 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1915,6 +1915,7 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
                                     IOMMUTLBEntry *entry)
 {
     hwaddr entry_end = entry->iova + entry->addr_mask;
+    IOMMUTLBEntry tmp = *entry;
 
     /*
      * Skip the notification if the notification does not overlap
@@ -1924,10 +1925,18 @@ void memory_region_notify_iommu_one(IOMMUNotifier *notifier,
         return;
     }
 
-    assert(entry->iova >= notifier->start && entry_end <= notifier->end);
+    if (notifier->notifier_flags & IOMMU_NOTIFIER_DEVIOTLB) {
+        /* Crop (iova, addr_mask) to range */
+        tmp.iova = MAX(tmp.iova, notifier->start);
+        tmp.addr_mask = MIN(entry_end, notifier->end) - tmp.iova;
+        /* Confirm no underflow */
+        assert(MIN(entry_end, notifier->end) >= tmp.iova);
+    } else {
+        assert(entry->iova >= notifier->start && entry_end <= notifier->end);
+    }
 
     if (memory_region_notify(notifier, entry)) {
-        notifier->notify(notifier, entry);
+        notifier->notify(notifier, &tmp);
     }
 }
 
-- 
2.18.1

