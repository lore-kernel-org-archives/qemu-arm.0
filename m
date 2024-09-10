Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444344njb;
        Tue, 10 Sep 2024 15:16:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXquMciq542xU1x67lCPx6dFLbf6pxcOxTSDz6SLSnchA73gti195CkKZ16Y05zczN7wPoMRwawFPb21g==@linaro.org
X-Received: by 2002:a05:6a00:1a8b:b0:718:d942:3475 with SMTP id d2e1a72fcca58-71916dc453emr1116829b3a.7.1726006580917;
        Tue, 10 Sep 2024 15:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006580; cv=none;
        d=google.com; s=arc-20160816;
        b=Zxq4mbhgz1iG+yQ9EoPuhF3BZQ/rqCjCJ6KFnH7PEN5yxzYQ2W8Y+wu4Ahum5HYkNy
         KzIk1Ke5kRl9Ex8ae/4UeVwKT31kMQg9JlCMqnqMrQ74eXd8vqm24RWKz3bRTDWP4oi2
         7ADQkDJM6jmR8IEbrNLksrAVsaroNDsC24PseDrqpz3ybbmizC/oSoFHsSyfLMAwa/ol
         Nohn95tB8HvrRWSkjGrHuIPdbv5pOhopdH0mi2Iz+2+jB/2NH3NVp0hAwS03DKfJfgzj
         5iqefJliF1BKVD4QH626rdm28KK3TT0mDxrOmLC9V4AyjwtNQv5uHCvqmWx8st/1nF1E
         u/fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=4bb0fjpC/uXLETkc56Hcik4SHlsgHHXUYkY/bpvbVpc=;
        fh=P2+AVqhtJWy9gPH2Gc5kgK3ElW3MdwijaqkzVLOkpso=;
        b=gNcN+OE/QhXX7EQMJmxMuFmDsZWCTSNOdrLCvIjlRwGwrFN5otH+tSnGdHnEkKi6zH
         5PaXuivfw0dcLv3+GjKrLIaLL/OfJMKTkW19FR9PvV/+f1oGLswfebzOGTaLnAD2l3xC
         a4dCskCzYjECrvB83qJd7yzZ1J6gDaTZ2t9lhfSPgMKmTivP/hCMlNrRHzFv+CIFBQ/o
         A1rv0xVnRbMzv1V2gZbNLz8dozJLCUhEdmRjInjXGkwh+7jDvd4tg7gy6BmS6uc2Mrmn
         ikPqCyLKlTqXJbLNpktj5/ir8DvBhPhLgA/fEjcOyu4FoHDQBv9LdGQ6dkx+YjJTND2x
         7UyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pQMeJWvG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58d7396sor5618348b3a.5.2024.09.10.15.16.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pQMeJWvG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006580; x=1726611380; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bb0fjpC/uXLETkc56Hcik4SHlsgHHXUYkY/bpvbVpc=;
        b=pQMeJWvGmp9l3ZBtkoym0L4T+dzYlIhLH0PPjsYGvyoXd6TG25aS5y1/V1yIfIaI62
         nxY612J9Vyo/y+Qu5HByA7l7Lz8KpZK5nqhk/mq2Fwsfssl8HkLycLfCJX3TwdoY6vUA
         7M14wUgPUZC2Li45Xn55n1t5M1NsiQgJpKWS78SCOIQmzvDANhvfBSONXNtHKWrgthti
         rAXXyEDtWymBWgv+TPSoX3o3S8T5HfuQbpcHibctFteDSS6iI+ZHTw4FagGij7KXoYug
         RW/EON+BJiy44CtT7GomGwLD369OcjdIzN6lYi35fS7xyBYa+MLq8HNQ/xuEi6xg5Sxf
         oSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006580; x=1726611380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bb0fjpC/uXLETkc56Hcik4SHlsgHHXUYkY/bpvbVpc=;
        b=lhsUwGIQ636AA3zHAZqgED08LqQcrYz5sPQZFFnkw116m5UDYpTeNNAzZh41gUImtj
         /JBDW+bpYfBDSM0OxrLEYqcFUXHRBOdndGqhWNNpzAm+aONBF/plxMNY/xxrJpFHP3C1
         lzcqX+n587pOa4P0XsN6nRXvwBJ5AkjS08sWuRQHvZuQ0X6zPbt2I1myvyB++ifF/+gL
         eb/7gNCn+qtC13Sj47Jl4cJyj9QIKMoaZVhKdt9wd648A2Q0BgVFhtaN8b9SWCcduLxa
         Qq6Kfh1qkgHVIbdBFnK/xUe+d2NAnu9rxh4AKm3gvmcaBvrm/DuNkUCN6JYhuW3bFmSq
         J65A==
X-Forwarded-Encrypted: i=1; AJvYcCWpkTlv51GRGE+saDNkYQuiiwrHNpvrjxKDJykGM9ibJdfDD9WLOWgUsZ9Tj0TKK2aScaaEkJSn6VdPAw==@linaro.org
X-Gm-Message-State: AOJu0YyddyHcfxPjmTTHi+zGMd0wvrcrN1M96ggwBEpdB68oTe9xjrO/
	mO9xRywhzr3kWJWaRMz47c32IhtErxuN/KpGou0nSfwrbi9gll04tZVmv2OOJ1rAIg==
X-Google-Smtp-Source: AGHT+IFM7yoNH8xDo/vMJeUSRp0S9a/uDDcAvMhTSJpgsleZma8JtumByGI1crPqNwfnaO/FhIWNLQ==
X-Received: by 2002:a05:6a00:928c:b0:714:28c7:2455 with SMTP id d2e1a72fcca58-71916d950a2mr1273190b3a.6.1726006580270;
        Tue, 10 Sep 2024 15:16:20 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:19 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Corey Minyard <minyard@acm.org>,
	Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	WANG Xuerui <git@xen0n.name>,
	Hyman Huang <yong.huang@smartx.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Ani Sinha <anisinha@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jesper Devantier <foss@defmacro.it>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	qemu-s390x@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Helge Deller <deller@gmx.de>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Xu <peterx@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Jason Wang <jasowang@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 04/39] hw/char: replace assert(0) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:31 -0700
Message-Id: <20240910221606.1817478-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 64OKIWCFepGA

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
