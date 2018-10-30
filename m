Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5440662wro;
        Tue, 30 Oct 2018 04:24:28 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cRMLi4lVZET710qOgr+c72zbmEYQC35ohdzQAqb7auHwTEqZKTf5B9HPsusS5HWBtrrwL8
X-Received: by 2002:a5d:4645:: with SMTP id j5-v6mr17182087wrs.194.1540898668227;
        Tue, 30 Oct 2018 04:24:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540898668; cv=none;
        d=google.com; s=arc-20160816;
        b=Q+BDp+8j9ZlYgxWFQa8BWw9V6PnGCqWj8rR3mGKnkjifahUgew7Pe1j/G56WaZ2AWL
         eh+iHvuygR7r6YVKKJqIGF6BH9TCq0mGJxHRjrf3kgR02ENAVeE1CnWyXUvuGBvWjuWO
         h4GcqQLr9Q0O+nrLS+3ouTdvi/872HG0LjagatSNp+HrKjfSACeLfp7JPUPX4eM7ykbh
         JsYXw0mfVPgrLhxmIYs+Fc9S5Okp8OhfP63lmXKX6sfifSjz1GP4501b9+8fDoA28BAh
         /VoNFDLITrxC29P3b4+4HU2tddYpv/7dw1mGjGyifJtnm5nE4D8hs1bGRimAapQeT6if
         qM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=WFc87kg9LBDJnpDmj44WyS7UWtkcUsACEih56d2kGZo=;
        b=TmIoajM3VlQbwJFtzpevr48YAuLK6RGn75jLHIR+6uKcZNHf5xFJ5MhAwDqVertxLL
         quhn0T4+1Yr8vHFmj6u7nDALeUFm7lx09/WyBlWRGfDydhSx6sXi+hyCm+smhoCcRYpB
         HB1nhXX1gAf9HPgiXiHNsDn/8eI7V2KFESz9DQddi1RayczdPkRq2PaPJhQJx+nDyPc6
         iaVoc6phuEhJLmucsAqB82rFFzXkBvhiwuKNXUkpwJSWcimiLvoEUgXSAyY336b7P+z+
         9M4Ipfm70/k4PPbxmAMH0DaD+ovQnA3Oyd7eyGA8X+4lc65pd+RUn64i7mf76REdNjFk
         0wGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.133])
        by mx.google.com with ESMTPS id y18-v6si15503310wrl.266.2018.10.30.04.24.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Oct 2018 04:24:28 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.133;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.133 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mgvev-1fd8Zf1xuf-00hQH9; Tue, 30 Oct 2018 12:24:22 +0100
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mgvev-1fd8Zf1xuf-00hQH9; Tue, 30 Oct 2018 12:24:22 +0100
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
Subject: [PULL v2 18/20] hw/intc/gicv3: Remove useless parenthesis around DIV_ROUND_UP macro
Date: Tue, 30 Oct 2018 12:23:35 +0100
Message-Id: <20181030112337.17973-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181030112337.17973-1-laurent@vivier.eu>
References: <20181030112337.17973-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TYAOM2UPEG2JBrG3DvbA0XzcWbCUGxCmCQZzQFwpas8OwFalWkQ
 IfAUy6Uz0fyXww+ircB3twrD2TNA22GqjI2kzdr02wHQdG8K/9xvk+YczYH642jaE9/ci7i
 z26UlhE4FjoZBH7O1DVnKIBIzB2wGxkRhnCbkgMSo3QNmc6wDOH96bMe7N2z599xz9UHIbk
 CEY/dc0S/JA70X+T32KOg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:v5/9TckJ5bo=:xqSfrIMOY/cr1Lc1v3RRE3
 LUBNJ1JgPh4xHAHG2L0GU4m7W9O2RKs48lWkGAMuU1d3iW3oHf+MnGmr3opwqFCYbQ7DCQpEf
 3T0FCdbN8HhQ7oICi34MrhZJ0DHBDgfzonYqAekslYT7CIIPVBkN+zYbnQPa6lrkBBvltDdbq
 SEmbjo+PLuwlnV3SzNYv0UsPgIWtkCtrNv2n+DnqjYogH8lAei7ZuCyHxEXjtM1wicgejiakl
 tmxHdaHlgEKJOlTVZQWY6YdZqg/BS+d1/qIwIOoBqf7zyCziCXCIe8gf6VCO01wqKUY5vS8XQ
 FdYHLlP8uGjd6CE09JzcvSaqoamGZKBgoYQqHwhP7ZCG1edjAbrfn4i1gxx9Fg3eZxWIs0L0F
 B0BL08W0mdwVhEZNIcgCw1KzPRUPuW0Y2Ac+G7sSGkt4/jlPZ56+XjTzalVV4LENb6u1zdfz5
 WdJOR6guCtE9CBybb5L3a5nj1fL3Glp3mBH058XhrFB+q0l/pgJ4QcvJ+HcPWET2QS8aIlHiG
 iMXcy2hHUxZcLCFcHn+lEDeRN400UjlJ348ybgwi4esi30xharK4zAM4GXCBFBiBJMh5FUTJb
 cjf/4ZLCyWTMOb3OeHLF5WQ5juCQ6v6XNQQC3xuXlh/vCus9WIagv3Z6bzJMLAY+bqroiW1v0
 YrtQGM7iY+GfOZXqO6nZbFRcowrEyDe7nVzGfoeqjx+pm+eSSFRZHdLh1Nin8sxg3rjlqFd6P
 BqKmd2bK9Wkxko78
X-TUID: hbSu+QQoJCJv

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/round.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20180705155811.20366-8-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/intc/arm_gicv3_common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index b798486ecf..31ec9a1ae4 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -62,7 +62,7 @@
  * avoids bugs where we forget to subtract GIC_INTERNAL from an
  * interrupt number.
  */
-#define GICV3_BMP_SIZE (DIV_ROUND_UP(GICV3_MAXIRQ, 32))
+#define GICV3_BMP_SIZE DIV_ROUND_UP(GICV3_MAXIRQ, 32)
 
 #define GIC_DECLARE_BITMAP(name) \
     uint32_t name[GICV3_BMP_SIZE]
-- 
2.17.2
