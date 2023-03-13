Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169928ejb;
        Mon, 13 Mar 2023 04:45:00 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Up9P9qslc3+F3wlD78WEE1Xz042j6s6BZDYpq7WKA9YvlpK64og/ulY7ijF3MXA8xaG3l
X-Received: by 2002:ad4:5ced:0:b0:56e:ae9f:a51b with SMTP id iv13-20020ad45ced000000b0056eae9fa51bmr13874296qvb.39.1678707900408;
        Mon, 13 Mar 2023 04:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707900; cv=none;
        d=google.com; s=arc-20160816;
        b=yYIZ01Z5N7S+Y7tgYmKKzm5RFqUcJebP6cKzZW+Q4bCNmbPKXR5RAQONARM7Z9tlyB
         CyFkLJXJW+DyikWF/QEhVytGIK7RVSVjH0rbN/l9fA5XPC25t8EX53r62O6qr0a/XVgS
         PQuzQjw0wV7uBIg0WWZ1mBlRimg1nMBKLAJ8sWLo0Q0LYqEdsGfdEAWkaozlp5qthmwJ
         IgoH/T58HhMEZNLgEMd8ESctMLLwy0mBTJ/IkF927GcE9+b7VVUoG++SmSr0S/ggkGm7
         qoKqeQwKpCW3lpBYXKbHUX6CQU88iCAOj+XwQB3fHeeJQeBQ6kxdp0xVzcS5eqpazNm1
         ak0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GfH++KxViClX79pJGZ1W2CFcXUv/sIf0i0Z93ZRwtmQ=;
        b=FmQm9urXHjCq66+ssSr616f/0fREB8sJ1yZFSGo3ZhS93BBJd0IfR6fIOQypGfrUo6
         O7WJdVzJ+mGTV0tIRBRg/sm/YbDEKaMHO4uoYWkoWSpysUq4pS5G5thwTxLwnjCN1VXk
         eHs6OP3m6USoP7HzLOBVdhn73IzSBptAT1Igbt1akXraDBNaHOEGo4IDbos+b4hHYh8f
         CjvGQZ+Y7SMhkc9i1qnvUT/8SN9XNTCQ5GQmq5AmhpQJGIEk5PMCRg8L0P2jERYFX2/D
         L/GVgaMPxVglnJ3wNS7vSyJvghBXip/fMwzMe5nrp+ej6Lba88JDw+apgu2qWMZUwfGL
         xVPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a10qiXR8;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id m6-20020a0c9d06000000b0053777675214si5013370qvf.512.2023.03.13.04.45.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:45:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a10qiXR8;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfH++KxViClX79pJGZ1W2CFcXUv/sIf0i0Z93ZRwtmQ=;
	b=a10qiXR8DGoX+a1tNwm6CbNwit0TWIOSi+KPEy6wZVP62DyfapjvVuZ45n9Jque12r6gSw
	2wfNSJRLWRj/drCw/lWnLSeTbToo06OSfYDr/8CNG9C4PzZdJAAB6pCInDGU8DeQQ+x42n
	qKAuAi36/+2/VeQmCFg0qRbdvMC6qiE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-zjTJOFOVNXq8tpCTZYxpVw-1; Mon, 13 Mar 2023 07:44:55 -0400
X-MC-Unique: zjTJOFOVNXq8tpCTZYxpVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BB233823A02;
	Mon, 13 Mar 2023 11:44:55 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A4D540C6E67;
	Mon, 13 Mar 2023 11:44:53 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Hanna Reitz <hreitz@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PULL 16/25] tests: fix path separator, use g_build_filename()
Date: Mon, 13 Mar 2023 15:43:26 +0400
Message-Id: <20230313114335.424093-17-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-TUID: M4JQ5dl86Pz0

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
