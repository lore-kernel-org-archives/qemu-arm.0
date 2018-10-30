Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440229wro;
        Tue, 30 Oct 2018 04:24:04 -0700 (PDT)
X-Google-Smtp-Source: AJdET5e7ZYkQ8J0BpSZSE2AeKh3IZJgAzuwKwd03D54ObDTQoDpav/Bbmkue5EsSh47JlZgNtXn7
X-Received: by 2002:adf:e34d:: with SMTP id n13-v6mr10349702wrj.158.1540898644872;
        Tue, 30 Oct 2018 04:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898644; cv=none;
        d=google.com; s=arc-20160816;
        b=0jaH8ScCLTxVuxZ6jOvTEuALrNCZO22+LAwcjTWeNSdglQuis8Us2fOwrrKpwGSkW7
         Ex01M3gANVgUuj4k/JlFbs/HrQjbfXhza0AUO3aY3Hi9eNjRFc3j0PJNqERVclg21aM+
         GsT46upSCNnUucCIvi3Qy4iiFbMXWb4S+Lm9K++sGAUstrfQPsabpMOl6s1kfr/oQhpO
         tydRTIU8TZd8N5uRJKzl6zz56AOjnGsQejluc3E0lcJPt2iScJsmdIedUZqbDf0wcgjq
         wMO7yMn7haSqfwEdDz5KeZXfBXr9MwxC4zyM//muH2LkBwkFEHQSKo1rmX6U//SNuV0C
         9Cvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=/CsIuiB+skwdhSrpe/BjT+1uzRIbua4QxtSgsnBKVO0=;
        b=KDJLxeeJHJuL7LTgaYp3Ybi8M7H+WTNorPwnQas9izTzeZEnPVl5GSsj4hwMkxQZf7
         u/0wtMxTDmTy3XtjIXyOwY5Nq0oowD1s4E2BWhnhwYPe/elWLD/D+oS1W3nGAzLnFAcU
         EBB4uWsJC2vrsnjM5VSlBuVdpNtE0BwsnPh/NQRRrSMU+zVCxi1lNOIMMb8nqHX3gUgl
         DB01W1EVtSezXEYYRCe652P4VXinT6OfbhXtJoWZS7YbiuMXG4BB5crI3eWdx/d2AqlT
         W3i0ayFUb4M4zrshS94cAVouSONd9d6mpmJDwVgGQGb/OBqJcGDRnOLnjt9DaLmD2MwL
         bKdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.130])
        by mx.google.com with ESMTPS id a4-v6si6993367wru.160.2018.10.30.04.24.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:24:04 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.130;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.130 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MpD7H-1fmRyA3pT5-00qjfJ; Tue, 30 Oct 2018 12:24:02 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MpD7H-1fmRyA3pT5-00qjfJ; Tue, 30 Oct 2018 12:24:02 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-trivial@nongnu.org,
	qemu-block@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PULL v2 08/20] scripts/qemu.py: remove trailing quotes on docstring
Date: Tue, 30 Oct 2018 12:23:25 +0100
Message-Id: <20181030112337.17973-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UtHzenpvkmoIR5/LsVJDipAqrOqtG3nw39d/ulzdI53DYC+EbVR
 KouSMMO2coulXWrvkiwIWNDCVSWIbpWqKAGbjpDtahupFSF0XNi2JYebztOqdt9nDb3upt7
 NvDA0LGYiF07gg245v58VXoGc9LosIDKVjZpzja4u04jgNpn3ek+XI7yJMfN1GmEUlMioTL
 +9DifyRj86RCe8rPRa83Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:elqk0PMnEUI=:CwXmlMJt2K2ka2J+PyU3K1
 aJ6IU0eo5eonT22ctfPJWh0D4U+pYX4lW0IlfYRM7IqKy+MQbH+gPQqjkqgMf7hjV7TY+xwm1
 ojZI9hgnUDBsCykPXQgjFz76hLb/eP6Z0WN028Pz+kSLyJerywwf/pW6dtBM2PbyiLwGFWucm
 IFXcahvX6LCik1X2oUu/g73S+K9iUgUNBihWQPMz0UsmsZjKf6tX2yUtwhZrRfpPK11vO9xAD
 yXB9KDOUg3U8WX0WgHunVkdLqpFvvLTextN62UiAXCr48NPAENjdq/zeZgXd6MifSHzgYqJGR
 HzlMGsREIlfSKucNhR3qPv0xzz+QM14UBccXxSylLnrBmnNagCeoBp53C9Qvr0MaeXXRwnlux
 IrSED7doIUyRLZLIr8rIe5SIofWKiGIZK2f9RyVzbkXPsTnwSPGU57stMQW9Tql9cmfdAoyw+
 kyENpWHNmo7OBW9UnC7lJfZ4tVorEQDbCu9wP/Ly9ZshYq4P5lIMBaaJviHfjRpN/stSHazSr
 EDR+7I7/4It5VnPIkOOE4iS4FGD/Uv9EvwZFLUHTn0cFRqeEUbc0lOCxmzL87uxd1mlobASPg
 vWaeBVficokM6WWBwbdT8YCBAjEBbPzHPHlLMU0nztfoRJWqradWwjs1mJrOvQR69JSmTuE1W
 pT5SqXHv8xnzrpWsaByE7VpzRFk97MUk830Ro9hO2hSnG74+IayWmwqw0pBZ6qWzolnb28TK/
 HuxU1/IDxG2n51qv
X-TUID: BnW+/KY19aZR

From: Cleber Rosa <crosa@redhat.com>

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20181004161852.11673-11-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 scripts/qemu.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qemu.py b/scripts/qemu.py
index f099ce7278..b0b2f12ce6 100644
--- a/scripts/qemu.py
+++ b/scripts/qemu.py
@@ -87,7 +87,7 @@ class QEMUMachine(object):
         @param name: prefix for socket and log file names (default: qemu-PID)
         @param test_dir: where to create socket and log file
         @param monitor_address: address for QMP monitor
-        @param socket_scm_helper: helper program, required for send_fd_scm()"
+        @param socket_scm_helper: helper program, required for send_fd_scm()
         @note: Qemu process is not started until launch() is used.
         '''
         if args is None:
-- 
2.17.2
