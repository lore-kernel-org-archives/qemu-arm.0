Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2082957ejc;
        Tue, 14 Nov 2023 06:39:21 -0800 (PST)
X-Received: by 2002:a17:906:ba88:b0:9ec:fbbc:ae7e with SMTP id cu8-20020a170906ba8800b009ecfbbcae7emr2843943ejd.3.1699972761025;
        Tue, 14 Nov 2023 06:39:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699972761; cv=none;
        d=google.com; s=arc-20160816;
        b=AjgzXx6VAsvCJOjOXqz0WUAe70rtl5JTAA1yZsmm80uvPa4vySIW9MVh1eL+opyHRT
         0fRrRBqpH3XZlZhf8jboci83CzKVJz08jbTDONvq8HjhXXBX2anYl50guSW7oQKFqRPF
         d4xTlSOqpw33rDscrQDDJERglfglbluZv23EPdY9KuUAFRnJNbSE/A6mxK/4cczzRT2z
         a3Ocl7/i0sGiqR93xnyIqN4IEsXo41ZAezK/PX+OLz31oaq5adcv1F0bfSxo/L+vkrq8
         5zP30OzvAENoX4QR0SzT/KfFiMgyBOiWC8Fh0SKtQfmPqF9+cd21yoIy28GPOt2aHCWA
         WGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UNMQSJ9n3HwpNaurQlo3tUtiIa6U/WmLwhKlbRCATs0=;
        fh=u/Wif5K7387Aui9ZOpASZm7saE4L1411EstkB3LJxDQ=;
        b=w36C9LVu4y8Jtl97wFLcZPU7wNJPTpo0ngejzD0PE26/4LdU6hEGhgGX7mpP84w/nB
         BnPM8/SbOVbdP0DLrfCNKxnJKtcRxXjpleRpI4YaWnBY9v+NsKMR7ySqKToeDtz/iTn1
         hECKOdCKVISdT3G8bxN+MGiX+4o2TRdPWw89JKB/fPVE5QhNuT7c5xHt8MURisfv1wwW
         bTYnwIuBoahmTj/NAkCmA7zG23wOdq2LCwJV7UCyjhIdzCLNNwjAgMXmtJy86gRkARkr
         Akrb9NtPwa6WYAvPTXqX9PrijOmC8ATSTVAlnDXcsuOuKJiRiDtkctSa/QwhOIuyenUg
         lEiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FyEYpQyC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 30-20020a170906209e00b009ae58cb9a3dsor1444560ejq.9.2023.11.14.06.39.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Nov 2023 06:39:21 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FyEYpQyC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972760; x=1700577560; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNMQSJ9n3HwpNaurQlo3tUtiIa6U/WmLwhKlbRCATs0=;
        b=FyEYpQyCxUiUQxLXNICQJzr+/a87EkRU6KzUjnoNqYlMAzkSg60c2z/MS5lGwR4FEU
         LeKmK7TActVUiFGSCkgMuHm7xjSOae9vIrZWYAiY9aeBZSzLMozJL0562jiQ6uH8D/Fv
         ZhzsmaYDPdbom/QEwHC6Nu8f86pDiB6daw03E3MJqnXnweTD7DTFvYmK+h1JrRkoGVxO
         dHuT3CUX5mBlTKGg+TT2PQ3yfoelNh58YtIqYoALhbpNThuzYpuOKKDtzkJGubChC4cD
         5l8cud2y+2R4mnSR/rKMPmfDYOVgu6fVaSyVTHAPcW3YEsOCq3fWc8+FrZlxit1Th9jJ
         XCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972760; x=1700577560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNMQSJ9n3HwpNaurQlo3tUtiIa6U/WmLwhKlbRCATs0=;
        b=dT9iSlXK//kK4ixPTexteA3950Mlq8W72tD0fP6IsSq5PTXbOfJY6KXLnjFWelsg+F
         QT5rvamZYqWm2EEt5IKEzXbIwt8ickNk7Jcwow3JvwCpaz7KvfPEFt00BVUHid5flUxV
         ayzHOE+P/XIzR0D/9NNSIwBQQdieIFUXC+psMKKYz7dJ7ZZ2+wqF7YKybUlEjn9EPnl1
         UsYW8pe0hZgFIszKwFATOfPPNNPsHAir/CLMWNAAS6WDFNbmDgRrh5EpN+jF6okWtV0w
         UeBsqDFKHlalS0ZayWgA96Da9bwu0PjulXPDg8/ovQ4idWQyRVoaD0p/0CNPuaPY7CfS
         HQqg==
X-Gm-Message-State: AOJu0YyN18KN2cPN9PWDdnCWmK1BhO3H+Ac3vsxnFhERkqoBa80Ew1Wj
	sut5ehtIIWeN0zJhMVcxfkrKJmez
X-Google-Smtp-Source: AGHT+IEprkHMikBtwTk6Pc2HglM2aACFqynKnIxKilr0MgI5mWMBku8mpMF5XwofVv89mcZ1ndbJxA==
X-Received: by 2002:a17:906:d7b2:b0:9ef:b466:abe0 with SMTP id pk18-20020a170906d7b200b009efb466abe0mr1430110ejb.8.1699972760684;
        Tue, 14 Nov 2023 06:39:20 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id rp13-20020a170906d96d00b009ddb919e0aasm5622830ejb.138.2023.11.14.06.39.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Nov 2023 06:39:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [RFC PATCH-for-9.0 v2 09/19] hw/block/xen_blkif: Align structs with QEMU_ALIGNED() instead of #pragma
Date: Tue, 14 Nov 2023 15:38:05 +0100
Message-ID: <20231114143816.71079-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: JeXq5wiO87rE

Except imported source files, QEMU code base uses
the QEMU_ALIGNED() macro to align its structures.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/xen_blkif.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/block/xen_blkif.h b/hw/block/xen_blkif.h
index 99733529c1..c1d154d502 100644
--- a/hw/block/xen_blkif.h
+++ b/hw/block/xen_blkif.h
@@ -18,7 +18,6 @@ struct blkif_common_response {
 };
 
 /* i386 protocol version */
-#pragma pack(push, 4)
 struct blkif_x86_32_request {
     uint8_t        operation;        /* BLKIF_OP_???                         */
     uint8_t        nr_segments;      /* number of segments                   */
@@ -26,7 +25,7 @@ struct blkif_x86_32_request {
     uint64_t       id;               /* private guest value, echoed in resp  */
     blkif_sector_t sector_number;    /* start sector idx on disk (r/w only)  */
     struct blkif_request_segment seg[BLKIF_MAX_SEGMENTS_PER_REQUEST];
-};
+} QEMU_ALIGNED(4);
 struct blkif_x86_32_request_discard {
     uint8_t        operation;        /* BLKIF_OP_DISCARD                     */
     uint8_t        flag;             /* nr_segments in request struct        */
@@ -34,15 +33,14 @@ struct blkif_x86_32_request_discard {
     uint64_t       id;               /* private guest value, echoed in resp  */
     blkif_sector_t sector_number;    /* start sector idx on disk (r/w only)  */
     uint64_t       nr_sectors;       /* # of contiguous sectors to discard   */
-};
+} QEMU_ALIGNED(4);
 struct blkif_x86_32_response {
     uint64_t        id;              /* copied from request */
     uint8_t         operation;       /* copied from request */
     int16_t         status;          /* BLKIF_RSP_???       */
-};
+} QEMU_ALIGNED(4);
 typedef struct blkif_x86_32_request blkif_x86_32_request_t;
 typedef struct blkif_x86_32_response blkif_x86_32_response_t;
-#pragma pack(pop)
 
 /* x86_64 protocol version */
 struct blkif_x86_64_request {
-- 
2.41.0
