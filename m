Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp172391ejb;
        Mon, 13 Mar 2023 04:48:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set/yq6q3FT2LHrL9ipvgU2BPK2VZp5EZEB8uQFTYz/BLnhDcfyCGS86loemPpawQeHGDXv+G
X-Received: by 2002:a05:622a:110f:b0:3bf:aa66:b9e2 with SMTP id e15-20020a05622a110f00b003bfaa66b9e2mr43429858qty.37.1678708095795;
        Mon, 13 Mar 2023 04:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708095; cv=none;
        d=google.com; s=arc-20160816;
        b=g9j3gPjvTxel59zG93QojQkNZfPnuHbM+AmqivA2AdJigz+SAD5sXeHTPPYQYeF343
         Fw/8sJonz8H8VXlaupMBOZptI77O7xlvyKbJ4oRXcy0i5Qlku9Agm0rnNpBwsB8aCAU4
         GO5Orcr+GJc9saDxnAvQRTJZ3TyzfLP38UslULoqE9+GmwYwryejwb82oQMjpOsakFjh
         jBmDJtGwDOQAl+jxmvcYgy25KRuiMWSXcuWBaJPqumdECDcvCMq07F2fKcA3t/u4fmsi
         RuYTKjygLWWJ75ZoNxPwnJrgoNFxDSqjIOgKT743HVZtEOM6XRHRp1YQyK4syZoxl4GI
         cSvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=S/KoWKb/m8WfBVa5j8E25z6nwOPM59iFUJ4sUBu8cTM=;
        b=RQtY2DzCS50ZGJzEtLqOpJ1ep5RQAbnIKNjSYo2N1Oa4iftKdkJa/YudHU7WV9FlbE
         vdf3k7V/ItEll8DQrIG7IMZBU37S3sVw6oRkxVy1c4kSu1Ir1K347PGPN3pYUWb2lMQU
         plxG8OphAfVCvQbDURWO85ZYceiyZ5hRZ1RIpD9tsyPQovwA8rrM9nAXSIA/rM8Af6sH
         LT1pZtSveBiypUnx0HVMFyjsQsGJ6TUX6DG5aHSHQjcM07pbpNeqf45OATFVAIjTndrc
         H9mELLbIpf3mfLL7UmfHT9nddSE0WV8880D732KgptFjYA5S1IhRa399O678bUelveIZ
         xkng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=akU8Fp91;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id p7-20020a05622a13c700b003bfd1838170si5058597qtk.438.2023.03.13.04.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=akU8Fp91;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S/KoWKb/m8WfBVa5j8E25z6nwOPM59iFUJ4sUBu8cTM=;
	b=akU8Fp91hpjM/rCFDLcFOcw8jkhP/pLiq2akmePeP6bXxGRZdbVisbQPeu7S6CduOQjG4a
	GdgnZKj42kH9a/+ZZhEXa2txiCpf1PSzVLGo8TYFlvzpYU1muwZ+a61V7n65MkIQN+s7Ot
	gLgepgZg1qMDl1ijEcgrC/tsCXnmb5E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-UCS8Il92Mwi_ang5Fs5t5Q-1; Mon, 13 Mar 2023 07:48:12 -0400
X-MC-Unique: UCS8Il92Mwi_ang5Fs5t5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A46C811E9C;
	Mon, 13 Mar 2023 11:48:11 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 857CC1410F1B;
	Mon, 13 Mar 2023 11:48:10 +0000 (UTC)
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
Subject: [PULL v2 17/25] char: do not double-close fd when failing to add client
Date: Mon, 13 Mar 2023 15:46:40 +0400
Message-Id: <20230313114648.426607-18-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: XVhpJwoz1k9T

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The caller is already closing the fd on failure.

Fixes: c3054a6e6a ("char: Factor out qmp_add_client() parts and move to chardev/")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230306122751.2355515-3-marcandre.lureau@redhat.com>
---
 chardev/char.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 11eab7764c..e69390601f 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -1175,12 +1175,10 @@ bool qmp_add_client_char(int fd, bool has_skipauth, bool skipauth,
 
     if (!s) {
         error_setg(errp, "protocol '%s' is invalid", protocol);
-        close(fd);
         return false;
     }
     if (qemu_chr_add_client(s, fd) < 0) {
         error_setg(errp, "failed to add client");
-        close(fd);
         return false;
     }
     return true;
-- 
2.39.2
