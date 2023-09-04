Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1445342ejb;
        Mon, 4 Sep 2023 09:15:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl+BKurCsTtFRRbEntBL01xNB3pknkdqvOB7OfDeJF9APWY0+qg0VTiJXQLSv7aCilCdNg
X-Received: by 2002:a05:6870:f71d:b0:1ba:caf2:acc3 with SMTP id ej29-20020a056870f71d00b001bacaf2acc3mr13590859oab.5.1693844156404;
        Mon, 04 Sep 2023 09:15:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844156; cv=none;
        d=google.com; s=arc-20160816;
        b=F52rwU05aKa3ES8hpaucrNMOeZ1eyDKLMFG8ns/XHfWa8No5PoLGQmXvSN4CyLndsP
         zkkj6oyEt9pU9X0I44zx13u8uVJ9LJg5yZ6o//IDvnOIWDxQLjB3ipzY7gcxonifC3St
         6PJG0myCtaiirtV13ZC1EPciVQhHALJUR3h/kQTQXquk20Gv8oMc8kpNan0LMdzU++RY
         YJX6+m17SLc4fXtoTgdH/tAipsjFsw2NmiEpQVCbgloPoUE+frszpLmbNoCcHF/Mw3p8
         7iy6FcUpylTZRM+YHJF1FTDNFZk+w7FICcEoIZetJsM1ppE6hLzFMw7AL8vEOpN1Mvyn
         DUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7aoDCyS5ybRvtm1vEyqjvOG3g4YR7gaGHrXcT9ATxAY=;
        fh=MElCG/6yDCeRpcqa34t2QL7+fMSFmfIbrQnnAk4IUjU=;
        b=NI26vn2usfexRAG9MGklfIu83ulE1Sxee1ovopi1nfC2AFI/y/h4XEoXR7jQjjNxBr
         hGQB2TCyd2M5yhvzZhIMMYL6xBNNN1/Ap3AyBctpbjLNSFA3ew4iBeVXXSHsnoJxKtQw
         xZJzztk3/yS4gN7XvgB2PFPfpkUUEMJlhG/kxaU9Uo5hOyOJxrUMJz4eVoHQ2Q3107hv
         mxCJTecCQKDvka1sfD8WE9sOD+SgJfD+INlAeTNEOrmbW4mB35FBzcs+hALa6m772IPO
         6+tm7YfTak7TaX2c1mk2jAEl1hzWZ0fXMhGyEXZU5x8YWtNm48oi0Vdat0sNDLsbXfPS
         5ptQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d8wl0Cry;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020a0cf401000000b0064c6b7d96e1si6410749qvl.372.2023.09.04.09.15.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:15:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d8wl0Cry;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qdCEF-0006my-V1; Mon, 04 Sep 2023 12:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCDt-0006RJ-Po
 for qemu-devel@nongnu.org; Mon, 04 Sep 2023 12:14:46 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCDr-0007pH-6R
 for qemu-devel@nongnu.org; Mon, 04 Sep 2023 12:14:45 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bceb02fd2bso23381221fa.1
 for <qemu-devel@nongnu.org>; Mon, 04 Sep 2023 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693844081; x=1694448881; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7aoDCyS5ybRvtm1vEyqjvOG3g4YR7gaGHrXcT9ATxAY=;
 b=d8wl0CryFwrT5WsfMuzWbQsPqi5uhGXHshmapQnQEjQDef82AZ0hs5rHTx7qAD1EbZ
 U+9ezAEDfL+H8KfPRQC1SH7d3H86+EoMEGM38ShZzijJM9iRIBtbmZt8GB/lhHoxzUxB
 uL0NcTvO7T8WtvlifHIzzXYfItTCF+A1cHoe0kd/0qa0AgoZUuOLj/+7adcjk/Mg4tV0
 pEKKRVXQO3RSo+u1IEC+G4Td3d2mlYVXHqKWQ4q3KTEyGnaRZ3mkpo/t4n0BSfOj6B5r
 SKhWB2QE/ICc4FpuNezPz2JFrso6v2/q5gmifeY8D912Umh1HXbNF62btx+pNc7RYcop
 xYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693844081; x=1694448881;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7aoDCyS5ybRvtm1vEyqjvOG3g4YR7gaGHrXcT9ATxAY=;
 b=iBEa+VWXZgLuuRSBSJ1lldERJbj8Zhb++HNL7Z72dTHzgkNEdKjpyCjTDqUI2B3HUL
 9x1nb+yIoP0+c9jSVZgaU10xJ7HwqP0bZtxfyxmNs8Jm9ENjxc4P6GPgY6Rx1kOSvOkB
 UNdtw3BjtvPeJ75q7d92IvJKAUUN7SWQ4Kmg/HS4hg9uH5aCd2LYQiy9tuW3CBhsDPV2
 VOFZiqVrRgIep1emN8f4ApkqAMEYhTxgHSQU+vnLZTvlPqAmT+j61XIebToq+GKr8qfn
 EQZtjYhSgE8payZRfbszNWdhezHh+vrzUj6ICE904cag8p72SCIejkFXIhfN+4B0OD9L
 Uj8g==
X-Gm-Message-State: AOJu0YxdgsDVTg0dW01MVB7oe83uuYTUXvqodnvucRXN3dDG7HSgCOwS
 smeq/jq0nweNZS4qJVFmW+IallPMDfHCSuSPy9w=
X-Received: by 2002:a2e:888f:0:b0:2b6:de52:357 with SMTP id
 k15-20020a2e888f000000b002b6de520357mr7656493lji.40.1693844081518; 
 Mon, 04 Sep 2023 09:14:41 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a170906299800b0099cadcf13cesm6377093eje.66.2023.09.04.09.14.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Sep 2023 09:14:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH v2 22/22] softmmu/physmem: Clean up local variable
 shadowing
Date: Mon,  4 Sep 2023 18:12:34 +0200
Message-ID: <20230904161235.84651-23-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904161235.84651-1-philmd@linaro.org>
References: <20230904161235.84651-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +Iuho3tme3mz

Fix:

  softmmu/physmem.c: In function ‘cpu_physical_memory_snapshot_and_clear_dirty’:
  softmmu/physmem.c:916:27: warning: declaration of ‘offset’ shadows a parameter [-Wshadow=compatible-local]
    916 |             unsigned long offset = page % DIRTY_MEMORY_BLOCK_SIZE;
        |                           ^~~~~~
  softmmu/physmem.c:892:31: note: shadowed declaration is here
    892 |     (MemoryRegion *mr, hwaddr offset, hwaddr length, unsigned client)
        |                        ~~~~~~~^~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: Please double-check how 'offset' is used few lines later.
---
 softmmu/physmem.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 18277ddd67..db5b628a60 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -913,16 +913,16 @@ DirtyBitmapSnapshot *cpu_physical_memory_snapshot_and_clear_dirty
 
         while (page < end) {
             unsigned long idx = page / DIRTY_MEMORY_BLOCK_SIZE;
-            unsigned long offset = page % DIRTY_MEMORY_BLOCK_SIZE;
+            unsigned long ofs = page % DIRTY_MEMORY_BLOCK_SIZE;
             unsigned long num = MIN(end - page,
-                                    DIRTY_MEMORY_BLOCK_SIZE - offset);
+                                    DIRTY_MEMORY_BLOCK_SIZE - ofs);
 
-            assert(QEMU_IS_ALIGNED(offset, (1 << BITS_PER_LEVEL)));
+            assert(QEMU_IS_ALIGNED(ofs, (1 << BITS_PER_LEVEL)));
             assert(QEMU_IS_ALIGNED(num,    (1 << BITS_PER_LEVEL)));
-            offset >>= BITS_PER_LEVEL;
+            ofs >>= BITS_PER_LEVEL;
 
             bitmap_copy_and_clear_atomic(snap->dirty + dest,
-                                         blocks->blocks[idx] + offset,
+                                         blocks->blocks[idx] + ofs,
                                          num);
             page += num;
             dest += num >> BITS_PER_LEVEL;
-- 
2.41.0

