Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp1035027wri;
        Tue, 5 Nov 2019 09:51:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqx27WhrTX5eyj+eIn33AB6w47YBNiRs9BrDT5nFTkXdnLzC7/jPV9FJ+duVt8dJn+Ko1QpR
X-Received: by 2002:a50:875e:: with SMTP id 30mr37931220edv.45.1572976300945;
        Tue, 05 Nov 2019 09:51:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572976300; cv=none;
        d=google.com; s=arc-20160816;
        b=ynbUEgPoLfxhzFKaOOJyyImX7ty7UU1AoBX0XvolL0cNZltJyOnsP1LRmfGMwravdq
         gabztf1guohwWwurmLQZZrnqP73vOkOL6UmvETmTY6aBikO6BIYzQI/ejRjtoGBq+Jfq
         FSIk4yF4Wi5wVOb0pSr4oTpvLbCKIxdA89QpBAxIX+TYw98AUdBTIykj9Rimvt1ffDMA
         cGb6x98/LATtUHsgtzarZLfilCu1ElDSvlLPazf11b0Ho6X/6Xjz6JSfzwR5k4TPnv7+
         XVjxcv3+uz2EK6O13EsedmoT54ydSI9fpvBLMc7Lzw3ClChuTflQBF+DSBeht7v5krSN
         vXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=lkBVhE+DGu4iin+pTeTvS1RXP+Ew7BhO+1q4xCrzvpU=;
        b=UPRFvtfbpcQGzf6p7vGRKycjCfHsJckr82H+KxRudOrphf1lPc9KsCgR/44W+Dusbs
         RuaCz0rYySFNe7pG05U+8vlUP/nfEul1KsF+pdiIURjYe3Lpf2PGrzoLStV8lYbFdlHI
         Y8iJ3IEP3ymR+3E6k0dfty40qWPy1OsZNQ0bxtW9yW1/rQSQi4qPNuERoHgJXvKyjxG3
         0G+e//sNkUtVJwQysH1t0KH+pCa5e1+Wjq2KsCTZNOiv6lnXzFjR8W7MEMYS1Mn75tWE
         5h/cVvY1J97VFmI+dbSmHQGUVmorFNjTwCMtOYwvfe2wXBxG3u1uwp8hOQ6SCFebZfVC
         ugSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q20si3758349eja.339.2019.11.05.09.51.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 09:51:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iS2zT-0003Fx-Js
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 12:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47237)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iS2yf-0002QF-Oy
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 12:50:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iS2ye-0004Yz-L6
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 12:50:49 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:34039)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iS2yZ-0004Wm-Li; Tue, 05 Nov 2019 12:50:43 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M42Ss-1iS2yG0Su0-0007FQ; Tue, 05 Nov 2019 18:50:24 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL v2 2/3] hw/misc/grlib_ahb_apb_pnp: Fix 8-bit accesses
Date: Tue,  5 Nov 2019 18:50:09 +0100
Message-Id: <20191105175010.2591-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105175010.2591-1-laurent@vivier.eu>
References: <20191105175010.2591-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lZFxrSfyzft189ztgtj2zhDPSI/v8wne3TXsIYykJJGOhUsiUZI
 WUL5cdIywdu0OUa3r4YX6cB3Tht5LIMC0ClU0II1uDHDHXG37ReL8vF62QOrl1xOxWDZxAa
 yCqIAJHzVW28Cq2J7jJQs6dd+fOzaDuzfjzVCqTQsbJVnvlh+AledLIOc1Vel5LH8FUBnnh
 o47BZat4luIwytgGxrHcg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:av6w0M/wZvM=:rDhXnAD9A6cpkNh2e0TgfK
 J5zOnZTmo/W2/DrEV1TxsmjMZKnl4JwjBQ2mVcpEMorM95RpraeHljKk6t3tDPN9htva00ZS+
 n0IKmM/g54Fxgbudpy2rNfAWupAwq8AOCr38O1wobl8Bp/lRRRUuj1DZn0hrORfW1BiiE1gRu
 GthE7ZJHo2MLLrMrhXBnGO7DPuPRa+1vEbtQk9FBU6jVR3g1Bmt3QddQzGLkiUOsMnAKkXybK
 iv9ZHOq6yKrXbOPUdJNLZqKmNu5QB8SvFBiRLk53kKWXg5DL8P3PSyFE44kUyIDBbCa2s3Ohc
 f94YctBbcL9YU5QBlW6Nwu4fdldc8HR0zwl23GHM8taAuVWhUUst0bAcbky1izqYVhnwHJn1R
 eQrdjr9KZX5ac4OXFu1KZrTwkQpp0tfr/HI2TkwfmnngyN4UksepaIhwp2Yjb0O7A88PqEUco
 4gDwDOA4U9bZNwEmwCgRAEhma1/YgZjpzKq8KwOH2+r85K5x7yNvLw9sSqzWLFA22rjhvchsv
 kDgAfgPtmB73k4lCOcLXEJpK0Wqgr/5KGZTohZmKSsuInPT/SYbnutSzOYKmnGtZQL5DBYf3a
 Ffz0lRXXmB1JvCyKrdlixwyOy5ZMKgh26Ca8J9olDZLuqEXYVP665ZS3UZpQ7giQkdwruVD1z
 VjZqrV5/+n8dISFBbupy5B/MNVImCkyCk1EuopkA7tj/QGjFM02nT+QEu1hmyrSQMJYIcyC1h
 v6AOWFzBqbucg6B8a7O4b488V2tPkikK+6Xj0FxRIchrNIh1TO3HeYrR72TWCmYvoiJsE3oVw
 MSVb44EyLNzkUgBzQ0nagEe+iBk+aTQLdvfM0Glo9oYSOyWcn6XykZEbWXbsOFtHKhG2fXxdO
 yV0/pVe89F9Tov60kVhYGU5ic5vtb/L80oLvPPMJo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.72.192.75
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 qemu-trivial@nongnu.org, Claudio Fontana <claudio.fontana@huawei.com>,
 Cleber Rosa <crosa@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jiri Gaisler <jiri@gaisler.se>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VyO/PHVE3RuW

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The Plug & Play region of the AHB/APB bridge can be accessed
by various word size, however the implementation is clearly
restricted to 32-bit:

  static uint64_t grlib_apb_pnp_read(void *opaque, hwaddr offset, unsigned size)
  {
      APBPnp *apb_pnp = GRLIB_APB_PNP(opaque);

      return apb_pnp->regs[offset >> 2];
  }

Set the MemoryRegionOps::impl min/max fields to 32-bit, so
memory.c::access_with_adjusted_size() can adjust when the
access is not 32-bit.

This is required to run RTEMS on leon3, the grlib scanning
functions do byte accesses.

Reported-by: Jiri Gaisler <jiri@gaisler.se>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
Message-Id: <20191025110114.27091-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/grlib_ahb_apb_pnp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
index f3c015d2c35f..e230e2536361 100644
--- a/hw/misc/grlib_ahb_apb_pnp.c
+++ b/hw/misc/grlib_ahb_apb_pnp.c
@@ -242,6 +242,10 @@ static const MemoryRegionOps grlib_apb_pnp_ops = {
     .read       = grlib_apb_pnp_read,
     .write      = grlib_apb_pnp_write,
     .endianness = DEVICE_BIG_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
 };
 
 static void grlib_apb_pnp_realize(DeviceState *dev, Error **errp)
-- 
2.21.0

