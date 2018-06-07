Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2404504wrq;
        Thu, 7 Jun 2018 11:07:15 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJBA6E2jxvU71deVd26U1IbRC7I0UU33sdvdTFaIHmxEzI9DE1uCvWS2pOe8Ptgn9YnI89s
X-Received: by 2002:ac8:f12:: with SMTP id e18-v6mr2834524qtk.62.1528394835263;
        Thu, 07 Jun 2018 11:07:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528394835; cv=none;
        d=google.com; s=arc-20160816;
        b=wWndez4+RlaRfSpd0OSaftL5Rnyc9CiMFc8zVyoNKH9geyKMvJXycowfw2f87F/+4A
         uBdsvztUDzR+2XaN2C2uYuMXen3GsA/6Le2MS97IomyOXBVdHeWZaNStRBKEnz55ycLa
         gOYN0vOLCOOimYp3YPqB+IUqemw3wXOXEjm9+MR+plyepw4Woo/VbBOlxPx1IBaAsgDV
         Z8e32IoayMgG80W82UjPx2iany7l9sngZ1swI+3Wr3FwdseAJWV+hQ3KcdgMmIXtLzwy
         +PEJ45tzOiloEMmf9VSLfuUyVtDJXURRPNEdCHacWtFeZIpotWj2bxKwd064nhSMnuwW
         qggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=j57TbYKsq9sZhOTQUMQ9/c4IJj1kN/Gj8wYczr2Piso=;
        b=joKcC9hdxU1SiKmdYeKaGszPPfEy7KHqW4h1zYvRZZsGFY92Bja2thmL0l5mhUHqZF
         MjrPMR6MLJfqWdJaZJ6FppS7TOk2yeeUK6tvBHBapeETrdC/AMd+vspMJa+em24yenNR
         BFKowPlrXvwSDl0vw3D3USTiVMc6j4uSR5vhsKVkUrxm2kky/HXptohXAONsn/7oR2P+
         iQkeluB1QSNI9axEhoI8dCOR3oTI7q3cZlL/FFV0r6WGHxsAJLuFBtTsj0uLc5cL0eUE
         4itO1CIdNfZ0w2OWUtgWv10+zVIv01UY8SK8kOH1Jn2h/ecDRGoDwp2wRaKMWbbGqEgf
         f4AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dQ9WTUky;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k24-v6si5193288qtb.248.2018.06.07.11.07.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 11:07:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dQ9WTUky;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQzJa-00025b-Jp
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 14:07:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJL-0001zg-Ew
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 14:07:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJK-0004PM-N5
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 14:06:59 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:43061)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzJI-0004NU-9n; Thu, 07 Jun 2018 14:06:56 -0400
Received: by mail-qk0-x241.google.com with SMTP id g126-v6so7136930qke.10;
	Thu, 07 Jun 2018 11:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=j57TbYKsq9sZhOTQUMQ9/c4IJj1kN/Gj8wYczr2Piso=;
	b=dQ9WTUkyk6lq6WCB9sU7COPMInqRFrmXl/Ys5hdxkmfTEhS1dm0ZID1pVY2BDxXdSz
	r9uRd/A4GzYp7H8YQRASI0T07UdmNIDAC6VcwAKJVIB1wZ/lq4A1yIkF9pyyuokIVLBk
	wtZCmQNXjnblsRJpcBgNiAinEi9fUDEulf70pjOFoI79xU5z7+8sZJwMbmwvqltRl3A8
	s43ydtjr9gPFQzXyGQVpZ26sdy1+Vlxhq1iahCJQjm5XWEcJH9HHfPET0yMBQpRO3SV6
	o6lRLAwEHmC/At4gLlKCnFwdO1l7YWbx1i2sGUoJbVbz3/Rlrt3atf90zTXu13vUMN7a
	x/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=j57TbYKsq9sZhOTQUMQ9/c4IJj1kN/Gj8wYczr2Piso=;
	b=dIhuM74N1uAAtYgRwiz3KcVkDe/N3xJzQyH5foHLt0KHOvJhZv7BvNhbfrFUG12PWa
	T6Fuhb3oqWWjJN/2AD7ZVWr0RX+aqLuitIiIgO7k8Vae2uUmB5hnSDqswU7fLJroooJB
	fKnyMGl8alc5MUTORvD7XWWYCmj8Cy332WDlXqucvtdncS9wSqqY0SqjKAOIUed+AEdd
	LYAwFe6HEsrSC+PEdKQhQTNqG1D+P0pHsxdBbO7wRzr/FCqRNbAGWV5eTWrUB5+tqMhg
	qmuiybAlnegbq0lNku83gv+W29MgtRN1Js+a267bhEFEuO8wOv1gx4BP2kyjJGWrv73y
	XB6A==
X-Gm-Message-State: APt69E2m5lxFmSLwqtCCZPrd7BIjkqbGCgzQkUusMQtCQUv7wbYCfrZH
	r2/fN7uq0ZKfBz03GZiDfag=
X-Received: by 2002:a37:6216:: with SMTP id
	w22-v6mr2506419qkb.312.1528394815880; 
	Thu, 07 Jun 2018 11:06:55 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s15-v6sm26838414qtc.81.2018.06.07.11.06.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 11:06:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  7 Jun 2018 15:06:36 -0300
Message-Id: <20180607180641.874-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180607180641.874-1-f4bug@amsat.org>
References: <20180607180641.874-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-arm] [PATCH v2 2/7] sdcard: Allow commands valid in SPI mode
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 590UKrvUCGsL

From the "Physical Layer Simplified Specification Version 1.10"
  Chapter 7.3 "SPI Mode Transaction Packets"
    Table 57: "Commands and arguments"

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/sd/sd.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index e1218d1fb6..80e70dd93e 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -960,8 +960,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         return sd_illegal;
 
     case 6:	/* CMD6:   SWITCH_FUNCTION */
-        if (sd->spi)
-            goto bad_cmd;
         switch (sd->mode) {
         case sd_data_transfer_mode:
             sd_function_switch(sd, req.arg);
@@ -1190,9 +1188,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     /* Block write commands (Class 4) */
     case 24:	/* CMD24:  WRITE_SINGLE_BLOCK */
-        if (sd->spi) {
-            goto unimplemented_spi_cmd;
-        }
         switch (sd->state) {
         case sd_transfer_state:
             /* Writing in SPI mode not implemented.  */
@@ -1217,9 +1212,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 25:	/* CMD25:  WRITE_MULTIPLE_BLOCK */
-        if (sd->spi) {
-            goto unimplemented_spi_cmd;
-        }
         switch (sd->state) {
         case sd_transfer_state:
             /* Writing in SPI mode not implemented.  */
@@ -1259,9 +1251,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 27:	/* CMD27:  PROGRAM_CSD */
-        if (sd->spi) {
-            goto unimplemented_spi_cmd;
-        }
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_receivingdata_state;
@@ -1371,9 +1360,6 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 
     /* Lock card commands (Class 7) */
     case 42:	/* CMD42:  LOCK_UNLOCK */
-        if (sd->spi) {
-            goto unimplemented_spi_cmd;
-        }
         switch (sd->state) {
         case sd_transfer_state:
             sd->state = sd_receivingdata_state;
-- 
2.17.1

