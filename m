Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp579874lfb;
        Wed, 20 May 2020 06:28:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKWZJD+iO8Ts3q8qSs2oUtQMdVHtEQMa7JWJGXjuU3kaXPKx9iJMDrhjEXlKsbWsC4ev1X
X-Received: by 2002:a37:a3d6:: with SMTP id m205mr4352730qke.241.1589981299666;
        Wed, 20 May 2020 06:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589981299; cv=none;
        d=google.com; s=arc-20160816;
        b=gYZAWESl55EX2UDYucWUQtCtquRIbPIaXVU90/J998mlUOVaR4VMNZpvwXmkXm22tU
         ylL8X6J+DOiYUiMwEPllVwmVdZAzdAtPFC9fwO1qXbI5IPtvpP2Eg+dmnsHlK4rT9c3+
         TTKNtZGI07vEHqFjYBqkjU3gt/hPSkkEgwVgBv8SpISyp5KSJ68f2Nl48+HYFBwpLvNo
         MTM2WuPITVlJJd6pcilYdu7jIfPNrE5PGM+EJfiTD1PhOqOcqi88AnMzL324kQg36Gq0
         j5FMnSjRe4Z2R7gEj1TFPG/qH5PMjDEED/Kthe/IaEtULBmFdMobzKbPLcy4af4SOAvj
         rNXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=U3Kp89IQYcNRqAlCdrRlNpaRks/G1xSNRxYkCXPLrAk=;
        b=GN1t+BxoiuPFw/Go+6b/+J0BWLPQPX7GxV4wqADhXC5dGikLwYHFqZKFC0agB4+q1x
         rzZk2o7DA8XsiOI0W2V9bXZq3PHgJvvIjfNM0WV/I0IGvBVO6d5aXwNhm9UHnSPy6rO0
         +7+ecUt9a0Jdl9aOoO7uVVoTYaiV4Z1nYLUzhBzDSxzTNnqlLmioqNzccnYNTBFjFlB0
         W+uSe2hMJScj2w0NgSgr5xOhFRasMDVKiNKXndxCZKg0qa5uzyFNRnf814g3tJKn0vFS
         BAVAmDZh53HKGl1uVlpKnYyTNy5EkeCZfXr00WLyyIkayi0MBcaU2DK7Y/y61hXJmxf8
         NNsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="MJA/PaOu";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22si1493737qtq.95.2020.05.20.06.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="MJA/PaOu";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOlf-0000x7-3z
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOeE-0002Fx-8i
 for qemu-devel@nongnu.org; Wed, 20 May 2020 09:20:38 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46066
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOeB-0000Im-Ju
 for qemu-devel@nongnu.org; Wed, 20 May 2020 09:20:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589980834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=U3Kp89IQYcNRqAlCdrRlNpaRks/G1xSNRxYkCXPLrAk=;
 b=MJA/PaOu2XQhrgEnEUuX/Js9lxc+h6kDe77b5aRkVNxEU+1MsHJ/7VLQhjwkCP7jjrzLCa
 k5UDRzisO1pcbUKS2OSBR7QXMWjzLt+VBq+yCsZozhkAjXxO5/7F1sUMIZgeZyNtnq6GNB
 Xp/zvKrMlMUMuQD/gqac/wnk6Fpz3tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-qFKAUKJBPm2ybdlSypxsdg-1; Wed, 20 May 2020 09:20:33 -0400
X-MC-Unique: qFKAUKJBPm2ybdlSypxsdg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA5F5835B45;
 Wed, 20 May 2020 13:20:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52A3A10016E8;
 Wed, 20 May 2020 13:20:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2FD3C9D61; Wed, 20 May 2020 15:20:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/22] microvm: use 2G split unconditionally
Date: Wed, 20 May 2020 15:19:55 +0200
Message-Id: <20200520132003.9492-15-kraxel@redhat.com>
In-Reply-To: <20200520132003.9492-1-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:22:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GbEWjVUP3TW9

Looks like the logiv was copied over from q35.

q35 does this for backward compatibility, there is no reason to do this
on microvm though.  So split @ 2G unconditionally.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/microvm.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 867d3d652145..b8f0d3283758 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -170,23 +170,9 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     MemoryRegion *ram_below_4g, *ram_above_4g;
     MemoryRegion *system_memory = get_system_memory();
     FWCfgState *fw_cfg;
-    ram_addr_t lowmem;
+    ram_addr_t lowmem = 0x80000000; /* 2G */
     int i;
 
-    /*
-     * Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
-     * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
-     * also known as MMCFG).
-     * If it doesn't, we need to split it in chunks below and above 4G.
-     * In any case, try to make sure that guest addresses aligned at
-     * 1G boundaries get mapped to host addresses aligned at 1G boundaries.
-     */
-    if (machine->ram_size >= 0xb0000000) {
-        lowmem = 0x80000000;
-    } else {
-        lowmem = 0xb0000000;
-    }
-
     /*
      * Handle the machine opt max-ram-below-4g.  It is basically doing
      * min(qemu limit, user limit).
-- 
2.18.4

