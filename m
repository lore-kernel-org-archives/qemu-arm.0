Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2040631ejb;
        Tue, 24 Oct 2023 06:18:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+ZdghT5V76K1PqGVp2uHXV9Wc8jhpL8VcRTDkj9Wq4OcSbyZz/NJrNJ71tjLmsVc7RIIo
X-Received: by 2002:a1f:7d0f:0:b0:49a:bff1:23 with SMTP id y15-20020a1f7d0f000000b0049abff10023mr10047973vkc.5.1698153481452;
        Tue, 24 Oct 2023 06:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698153481; cv=none;
        d=google.com; s=arc-20160816;
        b=J8poI8h3b0kd3RewE/UPupZefCZ4btZNTHlrBhaw+6ztY1hD/2m1RDzOUPdeM0seKb
         7Qr4dhED17/KBU7ZRGT93H5AlJyIFfF1AXMo5SYX3XjFaksA2nTNaTnx14JqR5SLhGQo
         vf1e1yUakNb8e+jpkOAuH8eRGPfT/Keh/dYyxCGvSBFVF+XS2NSeXMBLXarMG0c9wV4r
         QuPQDwlLvlfwOga0JmUM9oH6Q45IX80gsHjPpOJceUudIaAT+zoWkJ6MSRVidjrnFZkO
         ROt4qBL3yffSXx7YElOImXoA2bRWbqz8gsIbjtqpW2MkdhyCx37M2M0KVKiCD4dBWohd
         dk+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=65HtqjEgp5Bqh3Qad91zv3o+mLXRJbK00jYVKDpCWLY=;
        fh=e9feSw8SSOtT/dgZZLe6uilVOFwjb0itHlOwuVUfZns=;
        b=mYedsxnpGQ3c/6TOd/xyHKO+lzubKKiZH4IVrGS423/1Hz+HctV3AQ+mq+FVCyAmhR
         62EYeWXEGKbsxX/+BL9TN6wXvCKGA2TmSqK96FECiW5dCtC5L98zhparUyIYVlzQ3Lqc
         LWkyU5opWY5X10rMiD2oXY6V7dWU5nnQJ+iuW/SywidMJTygf7UAIly1X5end3FB4pmU
         ZWThhBaRkbK6JZqz2kEVnyNvUPYiVgbKpROh8l0I9L6L0JCRZqjUEsznybW1M6qtlbnp
         z1ybmfC+laDlMZ0iY405ea4Ie3K084DkPcYq1O/rRIy/jZvEYsDw/eF11c43MCIV/qqY
         HcMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gzx011WP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q62-20020a1f2a41000000b0048c1cc740ebsi1015837vkq.178.2023.10.24.06.18.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 06:18:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gzx011WP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvHI5-00065Q-FG; Tue, 24 Oct 2023 09:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHGf-0002rF-2U
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:16:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHGY-0001vI-Lg
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698153374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=65HtqjEgp5Bqh3Qad91zv3o+mLXRJbK00jYVKDpCWLY=;
 b=gzx011WPiwH+LesMTCwid4esB0ce+VPmrcPAlyQWH/mLbGctMbffZS/75TvEwMz1D3Rcyo
 +Mr4VMjVsipY5RYqP0ie2cP8jXdsZisLZe1PtH/rnBoYpD037rhSvRv3N/Vms7NWEWsuIg
 bBrWt2BxGxcPUC2geXA3bTnbFI0/JDw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-446-B-x7LPgsPp23z57mzDzxcA-1; Tue,
 24 Oct 2023 09:15:09 -0400
X-MC-Unique: B-x7LPgsPp23z57mzDzxcA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AB573813F2F;
 Tue, 24 Oct 2023 13:15:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E8FD1C060AE;
 Tue, 24 Oct 2023 13:15:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Corey Minyard <minyard@acm.org>, Li Zhijian <lizhijian@fujitsu.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Kevin Wolf <kwolf@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Fam Zheng <fam@euphon.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org
Subject: [PULL 17/39] migration: Rename ram_compressed_pages() to
 compress_ram_pages()
Date: Tue, 24 Oct 2023 15:12:43 +0200
Message-ID: <20231024131305.87468-18-quintela@redhat.com>
In-Reply-To: <20231024131305.87468-1-quintela@redhat.com>
References: <20231024131305.87468-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: OoPsPP4owO2T

We are moving to have all functions exported from ram-compress.c to
start with compress_.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231019110724.15324-12-quintela@redhat.com>
---
 migration/ram-compress.h | 2 +-
 migration/ram-compress.c | 2 +-
 migration/ram.c          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/ram-compress.h b/migration/ram-compress.h
index e222887fb7..0d89a2f55e 100644
--- a/migration/ram-compress.h
+++ b/migration/ram-compress.h
@@ -68,7 +68,7 @@ int compress_threads_load_setup(QEMUFile *f);
 void decompress_data_with_multi_threads(QEMUFile *f, void *host, int len);
 
 void populate_compress(MigrationInfo *info);
-uint64_t ram_compressed_pages(void);
+uint64_t compress_ram_pages(void);
 void update_compress_thread_counts(const CompressParam *param, int bytes_xmit);
 void compress_update_rates(uint64_t page_count);
 int compress_send_queued_data(CompressParam *param);
diff --git a/migration/ram-compress.c b/migration/ram-compress.c
index 036e44085b..fa4388f6a6 100644
--- a/migration/ram-compress.c
+++ b/migration/ram-compress.c
@@ -516,7 +516,7 @@ void populate_compress(MigrationInfo *info)
     info->compression->compression_rate = compression_counters.compression_rate;
 }
 
-uint64_t ram_compressed_pages(void)
+uint64_t compress_ram_pages(void)
 {
     return compression_counters.pages;
 }
diff --git a/migration/ram.c b/migration/ram.c
index 849752ef29..6335564035 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -932,7 +932,7 @@ uint64_t ram_get_total_transferred_pages(void)
 {
     return stat64_get(&mig_stats.normal_pages) +
         stat64_get(&mig_stats.zero_pages) +
-        ram_compressed_pages() + xbzrle_counters.pages;
+        compress_ram_pages() + xbzrle_counters.pages;
 }
 
 static void migration_update_rates(RAMState *rs, int64_t end_time)
-- 
2.41.0

