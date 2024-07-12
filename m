Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp911582nji;
        Fri, 12 Jul 2024 09:37:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZzym3B2Oga+v8gmrhYKz0wt/f2QzMmFDI+jaOQV/isdEts4J/rTkAuqFGYQgvVTbHjHiFmqf6He5bciMQjfjXBmh8q9fS
X-Google-Smtp-Source: AGHT+IFOxv7DKP4KgK9xqvh+VpZENQNb9lWefoehizlxUY6kojM+UZp6NkQuul0hWQqXV687vO0/
X-Received: by 2002:a05:622a:9:b0:447:e38c:59f with SMTP id d75a77b69052e-447faa6f5b8mr126799141cf.47.1720802232982;
        Fri, 12 Jul 2024 09:37:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720802232; cv=none;
        d=google.com; s=arc-20160816;
        b=soI1F1SSwQNwU+fuurFYe+WNkhRDHyGvUOU0ThM5vpCm08V2KbEp6UdjhPtKJxt04k
         HdWUvseNscuGnRwLidiOnDXMhAwqJRCHlSiVJUF/287655I/0djBwDH4xliiqwiofNPq
         DugFjhiUxmDabMhpd1vb9QZ3TQni/Q9E7bBFmGKbTkGTkQhxticNUSZlIbNszM88OszH
         8+imLxjxN+alCCdXR+JPmPxezFXzxVv/ggqC8jwZdoikFXeC9MErPvB04TBo0FCo64m+
         pcUWx5RIUctj2X+UsoADeTDKiyvny25nusYVYBWpOSooSF+NJfvzojzHwsGL5fnmxZna
         yXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=VYMLzjRoFjxrJBkd+e3E/awaoyFZwmUY/SMFgrOMaTE=;
        fh=FcjDYfNwIZ7E5oGc6IqqA38lUfH3Nowv7fxvZKRWukI=;
        b=bwshssyoTuiG/Fv27uz5RyHmbsJP9xqFpwA/1uvFJWkmAkLcewtTuJMTVyy/HZq96J
         55HPydnGkSQRsh2+laeHzsU5BTTaB9OasOZ26ZXBKI+VtmQpSloTpTCecX+ylhbg60Ky
         7G9Q9mQZUvZ5vW1jFnRC1MFxEsPP8P6Uclu/rbmypkl7AWRauoN/gYllV8KsRsUoWuhi
         hD/Uu2WGFMe+xcQxO+o47a9dKHbvQYqXGB8Qbi7/lhxIrgcQegh/X8FCrlVwmfJUpCr9
         kLG8GMV1VQxuupLzKX8/zuvxWRmPJ9asJVULMVoI1SXiUkc/TirX3EhuUbRNC2l70LuU
         9A0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RwB2jTXY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9af5ae4si99351091cf.62.2024.07.12.09.37.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2024 09:37:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RwB2jTXY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sSJGS-0001CK-Lw; Fri, 12 Jul 2024 12:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sSJGL-00014i-Az
 for qemu-devel@nongnu.org; Fri, 12 Jul 2024 12:36:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sSJGC-0004fT-7p
 for qemu-devel@nongnu.org; Fri, 12 Jul 2024 12:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720802198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VYMLzjRoFjxrJBkd+e3E/awaoyFZwmUY/SMFgrOMaTE=;
 b=RwB2jTXYWURVYcchj9ELN0rxXn9zE2GtvoLXQB8f32Rq8cDspLtIupcegkZW74tTZZo8XY
 r88lkd9nBh166Sv81a1yy/u/Bf5y7xa3tdcg/euCOxLSv0+lTxHjxoAxkdZULg0n10/sog
 Pcqw12BUKN6HvD8e0eml+Zmgg2grc/Y=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-15-ZZoVSrqsNnSdakM33epaKA-1; Fri,
 12 Jul 2024 12:36:33 -0400
X-MC-Unique: ZZoVSrqsNnSdakM33epaKA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3283A19560B5; Fri, 12 Jul 2024 16:36:25 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.193.243])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B61403000181; Fri, 12 Jul 2024 16:36:21 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH] aspeed/smc: Fix possible integer overflow
Date: Fri, 12 Jul 2024 18:36:19 +0200
Message-ID: <20240712163619.1734214-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.138,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: H8eFAPUC2iSa

Coverity reports a possible integer overflow because routine
aspeeed_smc_hclk_divisor() has a codepath returning 0, which could
lead to an integer overflow when computing variable 'hclk_shift' in
the caller aspeed_smc_dma_calibration().

The value passed to aspeed_smc_hclk_divisor() is always between 0 and
15 and, in this case, there is always a matching hclk divisor. Remove
the return 0 and use g_assert_not_reached() instead.

Fixes: Coverity CID 1547822
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/ssi/aspeed_smc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index b79815c2b8aa..7fd63669c10e 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -842,8 +842,7 @@ static uint8_t aspeed_smc_hclk_divisor(uint8_t hclk_mask)
         }
     }
 
-    aspeed_smc_error("invalid HCLK mask %x", hclk_mask);
-    return 0;
+    g_assert_not_reached();
 }
 
 /*
-- 
2.45.2

