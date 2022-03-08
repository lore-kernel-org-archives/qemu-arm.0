Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2411454lfo;
        Tue, 8 Mar 2022 07:07:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYBYA+laSW/iLcA0qz2NLtQ7UTGGZLHJShAQVZiLrW0FTh2E8lmGGyct2w/aHvEpI9ISdH
X-Received: by 2002:a05:6102:3ed0:b0:319:dfd2:89d5 with SMTP id n16-20020a0561023ed000b00319dfd289d5mr7088974vsv.45.1646752024041;
        Tue, 08 Mar 2022 07:07:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646752024; cv=none;
        d=google.com; s=arc-20160816;
        b=X0sxZoFyLm3RwvZcBXz7sJ9LOmBbZeGuD0kmjEZPrNwXrlZUNuE3Be1BVGVDftUzAe
         P4iC/5H124z07obsMvVcrLi5te8nQ1y5guWZ434a02m+jfKBO5psG85saThZUPxp6cpA
         QYPOJ61wzn8ZYqhLxxpKi7kEeh0k/m9ZqqaRaqlIySPjS8r46wRFUTlhuEwnnaA3qpL2
         X+SI96NhKpj3W64b4Lw7HCDY4y3R/BMLuh5usNdXs2CibrV9Ivf0zSK5vNUhAuISO5Al
         kQL6z42I620qXG2T1UTfgVgx1Y9/P7wzsJKWIayQSrRTX/1vWk2jOmqjPnX0xq4v1oR7
         E+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=3gwbfm8uT0ChSE9qRqJxKGiz36cYc4nzsOiJnyJ7Qeo=;
        b=aaU5gGXuvLHJTJH21kX+Gmy+O1Cg8/NMp0f+Ktb5NGbiajwLCbBuIbsrr/ywZSye0O
         a/sJVqV9VvpwINlZ6jutwyhC8tJ286M4WMidO81D/FNETEb/98gdCXhjPaVtpe1IeXs3
         bN/ZN2XovIsaue7mEUsqpw/AeQH70n8/qIFCZMDqGd0zHq7IqZImlDeu5oXe3LTIqgQ1
         Vh/Ya8aSK0Dstv5C2uc5UTpucGbPDF+4Mf3ZXpJVTb7KdfPmCSQtI8bk6gGjeL0GgAdB
         pzsTxruL/pLl0RVQxoCUn7L02bBQl+bxjXJJsnjP8G8njuCHdt+cSSRZ9XdUEsmSjrp2
         JQqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nXPH901C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n23-20020a67e057000000b00320cfd8ab92si438488vsl.348.2022.03.08.07.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 07:07:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nXPH901C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRbQV-0005cq-CA
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 10:07:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRbLq-0005lI-Be
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:02:14 -0500
Received: from [2a00:1450:4864:20::433] (port=36649
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRbLo-0001HQ-C7
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:02:13 -0500
Received: by mail-wr1-x433.google.com with SMTP id r10so29030837wrp.3
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 07:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3gwbfm8uT0ChSE9qRqJxKGiz36cYc4nzsOiJnyJ7Qeo=;
 b=nXPH901Cv9DsSIKzb88n0/8eo2yj9dsyoRbbzDP8fiDhpiLVsPVKFy2HncY5Vpu/VI
 DqNB1sHhR8GjlLJDZwOl3pC7KHWZfyzTyzSY/+3tXTx9MsWpr2FHxQ/Ca1lZJtD70IWE
 Ry5lydNr3xHb3LOYk4NJ97NNiktpNlOPDJmvR3N9OJt68Z6vxYbv0z3kP1UroJvq0TE0
 B+r5j6xyC6I6xMVD6rHto0QiTCms2JZf1NALy8F6Z+boN2WaIkvg2dw2YdbIWcSk8kTC
 5AJB1fsI4PWuoxL0lqzywWY+xKUtzTK/ihjWtGihOEJYY7vFxkOJQiVIHx04//0JrIxc
 f+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3gwbfm8uT0ChSE9qRqJxKGiz36cYc4nzsOiJnyJ7Qeo=;
 b=cLAknP6BzL6G6ZCl/g+Fu1LJ82Py+Nmo35Y6w3oXoqgBhOWFXYThgyI0CkLdbbIW03
 p/WRvBo1fFRP9915CeTy8myV93/AbwSH32hIVKBRyfjERHJgt5CPqVV+7UufV4hIGOm/
 D5dQJqGqa9zK5IwZziItvDEqBJBnYP58tvbjRhXRC2bOytrOOPqCcOYSUEEb4QOFDGdJ
 mxZ5uh4O5EWuWVQWUuIAgHu1Og1b5GaxEiF/s8gGhGSRn396e5wf+vaDKa/9dvQo88tu
 fKsjCVGz4k6gQ9SftPka34rsYffEjoLzhwJXuJ5a6ijZZQxGwyI+V4tUjS8E7tFRLIQh
 ZU4g==
X-Gm-Message-State: AOAM531ipyMCbqND7/7Z3pqq6GZ3HrNYksd223mRzNPYnD+SZ7RTBako
 Cy9WcALTjkLOMziaD9iiOrOjCw==
X-Received: by 2002:a05:6000:1868:b0:203:732e:6a96 with SMTP id
 d8-20020a056000186800b00203732e6a96mr1136566wri.39.1646751730373; 
 Tue, 08 Mar 2022 07:02:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a5d6652000000b001e669ebd528sm14366777wrw.91.2022.03.08.07.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 07:02:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/dma/xlnx_csu_dma: Set TYPE_XLNX_CSU_DMA class_size
Date: Tue,  8 Mar 2022 15:02:07 +0000
Message-Id: <20220308150207.2546272-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KmRD+QUtOgu7

In commit 00f05c02f9e7342f we gave the TYPE_XLNX_CSU_DMA object its
own class struct, but forgot to update the TypeInfo::class_size
accordingly.  This meant that not enough memory was allocated for the
class struct, and the initialization of xcdc->read in the class init
function wrote off the end of the memory. Add the missing line.

Found by running 'check-qtest-aarch64' with a clang
address-sanitizer build, which complains:

==2542634==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x61000000ab00 at pc 0x559a20aebc29 bp 0x7fff97df74d0 sp 0x7fff97df74c8
WRITE of size 8 at 0x61000000ab00 thread T0
    #0 0x559a20aebc28 in xlnx_csu_dma_class_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../hw/dma/xlnx_csu_dma.c:722:16
    #1 0x559a21bf297c in type_initialize /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:365:9
    #2 0x559a21bf3442 in object_class_foreach_tramp /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1070:5
    #3 0x7f09bcb641b7 in g_hash_table_foreach (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x401b7)
    #4 0x559a21bf3c27 in object_class_foreach /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1092:5
    #5 0x559a21bf3c27 in object_class_get_list /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1149:5
    #6 0x559a2081a2fd in select_machine /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:1661:24
    #7 0x559a2081a2fd in qemu_create_machine /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:2146:35
    #8 0x559a2081a2fd in qemu_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:3706:5
    #9 0x559a20720ed5 in main /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/main.c:49:5
    #10 0x7f09baec00b2 in __libc_start_main /build/glibc-sMfBJT/glibc-2.31/csu/../csu/libc-start.c:308:16
    #11 0x559a2067673d in _start (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/qemu-system-aarch64+0xf4b73d)

0x61000000ab00 is located 0 bytes to the right of 192-byte region [0x61000000aa40,0x61000000ab00)
allocated by thread T0 here:
    #0 0x559a206eeff2 in calloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/qemu-system-aarch64+0xfc3ff2)
    #1 0x7f09bcb7bef0 in g_malloc0 (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x57ef0)
    #2 0x559a21bf3442 in object_class_foreach_tramp /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1070:5

Fixes: 00f05c02f9e7342f ("hw/dma/xlnx_csu_dma: Support starting a read transfer through a class method")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/xlnx_csu_dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 84f782fcdc0..60ada3286b4 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -744,6 +744,7 @@ static const TypeInfo xlnx_csu_dma_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(XlnxCSUDMA),
     .class_init    = xlnx_csu_dma_class_init,
+    .class_size    = sizeof(XlnxCSUDMAClass),
     .instance_init = xlnx_csu_dma_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_STREAM_SINK },
-- 
2.25.1

