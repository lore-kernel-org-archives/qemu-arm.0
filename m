Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp66784lfg;
        Tue, 16 Mar 2021 21:47:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIaUl598Dro0jGR/21+vIHyeKflaW3OW7DmHZUrccqoywjVt6arYShUmxxo26MLmCzXm9U
X-Received: by 2002:a25:7bc7:: with SMTP id w190mr2825696ybc.184.1615956420754;
        Tue, 16 Mar 2021 21:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615956420; cv=none;
        d=google.com; s=arc-20160816;
        b=C8qtofNBZakMK38uB5dPBn4V0R2ycyr1Uj5QeyqsPQf+LdUGSWrPivYxmnX3q7VBBg
         xbCXMX5LEuvU0yT5EMLJ9NtDMqfkPYBX1OeTibDjByeQydgojRMsH3IN0YgAu9BhiQCf
         O7xp0e6B3IjOfSFTIz9XeAe3OpoMICnDwVkcgQCqB/Sq2aG5/Rp8MBvi+EjAyIkjJrXr
         tjoZw68RElbZrgcwHcdUp4dyZAmZd1JzL4hexcFhw6Mc+oviJOQ/Nv9Lol/ZMmhakWjb
         SHf8fJuiR3yZNThbRhJG8mXP9JCZyv5yUIcm4s3fKPVkSlNdk9gR56TsFa9EpRe/F1B9
         F5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=vcyrGEK3wQ9liRA2vtdVMIVInNJMXL7nw/rK+TiPnaE=;
        b=lvhfn7ZVbl7WpgxnMFn1IfXGWPA4qAc5o36udPgbZPhShUtc8/UDyGTQjC1jI75jwh
         /xPywYanlC3z50Jgw0PfuhYXfri7Dn2RDZ2PSrqn3uC80vcom7XQHExE3uSW5eL5zTZL
         JC8/a5gl02YU+xV50EzyP+hDSwQMVEetp40FS7HneujumWlomCjDTcGhsx25vyBY3Id0
         TKCqAu3M5X1BGP/47oRSrByOdRRZcb7v1jEA4UiVaOkzYcnAETGAhySOYG48x+Sz1BmR
         dI2KwDYfRnTS3wm2IsXMyR3Bflf3u6A2rmE5h5CvDweVFO3hbsb7OMlzWBIeUygtOObl
         p2TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OHd967Nj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si18254011ybl.52.2021.03.16.21.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 21:47:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OHd967Nj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMO5E-0000GI-3o
	for alex.bennee@linaro.org; Wed, 17 Mar 2021 00:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lMO4P-0008Fc-NT
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 00:46:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lMO4L-0003x3-Oo
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 00:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615956364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vcyrGEK3wQ9liRA2vtdVMIVInNJMXL7nw/rK+TiPnaE=;
 b=OHd967NjOWwS/cBdAcwCIoGIAAcMeRliOFzqPS4yv/AvJNvboW2fHf390Wx6fO33fcMnq6
 M9cZOg6IREho9IR3ACyq6Ok52dvtceehQkMHkFHO87IcG1GQEVgoqb7HflHAb8tCkuz3La
 NJBWaGZJptSyd6g9Fg4ZkXQK9fKBGVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-WFpAOcPGNLmGQwVlzX8g-A-1; Wed, 17 Mar 2021 00:44:52 -0400
X-MC-Unique: WFpAOcPGNLmGQwVlzX8g-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E5B681746E;
 Wed, 17 Mar 2021 04:44:51 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-175.bne.redhat.com [10.64.54.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6775660875;
 Wed, 17 Mar 2021 04:44:44 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/char/pl011: Fix clock migration failure
Date: Wed, 17 Mar 2021 12:44:41 +0800
Message-Id: <20210317044441.112313-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, luc@lmichel.fr, qemu-devel@nongnu.org,
 f4bug@amsat.org, shan.gavin@gmail.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8GPZfqjh3jfR

There is a added clock to trace buad rate change since v5.2.0 by
commit aac63e0e6ea3 ("hw/char/pl011: add a clock input"). The added
clock causes migration failure. For example, migration from v5.2.0
to v5.1.0 can fail with the following error messages:

   qemu-system-aarch64: error while loading state for instance 0x0 \
                        of device 'pl011'
   qemu-system-aarch64: load of migration failed: No such file or \
                        directory

This fixes the issue by reporting the baud rate change at post load
time so that the clock won't be migrated by sub-section to avoid the
migration failure.

Cc: qemu-stable@nongnu.org
Fixes: aac63e0e6ea3 ("hw/char/pl011: add a clock input")
Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/char/pl011.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c5621a195f..401bd28536 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -322,20 +322,20 @@ static const MemoryRegionOps pl011_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static const VMStateDescription vmstate_pl011_clock = {
-    .name = "pl011/clock",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_CLOCK(clk, PL011State),
-        VMSTATE_END_OF_LIST()
-    }
-};
+static int pl011_post_load(void *opaque, int version_id)
+{
+    PL011State *s = PL011(opaque);
+
+    pl011_trace_baudrate_change(s);
+
+    return 0;
+}
 
 static const VMStateDescription vmstate_pl011 = {
     .name = "pl011",
     .version_id = 2,
     .minimum_version_id = 2,
+    .post_load = pl011_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(readbuff, PL011State),
         VMSTATE_UINT32(flags, PL011State),
@@ -355,10 +355,6 @@ static const VMStateDescription vmstate_pl011 = {
         VMSTATE_INT32(read_trigger, PL011State),
         VMSTATE_END_OF_LIST()
     },
-    .subsections = (const VMStateDescription * []) {
-        &vmstate_pl011_clock,
-        NULL
-    }
 };
 
 static Property pl011_properties[] = {
-- 
2.23.0

