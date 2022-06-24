Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp350836lft;
        Fri, 24 Jun 2022 07:09:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ttcVWaLPqblG1xGUmpVVdQhLl7I23+DKwIAEuyh0CPhcseW2VfhIlCEoUyEGnyrKYnWjtS
X-Received: by 2002:ac8:5b0d:0:b0:305:2994:6f0d with SMTP id m13-20020ac85b0d000000b0030529946f0dmr13171698qtw.668.1656079788340;
        Fri, 24 Jun 2022 07:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656079788; cv=none;
        d=google.com; s=arc-20160816;
        b=uTdY5bjmnsnAbMD+rO2MWaigcNR3N3hW0RiO8cHiVxxPeV/YJOMQ1wBCECebkFoL3b
         aEyRV9qWiSn2Iexnrhcnmhn+Hwa6TZTCL+ol8ksyj4ShZZPoDYiyUghPgn6J8hwXpE97
         JYbM/5NJMCM25BfpPywAq3rDWWCxZExqYPqrNCgYiAOZ10eck1W1VlMAGEEGEcFpv7wd
         lODP+QzlJmLJcNmn3PT6IinIjJA5TwgbKK3wFDoBhLuLPRQvR+bs0KhRBvTR+wvcE+PC
         yHFi9u+4fEpQ+lmE8LRaF1fQ30pkRovJB8nbLW7eIRCji8ZFDS0cV0z5jYpp9kK4Qk/6
         kYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=fX2YWydvz3qBtZHdqqwv5PDkps8PSQHCcwTqVmy00qM=;
        b=buroVWZ2oGEQlxD5iIqGruchY1SZOavPqNcZbQ3uGRthDS/xabRab+hyHdEFUpR6Kj
         iLOwyiMrOseUBkkt63iFn2nIBrSZ7lLKcsFDAJ5j2xHUPcf7xcG2ZISQMkeEAofcEw6J
         VBbatRpoazfoUywJhgVVIaFX27HfaH9WwNV6rwpK28Co5g6zLOszvfECleyhnNVt16ea
         9Q+qL0D7EhItkGonkvA8pPFOW4p2dUpABr7slBkewB14wJbTLcMptFGama8xQ3l7+/eW
         7GtT1uMMyNR+gzZRnY3F6VJfwoE2iwJu21G67GTFYbsimcOIIYMruyfbaT9LoVCz3MoI
         3FiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=FxCDTA+z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9-20020a05622a028900b00305001affc6si1668450qtw.45.2022.06.24.07.09.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 07:09:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=FxCDTA+z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:54520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4k0J-0004y2-QR
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 10:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jb3-0002sB-Qa; Fri, 24 Jun 2022 09:43:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jb2-0005JY-AC; Fri, 24 Jun 2022 09:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fX2YWydvz3qBtZHdqqwv5PDkps8PSQHCcwTqVmy00qM=; b=FxCDTA+zkfbLxkE6rKzlWQKOme
 U6P1KjzZwzhKQ0Rb+7no4uuXBufTpvhTii+zSgps6HUfOTXpJS6hh3ZmQxov+hvq/nYroGATWQ5iJ
 9jFL0XhVhTh+Mx+2jXh4sSK6M2Yb+ltpy4RzT60iki+TbjKlosA1GtdPeL70jetqWsvm++aTmuG5d
 PpYJRoocIkZcNycBltgHZUR2v3inWE6BUGKjTKlVoVEXhmT0hmESatimzkTD8tBwwsWBAlcWTkMe8
 kTrd87yXFGBPomDU7W+RsG+VoKBcIh6QXRuesHToCaDBzoW3O6AeiD+1WQ0HFw7GbZGXY3KvSW6mI
 nRvJqq95p3BJ/l68Gj1KmaQ2CoYfopnb9Dj5AhTTONC4e1WNRkjFE5LbCy3EUR9aavMOJQ5ap9WaD
 iAZ5YLCg1DDKl4MZpJyDirmY+LX5ujTO1mN3lPCC4ybBfBigysEiBFEHJO4o1aQp5dDDNspCZP0FF
 rJ8/el6zk32MQqsfU9hUwC8diwWa2fY/3zeFuV2dcuFaFKG6k1cso6CNRo7rsenvGQWoLuG68q7qU
 Wd77zL4X7gmYOTo1ihhZDiLnqQOMMh821sgDvKRN1C232tAmGT0dBEe/yvxUhzhtDn4leAJw7ziRi
 5h2luKwAjYp2P+tpvaC51ONnaHlszB5ByYvmAt4XU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jZQ-00037t-Lk; Fri, 24 Jun 2022 14:42:04 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:47 +0100
Message-Id: <20220624134109.881989-33-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 32/54] ps2: use ps2_raise_irq() instead of calling
 update_irq() directly
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: KwOd3SxFxEuY

This consolidates the logic of raising the PS2 IRQ into one single function.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/ps2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/ps2.c b/hw/input/ps2.c
index 24c9853d37..a14281bc54 100644
--- a/hw/input/ps2.c
+++ b/hw/input/ps2.c
@@ -557,7 +557,7 @@ uint32_t ps2_read_data(PS2State *s)
         s->update_irq(s->update_arg, 0);
         /* reassert IRQs if data left */
         if (q->count) {
-            s->update_irq(s->update_arg, 1);
+            ps2_raise_irq(s);
         }
     }
     return val;
-- 
2.30.2

