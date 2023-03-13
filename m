Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp169988ejb;
        Mon, 13 Mar 2023 04:45:05 -0700 (PDT)
X-Google-Smtp-Source: AK7set8qo9kaxpFiBchiPhnsL0A3szeGxK1uPQ/G/MwP6JBfYvbWBZ3HzRE6p4IInP93oqDIWhnY
X-Received: by 2002:ac8:5a88:0:b0:3bf:d8ec:a9fc with SMTP id c8-20020ac85a88000000b003bfd8eca9fcmr24037657qtc.52.1678707904869;
        Mon, 13 Mar 2023 04:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678707904; cv=none;
        d=google.com; s=arc-20160816;
        b=doH05OJZ89NUrQaOcWyCnS9LuP7K2klZnuzPpozJxIf6ARzO5FSgreym/C7lcNsuWr
         hM0jeqGV/YYukLlqNuVTRQRptolq14YXe7NNtIUxC80sOBU0vRyFXkBEY7HYaa7Fa3+U
         NsngEG18ufaGK7uAlECDZ2pO8x0Qf8wjMwBzukRDuJhReddXQ5xqRnzyTxa8o3itHMnj
         enxvosGfor+2eO8nfLW4RUJB5nWehgJEk3rp8lpRrzfo+EAslDwUpFvjSGkDfaHAJ/0b
         zsnbi26Qi43y3CSjnTb56g/KPssenKOI9vmBA8+ePAL8SkHV0N49TX7d5QINdIk/jBHf
         TeHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=S/KoWKb/m8WfBVa5j8E25z6nwOPM59iFUJ4sUBu8cTM=;
        b=Eq2DBSPLKAjIa0BqzNGsIcmcYqvgg2ZR5K+Tk9nevUAmuLubvrQL2M4Mvy5BuYBjUo
         D09p7GTbzeigdDCBhBrpqR1bsPOfzoNhrtyX61PBZ2LTDL1izizENzm1Nqa9vVlnJ62O
         8pfnCJRX9A3bxZP8NOqmBJkokKjj4gd1FB7nRU2yZ/2kuZ/nKtivm2OiMc59OnkATH3p
         JABrTsydA55YWuJxjTFt17Y4n7fKTQFaPRcDr45IZphfZet+Jd86wgR2VvuycfzIygQQ
         NYwpV7egti8jJ2lJUHpg+uBnOVcOY4xh2RHg0SSEa9hkJTEbUOuogNLKulxn1Fg6auz8
         kAqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f8VW+CxN;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id i8-20020a05620a404800b006eedaa4cd2asi5312122qko.570.2023.03.13.04.45.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:45:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f8VW+CxN;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678707904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S/KoWKb/m8WfBVa5j8E25z6nwOPM59iFUJ4sUBu8cTM=;
	b=f8VW+CxNirXeRf5zlmuKE1fzjO+SGAMi/U9xBMCOOyt6LgiAbbA0ldwblc657cRT5pT/cA
	31bfzWdqpkk/VzHC7O/SCutKkjFAJ6srbijyQbZiJIsdEGudpoQQLQXiyNlM1N+gElkOZo
	XK42e61Wjt9rbBkuydKprY+tm3YpPZY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-BrFNSqfNMGu39cqnLUaf8Q-1; Mon, 13 Mar 2023 07:45:00 -0400
X-MC-Unique: BrFNSqfNMGu39cqnLUaf8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86845800B23;
	Mon, 13 Mar 2023 11:44:59 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B64B51410F1B;
	Mon, 13 Mar 2023 11:44:58 +0000 (UTC)
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
Subject: [PULL 17/25] char: do not double-close fd when failing to add client
Date: Mon, 13 Mar 2023 15:43:27 +0400
Message-Id: <20230313114335.424093-18-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: BNpuXOTODrVp

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
