Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422750nji;
        Thu, 12 Sep 2024 00:40:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWfWwo2bGBd73p85c8HuXQxK6XdD4lnjvtpSjr1UBoQFHdTGHNTIpHFE5z8R/B26Q3AeOKCR+W8ID7gQw==@linaro.org
X-Received: by 2002:a05:6602:140b:b0:82d:9b0:ecbe with SMTP id ca18e2360f4ac-82d1f8bab3fmr255515239f.3.1726126835369;
        Thu, 12 Sep 2024 00:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126835; cv=none;
        d=google.com; s=arc-20160816;
        b=fYkp9H2DF+ISKBU7u3QLUk/H76nBwj4tiFYiNecztIkb8reNhUdlIZPe8cHtHuHcTD
         yw7nrkWu/bf810IlG533ZtVxCNE+DR7kLs2LWRxRXInVSzFbOAZE0TaODmzQsJvIPHpO
         niLODxhKBd8QRu5fxwQLPxWyz6E6GqE/tPTFQXb4v1HDBn56g9dx1juVlNloHBRzz6WX
         KVmE1s4QFW4WFijhAluGWa7F0whCnZZdlgu+um89tUB16q/miwoE0dG84r24yMEOAwwk
         NTgckUHlTtV9wbfsU085UPgmObC8myqLEsMBgHl9osQgwCa5xL+wRpgV+HB0tgu9fZ1K
         suTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AEyQ2xcAnmhK9ml4jXR52VoKIjk53wwLwPkspMKdJxw=;
        fh=B4Cid5GxchzzQ0LvNKRyxMd4FWat0wFgRPrYlaDefas=;
        b=p/sT1JEWsMyUOzU9oCx+0lKVNJedRInIim2KOrlYcACj1ocPyRC9HZfumtIgjGOm6Z
         LD4ZR1l5GF4uOXv71zprLELlyxLoiGpxpEbc/nWa5RslHT+nmu4GTeZunSlUnA3eNZSX
         NmccWN8t3NrNLV21CfEctOfv5zPtfhvEkjHhL0kCaChBRMgb2iF0cR4vLGvxDrJzzFpx
         p6gYf1c6hwrclYNULHVouhi5COWKZVB3/HfDoaOn0fKZyiDPOxcL531RBc8J4pnQBAYV
         /yisq2DaJVv/dZEpalT7ZjfcPSXuGBvNv3lXk8h1kMUCxAoygpV82psDddUCfZKLl7od
         Iw9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Muku/XO5";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 8926c6da1cb9f-4d0945addbesor4357788173.8.2024.09.12.00.40.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Muku/XO5";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126835; x=1726731635; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEyQ2xcAnmhK9ml4jXR52VoKIjk53wwLwPkspMKdJxw=;
        b=Muku/XO5uevvmlLctJ8PTJYcmJE4E3DkeutzTtbAMwisK5PrgQQcoTvgabaWf0efJ2
         UNaMwSgJKDDtBEQG8vjafoqVTzyP9hkVf7yaFlU8HZIckiknBB2NiC9QkvtJJvx2lap7
         2v0eJm80z07aeQRLDO/PwRu36vTPbarDL0gHUbFQA7n9x4ygtAABAPv8syUnDhyWH+UF
         VpZjvjl3BWxv7L6iAACndhfO9hTs25SzLlKqiE0pnUlq4Xq/BLS2BwF15R8OjJbQ0O3P
         /N0mUo5ZGfjYpVehdhPY4aJDv48xFa4qjZMdM6BbTHzTdYRA6NLxbks/qLLgwofpzcog
         hUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126835; x=1726731635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEyQ2xcAnmhK9ml4jXR52VoKIjk53wwLwPkspMKdJxw=;
        b=XBoSdJzTm3mcVEgbQMNpNJNMjK5sraZc6U287pfE/Mp0KORdFYV8sbn4AnBMw5Gs1g
         YKJdcT5m0WsqMQjtM6qQXKp/MhfRqIlIcLeRbE6ISUGfPVd5Adouy9awuDCRTH+O4Apk
         bSEGmBkbkJLT5k4AKn66pZBv4AXXZ5Y81xj35x92jccZ/6TXlOYbn9aOwUZYtgvAOpBw
         L4N/VGGYlkYn1GwUGwxlD0BeQoG4YUTXms415YqQrPGDRyVdyiuWMFXQAQGzVz1YqY6k
         pVhrefpZ/v4Jh949RTG0CpagPD3BHamSVBfbqErOqPJnWabLv20nDEjkyh4AcP2gz3/M
         LE9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKM4x4l7FDfQ2VX1mvmwQGOtYy2lAUuiM68pPH6E3yBCr5hAd2qnUyUIDMFy2k8/1up3+nRE3S9gFkMA==@linaro.org
X-Gm-Message-State: AOJu0YxpLOT7nJfShn+Ca+rnE2fdbIDaoEmkB4FX1gAKDoRO2dfJG40k
	tg89uUkb3ODqogznGp0TgtBJnQkYq85T/FdajFvSkOcjfrjq8BBqA4YjGDxErnuHog==
X-Google-Smtp-Source: AGHT+IE1ZM38e31F8YJ5oP22VNGbpDaEZK1YoPHZ70nspmYJNabyI5hv8MwCmiBG5cRfcCe0ROr/ig==
X-Received: by 2002:a05:6e02:1a81:b0:39d:2939:3076 with SMTP id e9e14a558f8ab-3a08495df72mr19677125ab.25.1726126834897;
        Thu, 12 Sep 2024 00:40:34 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:34 -0700 (PDT)
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
Subject: [PATCH v2 26/48] hw/acpi: remove break after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:59 -0700
Message-Id: <20240912073921.453203-27-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: JeQgwej1+2gM

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
2.39.2
