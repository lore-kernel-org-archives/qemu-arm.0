Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2138203wre;
        Sat, 2 Jun 2018 17:11:05 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKF5cdTOPhueVQmMGVgkfOaGH/hhVWxTdVpuVq3h0iiTE7mJbjwTinChq2lHwbsLVwvvnp9
X-Received: by 2002:aed:2311:: with SMTP id h17-v6mr7935945qtc.144.1527984665529;
        Sat, 02 Jun 2018 17:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527984665; cv=none;
        d=google.com; s=arc-20160816;
        b=LqzLEPLNHZ6euuecx411qyE8Fh5tEI+RQX21aokQSnZkVuJ92Msm58C9gvvQwZl+gC
         K2mf9elB6cFEgBWNUeXiWTKwWXXVUfS1nGMUAfc2eswLixpLPwYpXvYWbdbVQEU3amIW
         vgivR1EXpgXeQ51zDeQ/z/9DL0uoxXvKrmfvJzZ9W0yPMIZ4KJT6LA2hWgRsM4+jVZEL
         DcGiVpb2TLV/j/EBmSgGSCDPULoumyHXQgezkzO//ggSNE0nFYoueSUPockMt3pwsov5
         pi91ubjUW00dOqxvIkFfGq/Lcc0e2sNfit9qgphgAdccAdjIanNY4aNVIJQsxBuCmAFy
         fbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=OOZ7Vcc31wjxZvWvC4/OZIf0JoVPNazx0Zctb+9Jpyg=;
        b=b3s5FEkisp+v62hrQ3yJqmv79geMAnzMGZSCn/8zoPk3woFFWHGzUFZaLyV+OaoNvh
         wMz/iivId4eLawxtFSOdgkc5JjAHPIwjaBaNPjweaPlsBHoY8jAyS9Cj7UDcFvhClyW7
         dLYgWFtef7q60BlnYqqXog4KxDiC60rcp/0Lin7jcGGWeycoXoKtVerBI+1oJxwb9hhU
         IAP54dj1Jdg7nrbyPzCI0jClft3hoVZ4URTku7nBpIPUUsXHV8w2P1AEzyiQfIIKl5i5
         nRZsR6d5qcuSTPPO9pRa1/36aFlinonI86iI5WhkDOkU8Ml2iv0Ei1JGNiS2q7HOxx+R
         grGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UFaNscSt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w184-v6si165717qkc.177.2018.06.02.17.11.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jun 2018 17:11:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UFaNscSt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPGbx-0005MT-0V
	for alex.bennee@linaro.org; Sat, 02 Jun 2018 20:11:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZr-0003zg-NY
	for qemu-devel@nongnu.org; Sat, 02 Jun 2018 20:08:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZq-0002yi-NP
	for qemu-devel@nongnu.org; Sat, 02 Jun 2018 20:08:55 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:42648)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZq-0002yW-JI; Sat, 02 Jun 2018 20:08:54 -0400
Received: by mail-qt0-x241.google.com with SMTP id y31-v6so6607031qty.9;
	Sat, 02 Jun 2018 17:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OOZ7Vcc31wjxZvWvC4/OZIf0JoVPNazx0Zctb+9Jpyg=;
	b=UFaNscStTnVKq3/f0jmJ7UW6HsC8+H7OPrRaPXmCnCf9YwEHxALqozWiAJduD4KEdC
	2UXCkqBYw9lwhm87z4K4r+SpfeaIzAOhALkQN2Q+kq5+Dm9wZITEoP7Haup9s7vgrCUm
	5ek7+LaxfSXSurp5Jl3iiTZmTi75Cv0t4I95+heYIpgqdW4T5bsx0lhSByaCrM5N5z+m
	bvUlW9S/iBJOFe+bRoHnCj5uoYW2EUhUVJo8u0dk+WSTxBimqJLLQ3wT1Cgr5krzeEJC
	BbaVN19dpBNYSsFyIQHduZhFYgNsVVb+LTcEwoNSlySkqpGyRcgRQQXVEbDThjlWMncm
	DTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=OOZ7Vcc31wjxZvWvC4/OZIf0JoVPNazx0Zctb+9Jpyg=;
	b=Kp78tla20AndsDQVgLO1DTGZdTEvmCh7ubo7HHvu4N3IWmDGma+fCmWoZ9yakx1C0e
	sntPj0+STr7+8utGCbY50hVbQIKggW/DpgpvvUvAj0Y/uRLhBU9XFSmEjFyUnfTbuoRy
	WKmVO0VSHZs6W4rTs5WRMQfrEGooXVPjNACCI8xGubkwDAIrzpRxbr3S3U8v5EEimte9
	BKvOckAwjBDZ+YG7+kCansrbRv5OMky/VdeWclcMjxTS3RoAAlN4gJfOLoO1EoSAAu72
	Z69zanoiw/olDwXQqcMMdFHgzs4qNbx+yENrwe4pyyJ938K5fAnGHg/Z5YpXyPd1w2lI
	R86A==
X-Gm-Message-State: APt69E2bNkt/sNYXfCdksvoqJhO4S1dd/2CZDdDRA9+iXAO0gxkowbpW
	UAqNZ9SNWih4SsabBAwGGr0=
X-Received: by 2002:aed:3e51:: with SMTP id
	m17-v6mr8450995qtf.283.1527984534233; 
	Sat, 02 Jun 2018 17:08:54 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	17-v6sm10610894qkg.97.2018.06.02.17.08.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 17:08:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sat,  2 Jun 2018 21:08:25 -0300
Message-Id: <20180603000827.30872-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180603000827.30872-1-f4bug@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-devel] [PATCH 6/8] sdcard: Disable SEND_IF_COND (CMD8) for
 Spec v1
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Paul Brook <paul@codesourcery.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BfUTuET0LdVp

SEND_IF_COND got introduced by Spec v2.

Firmwares use the CMD8 in SPI mode to poll the Spec version supported:

  7.2.1 Mode Selection and Initialization (SPI mode)

    The SD Card is powered up in the SD mode. It will enter
    SPI mode if the CS signal is asserted (negative) during
    the reception of the reset command (CMD0). If the card
    recognizes that the SD mode is required it will not
    respond to the command and remain in the SD mode. If SPI
    mode is required, the card will switch to SPI and respond
    with the SPI mode R1 response.
    The only way to return to the SD mode is by entering the
    power cycle. In SPI mode, the SD Card protocol state
    machine in SD mode is not observed. All the SD Card
    commands supported in SPI mode are always available.
    [...]
    If the card indicates an illegal command, the card is
    legacy and does not support CMD8. If the card supports
    CMD8 and can operate on the supplied voltage, the response
    echoes back the supply voltage and the check pattern that
    were set in the command argument.

This change restore the SSI/SD functionality of the Stellaris
LM3S6965EVB board.

Message-Id: 201204252110.20873.paul@codesourcery.com
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Paolo, I guess this would be a good use of the
Based-on: 201204252110.20873.paul@codesourcery.com tag in
the git history :P

 hw/sd/sd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 81f178b36e..da65f2b178 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1017,7 +1017,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 8:	/* CMD8:   SEND_IF_COND */
-        /* Physical Layer Specification Version 2.00 command */
+        if (sd->spec_version < SD_PHY_SPECv2_00_VERS) {
+            break;
+        }
         if (sd->state != sd_idle_state) {
             break;
         }
-- 
2.17.1

