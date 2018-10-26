Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp880872wro;
        Fri, 26 Oct 2018 08:31:58 -0700 (PDT)
X-Google-Smtp-Source: AJdET5e+YWrIXsujghe31G3NMKe+8woLd0l1nsLYnNZoa2g71k7DqSru0qm1HSpIkcof0+4w+949
X-Received: by 2002:a1c:6483:: with SMTP id y125-v6mr4737567wmb.66.1540567918632;
        Fri, 26 Oct 2018 08:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567918; cv=none;
        d=google.com; s=arc-20160816;
        b=CfaBaQ+XeWm9IAPAUZoo3iCuDGwVB0Fm+cprLp2Qm4CG25co05y2dWUUimot47DPBa
         hrrSyGViK9mgnVdgGSSN9htGubchhuttJWlE3Net1jld8QXrPK+i40caf12l1sOZzE3k
         fscaJpP9oI8PHVtuVmh0498PtTjNmzemlI+V32vBP+eYGA13Wz4K7TL0iYJH9ddsYpFX
         PTDkUwtchg53+1yglPbW3/21Pjj5D5mMe4iFfEVMTMECwAqSsqSkBTucSR2b/kGQwfEa
         D660GeJkCuxSD/Ux0VGlX8nopLotxclILBP2he5/oRnj2DWfipgmQuVYErK04Are1G0d
         FKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=h8Is6ZlK6KghHO/McdY7YhiNvQhp4nrDR4TpXrDWhRs=;
        b=JFg1CC+7nOqBLCqxIRee961jr5bJwedUQ8bu3HFrrgeMiXIJl9R1htQ6bIfqXsrGAg
         QFUTO9JgQeQP468dKIb0Hetj+49QkBowCB2YI3y8kup1eKqzc0kq3aAp4DogNhDvvp74
         dDXWn36oJTnqo6o1ZS6cEV3uQDG00sqPmvOU8pyN+Mz4ageZMbxXxtUqrbHDpFKG70ts
         ZIT39ZYou3DYHHdLbVYgzMrStLl11tV2LUh/Y/SCLQZp4OB6HAp3Ai270x2UQml/XRhI
         fSiEZWfYtrNoqHlcGB0SSYGGKe0ZyA06U1EusMlwlqRpDqZzoPoVC82YPy8FcueZCxg+
         caew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.134])
        by mx.google.com with ESMTPS id q16-v6si3572817wmq.2.2018.10.26.08.31.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:31:58 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.134;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MTw02-1g6kOk3SfS-00R3T7; Fri, 26 Oct 2018 17:31:49 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MTw02-1g6kOk3SfS-00R3T7; Fri, 26 Oct 2018 17:31:49 +0200
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
Subject: [PULL 04/20] tests/tcg/README: fix location for lm32 tests
Date: Fri, 26 Oct 2018 17:31:09 +0200
Message-Id: <20181026153125.24738-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EqrCcCCeryytj/EJt3z+yvPaYKZmo+zIeqXRDhM4eiT4LD5VtWt
 XJDWHA9dqlGUPNVoPTS5vrGwQtX7WRjb8KrjCiNro3nhuJhF9tAhaXk2PnCjcguW/qfVlEW
 OXUG9066WSidDiXc2d7fW+koK6xO0INnTgOhGeeMcB+nGnnIitXMwXifNYqDGXM+hes1xKb
 JwztgEokHeIxqwQlDmNWQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:gxbSjhlq8I4=:STMEumJ8Sz+ty5IwIg/FB1
 AFtEOP+h3oIIQS0T2rUik2u5roQibFBgBavr3G74H5678wEF1W6GIVceCw31+o6XwfwR1RMBf
 m0Gq2NPhBPIu1EiFvk9aaLY4HRL5OpQTsKR/d+MPJOx2lHOhMwqN4jnXHCRjcdGV+/4MLaqdd
 oGgvompMUsypet3dwP+I0j3wM8uoXPSi6+KbsFIEZUuX2uCHNyhuA/g5otXnT8BinLS2i2/78
 ZoUrARLrUSv1WAqLuSyoqeTvxVy71vbDt2m6lfHkqPO/gKX1eUcd/s9iN1nEC2xLAy3fJskos
 EphgktAY9EZuZ+Y+acHy/jzs/DBj3Eh0N/VkWAs33Ve8ikh+Gbyrf8ctfdCecMkoT6LhVzfkN
 OAI7ncLVqkwcbUUtI14Kbg5cl+gTv35P7LA43TLoskJLTxQE2STzluxM5pg0Zb5q7ZLjLPm6g
 XaFq4ixfhpIpLYBIouGRl6Piitgyz41IFDoEW84LjrSvZ17K1doclJjApwqWCUqtNjdbe5Vv2
 c+4MlcbufO4v4zH6spt8tP6wOuZZsbt7GEjl3FcrydCbKQ6YLVlyQ0QUUPONulC6GL69hUMQk
 n11mJlqmL1T6mg0J8qvu9Cm7e/IF6B6HpNYT6iQpN3Ho491EMByJcpJsc2rJBSAM5kxUo5fzt
 H6knrHll5RdgQZ0UI0eszuIU4yCkAEgAMRA5pC+qjckUGWdLC6zdiRD72ntZ5a0mkZqn8JFbt
 Fjt0gjbxRq8iiOHF
X-TUID: RWGQs4v2y/j3

From: Cleber Rosa <crosa@redhat.com>

Point to the right and obvious location for lm32 tests.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20181004161852.11673-3-crosa@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/tcg/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/README b/tests/tcg/README
index a5643d33e7..2a58f9a058 100644
--- a/tests/tcg/README
+++ b/tests/tcg/README
@@ -10,6 +10,6 @@ with "make test-cris".
 
 LM32
 ====
-The testsuite for LM32 is in tests/tcg/cris.  You can run it
+The testsuite for LM32 is in tests/tcg/lm32.  You can run it
 with "make test-lm32".
 
-- 
2.17.2
