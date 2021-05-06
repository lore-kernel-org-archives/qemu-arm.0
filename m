Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1272273lfg;
        Thu, 6 May 2021 06:38:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz41Id+xqlsGZ5sDhtBZzLvVY1PIZGS/Pmu083Je07jjWW6I5H1dGL6r/drBGChujZ/RX4q
X-Received: by 2002:a17:906:dc8:: with SMTP id p8mr4396691eji.75.1620308323058;
        Thu, 06 May 2021 06:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620308323; cv=none;
        d=google.com; s=arc-20160816;
        b=tpjrku9k35SmIDl5/Hu+drzKN0VFfecGZ5fxi886g0F7wIdqdRNKHKxGYTBEGkCrNr
         raMu283G+Rutr67GJqV+SLkqxXiuwhFCyogHxJQV9qHBsxpAg3MEnrQISn6u5x1GgBrV
         VNKAoO2t4fPDoHQFJmgMbMvf9/fDAoMjScpUAzm4Gh0CVaJOpxXwVoPM0qJdcEHEtydn
         XbYmhohb51+Jc+X7Qn8EDgNSC+9wx7n0MUAQjwEQ/2TAC8Y28asfc6ZMn1YCcTvmiPo2
         QNLqFljd9cqPqfUbPosKeY11B52qmKOAqXGiPKcRPnP4PGJ2L4Xh90aDG/YzGvuhGPUg
         tOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NaJZZTBiusehu1Tq7zBJHOToPc0jvSFCIFWhGsqf9q0=;
        b=Lj8bnNbEetW5x/QEao+svh+0/TC1WqQYRlVmTfEfMyMR6xsFOhhsPdlZjIfzSNb0r1
         3RrFVmYIuyW3Ml/1/d47OSdjjEPOcLOrNm+UlCRfFqQgJtXuemiROOOcqZyDAEL9gWM/
         RrsokmjghuyoqmYt1VlgVoHfXB6mIJ6SfmCiJKCjv4SpWRARryKhXiOWkv2oKdK3z54/
         /JtBXmiVeW3VRvC0mq3pB15J/AVrK6Q6EDaoI8ORNIre85VrCKfYz/Ob9jsO55mjkd1f
         oxbY/5bmiiiX13bOAgfSh/KClmQTVAt8haoxx+eTSKpMEQEkMcAykg18JBsmc57zYdOr
         el7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hGtn8O15;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id h8si153252ejj.270.2021.05.06.06.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 May 2021 06:38:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hGtn8O15;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620308322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NaJZZTBiusehu1Tq7zBJHOToPc0jvSFCIFWhGsqf9q0=;
	b=hGtn8O15O/o1UBFGjTniiU3j/IvfT6EfQmpfu1Y9rQg7q/CQxYYBbARCADHwo7nejgRqtG
	YLJgToS3LmfmHmusPXT9iUQ2O81DGATuE5UF9gIDOw2Q6Zgkg/hMqI8BC6gC9qi4Ejqrco
	0SPixaPMjKyzMPPYK6wnQ/7GcQ91emc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-g2tR_Wm9PJmd4_aG2DRV1Q-1; Thu, 06 May 2021 09:38:40 -0400
X-MC-Unique: g2tR_Wm9PJmd4_aG2DRV1Q-1
Received: by mail-wr1-f70.google.com with SMTP id r12-20020adfc10c0000b029010d83323601so2192031wre.22
        for <alex.bennee@linaro.org>; Thu, 06 May 2021 06:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NaJZZTBiusehu1Tq7zBJHOToPc0jvSFCIFWhGsqf9q0=;
        b=ugaI/upf0gjKnjZ3CAg7eLy2L+/9za2tDbgH6Cn7IUVUDlVb4AUZ9f0OEzO5PIjOCo
         I7XzsvwrRN3e3Q5gMqqAYvk2oMGVnzyAYEjjKE9MTmMPJXjGZft5FDy2DPszPJNC/VYb
         RaBz3zyppo9itVtCs/3g/Nv/oswZxf4xTQLVKEG3u5YvJ8fx1p98bsVg/3ClJVkwJf3B
         laW+Ugt35sejLSUB9jx77ygIlQw5BCiusrwM4FIO9ZOVK4bpEV5M0Tidmbg9FFblBKSp
         73dsy5dVkDVvtGQPTO2q5RxF8CqSdKbJ4ILZ7zlLEQmlzqahBpvAGToMNKEsGW9y7d1b
         Nvog==
X-Gm-Message-State: AOAM5316YuBNNSrkWYnMCHdrivJyr6SS2CKMOM4I+1YhQMFdbYYZBkRm
	dmQNuqmQh/r3LLJ2ImmkZtHQ3FdEcl8Z+7pVvSjNuPA9bNCEZ2mXqNN+TE/iukSgPpObLGevDhV
	jvbfTZe13JcFAtI+N
X-Received: by 2002:adf:c002:: with SMTP id z2mr5292542wre.100.1620308318912;
        Thu, 06 May 2021 06:38:38 -0700 (PDT)
X-Received: by 2002:adf:c002:: with SMTP id z2mr5292527wre.100.1620308318789;
        Thu, 06 May 2021 06:38:38 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id l22sm9501029wmq.28.2021.05.06.06.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 06:38:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH v2 8/9] hw/misc/pca9552: Replace g_newa() by g_new()
Date: Thu,  6 May 2021 15:37:57 +0200
Message-Id: <20210506133758.1749233-9-philmd@redhat.com>
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
X-TUID: gP8hCOYya0Ar

The ALLOCA(3) man-page mentions its "use is discouraged".

Replace the g_newa() call by g_new().

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
