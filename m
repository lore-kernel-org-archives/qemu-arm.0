Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp172170ejb;
        Mon, 13 Mar 2023 04:47:59 -0700 (PDT)
X-Google-Smtp-Source: AK7set89zHW84/RO2bBdO7MqzUtVoNYMWFs3LR4UM7taW5lFTWZ1R1Tt9mXe9PKdtRwLi73CP8VV
X-Received: by 2002:ad4:5c8b:0:b0:5a4:690b:abd5 with SMTP id o11-20020ad45c8b000000b005a4690babd5mr8321587qvh.19.1678708079802;
        Mon, 13 Mar 2023 04:47:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678708079; cv=none;
        d=google.com; s=arc-20160816;
        b=tEgc8u04bxLTKn47wKruea44RRA1m+NPs/BFaZ3md3NjODa2AXoN1P+AFlkZsINx2w
         1lw6pwxytF5NtUiQXS1a7EKQu784K1RIlbByFP7V0wL19FDQ8bqyWFU8KAOx+YyxG2ie
         x+4BC6VoZB9TZWIcqVTT2bkMSlgn93981FKPwgCnrsEfoPbWGd0sEn5cEbwr0sMVWm5n
         kpxMYyXE7fSXDsRLn9+851LVkGC+mrNIFgxLYu0E4DiojDh+mpNvGakBlh0FCXVa2/OT
         C49sT13S7GbaFVP45cbeLCdQvH74jNvrWLUriNse01mmWYATzmXDkROKU7+kQw8GN5hE
         FRIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=2ZtHfe71bBeZH0qfQl+pgQTnbShfcreRwLlaFYvhfQE=;
        b=XC1QnL2pOp/9EGABupwuT1oGokOxv1Kap2/nghxknC+t87D85Ehs9hHzEgQ/yVqTLM
         0OYt4YyA+dzpDwTrpf7UQEG/b61DMyRkN1bpfv3oO6aZ40BDlaL17xxZZ9cdbCFkrHSQ
         UDifK9s3z3k/rZJF1IhwloFH3YmbRaSvQv+MngOj1LO4E8M+uWt7BQcdUmxNt9wJU64k
         /WCkfsw7aiJApeNwHWJuOPXszwlRMWJZWE5mukfR28Lnpkf3IL5+UykdrV+uDRGLjl7B
         1PMlASJ6EWfzl4OQJZEvendMNQ/mf11y5YKmvD73aIippLpmR81/SF/CQO629ANGnTgH
         KI3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SWe2wvfb;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <marcandre.lureau@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id g2-20020a0caac2000000b0056ec0893eb8si4624842qvb.320.2023.03.13.04.47.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:47:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SWe2wvfb;
       spf=pass (google.com: domain of marcandre.lureau@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=marcandre.lureau@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678708079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2ZtHfe71bBeZH0qfQl+pgQTnbShfcreRwLlaFYvhfQE=;
	b=SWe2wvfb7JcY4hD3CxU3EMMLLJ+yI+nHze4f5hWA0ksnvkiByh1H2b39MvEIkzQqcRJt5o
	bCTkyPyIsPH8sbLApi1j1fOEXi6WAAdvDchdyr4/VjeE6bAoky3teTOcNLfpv/Gbezn7SV
	soiWOxOVqkxg4y+OMbx6eZ7Z048o7W0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-SuXFTmrzNGO35vcvJMHF8w-1; Mon, 13 Mar 2023 07:47:56 -0400
X-MC-Unique: SuXFTmrzNGO35vcvJMHF8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8A6C3C02B70;
	Mon, 13 Mar 2023 11:47:55 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7953C1410F1C;
	Mon, 13 Mar 2023 11:47:54 +0000 (UTC)
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
Subject: [PULL v2 14/25] os-posix: remove useless ioctlsocket() define
Date: Mon, 13 Mar 2023 15:46:37 +0400
Message-Id: <20230313114648.426607-15-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: AK8Arnb55nbm

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The API is specific to win32.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230221124802.4103554-16-marcandre.lureau@redhat.com>
---
 include/sysemu/os-posix.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
index 58de7c994d..378213fc86 100644
--- a/include/sysemu/os-posix.h
+++ b/include/sysemu/os-posix.h
@@ -52,7 +52,6 @@ void os_setup_post(void);
 int os_mlock(void);
 
 #define closesocket(s) close(s)
-#define ioctlsocket(s, r, v) ioctl(s, r, v)
 
 int os_set_daemonize(bool d);
 bool is_daemonized(void);
-- 
2.39.2
