Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1334603ejc;
        Fri, 13 Oct 2023 01:01:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhEWkPY9ORwN62qc6ogMAVj4cXq0OsfmIL69CXkVE3FYli+xetCrxvy+t+3iy5rnDoDv4d
X-Received: by 2002:a05:620a:468b:b0:774:2a0e:1166 with SMTP id bq11-20020a05620a468b00b007742a0e1166mr33272254qkb.17.1697184064492;
        Fri, 13 Oct 2023 01:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697184064; cv=none;
        d=google.com; s=arc-20160816;
        b=gV0yAm9iVzxXa/VTNOoFaud7ZPL02wJ7w8RSaQ2XXsx1bTqgxFhdtaNoEAt8aQMQqD
         HfBEPKAKhGFCuESr/9f3t/Zz2h8cNM0M6Vw1uaRgoPZ4jHtoFMhBeXrNBIDv2vyxBIV5
         yWIIp2l4rR/9LRj5moy7kUV/F83FUkF9b0/T1ifTYg6pHT26/odXAI/uUBu7XZuhneAt
         tlAItcOCjkHgrVyc3YS4wPEOiDv0J81jQePFVQVLTdduPE0r4CMssPT1m9y5hCFW13R1
         UxuQD4PmPGHETuK25Tl8VkkDBRndY6ZpD996AHtq25AFqFIpKKccabExywYipIZf/gMI
         j41Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XyvoLQsYBwCacSjXMUeo1JDpYe89rtdX65GHrpNFkEk=;
        fh=H4knajuxnTt7umLiusApADibO8BdVd5Z82FPnjnZzW0=;
        b=mh0k8PvpACAurPidrm2W7VxdHjEakuA2lcoZEWhFjvgB8eL4mxbvI69tyhavENl1fV
         NdSqFmD6iEaREOwyaPsm7tddEknfKWP7kT/uuRIpw4qMJ6IizjUQpuXM27d6MDap3RXs
         atUlV/H8A00XY2oTe9HAXfphMuXIWtmws00sYAB5AcKMORkgqnoJoQUGfFpgns+2vrY2
         9U/JE/TCEYg2E9TNqQUoycg45TRV6beKDudnIjMWx7aKLywlkKmk8OyfaKNUJQ6e5G4X
         NGJp9C3hQsvNpuPFMb+U4p21cKzOX/aywTnwYZ9sGAC6U5SGWp64l3lVQnSxAX1JngTU
         59ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w4bv00Wc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dw17-20020a05620a601100b00773bbc97627si797978qkb.467.2023.10.13.01.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w4bv00Wc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qrCyT-0003fp-ML; Fri, 13 Oct 2023 03:52:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxX-0007LJ-5Q
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:51:47 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCxK-00058U-QE
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:51:46 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32d80ae19f8so1478869f8f.2
 for <qemu-devel@nongnu.org>; Fri, 13 Oct 2023 00:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183492; x=1697788292; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyvoLQsYBwCacSjXMUeo1JDpYe89rtdX65GHrpNFkEk=;
 b=w4bv00WcV/vKtkCuEHhNiPEkWvQtiRMezLkKwYWO3HAGT2xdnMNlkm1IaOFmSNGKXl
 MOS+eFLbt8rd6fwMzpo9vDGZmlnFVUp6pMWJRBEp7BPJxiKYthP85maEU9wOygoCcCsK
 +1Gd1FQwpDMdsnsbJy6IWws/zMwCJNASUXDaNwyZ44AGVVepIreXWcIDuBxyreob740N
 MYKRcey8iJZfayQ5ptHQ+oKxoU5PIBFiB5W871t/ngxdQeERSggNbShIxZtlDvlEpFYM
 cntKQ7Zmje+s+exgsyhr1qxwtZnMXtt4XmLwvQarnlO01GD+6ngNSJP8XwaVm1vVMIsF
 VOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183492; x=1697788292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XyvoLQsYBwCacSjXMUeo1JDpYe89rtdX65GHrpNFkEk=;
 b=s509/KGMuUWsloNgQ7kCJl7LsvZJ/+BrDbOuxBYLNXZlQk432MTBYbgB5NEmAtJ3Ek
 /ts4xQk8V+hYpQYdJn3w6X6xb8kKOr3FIq6FouSioWzX34IqxQXGhy4r5XvZah4GF7Nn
 nWi/nYKXIr+wUj6YIDyEep7otN6aiFbryVbWy8MnciBOcDlFZNwdzuasxdEydAIWvUI/
 jOr1TbTS5SWEBaeiHfW/qGmsM1SsdUKonyxH6DMTKHc4KgKJRfenn1K7gd0ugSwQOSJA
 2aG75LIvEss25dlY3UNKqxyzkktaEE0foBmgOvj5X3z3yJd2tpNG+qv8f/5pS83fbXJI
 ly3w==
X-Gm-Message-State: AOJu0YxVPey7Rqa8eUS8D4H6opZ0+1EfFnNUcUKXwN0Ho95GPHwtEGVg
 1jFloHditef4TNTQ5+VPmmv6QwJL5I2gAD/vke8=
X-Received: by 2002:a5d:4443:0:b0:323:36f1:c26b with SMTP id
 x3-20020a5d4443000000b0032336f1c26bmr21907035wrr.6.1697183492020; 
 Fri, 13 Oct 2023 00:51:32 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:51:31 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [RFC PATCH 46/75] contrib/rdmacm-mux: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:59 +0300
Message-Id: <a45dd47fa12e2e8fe817b1816dfbbecd4f4e8065.1697034504.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697034504.git.manos.pitsidianakis@linaro.org>
References: <cover.1697034504.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: gJyTbKKaJTCd

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 contrib/rdmacm-mux/main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/contrib/rdmacm-mux/main.c b/contrib/rdmacm-mux/main.c
index 771ca01e03..dda6917d58 100644
--- a/contrib/rdmacm-mux/main.c
+++ b/contrib/rdmacm-mux/main.c
@@ -303,72 +303,72 @@ static void hash_tbl_remove_fd_ifid_pair(int fd)
 static int get_fd(const char *mad, int umad_len, int *fd, __be64 *gid_ifid)
 {
     struct umad_hdr *hdr = (struct umad_hdr *)mad;
     char *data = (char *)hdr + sizeof(*hdr);
     int32_t comm_id = 0;
     uint16_t attr_id = be16toh(hdr->attr_id);
     int rc = 0;
 
     if (umad_len <= sizeof(*hdr)) {
         rc = -EINVAL;
         syslog(LOG_DEBUG, "Ignoring MAD packets with header only\n");
         goto out;
     }
 
     switch (attr_id) {
     case UMAD_CM_ATTR_REQ:
         if (unlikely(umad_len < sizeof(*hdr) + CM_REQ_DGID_POS +
             sizeof(*gid_ifid))) {
             rc = -EINVAL;
             syslog(LOG_WARNING,
                    "Invalid MAD packet size (%d) for attr_id 0x%x\n", umad_len,
                     attr_id);
             goto out;
         }
         memcpy(gid_ifid, data + CM_REQ_DGID_POS, sizeof(*gid_ifid));
         rc = hash_tbl_search_fd_by_ifid(fd, gid_ifid);
         break;
 
     case UMAD_CM_ATTR_SIDR_REQ:
         if (unlikely(umad_len < sizeof(*hdr) + CM_SIDR_REQ_DGID_POS +
             sizeof(*gid_ifid))) {
             rc = -EINVAL;
             syslog(LOG_WARNING,
                    "Invalid MAD packet size (%d) for attr_id 0x%x\n", umad_len,
                     attr_id);
             goto out;
         }
         memcpy(gid_ifid, data + CM_SIDR_REQ_DGID_POS, sizeof(*gid_ifid));
         rc = hash_tbl_search_fd_by_ifid(fd, gid_ifid);
         break;
 
     case UMAD_CM_ATTR_REP:
-        /* Fall through */
+        fallthrough;
     case UMAD_CM_ATTR_REJ:
-        /* Fall through */
+        fallthrough;
     case UMAD_CM_ATTR_DREQ:
-        /* Fall through */
+        fallthrough;
     case UMAD_CM_ATTR_DREP:
-        /* Fall through */
+        fallthrough;
     case UMAD_CM_ATTR_RTU:
         data += sizeof(comm_id);
-        /* Fall through */
+        fallthrough;
     case UMAD_CM_ATTR_SIDR_REP:
         if (unlikely(umad_len < sizeof(*hdr) + sizeof(comm_id))) {
             rc = -EINVAL;
             syslog(LOG_WARNING,
                    "Invalid MAD packet size (%d) for attr_id 0x%x\n", umad_len,
                    attr_id);
             goto out;
         }
         memcpy(&comm_id, data, sizeof(comm_id));
         if (comm_id) {
             rc = hash_tbl_search_fd_by_comm_id(comm_id, fd, gid_ifid);
         }
         break;
 
     default:
         rc = -EINVAL;
         syslog(LOG_WARNING, "Unsupported attr_id 0x%x\n", attr_id);
     }
 
     syslog(LOG_DEBUG, "mad_to_vm: %d 0x%x 0x%x\n", *fd, attr_id, comm_id);
-- 
2.39.2

