Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440350wro;
        Tue, 30 Oct 2018 04:24:11 -0700 (PDT)
X-Google-Smtp-Source: AJdET5euvOgZeGZKnRQmFzpcod8rdxhDqAm9jQm9V7WxM4PSPXqWaYdKRckRTjfzvyBGvLWZQj60
X-Received: by 2002:adf:b519:: with SMTP id a25-v6mr16920183wrd.273.1540898651172;
        Tue, 30 Oct 2018 04:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898651; cv=none;
        d=google.com; s=arc-20160816;
        b=hnx+R9hUdVfOAv8han4JKIfGZOEHj2/zjak85Fw9irmxGWr/ZVKSjRG+nyi8Y9QeDK
         42OHMkVUJf5NeV8pDU0hk5/wZAmRjkZvfF6nDNiIA6d2g9PdqKSBGyhN9L0kuC76vOnp
         Oa/xltWABqcCVKV1AyMn81Lc9ni0L9lu8UarR7iPT+WiLVEcE1eF6lApbWkaEqE9oVpC
         x3m6c0yl1h3rTnU+znDgCi+omZhG7GF4QKE8UHZPDOV/rAL4aVIsLhisaGtYxNEwpNAs
         TD9zdy1LSN3H9XeI3dXpuEwpQUk88QWSNDyuCbAuIagOul05nHetI8kFpmXKmvImbf+B
         haqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from;
        bh=H1g7uAYFfliUFwCjuIzZo0P6uBxcYGghcQyoLVgeGRw=;
        b=gcYhRgZV66SPnV+zYlVEenSx/lFR5HsBXTstUM8h1TnWN76hu+KnU7AYxeH4868tWA
         OwRLUbPmqG87Oi9ya8cVtpDiuUhNG6i14iWpPaArqFkcSZ1a+EVbR73aCiuMqVge9yjR
         FrBj0+zKC7YNQxjgeLhRtefODSnr4NcVoc4xXkzYOBnIqiJVsQl51juk3po5Ha5kWhRF
         n/Vaq2jIyfL9iQ+Q5c7xJTboI12CvY+G9muj/eI1znKgMvfjnozl7ghbFJbbsiAze4Ty
         dWkjFSI0OAtJamNYdn/EIi7vyUxrP7PuSHOPmfBZ9zTIF3wKb/KTSf1npiTczcIdVXuy
         k4yw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.135])
        by mx.google.com with ESMTPS id f6-v6si18849474wrh.303.2018.10.30.04.24.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:24:11 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.135;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MqsL3-1fn0zx1rWb-00msqh; Tue, 30 Oct 2018 12:24:08 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MqsL3-1fn0zx1rWb-00msqh; Tue, 30 Oct 2018 12:24:08 +0100
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
	Markus Armbruster <armbru@redhat.com>,
	Li Qiang <liq3ea@gmail.com>
Subject: [PULL v2 11/20] cpu.h: fix a typo in comment
Date: Tue, 30 Oct 2018 12:23:28 +0100
Message-Id: <20181030112337.17973-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
X-Provags-ID: V03:K1:Yjf2ebhyBBOqqgfJyr+mzJqt5S8tkY4j56FZpmecQpTDZ/v4uOU
 faHtWIUMSDvWVYzOvNMV2egasm5Nv/Sw86QCJGPHvRHZetzWLbGZLwewTg1GN5UCCMix8Jo
 2Hc6CFJ9FGlaIpdH5QdtN9CSvoHAfCACXeilSysUSbI5v9quFdAc7IvB9U0JMUqXumqcrWc
 MVgQ5/EvTTQjlLI0YXZyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:+LC4JChDFpQ=:9My5E99dnArsVIYlhHsbIJ
 xKWIRA2JWFSl805LKNHOY1RAxyIY+ZYTJ5K6DqhsBEIQ4ajsStioOlZb6tKb++8xKxB/8LzWY
 nPlFMX5w6CJDNQJxGRR82urgKZe9kdl2n1lT8gK/Aj2H99P4hB8onnq8UM5f0lL4lNy3CyiHR
 Xe1uqk72xRUZYQXHBxB3q3YgGA2+CILp51r54byEq7p6rMz9jt4++jmVG2QYG+ghzKhOPitDa
 8Bn0Q4i6d8kAf2fmjLMgUwr0YkxhlaJ+BPApJsb/5iYsk5K6sf+ADyjNgAEFRs+UzDZWG44FT
 G0XWc4RXKnXYNWBaQffU1G87MSrhpgHKnlTMgnLEZVqFwQagiD8CmWgZfVI89Jxz8xNqF5A+B
 dSni8uFfc+b3ZFWdjsxynYkKT3QIqD/b53JcLstaSkWrnpCmGw0dkN4MohmDtzGjBLdIeOGLd
 U8nN3HmZAlj6QyGXzQJwOG1RkTo8dDomSh+k0JVIT58cxodTQdOMEAmlIhd+P2/Dr5nBrOUeh
 HUpKr2NZfCTOTIVIwlggRkqWAqZGMdIijZE3f4C1rLcFGUvxc+cGvERszEBBjNxHZrlmzS+D1
 nwe341NK7vXSt230PYaSv+YX0Z5xsmWgxplU36y6npeIB8hugIV8iN3ig4ttKz81VTfwNu35I
 i/YFCCaTYbQnnqOfRkMJKwo9McooJXQc4tDF43rwWo9V3IH2ftmEFFlfw1qZM2ZUHJYE=
X-TUID: Iz07wgoEVyuy

From: Li Qiang <liq3ea@gmail.com>

Found by reading the code.

Signed-off-by: Li Qiang <liq3ea@gmail.com>
Message-Id: <1536150548-2797-1-git-send-email-liq3ea@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/qom/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 4e238b0d9f..def0c64308 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -852,7 +852,7 @@ extern CPUInterruptHandler cpu_interrupt_handler;
 /**
  * cpu_interrupt:
  * @cpu: The CPU to set an interrupt on.
- * @mask: The interupts to set.
+ * @mask: The interrupts to set.
  *
  * Invokes the interrupt handler.
  */
-- 
2.17.2
