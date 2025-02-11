Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp192493njb;
        Tue, 11 Feb 2025 01:26:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVgrdYnMTMoTY8X0GlN0RjeNYihbnp8iPYqB16K8eXhaoTF0qlmEWyLnONVf4VQdQqIbcSHhrgmKwIoAw==@linaro.org
X-Google-Smtp-Source: AGHT+IGWJJOygy7PnVDlLHMfSM+jgeShvExlcKaWJPhcmbr54zc9HvJkh75PA8fKmf6YPzc1zjQn
X-Received: by 2002:a05:620a:f10:b0:7b6:d3e5:4f45 with SMTP id af79cd13be357-7c047bc6e72mr2534762285a.30.1739266013287;
        Tue, 11 Feb 2025 01:26:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739266013; cv=none;
        d=google.com; s=arc-20240605;
        b=bHJZ0LnvGHqliEVIwUjTSmoEgRDiGtEWN/nDoAZrhQ4tsT9GsDX4dF7sZpKoz82Vll
         6i38h9sRujAGZmv0HDk4uQbXG5inZXw66eyV+hI4N7k0LOKEWDM0T9X1waWm6yBg+vNG
         xKTN57y3VIn4vAwfR1s/EVe5TnwUzvnrsh7XaGLcFFAIXIW5Lt7wwUTBY/F3AwQv2KMC
         +wntOQBkF61rkNvLMgso4DCNNE+yVanmUtYA2Rf782Ps3qsuWifKXHNnTa/PSqDHHATz
         LBXVcGOkdvM9sf08u0dZS42Dt46lSmji5itDMOnCk9C/I6DGPRLG8eQWlsRP6wYu390O
         Fm9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9o2yl6RnjvrhJvb51mPTyqR+NWkSQbSCqslutYxJgQU=;
        fh=e1SboN20/jHvoiD1YSHiGEBjk/mnJDcFYjKWtsBcI2Q=;
        b=EG9SblM6ftE2F8Ch7hFTIj/7UWSD4gSzhp2/76IM6M4l10II/uoGhcWJQF8r2JJ5Fa
         mtyF3lAL+CGg6zv7Z6v/40TIOjq5sqKzlVOjIsnk4FERijQkjtv2DA2fnArXcQB0srt2
         C9HppUqYHWYoFxKT2wtFUnGc/6VKJ9t7CaaIUWez2wwAu/+5ytsQ2nJ6ghDKHfIn/B85
         SILsz0WQuDZEWL2IlfJIPDuLMT/en5ZbR65+iKrYRiaZ+1xoEpCZtTJ2sx30skHilWU9
         r1J8KbH1tnDahxPkmmJFg6faTOiLT7HCKBul++QDLMXD76xVehyQIaqL9kxdPKOTvxQU
         ABRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YPu6+DP7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c041df5933si1084783985a.34.2025.02.11.01.26.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2025 01:26:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YPu6+DP7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1thmVC-0003HB-IB; Tue, 11 Feb 2025 04:24:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmV7-00032C-7q
 for qemu-devel@nongnu.org; Tue, 11 Feb 2025 04:24:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1thmV5-00039t-EI
 for qemu-devel@nongnu.org; Tue, 11 Feb 2025 04:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739265853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9o2yl6RnjvrhJvb51mPTyqR+NWkSQbSCqslutYxJgQU=;
 b=YPu6+DP7cHZN/DxmBn0C9WzLrEzmgQD+KM2PMyKse5YnvMoLCxcCv5XgFU34eqr03sj0uG
 /Y8Um6FGQP58VJ6VBtCxEQLzKzhk/IgYgFNM4ljD4JM7jKer770L4WL7XPRf/2blCQgzN3
 QI5tS9M01IglhP+VWywB8VyLMf1tBek=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-662-6eQoWkjVOQyN_vPbLCHqhQ-1; Tue,
 11 Feb 2025 04:24:09 -0500
X-MC-Unique: 6eQoWkjVOQyN_vPbLCHqhQ-1
X-Mimecast-MFC-AGG-ID: 6eQoWkjVOQyN_vPbLCHqhQ
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6F9C2180087A; Tue, 11 Feb 2025 09:24:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.57])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BD7E618008CC; Tue, 11 Feb 2025 09:24:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1E947180062A; Tue, 11 Feb 2025 10:23:26 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, graf@amazon.com,
 Eric Blake <eblake@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v3 23/23] hw/uefi: add MAINTAINERS entry
Date: Tue, 11 Feb 2025 10:23:21 +0100
Message-ID: <20250211092324.965440-24-kraxel@redhat.com>
In-Reply-To: <20250211092324.965440-1-kraxel@redhat.com>
References: <20250211092324.965440-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.388,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: zkWnXqa1GbeU

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0091bd1a90f6..cd45771f5cd2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2799,6 +2799,12 @@ F: hw/misc/ivshmem-flat.c
 F: include/hw/misc/ivshmem-flat.h
 F: docs/system/devices/ivshmem-flat.rst
 
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
2.48.1

