Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp431614lfc;
        Thu, 3 Sep 2020 04:11:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLkdqa54CkbJBoe5AIJYAkKoFu46rN77QpdJWk2HpbPeTozEmCXwHywB6rrD9hTxmFowPG
X-Received: by 2002:a25:9b88:: with SMTP id v8mr1995216ybo.96.1599131485182;
        Thu, 03 Sep 2020 04:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599131485; cv=none;
        d=google.com; s=arc-20160816;
        b=wagbMY04dGRxioaIZjiRVcoYbW3oeHXZS9mhmPtir/iMOBPVDlRG2xmSVXuohM3gNS
         z0QrPY2bw+PQwAF1MtQ0Xn1Hz7U/Jf3waaFPaHMRZZoun3avxmr+qAfshag8/fnrpKQX
         ZpND0h9Zk6/b/f5KamLnWQ34nwwncxf872IXkhvTX+Ea6WsHuDHOQd0noZFxpSaoD9O0
         UtKcDsmxch7sIoH06+3OXQ+w9i3HQys8U+iYcckBis4YPWQ0wG3iB8heeJfiNuuNWHMW
         +QSMJwP7d+igfMfJnZNfj8tM2TDJqf4amYnugklVuLr+JoWObmyC4DLh3SYfjHvxXBT8
         8IWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QoQLqcCGXTEq/TAmIUw2m4awB0M5QrT2MRC6GDSSjNM=;
        b=ydnoQ/+eik0cyank769ksxQ/ZwzFJ6743WZSr4E8h4GwFSzFzVom4IlobEQygHbYj2
         s1Xa5JeG/Wyf6XQglUyvC+6T80cJDB4ppTrPfl9rNbhmQ51B5NaUCfCJSctCKdHS1myT
         akd8kWrO0LNRhqVhttmIdYC7PO++56Mc+fIXMcVB9m2mNsvkYbQ/n7YElkk1AyUBuqK1
         I4B6HcSSSRIqpuUECEYulYYhheL9tLfjavmHmBj5l2ZshYjhOd5wSSzyZ6XkONCXC+IL
         lX3tY0hljDPR7n83/jRkjr0af9jSYC6iK4+as5ZY60CtAKe6A2QA7shufwk7+FYYj6FY
         R8Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ivRY8BgZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h65si2635931ybb.159.2020.09.03.04.11.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 04:11:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ivRY8BgZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDn9I-0004ow-Fw
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 07:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn7R-0000ue-Os
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:09:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44197
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn7P-0005wS-Ux
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599131367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QoQLqcCGXTEq/TAmIUw2m4awB0M5QrT2MRC6GDSSjNM=;
 b=ivRY8BgZ+ti9tJmlZ67Wli1N7as/5EAOtR0woudnf7uy4Cx8/g1COXeAjehJReyhERMUVC
 Zw2pH4CyfBZ2+OG+p9obuFzRaRq1E0S253swZNeP8WoVbaU9vaNfyfi5OUIJuLc6FK6drL
 bOiIHs44T1DUZyoWh3VUcBY+vJ/CHxI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-ZBzMWD-YN0in5cpvgu2oNw-1; Thu, 03 Sep 2020 07:09:26 -0400
X-MC-Unique: ZBzMWD-YN0in5cpvgu2oNw-1
Received: by mail-wr1-f72.google.com with SMTP id m7so935214wrb.20
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 04:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QoQLqcCGXTEq/TAmIUw2m4awB0M5QrT2MRC6GDSSjNM=;
 b=CEvNhVpc0Ij7K1sl3FKpoeCYB2M1pmoVFES1M072hkMt2w+s93lGkq0s0BXWMj5eHk
 zf8+TIHCqxdVBAUwvnwvQSOQi4rvHUxVT+Vt2gOIdzMCDVbWJ1B2B0v6QfUTJ8GMRvZr
 C/MRIpks6vXvLKE7dPQsPf2U+9r2CLxWcqTuDhpgV0FGUWYiRmdBBCJmT9GZrwxhiPDH
 SCmWYzBiP2tH7C6QQpE/Y+2a9bFCROkRz6vvbdhmtmTKjiEZu6stup7THFAK3ahqKCn2
 lCiurd3W+TbPx5plxdC27a7XZx6hREB0u8bV0PNyPQUDnNQZT558u/h0UoeZDnRAycYT
 Lxyw==
X-Gm-Message-State: AOAM531etBejghp8DHc57h6d6y2lukgGFTWlzRDWHmE4Mrzi1nZlQ7Ym
 xEpTK2K7jrvTub72UPj2nj4pWDv22IHVd54W3wpIezu6jrOS2IkPWpIkC4+tZCNV7DbfHip0bmF
 j2RVvuoaW8avc
X-Received: by 2002:a1c:96c5:: with SMTP id y188mr2031721wmd.72.1599131364950; 
 Thu, 03 Sep 2020 04:09:24 -0700 (PDT)
X-Received: by 2002:a1c:96c5:: with SMTP id y188mr2031677wmd.72.1599131364785; 
 Thu, 03 Sep 2020 04:09:24 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id h6sm3675054wmb.22.2020.09.03.04.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 04:09:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/12] docs/devel/loads-stores: Add regexp for DMA functions
Date: Thu,  3 Sep 2020 13:08:27 +0200
Message-Id: <20200903110831.353476-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903110831.353476-1-philmd@redhat.com>
References: <20200903110831.353476-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 00:24:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, "Emilio G . Cota" <cota@braap.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Joel Stanley <joel@jms.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Laszlo Ersek <lersek@redhat.com>,
 Robert Foley <robert.foley@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Tony Nguyen <tony.nguyen@bt.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Alexander Bulekov <alxndr@bu.edu>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TDuZZfl2kB6j

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/devel/loads-stores.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index 9a944ef1af6..5b20f907e4d 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -477,6 +477,8 @@ make sure our existing code is doing things correctly.
 
 Regexes for git grep
  - ``\<dma_memory_\(read\|write\|rw\)\>``
+ - ``\<ldu\?[bwlq]\(_[bl]e\)\?_dma\>``
+ - ``\<st[bwlq]\(_[bl]e\)\?_dma\>``
 
 ``pci_dma_*`` and ``{ld,st}*_pci_dma``
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.26.2

