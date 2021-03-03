Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5705987lfg;
        Wed, 3 Mar 2021 13:47:42 -0800 (PST)
X-Received: by 2002:adf:ee8f:: with SMTP id b15mr754389wro.314.1614808062168;
        Wed, 03 Mar 2021 13:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808062; cv=none;
        d=google.com; s=arc-20160816;
        b=GI935TAum16KWr6ej8lbrF1HfzMLQKJ//GbRnpSXH8Sdj5u/EzAacuM1StFW20fPwi
         m7cX8+SzALAmjigGCfv45teZqjb2sClyZYolDeBxD9KCjiPHE1Rl4iIkCD+Y9De6xDQR
         2m9IXhyeQDT0NSp+DlKgUD4mIFTJX/u8Qwa/vib8HG+O10wJqwD6lo9A3u0w2RFsydUX
         bOG78KdF/tLoOkdfYiLINY0GT65CLDsHGLwEuwbP8WtXoPeH4J/HV6WPxwog4CcL8OZa
         ilx3TybYZ9/un49ZDxgh6EvAneH3V+qeekoHU3TX9Gz7yuuOIxlH1xImerb6ZTlE0eAT
         wCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=iDkHmNWDJUjsisDNEA+tDXF79jqbgWv+Yeaa+F2Cdm4=;
        b=M9nnNsab73UkwEiH/rL5Im8SpCD38j1YBl1Pf1AvZAeAReHSyKWMDRvKfYvkfCdXJw
         0Imy8qL5zm1YhBAK+Hlr04d2hmJ42PWzOHcXCMxPOUBO2da7EpEQbhViw9q7L1bFyBlN
         AH/KzQvI+ydLUaVenLilW90pA2m++LEDr7hFiAhBCiahQ10BPaw0ioY8eRsgJqC242AN
         EEemtB7E72oMOpJfdvzzFYddzXbqv3mbVsS9EL7Jri+6jMqXrMcBGOkFvstbiu5ZbMYb
         S3/YXNPVNjQqN45tHkJWtPm0KlWAc9sRIIlH6r//MarhBQIRIj8KJQSL/ggaEpipOCpD
         L/Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZgbC2jy6;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z18sor4212990wmf.14.2021.03.03.13.47.42
        (Google Transport Security);
        Wed, 03 Mar 2021 13:47:42 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZgbC2jy6;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iDkHmNWDJUjsisDNEA+tDXF79jqbgWv+Yeaa+F2Cdm4=;
        b=ZgbC2jy6AG+RLur1BjIecSk+qs2lJQd1qYBzQYFFcQVKLdTR2adqVQhR+BNuxjrOn0
         RovMZS38gTe2c5ML2yGa47NrUOeUfVBG0t3wHT4Yl1LTYeflXoiOlJIyeoElw/1E8rsx
         WiED4I0tprqnt2AzsUZIz0lIEVwncf+7i0er2v24jxYE9M8PxZ25o+p3M5GVrcSFFd9U
         H9qJHKUhtx+dY6DO7M6iKmiBb4bgCqJRnqkjIKsn1mAibxOlp+NPbOPeFHQzUQn9bi+Z
         Vx3OaOKBcnYKDLDoKDEvdLHr15dwbiuJra+ps/y+7KCVXeatb0ZSrV2FWBbw+ulzwR6a
         erGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=iDkHmNWDJUjsisDNEA+tDXF79jqbgWv+Yeaa+F2Cdm4=;
        b=nJPn4EoHV3YT5uKX2opVq9sZxhhP9mzNglx1EmxN2iqwEUG+2VCBzHgQK+aaBxYSWm
         alSg+lwpbOWhouqUO+bSmOBx+A8VEK7oZJVaFK27NLEttmrmNDyqZQFpZgiDc94MXbPs
         VKX9gsddFNzSOnOp1Yk2iC2xqfdqn3uyPmaZGrPgACvPlzYt0ikQLFzsO0/LeVL16N/C
         ZeFMIXPGxDYCPejqjODqNbDVvdcTKlooZ9GFKFGYan3OeIM1c66G/KHtVBJIe70pvzZY
         Jkrwt4brcJHC3AgM0ONhBUGBbqGySkiUraiYG6VxDBr5r34gm0hR9V7nNFopd/0mUqNl
         UfCA==
X-Gm-Message-State: AOAM5307BrThqkKYpy6ok+6iu0T27yGVqL+nhZpP7wsvBOUlBvR9n91X
	zf9aPZqgvGbOQ5DueMZqdLo=
X-Google-Smtp-Source: ABdhPJyFd5xk9OkNc9a2uHS1GRZjG6YVKtiIkDjU8POlwni8ZQ8Ge8hXSIMDlcTDzIJM24ntPHcndA==
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr812149wmj.81.1614808061943;
        Wed, 03 Mar 2021 13:47:41 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id g9sm6935176wmq.25.2021.03.03.13.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:47:41 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v4 06/28] cpu: Directly use get_memory_mapping() fallback handlers in place
Date: Wed,  3 Mar 2021 22:46:46 +0100
Message-Id: <20210303214708.1727801-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vWXsoLKafGjF

No code uses CPUClass::get_memory_mapping() outside of hw/core/cpu.c:

  $ git grep -F -- '->get_memory_mapping'
  hw/core/cpu.c:87:    cc->get_memory_mapping(cpu, list, errp);
  hw/core/cpu.c:439:    k->get_memory_mapping = cpu_common_get_memory_mapping;
  target/i386/cpu.c:7422:    cc->get_memory_mapping = x86_cpu_get_memory_mapping;

Check the handler presence in place and remove the common fallback code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 1de00bbb474..5abf8bed2e4 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -83,13 +83,11 @@ void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    cc->get_memory_mapping(cpu, list, errp);
-}
+    if (cc->get_memory_mapping) {
+        cc->get_memory_mapping(cpu, list, errp);
+        return;
+    }
 
-static void cpu_common_get_memory_mapping(CPUState *cpu,
-                                          MemoryMappingList *list,
-                                          Error **errp)
-{
     error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
 }
 
@@ -419,7 +417,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
     k->has_work = cpu_common_has_work;
-    k->get_memory_mapping = cpu_common_get_memory_mapping;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
-- 
2.26.2
