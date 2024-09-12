Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422487nji;
        Thu, 12 Sep 2024 00:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVGW0DE4CesEhWwRsbTdq/lypVSnFfXJUI2bzqvTyMQRTip5OoDCBecIGJ/Mwnjvn0WfWCdEHK0ksSqA==@linaro.org
X-Received: by 2002:a05:6a00:8805:b0:717:9340:a9d0 with SMTP id d2e1a72fcca58-71907eb816bmr12394740b3a.6.1726126776923;
        Thu, 12 Sep 2024 00:39:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126776; cv=none;
        d=google.com; s=arc-20160816;
        b=Jc30bBwtby2oJG4UfI4bvachcJhEto3Bx19PAd++/P3NGbrl3+KuUIBsLYH+n7usyB
         lJcbzJXCd7Y1ew0xFr3XB7won66x9EaE/0vDZlJnfJNTgnj7+COnOTNgMa9b/Nz7Z0gy
         rVIshH0Ap89x0KPjm5m8jSf0kbxFdml08QX2T2CTwzDdAz3sl6fYPPeht4VTop+jXX+g
         VmQjcn05zLj25JlSEjnADsRv0gLR/jVBVzUKGbaR5unS+EHx9JC+CBJipGtRFl2k20wU
         p0zyVnQQWjDRQeBmYhu6XoYCpUIzbnWxlm8b6eR0rD256PR9oLL6Hf3BY0Z6PcM+s23V
         KECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ecO/hlC3v3MEosBJkifBisWZ7NVSSxAF5ju3ujjbozc=;
        fh=b5V1pCR5/v4b78wJ65YlrVJSKiBxXt5F2dTFuSR8xTE=;
        b=eDSnQYc9Bi5VICtzt6kyXOacWBrGUyOYtWl1CZi8yo/6GHTHy+BAAROm/JQ9z6ZM/A
         I1b6rhH73nqGucJs29Q+nYpY/ZjqDUjpdjlqhknNCCOTTlzRJUd4K0kQTZVmBHYmIShx
         QctWjfgWbdlxVYRbKUK3zVcjIVFtR3ibqxy9ws+/CXp2Sptax/r73KB2WH1yuDDth9gH
         8C8R7Cqz55f6xGtx9XfPC0tgba2ilLv4ODxbJp3MF3rR1RpFrGjsz9Y43pDYk2K/ugls
         uMinjSJkkN2BJaUjMsBTA3qP0JT7henBIrvIGyi/dwdn12bJsFD+4khGLHAJBdtM6MMY
         84rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PcJr9T0D;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718d81e4e21sor6123672b3a.4.2024.09.12.00.39.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:39:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PcJr9T0D;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126776; x=1726731576; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecO/hlC3v3MEosBJkifBisWZ7NVSSxAF5ju3ujjbozc=;
        b=PcJr9T0DvjUvzCxyUkjv5stAH2Cx0ZqAUJPVwQzLWe55RU5TtKxTZocwifqySB+yJ+
         jyAPKdN9PkYA0haha4yHJ+Y9AmJKM3ynpXIO/IzFcxxOsrPqsldvlLkPpllgspeswmUG
         0MSXwEwvd9yrU4R/Hn3GgkeRYgpdIW1ohLC6UVeTQNPCuOAwYbVuSt6kklUxYFephGnr
         rocA+mMyErRSrkIi5tJCK5F5hFLvmbcpslotKTdgrxM05G4PUZk13ZqkLGQ7XGv+ssks
         J8UGGO4nBsL91+FoJwi074/6v8ewW2P8aq7Nmi90xueFpYa8hef2xokWZ5dc1ZJnx+oN
         adow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126776; x=1726731576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecO/hlC3v3MEosBJkifBisWZ7NVSSxAF5ju3ujjbozc=;
        b=AAUMA/By66ImfqwHntGYrammQIIhzC7wzddTIwU+BlR3hzL2qJEhAxlx+tvu/g7d52
         j26Uug25fwgRn4RgJ3IrBvwe4U7h6rtAh/wW3f7AKA/NMQS4n0A5XE9qs7HRb21KSAUG
         nijXkkjKDvJ6RpUWN0YNQYME6Iz2acqxFeJzHjAvY3Qy4XI4WaJiTAZd5/3Az/LN81tF
         nbcP2RHykgL6ehcHtk5jH/ipYAywrK5hTv+FMu78Wbcijl5wzcfrBc5a4sf3x2p2utdY
         Bqw2Vf8Z8qJPq8ANCeY1ie5u8N481tq08nVAIMzDn7Wtm/ZeXp9FjwNDwUk80AikefEz
         MGrg==
X-Forwarded-Encrypted: i=1; AJvYcCXipWFjYrZOiCuxcVFt31ZpC9BJB8hLArIXy+gpFJbdjCf+tcrVgtcE0sRcXfaRpCo4s0N/N0M1BFnsjw==@linaro.org
X-Gm-Message-State: AOJu0YyFiLfKm9BqAcnpToSReYBbeE/Ww2xQ+Kdlb2vKyXAOaikFjqD9
	bR5KZ3/A+m3wG7YBO4pStDNhv7mG2ipluFEzqPWIWDOGm1iK41298TpFbLvUHhfk8g==
X-Google-Smtp-Source: AGHT+IGWOkQDiFo4ViC5Y6sElaFJqOWW1j8ZfDmO3I52qr0gLqmLrSh4yCtDTRzacjd0//JBuuxsHA==
X-Received: by 2002:a05:6a21:4d8c:b0:1cc:e101:ee64 with SMTP id adf61e73a8af0-1cf75599a20mr3182576637.1.1726126776379;
        Thu, 12 Sep 2024 00:39:36 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:39:35 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	WANG Xuerui <git@xen0n.name>,
	Halil Pasic <pasic@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Corey Minyard <minyard@acm.org>,
	Keith Busch <kbusch@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jesper Devantier <foss@defmacro.it>,
	Hyman Huang <yong.huang@smartx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-riscv@nongnu.org,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	kvm@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Peter Xu <peterx@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eric Farman <farman@linux.ibm.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	qemu-block@nongnu.org,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Eduardo Habkost <eduardo@habkost.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Fam Zheng <fam@euphon.net>,
	Weiwei Li <liwei1518@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 04/48] hw/char: replace assert(0) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:37 -0700
Message-Id: <20240912073921.453203-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: enrYqHgkYCWf

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/char/avr_usart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/avr_usart.c b/hw/char/avr_usart.c
index 5bcf9db0b78..e738a2ca97e 100644
--- a/hw/char/avr_usart.c
+++ b/hw/char/avr_usart.c
@@ -86,7 +86,7 @@ static void update_char_mask(AVRUsartState *usart)
         usart->char_mask = 0b11111111;
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
-- 
2.39.2
