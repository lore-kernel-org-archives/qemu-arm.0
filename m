Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2002109njc;
        Mon, 4 Nov 2024 02:16:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX5UqLxqMOg0SMqepOUYheksBTZqhL7VZebhlRnW729pVcyIACZSU+ZGnPN1hJU1cW23F2YRYKb2H4ppQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGGo+ZnIHMbQruN++7d9lf+QWB7krAU7ebAB56gYE53obT6KglZPhY9+oCutU7wr/Plc/3T
X-Received: by 2002:a05:620a:1a26:b0:7b1:4778:1564 with SMTP id af79cd13be357-7b2f3cd688fmr2587665985a.3.1730715377788;
        Mon, 04 Nov 2024 02:16:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730715377; cv=none;
        d=google.com; s=arc-20240605;
        b=BNnBalqKU2+lMZGX1YUIPAMHrkcOnjPq50G/6HdXkzcAyEys8D8Hwi79hYUitWvPeC
         iZUsNNzWwJBD1rtYWNgeKATGbwqKGURRgJ9iJiAr0T4MZM2fC4BHIN63klwFCjb/mYvE
         TWH7HbhrRyWqGeOph0ulqDRD+FLPtRJS81FvgkEBR0LDfSRAqAF4DiEhzMZnaGAqBE2L
         Vm+fSaKqkTC8BFDs8jxig/3DXv6m8JvEbKg0ycT3e/PaiOZmBVA+M8nTg/IBj6TfXMCc
         M8vf/3mGl+L07bZLmRd5CbuxXJ8owly2YDmq7dYMPZg8HByMNLfYy/Yz8MVeC6Io3G9M
         KeEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=e6gaduAfI+wCpuhXs1Wv9w9ku29RoqogCLvniLhjI80=;
        fh=34Iw5affspMzPSZvYyGXJaYAvLSLfbjT3SnYu8GjqYM=;
        b=UKcY53RcmLgjlpIybPyRkvgBjxukd9lVza42fEB9MfqoRXU1cVSHRbIeHAtkMHj4v+
         ojGPUXQ3gl9QK84HOP8YGAyzlADfTX9QZRtidj0xfVBy3h3l+i/GBn/T/JPq+ZtPpwEL
         lkFejWHUatUqKrGyJpyWPnRsIBZrXhSvgBoApxHKQ6EGILdlS2yGHcd9EoyvalznyGX4
         SCZMRPQ3wJWIQN6l/22t0g0lk/sUfLLGdG3uoV6HprdW8AF3IJig7yuJ0h+3ZQsL9E/n
         R2Y7UOcD2+PajCW+ACjwItn0R5qHw1nz94eYpqkNR0fdelnGmUn4o8+aw9kFXi99rbrl
         KQOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E102tEJd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f39f3c2dsi1059134985a.65.2024.11.04.02.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 02:16:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E102tEJd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7u7S-0000mN-5M; Mon, 04 Nov 2024 05:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u7P-0000kX-1d
 for qemu-devel@nongnu.org; Mon, 04 Nov 2024 05:15:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t7u7L-0006aU-P0
 for qemu-devel@nongnu.org; Mon, 04 Nov 2024 05:15:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1730715326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e6gaduAfI+wCpuhXs1Wv9w9ku29RoqogCLvniLhjI80=;
 b=E102tEJdG4DYdkwfECJqfQro5bHk+58hS65mnvFX7FLf0V63yiMrkGs3YpOgq2z3GNQ/gd
 bSx4Rq1DlqfJQvOpyGlVQlVH+kuhT5FrqCBXKs0beZJ4Ai1vkdTlaQo9m9e/sz3KhSc3iv
 Pc1SgSj6eg8lpcciH1oZZCkIscPbjmc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518--CQhXOCSOriD7gi-H_GCQg-1; Mon,
 04 Nov 2024 05:15:25 -0500
X-MC-Unique: -CQhXOCSOriD7gi-H_GCQg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4E03819772C1; Mon,  4 Nov 2024 10:15:23 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.67])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E75E21955F40; Mon,  4 Nov 2024 10:15:20 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 07/10] hw/timer/aspeed: Fix interrupt status does not be
 cleared for AST2600
Date: Mon,  4 Nov 2024 11:14:58 +0100
Message-ID: <20241104101501.2487001-8-clg@redhat.com>
In-Reply-To: <20241104101501.2487001-1-clg@redhat.com>
References: <20241104101501.2487001-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.34,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: i1Psv4SkudXL

From: Jamin Lin <jamin_lin@aspeedtech.com>

According to the datasheet of AST2600 description, interrupt status set by HW
and clear to "0" by software writing "1" on the specific bit.

Therefore, if firmware set the specific bit "1" in the interrupt status
register(0x34), the specific bit of "s->irq_sts" should be cleared 0.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Fixes: fadefada4d07 ("aspeed/timer: Add support for IRQ status register on the AST2600")
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/timer/aspeed_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 5af268ea9ebc..149f7cc5a6aa 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -580,7 +580,7 @@ static void aspeed_2600_timer_write(AspeedTimerCtrlState *s, hwaddr offset,
 
     switch (offset) {
     case 0x34:
-        s->irq_sts &= tv;
+        s->irq_sts &= ~tv;
         break;
     case 0x3C:
         aspeed_timer_set_ctrl(s, s->ctrl & ~tv);
-- 
2.47.0

