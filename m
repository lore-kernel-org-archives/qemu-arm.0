Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp687969lfr;
        Thu, 15 Apr 2021 09:34:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6ZydU4txtsCHV2U4XNqZbk7e0t/xD+MkDmwxoRCjqFUUA3Zao9ingfpMxAbFP6jSvUCFj
X-Received: by 2002:a50:d7d7:: with SMTP id m23mr5216858edj.378.1618504460269;
        Thu, 15 Apr 2021 09:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618504460; cv=none;
        d=google.com; s=arc-20160816;
        b=VqW64nkCyBiG/fjjSfqlr5hQMgU9ZWggazZ9Ic8E59j3zhHdBIySOjTT5KT4WRpWJf
         VFH/PCHVrHzGwXKOyA55QdETTcdF3FGqlrK+EibFnXNU68SK7AtVF/sn7X5yO1qCRbkr
         0K0iNetI7fT4tfql1fmwGUino8/eGAZuOyfmzUnF8GNgyfOP/HCCEN/q4KGXueNZAO2f
         2JXpAK6vSrB46VE8opt/TXX3Q9whCP8Zksg5orJlvPywOgkOajuxp3oLsN6OT1i7zpzn
         6lbEIAlhZJG6oyeLX7CnY53RdifndesNNonFSkoDUGczp8jaLZ7H43wGxxgWyAspXlhW
         x44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sTefL8KFB03yS8Z+kdiNHNixKSuiXSG+jyZydBtqNkg=;
        b=z9h56yCM8wel/4aNsmmnRiy9PZ58QfYYyiAnIvTJEYyCIsHD20N+t8UwOdciNeYebF
         J/V7cGYEDET+kf0IWtxIkj7PVHTmPctoI7Gx/jwGjowFDG/aRrQlWmzWiEmq5hecfhmq
         R3jkAvj/iI1QkS8/MlRQLeMXjtBqjHLLEiQrITKIm3jGLV9uEWobUWsn2WSbtmWIRzSz
         fjJjKw8/V7TiOFh/Pj3r+3sFToz4alYu8iIonB/xMSUC6v9tL+HJMqlWNoowQSXiNeE4
         2l6nXshRwfcei0urbhMbpsWDUfcuytXW29SfHQpcCxDfGLLhDKEw8CUBaF2YnEpEsEol
         D48Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L1qVpUBw;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id w8si2486087eje.293.2021.04.15.09.34.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Apr 2021 09:34:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L1qVpUBw;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618504459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTefL8KFB03yS8Z+kdiNHNixKSuiXSG+jyZydBtqNkg=;
	b=L1qVpUBw3GsXrcMsBvk5A3voz6nVmvFDiFIg+30RU1wC8PoeHz+Xxig1yOCHKMgPzvZByM
	TmKESAESFJx8lVwj4i1hlxFV5fHeRlNcSzYgZHHaYCdx+cViv+7elsl0eUmiattwyzXENb
	3CBQodFusDx+llvyGDbBy/d2kXsyQqU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-GKw2PEIgNCKSMtEfZA3_Lw-1; Thu, 15 Apr 2021 12:34:15 -0400
X-MC-Unique: GKw2PEIgNCKSMtEfZA3_Lw-1
Received: by mail-wr1-f69.google.com with SMTP id d15-20020a5d538f0000b02901027c18c581so2971444wrv.3
        for <alex.bennee@linaro.org>; Thu, 15 Apr 2021 09:34:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sTefL8KFB03yS8Z+kdiNHNixKSuiXSG+jyZydBtqNkg=;
        b=iGltdd37uVZ2xr9nDoLTnMjbLkWpR9XTJ23yZ+ZfRprsU5y8LWqmtZ7k8RLD3CWBJc
         4uulpmYR0cVCl42CclzXaa3sMbNCFBC2WpQ9DMIhZ42WWLTIn01rQe2zUEpSkIxtB/S1
         omV5ZXI81RbQEoHgR3yzaq+zIa7HIK5iVWi8K30/mQnEBNTROSL+t2Vm9uwU7quAntez
         Smjz8+VToDZQd2IKnKiklq4iJNeeNmn7rSpBzgmC0cmfFglq5ILRunc2AJu+dRBmJ+Ts
         F6niBoWA8EjGoYUCf/2yiPAVqUXHERqNfnD0FRzFuto6kByFPPbamlETiI0IM4QOOzkC
         LTpA==
X-Gm-Message-State: AOAM530fEs/n39/wXgE6h9GBEvJeTYDvsX88QzfEI51GlKCVQuLPrgBz
	ZJ2CC04wYi1XGC0xLiisktO+cB5a0XBsTngu38Qz9sp+BRDhGPntHm4b0lFL+oxuSmBa3JFU9wT
	tXMCOuRLjl7iSFfcl
X-Received: by 2002:a5d:40c1:: with SMTP id b1mr4607880wrq.33.1618504454322;
        Thu, 15 Apr 2021 09:34:14 -0700 (PDT)
X-Received: by 2002:a5d:40c1:: with SMTP id b1mr4607861wrq.33.1618504454205;
        Thu, 15 Apr 2021 09:34:14 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net. [81.40.121.39])
        by smtp.gmail.com with ESMTPSA id f11sm3552479wmc.6.2021.04.15.09.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 09:34:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Juan Quintela <quintela@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>
Subject: [PATCH v4 12/12] tests/meson: Only build softfloat objects if TCG is selected
Date: Thu, 15 Apr 2021 18:33:04 +0200
Message-Id: <20210415163304.4120052-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415163304.4120052-1-philmd@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zmnfT8bCa8FJ

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The previous attempt (commit f77147cd4de) doesn't work as
expected, as we still have CONFIG_TCG=1 when using:

  configure --disable-system --disable-user

Now than we have removed the use of CONFIG_TCG from target-dependent
files in tests/qtest/, we can remove the unconditional definition of
CONFIG_TCG in config_host.

This avoid to build a bunch of unrequired objects when building with
--disable-tcg (in particular the softfloat tests):

Before:

  $ make
  [1/812] Generating trace-qom.h with a custom command
  ...

After:

  $ make
  [1/349] Generating trace-qom.h with a custom command
  ...

A difference of 463 objects...

Reported-by: Claudio Fontana <cfontana@suse.de>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Include Paolo's feedback:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg793872.html
therefore o not include Alex's R-b tag.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Emilio G. Cota <cota@braap.org>
---
 meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meson.build b/meson.build
index c6f4b0cf5e8..623cbe50685 100644
--- a/meson.build
+++ b/meson.build
@@ -262,7 +262,6 @@
                         language: ['c', 'cpp', 'objc'])
 
   accelerators += 'CONFIG_TCG'
-  config_host += { 'CONFIG_TCG': 'y' }
 endif
 
 if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
-- 
2.26.3
