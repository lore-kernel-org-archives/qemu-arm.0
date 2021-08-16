Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1393421lfg;
        Mon, 16 Aug 2021 07:02:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqWo+8Smb1wuNKzkNEHn1Sw/7Ks8PeNvbeDQHLbD4RYcGGEGtJwdsylxBtuI/OlytNSS9B
X-Received: by 2002:ab0:54c4:: with SMTP id q4mr2569604uaa.74.1629122559182;
        Mon, 16 Aug 2021 07:02:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629122559; cv=none;
        d=google.com; s=arc-20160816;
        b=PRW05IYBP0LriKYnelQqm6kI0NuoahIMVFpdyqGD3JP0XUlMCjI3BZj3CSOGkQyTll
         27cc92eLdnGG/SLGFGYuufBscFTgjMnqxjxvRxoHj5yJFJYI0PKIB/n6THsHDux+uDj5
         amBiQmhnEyufycMbYXpeUNQ0x6P/jo7Kvj+bnJi/EE8M42790aGw7B0b1jwElE5bp9T+
         7XBwtf0PshEkN0Htj1tDCd73Xe/L5DhE6ZLAuRA45CyntwgrS3q16nEx7u5UAfoci+lB
         LNB7WZsksxZPglgLb23xar23ZuW4KRz83GEgkor0Mjb4pUbAonQ2+gyfkH2V0Q4D3BHv
         wcAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Wn5VOuzTj12riqfVnYaRkG+PQKOXcXHYoP+ynL4fbZk=;
        b=Lh0jGEMjSxpxS6vd1J+JBBQwsMzo1YDbz/4PGJIr+qndE0Qeotz3eWhHr16Hyh+J4q
         rfhjmPL23oltS6C/0PyazdayRTFZPfF4nWw+irnRsowMXZvclCoFxcEPDsfGb72gFDz+
         Yp6Y+IanXzJNSRvtNnMkYrHxUwfNp3Y56UUIOyqUdzpev6SG1Y7lcL1sNKKn5z3GbMDX
         4+UzxqKeVNXzjd51elE2Elt68VQ4GKx62KaZAJ4ydchm4sANQHt6NOJahZgfYL4U+zyK
         vGrVDoIgS35bx/UPYdtrBtKLrFOImdKplyiX+Ih52R8gu5h+uTUmrzTOzpY81l2QQZpr
         CrDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gs71d1rw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j197si2729987vsd.288.2021.08.16.07.02.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Aug 2021 07:02:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gs71d1rw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFdCI-0000pH-EL
	for alex.bennee@linaro.org; Mon, 16 Aug 2021 10:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFd8d-0003I1-Ib
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 09:58:51 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:38842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFd8a-00062w-88
 for qemu-arm@nongnu.org; Mon, 16 Aug 2021 09:58:51 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso15109870wmq.3
 for <qemu-arm@nongnu.org>; Mon, 16 Aug 2021 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wn5VOuzTj12riqfVnYaRkG+PQKOXcXHYoP+ynL4fbZk=;
 b=Gs71d1rwk9iC+JBhlKqxMkAM6WDI9Y8Po5vDe6nqE3ebsSO3bgRwKx3jv3erPhhWV4
 Iv+7hd9yvc6L06ofFP4dSl5qVn8Q0FxdKa4bVxvcRmIvsKT77V/VZrjrCHyQTnmcwJpH
 a2D/xcOzjWZhPVJ/hnhoswMU79bDZmiXQMylWLju6LPOapeCPaJdBs9xw8Yq0RSF76+w
 VtbMf2YbmE2KndGKWqBiHiHpzc3ggVGBbj3SA72vzNGTIOf+t3zLmOAASXtlnUj49vm/
 QehmMV/fh65gME07TVwX7eoxmR+P5kQpzh9vJr2eLcdlR5OJfZjWb1IUTMgTjiLMiuIf
 zgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wn5VOuzTj12riqfVnYaRkG+PQKOXcXHYoP+ynL4fbZk=;
 b=qw++1t0cAW5yCE0SQS3Z5ykeud9GyTlp4Px2gwTQobexdaxcDWeCn1FM02S+zYPk+f
 0hvcBt2CH+KQTqViOL6EAqBNdABK0G/YYKhYqTw3I4GtqMYlBdiZwEj797m4XCYzzaTj
 aeRzfQJzK3OflxUin2Io4NTGZ1QyDrkUOSXEjLn/VATi06GoOMwyYqUQa1pbxNB+9nD4
 nFEEOOgu2zuT4UDl3y2xEzgeDGkU5jeJDvJ8b2s1fvr6xdgMg/9IhP1zz6ZGvPogH4+K
 xhTHqPfSorycAeE5LD3mu6ubS5R4Yje9iLQXPSCSfNPIxCL3/RcNAd/AjzvYPcIFAeRq
 mOlw==
X-Gm-Message-State: AOAM531UmM9eKyT+Dvh0cKhXrr0MyVe32TYW1SEBtG8DIv0lfCGpbRHI
 Brgc3JNeimI0sKAZqGARu75Sw5sybJYbYg==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr15607904wmi.85.1629122326973; 
 Mon, 16 Aug 2021 06:58:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y14sm11855631wrs.29.2021.08.16.06.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 06:58:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/arm/virt: Delete EL3 error checksnow provided in CPU
 realize
Date: Mon, 16 Aug 2021 14:58:42 +0100
Message-Id: <20210816135842.25302-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816135842.25302-1-peter.maydell@linaro.org>
References: <20210816135842.25302-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A9jix/7gV27l

Now that the CPU realize function will fail cleanly if we ask for EL3
when KVM is enabled, we don't need to check for errors explicitly in
the virt board code. The reported message is slightly different;
it is now:
  qemu-system-aarch64: Cannot enable KVM when guest CPU has EL3 enabled
instead of:
  qemu-system-aarch64: mach-virt: KVM does not support Security extensions

We don't delete the MTE check because there the logic is more
complex; deleting the check would work but makes the error message
less helpful, as it would read:
  qemu-system-aarch64: MTE requested, but not supported by the guest CPU
instead of:
  qemu-system-aarch64: mach-virt: KVM does not support providing MTE to the guest CPU

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 81eda46b0bb..86c8a4ca3d7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1852,11 +1852,6 @@ static void machvirt_init(MachineState *machine)
     }
 
     if (vms->secure) {
-        if (kvm_enabled()) {
-            error_report("mach-virt: KVM does not support Security extensions");
-            exit(1);
-        }
-
         /*
          * The Secure view of the world is the same as the NonSecure,
          * but with a few extra devices. Create it as a container region
-- 
2.20.1

