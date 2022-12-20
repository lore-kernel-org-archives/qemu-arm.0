Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4706497ejb;
        Tue, 20 Dec 2022 14:52:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4UFs2t5DGfVjNqCP1f6rZzUW7DTxXrPWVGfaF4Owj8eEHjzX1e/hcQ+apvfyiWnlI8NtWp
X-Received: by 2002:a05:622a:1e93:b0:3a8:1f82:5b6e with SMTP id bz19-20020a05622a1e9300b003a81f825b6emr48250982qtb.5.1671576747894;
        Tue, 20 Dec 2022 14:52:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671576747; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1u4fHRLJgAYyAeOrBjm7BVmjVHqtjRUmwk8e2Z2DvqxkIx0aVWS0BrEpOy1UsuzlZ
         Brd5qxbWvIb/N5LPH9JOddFMtlJEL4HgoHPx8AzxBb7RXsDb/8bcDFW1urKc0B/UCehR
         jqClgaLSh2arMYff738wVuEXT7Tdkev28Sx+/4BHrr4CrGNWVbm96wR7m1z3J58qKH6S
         eqceZHLQOJOixKKqhJyjkNaxKM6andfWR2ahqYOHZieKFSN8Y7C1OJfqQ5aoxv6/+rga
         +qaeU6hikv1ABSciuPFhX/jCgHNU3FqQaDymerxVVDD6FHYK7KgfjchDh+1QRlUtMqEj
         fx9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=PGujqd1inTe25q9tw7SSNQK8UpTxpqpb11C+uNSu9rY=;
        b=bX8gfL3hEH//7FuWj1s7wssDR12Vka2qN+gH54pqI58RbcACe1JHeoJ72viIGXfIx3
         jll6bCOTtEyTrVe7E+11SF6REV9bcssckoYjU2U19/XpKaiW1CBqf7sMbS1FHYgXxKT6
         9dv+WsE08zeRhxh/uE4Uf+lGls/kCzWtMTa7Av1u/9WhQxVwNpUzxFc6mTyVsGm4cQr2
         DEX06Pl7cUvvUHGQHselopdMqBo9q3ntt7RVHaMl4bhi5tt+wLStChBUTgxSpCbS42C4
         HfAFoM3KGf+pZIBaOw6nQz1k4yBTa0ycC05CyARXU3jT/if5TLXCl5+i/5efqDxkuSnV
         f9vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=XpzPaPOj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16-20020ac84090000000b003a6861d838dsi5971504qtl.551.2022.12.20.14.52.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 14:52:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=XpzPaPOj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7lT2-0004yf-5p; Tue, 20 Dec 2022 17:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <37DOiYwoKCAEtmpohgjfmehpphmf.dpnrfnv-bsnopohov.psh@flex--slongfield.bounces.google.com>)
 id 1p7ktE-0005VB-1u
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 17:15:12 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <37DOiYwoKCAEtmpohgjfmehpphmf.dpnrfnv-bsnopohov.psh@flex--slongfield.bounces.google.com>)
 id 1p7ktC-0007yK-E2
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 17:15:11 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 f11-20020a5b01cb000000b0070374b66537so15685381ybp.14
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 14:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PGujqd1inTe25q9tw7SSNQK8UpTxpqpb11C+uNSu9rY=;
 b=XpzPaPOjB6bs0JqtXO1nPxm5cQjy+RBAGRC3sN8dy8yz9Ouwl2+LfWl8naTD0a2Q5X
 jsklX8vFpIzQRwMOQA9nmH9U4bLNfsWYIBnXX2j4WZh92LfxwnThIaeF88PmwaRghTwq
 J/Y6qw7dy5nKGEeJ8PZC3cJHrXFE+FEkvHXA3F2tWvWhlzTNCAqIwsyA1ETXvvshYEz1
 n9Hgunz1iPZQ/HP0sBdZsRGAB+l94ifSGbvbk2HNLQVNRIPzUQLQxqc8wkln5cGlHHpF
 OqjlkXiErkev4nF2G5zHyNzR54coY3lzR77Moc27xTm3WYX/tJ2N0DwNvnmLuPust8iv
 U1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PGujqd1inTe25q9tw7SSNQK8UpTxpqpb11C+uNSu9rY=;
 b=hBjLKM0CTelY9+ufO1hNKSXrHTyuqFJuTleku7/T28Qpbj+6J6HAuBKF5fG2/yGguo
 uNzv0zm+B7WVpuclN691kZSdqeH1WftckF8Y0U+DRBKnr3DwYehrHBL2VR+3IxzJ9nnb
 5+lk+J8XipyDsVtvxOof4zQ0oA55HNEU8UEY1Elz8wOHxehXIUKP3+GCfsI1dtVz2a5u
 Ja8HufVphg4LV4wX5N9ZnL2+X7tQY24DDZeWZzDrd97Nv/9RCJPmkdGhYvJnJ4lqD7K1
 V8f35YBsHn7HVhB3NY4E5SNAd8HV/8aS3X351tna4PZx3EGcuVtoVBjNe8b0LghI74ij
 FoJQ==
X-Gm-Message-State: AFqh2kpZ4pE0oOMnHedrCA4t63RaTggOI4ZkiwOaghzEzvunlLecd2C8
 c12UW5qVKYJ9uTZtri0kfIGn8QLdI/5MrrG8
X-Received: from vonneumann.svl.corp.google.com
 ([2620:15c:2a3:201:dee4:74b1:354e:6bfc])
 (user=slongfield job=sendgmr) by 2002:a0d:d243:0:b0:3df:1fd0:9dcf with SMTP
 id u64-20020a0dd243000000b003df1fd09dcfmr1286164ywd.447.1671574508665; Tue,
 20 Dec 2022 14:15:08 -0800 (PST)
Date: Tue, 20 Dec 2022 14:14:37 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20221220221437.3303721-1-slongfield@google.com>
Subject: [PATCH] hw/net: Fix read of uninitialized memory in ftgmac100
From: Stephen Longfield <slongfield@google.com>
To: clg@kaod.org, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, andrew@aj.id.au, 
 joel@jms.id.au, venture@google.com, wuhaotsh@google.com, 
 Stephen Longfield <slongfield@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=37DOiYwoKCAEtmpohgjfmehpphmf.dpnrfnv-bsnopohov.psh@flex--slongfield.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 20 Dec 2022 17:52:10 -0500
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
X-TUID: wo34DO/S7KP5

With the `size += 4` before the call to `crc32`, the CRC calculation
would overrun the buffer. Size is used in the while loop starting on
line 1009 to determine how much data to write back, with the last
four bytes coming from `crc_ptr`, so do need to increase it, but should
do this after the computation.

I'm unsure why this use of uninitialized memory in the CRC doesn't
result in CRC errors, but it seems clear to me that it should not be
included in the calculation.

Signed-off-by: Stephen Longfield <slongfield@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/net/ftgmac100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 83ef0a783e..d3bf14be53 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -980,9 +980,9 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
         return size;
     }

-    /* 4 bytes for the CRC.  */
-    size += 4;
     crc = cpu_to_be32(crc32(~0, buf, size));
+    /* Increase size by 4, loop below reads the last 4 bytes from crc_ptr. */
+    size += 4;
     crc_ptr = (uint8_t *) &crc;

     /* Huge frames are truncated.  */
--
2.39.0.314.g84b9a713c41-goog

