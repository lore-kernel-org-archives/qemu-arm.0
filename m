Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1064273dyc;
        Fri, 4 Jul 2025 01:38:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUigUEjJtOuDA/dAtqqRrFrwn/h1LfinAgJBkGKjbV5TPLdphh2G5h9zqfq/Lr1EZ0IZHDzWtSu1VFGng==@linaro.org
X-Google-Smtp-Source: AGHT+IHDAGDZB3P3iGum6gDBI4tgjg9V4VEg2O7SB+HVr1VfDcGw1N5ewhe0ZUqLDEWIlNV5W18k
X-Received: by 2002:a05:622a:4c14:b0:4a7:bf5c:42d9 with SMTP id d75a77b69052e-4a9964e3dcamr29948111cf.16.1751618314209;
        Fri, 04 Jul 2025 01:38:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751618314; cv=none;
        d=google.com; s=arc-20240605;
        b=MfLP8/t2LBuQLt0kHrI2g4Vnc5dqeihCDXDXfBG4Qf4GyJbqXdlcYHOk5Q/vKHiC9K
         uLYo0OfQbvVFvvIc6ScLm5iI75yNg/W3mptmdc3AgwkV2Yw/RiKFX+FkoixURYex/Hzm
         75/CStIhkYHXXJlbjJzlJWg77MmnJOapJUndZasTZJY6X7aiyy/F7fTOnzOIbB6JfdoB
         TW53UbafkCHp9Ar4lYImf2/DkvOS1HfPc0GJ5+nRn8id9Z9XpLH1wEaqum0n2ZO4GV7a
         HT0fH9Aq1X75cxm9Dm8IiGCQsui4W7xaFsd5bN52pn5Oi9Mf2M+2/Q3N5REsrgytGC7x
         EkOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=k6dVkpqjcBar/IDbr90jrY+dQV8ISljwcUWttx39u/c=;
        fh=+t8f2QUGNeXt89pTQTEBtpEgrYFQ0TScg5PhIDzvsVg=;
        b=hDtuQ7hgnfUZW0Q0f6ThnEWSsRmoVhWFbvgz8b5bZmEZzJPhUhrtQcPKJ8rD3wI3ng
         ANOV0bTVLXT0C+WnsoaaRV2PCUcT3O82xXoJql064wcw1Cn1XRWM+//0IpuasidSlgmT
         uukE0kCXEi/xdiS/EbUg5BZSFASIU7cJ1NwapoURiMpdsZBjnHxB/Ma+u16PGf9jMQSc
         ibMinvn9eAzLDD9bXAL4FlUJuURhOOQ/zNdujV+ia7uupTjWA8j3OOrx9k9HoakdqeE1
         0ggMlI/0Y5G+j38wqTgy49OrtrmGZncyUuErGth23lA3ZMhiD5ooaOuV2ROz+PhAolqZ
         jGTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XhruHUn/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994b3503esi15811151cf.664.2025.07.04.01.38.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 01:38:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XhruHUn/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXbvU-0006Y6-Vs; Fri, 04 Jul 2025 04:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvS-0006Wp-JM
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 04:37:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvR-0004Li-0e
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 04:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751618260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k6dVkpqjcBar/IDbr90jrY+dQV8ISljwcUWttx39u/c=;
 b=XhruHUn/O1JblKZUfSF3DfGrfdPBuD3MAaf4/ILoh/RAOWMc8WgxcJFpmiNpFy4lrYswJX
 VrnVggnqTSWKM6tmWUFZypKmu4DjL0JSpkbpyna46RnlueonAUNzKWhh0UCltpzx1Bq4eW
 rlPtbpJJoYjUyFJaHZ+oYHtLmB3V61A=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-190-ZH_ScVxdMt-Jw2h4FmHfeg-1; Fri,
 04 Jul 2025 04:37:37 -0400
X-MC-Unique: ZH_ScVxdMt-Jw2h4FmHfeg-1
X-Mimecast-MFC-AGG-ID: ZH_ScVxdMt-Jw2h4FmHfeg_1751618256
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 08DCE1800287; Fri,  4 Jul 2025 08:37:36 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.43])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2691618046C5; Fri,  4 Jul 2025 08:37:33 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Patrick Williams <patrick@stwcx.xyz>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 03/11] hw/arm/aspeed: bletchley: update hw strap values
Date: Fri,  4 Jul 2025 10:37:15 +0200
Message-ID: <20250704083723.1410455-4-clg@redhat.com>
In-Reply-To: <20250704083723.1410455-1-clg@redhat.com>
References: <20250704083723.1410455-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: 6gv4CrGZ6WbN

From: Patrick Williams <patrick@stwcx.xyz>

Update the Bletchley hardware strap register values
per actual hardware:
```
root@bmc:~# devmem 0x1e6e2500
0x00002000
root@bmc:~# devmem 0x1e6e2510
0x00000801
```

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250619035850.2682690-1-patrick@stwcx.xyz
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d0b333646e99..5662cb2c4a70 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -197,9 +197,8 @@ struct AspeedMachineState {
 #define FUJI_BMC_HW_STRAP2    0x00000000
 
 /* Bletchley hardware value */
-/* TODO: Leave same as EVB for now. */
-#define BLETCHLEY_BMC_HW_STRAP1 AST2600_EVB_HW_STRAP1
-#define BLETCHLEY_BMC_HW_STRAP2 AST2600_EVB_HW_STRAP2
+#define BLETCHLEY_BMC_HW_STRAP1 0x00002000
+#define BLETCHLEY_BMC_HW_STRAP2 0x00000801
 
 /* Qualcomm DC-SCM hardware value */
 #define QCOM_DC_SCM_V1_BMC_HW_STRAP1  0x00000000
-- 
2.50.0

