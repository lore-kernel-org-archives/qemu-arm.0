Received: by 2002:a0c:db0e:0:0:0:0:0 with SMTP id d14csp1075373qvk;
        Thu, 10 Dec 2020 05:51:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWx8+gcMfo+DAprFK0cbNGHY0NgZDPrxuozDcC2J0L7KwnZjdkgaCfsr3ptxIjEYYZZc3o
X-Received: by 2002:a92:dc0f:: with SMTP id t15mr9188256iln.267.1607608299789;
        Thu, 10 Dec 2020 05:51:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607608299; cv=none;
        d=google.com; s=arc-20160816;
        b=zIwOl1q3pf9r/yvXum0zDA7ThK6maShCxpFtL6kop+4vG6p6mWFM/ZpDDuw+13VDgb
         dSBpemQxTh0CMxfZU9YNQNVCEl4Z7xt40J3OEl+EotOk6zI/ZqLlMidlrW+ST8o6McLx
         pbw8P049KkqjZ31ZzP20D/26bmQ8HSMBsTjOkuAgTxNEePtICWvJVJ9M0VAKmSyJe1VB
         zE1ZjpMA1MDY2QxZPRhMX7CPqydb0j8SNCR7vnGMfembmfD5y0zUL1zWsW83Fdq/Vlyt
         0xMUHGM9hKE0mb8LFOotrcQXHobnM50HW3RHtAmd6bPmaW35NdgQ8HuDcLwdp8piAdfB
         2hPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:sender:precedence
         :errors-to:list-subscribe:list-help:list-post:list-unsubscribe
         :list-id;
        bh=655teq4WQH113PO8F0kS3wL4OZKf3txyzGY5haGVOpE=;
        b=navwuuhNIw+S1ppdVqs8vgcB0I+MdO7NX2J3iePSbktjr8JxW6k+EsFe7ggJ8ZvKod
         MpsOQ3roJEr7oy3aOo1HNY0dxJiimnGJKL+HLywJG5AvMFEUYItd/M5JCY59zAM1WpvS
         b+qz9wvXSZF6DUKMkUlLL8CNmVYOo6Efwr1bwJSsu+pEzqJ5yUatkqBPuKA2Yul4CUwM
         dHBi2A4BuuiC7FA133+GFOQIGl6qxjM0fqxxFbJg7sJ17lmYEB5W4+eYj08QBu2i+fNr
         pKttPNzpcjc+FtTVjP+DA8555As/1GCSB1TnPtd9IhmTf10KRaylerPTFLfHgBLp+ucP
         qCMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iOk1ZZZb;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id f12si1681944ilu.115.2020.12.10.05.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 05:51:39 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iOk1ZZZb;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.49282.87151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMKx-0007yk-0B; Thu, 10 Dec 2020 13:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49282.87151; Thu, 10 Dec 2020 13:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knMKw-0007yc-Rc; Thu, 10 Dec 2020 13:50:26 +0000
Received: by outflank-mailman (input) for mailman id 49282;
 Thu, 10 Dec 2020 13:50:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nlUt=FO=redhat.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1knMKv-00073v-Es
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 13:50:25 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2a74ba27-cd5e-4a6b-8b69-3da677a654ee;
 Thu, 10 Dec 2020 13:50:21 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-Gmi7SMuINcumk-1cNlsFsA-1; Thu, 10 Dec 2020 08:50:19 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79F67100C662;
 Thu, 10 Dec 2020 13:50:17 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06182709A0;
 Thu, 10 Dec 2020 13:50:05 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2a74ba27-cd5e-4a6b-8b69-3da677a654ee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607608220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=655teq4WQH113PO8F0kS3wL4OZKf3txyzGY5haGVOpE=;
	b=iOk1ZZZbmSaC4t74ALXYq1wQzlzd/EaoS6VEfl+7CHTEfP8Cso0/cPKRJXn0Sb1grYaQXE
	7ajBmjD3E9tFgCpbgln2IcAQY1vzhwLw7NywdoieILo0I6/NNcpsWc80Y4403Z6AtaJSDw
	LIe/63q7kPRTTldA3uE4vxIanyzXLGM=
X-MC-Unique: Gmi7SMuINcumk-1cNlsFsA-1
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: philmd@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 09/13] poison: remove GNUC check
Date: Thu, 10 Dec 2020 17:47:48 +0400
Message-Id: <20201210134752.780923-10-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hf0tsgAhYu2S

From: Marc-André Lureau <marcandre.lureau@redhat.com>

QEMU requires Clang or GCC, that define and support __GNUC__ extensions

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/poison.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/exec/poison.h b/include/exec/poison.h
index 7b9ac361dc..d7ae1f23e7 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -3,7 +3,6 @@
 
 #ifndef HW_POISON_H
 #define HW_POISON_H
-#ifdef __GNUC__
 
 #pragma GCC poison TARGET_I386
 #pragma GCC poison TARGET_X86_64
@@ -93,4 +92,3 @@
 #pragma GCC poison CONFIG_SOFTMMU
 
 #endif
-#endif
-- 
2.29.0

