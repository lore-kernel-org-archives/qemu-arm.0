Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2405147lfc;
        Sun, 31 May 2020 10:54:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgzoSwrr/3ajR+zybvr3p8K6DPm/kzUP19iue4bNhwXr5feengZUIzvzze91csOnNuTLwk
X-Received: by 2002:a05:6902:4b3:: with SMTP id r19mr26554029ybs.185.1590947684218;
        Sun, 31 May 2020 10:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590947684; cv=none;
        d=google.com; s=arc-20160816;
        b=v1whbn0yW6Pl9x7vCzQmZ6Zmhogz35IAmxes/4/NOdH2KzZN8owhI+JnH35yESqsGw
         nlon6EnZE+vVgHgtiA3IdOBFeQ8X0gQoDHSi1lvw7Kj3/zP7paTA4e68Ct5FEo44BGpL
         CGUCKMTWyEqAa5H7HDtfHlYddWn4rI3KS92QGbKRsOlS7ndm8Q/7Xd22Qr/Ivc6/VmnR
         F60XpA38+ex2+kBdXibL41F5CqMXD0SwfzdAI2SAyI4eJbQjn6e9zObB09f3txT5KMkF
         kEgwMFTDldHBAfgSSCFLC7IcDb8iY2da1C11O7Y9nWvFERAu1bSeFyqYtEFxlBiDryQH
         QUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1hu7DwCrcdSlatzn9Imjz1Afklu0mU2pvXW+JIC/CUI=;
        b=x0DMkGfjfnfAN3O5xA/PLrE3iqXPpnwwtZJErv8edJiculCZR1UTtvemC68Apwpp8D
         8g8xr5qK84kUEcr0WUCeDIdvHRa/ntiwXsrDeXJzpf7SQwiBXjIxDtmqLhvWwaZ518u4
         MleYyzvxRv/rh3IqHRmtQKDRoiJyWLiLeViWy/oUTbD09dXTw9NuSE2SWpVWt48k2UgO
         3tb2tqrPRcpojA/NH+bvI6OidYprytAnXOeX2TVPdgqllvbKT2mLDt6b0IeIxwo979QG
         h6kJD/DjnuvG3qLRe4KpyvqrmJHFhcogjBuG2qjaBzXbflTsa0Xu0MD1ZyFsDls6Q5nZ
         rIMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mWlqM6b9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si11720425ybg.74.2020.05.31.10.54.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 May 2020 10:54:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mWlqM6b9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfSAV-0003ct-Ef
	for alex.bennee@linaro.org; Sun, 31 May 2020 13:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfSAK-0003c5-4h; Sun, 31 May 2020 13:54:32 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfSAJ-0007b5-FL; Sun, 31 May 2020 13:54:31 -0400
Received: by mail-wm1-x343.google.com with SMTP id u13so8639648wml.1;
 Sun, 31 May 2020 10:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1hu7DwCrcdSlatzn9Imjz1Afklu0mU2pvXW+JIC/CUI=;
 b=mWlqM6b9/BHwoA0IIMk6EvG4IZKUZy+M481W1L5fMaOfUoAyf/oZyIEBcI0p/rJ2Pm
 T5O4FDD2RyR3+NG8/mMcWThSQLF4wc/XQ5gGD7cqZc14u5qfccO/MQbI6He6SE4qyIMI
 iv+XlwkMhYfWyV3uJYfbftwElcMfVdNhdhHEe6/fDglOPOJkl4T91adYLY7phf1lgO2T
 yJsEGJvdRYr6H/hPsVQyJpQI5Jm+1A7XORDd9kfbh/NO8xYkfz4XO1Q8z4v8CGBbN2zr
 3O+ckKK4GC5B+UpvXC2yK+K9Xximkm2CDxwE0QjBG4dTqV/Ucb7yfNbpwCgJEHXFXcn1
 hwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1hu7DwCrcdSlatzn9Imjz1Afklu0mU2pvXW+JIC/CUI=;
 b=N6U+bbW77VvrKRBOkH/w4JsagbY+L0HaLZ9CxwaAoGNHRc0IH7kjiCCyFLsCVseOLt
 BIEKvovbF9pwXAOF+sj4EhN4pj7cBZcUlAyTyFXx0j9lkvP2A8kiPDxCLfm3NmOPhCOx
 8LWkiOq+K+aDIwuHEYbRRjdJQ/DsNNigdnIlc/zElcOWuIJ5b6erG08+eoxJJ1RVLK+G
 Pdw5EppL2vUoQ9ytyyD5q2ZOyJey0ybEW3GvRoRzGBZ4ink+S/QMJ2RkEEH0zLjNqQuF
 mfCCwUp0sY327zRUPQ+okQ1q7Y7mMl3BgeI0gkZzCRHLiez1TDgURVCTXRIxfp6tGsHn
 VNJA==
X-Gm-Message-State: AOAM533VKbHUboMGaZn796sxEzxtOS39oEbHwl7nYvIiDV/ptTWk96s9
 GLRxrb+rHjS2MbDCukYsusG3TCQ2
X-Received: by 2002:a1c:c2c5:: with SMTP id s188mr18162355wmf.18.1590947669222; 
 Sun, 31 May 2020 10:54:29 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id z7sm17862531wrt.6.2020.05.31.10.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:54:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] target/s390x/mmu_helper: Use address_space_rw() in place
Date: Sun, 31 May 2020 19:54:20 +0200
Message-Id: <20200531175425.10329-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200531175425.10329-1-f4bug@amsat.org>
References: <20200531175425.10329-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: brTDL+ToEMSZ

In an effort to remove the cpu_physical_memory_rw() API,
update s390_cpu_virt_mem_rw() to use a more recent
address_space_rw() API.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/s390x/mmu_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index 7d9f3059cd..632e8a8af4 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -529,8 +529,10 @@ int s390_cpu_virt_mem_rw(S390CPU *cpu, vaddr laddr, uint8_t ar, void *hostbuf,
         /* Copy data by stepping through the area page by page */
         for (i = 0; i < nr_pages; i++) {
             currlen = MIN(len, TARGET_PAGE_SIZE - (laddr % TARGET_PAGE_SIZE));
-            cpu_physical_memory_rw(pages[i] | (laddr & ~TARGET_PAGE_MASK),
-                                   hostbuf, currlen, is_write);
+            address_space_rw(CPU(cpu)->as,
+                             pages[i] | (laddr & ~TARGET_PAGE_MASK),
+                             MEMTXATTRS_UNSPECIFIED,
+                             hostbuf, currlen, is_write);
             laddr += currlen;
             hostbuf += currlen;
             len -= currlen;
-- 
2.21.3

