Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp471780ocb;
        Mon, 3 Oct 2022 22:01:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6zAFWNYs/Mc3mdy9aE/0/y5MT0ogK4dfquDUkT0K2By1mxMqaE53C0ZuO1inuYk6LMTUyf
X-Received: by 2002:a05:620a:1b89:b0:6ce:8b2b:7f0e with SMTP id dv9-20020a05620a1b8900b006ce8b2b7f0emr15794976qkb.15.1664859691397;
        Mon, 03 Oct 2022 22:01:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664859691; cv=none;
        d=google.com; s=arc-20160816;
        b=vX3JkA/sOavQ7XnkDhg3AJ8MPSzJ1MaToR9dVHzrIykp0wnEbATVGGVvQBATd07YH9
         YmdGIRfTIBtUIDtSdxZh06Zl7GD7LxhDhqWEbFaVkLGaw9RKYoRapFH400PJM4g4TBye
         fPGgrvO327BWQDETee7MTLFvnQWm4HRp7b9DwZUlHDWF85SGlQThcNygiUpKOgVr4uxq
         BLmdoAlMvhbQBWjb7yJh6n5kiOLejeEBmVJZM4lFBX41OYlkcN61gRF2pmCtIfxJApVe
         mET1c7PPcEdvdiGHAcMVQs+JEh2g+FubVAFjv89/mJMiLAjOa7fy6WeXiFOp2z4K69zi
         /Lzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=sOAqF0GYqVKUnESar43TThzh6CDb3TPl8u+ZymalMIk=;
        b=l1yHH+y0QFDgtFRy/Y1HPK2blkmvbyoJsnzk8dQobeNUrWiVP6XBw0PFt5dw/XBkyJ
         FQLi9DINKpaMklAssbw54HqlEn2nQXqiIUgLQ/xBkyLhldgqRlQJxJveeCfNbkHqp3Mx
         cvdRw4sYapNfJXNTA5cT7zQ6w4mQv+ACKOG/qawvbjgm8L/CrPps1T8sx2ORj4r6s1rC
         d+eTpw3Q3Q0QwPfjKBTE/rP48VV9S9hw+UJRiPZWtE8xP4aedeLVkXmiV7B3qUsGhZE5
         FMwU46cz2bs1kXIFtTgxywp6gy/+cgeR+JV2uEwjkgu32a4iFlkqtFQXUUx3gXHPMQeg
         uC2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="oH9S//lD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2-20020ac85842000000b0031f06a28743si5526348qth.205.2022.10.03.22.01.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Oct 2022 22:01:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="oH9S//lD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofa3e-0005yk-3V
	for alex.bennee@linaro.org; Tue, 04 Oct 2022 01:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1ofa37-0005yW-6l; Tue, 04 Oct 2022 01:00:57 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1ofa33-0000wn-MI; Tue, 04 Oct 2022 01:00:56 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 h8-20020a17090a054800b00205ccbae31eso17537660pjf.5; 
 Mon, 03 Oct 2022 22:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date;
 bh=sOAqF0GYqVKUnESar43TThzh6CDb3TPl8u+ZymalMIk=;
 b=oH9S//lDY9gdESTd4zwVEgVxzbUNiQm5C8JDpM62EqkjivtvRNmmFkSQjtNFgjy6gn
 Xj+bgmL1HOz7ygSL20sIAfao10HWG7y5EAIOMgcMEYLmJNEN7rlZhNhwnNBE2um/hFn6
 ElvAajZmhQ/7w6JNfeUbE8UZkPeukaz53VnNypaxNKacLD61VcFq/Z7cRyZNtsRidsNo
 Lcx9BWhsi6pst42EbBeBTaxoy6XSnYhyR7BtUf1bLdxjLB8IJQ+tNSfShhL/Dq1JDbZK
 HHIoAuYXuFEeOfGjsX6vpXYKWSa2rhM76u64LfKUuqTZ2eaLFvH5eDDOad55h41BNdFo
 KloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
 bh=sOAqF0GYqVKUnESar43TThzh6CDb3TPl8u+ZymalMIk=;
 b=IhTFkWVhAcpDrw9WkuTcPTFQa5GekLZ1iB6SCpb0it0jvBZPSp2gbf+bPFaB1o84Hg
 Syk1xvHaKUBmJct3WnWuHf+raV7CVGI8/L5U6KwZFmrYSJevinT5+39mqdj68M4baIe7
 yUGFo9Ff7CVZx/+dFX+BdgsuxUhz0T2kdhOHH5nPhTqzfQxVrXEbyH8lCOOqp4HI3P3F
 C8dutrfs+L3NZP52qXwsjNtX6JLZsXVR5bH5SjG2349Cq6Z8+fYvzdTDowr2gx/NSmDK
 7EUoLlEWzjJ6M2eOIj9sfegr+EBR5msJFj9BM18f5Ku+OE9VseAjz//0vP3MQDlvLHgy
 JN7w==
X-Gm-Message-State: ACrzQf1Nph2WzgmagtxGRobgHnxn0NXhGDeXqZ8pLsXdPvVs7RokVq/I
 tDTRVAW6vK/s8hf7c2dvxF8=
X-Received: by 2002:a17:902:ccd2:b0:178:29a3:df2c with SMTP id
 z18-20020a170902ccd200b0017829a3df2cmr25388474ple.77.1664859651346; 
 Mon, 03 Oct 2022 22:00:51 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18]) by smtp.gmail.com with ESMTPSA id
 g14-20020aa79f0e000000b00561dc6095eesm51941pfr.189.2022.10.03.22.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 22:00:50 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] docs/nuvoton: Update URL for images
Date: Tue,  4 Oct 2022 15:30:42 +1030
Message-Id: <20221004050042.22681-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xeEG3MioZufg

openpower.xyz was retired some time ago. The OpenBMC Jenkins is where
images can be found these days.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 docs/system/arm/nuvoton.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index ef2792076aa8..c38df32bde07 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -82,9 +82,9 @@ Boot options
 
 The Nuvoton machines can boot from an OpenBMC firmware image, or directly into
 a kernel using the ``-kernel`` option. OpenBMC images for ``quanta-gsj`` and
-possibly others can be downloaded from the OpenPOWER jenkins :
+possibly others can be downloaded from the OpenBMC jenkins :
 
-   https://openpower.xyz/
+   https://jenkins.openbmc.org/
 
 The firmware image should be attached as an MTD drive. Example :
 
-- 
2.35.1

