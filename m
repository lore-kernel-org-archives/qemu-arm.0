Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp828982lfm;
        Wed, 8 Jul 2020 15:29:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKUvV2f7ZbYwwCA8lMXt/Se0HH0wauNDNJpkn3HEgs4H3NJm3W7+N3V2mLILwfOxhbqx8y
X-Received: by 2002:a25:3789:: with SMTP id e131mr80634998yba.417.1594247348655;
        Wed, 08 Jul 2020 15:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594247348; cv=none;
        d=google.com; s=arc-20160816;
        b=lypQqDblfQnqrSHLxhc914HZ4k/34SwflzvNHP7OJxXkN93GOhLM7BORmKTLma6v7p
         siXj9FsL0owByj9RNceujywUKhcET9nGOedUrBxR8rdt7EuDc0RH81Z5xVV4lO+q0w7y
         RIcWELIn2bofZBmO9a/0DYtSLGz4DX2TgXqdRb0LWcybrhwmJB8hADM4WjBOC4Esk0ZG
         S/1XEZ6nlQF/mzkSLvA2pzC5hvW8LXA+c+J+DXcMi/HpRdE6GXBzY1QzPvs1pXG/f/Kp
         aegR5B9VF5akUOeCp/TmHK9tIY7h5SnlQc2fxtx/4ci1YvqBVrSolnkEYkb+4KCuL28v
         eFeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=o2m2buV1dKa2VfM+T5GuJKXe6mIfufBwTZlCdyuv+w0=;
        b=sRHf92q+zNGUtzJlXb0k1WlnVHtDETzKey3XZ2ZD2zLlRQivuDbJNMxokfSi3HASJU
         xkTvI68C300YRX0Mx05Eua0pf6qeQAY3RSm1c8eL0mKta0VHb1xD9+PQ6ckqh3Bl5krN
         OTp0oqOJJYnzLkl5CnL+s1cyHqED7Ye4V+gXq4mK4Bu08GNAbAzZbP5AGug8GdjQ28J4
         TxrQBsjqlDMFnpi7dMSBkvCSBNy5fgUErDBf+Ogrc4HjqEKpCKNjK6wsLr/g4Yce0zw8
         WYki/O0uqYUO89Uqnoz6WoFdlQjz9EmvaebtcZayKBbEB65auTnt1gnw0VTmLazkG8SN
         wmQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YbFnmBf0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si836896ybn.76.2020.07.08.15.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 15:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YbFnmBf0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtIYt-0000Ur-UO
	for alex.bennee@linaro.org; Wed, 08 Jul 2020 18:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jtIAp-0007PK-Tf
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 18:04:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57288
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jtIAo-0006yh-3u
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 18:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594245853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=o2m2buV1dKa2VfM+T5GuJKXe6mIfufBwTZlCdyuv+w0=;
 b=YbFnmBf0UfAvBpXhcA+A7w56veJWP6iBzoPcvXIpBN9urgeLUqjCPpsnFGChwcxUlNBcXw
 ykW1VaFy4YX7T3GncklB7v1hx64hqFY5Hy9zxFAvBrNHEpI7XIfE29jFYlaiY9hL6MwI3e
 5g3V/NQfza9pfNa6yKf3OcVVDBb6Yt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-tODts6DKM8KD8xNXP00_qw-1; Wed, 08 Jul 2020 12:01:58 -0400
X-MC-Unique: tODts6DKM8KD8xNXP00_qw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7A4E19057B1;
 Wed,  8 Jul 2020 16:01:56 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-241.ams2.redhat.com [10.36.113.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57AAA5C1D3;
 Wed,  8 Jul 2020 16:01:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH] virtio-iommu: Fix coverity issue in
 virtio_iommu_handle_command()
Date: Wed,  8 Jul 2020 18:01:47 +0200
Message-Id: <20200708160147.18426-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A7v47hsq1dBl

Coverity points out (CID 1430180) that the new case is missing
break or a /* fallthrough */ comment. Break is the right thing to
do as in that case, tail is not used.

Fixes 1733eebb9e ("virtio-iommu: Implement RESV_MEM probe request")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/virtio/virtio-iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index b39e836181..5d56865e56 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -534,6 +534,7 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
             ptail = (struct virtio_iommu_req_tail *)
                         (buf + s->config.probe_size);
             ptail->status = virtio_iommu_handle_probe(s, iov, iov_cnt, buf);
+            break;
         }
         default:
             tail.status = VIRTIO_IOMMU_S_UNSUPP;
-- 
2.21.3

