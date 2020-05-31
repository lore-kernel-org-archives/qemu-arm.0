Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2406288lfc;
        Sun, 31 May 2020 10:57:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHM6fWnWz0UA2X9hQ/o+Jpa9kkXoarjUaBTRFpNkCLWrLrH6V4y4Xrz6aZMiUE7SdpF3ib
X-Received: by 2002:a25:ae8c:: with SMTP id b12mr4152975ybj.502.1590947849138;
        Sun, 31 May 2020 10:57:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590947849; cv=none;
        d=google.com; s=arc-20160816;
        b=aI5IQ4+Du9THYFgQznqvKmBM/XPmtbLDFQDy/6/oOroFTOEZwp3N0a8FIk81Om2GX7
         Jp4uQmyPOXZF1XgOjAlNnerWeKcLrKWT7v3ijO/JDYw0a4QOkhcwk1ZFkVycxgfsxPRx
         SVq6uBWeJaoLHkf+0XtVnmIn0/D1PC+UUX3RWJUuUGLkDBXFW2g52ix3NqoJBfa6/q09
         QUHiLjOp8wAunpFXfL6nHUeEr/FA/bN/HjVCzaPRXnwUecTqvUXZRfiNyKCY257oL5Nk
         iAFlGjd/0UoafYowxfxPVQYfqEMPFb06qXa9j7vhqrVxzpDHjCy+FiKUCuwUekfuf+Mp
         asnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=o8b6+X1LLYHejSweB/c4hEC47Dl6kTi087mc3N8TiLA=;
        b=qv/vVVBHRre5SRlPxivIPGUCmvdbVMnmL6ZZl4+nb0qOJJv8sjsrdHJ6t7dyj7rcml
         DoXcoZNm4nZ3bmY7JlRJFHAwAY3wpAwM0BranTLEXbQYCqcICjP20TBV5vN4zPOCNP29
         6CTWBmiTFa6r5Pcxd+hzcQ0ezmQLekOuiOGU+TLb7yMAwww407KBiBJlVGgkFEtJKZ7q
         M7DRd+qebYPiXwII1Nxy0xUvmoV0zXJcuHI9BigdkEYVRDKebbf5e2BmK+PrJGX63cWt
         9gqU6CU2SW9yfVfSmXwJgGUTJfm6Bs8ssH1ZNxSG1+p3qv7YcxsjoAOcR/6DnpoqhXo+
         xUHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ldCRS+zc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1si12072687ybn.176.2020.05.31.10.57.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 May 2020 10:57:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ldCRS+zc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:51618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfSDA-0007xJ-Fl
	for alex.bennee@linaro.org; Sun, 31 May 2020 13:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfSAQ-0003nX-RP; Sun, 31 May 2020 13:54:38 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfSAP-0007gj-Tf; Sun, 31 May 2020 13:54:38 -0400
Received: by mail-wm1-x342.google.com with SMTP id g10so1003202wmh.4;
 Sun, 31 May 2020 10:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8b6+X1LLYHejSweB/c4hEC47Dl6kTi087mc3N8TiLA=;
 b=ldCRS+zcerY/fL38TEcn9Q/4Q/0bc5RQ01rWlVEoyJuZZcK7/AEPS3jwvEfR88dPIy
 yGmY36bBRNcPQhwhu5rz7K6UQuJVi0+k42YRwMRofsKi42xDxawpqH0fxIsbTn3VxKSb
 ojCEt/l0qS+xgZFDl5L3/AV4sx5XmsTvY7A1jlXoiTP3bDh4+V0nm0xinG23YDGeK3M1
 ckCvNNit8cPrs1IRIct+DRtIF7S8UQP/05bDBI4d5LeDyC4HOVS8isSkvz/hZamciIiO
 MI/hflFE3377syDgWbAHIYC8tdYuwWf11AbL1bKMQE3+KBCWKupkKJhWT3/4w+a/vxJj
 +s5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o8b6+X1LLYHejSweB/c4hEC47Dl6kTi087mc3N8TiLA=;
 b=BieQXDhJ37r0eON0xyC0UMXMVNWHU+63/iS2J1SbZUT+zemlS6uO5FhdK4/M2/2Pwq
 QkUSI0kZPINBXTonWNdEcR7UNO2a3g+0VCuZwDzmBsQSf/qZepLQhx+jlZMYKRSUSU20
 CEDY35B1or+1D/VEaC3ZpvKbhFgcNGN75os+9a8Zq08tNKVFqnuEcVW5/q8IqEoOa0VA
 2Egpqc04UqYK54xTPbOUDWk6tictlp+lmL3X+e8az3GOCn7xwdpWpILv0MpFCv+RTXhn
 zqbDD6ar04Pt6yFOr1HfDAhZ+YLaTAraQZgRyiirsF8ZjOTF/fgDQ9OBbfVPfFU0iEOA
 a8Tw==
X-Gm-Message-State: AOAM533u+tpLiMsaNwx04UafYX9PMlt61YDSbnWGlIqzIdYTHTe0n+Oy
 lxUl/CpiP584YFphou4QRsNbX3DK
X-Received: by 2002:a7b:cb99:: with SMTP id m25mr17938496wmi.0.1590947675719; 
 Sun, 31 May 2020 10:54:35 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id z7sm17862531wrt.6.2020.05.31.10.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:54:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 6/6] memory: Use CPU register size as default
 access_size_max
Date: Sun, 31 May 2020 19:54:25 +0200
Message-Id: <20200531175425.10329-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200531175425.10329-1-f4bug@amsat.org>
References: <20200531175425.10329-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
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
X-TUID: uK4G3valPN/j

Do not restrict 64-bit CPU to 32-bit max access by default.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC because this probably require an audit of all devices
used on 64-bit targets.
But if we find such problematic devices, they should instead
enforce their access_size_max = 4 rather than expecting the
default value to be valid...
---
 memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memory.c b/memory.c
index fd6f3d6aca..1d6bb5cdb0 100644
--- a/memory.c
+++ b/memory.c
@@ -1370,7 +1370,7 @@ bool memory_region_access_valid(MemoryRegion *mr,
 
     access_size_max = mr->ops->valid.max_access_size;
     if (!mr->ops->valid.max_access_size) {
-        access_size_max = 4;
+        access_size_max = TARGET_LONG_SIZE;
     }
 
     access_size = MAX(MIN(size, access_size_max), access_size_min);
-- 
2.21.3

