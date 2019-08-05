Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4065009wrv;
        Mon, 5 Aug 2019 07:40:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzeat3F8TMO7o4RRZBudbrGUQUurUbwdEhP36yLt7T83ub7w2SMORdiSJpU3xB5l4o7MoWy
X-Received: by 2002:a17:906:5c4e:: with SMTP id c14mr114639132ejr.73.1565016044289;
        Mon, 05 Aug 2019 07:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565016044; cv=none;
        d=google.com; s=arc-20160816;
        b=0ST/TXk9vMscgoQvAZNUFCVsIMC81ucS/7uhqBubMnlalaGv1kGAuOGeQpGcRFPUol
         yjsj5b+xO4f0qi4c7xklHl7ZwuGQmozGC39exa7rimc0gZLMbsgJv4Zhg5G6CbVNg3X8
         rsgE0B3rYPv9mmOVyPsNGGKd9Kfon12EzGFjNcip/SRxZd/IrlWNg2wBAtPD/V+yT8aN
         ombI1CAjSgJKaJ16cQLQm9nI62fFBsUOzfJjaA6/XGUW6sF4UqK2f7FQJwN49AnmhzB5
         efFX1KNWJWl+mdZFofGJbiHAbAsdOhHrWWhkt+n3IwsNaiByOJaZ49aWjmSqnpbOpHTo
         1+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=VhPZmvFibXmJaI09tUvuq3f8eUmJMc+sicy3PZ/JuQY=;
        b=el0HsAdhOavGWOWOtv4SgcS7wE9ZGd4t0yKj/jPRmERA7TJla5+Mw+NGh6ASxyJFV+
         32SH43hulqhPVseUo3MoTDrHAT5difzhgRRjf/90KmJdFg/Gb1moCD31WrI3JKm6rVUn
         /zItGUvjV013tvkSmmTkFU1yg6XNiC+vCF4g0zx2d/llrjopYcqc/JWEIz68+yJrZp2k
         IVwuEjRFNBGKcRF+cbiQBOjuhPFYOmrBt1JA48lTJ31mjSpxMIlRPh0H1mF+pgtTYra7
         WLSvPE6Mq7AcUIuLRrkSFIHyyOaN4d/6e545BqVi2K8OWf63BnrC2vHZN8+Yp3r2mvGK
         ldTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="FPKo/uNo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2si31489658edu.19.2019.08.05.07.40.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 07:40:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="FPKo/uNo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hueAF-0005li-CF
	for alex.bennee@linaro.org; Mon, 05 Aug 2019 10:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37005)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aa1ronham@gmail.com>) id 1hudub-0007bM-2f
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 10:24:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aa1ronham@gmail.com>) id 1huduZ-0006PM-Up
 for qemu-arm@nongnu.org; Mon, 05 Aug 2019 10:24:33 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:34727)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aa1ronham@gmail.com>)
 id 1huduX-0006K0-BK; Mon, 05 Aug 2019 10:24:29 -0400
Received: by mail-qk1-x744.google.com with SMTP id t8so60194662qkt.1;
 Mon, 05 Aug 2019 07:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=VhPZmvFibXmJaI09tUvuq3f8eUmJMc+sicy3PZ/JuQY=;
 b=FPKo/uNo/JAF9rjCM6Qgi31TXTo5aYTI50GFMpT6G9jE2k7zQ6APtzmDOWytiQVEfC
 vDJX6WW+Yhbj+6/UVkSez3mCbAfbRlCYLfvwdNxW7aimIFtMEDou38noCUjeJXIf3Co4
 9C1rqnGfjUJyOAqXyfns56fzI/eDIR+cg+zgt9fY/x46bvbNJtrOonQd+18wqrG3Bfk7
 Ka4y0BKYJimHvuUB4zuyBNMWFwPpoBmOjSAw4FDIbGxz1AXCp+o3bd7MKZr8t8s5bQsg
 2FY4da82CltelG5l3fAhZK8+xETKek3cbEIm3gPmGTGKtNPFelAa/XG47d+xF3rJae1F
 83NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VhPZmvFibXmJaI09tUvuq3f8eUmJMc+sicy3PZ/JuQY=;
 b=nJOsUasjlG3BA+ocU0uUElflJBPKV8wM9gnqssztYGj5sDKlJuzEYPmQhNoioAPrmX
 42eC8e6cNYbeeJxnRGywxPz1qD0i7q+XjJFSdo4YJ6XFcQod8uwDIj7ei03wyUYhKqn9
 xcoHdU/Yozwh0zCPOVBH5/fDpBbYhm7FiP0l/mOez60m4PrEcvnI1Wf5lqwHXojK3jIj
 YsVu2+fdeayyG430buPuppHz0aLZd8Mj6mreDbQWLGlrzy0duOXKHrElbeGeGjpHwteH
 63/JAfz9y8d/otMMrdPL8gVDvmVzuxkvvWIaTbgSU1WRw6ixj9ObGyudABMysqfcYKBf
 16gw==
X-Gm-Message-State: APjAAAVEiHUL+pAcCLGQGEWgANfVrkcYKTWyc1yEIAKz4C3+d8WyTpLX
 gfC5wbgLeqpa+Pz78EOH5ThVh6bowDY=
X-Received: by 2002:a37:76c5:: with SMTP id
 r188mr100858733qkc.394.1565015068123; 
 Mon, 05 Aug 2019 07:24:28 -0700 (PDT)
Received: from alertlap116-ubuntu.alertinnovation.com
 (50-203-79-218-static.hfc.comcastbusiness.net. [50.203.79.218])
 by smtp.googlemail.com with ESMTPSA id o10sm41045572qti.62.2019.08.05.07.24.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 07:24:27 -0700 (PDT)
From: Aaron Hill <aa1ronham@gmail.com>
X-Google-Original-From: Aaron Hill <aaron.hill@alertinnovation.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Aug 2019 10:24:17 -0400
Message-Id: <20190805142417.10433-1-aaron.hill@alertinnovation.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
X-Mailman-Approved-At: Mon, 05 Aug 2019 10:40:23 -0400
Subject: [Qemu-arm] [PATCH] Set ENET_BD_BDU in I.MX FEC controller
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
Cc: peter.maydell@linaro.org, jasowang@redhat.com, qemu-arm@nongnu.org,
 peter.chubb@nicta.com.au, Aaron Hill <aa1ronham@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Etp1nhDOVXiM

From: Aaron Hill <aa1ronham@gmail.com>

This commit properly sets the ENET_BD_BDU flag once the emulated FEC controller
has finished processing the last descriptor. This is done for both transmit
and receive descriptors.

This allows the QNX 7.0.0 BSP for the Sabrelite board (which can be
found at http://blackberry.qnx.com/en/developers/bsp) to properly
control the FEC. Without this patch, the BSP ethernet driver will never
re-use FEC descriptors, as the unset ENET_BD_BDU flag will cause
it to believe that the descriptors are still in use by the NIC.

Note that Linux does not appear to use this field at all, and is
unaffected by this patch.

Without this patch, QNX will think that the NIC is still processing its
transaction descriptors, and won't send any more data over the network.

For reference:

On page 1192 of the I.MX 6DQ reference manual revision (Rev. 5, 06/2018),
which can be found at https://www.nxp.com/products/processors-and-microcontrollers/arm-based-processors-and-mcus/i.mx-applications-processors/i.mx-6-processors/i.mx-6quad-processors-high-performance-3d-graphics-hd-video-arm-cortex-a9-core:i.MX6Q?&tab=Documentation_Tab&linkline=Application-Note

the 'BDU' field is described as follows for the 'Enhanced transmit
buffer descriptor':

'Last buffer descriptor update done. Indicates that the last BD data has been updated by
uDMA. This field is written by the user (=0) and uDMA (=1).'

The same description is used for the receive buffer descriptor.

Signed-off-by: Aaron Hill <aa1ronham@gmail.com>
---
 hw/net/imx_fec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 404154ebbf..4693bfb246 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -590,6 +590,8 @@ static void imx_enet_do_tx(IMXFECState *s, uint32_t index)
             if (bd.option & ENET_BD_TX_INT) {
                 s->regs[ENET_EIR] |= int_txf;
             }
+            /* Indicate that we've updated the last buffer descriptor. */
+            bd.last_buffer = ENET_BD_BDU;
         }
         if (bd.option & ENET_BD_TX_INT) {
             s->regs[ENET_EIR] |= int_txb;
@@ -1239,6 +1241,8 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
             /* Last buffer in frame.  */
             bd.flags |= flags | ENET_BD_L;
             FEC_PRINTF("rx frame flags %04x\n", bd.flags);
+            /* Indicate that we've updated the last buffer descriptor. */
+            bd.last_buffer = ENET_BD_BDU;
             if (bd.option & ENET_BD_RX_INT) {
                 s->regs[ENET_EIR] |= ENET_INT_RXF;
             }
-- 
2.17.1

