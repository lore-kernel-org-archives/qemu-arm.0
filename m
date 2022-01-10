Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp999125lfj;
        Mon, 10 Jan 2022 08:49:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8Q8JjUtYZqMt/ASklmGNFAOmJoLaB2KMZ+P80IlVQhUGWWFIS3Slr76au+fT8i0Itb+UA
X-Received: by 2002:a05:6e02:1c2e:: with SMTP id m14mr276550ilh.189.1641833353416;
        Mon, 10 Jan 2022 08:49:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641833353; cv=none;
        d=google.com; s=arc-20160816;
        b=J+mc01D2RA6D6NI384wM/xn+mrWvlnsCDJBj/9PRqlTAOBjRvKCnhQQkSDpK3whp5q
         wH7QK/Mb3qy0Rz9PN6wkPilqV1YT+NpuCBNY/Z1qFwfih96y2F5sy2+dz3Fz6RwwvoXV
         0Qjtj6bgGsns09Cjw6NedBYiZvTRLAf7m6vcfY4mzlpSzPVcluIX3HyiQek4ss7pc/k3
         gjXbYFpMT/wTTVKQH/B8LdUthR99HXjtCESpB96EM87nkZLVMYUwjO+A85+n8d7s8VZj
         oJiLNhO5fbdnuHe1d8jhymqizHLv1rgAf+xqpMRf/e/Z7ugD3vjR806nwodGG2qKB7oK
         gGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wbKyY8i+6gdRwoVsibzZVwedV/1eMkFUsRGPR9OdgNw=;
        b=UjtJl9TnayPtK02KadZs78Y4BZiJO/j/g8LArIcoXSRi3Jfd0ErwZXJfoz36KmvO9p
         QsaMrrDYTbcqzN+/1IXnove1Shnx7Lj1dd62t8lMVskDVa819SBi2fgku9b0088dSQms
         E14mYwIZWNMSGXnNWcf5sWMv6wGTw+Ty/kQeufMWbJYSQqaDTKFadiZO2XYX3ogkUlms
         MzySX4iLTAqJyfgJn9JJIrPmrjeuODfqiFiKADsdWEcTiLfYSRGYoPuKC5Vuzyecl5Rr
         /7j5PnveB4fuE+migHTWVhIQ5MhFSuPQUBTXuALW7zu7y3mUMho/QTarQwkdAS0p37T/
         Y4Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=iJnB4ZDK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si2938832ilv.28.2022.01.10.08.49.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Jan 2022 08:49:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=iJnB4ZDK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n6xr6-0004Th-Oq
	for alex.bennee@linaro.org; Mon, 10 Jan 2022 11:49:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n6xqF-0003rP-RQ; Mon, 10 Jan 2022 11:48:20 -0500
Received: from [2a00:1450:4864:20::42b] (port=38650
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n6xqE-0004Zn-E6; Mon, 10 Jan 2022 11:48:19 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a5so23987572wrh.5;
 Mon, 10 Jan 2022 08:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wbKyY8i+6gdRwoVsibzZVwedV/1eMkFUsRGPR9OdgNw=;
 b=iJnB4ZDK/fN3YkYmZX9lWGiZBFeFojH+L6MxKr0RLzyQbi1XO2I1oqmvYp20oS+yJl
 xwh0kRRguOcpe0aQBgmtHMv+Gh7cb4arEawcte8aHGfQ2cdgsiYlaTWKIUIb2QNE547a
 i68grUSB8OqhAsmh/k6cb7zXRm4YsGGnIpwEdlj2NP94DzVEx+IARru/EdlLzsNql6T3
 JxJrJXz9IYvEuksPYq5PDlLB/FTO73pWDLfg82hwXEEMun7M/9OUD+Z+jd1+mHsL0mmL
 kHMnXZEmaJraAS0k6aQfqooRHLF+nu2RwSYDqqT11jQR3JtHDlJB6jaAvLgXlgu2cTEL
 QerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wbKyY8i+6gdRwoVsibzZVwedV/1eMkFUsRGPR9OdgNw=;
 b=3FmxC0XSjkt/+rB0LRdPfc97rBY+UcZazwOgGlm+cjLwkS/9NR6glqouppFH04YIAf
 y09t8UsmFbcuUi8plbCg/Slr4KEDsvBSjLiC1HBd1cacfFCRzYg8J679x3JH8k21auAb
 SmOJ+0ckecKozg82Kg3bdpVoBQWb3lVpE91by6af4tcEIE/pHSbRW2lR4UBk8oC/9WqJ
 rnUG/tdPG6p+A5s0y8XuAW+0A3mUqkSNXJ2XgJinix/E35GFU76cWkLbx+xTilaIWJPH
 e4VQfBHHysvaOVdKZ9ZmJhUejt9xxqBQ3i5mdkSs/IAhXAOP27d4bqOeiwWr9TTNvsud
 YjwA==
X-Gm-Message-State: AOAM531lROh9EuZ6eOClRqnhnjLf+ds3GpFqAsj9qv5nEppnm2cs416d
 zCO3efLGRHpHETSmKvrcVCU5t6ZdBTvMkg==
X-Received: by 2002:adf:e198:: with SMTP id az24mr371216wrb.437.1641833295575; 
 Mon, 10 Jan 2022 08:48:15 -0800 (PST)
Received: from li-142ea8cc-3370-11b2-a85c-c55585c2aa0e.ibm.com.com
 (bzq-79-176-247-38.red.bezeqint.net. [79.176.247.38])
 by smtp.gmail.com with ESMTPSA id a6sm3922079wrq.22.2022.01.10.08.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 08:48:15 -0800 (PST)
From: Idan Horowitz <idan.horowitz@gmail.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: Bail out early on 0-length tlb range
 invalidate
Date: Mon, 10 Jan 2022 18:47:54 +0200
Message-Id: <20220110164754.1066025-2-idan.horowitz@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110164754.1066025-1-idan.horowitz@gmail.com>
References: <20220110164754.1066025-1-idan.horowitz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dfjl3ga64d5t

If the given range specifies no addresses to be flushed there's no reason
to schedule a function on all CPUs that does nothing.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
---
 target/arm/helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cfca0f5ba6..1e819835c2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4564,6 +4564,10 @@ static void do_rvae_write(CPUARMState *env, uint64_t value,
     length = tlbi_aa64_range_get_length(env, value);
     bits = tlbbits_for_regime(env, one_idx, baseaddr);
 
+    if (length == 0) {
+        return;
+    }
+
     if (synced) {
         tlb_flush_range_by_mmuidx_all_cpus_synced(env_cpu(env),
                                                   baseaddr,
-- 
2.33.1

