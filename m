Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp314183ejx;
        Sat, 24 Jun 2023 18:59:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5HSPSwkSY3cto5ZZICh3VWIhHlSpIJzF7L0X6YPTGKHm7SNyw03niPnOJybIeAKRI0zdwY
X-Received: by 2002:a05:622a:24a:b0:3fd:db88:b0e9 with SMTP id c10-20020a05622a024a00b003fddb88b0e9mr29043922qtx.6.1687658379658;
        Sat, 24 Jun 2023 18:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687658379; cv=none;
        d=google.com; s=arc-20160816;
        b=A8v0vOUc+Rzrx+UQvnCLcFeZYM216ASbKtzy0EAYgtWlc9Unz5bsB0gkkNq+cWy9kN
         meEIkQ8xHew3J7GjMTphm6JHFgRgp8nhk47d3tzIhEPGzrbjMQ7lHHiBNtOpBBrdb9/Y
         9OJjbMnjf2dAm9UOaSkCHqWG2nlrjccT/gmICU6CdsRtbm0WgaDiTONtInANQzCf3FlU
         eNf+GZeiUDq8b5qtCJvvMXFJNfB0t5mEuw5x4ny3jJLO8gxVF5TFkVV991pbjjMGXHSI
         CEL3OrjHNBw+2M++1iHWX2p3IjISqbg7G1RgIWeCfEaLmpkRVGoruHylVwhJAyuH2NDq
         rHFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:feedback-id
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=qVI5jThVZWO25CVa/+4Vtkp+vW+Q/lmoaS/b4m8KmYM=;
        fh=yHLkVZPXSVtfVA+xKBtivTJVWSTFXSU2Ph7j5n6vxJY=;
        b=fcEwzyB1bdLER60Mx3RBi0HyVj66hTA6sH8rj3lVmekAVMsC6pErohEGUy3HuzWyAa
         7/QSRHO29YfbHrn0U1rfxe97mHqGhoHx09z+xaly05Fcp/jFdKobzdV5Y9mfrcfYo1Mh
         yKNqwqdKAxS9ZpukRu7HZDRIycYBw/9XihVw2tKvcrXRLlptIIlNtG8+bfPfZEusftpD
         WXHNy0aUsvONw6rqXVz10QNCmKmTP2jhrePYD/ENiiqO53H/SuhH3DfJjyq/erg9lrK9
         mVOZ4MWl3uCkhp2KZX40ckNAPL34QjSgAItmNHH8BTzV7CnXuZ7fX8EZZOFkPBlUR5Di
         BkYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020a05622a148500b003ff242dc090si848302qtx.18.2023.06.24.18.59.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Jun 2023 18:59:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qDF1S-0001W2-AU; Sat, 24 Jun 2023 21:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1qDF1Q-0001VM-37; Sat, 24 Jun 2023 21:58:36 -0400
Received: from bg4.exmail.qq.com ([43.155.67.158])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1qDF1N-0002jR-VC; Sat, 24 Jun 2023 21:58:35 -0400
X-QQ-mid: bizesmtp75t1687658003tiodjadf
Received: from ubuntu.. ( [111.196.130.174]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 25 Jun 2023 09:53:21 +0800 (CST)
X-QQ-SSF: 01200000000000E0G000000A0000000
X-QQ-FEAT: u4LBNZ4VsNyoNjODd8HYJRozVVCthJJlT0KE8YXN553ZN1SrvIS0TednSwsLQ
 GngoHtyUUdszs5TvF87nvqBc+WW18bPE3TueH+i3HCr/nkWvrtbNXBvFNnQ1NnWoBHk7bBJ
 n9AqMY5lK7X+4EU7oiqv7B/VufTcj9CqToYiLweQLM7IxPC6Iq+p9wgAW/qO4yYEg3RuEtJ
 +W3cmFYfrom1DPtWZwhY7oQyA1NtrbrKuYivcwdB/Tu96C1u3ZuVwrjv4SdIqcwx0QIjRa5
 nUM+JeWxQPER///soHkEwcEsAh5bt/1iy0oYCV/gnOjDIjq+7RJWR0D6HLaDo2aQBLtMfYY
 lDcoxY7zQdAFSSbJOw=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17899896922838211880
From: Bin Meng <bmeng@tinylab.org>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Helge Deller <deller@gmx.de>,
 Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v7 0/9] net: Pad short frames for network backends
Date: Sun, 25 Jun 2023 09:53:12 +0800
Message-Id: <20230625015321.77987-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz7a-0
Received-SPF: pass client-ip=43.155.67.158; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SBL=0.141,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: Px6c1taB7So2

The minimum Ethernet frame length is 60 bytes. For short frames with
smaller length like ARP packets (only 42 bytes), on a real world NIC
it can choose either padding its length to the minimum required 60
bytes, or sending it out directly to the wire. Such behavior can be
hardcoded or controled by a register bit. Similarly on the receive
path, NICs can choose either dropping such short frames directly or
handing them over to software to handle.

On the other hand, for the network backends like SLiRP/TAP, they
don't expose a way to control the short frame behavior. As of today
they just send/receive data from/to the other end connected to them,
which means any sized packet is acceptable. So they can send and
receive short frames without any problem. It is observed that ARP
packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
these ARP packets to the other end which might be a NIC model that
does not allow short frames to pass through.

To provide better compatibility, for packets sent from QEMU network
backends like SLiRP/TAP, we change to pad short frames before sending
it out to the other end, if the other end does not forbid it via the
nc->do_not_pad flag. This ensures a backend as an Ethernet sender
does not violate the spec. But with this change, the behavior of
dropping short frames from SLiRP/TAP interfaces in the NIC model
cannot be emulated because it always receives a packet that is spec
complaint. The capability of sending short frames from NIC models is
still supported and short frames can still pass through SLiRP/TAP.

This series should be able to fix the issue as reported with some
NIC models before, that ARP requests get dropped, preventing the
guest from becoming visible on the network. It was workarounded in
these NIC models on the receive path, that when a short frame is
received, it is padded up to 60 bytes.

Only the first 4 patches of the v5 series [1] were applied in QEMU 6.0,
and the reset was said to be queued for 6.1 but for some reason they
never landed in QEMU mainline.

Hopefully this series will make it for QEMU 8.1.

[1] https://lore.kernel.org/qemu-devel/859cd26a-feb2-ed62-98d5-764841a468cf@redhat.com/

Changes in v7:
- new patch: "hw/net: ftgmac100: Drop the small packet check in the receive path"

Bin Meng (9):
  hw/net: e1000: Remove the logic of padding short frames in the receive
    path
  hw/net: vmxnet3: Remove the logic of padding short frames in the
    receive path
  hw/net: i82596: Remove the logic of padding short frames in the
    receive path
  hw/net: ne2000: Remove the logic of padding short frames in the
    receive path
  hw/net: pcnet: Remove the logic of padding short frames in the receive
    path
  hw/net: rtl8139: Remove the logic of padding short frames in the
    receive path
  hw/net: sungem: Remove the logic of padding short frames in the
    receive path
  hw/net: sunhme: Remove the logic of padding short frames in the
    receive path
  hw/net: ftgmac100: Drop the small packet check in the receive path

 hw/net/e1000.c     | 11 +----------
 hw/net/ftgmac100.c |  8 --------
 hw/net/i82596.c    | 18 ------------------
 hw/net/ne2000.c    | 12 ------------
 hw/net/pcnet.c     |  9 ---------
 hw/net/rtl8139.c   | 12 ------------
 hw/net/sungem.c    | 14 --------------
 hw/net/sunhme.c    | 11 -----------
 hw/net/vmxnet3.c   | 10 ----------
 9 files changed, 1 insertion(+), 104 deletions(-)

-- 
2.34.1

