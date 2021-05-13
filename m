Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp667497lfg;
        Thu, 13 May 2021 09:55:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI17PeCmZ7cVtZ33mJPgq4jLtKlvmT8yV0QpRgOnHDCOnpQxC84H/fDAURykzOubrRCyHn
X-Received: by 2002:a9d:7a54:: with SMTP id z20mr21221034otm.17.1620924934802;
        Thu, 13 May 2021 09:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620924934; cv=none;
        d=google.com; s=arc-20160816;
        b=GrOYelXGIN9AfirltiW8xNAUAfGbW4usp795jGetgYV2kzWtYJqD/0EWHyCsDNr0Wn
         c62TLWh+w12CE2TAkboh4F+OYfye4w0dITGsGheBfhnT7E8LMJLlhPvpSQbrTBGUyjFR
         McZk3bZi3aP/Yfnid1cfLZQUQOqgRpxGci6RUpqeNgwOEUURN7rDWkhlMQLMNjqCYBBW
         gTjtjwmnQcQ3XsZp5ubnxPA8DAnYsJf48cS0XkNUHdxAxSsvIts5HY3KbEdfa3w7r5tu
         hYRZsovmxI68d1SoGNn5GFLhKMUkWi8r3L8SHC9Bj6Fc3JcxVMYl3s85BTvm14PL0eYb
         OV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RxjBXIiwUsk+hse5zMCnX9XGKfKUwyxRJGBY/GxWjoA=;
        b=MoG7w8hqRQpKyhNKZNHF3deT/Tv7HOWhFX+sp4EkiidDoLvQmy0tAk4jGpBOa4splC
         xspaFJC48BZT7FthVLoeLtL9e0bkwdko+xEvjyXCAl9IdKdxb16rieWwF8KtARnqyQOm
         xqGgdemkOu7G/Hi2Rtq83Tqqk7RIDS59WUV1h6Zgz4UZNBY7VHh8xWjfTJW5TRas4Hc1
         iRE/aOCLz9ZXQjzl6RIrBp/SVNjL7rUaJ5rR+5djEMe/PLyeIlvixx3k3EjvGUo4SvNz
         301+Y3DlitLQIOqiukYs98eoohQA4uWPsL5CSkUNrusYXVvnjeA4kIVO7nYhfNRHzI6G
         FcWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RGPluhZw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 191si3237630oie.12.2021.05.13.09.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 09:55:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RGPluhZw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhEcY-0007mF-2H
	for alex.bennee@linaro.org; Thu, 13 May 2021 12:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEN1-0002QH-WB
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEMo-0000oM-Tt
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RxjBXIiwUsk+hse5zMCnX9XGKfKUwyxRJGBY/GxWjoA=;
 b=RGPluhZw8+wsRSAF/EeUQeWleSPTWj1Snx5ejazf+wyXBbzpC1AdJnlO5a7y9YGglIT56V
 4tKqrhwqT/AnzfF6tbK5OwktjEcZIPtZ07KfIPVgmf+MWH+jXCE60k/ByFqCG1kOrzbzSX
 yzZLzYmikTTfmRo7TsvPo9BIM+3Ldxg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-6WuGVLylNQaVIbgylxwGNg-1; Thu, 13 May 2021 12:39:16 -0400
X-MC-Unique: 6WuGVLylNQaVIbgylxwGNg-1
Received: by mail-ej1-f69.google.com with SMTP id
 z1-20020a1709068141b02903cd421d7803so3181600ejw.22
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RxjBXIiwUsk+hse5zMCnX9XGKfKUwyxRJGBY/GxWjoA=;
 b=rXAJZAp8mZSs8h1Ee+aqTya6ENbJvexUkAX9ybQ5WhJbwQrA2qwdghm/x6Fjn2BvyM
 QHVXLgodLrqklT8Cv4JJbi1KdAXHZx86eCp3Prm7PbDc9Krkrwso0qlv5KjuioOJsaZf
 d98Mro5ucAJYWdbu5kK4nvHfEC14SMwnpGJfLmojuFfAGpAL8vul1Nu6EYvHFjPQ3qRA
 poF8Evx7WZ9klJTupVR9PYa297/JYPnDUqc+1CGlxe6fGvqlqNt6Yk6LaOVsKTwkqn+8
 luXvB3dnZ0ldl9pgTrwS2yIBsb/GHTh3X+hgCYtZRxPWy4wZhVkVwrqUz4PBC6WvLE7N
 TMOA==
X-Gm-Message-State: AOAM533rV+JQKmoVQJHvj/93sJ5MDjbeFGnjnm9D6LjVVwT0hNBOhcs7
 OUKQ42pCqiKkfrWEbL8w8fSbhamA+Myxxaern/x3Gl+Q5lrA27uZC8qB6KSSqgz4y5eQbUh0NTg
 zVmm+1c7egeVCDqajm8RFazhVhPCi0RPWUOlNznfDepbPeKyfPGYOhTdoNZzphYCZ
X-Received: by 2002:aa7:d955:: with SMTP id l21mr50910805eds.118.1620923954789; 
 Thu, 13 May 2021 09:39:14 -0700 (PDT)
X-Received: by 2002:aa7:d955:: with SMTP id l21mr50910783eds.118.1620923954636; 
 Thu, 13 May 2021 09:39:14 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id s2sm2635684edu.89.2021.05.13.09.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:39:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/10] hw/arm/Kconfig: Add missing dependency NPCM7XX -> SMBUS
Date: Thu, 13 May 2021 18:38:51 +0200
Message-Id: <20210513163858.3928976-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513163858.3928976-1-philmd@redhat.com>
References: <20210513163858.3928976-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>, Doug Evans <dje@google.com>,
 Hao Wu <wuhaotsh@google.com>, Tyrong Ting <kfting@nuvoton.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2N9sXr5AGBWk

The TYPE_NPCM7XX_SMBUS device model exposes an SMBus, but
this isn't advertised with proper Kconfig symbol, leading
to an early build failure when building NPCM7XX machines
standalone:

  The following clauses were found for AT24C

      config AT24C depends on I2C
      select AT24C if NPCM7XX

Fix by adding SMBUS to NPCM7XX.

Fixes: 94e77879395 ("hw/i2c: Implement NPCM7XX SMBus Module Single Mode")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Doug Evans<dje@google.com>
Cc: Hao Wu <wuhaotsh@google.com>
Cc: Tyrong Ting<kfting@nuvoton.com>
Cc: Corey Minyard <cminyard@mvista.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 67723d9ea6a..85c6a1a088c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -373,6 +373,7 @@ config NPCM7XX
     bool
     select A9MPCORE
     select ARM_GIC
+    select SMBUS
     select AT24C  # EEPROM
     select PL310  # cache controller
     select SERIAL
-- 
2.26.3

