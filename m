Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1106822lfg;
        Fri, 5 Aug 2022 08:20:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4yVuL0eeVIP4Yx98OW2RD6EwvCBbb4OrU2e4nhmcMUIECCy0QgVM8qJTQaZWjv5onQbPlb
X-Received: by 2002:a05:6214:c6b:b0:476:ac2c:cba with SMTP id t11-20020a0562140c6b00b00476ac2c0cbamr6134050qvj.21.1659712836706;
        Fri, 05 Aug 2022 08:20:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659712836; cv=none;
        d=google.com; s=arc-20160816;
        b=k/MfWpu06TRr+J3COCrSS0z/FuRRNcjCqXMOlfkfdpSslOKXoBGlYZqegcCLyvP2bB
         x/dXE9+rDD1eAGBsq1x3wvJ6eCnKrwvHb/HhVaW+EGbZaY1a8dg/Q6nzjlIQGkSgDDHF
         vsnnqGTfwK/1PUL5MRtfeDec4ITNYVBgxPqIlM4cOEBF0BFLr4ACSmtaQS1lnxB5Y3c2
         da9ks+nX/aeXWp9IrL1cZQChHf3eKvuq7TzNmScve0LtJ8Ww6zC4nzLhbGWvLHCaCRSr
         RZP5oVzBIjfCaO1ilvYlbjArgQeu0c0AIHcZvg6fXRKWKl2yAyt4LBtjm6Tip6sCpHOK
         c1ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6LuvpfQDyrc6Wv358pZJWDQkWem2Ny++jQn9NtXTqPc=;
        b=0E+ni1sfZnhXlbr9siy2MvE6j8NVbqeQIeqJd1+HNDzR0j69yoxMdx9ctrZ7Sp2ldn
         nPta7X6YqPX6wivNuOxieUpHl0VcYAuR81Qf4EFbXcIRC6H6Vx0wcmhN4YnrGGLFiC/e
         ZTYsUhlA2IjRkiAwm0HsERYradtgVV6VLj2B/I0P5BYAp97ecC5AVn+hoMfWgmwDEe1t
         BAt2FsU4sbtM2SmsD7gg5wLM2fqkgh1Lk9flxt/VH0+tPop7suhJlWsmB41MxYAx6Adj
         /oDBwIh/K2j9jWSw7CZNyN/PKBDLPTajbHcX5JVWR+k3YC+mNWiUoaKNW80f14rAxIze
         IxNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BKM2RdMC;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id fb15-20020a05622a480f00b0033df3076e77si2670218qtb.237.2022.08.05.08.20.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Aug 2022 08:20:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BKM2RdMC;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659712836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6LuvpfQDyrc6Wv358pZJWDQkWem2Ny++jQn9NtXTqPc=;
	b=BKM2RdMCX3cxQAarzKucjKchy2rp0HaQZzH4aUf7O7Pl72vPyAjtLNuOQoHZ1DtRERJH64
	gt/XH7tPQw9aFHgFPtxgHnECzsiQezFXu6qSng9mvUZ5a7uPclr+2m6zK+ZI5fIURMCUM7
	+usnMzWj/aY8uvQgehbdoUaddOqOKXg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-7wzStZu0M96LpbkPvbIXVw-1; Fri, 05 Aug 2022 11:20:33 -0400
X-MC-Unique: 7wzStZu0M96LpbkPvbIXVw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 688192A5955B;
	Fri,  5 Aug 2022 15:20:32 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C3CB2024CB6;
	Fri,  5 Aug 2022 15:20:29 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: libvir-list@redhat.com,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL 3/6] target/i386: display deprecation status in '-cpu help'
Date: Fri,  5 Aug 2022 16:20:11 +0100
Message-Id: <20220805152014.135768-4-berrange@redhat.com>
In-Reply-To: <20220805152014.135768-1-berrange@redhat.com>
References: <20220805152014.135768-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-TUID: HuLjLgGGXl9e

When the user queries CPU models via QMP there is a 'deprecated' flag
present, however, this is not done for the CLI '-cpu help' command.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/i386/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 194b5a31af..1db1278a59 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4837,6 +4837,11 @@ static void x86_cpu_list_entry(gpointer data, gpointer user_data)
         desc = g_strdup_printf("%s", model_id);
     }
 
+    if (cc->model && cc->model->cpudef->deprecation_note) {
+        g_autofree char *olddesc = desc;
+        desc = g_strdup_printf("%s (deprecated)", olddesc);
+    }
+
     qemu_printf("x86 %-20s  %s\n", name, desc);
 }
 
-- 
2.37.1
