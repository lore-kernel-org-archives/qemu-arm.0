Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp607419njc;
        Sun, 9 Mar 2025 06:55:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6cf9p2EyJe1RUqK6lUP0ydvgXvT50R3PcflD1q1u+med5SJoneYHwB9DExQ0EuLR2Uc6b1vy37U5wVw==@linaro.org
X-Google-Smtp-Source: AGHT+IEMCmVdQBL1w2pPgmy8jp6o0gSR06q+wGTT9mGb078SchpsblHDzkaf5tX3n3Bn5VhAt6IK
X-Received: by 2002:a05:622a:1a22:b0:476:71d2:61e6 with SMTP id d75a77b69052e-47671d2642dmr58330611cf.45.1741528529262;
        Sun, 09 Mar 2025 06:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528529; cv=none;
        d=google.com; s=arc-20240605;
        b=Dhwzw8caeo4bjQ+km9pdOMDJUjU5I9dRCQSOd1vPx0vqEsTHL+qTM4kxxB1nd23njN
         yd78xeC01XDd+JMNadpSjeyHfJZAuXpc2UU2WcBqka+5xAfyloD+zJc2a5qv5I7bmNhG
         EFOdbEyFTHA9S0pbVjw29ED6x+EYSE7MIsETkKBsfXiwh4f7sJYhIhHxadxTyQVuaZ8v
         hIjnA/l/IUnVcWiUuGgWHTbTzVyTjsHkKcTMgDuNtIEgawn0TNMjJ0C/o3v1GwnLpkMe
         RUuSs8H6MVId2q+6wG+7Z/kvW+cpBDj76ZlsKsm30/WbWabT9ZUi1CHc+Pbr3HVmzFg7
         AKmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RNPHmFlySQpeaNnnvy/wNuv/EhX2VW5FKOqC4Fxwabc=;
        fh=gIu7G1JN70NCpiHAwj66qqryR8wRCqauvqmhj52y0eQ=;
        b=Lj1VqVoSrgZIT3hkut6mqZjqq+UvNMJTHTXk6OWxpnlbqHLbRB8oG6F3yEtgw8xBzB
         NLUHNH2OvJonJpyGTB4dvz39tMsarz+O5GUeAsFCbA5v4K8FiFxfGU3Jg8NHL27vlImK
         XS0XKaidpETVehw0lHDOUdcHtXXzaTe69A6jOk56mGII2YOxJwLrOW+lF+/j9P/A8eW4
         VoWrJ88d4mrOs580wy1qWeoa5ONd/i38MgrT6JGmSdb8XvS8W8KdhxCQQiQ8WkRtt/R7
         yuok7t/n8T1CXCejosh1qze+alVcZ8xl7mAxXnvTOdr3c/rc75XNZ8lp6g3bvvnDg/bF
         un/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WYadK3Z/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db3c195si72290891cf.484.2025.03.09.06.55.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:55:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WYadK3Z/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trH4t-0008Aj-Fp; Sun, 09 Mar 2025 09:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4m-0007yg-Eu
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:52:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH4j-0002aY-Nu
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RNPHmFlySQpeaNnnvy/wNuv/EhX2VW5FKOqC4Fxwabc=;
 b=WYadK3Z/BppWOEhlIAoKg0XOWAeUWuY5skPUnAEewf0Ya6jIdhjy62F0zd8fqa8mS+r+2R
 5G87g9aP333M8Atq5qWWjGn3lzyFtP4nSgtxYrWpYV4D2vDiBeB35y66CnCj4ZnkGhIerH
 vEAkiwRfmGpKaFFxiNbp24yyDT6dZ0E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-653-97PObyacNb2LXip_2IJD4w-1; Sun,
 09 Mar 2025 09:52:13 -0400
X-MC-Unique: 97PObyacNb2LXip_2IJD4w-1
X-Mimecast-MFC-AGG-ID: 97PObyacNb2LXip_2IJD4w_1741528332
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7E63618004A9; Sun,  9 Mar 2025 13:52:12 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 98FC21956094; Sun,  9 Mar 2025 13:52:10 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Nabih Estefan <nabihestefan@google.com>
Subject: [PULL 14/46] hw/arm/aspeed Update HW Strap Default Values for AST2700
Date: Sun,  9 Mar 2025 14:50:58 +0100
Message-ID: <20250309135130.545764-15-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 18zmSlUlTZEp

From: Jamin Lin <jamin_lin@aspeedtech.com>

Separate HW Strap Registers for SCU and SCUIO.
AST2700_EVB_HW_STRAP1 is used for the SCU (CPU Die) hw-strap1.
AST2700_EVB_HW_STRAP2 is used for the SCUIO (IO Die) hw-strap1.

Additionally, both default values are updated based on the dump from the EVB.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>
Link: https://lore.kernel.org/qemu-devel/20250304064710.2128993-4-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 98bf071139b9..c6c18596d62e 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -181,8 +181,10 @@ struct AspeedMachineState {
 
 #ifdef TARGET_AARCH64
 /* AST2700 evb hardware value */
-#define AST2700_EVB_HW_STRAP1 0x000000C0
-#define AST2700_EVB_HW_STRAP2 0x00000003
+/* SCU HW Strap1 */
+#define AST2700_EVB_HW_STRAP1 0x00000800
+/* SCUIO HW Strap1 */
+#define AST2700_EVB_HW_STRAP2 0x00000700
 #endif
 
 /* Rainier hardware value: (QEMU prototype) */
-- 
2.48.1

