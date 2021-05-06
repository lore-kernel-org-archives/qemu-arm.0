Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1272197lfg;
        Thu, 6 May 2021 06:38:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6gf0u0pwn2Go4Y1MTeBLaAVEiF6fL8GlpdfHT7kB/JvA7gSQ883LH4l8a4OPe8uIov6Ny
X-Received: by 2002:a17:906:52d7:: with SMTP id w23mr4502606ejn.451.1620308317693;
        Thu, 06 May 2021 06:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620308317; cv=none;
        d=google.com; s=arc-20160816;
        b=zWh1KJsd3+8OWE3UQ/VpFI2iCvGWWmMfcuCAodkDyQQmvTvHsb/yjXNwtWnXFxTWnR
         rWxZHk0XSNflZygyvKVovyuHprzAzNPPMNPx27+ULNlwj6QLrdcSgOUyu5RSza/ALSca
         QixSCrFm97crR104QO9bw2Rjh8K5gIgzd91qa703eZP0XAoO2ILf+5aU7q7Z3f4kKHjW
         eRhSP2Q5yy1xmortLRYLAWhdpqy8luiO3m+6D0aJGxeuJ6ufNlEr8ln/jkwoz8sF3PCt
         Yxam69U+0JmBaSsM1vsYywajCImxrhf6tVDdpIiMoz4ReOu+IQIL4wjw7fTJi2fMFQpa
         6hkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=k4PLS6ZKiwbiAj4ntOkzSZGX4ZG/Ux0v+1o1vvVJrYM=;
        b=r8YrFgX3oPZ+UySHM4200OvFxXMl2yaLjY48M3PXyQqJHEmXGVXLHTHnOVmoHZsKCa
         JexFrNNrdskHMxR+oIquGicLbbkPWsSpSQvs0nQs74hp1M8hbmCOTcKnQH30JpOxK3SV
         altj/SKY6frMNYVYOOzDGb8XWFvsfXWzZtBSQqUxbQ1N6REQzCX2/quGYo9kmtfKGo3O
         n4RIJrRT5B2OcnQAG6+8qpTsnMeHY+ag9REWutSV3QQ63KB3IdFU6+3ZtXxNIfTjK6rb
         U1+L1asS71bcwo3vy+IGtVQFiywWsXrb+qGPtM46wM+4OivyCFmYZoaPrwCsK+/plD/9
         Q2JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fXK2Y/P9";
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id f17si604069edx.76.2021.05.06.06.38.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 06:38:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="fXK2Y/P9";
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620308316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k4PLS6ZKiwbiAj4ntOkzSZGX4ZG/Ux0v+1o1vvVJrYM=;
	b=fXK2Y/P9RYah5H5Usg5XD7ROW3+c224PC1hsDZg5WY20szqAyp53YtvBheJC5PVPF5TsU5
	hgY7bylhkWSMTg6H6RbwlkuzzflSaZqnLEuT/RatR7SE3Y5lPRN6LqyoXJp5TfYW/qwlwA
	gisZvPU/Vsr4RHGxWQ6Gvt0jGKpBSns=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-_PDvlY9-OV--LTAkr-WUkA-1; Thu, 06 May 2021 09:38:35 -0400
X-MC-Unique: _PDvlY9-OV--LTAkr-WUkA-1
Received: by mail-wr1-f71.google.com with SMTP id l2-20020adf9f020000b029010d6bb7f1cbso2212086wrf.7
        for <alex.bennee@linaro.org>; Thu, 06 May 2021 06:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k4PLS6ZKiwbiAj4ntOkzSZGX4ZG/Ux0v+1o1vvVJrYM=;
        b=FnbqxRrp6+6lfQq23nEF/DFB47unGuCscv9ghMJZFu7vwH4Qi9sL8edSuf0dpYqxBT
         PQBwLHagQx+9Cy8qjbtmns3GvXWJpSSWHemzbOl8rwo3Mv7L+nTqK+fUCxlL2B/dpwDd
         B+vIKR+XEHA8LL6x3zdHHJbZbT53/51jjX0Fku1OGU5MoEP5pB5I1FFONy4wlLUtmV7d
         YdNxtKYI6a/u7a5DIiyOeZ8XNuPe7gIrh928uM+iyYIxuEcRwPWejS/b4dH8630JX3N3
         T4n8KrYXUNg5gyKMW0gzcSoxqaIWFV/DOM8eyiHNHdhJ3Cv/TMfWfSlKqupAIaBU03zz
         x/MA==
X-Gm-Message-State: AOAM5335yHe+nLkun5mHI2g20tycadmlzkMJ8kCWEBjgJb4eUAVyTMVv
	M9eMxMvh7l/194TXY0lc6msZAEL3Tqtaz+bmmL/JIT1mZW87RLc0knBRgeMwZMEIo1U1Dx0nVro
	q9B/Ck2TJIsC31bi7
X-Received: by 2002:a5d:4707:: with SMTP id y7mr5273910wrq.137.1620308314030;
        Thu, 06 May 2021 06:38:34 -0700 (PDT)
X-Received: by 2002:a5d:4707:: with SMTP id y7mr5273889wrq.137.1620308313868;
        Thu, 06 May 2021 06:38:33 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id j13sm4830339wrd.81.2021.05.06.06.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 06:38:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 7/9] gdbstub: Replace alloca() + memset(0) by g_new0()
Date: Thu,  6 May 2021 15:37:56 +0200
Message-Id: <20210506133758.1749233-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210506133758.1749233-1-philmd@redhat.com>
References: <20210506133758.1749233-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NlcMbK/i9Dxu

The ALLOCA(3) man-page mentions its "use is discouraged".

Replace the alloca() and memset(0) calls by g_new0().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 gdbstub.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 7cee2fb0f1f..666053bf590 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1487,14 +1487,13 @@ static int process_string_cmd(void *user_ctx, const char *data,
         if (cmd->schema) {
             int schema_len = strlen(cmd->schema);
             int max_num_params = schema_len / 2;
+            g_autofree GdbCmdVariant *params = NULL;
 
             if (schema_len % 2) {
                 return -2;
             }
 
-            gdb_ctx.params = (GdbCmdVariant *)alloca(sizeof(*gdb_ctx.params)
-                                                     * max_num_params);
-            memset(gdb_ctx.params, 0, sizeof(*gdb_ctx.params) * max_num_params);
+            gdb_ctx.params = params = g_new0(GdbCmdVariant, max_num_params);
 
             if (cmd_parse_params(&data[strlen(cmd->cmd)], cmd->schema,
                                  gdb_ctx.params, &gdb_ctx.num_params)) {
-- 
2.26.3
