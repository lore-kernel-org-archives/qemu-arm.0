Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp582259nji;
        Thu, 12 Sep 2024 09:12:10 -0700 (PDT)
X-Received: by 2002:a17:902:f684:b0:207:1828:82fd with SMTP id d9443c01a7336-2076e37abf5mr44778885ad.28.1726157530460;
        Thu, 12 Sep 2024 09:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726157530; cv=none;
        d=google.com; s=arc-20160816;
        b=VAs+5p9CFSma8QxkpcSToKtA+0oB36VSzl0uQ6/KP9bATYcXFEP3IRBN6hAE3Fs9OB
         qODdnmSQxqkQ+SX9SExWTr6T4MewcZVZ2oI1tbEONvJobqTgIfLJR0icIVGl0GaTyvg/
         TNMcjbr1DCgky+RM4zNF1axmujmMtRRly7RmtQwW8V314YE60LIZg9d/eCUt0EA3pUGo
         2Ve+WRo5axA/VtyIywEcIZK8KdgNzjXho1LLJdIsTGIIqdUwDaumTBRlZI9+CKUQ9M+f
         Innl/Pux6schxx7sGZZNHzrJ0NvsFCc/Td6N2XUW1husCUV9Desa62MwsQaLFOcCGr/n
         ODBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BppHFYoQrx4qC3DO9Sb1ugevP84fPlKPBSZdTDngGiU=;
        fh=ujiE8HSy6YTG7a3Z7CGLGec891YtQfFM1W/0TkY2zUo=;
        b=T8hzCrUZWgEuc9eqhgkRNRn7WCSgY/7dwd42KukHSl6Eh+a4LSfc6zPDnQEXVrlgFi
         WsX9tJrSu+1YLwZLcxFEQYRZFVZuoJytTkj8AIEUedSQ4tITEZr69vkwNXk1qbzkvQd1
         ZAoNteIrfWNAP3WeIjFXFkj56v7IAGI3lm8z/7pYxX3QqdDbQ1tGS8AFiF3CfDHt1njI
         2gXGkS+lGzecZX+FYbeUDtQXhJSkJwQioIoYKsb1OnZfWAUaUzWgGq4ZFrhIKZCX8p33
         S7gMNVr9nD7BKOVsV1g7T6/VmpWa4BBBkgbCaTDgAW6AmrTYSisXDUf8elWO3YppIlMO
         OCEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L0TrNmxe;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20710f54f77sor81739595ad.17.2024.09.12.09.12.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 09:12:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L0TrNmxe;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726157530; x=1726762330; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BppHFYoQrx4qC3DO9Sb1ugevP84fPlKPBSZdTDngGiU=;
        b=L0TrNmxefNDRBwnPr2EsH31XydEdXGSnsSE2Pdqcp/vXRfe4qJ1vrbedpM6CnWEagJ
         BksQP/47gb8LablusbxCaYL51tPyk1VRkyvkuSbVw3HcvgvxeO5SmBHX1CECL1+JhP99
         1aAqrA1eQSWpHO68FD8pMo5NtkiFlrqY+cQ5LcNHru4arK7H9f4OUDB2WgkC/FAEcjgs
         0gw3hVAnzLHqSXdhxirqriHDHhh5vjR8hUPSwNQSm5xlZWBxT5vi/gceXaPzsDN+SNhq
         pP1od9l7WSQ7PIDlZP0rlQo3ru5pd+bM3djBaT00rnKPabxKgz21MVL+3DTkC+QltgER
         NPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726157530; x=1726762330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BppHFYoQrx4qC3DO9Sb1ugevP84fPlKPBSZdTDngGiU=;
        b=L9rdrwFfXWKbwE0MtmsOM6rfTMU0DbiY1KbAc+YQiXbue811vU/6KR51uNpZySsFw5
         HT6rr5Ytis3ui/Osc0hrxMDLT6YUg9PNHIlrsPGmMBToMOLbsXyqkJ+W6UfcOr8Ml+GR
         5IF2P4vZaRiHAxIu0FzuZA+JKdtgyII7EO4NUtO0oqjt1Ooq6S5HdR0ofN9AApv0pBoW
         ikHrYzYQLfa1Z6cc0goEMaHUUcRfFmilBbeC+3qpx+hq8h8gCLWgVahmeNduugcSMIVZ
         UYxt8FNYOLexaVNUuhiXiwhy+soKVX1wqVv1H+K6DLlsMeFdd+97b26q23lnink7Dpdm
         zqWQ==
X-Gm-Message-State: AOJu0YzqYTyY3ohTKLwI1hMY+WW+Bdgo2KumBrHtO+dm1TnTfpT4fQ0K
	R0+L4U/qnfw9BfQtloo+oOxPfAEsC2wHs6y3Vs1MOi6WU5a6p/htmRMwGmjrls3Ugw==
X-Google-Smtp-Source: AGHT+IFXZnFHApOhxp7HbQT8QxnSQy+ag97AShW2GHgmcSAhB2K9e6P9OwzQbkNk0mR6Kpm6KHVR+g==
X-Received: by 2002:a17:90b:4b48:b0:2d1:bf4b:4a6d with SMTP id 98e67ed59e1d1-2db9ffa1590mr3873451a91.1.1726157529892;
        Thu, 12 Sep 2024 09:12:09 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db0419aab4sm10868139a91.15.2024.09.12.09.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 09:12:09 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Weiwei Li <liwei1518@gmail.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-s390x@nongnu.org,
	Michael Rolnik <mrolnik@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	kvm@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>,
	qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Fabiano Rosas <farosas@suse.de>,
	Eduardo Habkost <eduardo@habkost.net>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Rob Herring <robh@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Jesper Devantier <foss@defmacro.it>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Fam Zheng <fam@euphon.net>,
	Klaus Jensen <its@irrelevant.dk>,
	Keith Busch <kbusch@kernel.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-ppc@nongnu.org,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	WANG Xuerui <git@xen0n.name>,
	Laurent Vivier <lvivier@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-block@nongnu.org,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Corey Minyard <minyard@acm.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 46/48] qom: remove return after g_assert_not_reached()
Date: Thu, 12 Sep 2024 09:11:48 -0700
Message-Id: <20240912161150.483515-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912161150.483515-1-pierrick.bouvier@linaro.org>
References: <20240912161150.483515-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: BVuV3oHUnF4Q

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 qom/object.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/qom/object.c b/qom/object.c
index 157a45c5f8b..28c5b66eab5 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -2079,7 +2079,6 @@ const char *object_get_canonical_path_component(const Object *obj)
 
     /* obj had a parent but was not a child, should never happen */
     g_assert_not_reached();
-    return NULL;
 }
 
 char *object_get_canonical_path(const Object *obj)
-- 
2.39.2
