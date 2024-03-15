Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp990131eju;
        Fri, 15 Mar 2024 06:11:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU446nb1yhDm414fxm8j9aaK6HhMzr0s2W9dIiyLRdIQnFr7ARX724DH5kXuMREb0RL+JEtYY6sd6HNuQAGyu9rL5W/7P1j
X-Received: by 2002:a2e:9816:0:b0:2d4:790:7712 with SMTP id a22-20020a2e9816000000b002d407907712mr3397132ljj.0.1710508262607;
        Fri, 15 Mar 2024 06:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508262; cv=none;
        d=google.com; s=arc-20160816;
        b=ixbh+Z57GgPmOpuU7qyf1NfqJPhFu+YaYKBftVfBhdshcYcoAU5T5JGQHqyH4nZiJQ
         H++3GLhw7r9jVT6JeyXDjTnExXH2aUOraVyESi8UtPdNQz9pDysmWcB35V5atjYzf8Mo
         G69DXqmUwUNfS90yq9aNq6KqYE6pVZ+nmL62tNM/vywiUwUeZaDzIHoCLRGjTHJojoA7
         W8N8K2h7R62QgM2xYCmbQ/jPx18Apqy2m2dO0Ky/ktpWhxs2lei1ncd4kV9loOysoDKI
         KmmeHFVprgWkOCl1l0BA/gwiwwzujG4yeG9atIribixIS+OviWmjjTrDarduayZncGhn
         7nZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9q6xaVyoPJIMQfl186LF5IP9vgj5sXw3ui9Yz0YXC2Q=;
        fh=Oe18bDeHRQosgC6It2OMs4WfgIMwjXf8bcozTQK//LA=;
        b=jTqNKFogyWc8WWySS9TpzkX8xvAdGo/WhPTQx7vQaKS4DYKCUbK8eRlj/7M17dyq0B
         XP+1jI4HfD37GdwuwiDGjgVxzxL4Xgasz4AotmfU3oVnJ222I4edAWsO8RAiH71amXYF
         qyIqhk4BVP+PggzHOr388mS7Kx+D7/W0FfUz5gVJUml93JIbtW9QwyOksRD7ShBgDwKJ
         TyyhPBlsgNFHurWzpNBmdmohFVTSWsfT2nbYwP6qHNZTdGQykRNUz1xTFXHbuS5hfNuz
         qUZn1NwNno9jCGdsVSu6dYYIhBEtHXeZi2y7LjL0tfMKRVYzD6LQXtRO9qh1aUIUC4NA
         r5pg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sdDQ1+UM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w18-20020a2e9992000000b002d464bbc5a3sor762116lji.12.2024.03.15.06.11.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Mar 2024 06:11:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sdDQ1+UM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710508262; x=1711113062; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9q6xaVyoPJIMQfl186LF5IP9vgj5sXw3ui9Yz0YXC2Q=;
        b=sdDQ1+UM5ucQb6uPxtAO7ShUjFTsPtE5BQIZ7urISsqPgIHbM4emzxSi/Z4pe2fnvm
         yq38oGH+YGtcscnXZLs9pr1XbjZJOX0H/jZC2Ovv79qJcWae7Rl6tJ0dYC4Dcg7rE7SG
         WEqSkyH4YEG2iqE5YnPIcsyMFODGg8w03TLodgzvVCWugsdLIEh8TfPIYQbacIeRx2LT
         iixcJ8885dFl6TmyDB3SwVoX9sXsDuMPHiILxC7fT3jYlPdZKtjazFpem/YYPyAtUzjk
         70lM2cZvek1yUKht6d0g1+2IHy1aKFjdRJsRMPOm/flAtLP6qgc9rDrvinvGiMQHlU3P
         vAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710508262; x=1711113062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9q6xaVyoPJIMQfl186LF5IP9vgj5sXw3ui9Yz0YXC2Q=;
        b=Ep8MkQf2VM33psSPTgn1CGj7l5SpHFsLtlUBshBTWCjaxOZMyjo+3ksv/pz3hoqZ/8
         R79nqlLJ7oQaZbHkoUZLQ5xVSfPxQ0ojc9F5grtEAnQwkORkTP6Rjp7snK0xKDGXmZYX
         qqyZqoj0mx20E8jsU/wgtVcQ4xVWr4rYTR11ijVN0qRfnrO2jZ/3dCG1hpKcnVCrIohG
         Uja/FaT5LN3m4+t609lNcoSpPsm3LR4zM/Rr3k0F99sHxK2zrBfbZfmFDipyAnWsfggS
         ZzQGp/pmVAv4mEjJuztbxBfWNVcsp2QY7iqt84uKg+xzNa0A2LFRUqQ6Lqyxzkq7JgFg
         HW7w==
X-Forwarded-Encrypted: i=1; AJvYcCU/sCTPcVCw9QG2FPWbsAq67du7HBOV5ReHFsvCVhiiCrvxhB6RhQgpSEQBP3m1yUjWyJdLAL7UlW4VShNX5i9yDMAHGeZp
X-Gm-Message-State: AOJu0Yy2EVNRdhhe8LoWk6bQ28/XIQc6a5xjDsVvsjTkb45BkGGKPgww
	pg+5CSaaZ2clahu79QCNW1gxp969nMUf3h20r63B0+nWtriWvGQKjH7xU0UaG/94HA==
X-Google-Smtp-Source: AGHT+IGug9mMTyD+ClS5FiGdRLYqtGhTbiwMx2zP8ulnJSipWbsuMSAlqPeuMtp7D26lqxqXlTB4Zw==
X-Received: by 2002:a2e:a9a6:0:b0:2d2:65b9:b420 with SMTP id x38-20020a2ea9a6000000b002d265b9b420mr4153813ljq.1.1710508262292;
        Fri, 15 Mar 2024 06:11:02 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.145.26])
        by smtp.gmail.com with ESMTPSA id d4-20020aa7d5c4000000b0056711540692sm1656538eds.79.2024.03.15.06.11.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 15 Mar 2024 06:11:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org,
	Anton Johansson <anjo@rev.ng>,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Song Gao <gaosong@loongson.cn>
Subject: [RFC PATCH-for-9.1 16/21] target/loongarch: Use QMP generic_query_cpu_definitions()
Date: Fri, 15 Mar 2024 14:09:04 +0100
Message-ID: <20240315130910.15750-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
References: <20240315130910.15750-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5vJXHqo75ld/

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/loongarch-qmp-cmds.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/target/loongarch/loongarch-qmp-cmds.c b/target/loongarch/loongarch-qmp-cmds.c
index 8721a5eb13..ef5aedc1cd 100644
--- a/target/loongarch/loongarch-qmp-cmds.c
+++ b/target/loongarch/loongarch-qmp-cmds.c
@@ -9,34 +9,15 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-machine-target.h"
+#include "qapi/commands-target-compat.h"
 #include "cpu.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qom/qom-qobject.h"
 
-static void loongarch_cpu_add_definition(gpointer data, gpointer user_data)
-{
-    ObjectClass *oc = data;
-    CpuDefinitionInfoList **cpu_list = user_data;
-    CpuDefinitionInfo *info = g_new0(CpuDefinitionInfo, 1);
-    const char *typename = object_class_get_name(oc);
-
-    info->name = cpu_model_from_type(typename);
-    info->q_typename = g_strdup(typename);
-
-    QAPI_LIST_PREPEND(*cpu_list, info);
-}
-
 CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 {
-    CpuDefinitionInfoList *cpu_list = NULL;
-    GSList *list;
-
-    list = object_class_get_list(TYPE_LOONGARCH_CPU, false);
-    g_slist_foreach(list, loongarch_cpu_add_definition, &cpu_list);
-    g_slist_free(list);
-
-    return cpu_list;
+    return generic_query_cpu_definitions(errp);
 }
 
 static const char *cpu_model_advertised_features[] = {
-- 
2.41.0
