Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E011F47CA5
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 18:03:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyCyw-0003Wg-0x; Thu, 05 Mar 2026 12:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vyCy7-0000IP-FJ
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:58:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1vyCy4-0003n8-KZ
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 12:58:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772733516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oVqWreGFCxOxEVN1cMXNwqHjmBSo3Eq8G8YAa3svd0c=;
 b=BGVRFulqVk21T3j72dkbFdKj+FfxhmoQs0NzUDJC2hRZyh/EwhC8j7ZUWnFgSS8b5zOiWt
 QeWsHsG8yTbkCQlmbV49PuPi24lJoDwOl3vy2oxI9TdjrTjN7i1ZleQ4In5jcBnfaJSWW8
 sSfzJ/0FcxJo9jWmKnOtEfPgPDNBLaE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-138--RGcB68tMT2YvMvKYIbGqg-1; Thu,
 05 Mar 2026 12:58:32 -0500
X-MC-Unique: -RGcB68tMT2YvMvKYIbGqg-1
X-Mimecast-MFC-AGG-ID: -RGcB68tMT2YvMvKYIbGqg_1772733511
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 242B418002C7; Thu,  5 Mar 2026 17:58:31 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.26])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 619823003E9E; Thu,  5 Mar 2026 17:58:29 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Jithu Joseph <jithu.joseph@oss.qualcomm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 28/38] hw/i3c/mock-i3c-target: Simplify GETMRL byte extraction
 logic
Date: Thu,  5 Mar 2026 18:57:01 +0100
Message-ID: <20260305175711.1119025-29-clg@redhat.com>
In-Reply-To: <20260305175711.1119025-1-clg@redhat.com>
References: <20260305175711.1119025-1-clg@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: id8CjqVLUN2mH36Eo6GRhr0zol2cJLm9TAeAPLKgZVQ_1772733511
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.892, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.622,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Jamin Lin <jamin_lin@aspeedtech.com>

The GETMRL handling logic extracted MSB/LSB bytes from
s->cfg.buf_size using a mask-and-shift expression:

  (buf_size & (0xff00 >> (offset * 8))) >>
  (8 - (offset * 8))

While functionally correct, the expression is difficult to read
and obscures the intent, which is simply to return a 16-bit value
in MSB-first order.

Replace the mask/shift formula with explicit MSB/LSB extraction:

  offset == 0 -> buf_size >> 8
  offset == 1 -> buf_size & 0xff

This makes the code clearer and easier to review without altering
behavior or data ordering.

No functional change.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Jithu Joseph <jithu.joseph@oss.qualcomm.com>
Link: https://lore.kernel.org/qemu-devel/20260303013322.1297499-5-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/i3c/mock-i3c-target.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/i3c/mock-i3c-target.c b/hw/i3c/mock-i3c-target.c
index b99709a08b52..1ae2cf9e1de1 100644
--- a/hw/i3c/mock-i3c-target.c
+++ b/hw/i3c/mock-i3c-target.c
@@ -146,9 +146,12 @@ static int mock_i3c_target_handle_ccc_read(I3CTarget *i3c, uint8_t *data,
             if (s->ccc_byte_offset >= 2) {
                 break;
             }
-            data[s->ccc_byte_offset] = (s->cfg.buf_size &
-                                        (0xff00 >> (s->ccc_byte_offset * 8))) >>
-                                        (8 - (s->ccc_byte_offset * 8));
+            if (s->ccc_byte_offset == 0) {
+                data[s->ccc_byte_offset] = (uint8_t)(s->cfg.buf_size >> 8);
+            } else {
+                data[s->ccc_byte_offset] = (uint8_t)s->cfg.buf_size;
+            }
+
             s->ccc_byte_offset++;
             *num_read = num_to_read;
         }
-- 
2.53.0


