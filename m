Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp241788njb;
        Tue, 7 Jan 2025 07:36:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXRzc/dO/G746VgJHege63t/XaDXn/1KElyds+Jt3gBZxzZTdLH/UwAaWbU7Y4OP4k3syiN/30TCV3dRA==@linaro.org
X-Google-Smtp-Source: AGHT+IFa9tCP/Pm1QXYEVbGw76dlo6FTizgsSm2EWI1lNHw3+7djmkAUf6FWUtiWfoADf6co6+Jx
X-Received: by 2002:a05:620a:394a:b0:7b6:d710:2282 with SMTP id af79cd13be357-7b9ba80ebc6mr10916660085a.49.1736264203263;
        Tue, 07 Jan 2025 07:36:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736264203; cv=none;
        d=google.com; s=arc-20240605;
        b=h9sRhgsvtBz+oUZIFl5fASSrAxTfjXmP2dH0ifJteYrbswszLJVXDJsLqsXXKW5Hz6
         imKxJgG8Fb4PJZlte5gpJetxdJDYq2MHkppiDBV7UtUkUDz6A7PvlmotmPbYdnl2t8vR
         zE16I/AkUVDeYAzKi//ypwOqXF24LK5iY+12nr2KQldYH6nnGRcyjakCuiN7gmEV4dm6
         /gTZLEt14APO8X4R806a+IhwuTwqY/jLdlShhIW+YUmDtsCIZi3zDczhTpItOw6Wzii8
         TRpLDFtOBlKM4ak8X0W39VoyBNddqP/P8rCK94WSXW+JY5CRmJ0U3SPe3r3UDKaI6duI
         tJcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9VfOLVY4PKP7+JfEplTNZ+7N7DCAftr7lf3bLl4oJc8=;
        fh=2A4XrmpWSce8Hg7gb/jK7T/bzdECrSdzPXJ+gvyt/8c=;
        b=GlBABvNU3/vsiOZpP5n75yGqNJFf3WTSTk6UhO2Gqp63NuiE+FXOU/T3D0YwzbaZC6
         217ZPzGtW7CjBVDocedIBw3k0mxQySW+HkJOQWYc43qMnPJG/B6IZFlDwsk/m7Q/02LQ
         /kyD56iUBpLjrBdQH/BZKQ3ySqNZBa4ub0wYLmOFoZrtOAcQIPVUZkRKVjGvbPeqefbN
         2t0Y5OBXOh27TVtYYyKG3qOcEoiFMQ7Znh5RCIhDX4U48Kabu9wNg4AAIR8uO++N4Hna
         m4EJL8Euiu+RjUMMigFEV6gN+jBORHNUrkpECEQkD9P4C2OtmYKuYe+u5ziN1Hjz9Kse
         8kKA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NOlG/wTH";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac4efd9bsi4631755785a.479.2025.01.07.07.36.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2025 07:36:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NOlG/wTH";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tVBbJ-0003cz-Cf; Tue, 07 Jan 2025 10:34:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tVBbG-0003XF-VQ
 for qemu-devel@nongnu.org; Tue, 07 Jan 2025 10:34:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tVBbF-0005AY-IZ
 for qemu-devel@nongnu.org; Tue, 07 Jan 2025 10:34:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736264072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9VfOLVY4PKP7+JfEplTNZ+7N7DCAftr7lf3bLl4oJc8=;
 b=NOlG/wTHOXkCTYJamcrRQ58QSXUSijQSArL1pyrk2k4JT+5WITctcTodcTo5MMOFWBBB0O
 +7Nwjao6IMyF4GNaxjPWfigSvYiojzSeCEFA/7NGm3Hl+1jb+WNdUlKS1vqZAu93hJQxZb
 TVgxoSBdT90ohc9OfvmCQvhd7f/HV1k=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-412-_SqfRP5PNLqZT_qxB3-w_g-1; Tue,
 07 Jan 2025 10:34:29 -0500
X-MC-Unique: _SqfRP5PNLqZT_qxB3-w_g-1
X-Mimecast-MFC-AGG-ID: _SqfRP5PNLqZT_qxB3-w_g
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C85F51955D53; Tue,  7 Jan 2025 15:34:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.66])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BC8C519560A2; Tue,  7 Jan 2025 15:34:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E1C0F180060A; Tue, 07 Jan 2025 16:33:54 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, graf@amazon.com,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 21/21] hw/uefi: add MAINTAINERS entry
Date: Tue,  7 Jan 2025 16:33:48 +0100
Message-ID: <20250107153353.1144978-22-kraxel@redhat.com>
In-Reply-To: <20250107153353.1144978-1-kraxel@redhat.com>
References: <20250107153353.1144978-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.437,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: sozfvdEbozje

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2101b5121756..ad2bce45a076 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2785,6 +2785,12 @@ F: hw/hyperv/hv-balloon*.h
 F: include/hw/hyperv/dynmem-proto.h
 F: include/hw/hyperv/hv-balloon.h
 
+UEFI variable service
+M: Gerd Hoffmann <kraxel@redhat.com>
+S: Maintained
+F: hw/uefi/
+F: include/hw/uefi/
+
 Subsystems
 ----------
 Overall Audio backends
-- 
2.47.1

