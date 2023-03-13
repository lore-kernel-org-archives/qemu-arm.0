Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp172331ejb;
        Mon, 13 Mar 2023 04:48:11 -0700 (PDT)
X-Google-Smtp-Source: AK7set+k9X+r1ksIW8t+4UQJE1DxscvHIRua0v5QecFB3BEZ3za864ymHVVCfc/ueekyLsCRMXRQ
X-Received: by 2002:ad4:5cee:0:b0:56b:ee79:aacf with SMTP id iv14-20020ad45cee000000b0056bee79aacfmr13037550qvb.42.1678708091595;
        Mon, 13 Mar 2023 04:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708091; cv=none;
        d=google.com; s=arc-20160816;
        b=hMey0Typ6AK12N3yLSEJzr1V/M832alDzcbGCkmd56uYcq591C1US0iym3CmVWLXjl
         U9FpB8L/sHm18JR2wnsz6pmKecZSD/tVHQ6LZmjkPHOE3GQZoK63jn/Vt5dzHA25xhL9
         LiJ8gmp2z7srScBFJLc5Oa30qR9D3c6SzEkDnE+O0daxJRhMStb1+dvkxGlNmiB9UJvu
         oXC2AiXrhyDzkztySIzAIycBCqVkARKkH+BzuNm408mwe6BuxeIZBkLaHIlR5vo6GnzZ
         LgbkQL7f0onnxClWpBogE+EtKujeg+ZQBmXm8R16imPHa48xIlBFHenCtHTG2fykLl0x
         4JgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GfH++KxViClX79pJGZ1W2CFcXUv/sIf0i0Z93ZRwtmQ=;
        b=eArNXTJXnpA8DsK5B0Irdr+sMbAvh3DcK51hwYQbXmUu6Xi8ilVBNtqfRMxEcJlfuA
         4YPQVJZFWADFW99QBhZhp1PXuodvKfBAvSYxwefjSCMM0lLiKnOLl/i70ZpOeHzpCsWf
         8XOpoMovjYy5IY4GT0brm/bvjTSs0XbYgrwuXzotm1QI8LkZ3cA6db/ufVfk2O5u6QVX
         DP5oVW9k9jb7TjzP46YeMZXfNIbUtheu146Zy3u7QOUWYVVAnnG67URMfXR8uOS+L4w+
         xvd0YYIkHr9ekXcdLmve5tj3eeqZDxxOSoqZYmPbqvcC/T44ElD3jmFlJkDSuQX1G3YQ
         tbrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BLvQVwka;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id m3-20020a0c9d03000000b005a50056f964si2530897qvf.531.2023.03.13.04.48.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:48:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BLvQVwka;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfH++KxViClX79pJGZ1W2CFcXUv/sIf0i0Z93ZRwtmQ=;
	b=BLvQVwkaOyk14NdhuQHJDvPSrTvivkDbLVHB4K3C86VWUBP5JlaX/pjd0vgeK/bgLOsjg7
	R6J9q7Te/JptFQ41rtBRsREO/X1jVtwfAXW6qkmPOUMopESCaCWm8b1JzQkhS8rOIpszR7
	XlJALSTAYd4f75LJGvxVEKXArHb0JpQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-6x3g4c71P2GIzKsaCKmxCA-1; Mon, 13 Mar 2023 07:48:07 -0400
X-MC-Unique: 6x3g4c71P2GIzKsaCKmxCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8EF88027FD;
	Mon, 13 Mar 2023 11:48:06 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 409FE1410F1B;
	Mon, 13 Mar 2023 11:48:04 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	Thomas Huth <thuth@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Beraldo Leal <bleal@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL v2 16/25] tests: fix path separator, use g_build_filename()
Date: Mon, 13 Mar 2023 15:46:39 +0400
Message-Id: <20230313114648.426607-17-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: a+8OxpVWptAM

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230306122751.2355515-2-marcandre.lureau@redhat.com>
---
 tests/unit/test-io-channel-command.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
index c6e66a8c33..4f022617df 100644
--- a/tests/unit/test-io-channel-command.c
+++ b/tests/unit/test-io-channel-command.c
@@ -35,7 +35,7 @@ static char *socat = NULL;
 static void test_io_channel_command_fifo(bool async)
 {
     g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
-    g_autofree gchar *fifo = g_strdup_printf("%s/%s", tmpdir, TEST_FIFO);
+    g_autofree gchar *fifo = g_build_filename(tmpdir, TEST_FIFO, NULL);
     g_autofree gchar *srcargs = g_strdup_printf("%s - PIPE:%s,wronly", socat, fifo);
     g_autofree gchar *dstargs = g_strdup_printf("%s PIPE:%s,rdonly -", socat, fifo);
     g_auto(GStrv) srcargv = g_strsplit(srcargs, " ", -1);
-- 
2.39.2
