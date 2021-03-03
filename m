Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5706992lfg;
        Wed, 3 Mar 2021 13:49:36 -0800 (PST)
X-Received: by 2002:a5d:65d1:: with SMTP id e17mr702718wrw.53.1614808176451;
        Wed, 03 Mar 2021 13:49:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614808176; cv=none;
        d=google.com; s=arc-20160816;
        b=S6+0X52NrpM5VEcIN0t5C2XJXWuoA0YUA93cm0Dv2SIsp5Z4Vmddn2p2xeN6dt+2JG
         HKtZ/JjzNrRGRtsG2m8bq0MckjKZPDnOMEeVtyZtOrdmYprWdblwVHiMGysp7OusLtiQ
         9vMot5np84thQfJsVgRCNxcibh5uHGS/+g96sEItBZLAFSrWwcPeigTtDDiccefpncx/
         IJYobtdWZCzvO5nbVsbG5jRrjVMJJPGySK3dF3TVeivifl/3VDMAGlQK5bxZUXBBPdWK
         rKxh/veOUj/vvjs29yhurkfm0As610ynfLe1nXTWMzpHjbYa8r15sYa0lRFcQj5icV8i
         zf6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=thZpYEs3ORtBK7nisq+USWMtn89YjLX4bCvj3GSE47w=;
        b=gNIYPKkXF/W9PYXbtwWxExYpTAMS9q0NvHtBefBdDraHf/MGmnMtUCzmGbmp0sRXlJ
         6Lr9bHOyViWBi2wRfC5mvlKVCQdiyXbJrpzR+dYqnrf2yAQickn8i83qki2PfG1wiGFI
         oSRtte8tCMkmv2OD4x+ZQh8IQ4u9X/W/HSVhN2etCjG8J6zdro8gNW00tF7HcIFW2H/a
         +QePophbf9yxxSDlVVn6/9u8dpK2ACs/99/SxtFf1NL5LmjCzZ0KQSrhlqP5m6x6GFxb
         A6ZkdUE7rcaUx26Je9aKxnxvIFCJL0AxJZaIk1lADf73NealvS0UjLoRwxQ2Ah5wwDPM
         2Kew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mkP6p9ui;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v64sor4145488wme.3.2021.03.03.13.49.36
        (Google Transport Security);
        Wed, 03 Mar 2021 13:49:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=mkP6p9ui;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=thZpYEs3ORtBK7nisq+USWMtn89YjLX4bCvj3GSE47w=;
        b=mkP6p9uiQajrOH2sw9/hu/XEYG69bOwqb06XtRpvogIUyzs/80G7oxXFzln5SM5g5W
         Qoy9Lr+OQJT4RDzMBqPnVWtAfXK863wSrkwRefO3fJOI3yn11sp21rwIYcV6YX+vOW6B
         QTqrnZZpotMGJ/O6kuNCpfDJZgjCh1pDZuyvu9nOhFKPjlabCMZIV5514UvBnPU8XkPu
         NGUC1QHfgWDIgMkgoqKJbmbzNsoMfZll8PLZ4nvsYYIb2OEQ6zED0jUC3lCm9BOi7f1u
         jwx1cEXNVROlPZhqPQc+rvFBNItrzyCjNvYLAGqXraBzFhstquC0pvMSamn+QRkNRHwd
         ZMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=thZpYEs3ORtBK7nisq+USWMtn89YjLX4bCvj3GSE47w=;
        b=N30DXJoFMt2uMgBVHc0UDDNdA5NRRDB7UIM+mgD469wy9ILygEVP1cHE8ocyNVNngm
         lIjf0YcOfNr/IGUt+RhGYYmolUBnFqtVaZz3Y8TBO35IdohWeYJVEfVgNjNJnZtAHqRC
         g8fl4P+cREq0b0BWcQyr9sm86mgRH4Zrf+OXWDWSPUNl9vLSJmum/BK1Ofio+ILVDGdc
         v9NQnR6kBC2F+YiOzDkqzxPJ4fx9rSDovbNkBHT1lM9doVcgG5K/xcoz87nXwaNngvr0
         1vlg/ZOpK94Dj8vsUcXb3n9p+4AMfRHTTGMc6UVqB72TUDAIqwONS8UZibBohMl1bKF4
         nO3A==
X-Gm-Message-State: AOAM532BKAvAC4dfZ53KFvJB/CqSizdC50R7L6eZ1qJttsYy32gAPaAT
	qu1wbfampDNIMqeJ0GPgMZE=
X-Google-Smtp-Source: ABdhPJyVSlK14c0CczyHFZYx/XdOuM8JjnuE33R8uVycsbyotkDZItB77zBGfhNGQkSu9yOWAq3N5w==
X-Received: by 2002:a1c:1d82:: with SMTP id d124mr851659wmd.1.1614808176266;
        Wed, 03 Mar 2021 13:49:36 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id 4sm7508807wma.0.2021.03.03.13.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 13:49:35 -0800 (PST)
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
Subject: [PATCH v4 27/28] cpu: Fix code style for checkpatch.pl
Date: Wed,  3 Mar 2021 22:47:07 +0100
Message-Id: <20210303214708.1727801-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OjuJ4I7ooJn1

We are going to move this code, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b708f365a7a..79dcc9a4e42 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -558,7 +558,8 @@ hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
  */
 hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
-/** cpu_asidx_from_attrs:
+/**
+ * cpu_asidx_from_attrs:
  * @cpu: CPU
  * @attrs: memory transaction attributes
  *
-- 
2.26.2
