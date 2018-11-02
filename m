Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1461870wro;
        Thu, 1 Nov 2018 17:16:03 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dHvUTAlcRV4uAXN6DPf0hK/c6F19py2e4luw4+K0G78ZtMWIc411Q8MXZmbaroqQEULoVS
X-Received: by 2002:ac8:66c9:: with SMTP id m9-v6mr9023372qtp.349.1541117763267;
        Thu, 01 Nov 2018 17:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541117763; cv=none;
        d=google.com; s=arc-20160816;
        b=x1udqzNFHyb2tnDugl1/thNitPI0WYKK6Egje3wlXcU3j7xqnwkJ1gNi7+pWGs4IS3
         qThKkdyHtzlxMvss4eeOERgwoSKRvBzoy7wbeBYgUj2sS3TELIQJALSIu8GBvrWNCaeQ
         RCOZ7HJE4fPzodEraj7pHMeaFkt64/rwJuEuBO+WPcpL1LdcudBj31ZidOX7OzinRKzk
         YNsTv9lIemdK3pYc+nqqpJei3hktdNwTmEEmVhEdveWl/DqHke+08/NtXbtM9wYD1T5L
         TQ4lJweY2Gy7/atYthoh6c5DXBQU2Pkh0zFQANgMfUmtLkwPAg5G6/ttHkiwgreaKik3
         QuRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=izCZGux2WES8Z5Nq3Na5dyQC4BlgVbqAmlc3jJN6uk8=;
        b=nqiHubJRWnJt5ewyYtWdU7sxibBJW+t2JEsY3BtMUNqBl8oVnCDuS9FI9OaIa+AmWD
         Fb8M+UZDSpbQ9Qt086p4e1fyrnt6NYBstTpH8jmJtUI08QXuK5rzPWMi3BVtf/yJHArx
         6ortoOtIREVnYyMM03qHHEGgEta4sSpy4kBjPkxCuo++aXsiUuVlJ/ooWOQgGyLIQGDo
         aCRONHadgwjXje/6B0B8ZMz3wCHOaU5b0DCAb2Lw67oJIvpkgQ/O0LnZcGh53rY/C5Im
         P0UCetWFYuux5tofPoUL4D/tWLelPXPHbmkOdcQszX6oniMpsLRc0wOBND9N5sKCm/lI
         fHVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JIz61On9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n33si9236544qta.256.2018.11.01.17.16.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 17:16:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JIz61On9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIN86-0002sG-NZ
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 20:16:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5b-0000pm-Gx
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 20:13:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5a-00054P-L3
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 20:13:27 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gIN5Z-00050x-T8; Thu, 01 Nov 2018 20:13:26 -0400
Received: by mail-wm1-x32b.google.com with SMTP id f19-v6so156783wmb.0;
	Thu, 01 Nov 2018 17:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=izCZGux2WES8Z5Nq3Na5dyQC4BlgVbqAmlc3jJN6uk8=;
	b=JIz61On9BdRTirIs1RwT4yqlN+eaOY965SV2nEUFDCM1iq4YEWj+wZNutTAz1mTHNG
	GDt0/yqu05QFVzvdivVKA8q2/DozXMtewwz7pgnIaLdzvHiHJIG/AmX7WOf+Skz90Ecp
	FHbS4vewC2QSiPCU6di+xCBCf2tiKzaDl/ze+U12fXmAEIo5d5+hs6Qa9apMxMVYh6+X
	5WK2A8SCCaVB3LFBvb8B7R6+LvBHX2aGaeDHrJjeDxLMiUBY1j5cFGfdLZNcNW29TAfI
	a4ydhUgo7pegJh47zNdfHkFcbRzG5xPvym4/eaXri3Qjp5QX6EMjJBTe3eI/yNwDD8gc
	IDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=izCZGux2WES8Z5Nq3Na5dyQC4BlgVbqAmlc3jJN6uk8=;
	b=hoZoFUTNx7exLRpVB3mGCBH9Rf67aayP72wZCmdjYGv64h8FpR4szR9CoXL25gxVFh
	3ujqqeQ0OU1siNf35tomrZHf8E3GvkJss6ZaQcWFH9MrRkDM6ecTJtnvFibDse19+Frp
	1amRXsUpoPjXbArypTBIM3kKYhovRTfPA+MuPv1+cieOCOHSzIX+RZyGp6VSRqXP1kmT
	sMJ0nK5h1mVhEHOY+kriqxYCul+0RN34PFy3Ect6ugoXCiiiHWO1NTe2qup6f9zq+/ZL
	9PVDN+A9zS1Mq3wNu018unzxjTd01ZD6HvDVtUbqfN72oq9pDWK3Du+uHb0qG4EMmiOl
	yhCA==
X-Gm-Message-State: AGRZ1gJ7D9pPcRxqKEYObocoi/t/VXLZtsULTSFPNfK+JZYj85S/K0bP
	/U4P6GlQ06GMbxBAo6Dko4A=
X-Received: by 2002:a1c:b088:: with SMTP id
	z130-v6mr6706445wme.95.1541117603478; 
	Thu, 01 Nov 2018 17:13:23 -0700 (PDT)
Received: from x1.redhat.com ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	z6-v6sm10539894wrs.19.2018.11.01.17.13.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Nov 2018 17:13:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>
Date: Fri,  2 Nov 2018 01:12:59 +0100
Message-Id: <20181102001303.32640-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181102001303.32640-1-f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::32b
Subject: [Qemu-devel] [PATCH for 3.2 v2 3/7] hw/arm/bcm2835: Use 0x prefix
 for hex numbers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YLag6977DOhV

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/bcm2835_aux.c      | 2 +-
 hw/intc/bcm2836_control.c  | 4 ++--
 hw/misc/bcm2835_property.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/char/bcm2835_aux.c b/hw/char/bcm2835_aux.c
index 0364596c55..9632e8972c 100644
--- a/hw/char/bcm2835_aux.c
+++ b/hw/char/bcm2835_aux.c
@@ -159,7 +159,7 @@ static void bcm2835_aux_write(void *opaque, hwaddr offset, uint64_t value,
     case AUX_ENABLES:
         if (value != 1) {
             qemu_log_mask(LOG_UNIMP, "%s: unsupported attempt to enable SPI "
-                          "or disable UART\n", __func__);
+                          "or disable UART: 0x%lx\n", __func__, value);
         }
         break;
 
diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
index cfa5bc7365..96cc53f8a7 100644
--- a/hw/intc/bcm2836_control.c
+++ b/hw/intc/bcm2836_control.c
@@ -204,8 +204,8 @@ static void bcm2836_control_write(void *opaque, hwaddr offset,
     } else if (offset >= REG_MBOX0_RDCLR && offset < REG_LIMIT) {
         s->mailboxes[(offset - REG_MBOX0_RDCLR) >> 2] &= ~val;
     } else {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset %"HWADDR_PRIx"\n",
-                      __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%"HWADDR_PRIx" 0x%lx\n",
+                      __func__, offset, val);
         return;
     }
 
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index 5d332324bd..c715cbaef6 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -277,7 +277,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
 
         default:
             qemu_log_mask(LOG_GUEST_ERROR,
-                          "bcm2835_property: unhandled tag %08x\n", tag);
+                          "bcm2835_property: unhandled tag 0x%08x\n", tag);
             break;
         }
 
-- 
2.17.2

