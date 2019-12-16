Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4582312lff;
        Mon, 16 Dec 2019 06:03:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqwRWsg+L2ysBkI93bL8Lu1VQF+sKRpsn162lu7ASRpKv4DvD2nX3e1sUXh7dXsDNFwwMgQ/
X-Received: by 2002:aca:b844:: with SMTP id i65mr10018505oif.56.1576505017250;
        Mon, 16 Dec 2019 06:03:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576505017; cv=none;
        d=google.com; s=arc-20160816;
        b=LjSoQpwZIv7hw7GstR13Mnp2HEpbRhcYH181IM0+i86cKeq/z+b69hK0LQwNbWg36W
         ndXdp+AmaN/MqhngOqnTLNDOg8kEt8nathbPUiTH3qo4B4s+22vUZQ/gVZ6Vjx1lDb2W
         PGNfSIs8lToRRo+8ZchxxVeSiZQw1GRr3VzZTCdZdUuqD4QmkIWCS0H1i/eW76zSU0y7
         KPkZPP41ohnq4UCd48+TZrQN/mIM9oDC66yfWNqYq4JI1FRxXpWOFjRJ7h8WVfgkyluK
         oOwe6BJn91SKAtvTj8vkDSUFLGdOq7e9n3byQO18bUmq8xaM9nrEbeh/P6dWapxU+Nah
         Ij/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=t6+fViJWtutY+mnVSFTppbDOaIGnV3IhxBHpKWV/0xQ=;
        b=BhdM/OZlWCOFXSD53E/ELuLB3kqo0Ds8dD7fEPF8o5EuRY0OpCgqWysJxj7+oP3G/w
         a4bt5L1jQ7HRWeinpMyv6EKKhDYu77tLSZDQ7Le6adwNSSMMmBxVCkcDpGZSDyMFOv59
         MJVY1sg8MDT6Bt51+M0kF3n7uZ605sa7yzpUzSgR4dSQK7mvM7pFMxvVk4hNTP9pfayZ
         IZm6yOB55HjLVtoa+VJT2yoeg83NlBaZ5DR8be488kSJ61SLZBym8V+5yXCYMae8IKlw
         IY56huM9O92UeiSOovrrBkmLyIZGTcWnAs0ePWv6HO96D2vnZplaAcTxvbz2/aJnjd0A
         NaaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LDc6WR51;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t18si10467446oij.133.2019.12.16.06.03.37;
        Mon, 16 Dec 2019 06:03:37 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LDc6WR51;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbfLPODf (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 16 Dec 2019 09:03:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23115 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727894AbfLPODf (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 16 Dec 2019 09:03:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576505014;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t6+fViJWtutY+mnVSFTppbDOaIGnV3IhxBHpKWV/0xQ=;
        b=LDc6WR51wNInv8gAo6dIG2p4Qwracdn5fkDCl2v5mv6i63VkxMq3JkVw5wmwzW1wrqfSuG
        LcL5vKs5QhTwzxKYRTQbz89hFjMJ9A3RdyuGC+dTC5iBbld1eyoNvVs2dPLeCoAxZY80HQ
        0qMLhUGDd2WmPFbW3ssUt/kBL51S7Ug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-EIXWn0LVPAK0NyPECAhhcQ-1; Mon, 16 Dec 2019 09:03:33 -0500
X-MC-Unique: EIXWn0LVPAK0NyPECAhhcQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 060CF8024DA;
        Mon, 16 Dec 2019 14:03:31 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 24908675BF;
        Mon, 16 Dec 2019 14:03:22 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH 01/16] libcflat: Add other size defines
Date:   Mon, 16 Dec 2019 15:02:20 +0100
Message-Id: <20191216140235.10751-2-eric.auger@redhat.com>
In-Reply-To: <20191216140235.10751-1-eric.auger@redhat.com>
References: <20191216140235.10751-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: NSUOxLhK5xWA

Introduce additional SZ_256, SZ_8K, SZ_16K macros that will
be used by ITS tests.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 lib/libcflat.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/libcflat.h b/lib/libcflat.h
index ea19f61..7092af2 100644
--- a/lib/libcflat.h
+++ b/lib/libcflat.h
@@ -36,7 +36,10 @@
 #define ALIGN(x, a)		__ALIGN((x), (a))
 #define IS_ALIGNED(x, a)	(((x) & ((typeof(x))(a) - 1)) =3D=3D 0)
=20
+#define SZ_256			(1 << 8)
 #define SZ_4K			(1 << 12)
+#define SZ_8K			(1 << 13)
+#define SZ_16K			(1 << 14)
 #define SZ_64K			(1 << 16)
 #define SZ_2M			(1 << 21)
 #define SZ_1G			(1 << 30)
--=20
2.20.1
