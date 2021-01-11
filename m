Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2763234lfq;
        Mon, 11 Jan 2021 07:20:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzpTsdiKCfh47N2mBFlO35ODmaxEFHXLKK7LZctw1lU+PfWyGhJjyJivICgyynMBI5WsPw
X-Received: by 2002:a25:6648:: with SMTP id z8mr355878ybm.190.1610378436665;
        Mon, 11 Jan 2021 07:20:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610378436; cv=none;
        d=google.com; s=arc-20160816;
        b=EEVvGhn0Aamz9PPPAfJGKkylO35OLXBS1gBSW/JNIpe9w1VLVHSHYgiNMzYdGi1rgK
         J/tss9yLleFb4UjSR9lO3eA60IOdsJbUxk+nioPdx1Zkjbvm2lqVA1jDK8CKl/MIXDR1
         4fPjwFf4J1KOOjUmR+1xEnVJOmB2TwM70wuszfmVBZTbVJn4hYR7CCOS+OIupTs2liCx
         6fSseq6cngLKkVvHIQLseAGjzRUDMQkelCp+8c/WjROtOMk4vsNLYiPN4PRtRbX5rcaH
         ORInRU5HVFtUv/wH5wLldIxfkwrQxxPFk+kYqK7rKFzgDhUkBps9p/Jq8IsS/EG7FDP4
         +LHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=97BNT6jh6NRO0TVk+TL23RreQDhzFRma0TINePq+NK8=;
        b=rZA/zF4ZBnIt9Bb693ksl4T2EDc26aCuMAssYzWEVTj9lc1MsdMVd3ZWEOQ1sKrVtD
         aycfF+P+7E3sDQvAiRd5JR/6Xf/421NcbIQyfqfiQ6TQnclpIiboZh+erNoMTpBGO2fR
         1sRrFYruXlmstWkbvNZ/VwaMxvK3/I8TRczSvkq0p0rXQvKH5/TA2gDt7rw5rW225CuC
         ZM9zOJJrqEhKjqBURNozK+uwA0MphzPfjbkMeyD1VCC6D8FFvvbxdlmu81gimBUGQRWr
         mvjbz8ibi1SthUZ352Tw3ixy9+ClOS2gnifGw+UAGfV8YAcaFjB3V2iJvAPPlWv6zLw+
         hVJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WmrD/QML";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id v1si123475ybo.42.2021.01.11.07.20.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 07:20:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="WmrD/QML";
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610378436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=97BNT6jh6NRO0TVk+TL23RreQDhzFRma0TINePq+NK8=;
	b=WmrD/QMLLe6mMlP9odwpyo3CG/WprmCO3tuHBOCOnFr5nKsyybD7J8lFKV398L+OslpC5T
	k2U7+AjUbAeco4+MvOBuSrrnulaYnN53YwinaYfDDo9g0cjm0QjFwHDySsIZZhcJrgT8sR
	EkSNuvQjbOH01Ut1W9TpfFYuPNYBAu0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-rSTPNDnSNde_Q3M-eEU4Xg-1; Mon, 11 Jan 2021 10:20:32 -0500
X-MC-Unique: rSTPNDnSNde_Q3M-eEU4Xg-1
Received: by mail-ed1-f69.google.com with SMTP id z20so8333468edl.21
        for <alex.bennee@linaro.org>; Mon, 11 Jan 2021 07:20:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=97BNT6jh6NRO0TVk+TL23RreQDhzFRma0TINePq+NK8=;
        b=X/BJxr2o/NTdXrjYNgj+pdGLkgMB2BjAqJaz7BClnBH8jmVp8y8sAozxuKyuz62rqr
         bbfD4o7FA145WMtlo/AuGrvTPTjb7CKPfA5BCx4qEWZxwDfeIGwitFu3HP3xEPaLm6xv
         Jgpu9NLpNYc1nKJfh9VQ3PXcgvulNNpY3fCRGAqZd6a3p6+6Y6ILL4uqjn/0taWisY0o
         s9UpjT3HDgahbRnl54kvx7Z4FE4iyPgzblvY8cUyVr366ELh0j6SHjGHkcEBi38iu77/
         PkVbi177J7pv6KPGKg6ERu480bfhshwMHzxjQayIe98ojeL4esF1S4pdDDqMFLzhxQrk
         lwVQ==
X-Gm-Message-State: AOAM533iXxwcPYFaw8lp+K6oK/mRL8jhTp2Ix24wrtVTKskU/PCHUdau
	wjZyfO7Hh6BXx9yBByWqB8LVkC7xJC5qQLpsdj24yBV/00iyZKlL3vDftA9FcMZI/pmtIeBByFU
	MQkLKugdtKnfjR2Iu
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr14237025edw.52.1610378431359;
        Mon, 11 Jan 2021 07:20:31 -0800 (PST)
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr14236981edw.52.1610378431207;
        Mon, 11 Jan 2021 07:20:31 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (129.red-88-21-205.staticip.rima-tde.net. [88.21.205.129])
        by smtp.gmail.com with ESMTPSA id c12sm76932edw.55.2021.01.11.07.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 07:20:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Greg Kurz <groug@kaod.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org,
	Amit Shah <amit@kernel.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>,
	qemu-s390x@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	qemu-block@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] sysemu/runstate: Let runstate_is_running() return bool
Date: Mon, 11 Jan 2021 16:20:19 +0100
Message-Id: <20210111152020.1422021-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111152020.1422021-1-philmd@redhat.com>
References: <20210111152020.1422021-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LMc3yFhnE6GQ

runstate_check() returns a boolean. runstate_is_running()
returns what runstate_check() returns, also a boolean.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/runstate.h | 2 +-
 softmmu/runstate.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
index e557f470d42..3ab35a039a0 100644
--- a/include/sysemu/runstate.h
+++ b/include/sysemu/runstate.h
@@ -6,7 +6,7 @@
 
 bool runstate_check(RunState state);
 void runstate_set(RunState new_state);
-int runstate_is_running(void);
+bool runstate_is_running(void);
 bool runstate_needs_reset(void);
 bool runstate_store(char *str, size_t size);
 
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 636aab0addb..c7a67147d17 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -217,7 +217,7 @@ void runstate_set(RunState new_state)
     current_run_state = new_state;
 }
 
-int runstate_is_running(void)
+bool runstate_is_running(void)
 {
     return runstate_check(RUN_STATE_RUNNING);
 }
-- 
2.26.2
