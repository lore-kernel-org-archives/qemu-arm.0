Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3193995wru;
        Mon, 1 Jul 2019 17:14:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyJsf1LAgTUhhrKcyvvzWNC9g+ja9QvL7ZC5y3TyBPvtK/bW5q5fkPo9Phiu6IBV+DyKZDG
X-Received: by 2002:ac8:21b7:: with SMTP id 52mr22559761qty.59.1562026488288;
        Mon, 01 Jul 2019 17:14:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562026488; cv=none;
        d=google.com; s=arc-20160816;
        b=TE0Loab6KIyFSh+cKwnVhy8dGk/tIT/LLBYmjzctt+HZFXc9t5tWWtrrw+vlwCskZ8
         MTvH+lLrs0vKPzt2MpfqMzxC9IQ4B5uLWyrTzQXA/tL2T/PYfbRLetmw3bIf9u3gboHC
         3oMSoZvXDRN7fpvy0eLFqV03Y0cTiLnIr1I47WWQONMGd8oT5H1Me/LfxngzSZ8gY9hn
         X+Hj3QYigY5dGJjfYHrxx7KBJuaANAecu55+GCgtFY3mpcZCnmsJpYBNGvDCUJgbs0DF
         wPy3vq6T83PdJKvTKDd7LvODfXt+IXm2wqrdtefAwjZVWv3dSW0AOf81d+IzNoINHfPd
         cegQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=2kvqzOD4mqsOezUi2cQL5zzJLMYMKOIjPyCVCBVNwYw=;
        b=YeRKxeVVmIB1cqbJXkCuDNo6Aa/xFEn91ofT+YJXq4E7k1dZ1ZFT7a4heBTH1UaX7N
         fYohoORLHA09ZK9H319Glt4acTiq4GudBCgsW3ncA+v6Wq6MD+BcdtpjLpZ06RFjDOog
         QIJwKY5QZWNDKHXcuPxH7Ha39dH5FRNgoGE8wvGQBl7oLjdMQUclUfyFdYtcqgXjXA9S
         9D6hTvOAxCLOG1PDxoQiXPIrsTbvVspUq5Y8K+3I1RQNep6P7it8bSAHLJg04U70X/Wk
         x1stEHAV6FqS/JwqCxOAVNftlV3BFi0u4wYTDcZ9wtsP8Uds/6WVb9bKqhyfy4aBoOQ+
         xdLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id u28si83799qkj.169.2019.07.01.17.14.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 17:14:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55F4C30860DC;
	Tue,  2 Jul 2019 00:14:47 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD2431001B01;
	Tue,  2 Jul 2019 00:14:25 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	John Snow <jsnow@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Wei Yang <richardw.yang@linux.intel.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Markus Armbruster <armbru@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair23@gmail.com>,
	qemu-block@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Aleksandar Rikalo <arikalo@wavecomp.com>
Subject: [PATCH v2 4/9] hw/block/pflash_cfi01: Start state machine as READY to accept commands
Date: Tue,  2 Jul 2019 02:12:56 +0200
Message-Id: <20190702001301.4768-5-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-1-philmd@redhat.com>
References: <20190702001301.4768-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 02 Jul 2019 00:14:47 +0000 (UTC)
X-TUID: fT9cC8HXG8xQ

When the state machine is ready to accept command, the bit 7 of
the status register (SR) is set to 1.
The guest polls the status register and check this bit before
writting command to the internal 'Write State Machine' (WSM).

Set SR.7 bit to 1 when the device is created.

Reference: Read Array Flowchart
  "Common Flash Interface (CFI) and Command Sets"
   (Intel Application Note 646)
   Appendix B "Basic Command Set"

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 33c77f6569..dd1dfd266b 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -764,7 +764,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     }
 
     pflash_mode_read_array(pfl);
-    pfl->status = 0;
+    pfl->status = 0x80; /* WSM ready */
     /* Hardcoded CFI table */
     /* Standard "QRY" string */
     pfl->cfi_table[0x10] = 'Q';
-- 
2.20.1
