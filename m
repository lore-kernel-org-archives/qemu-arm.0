Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp881516wro;
        Fri, 26 Oct 2018 08:32:26 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cYNYV4QngDPt5zjMvjdWHACs64VQZUqJM3OEZeNmMf3VAsg2PLQx3s9v6veu0LKFB5t8A5
X-Received: by 2002:adf:92e6:: with SMTP id 93-v6mr6457017wrn.124.1540567946032;
        Fri, 26 Oct 2018 08:32:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540567946; cv=none;
        d=google.com; s=arc-20160816;
        b=NCHLCpyVtH+aYLU9nTfEXhiwHProZ9NMIrw+LM1O0p0w3vS0fQ4XFc3LbJqSc+QObq
         yTHC+6j/LH67iFqU05I+Jkn00TxXMntjPMMYUFc8oyqXCyPOLOiqhgALAMgBn7IHj5FG
         2ZtTVrC0lOxDPaSYTKoPie9Reddyx/Yuyj5cbEsYv5c7sZ8qFz8Oe7NI+RGH/jYnFd7b
         Ex+cVXCiUfE1iFtAYvizKcYtXwAt2fpvPrpqszk6V1G63lOmrCyix6nC3dqOuFrvgqqC
         /e0FkxvXmX5sGpsikR/UjrhTy7Xz6eOwbDwhCGILnWHu/WsylyE1e0xuEw2U614T6Hu/
         QJUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=5+FK91EiMz7zwPVdwTNxGbaLkyUtEHLv99gvZtsbh8c=;
        b=aBSG0XtkxOWO8iOV8qekVK4tncH5GalwrFVUwX7nE1nNA7FaHxLd8Ji4a1ZFa1UoQL
         vRZdThFy7veXn9t9Zn0OrbftT6zINcrV9B4FfD9lf1fnjcGMJm9Xf20ipdQsFfL8P6LI
         YmaJsgV1R1KzWrI8E9ZecIYT2L7+ztb9nFg1kAeCW9IdQXyIugSudspWWTWggUhDJgXa
         CYNjnq2OykCFHvRGl0FyxDdX3s+yAz5edQKsC0y2bEgt6yMdkeAFY0imDh0UoE2rnH8c
         MPAX/IKhrZHQSmh9g9Sjifrw3aj7g9U1bap/6RQjSpL4P1IdM7WmxrDfbLjTjz0CbYia
         aZhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.134])
        by mx.google.com with ESMTPS id q4-v6si8861216wrj.1.2018.10.26.08.32.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 08:32:26 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.134;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.134 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N3Xvv-1fXPaQ0kwV-010fOy; Fri, 26 Oct 2018 17:32:13 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N3Xvv-1fXPaQ0kwV-010fOy; Fri, 26 Oct 2018 17:32:13 +0200
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
Subject: [PULL 16/20] tests/bios-tables-test: Remove an useless cast
Date: Fri, 26 Oct 2018 17:31:21 +0200
Message-Id: <20181026153125.24738-17-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jyFUglwv22ZGvQhGYHhC9I79VIt+cGsDI6GkuGxaHtotGw1i812
 NY5fhRWppxfts+BIGYlT9+CFsQBIi9YOPobjRk6yGrv7p3XJtUaiEHuzfaYcPre/54W/5fz
 u+S8zriEuPn4ob6AJ5IVDCUEInX/eLQckyi5EMhYDLS/1YeouXlhmUe3diKxFl3lxdGxA/W
 xShGMcOi94+N8+L+g0tIw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V01:K0:/1PXSljl2Y4=:6Kj16mcRkzvlI6uvICand2
 KhQJ/ZKwV0E9ydZSHLRwpUakacRHwHVnnDwsXo2rD+OB3WdN2lTW9g41qOJxLJ3ruvMsnIYyH
 UhMABuBkQ0R6UaAgFnGLVmR96kOE2UF+D4CTaq9XoZCL/DIqnbcOmHcU7U4f9EZkzSwUWRsNE
 b70rVKHVbX9+A+ZyJePcd+cIBKnqCc/ezrK6opSjT0oIfGYPVQu3vlshpJdg/j+vkM6KzPbsC
 GApHIJoeGcjbHhIoPc6XV9O7SluYMnJ09IgTvvs/27VLnkpEQqMvAXIwGswtgjdthNlTHsw+4
 f/Vyt40YleKh8d+S1h8wMkUfCezJ5c6NIKE8RbqTR1y55RbctbQXuKYnD1cmPW8LdwLTiWhVQ
 KNZsB+isGvHRkpyZ/1Fk+1smheBVN2znegsKs0sjW+LIkHviJXrf3elt538yMByqqzd8potmR
 K9JpltaDes3yfdUNrdvjDek6UsB6r6UPvmb7p+GEltz0FgSBjeAB8TCKKRjscsbLgUyi8MJGz
 fhBGs2KIyfrwTLVHP/sy3ybI6edLQ703zdKLELxQMzmS0V5o8RzMKPJcRNpvmgEMPtfXiCd0d
 fFa5sYi4VDRmHmjElP8sckOhb1YQ7V4q+Z2ijW4r1vrWGYqaEMVbCZScObm8dmTFFtr1Nn08S
 SI1u73UPQkoljvXGXeVoV4yphSbfEplPwl2fv2YE0eszq1iboFiNVrwdf8QZmJNgk/Ysu82C1
 HNHEZ3Ts7yqxZHSV
X-TUID: 6HTtR05gA3l9

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Patch created mechanically by rerunning:

  $  spatch --sp-file scripts/coccinelle/typecast.cocci \
            --macro-file scripts/cocci-macro-file.h \
            --dir . --in-place

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20180705155811.20366-5-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/bios-tables-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index af4b1fb6bd..02e77ec811 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -319,7 +319,7 @@ static bool load_asl(GArray *sdts, AcpiSdtTable *sdt)
     ret = g_spawn_command_line_sync(command_line->str, &out, &out_err, NULL, &error);
     g_assert_no_error(error);
     if (ret) {
-        ret = g_file_get_contents(sdt->asl_file, (gchar **)&sdt->asl,
+        ret = g_file_get_contents(sdt->asl_file, &sdt->asl,
                                   &sdt->asl_len, &error);
         g_assert(ret);
         g_assert_no_error(error);
-- 
2.17.2
