Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp880679wro;
        Fri, 26 Oct 2018 08:31:48 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ckX9gnUqQJ66r2kA7+OEdy8yEgdcLx6FK8sv1hOsGVK1D4jRC8LJ0G+TWClfUThkixybcI
X-Received: by 2002:adf:9403:: with SMTP id 3-v6mr6141179wrq.54.1540567908845;
        Fri, 26 Oct 2018 08:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567908; cv=none;
        d=google.com; s=arc-20160816;
        b=NlqdfNbJu/XnXnAlYeJ66qabuZc5BPOUMf/KwyXQa4ERlG3tm6sPPwJjJfbf4ZhlS+
         wASBEQNj9NrJP0Q+PWyFvF0E20ur0KSdv12g47TNXQVknyY6+ihRPYT2seaWJnNGccJw
         vk6Jvv2lJ+Hyf3lxd3GekX04ZN2JLWiap/woar5dc9I6uaZiD0sd2MDF0691Sp9SK0it
         Rwl19zk7m2UGCKbR5/BdlCwiX0UzBAxOIE5a13panjGzE94f7sVjjXWUJRKA3iHAVRlv
         0gW3Db8LSqhak7WWr0Bb+1EgAc1/5JLsGm35+MWCbjiKhtffac9DvPct/ao4+RUQ9FlA
         A4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=x72wGazpZPqiR4VPR3HYovlBNDCcYn9E9Ay7uvF1WNg=;
        b=FsU3rj2z6YpTCCXFvFFGmU61JHMFBhBSUtz6aljHK40xfcY1hFK4jG0jwlj1KP7/SF
         SsqNC2V4Y5H1paslyqGNqHtT5sX3QFlrHqO7S9ZoSvQ4oHKMMr1fU3z5p+OnmW70XJa2
         kcYmPaBjPwgAVVoaytSompcWR6M3n1J2nFjW1qSZfXH+cStuUQqVPA/R/F9z9pVJoqdC
         Z+0uXaD3ViTdrkKxpuRor10E9jI/e0lE91YI2rkoX3oPkZ4MTCuG3U6Zjui1idToQdGt
         hXCQ/We/CDUwf25XK6fGYfPGgYd1G8MNMneVIi6oTH1hky94MiT5eHPlO6E8D689U7uC
         HxSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.131])
        by mx.google.com with ESMTPS id w1-v6si10133613wrp.196.2018.10.26.08.31.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:31:48 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.131;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.131 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mpkwn-1foOEz3MAH-00qAjm; Fri, 26 Oct 2018 17:31:41 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mpkwn-1foOEz3MAH-00qAjm; Fri, 26 Oct 2018 17:31:41 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PULL 01/20] configs/alpha: Remove unused CONFIG_PARALLEL_ISA switch
Date: Fri, 26 Oct 2018 17:31:06 +0200
Message-Id: <20181026153125.24738-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:He25IKfwYFFVyHEil/j6dKpPeRhUiROgBqc5BJx27k1B1AKKmXO
 qa8n5M3ZE4MoK5dD72n7rLGWNdhQKeKRZLiQb20zepMpYZIyPxxa/tDYamLBUAHqHzeE9CF
 4uCMn0kDcpBEdHiNAh7bfjj9WrnhhbuPeQVYcTLldb4t988sA3gQv3vSBVpdNk+cPIfGu1l
 uaiFLEWI12qDiH0aJW4rA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:6TtGxG1Ucd0=:lLo9Hj/tctiwpnmBpNrNBf
 hyV45z8dHa9qmM3TGPdSvl+k3jr2G3LmZyn1W2g6oPRBE4XSpcdrG9E3WkE9EK/+NU9pYypq5
 EG1tJYW0zhr7tWDypkjZVvxTM4AnQ8LSrBSCLMmVEundB430Pn/Z+1hpz7c3Jbk/ML36ztSnF
 r2PQDbtJR9H8fv8whKhxUdngZRSswtekR7ly4CSAosseCZsNWblwX+msGI9fdiBkxw4yFihe9
 TrYitG1AqLDCAxyU6U0uFoXRUuVHtM+OnvVw3Ik2WZ9nmNcG3g0kF8eLz27DfTLSgOMs0Lb10
 TIsp27Wpt2WvLCDwHG0jrngTLHsDEupVkpCt0XdH9C31XlexChk2z19Zroi6F4IW3X6vCY3Fo
 i5D4ka0H8luKFMjeFLq3osLzPt0a527TmjHipahqnOP4m87vr5JYN/yqzTMs7w/Z8Sf0CNqrD
 c9zizvtI5YPlgL6EvpLuh1F7jwZurUunqwdPI7daHhCDhuBLOP99lBLNz7ZZ0H6cqCKqqxfX6
 cIaAAdzF4vUaYZlHOuT667ktqwSWxbVgXC0GH263SGWxLZLChuATuTbjX+j+Va95ZfT+u/YcH
 kQKgwANzVb9V23a++4YwkdxnsIa/nkatt00ZcTBC1F/gmxBmLKbY2wsZMUHNbagGfXDO4flHz
 NgINbg49DOFmqEeyHssKEWbG7mX4BaFDU1kdvbw4Qr2+QyTUwGxCHBPFkjc1WHUI/i8hoWGjY
 NN1m4AMuT7+XV11O
X-TUID: gBoXkh8Q2AD7

From: Thomas Huth <thuth@redhat.com>

We don't use CONFIG_PARALLEL_ISA in any of our Makefiles, so this
is just a dead config option which can be removed.

Fixes: a4cb773928e047b137c6998209cf2eec857fac6b
Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <1540376314-5727-1-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 default-configs/alpha-softmmu.mak | 1 -
 1 file changed, 1 deletion(-)

diff --git a/default-configs/alpha-softmmu.mak b/default-configs/alpha-softmmu.mak
index eb58b40254..4d654eaa0b 100644
--- a/default-configs/alpha-softmmu.mak
+++ b/default-configs/alpha-softmmu.mak
@@ -8,7 +8,6 @@ CONFIG_I82374=y
 CONFIG_I8254=y
 CONFIG_I8257=y
 CONFIG_PARALLEL=y
-CONFIG_PARALLEL_ISA=y
 CONFIG_FDC=y
 CONFIG_PCKBD=y
 CONFIG_VGA_CIRRUS=y
-- 
2.17.2
