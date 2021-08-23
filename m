Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2031019lfg;
        Mon, 23 Aug 2021 09:45:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhkpDb7a/ar3fiuvT3oHLAD5wTJSf/gdk8fGnmPC8O80hheVnMjrUeup+EEcClUxFFM0oH
X-Received: by 2002:a02:cc8e:: with SMTP id s14mr29777015jap.102.1629737149147;
        Mon, 23 Aug 2021 09:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629737149; cv=none;
        d=google.com; s=arc-20160816;
        b=pDKFgxhTxU+DwOxoJd5ZOWgb6BAxwnqcFZMP+hVuptm004QrwEq9qxkg/0+4NIeqZX
         Kfny/HflfV7yj1nzsbS343cFIIMrpN2bchME4HoWlkQDInKYwHe7QTssdJcqwzoRfi5H
         +L3VqYBApf4874GqDpf4djGGgnma+eNGHHImQ/LsEB9k/xuTtjGrMknXzybKFFQN6VLZ
         nmnFtq//vMZ+mwsg3HBl7NmnNPt/XcrnGoPX2K4HTVheVuyf81k/1cH/KJyf277S0Zgl
         mexg3Qnz/WJZr4imxysR2UQ2OngFbHTw3W1dZrekv70OsPsJ1Bc0Kxfgxs3LrDRiy/uH
         tMWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YckUsUuV9Qy+6aID6wMdVmO5kBrH6n8ni00XTKyY7A0=;
        b=h3WgWbcQAXrOyiXKOsMnapxONAKtEpgefugBPEp4cxwqD2ArRJ14+V0ur6NkCmU2gn
         6BbX9Jg0ft8reB8bF0TjDDnjvYSNwT8Hm0CCZQHo37xFbHKYsdhBe3IZhzmRHGIBsVkf
         l8necITz5hs9gRhEqwwEjS9RiHRGD9J3f8RqSGIPUQr3dyBA1dhZkkLT9ojRkFAQqgcS
         6TAObenEg9/UKHl3Doxt+Mbss6vOV6ohXpVJYbz/KjodvjcR3R7pwtA6y6ewahgNiFqZ
         IABJJ6FmAE/W4fLUFqYhL+kPScElJQmMHfhyD7lsNJ5zN7ksBtnPd7JqvBJB48Y4WiSO
         gL5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O4ZwSZUH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si17264448ilc.69.2021.08.23.09.45.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 09:45:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=O4ZwSZUH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mID50-0005ig-GJ
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 12:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1W-0008Nt-UT
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 12:42:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1U-0007IN-Ke
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 12:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629736928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YckUsUuV9Qy+6aID6wMdVmO5kBrH6n8ni00XTKyY7A0=;
 b=O4ZwSZUHrEctm6vlI99KKh6NR67UpBWY8zCZPGR52ux4UMQ0YlHHrDhFtnOm8xVmabXycI
 TTZfQSLXxD2RMTI59CGJPDJDpd1mS4SycqwtgnkON9NTyEZ8OHiZfe9yBGNoyHLzCGXoN/
 LLHUOh4hh8yCvEgISPJtbqp4f8lsvAU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-LasxsyIbOPC-eMErOqf1ow-1; Mon, 23 Aug 2021 12:42:04 -0400
X-MC-Unique: LasxsyIbOPC-eMErOqf1ow-1
Received: by mail-wr1-f71.google.com with SMTP id
 b7-20020a5d4d87000000b001575d1053d2so332682wru.23
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 09:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YckUsUuV9Qy+6aID6wMdVmO5kBrH6n8ni00XTKyY7A0=;
 b=tGndnZdl4ur4IKltHgUoYf8/tOWpMmXZ/W1Et26widMMTyhW0E+sh8Tt4fSj0LUUpG
 x/U4yMeYewRbTnJecqjfXzd4prj3+wUEKzd+xB8UXRBgIdDmfdI4Ul4GiS2yPkOvDAkj
 i96a7j3Qc6xYRrC5WI5+MUKNHPAk8FiEtimFg7b6bJRaPqsr7CYxBuoU0DFRfVfpk7R4
 Q64qGfxfdbknYdPBuTgtwMqJmz4tXRfYvdhmSEBsbriQPRHFYsPHJ3TCoBesRG3jMPJP
 6jUsTZKD8BX3wCMrEIWZEaFUTAkkmJjMgncfQnpGHZ+4sGfslGFESnUKZl/horT8kLKM
 1GIw==
X-Gm-Message-State: AOAM531IWVRbGEvxDaDp+gR/WHwHx8T6yF6lylypBW10eWEZee51VzMt
 aSABkaiqpdhDBI3YXrNl3tAyd/Ck+AhWa49v7P/rtN8qZBylqKCSlUkfV/TPVbJINRIiB2bJCLq
 hnE8ZJke71AAr
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr1483418wrp.381.1629736923719; 
 Mon, 23 Aug 2021 09:42:03 -0700 (PDT)
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr1483398wrp.381.1629736923601; 
 Mon, 23 Aug 2021 09:42:03 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 j17sm15371045wrt.69.2021.08.23.09.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:42:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/5] softmmu/physmem: Simplify flatview_write and
 address_space_access_valid
Date: Mon, 23 Aug 2021 18:41:53 +0200
Message-Id: <20210823164157.751807-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823164157.751807-1-philmd@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P0U3moIbGgDO

Remove unuseful local 'result' variables.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/physmem.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 2e18947598e..e534dc69918 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2810,14 +2810,11 @@ static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
     hwaddr l;
     hwaddr addr1;
     MemoryRegion *mr;
-    MemTxResult result = MEMTX_OK;
 
     l = len;
     mr = flatview_translate(fv, addr, &addr1, &l, true, attrs);
-    result = flatview_write_continue(fv, addr, attrs, buf, len,
-                                     addr1, l, mr);
-
-    return result;
+    return flatview_write_continue(fv, addr, attrs, buf, len,
+                                   addr1, l, mr);
 }
 
 /* Called within RCU critical section.  */
@@ -3114,12 +3111,10 @@ bool address_space_access_valid(AddressSpace *as, hwaddr addr,
                                 MemTxAttrs attrs)
 {
     FlatView *fv;
-    bool result;
 
     RCU_READ_LOCK_GUARD();
     fv = address_space_to_flatview(as);
-    result = flatview_access_valid(fv, addr, len, is_write, attrs);
-    return result;
+    return flatview_access_valid(fv, addr, len, is_write, attrs);
 }
 
 static hwaddr
-- 
2.31.1

