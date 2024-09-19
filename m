Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161381njg;
        Wed, 18 Sep 2024 21:47:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJD8RJGIUbU+nqo9cAvolC6atC9Ffm+7W+2DCLlqpl85jiteRi+oaMQ8Vnu24EmduslvbC0re2auluAQ==@linaro.org
X-Received: by 2002:a17:902:cec2:b0:205:951b:563f with SMTP id d9443c01a7336-20782c03768mr350704815ad.49.1726721240330;
        Wed, 18 Sep 2024 21:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721240; cv=none;
        d=google.com; s=arc-20160816;
        b=sczBTVq4xone2pgn2a0L++tyidFq1HXkA7zjv23CI6R6m5doLE8fc6yGMQqPnTaODT
         S990crnaMdmjGREnP1fMdCrz4lqJk1Etm8NuwuEtDqOCU4lmeSlFhVyqyYcvzTlFOGLX
         L7JbSHvUV9G98O9TDjEjyOUzDPdO8iySPBfQT37HwRpprrkis4V5hdjNQJPN8UIs6hy1
         sC+zi8PkLpmG/sI0shxD5p9yaDrvPHdKtV/WaVZHMLFsTjGKHaM97su4zCTsL2E6XeF1
         dPhP/N9zacpj21JXaSNN2Q9/Lp1NTDvMwxixksoZejx7ndVVC9SKIAf5Yi0UPfvAZ779
         fXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=P31I3C44WXD62nQdqJ/4LHYU5tGPmQzloTc3BsmhhAw=;
        fh=sHB2zS0yRnWevFkJTK1967u6F0/43KTjIcm3z6DZ7AI=;
        b=KW6Wd94UiCL7wCjuSmbg+vMqk4ZtwG2KgYccZ9nCtR81hk/dyJL0qCScXy7UKughke
         gUdbyf96sQ/+oFSjI3bK5GmoZjiOR8EHF5rCkKhNIF8tAxWSIXoaaZjiGdkN1S12FlgH
         draaYbrXePk7kG19Aq7GHbDExDgaPpvIU3ZCL3OdR5MD+EJTO5SMZcebrvS2f2OTw6Rg
         bu8ycxPn9QMV56TpYkjX0EO63dWFzyqwrcYikhd0AUGdE/Cy3kj+WkdFmGmjyJ9sN93u
         WcdbacMAscYl968tscNxDMWw14DyWX2MP9OrrGv6rh4p4M3TbP1HSBWF3F1sjvxxyqSq
         gIyg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O2X6Rt/F";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7db4990d912sor4886738a12.1.2024.09.18.21.47.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="O2X6Rt/F";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721240; x=1727326040; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P31I3C44WXD62nQdqJ/4LHYU5tGPmQzloTc3BsmhhAw=;
        b=O2X6Rt/FAc3sENEyJr8TbZfGlY4qjtJbBog8PKnPfvPJLFIC99xVgMAk7zHn6fSc2e
         u0boX6FvJioU08cWg2+bqLN8Ps2vJBeSc8h2cH7yz87b8a6YVSQclugZXykeHnR6fCyq
         saQkBXgUT14YFtjylwQDXJ2UeBH54ED302GlMC3MgSTLmvvPGEPvZe6cHnh+pcrNU7Me
         05yn5F86mqY/vSYE1zAJvr4R86WcL0VPutxXCk2jSbNYyZ6lOp5lmv6YQ+nEoICP8qVy
         zAM//cjLa2Q71unQXugxUGGMNtgcAYTY46v6hO+JthkD6QvjOdFqqCs+3hY4zzNO7JB1
         zwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721240; x=1727326040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P31I3C44WXD62nQdqJ/4LHYU5tGPmQzloTc3BsmhhAw=;
        b=nZVCxihAi8E3vprxn+C59zWgBIYKNFYbxrUvsziE8zBzM2DHjIZTnYjzPNu1KQaEKZ
         yJwtZ3uQBGMEMjyapCnc0KjOXCCj9vnyYXTK/pSL04bzkm/EUVZjHNj/msTFSNoM0qLg
         ibFpvfWcahwDebYDWt6UEsrqaaYQgEBKEkafeBATqFUU2G7kuZfIuCxMEIEs79LqGNJE
         Qo2zbbnEZ+mGjVYATrvT1j+r1HrL9qi9cs05j7xUb4wsjUbhrYk7fORh2t1JAtojz+AL
         oi+Jd3Wh82RTZeODV/bmVD/kbKX5so5r/ZswKrM5BEBthHtF0P/OfrnThYeNRO9y1oAi
         45fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqRL5EXd/k34EWhIR4V0H0TQlvm7iFdzjFys2R48DML1yZA3t68NQcSZo9Wf60GOt4Nq/25SGBsWW3qw==@linaro.org
X-Gm-Message-State: AOJu0YwD9Fjp9kpXw9dUE84HMkxG9CTR728SwZiGfYcn8lMQSpZZ+Cov
	f7PSMXqndVv5dHl7gPbb14FPCJADZiGWmH5E1YHKsUqj2u4vti0l62sdTgtPzf2Cfg==
X-Google-Smtp-Source: AGHT+IE2vIINUcW+zK0eGbTcjS/rKf9+2RXdS9WcQeduP1VsjHVzuUVVefnTsjBWDqx5B00zhv9fSQ==
X-Received: by 2002:a05:6a20:304a:b0:1d1:1795:4b43 with SMTP id adf61e73a8af0-1d117954cb8mr21768562637.26.1726721239845;
        Wed, 18 Sep 2024 21:47:19 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:19 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	Bin Meng <bmeng.cn@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Corey Minyard <minyard@acm.org>,
	Laurent Vivier <laurent@vivier.eu>,
	WANG Xuerui <git@xen0n.name>,
	Thomas Huth <thuth@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Ani Sinha <anisinha@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Keith Busch <kbusch@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-riscv@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Jason Wang <jasowang@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-block@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Weiwei Li <liwei1518@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Yanan Wang <wangyanan55@huawei.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Jesper Devantier <foss@defmacro.it>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 17/34] hw/acpi: remove break after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:24 -0700
Message-Id: <20240919044641.386068-18-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 5DG7gJ320OSX

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/acpi/aml-build.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 006c506a375..34e0ddbde87 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -535,7 +535,6 @@ void aml_append(Aml *parent_ctx, Aml *child)
         break;
     default:
         g_assert_not_reached();
-        break;
     }
     build_append_array(parent_ctx->buf, buf);
     build_free_array(buf);
-- 
2.39.5
