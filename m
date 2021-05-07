Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp451104lfg;
        Fri, 7 May 2021 07:43:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxe7eo4DH6hts3rmJWaOO3hvpqGJn9HUbsBgfH1qW/DP8uGasrfcjAu1xImn06lxM4fuZf8
X-Received: by 2002:a17:906:d8d4:: with SMTP id re20mr10254237ejb.505.1620398621497;
        Fri, 07 May 2021 07:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620398621; cv=none;
        d=google.com; s=arc-20160816;
        b=z+CUVEKo/89q0IFaLzB0skUlWe5yHGaS0YrBY+P2Ntvd3ax3YBpv6NADYTgFJC5iIL
         TDaUakjAs0UiEWSyjIhqCPO5s1AapeJNT6NmCWqX6fUv/Ctz6zpVSBkQcjEyQAY0mzms
         lXW9u1hH5bYR0hZyeQa4ShJzNTVDpVrGzdE3ch2vVAOlTX8Pz58FK3uaJABbQGlNf727
         eucgVuRyboyk+PsVB+/kwmgUB3ZuEPVG0M5WFiMdSEFam3tVAkJ/OpaXqbYRGyj3CP+0
         lvund+aF/0+FAFMweo1aAu1HOFBEYC2ERKdhIcsfB3+Df8Wk2u67i1+yTauM4EsY9Ai0
         qAew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Vgjfb8PbNnIcn3GQZwYI0ZjOYyIxocLAAFSxTQwWgvo=;
        b=uQO6gOVe3xm2o2UKV+x2TX3i7YXZLv1cS5kclk7ob4OsoKQ+dYN3HOhJXIxpBnAOsT
         L1GFaMdTFRmY1dG8zByZxSJ1QCA+PwqEFd3QzdxXz4IEp+TCsPyVKk7ih7Q/GEBbncI8
         w7pl91MCm2upFoMdh39DFhOvXzeG4nN48v9kYirkUOwn/OqYrOhVNkw7d+5Oe9odu/N+
         YIpNBRiW/gxYez5O5XyoLQfJE4h1TGCBtBc4UPeEIM8SsiuFA/79alBNZStZWJSjZpgf
         vrKuSSajMprm7cVBaLHvL0A12LKbL3B2kk5R0/4SpbQohf8EaDWQtbLfrrPQIaMAQX8Z
         YjRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HfHoqrOE;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id zk16si5134408ejb.664.2021.05.07.07.43.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 07:43:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HfHoqrOE;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620398620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vgjfb8PbNnIcn3GQZwYI0ZjOYyIxocLAAFSxTQwWgvo=;
	b=HfHoqrOE6X3+qArXjZqov+/BizDXM1Ua24oINj7RAGtzA4J/0VMyOj3eEpptwMHZAE/jvL
	9xHbJeH3IJJfL549ZS5SrMWe8kjaTGXxalS0jo2+GPncUWwS5n61gXheovBUvwrfaGkoha
	NfAYwsBPMQSFEJenOsJ+JMy1tWm5z88=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-bUaPOwcYMDSreyeJxYaDiw-1; Fri, 07 May 2021 10:43:38 -0400
X-MC-Unique: bUaPOwcYMDSreyeJxYaDiw-1
Received: by mail-wr1-f72.google.com with SMTP id 4-20020adf80040000b029010cab735fdeso3679790wrk.14
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 07:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vgjfb8PbNnIcn3GQZwYI0ZjOYyIxocLAAFSxTQwWgvo=;
        b=Pmlq/k8av/Mowcmr7F894t+TEYEYJXdGRGoAV4ztmFQ+RoBxnglMtKOiSDSZCPqRDu
         yOimvf++upTBIPgPML2QqAQIeZ//DjNUUD1DE2bmeoQ11LHPd8y28wwbSrI4YEEfaxWI
         jFdn29M6TNowQu+nBt3djDHhuvnlGJixvYYLXOnUrgBvD1w94asSR4P5HwIl91rDTX/G
         pdVxwiLtimu3AARMQq71C/3JLiW8GCqzuwMXUNwpVaXVEJVXPeO9WY4h7TcSZL7hpuAI
         UtyezGe9kkbhOfiyuc8C6EKPvyNAA0QenKqmQ12xabUxUQqcr74rCL5Mt+Ybdr5oe+MF
         kphQ==
X-Gm-Message-State: AOAM531X2mwdoSHpa/kmtSZur0UTtyf375yw3VFkrH27lQeWsZa5DHPj
	hpf3WPQNLN93OCfjsnq1uVjAEcZu/JgjeO6oF9vrE3Gd0bxz285SjBGWkNyzFC59DeGNiPotC1J
	qDIaPvBolA+jRp47K
X-Received: by 2002:a05:6000:188b:: with SMTP id a11mr12357181wri.275.1620398616905;
        Fri, 07 May 2021 07:43:36 -0700 (PDT)
X-Received: by 2002:a05:6000:188b:: with SMTP id a11mr12357169wri.275.1620398616770;
        Fri, 07 May 2021 07:43:36 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id z7sm8704053wrl.11.2021.05.07.07.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 07:43:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 04/17] linux-user/syscall: Replace alloca() by g_try_malloc()
Date: Fri,  7 May 2021 16:43:02 +0200
Message-Id: <20210507144315.1994337-5-philmd@redhat.com>
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
X-TUID: SRZc8okJItao

The ALLOCA(3) man-page mentions its "use is discouraged".

Use autofree heap allocation instead (returning ENOMEM on failure).

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 linux-user/syscall.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 08ab4cee805..2fa6b89b3de 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10630,7 +10630,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
     case TARGET_NR_sched_getaffinity:
         {
             unsigned int mask_size;
-            unsigned long *mask;
+            g_autofree unsigned long *mask = NULL;
 
             /*
              * sched_getaffinity needs multiples of ulong, so need to take
@@ -10641,8 +10641,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             }
             mask_size = (arg2 + (sizeof(*mask) - 1)) & ~(sizeof(*mask) - 1);
 
-            mask = alloca(mask_size);
-            memset(mask, 0, mask_size);
+            mask = g_try_malloc0(mask_size);
+            if (!mask) {
+                return -TARGET_ENOMEM;
+            }
             ret = get_errno(sys_sched_getaffinity(arg1, mask_size, mask));
 
             if (!is_error(ret)) {
@@ -10670,7 +10672,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
     case TARGET_NR_sched_setaffinity:
         {
             unsigned int mask_size;
-            unsigned long *mask;
+            g_autofree unsigned long *mask = NULL;
 
             /*
              * sched_setaffinity needs multiples of ulong, so need to take
@@ -10680,7 +10682,10 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 return -TARGET_EINVAL;
             }
             mask_size = (arg2 + (sizeof(*mask) - 1)) & ~(sizeof(*mask) - 1);
-            mask = alloca(mask_size);
+            mask = g_try_malloc(mask_size);
+            if (!mask) {
+                return -TARGET_ENOMEM;
+            }
 
             ret = target_to_host_cpu_mask(mask, mask_size, arg3, arg2);
             if (ret) {
-- 
2.26.3
