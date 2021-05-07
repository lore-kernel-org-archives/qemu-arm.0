Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp451767lfg;
        Fri, 7 May 2021 07:44:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNhx+9YSilHRPVkW6WLh3gduZw0K3eQ//cBDg0Pih7ZurkMDIKZ8z+NvU68rPhWy3M0FDc
X-Received: by 2002:a17:906:b5b:: with SMTP id v27mr10434706ejg.40.1620398675127;
        Fri, 07 May 2021 07:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398675; cv=none;
        d=google.com; s=arc-20160816;
        b=RQwNCxGxOvkNfksu/klnz4ds4Ptd6F9vNnA83mOvmCf3z7z4WQnW9q51GMdDCnn7PP
         O9xjj9owV1SEVwM96arcUb9QzxjYPXwYkGdo1FmVH6W3Pkn1i7X68+f2FUiFkdB9uXhl
         86tj2KFksGhmh/31kbZywWtQNaWzK5apt66BgiEW31Re36p8owzG+qpFJlJHjcgIqHWI
         qcPtHrX9HB1RUcmoFocPfOikSdWsMaG4B1NfYFyL7s+B93PkPcYe31MLKq2CL/2a0orY
         FUV7YQSMDp6aJJjG2LRgiXQ82eUwxpZtib3lbe5zMf7TxM6ogFGDD7+cFY3zDZegpiv0
         j/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YCw70biCZtmrujveEn0uP9uiPeh7MzcdOYuA3fJ6mTo=;
        b=ko6sc5dZJcsIdTFfcAaekyxg9DwyMlvmNUAKGCGl3to2rTy3HpF2C5zcGTnxOWXt6S
         ExMaGSwBHxei08q8OYElwyCGW0fq7LCJfgRkKiKQX5RAOun/o7H6eMGqSJ/iCfbbo16T
         EefBLsSX6qHzByfyBW3+icJb3EkVU6/WIdRllS9780MD+yf1Trr6sEPsUB/hco+fnVx6
         EejYR9hBDYRI3DcsLeTUdxcMosDgsQLM2ISdDfSpCAgQ1cB8QF1hBP8SD+FnOpwUSt5v
         1nX+ds44gulf0yDmCeAAhPcQaqEU4+qwkQmPZZr13rLZs3tBx1eAj3KiIDPMZ9/+cJ/0
         w5yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GjxZvMm9;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id z12si4942507edr.265.2021.05.07.07.44.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:44:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GjxZvMm9;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YCw70biCZtmrujveEn0uP9uiPeh7MzcdOYuA3fJ6mTo=;
	b=GjxZvMm9DYi7vsHGV4SBVjgIYY7olEY1at0+8PqbC3RikU3cHKYNiA+WeiA+3JhecAOUXj
	E5ovfE0bro5OAt5HDII5FqfrVzT389EOGwYTuJqwFAWkOg7eg0SrsS7dNSk3u/6m5iRzaL
	jngXPjjjzhpGFT4Aad3aZjvuCkvlTJQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-YWwytV5PMFCFkVIEinrqxQ-1; Fri, 07 May 2021 10:44:26 -0400
X-MC-Unique: YWwytV5PMFCFkVIEinrqxQ-1
Received: by mail-wm1-f70.google.com with SMTP id y193-20020a1c32ca0000b029014cbf30c3f2so3952825wmy.1
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YCw70biCZtmrujveEn0uP9uiPeh7MzcdOYuA3fJ6mTo=;
        b=YJjfHdYba+M4XSUX59+MDnX7PoctWTIFEwJs6DbJSqGD1cDFd2LXcPSOLl3KhLmpFp
         Ln3ECKwl8QKK9tFgkpU6vPF4u/W9g7o6C8YFgh+/2yEdI/PvuIFyMBhRJnDIxZOXIjI0
         pC8RKIqc47C5BN6LUi/sJyzmxLi08Fkw8mt0ik5ei9Xex2gK8pnkTVFjMajulAqDaOls
         Wyv3NAxHxDQ+Nd8V30WlvHkJFCtzIdeuyDemKhWUT3xD9p5R8POObHcWCeLdyQ3+jCko
         l1pEYMrFOk6vmS4AaJ2NjTdRtONb2JtJlaQGAkIGotG/PdUi3WQRmYQMpHTBagE3wTgh
         LlAg==
X-Gm-Message-State: AOAM5310wDCIULRj28RuA616VT33GW9r/jsxUnGSXnO+tEZ2QWDztFi8
	VxmutALgCOoF5JLi5B67zOc0MdjHMklCXmhWieTsyhstF0iUSjKcmNFkEJwEqgI0diOZNTA593/
	OepqlRiX2uyV4p4s2
X-Received: by 2002:adf:eb82:: with SMTP id t2mr9296093wrn.337.1620398665154;
        Fri, 07 May 2021 07:44:25 -0700 (PDT)
X-Received: by 2002:adf:eb82:: with SMTP id t2mr9296078wrn.337.1620398665044;
        Fri, 07 May 2021 07:44:25 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id l22sm12827268wmq.28.2021.05.07.07.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:44:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH v3 14/17] hw/misc/pca9552: Replace g_newa() by g_new()
Date: Fri,  7 May 2021 16:43:12 +0200
Message-Id: <20210507144315.1994337-15-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Gkwi4giV7/hz

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead, replacing g_newa() by g_new().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/misc/pca9552.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index b7686e27d7f..facf103cbfb 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -71,7 +71,7 @@ static void pca955x_display_pins_status(PCA955xState *s,
         return;
     }
     if (trace_event_get_state_backends(TRACE_PCA955X_GPIO_STATUS)) {
-        char *buf = g_newa(char, k->pin_count + 1);
+        g_autofree char *buf = g_new(char, k->pin_count + 1);
 
         for (i = 0; i < k->pin_count; i++) {
             if (extract32(pins_status, i, 1)) {
-- 
2.26.3
