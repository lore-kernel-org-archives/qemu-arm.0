Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2966346lfc;
        Mon, 1 Jun 2020 03:23:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmS2lxlGPi4TIaokP3f1zp2bibbgIMW4TOEWIZO35/bDsdxoOhyXvR4+Lb8zoHq2TEpLVy
X-Received: by 2002:a25:3555:: with SMTP id c82mr33349227yba.378.1591007025130;
        Mon, 01 Jun 2020 03:23:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591007025; cv=none;
        d=google.com; s=arc-20160816;
        b=o35xe17ECXC6axMVYxHWg2HiOI5JS9NqTmwMXVL8hZkYhaYSP/WueWQ1tmOrDVj4J5
         pCjfvdH+yedcHmozC3kMam+8dTc82dcGZ+ABN0jKGe/03EuzxHNmTGVWkuEK9ciEZUNI
         1gWOr8Cz5aae42M0x8f4pNh4V/KUa0HMSuHrF1QiFGDDKPCdXx8u8ODLodvbP+EaG6iO
         YFheV9dn0sY350niz5FjqxMkz7ar2zg/0LrNbXEcbpCEnKucmv/dtjy1rlvy/qwU3CDC
         osx3Uuz8BfM6rhkoaBA+Hb924ieWnS2rMfE8Yg4dVCt30zlK3Pm16FO2CjhOeYDbUS2u
         JL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/UPpAUpUtL2KKWoVITJwwgcCt+9zGDDeAEZ4zANm72E=;
        b=YtVCMzGBtsHf04ZxQcEzymj10RQUHiI0NY5ttWxEGXGGE8hlJXAUGpbjvnHzTe0A5Y
         /usknC3l/UFMOhDM8Gw7BrKqiSJEWX1P5Usyf1NdFBpHTApcgZ9t1EeA8xLKatBCwO8H
         ne/zRVmbNHP0S96LG1k7/aPQVz4RoTPxHKIUthbqKzYHZ+Qgy7FguvOYDt2kp11rWKCP
         acSc2eGg3mwik0408V9cbDNE7nK6rhZtga4y6ZydKguaj/otFdBNMDbU0pdk69zge9bU
         PpEBla6NjVfiaf3ub6+bmGMY6aVgNneN1U3OO7vzI5hpJQlLe5nRmE+PsX7Z3UyQucr2
         9WZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ciTWmaX+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11si14860983ybm.322.2020.06.01.03.23.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 03:23:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ciTWmaX+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfhbc-0002y6-C6
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 06:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhZX-0008NV-9S
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 06:21:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43585
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jfhZW-000072-K9
 for qemu-arm@nongnu.org; Mon, 01 Jun 2020 06:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591006893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/UPpAUpUtL2KKWoVITJwwgcCt+9zGDDeAEZ4zANm72E=;
 b=ciTWmaX+ot+ET2hN5xMC2New7stMOLhYfbDzaBIv5N7cwAgdNv+C+6UUIVV9DJ9iUv76Rd
 2am+AM6i1yhsgZ38YUC6mOWPw/5j+tEpOhclWGb48RVS1wXUoI6IBrRGSI+mUiIY2+NBx1
 ulvWw8QyZHIZZ2KOBjUx33Mn0teThw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-l44rh5czObW89bthdVDfRQ-1; Mon, 01 Jun 2020 06:21:32 -0400
X-MC-Unique: l44rh5czObW89bthdVDfRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD7DFA0BD9;
 Mon,  1 Jun 2020 10:21:30 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B472D01E1;
 Mon,  1 Jun 2020 10:21:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, stefanb@linux.ibm.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
Subject: [RFC 1/6] test/tpm-emu: include sockets and channel headers in
 tpm-emu header
Date: Mon,  1 Jun 2020 12:21:08 +0200
Message-Id: <20200601102113.1207-2-eric.auger@redhat.com>
In-Reply-To: <20200601102113.1207-1-eric.auger@redhat.com>
References: <20200601102113.1207-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 02:19:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +oDx4m2hXOPs

Include sockets and channel headers to that the header is
self-contained.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/tpm-emu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/tpm-emu.h b/tests/qtest/tpm-emu.h
index a4f1d64226..73f3bed0c4 100644
--- a/tests/qtest/tpm-emu.h
+++ b/tests/qtest/tpm-emu.h
@@ -16,6 +16,9 @@
 #define TPM_RC_FAILURE 0x101
 #define TPM2_ST_NO_SESSIONS 0x8001
 
+#include "qemu/sockets.h"
+#include "io/channel.h"
+
 struct tpm_hdr {
     uint16_t tag;
     uint32_t len;
-- 
2.20.1

