Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp432103lfc;
        Thu, 3 Sep 2020 04:12:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYQiZDwOnGuJ9jDHc3D0mXrvHdKzo0+aCGPAj61FBqobeMszcRcxw7Mzu3LifUcjQroH8f
X-Received: by 2002:a05:6902:6c1:: with SMTP id m1mr1946265ybt.252.1599131528981;
        Thu, 03 Sep 2020 04:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599131528; cv=none;
        d=google.com; s=arc-20160816;
        b=GhQsSUJuS3pqLanyqNvyPxcglJ65ebBwziniGobWkSUOzD5XOaYdS29Nk29FPAud/x
         cTT5QTP8u3ia/y2vJVwqctvrjMQT2k/uGZQ7QCNCK4YUYaVJ8OxdYnTVLJEvVQT2KYNc
         78Gk2NbLmr0jzFziwKycO2hd+Zx/LcuMZhIp8an5pEl2feH5mYgOLXkSM0BHmPGT04w/
         HBVh7p7Zq+Cwz4R1bg7s8+N5fLJD+r6Gs596rU4VIaD83UB06TDQIXeoQLJaTA9WXlku
         RP1696E1fNIAmw2adOFu/OecQPwIRwU0er4cANKH3kmjlfMc7bHKn7P2iway9A2vFRRI
         7D3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9GnpNx8hKziNiqdzN01AImO2FtSdDZqIBcQzFpkVYA0=;
        b=QvARCk/qU8v6t09zCrkhXCA9fXNxLT+4quAFI758BWz6yGzf0mud6DJlM5gPB6SWT0
         IB6cVU1wcZdg87E3eVJwt60ayYGmYZNgj7x+IZ4Mvxv+9Ti3GneabgDdWRP06yxkjFeN
         OJhdAuK2iDTQFgXFrABicQsKve/3aowbm95qSvnUxZBTr5RdLxVn2Ooy9lVMBrkiQr4k
         8snOake/IieEgplC8ZQanZ3CfBX0SJk2UgGasMjp5b9ielFkcmm8WiTCh8vT/tBjm9zW
         NBkWs1H8VDHY6LDCuACRMF9ssh1KtGV9XAETQ+mr8SNkBHwDu/w+hVu6iKhP9jbF045+
         vH6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TNDxlO23;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v137si2805677ybe.62.2020.09.03.04.12.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 04:12:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TNDxlO23;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDnA0-0006WF-9e
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 07:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn7r-0001RY-8Q
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:09:55 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37151
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDn7o-00060c-LL
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 07:09:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599131392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9GnpNx8hKziNiqdzN01AImO2FtSdDZqIBcQzFpkVYA0=;
 b=TNDxlO23SAmoDT630w6aRuh6TlsXR98/5QJ3P+aKnR9lhpeN5EoG8l0mG3Pq4wgyUhfnR3
 50eWbqWOnOmRz1+Z/K71NwlaBw09aen6LO5iIYC1AEoqOeEx9NHf9KrA7QolMY3CMCbpSa
 sxFrMA95FE5lq+KuYN09texMvOwz8xQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-JxxQ1dWLMe2_Z1YhKMO6vw-1; Thu, 03 Sep 2020 07:09:50 -0400
X-MC-Unique: JxxQ1dWLMe2_Z1YhKMO6vw-1
Received: by mail-wm1-f72.google.com with SMTP id z1so857102wmk.1
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 04:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9GnpNx8hKziNiqdzN01AImO2FtSdDZqIBcQzFpkVYA0=;
 b=UDOE9LqwLP7TKHs//O0d1Bsnf3EZhEezIHrKj1wxSahZH72QXlB5WgLu5sUN16q5Ey
 xruvMWGiLds6jhxPn8JTkghoZTI7GyWq2Qf9NJbS+R0McGfY8NoT4tfr0POkfqueG9Je
 mO227SBsdwvAuS2t3yGbrqVs44fnVb6guudZd9FO/OWrjcAvs9Q+i5NUC/ljo4h5Ftpt
 OgD0sAvExiUs+rJIRd3aoPCx7jCiM1dW5oW46TlzTq+soBo4mZNvNQGcLMNxpOWyXYqC
 s6xH2wfM3sFLtAQvi493qe7hILQN6qLXzGTdV3qlYB1TXN8mEkwCyteIGwjQ6aBUSRrG
 8fFw==
X-Gm-Message-State: AOAM532Wk2TEEVvTRMzbk6oSaP+SVn0i0c9yFP3sc/LYbG3md5KQ/XbG
 M6s9EZEMB1CLYsXXA8S2C/c5Wiw0oKgT+zcK47AJ3dzLHSg+ELgu6R4VeniSSWGd/TawmzTWh44
 pTI/WTk3vH823
X-Received: by 2002:a1c:f003:: with SMTP id a3mr1951195wmb.170.1599131388971; 
 Thu, 03 Sep 2020 04:09:48 -0700 (PDT)
X-Received: by 2002:a1c:f003:: with SMTP id a3mr1951153wmb.170.1599131388703; 
 Thu, 03 Sep 2020 04:09:48 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id q3sm3709070wmq.12.2020.09.03.04.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 04:09:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 12/12] dma: Assert when device writes to indirect memory
 (such MMIO regions)
Date: Thu,  3 Sep 2020 13:08:31 +0200
Message-Id: <20200903110831.353476-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903110831.353476-1-philmd@redhat.com>
References: <20200903110831.353476-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:28:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: xCuzhlC3JkBz

Assert DMA accesses are done on direct memory (in particular
to catch invalid accesses to MMIO regions).

Example with the reproducer from LP#1886362 (see previous commit):

  qemu-system-i386: include/sysemu/dma.h:111: int dma_memory_rw(AddressSpace *, dma_addr_t, void *, dma_addr_t, DMADirection, MemTxAttrs): Assertion `dir == DMA_DIRECTION_TO_DEVICE || attrs.direct_access' failed.
  (gdb) bt
  #0  0x00007ffff51d69e5 in raise () at /lib64/libc.so.6
  #1  0x00007ffff51bf895 in abort () at /lib64/libc.so.6
  #2  0x00007ffff51bf769 in _nl_load_domain.cold () at /lib64/libc.so.6
  #3  0x00007ffff51cee76 in annobin_assert.c_end () at /lib64/libc.so.6
  #4  0x0000555557b48a94 in dma_memory_rw (as=0x7fffddd3ca28, addr=4064, buf=0x7fffffff7780, len=16, dir=DMA_DIRECTION_FROM_DEVICE, attrs=...) at /home/phil/source/qemu/include/sysemu/dma.h:111
  #5  0x0000555557b487e0 in pci_dma_rw (dev=0x7fffddd3c800, addr=4064, buf=0x7fffffff7780, len=16, dir=DMA_DIRECTION_FROM_DEVICE) at /home/phil/source/qemu/include/hw/pci/pci.h:791
  #6  0x0000555557b47373 in pci_dma_write (dev=0x7fffddd3c800, addr=4064, buf=0x7fffffff7780, len=16) at /home/phil/source/qemu/include/hw/pci/pci.h:804
  #7  0x0000555557b340b4 in e1000e_write_packet_to_guest (core=0x7fffddd3f4e0, pkt=0x61100006c740, rxr=0x7fffffff7cf0, rss_info=0x7fffffff7d10) at hw/net/e1000e_core.c:1609
  #8  0x0000555557b30739 in e1000e_receive_iov (core=0x7fffddd3f4e0, iov=0x619000060e80, iovcnt=4) at hw/net/e1000e_core.c:1709
  #9  0x00005555576e2069 in e1000e_nc_receive_iov (nc=0x61400000a060, iov=0x619000060e80, iovcnt=4) at hw/net/e1000e.c:213
  #10 0x00005555572a3c34 in net_tx_pkt_sendv (pkt=0x631000028800, nc=0x61400000a060, iov=0x619000060e80, iov_cnt=4) at hw/net/net_tx_pkt.c:556
  #11 0x00005555572a23e2 in net_tx_pkt_send (pkt=0x631000028800, nc=0x61400000a060) at hw/net/net_tx_pkt.c:633
  #12 0x00005555572a4c67 in net_tx_pkt_send_loopback (pkt=0x631000028800, nc=0x61400000a060) at hw/net/net_tx_pkt.c:646
  #13 0x0000555557b70b05 in e1000e_tx_pkt_send (core=0x7fffddd3f4e0, tx=0x7fffddd5f748, queue_index=0) at hw/net/e1000e_core.c:664
  #14 0x0000555557b6eab8 in e1000e_process_tx_desc (core=0x7fffddd3f4e0, tx=0x7fffddd5f748, dp=0x7fffffff8680, queue_index=0) at hw/net/e1000e_core.c:743
  #15 0x0000555557b6d65d in e1000e_start_xmit (core=0x7fffddd3f4e0, txr=0x7fffffff88a0) at hw/net/e1000e_core.c:934
  #16 0x0000555557b5ea38 in e1000e_set_tctl (core=0x7fffddd3f4e0, index=256, val=255) at hw/net/e1000e_core.c:2431
  #17 0x0000555557b369ef in e1000e_core_write (core=0x7fffddd3f4e0, addr=1027, val=255, size=4) at hw/net/e1000e_core.c:3265
  #18 0x00005555576de3be in e1000e_mmio_write (opaque=0x7fffddd3c800, addr=1027, val=255, size=4) at hw/net/e1000e.c:109
  #19 0x0000555558e6b789 in memory_region_write_accessor (mr=0x7fffddd3f110, addr=1027, value=0x7fffffff8eb0, size=4, shift=0, mask=4294967295, attrs=...) at softmmu/memory.c:483
  #20 0x0000555558e6b05b in access_with_adjusted_size (addr=1027, value=0x7fffffff8eb0, size=1, access_size_min=4, access_size_max=4, access_fn= 0x555558e6b120 <memory_region_write_accessor>, mr=0x7fffddd3f110, attrs=...) at softmmu/memory.c:544
  #21 0x0000555558e69776 in memory_region_dispatch_write (mr=0x7fffddd3f110, addr=1027, data=255, op=MO_8, attrs=...) at softmmu/memory.c:1465
  #22 0x0000555558f60462 in flatview_write_continue (fv=0x60600003f9e0, addr=3775005699, attrs=..., ptr=0x6020000e3710, len=1, addr1=1027, l=1, mr=0x7fffddd3f110) at exec.c:3176
  #23 0x0000555558f4e38b in flatview_write (fv=0x60600003f9e0, addr=3775005699, attrs=..., buf=0x6020000e3710, len=1) at exec.c:3220
  #24 0x0000555558f4dd4f in address_space_write (as=0x60800000baa0, addr=3775005699, attrs=..., buf=0x6020000e3710, len=1) at exec.c:3315
  #25 0x000055555916b3e0 in qtest_process_command (chr=0x55555c03f300 <qtest_chr>, words=0x604000058150) at softmmu/qtest.c:567
  #26 0x000055555915f7f2 in qtest_process_inbuf (chr=0x55555c03f300 <qtest_chr>, inbuf=0x6190000200e0) at softmmu/qtest.c:710

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/dma.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 8a7dbf0b0f3..a4ba9438a56 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -108,6 +108,8 @@ static inline int dma_memory_rw(AddressSpace *as, dma_addr_t addr,
                                 void *buf, dma_addr_t len,
                                 DMADirection dir, MemTxAttrs attrs)
 {
+    assert(dir == DMA_DIRECTION_TO_DEVICE || attrs.direct_access);
+
     dma_barrier(as, dir);
 
     return dma_memory_rw_relaxed(as, addr, buf, len, dir, attrs);
-- 
2.26.2

