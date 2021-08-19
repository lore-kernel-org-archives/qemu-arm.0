Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp374695lfg;
        Thu, 19 Aug 2021 07:22:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwL1j4b+Phd1rtTOZBOlAR198klW6UTTd5CU3IOx+FXcI7rw5IWmWL1XDnvzZUGyV4VQ/Iq
X-Received: by 2002:a05:6102:227c:: with SMTP id v28mr12577356vsd.29.1629382959508;
        Thu, 19 Aug 2021 07:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629382959; cv=none;
        d=google.com; s=arc-20160816;
        b=bUyI8UhESp7olgMkKoy7o/0exHlf7hnFFqve2stqIiyBf2guR7Qj90m7b1Goo84uAm
         DJPeTKNN/ECxV3YkMyV5mOeUnacXiSqn326JwHVlkY1HDb+UZ5pw4NLUMw1wnNK9RhfG
         KrnqkDMXl8e/Pq2voYcZp56e/3d48Obtop+lxoayNSAndIkmhH6eHhCeXERnBnzRf977
         tkDr/DDxY7ytOvPzR6N4IMV59yErNzQRt0y0dpCcppohBks64qWSKCSa3jm9qIc5r0ej
         Z1amc2DYYhZAWuLTxm/564WzzEyjIcyiewlGf9ecVrM6pQo+c6LhC02MXDkeVPpEnla8
         iWPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Fap7O0R9MEh6QL+DuYDv0PNmINz+on3L7VMf/wYDHNI=;
        b=DBKs+QNSHZPQqzA7JZfVPfKz9GivuPDremhtptjAUwL85hWMt2qszVKIakaBOm7u3a
         7cAcq+cPSsR32zV/z1qYWxl2Dzw+ZSPXrGWzmAOqPkw21n1bW2518zajksdZbOAABaeo
         8J0dW/lvD7FdhYfLfJhpfSoEL5TDASJJzHBkeVU+G4jfpTNc1sKXJPXj+YrEFvDBUYS9
         G3Bu9n3Ceey0dIaUmChhGENEFV1PyvE20sdlwjQTo2aRhLHbYxCPVkc9qpb8rbq4X008
         s4g9VSLUmwaqY6g8XWEWxrMbbqyDQA4StLBG/09ZMXzdKRtERkYj2xB++Ori4DuQxFHk
         XUUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E6ftzta3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15si2521290vkb.44.2021.08.19.07.22.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 07:22:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E6ftzta3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGiwI-0004qX-RD
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 10:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiuU-0002UT-Ue
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:20:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGiuS-0006G7-U5
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:20:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629382844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fap7O0R9MEh6QL+DuYDv0PNmINz+on3L7VMf/wYDHNI=;
 b=E6ftzta3JVWElnjY9cT0fWRUvy4tv/ASSiZD9PXR0y/x/DPbyegsExX9MepMH7lsD1L5mq
 TCepEoFHqB4mNhZIzFQecgWIpAA/Mk8qVzWr1IT89M77Imp1rWljZn31UbdIz+iAckrqKO
 ngQEreEnPCi8rqbsS95ehFJ6/CaBotI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-5iyM8qv1Nd-9PNFXCeAL9w-1; Thu, 19 Aug 2021 10:20:42 -0400
X-MC-Unique: 5iyM8qv1Nd-9PNFXCeAL9w-1
Received: by mail-wm1-f69.google.com with SMTP id
 w25-20020a1cf6190000b0290252505ddd56so1375825wmc.3
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:20:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TOIRuwgWaKxfUyVDEGAz6ihn0rKNZeaz2X3a4+u4JKE=;
 b=XDMgaHk08M+NBL3B75B+4TXTSFBQe1Q0GUSLLT4RGTdF6eguYtWd51Nfr+UFchJaIs
 XVZTueL3KQJ/89k6NGnMNjADJNuynj1ejlBbLI79zNjv3CMUVHmpHE30pAUijU6gS0qG
 22AiRLNqJTGuaNV0zSfKaCoCAvnKwbr9Hiv2mBDc5mF8DFVj+mUsn0TZO0bq7j4TjK1+
 mabCS58iCxalxY2NZUUZl9zUDuQObEz6S6Qp6y75RC58CzjGV1qXyT/BZO2HQGehedTT
 n1fDp1QSfzlOYOsUNwOoNAhX9MXFhNoggG01gN020g8P1nEQmf2T2QKa0sr2icAKELXw
 tmTQ==
X-Gm-Message-State: AOAM532noWVOaMl3+WfthrqKsvsqqB3BBCP5WKspSEiV62AUHE1Ba7Uj
 FHI2cmXqjH+olBVyfIZYeSHoEsvN7fp1dj2MgEaBKQGLbz9PQgxIE8vcRVqJGUa6gkR/p8BQpdu
 DBCB/E4hw61gz4w3UHKmzULKByDSUHg2SmdM+Xzm7/Xy+FT4gEedZHmVJq3vJmTIr
X-Received: by 2002:a5d:674c:: with SMTP id l12mr4251236wrw.112.1629382841105; 
 Thu, 19 Aug 2021 07:20:41 -0700 (PDT)
X-Received: by 2002:a5d:674c:: with SMTP id l12mr4251202wrw.112.1629382840917; 
 Thu, 19 Aug 2021 07:20:40 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d4sm3114597wrp.57.2021.08.19.07.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 07:20:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] memory: Introduce address_space_create(),
 re-use &address_space_memory
Date: Thu, 19 Aug 2021 16:20:33 +0200
Message-Id: <20210819142039.2825366-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>, Peter Xu <peterx@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YMiZZjFfh6q1

Introduce address_space_create() (return .heap allocated AddressSpace)=0D
and return directly &address_space_memory if the root MemoryRegion is=0D
get_system_memory().=0D
=0D
This simplifies the 'info mtree' output of some boards. Flatview is=0D
unchanged.=0D
=0D
Inspired by this thread:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg829819.html=0D
=0D
Based-on: <20210819141527.2821842-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  memory: Do not increase refcount on global system_memory region=0D
  memory: Introduce address_space_create()=0D
  memory: Have cpu_address_space_init() use address_space_create()=0D
  hw/dma: Replace alloc() + address_space_init() by=0D
    address_space_create()=0D
  hw/usb: Replace alloc() + address_space_init() by=0D
    address_space_create()=0D
  memory: Have address_space_create() re-use global=0D
    &address_space_memory=0D
=0D
 include/exec/memory.h    | 14 ++++++++++++++=0D
 hw/dma/xlnx-zdma.c       | 15 +++++++++------=0D
 hw/dma/xlnx_csu_dma.c    |  9 ++-------=0D
 hw/usb/hcd-xhci-sysbus.c | 16 ++++++++++------=0D
 softmmu/memory.c         | 24 ++++++++++++++++++++++--=0D
 softmmu/physmem.c        |  4 ++--=0D
 6 files changed, 59 insertions(+), 23 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D

