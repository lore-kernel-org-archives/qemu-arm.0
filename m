Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp338470njg;
        Tue, 25 Feb 2025 08:37:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUWtjR05Qb0q85lGrE37JTZ2dF4QfVrp0hOXMsfZ6R1odUYnUt8KTGKKQQaaSkOYuhItRBFGQg36HUZzw==@linaro.org
X-Google-Smtp-Source: AGHT+IGDs6Pd3y5HjdEPpRnPJI4S5VEX+eSgCbArksJEzJsbK+cl5Isy/F2e92AiIERmusQ0qf6Q
X-Received: by 2002:a05:622a:1a9b:b0:472:221c:688f with SMTP id d75a77b69052e-4722473e5femr220395091cf.22.1740501434476;
        Tue, 25 Feb 2025 08:37:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740501434; cv=none;
        d=google.com; s=arc-20240605;
        b=g1OvxXYmLxyFYrgzNclsvLDBdwGeds3foYKwba3/n1zUkRZ4hwHfrZN5VDUDE9LSsS
         1+9UcvMrOuNvhQL7NdaQCBkLRRZaKsIFpLitVRBioKx0ZPgS83qzuJxRgfF3tYSEWkQu
         cHcQhvSKlydKaDyOhclxj3EXLoJeDM05oowTdJJAKWaNXDQzUuTIzRQZMD8RWKhMfuCv
         4LrbW7UQxDdEsTIkQzo8eQEIpP6p/8/D31EIEiTdMkqqwVot5CHXjMfgyvSloiPjU5ZV
         9Gx6M0GGsnXKe+g47UoiqWUuMCQgzgdiVFgDa6kxOp3z7qtIATJDyMXSM3CeEbLenTyT
         jVzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4wqYQvkIUpzaWuflEazQgBVji+RgmWdrCWXiKb7V+BA=;
        fh=mrCErM5HzBZPMbWrfhKaLB6Op7DKxeI6me6fB6ug8DQ=;
        b=GBeLpvytOLcaj5PKrZTz9sapW6EeW1Knb/dc/CW28M494go36HMncZZj4i/rA+kZNO
         fJ4B2hds4HA8Tn6ayuSnul4vr+iQPYElJtskLdNkVNzA9vd0dYaG1sxo8MLgf4e0vGL/
         KOrs11uX11xbXim6nUkxB2wmJCjskb7YxcorUW0AedCXudyiX3yjp6h8q5J6S/G2N03/
         aAJ66J4Yy1m1S3Np5Uyu//wLDPuDXQ7RUGCDeHGo4VCsGj+7IrgcGG+/rW2yp5HsPaWO
         Dyx1SB/xXBcDJfK1Xv8TEcaGefddylkEPvQvn/p8sCyo7kA7s+k0SxDgZR9tIKR5zpku
         8Exw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BPLXU4ej;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47377e1d106si19655541cf.108.2025.02.25.08.37.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 08:37:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BPLXU4ej;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tmxqM-0001WF-Rm; Tue, 25 Feb 2025 11:31:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxq8-0001Aw-W1
 for qemu-devel@nongnu.org; Tue, 25 Feb 2025 11:31:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxq6-0006d4-MR
 for qemu-devel@nongnu.org; Tue, 25 Feb 2025 11:31:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740501081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4wqYQvkIUpzaWuflEazQgBVji+RgmWdrCWXiKb7V+BA=;
 b=BPLXU4ejI37d6ShcMFl4P4SjLdWZsWhEbWFueQd4RbBG/kFFxbkM/R2EJX8qFGYVPXdpXC
 gNjrAeAvFzNtPPfFZWxxaxW3RofPFhHKm0VrXcEurr3Boib159wkmGkaoo7xfVk+2RhFzk
 FCnYXP8hQ/f4gCNfCDtzpKHjQuh+25A=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-639-JGGkppH5OkGECHUgasny7A-1; Tue,
 25 Feb 2025 11:31:16 -0500
X-MC-Unique: JGGkppH5OkGECHUgasny7A-1
X-Mimecast-MFC-AGG-ID: JGGkppH5OkGECHUgasny7A_1740501074
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 395AB18EAB3A; Tue, 25 Feb 2025 16:31:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.219])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DF30519560AA; Tue, 25 Feb 2025 16:31:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 22F7E18007A2; Tue, 25 Feb 2025 17:30:33 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Ard Biesheuvel <ardb@kernel.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, graf@amazon.com,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 23/24] hw/uefi: add MAINTAINERS entry
Date: Tue, 25 Feb 2025 17:30:27 +0100
Message-ID: <20250225163031.1409078-24-kraxel@redhat.com>
In-Reply-To: <20250225163031.1409078-1-kraxel@redhat.com>
References: <20250225163031.1409078-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: HpM1s5HB6QC5

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1911949526ce..451fc33306dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2807,6 +2807,12 @@ F: hw/misc/ivshmem-flat.c
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

