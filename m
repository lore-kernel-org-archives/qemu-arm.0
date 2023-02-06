Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4076085ejb;
        Mon, 6 Feb 2023 03:23:41 -0800 (PST)
X-Google-Smtp-Source: AK7set/lCfiWBkqtAptgSjXUBZkF+oG9Nur4jp1qBRPUM4iAZ/Vw5w9o2r1vhmppVG1gvnofF9XW
X-Received: by 2002:ac8:7d14:0:b0:3b6:2ff8:3009 with SMTP id g20-20020ac87d14000000b003b62ff83009mr37692449qtb.2.1675682620805;
        Mon, 06 Feb 2023 03:23:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675682620; cv=none;
        d=google.com; s=arc-20160816;
        b=UVpZZwLVqBZE+n+b2EIUmp6NdOHAgg3jHidAuTB0TX5IA874xokaXhTBgIe/CAKnHb
         iVByLl3KymkkZmyU5aFrdrt8AzWld7il/yX/qk7FKU6O77GQsndCpfAOnQSh6v62Fmub
         6KQ+cDHZfxXFpBJtok0f+4VgOlWx5LufpUyhKbS7hzflic2fGaUmKpQoJO4b0OI/BzAL
         S/eeQOWsg4zEHxVSVItOhtMjMumCFXTp3HXRjx2/Rh6Lxf5tZYEixYf5KHr2mjKYDob6
         aZILvPIoKAWoBHe9XQcoRIwgVsVscUH8tbGIc0LWRy6YO5mkn/PFXUE8E7zUIzYpqvae
         aJWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AV1dHV/DKMAbDep2jVZbQdk/CCup6inKTxE45seX6JQ=;
        b=wqC9NWnXg062KaAScBc38XA1o24hLatf7H9kKc7cD7H56GLjKSB5qknNo3gWbsVrXV
         taUjrgRenTWTjmx4bbWN61UeK3LN/KqpeI2NQ/CutV8Aldq++iozeM5flm9+EgLWsari
         cwLQ/8v5q3LYCKFiR04pe1pL+kgzk9mE6VnV6C4RmBbH/WMSRFWdy2iN3FdUR0G6mC6v
         jTi1eSc3vI4HmBZrr/5uxBxJeUrwF9bLqachH1bId4O+qL8xpx+xtHD/GLo7LH13G3LB
         0SDusn31Ryr2PY0/x+7QAGHhLTJfTZPWTg7z0ldsMCIoTYRzbrXu7eWRsBlevkDEnu+X
         cNAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZBGclPXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21-20020ac85615000000b003ba1a343c31si4185142qtr.95.2023.02.06.03.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 03:23:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZBGclPXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pOzaU-0005F1-Th; Mon, 06 Feb 2023 06:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzaS-00052W-En
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 06:23:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzaP-0003Xp-KM
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 06:23:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675682581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AV1dHV/DKMAbDep2jVZbQdk/CCup6inKTxE45seX6JQ=;
 b=ZBGclPXnqZPZewW0+0PvCEgIuwKLeFsbcLynMlIzRDwV/5GSaY6yprhLc3+QEiSZ3xMul7
 TZwSJKcE4R9BIPwnvNSlKa1RLHZPIwxgn/2ApCH4n1lY1mp6SshCB09lKm/whZsiGYBT6b
 /1uO1SaCTrXREKxkrkkfgL4+uj59mCY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-M3c4unt1NFyNVhKtRVjbGw-1; Mon, 06 Feb 2023 06:21:27 -0500
X-MC-Unique: M3c4unt1NFyNVhKtRVjbGw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EC891C05151;
 Mon,  6 Feb 2023 11:21:27 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-63.bne.redhat.com [10.64.54.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F46B492B21;
 Mon,  6 Feb 2023 11:21:22 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH RFCv1 5/8] kvm: Synchronize secondary bitmap in last stage
Date: Mon,  6 Feb 2023 19:20:07 +0800
Message-Id: <20230206112010.99871-6-gshan@redhat.com>
In-Reply-To: <20230206112010.99871-1-gshan@redhat.com>
References: <20230206112010.99871-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DaFJRZ4+K93J

In the last stage of live migration or memory slot removal, the
backup bitmap needs to be synchronized.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 accel/kvm/kvm-all.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 1a93985574..9ec117c441 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1377,10 +1377,12 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
                  */
                 if (kvm_state->kvm_dirty_ring_size) {
                     kvm_dirty_ring_reap_locked(kvm_state, NULL);
+                    kvm_slot_get_dirty_log(kvm_state, mem, false);
                 } else {
                     kvm_slot_get_dirty_log(kvm_state, mem, true);
                 }
                 kvm_slot_sync_dirty_pages(mem, true);
+                kvm_slot_sync_dirty_pages(mem, false);
             }
 
             /* unregister the slot */
@@ -1604,6 +1606,11 @@ static void kvm_log_sync_global(MemoryListener *l, bool last_stage)
              * However kvm dirty ring has no such side effect.
              */
             kvm_slot_reset_dirty_pages(mem);
+
+            if (s->kvm_dirty_ring_with_bitmap && last_stage &&
+                kvm_slot_get_dirty_log(s, mem, false)) {
+                kvm_slot_sync_dirty_pages(mem, false);
+            }
         }
     }
     kvm_slots_unlock();
-- 
2.23.0

