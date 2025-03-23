Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp1519265njc;
        Sun, 23 Mar 2025 10:48:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4LlsMAVz6Xp2ctuEpWKz+0xGF5D3WaYF1j5cPBSEMJo3Bq61qMqM49C+8CPvydlNdpoW7pp/ITnVf/A==@linaro.org
X-Google-Smtp-Source: AGHT+IFi5dO1MMK4NCIxfRmRcIHTZxjzBbibbL7dGYx+WJRNM7T++IgCI170uoCW/rpDd8lakfl/
X-Received: by 2002:ac8:7f0c:0:b0:477:1f58:e18b with SMTP id d75a77b69052e-4771f58e244mr140705621cf.29.1742752137426;
        Sun, 23 Mar 2025 10:48:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742752137; cv=none;
        d=google.com; s=arc-20240605;
        b=EaL2f5NpE8HV65dv8iWpQjoJmGMi6wrrFR1pwTDtjqtGp3bz008aZ5PxNPzse8sI3f
         vSkw6urM+DIes8E9Y9pWxAipwQJSrx5wPAaWL9t9NhzKhV1dAN1x921t8aV9kYOGroDw
         MusKeJpcB8rSUviF6HCGTjwbnzv1UCTjmurZTKmqqnyBesCyoTYyV5+u0FfCinODcXC+
         GTHyDQQKKMpqbpCjHhU1vTamn4y0e6m8t68p0rkHHcdp2TUJzvDX/WodGupdz6Hj/hHl
         KRNzX5/JE1XfzacDsZ+Zr6aMbGORAtH0DWc5U477Wn8jCBWi5XLThggg5Zz+jOXxf1/C
         chXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MvcPmepQnYaqXyzcNgX6ZnHaPADmQDVdyjY/kGblWr4=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=Yeq2ShheYlN2GVcxSgEg2PAQcLknaFm4RPv6U+F1FwAHTxnS0/++c4b4IUarq2C4FW
         gyWm5Sxnk67/PwFkHeKKzqzYD0VrHJJ/WzIW0x9ZwSgh4/5AOJTTbWBzYPsGhUsxLYzd
         nOvGUTNUCz/8FrGdk0tnvPzHCUk2L1ptRgOMLRf7yV/ZnZwU6N6lrcD/NgyjesnpdwTA
         tIATdLsS8pT1PWuZyttgh/Ia7rTwUjQjWRVyUn9kIagrm8zoF5ZgcPv6cil/8NFCL3Ys
         BNj81uBDqgLh1rPZoR3/PNIdg2NeAMjCM5AG+JEHqeW1/rPFnrNSWJ+1uBYurgUxhE1g
         sNJA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gH3aj0T5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d180080si58666511cf.178.2025.03.23.10.48.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Mar 2025 10:48:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gH3aj0T5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1twPPc-0003tn-EQ; Sun, 23 Mar 2025 13:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1twPOj-0002dx-Ee
 for qemu-arm@nongnu.org; Sun, 23 Mar 2025 13:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1twPOg-00041U-7i
 for qemu-arm@nongnu.org; Sun, 23 Mar 2025 13:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742751965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MvcPmepQnYaqXyzcNgX6ZnHaPADmQDVdyjY/kGblWr4=;
 b=gH3aj0T5Yk3kL99x46s3HCxNT+n90ntCEyoZLrPMMnqHoQ6X08pJblMnODbAbOgxtZ3Yjq
 ae0Vj52b/WqFlewlKsPP6BJW8a84agbIOUivNbyclfQ+RHeqs/2z5A1q2zsAPPAeX5HE7v
 TlTHGKmx7tXx1WtmUqiTI6u+03FCNQI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-446-t5hOVJvmOfuI_my2LcqDCg-1; Sun,
 23 Mar 2025 13:46:02 -0400
X-MC-Unique: t5hOVJvmOfuI_my2LcqDCg-1
X-Mimecast-MFC-AGG-ID: t5hOVJvmOfuI_my2LcqDCg_1742751961
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2A47C180899B; Sun, 23 Mar 2025 17:46:00 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.3])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 88BC61956095; Sun, 23 Mar 2025 17:45:58 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 3/3] hw/misc/aspeed_hace: Fix buffer overflow in has_padding
 function
Date: Sun, 23 Mar 2025 18:45:41 +0100
Message-ID: <20250323174541.406860-4-clg@redhat.com>
In-Reply-To: <20250323174541.406860-1-clg@redhat.com>
References: <20250323174541.406860-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: RdK7mOxuOwyh

From: Jamin Lin <jamin_lin@aspeedtech.com>

The maximum padding size is either 64 or 128 bytes and should always be smaller
than "req_len". If "padding_size" exceeds "req_len", then
"req_len - padding_size" underflows due to "uint32_t" data type, leading to a
large incorrect value (e.g., `0xFFXXXXXX`). This causes an out-of-bounds memory
access, potentially leading to a buffer overflow.

Added a check to ensure "padding_size" does not exceed "req_len" before
computing "pad_offset". This prevents "req_len - padding_size" from underflowing
and avoids accessing invalid memory.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Fixes: 5cd7d8564a8b563da724b9e6264c967f0a091afa ("aspeed/hace: Support AST2600 HACE ")
Link: https://lore.kernel.org/qemu-devel/20250321092623.2097234-3-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_hace.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 32a5dbded3c6..d75da3335336 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -128,6 +128,11 @@ static bool has_padding(AspeedHACEState *s, struct iovec *iov,
     if (*total_msg_len <= s->total_req_len) {
         uint32_t padding_size = s->total_req_len - *total_msg_len;
         uint8_t *padding = iov->iov_base;
+
+        if (padding_size > req_len) {
+            return false;
+        }
+
         *pad_offset = req_len - padding_size;
         if (padding[*pad_offset] == 0x80) {
             return true;
-- 
2.49.0

