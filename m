Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp3121262eje;
        Wed, 12 Jul 2023 23:47:20 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFiBcIUksZLgzmZTW7rMMavUKgV/U13RqF8xeU8koS9JIMKzUzJ8vRxNHT4xXHwoyOBYyFs
X-Received: by 2002:a05:622a:1747:b0:403:1c7a:6c70 with SMTP id l7-20020a05622a174700b004031c7a6c70mr967106qtk.38.1689230840314;
        Wed, 12 Jul 2023 23:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689230840; cv=none;
        d=google.com; s=arc-20160816;
        b=q8cXdav6GwArksAkHpd/5EAXevjhMuv0vtLZmE5wYTVzWnGs7tz1g9wwoyR/FOCNrw
         12c/slTZL9jRWwT+yszDlAAnDvoDniMYDh+YPMAYj8i4l4oHACrSwLnKnMwK86+/TLXZ
         k8QJFjFl3RUngAdhK2uolrfUqzSJ3V/X0tgOs6bA1TayC1LZ8WqxtFSTZmrelDcn1SCJ
         711OwFlrKvBgnvjpxPvcDQjWd1oGjR68xVJnLbCfUVWKMaDUPf47EDly4NhwC4Ih4joT
         VwwIYnnmeGi674+Kiee9D5mMiOOxvVeRqmoMnBvBGdqYjI4QBfEKAgYoWwZWHJt52rMs
         ieLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=03wGqa+Y8Yj9pF1RYYCnMVZW6U1Zc1Ma5ogka4JQW8g=;
        fh=L5yROuLiWEuLZFqrfXufEoeXIxQfDTVGbLc1tXqLVVI=;
        b=WG/RiMPp6Vbp+WOndl7ul3IohG7NhQjG4RKdJQEz3anjGRN25HBUaXA0QCxGxfZpuA
         HUzXhanFlAqoLWyC4QMJJqlfrj4uqQNCITT1e4jGxDvEtqKBAYCAILQykPP3ADxj2nUa
         CnNyyT3HEaJS0qHEqc3ny+i/RLT2ZTRQHYgVLfE+1+7fZa8RMvIZSYOvUEXHkrJxLw+Q
         UEp9fwL77Mqwlj5UzEEg0pUm60L5ulmboQ455gHWKV9VuNkZ2qSCVtIzS3rZjsRbLSyI
         9iULeJ6Byu76cZTFYbCS63FyQE1zTRwG9iC8Vi7gfaACt+rTBGvzgFSktWvGFyk3pI/u
         xflw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=daqpeee4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020ac85e0d000000b00403b41bd7e1si2694293qtx.548.2023.07.12.23.47.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 23:47:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=daqpeee4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qJq66-0001VW-0K; Thu, 13 Jul 2023 02:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qJq5z-0001Ug-Ar
 for qemu-devel@nongnu.org; Thu, 13 Jul 2023 02:46:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qJq5w-00028e-NF
 for qemu-devel@nongnu.org; Thu, 13 Jul 2023 02:46:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689230788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=03wGqa+Y8Yj9pF1RYYCnMVZW6U1Zc1Ma5ogka4JQW8g=;
 b=daqpeee4kGlSYhCHi/U0emm0qPi8EkIrcTlR5R3Xd1DZOiXJh3QAImNEFM/JvR5AviGcwE
 suU5j/kpo7/ib0j0nnLZDVMr5NsMnz8r0byk2hgz6pGreyNrAmvas5LaggLrMnhyrYVQ1L
 +rUJU6OOmsOvuSEoh35JGJ83OBtEN7s=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-Ag_mWyNIMHmv2SBHSYizWw-1; Thu, 13 Jul 2023 02:46:22 -0400
X-MC-Unique: Ag_mWyNIMHmv2SBHSYizWw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19B0C1C0724F;
 Thu, 13 Jul 2023 06:46:20 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-126.bne.redhat.com [10.64.54.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75A89F6CBE;
 Thu, 13 Jul 2023 06:45:58 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, pbonzini@redhat.com, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org, shan.gavin@gmail.com
Subject: [PATCH] memory: Remove unecessary variable in
 memory_region_escape_name()
Date: Thu, 13 Jul 2023 16:45:45 +1000
Message-ID: <20230713064545.427768-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: GsEW8/dggVzG

The variable 'c' isn't needed because it can be replaced by '*p'
completely. Remove the unecessary variable 'c' to simplify the
function a bit.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 softmmu/memory.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7d9494ce70..1ae285bab8 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1151,7 +1151,6 @@ static char *memory_region_escape_name(const char *name)
 {
     const char *p;
     char *escaped, *q;
-    uint8_t c;
     size_t bytes = 0;
 
     for (p = name; *p; p++) {
@@ -1163,14 +1162,14 @@ static char *memory_region_escape_name(const char *name)
 
     escaped = g_malloc(bytes + 1);
     for (p = name, q = escaped; *p; p++) {
-        c = *p;
-        if (unlikely(memory_region_need_escape(c))) {
+        if (likely(!memory_region_need_escape(*p))) {
+            *q++ = *p;
+        } else {
             *q++ = '\\';
             *q++ = 'x';
-            *q++ = "0123456789abcdef"[c >> 4];
-            c = "0123456789abcdef"[c & 15];
+            *q++ = "0123456789abcdef"[*p >> 4];
+            *q++ = "0123456789abcdef"[*p & 15];
         }
-        *q++ = c;
     }
     *q = 0;
     return escaped;
-- 
2.41.0

