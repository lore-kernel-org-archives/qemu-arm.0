Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422763nji;
        Thu, 12 Sep 2024 00:40:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVp8WWhPwn+ldYR0JkzF0weBJAxT3DHh/WY5jTKHigSF8tMqINghoUn3BwTRVNIGa1+s7aUy5iUgXM5lQ==@linaro.org
X-Received: by 2002:a05:6a21:a34b:b0:1cf:6b93:5622 with SMTP id adf61e73a8af0-1cf75ee4d05mr2671229637.14.1726126837874;
        Thu, 12 Sep 2024 00:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126837; cv=none;
        d=google.com; s=arc-20160816;
        b=ClJnVUKW4gO9TtWbiYpZAiaJcEcGZSOA3U6TQaAoyRWjAlpwigfKjwRlq15Lhru0Mj
         n8Zaknw8F30+6LZm8lXEujDhwsWX19yX0e2Iph0edAfG31yeMqQYEjxkVEl1JyRCAShy
         wACXjSeaAmr0Awo/HcI1qKj7XGU36qqCYF+CLEcukPyO/0vi1P8LFMQ2yfSmlMtNu58q
         BJeueWoeLkiQFx7+xB1ZDXZCcDRfOIT/fnfvk1sHqCX4CWaAS/WYeZGXrIwdtg7Fr/pD
         o4jIs12Dkp6Tlrq7jOrHitRHatuoLbitB2HqfO5u62pdDC8bwb9pWWufi0MsJ0LKnw2e
         dBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=T4cUmRJxiWI+4P3xFKTX4Sejqig+SO3wUE6UW4QGJvI=;
        fh=b9WZcoIsYd3r+7n7g+LEJWqh7YqkMQNgkL7kX0iAfgc=;
        b=riWEpJjXjeFH9Jw77JBgdltNXf/8VufsZn4inWRB8VZc+nefRhTjIt04iV0q8lJdrd
         RemfxjbpaPjVlMqGJRum5ubjdeTvbhwBnfC+P8UzEuP5bpX/JVHxrrwkqYjqWV4iKVhg
         C9opVD/+QJeYF4sZ4eBXk84xVakHY4aIqhoxNwLEyh3YwYPrw+MdGRFkBlKwTJOPkX6D
         9I3Vej7kbu0rF6PL00BAbUV9+hpAxAkcVdcjdwQLYIXWWOS4dRjc6O9nZuYrIZunitOw
         WQaDYGhEDDCuPaSuGTU0sLdzWvBiWRZZRIdeREAfZUIzLZZQgP8X8FuT7SjvlS+YvprS
         kWeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=neNlKDng;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7d8254e66ffsor3851961a12.6.2024.09.12.00.40.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=neNlKDng;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126837; x=1726731637; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4cUmRJxiWI+4P3xFKTX4Sejqig+SO3wUE6UW4QGJvI=;
        b=neNlKDngGkJrh+4iCHo9Z5ZpBXBxM0Nd/U5iiFA8cPttE1NDxwKfVKyQSQdHjKHrr8
         x6+isSB1CnSfQvvkBxDga1o28tWtl9B6IpFSeBsmtcSBxYbLS/X0woIiI47znibYNMZN
         pTnHCYfumjxJKYmnylh+OTTKe/ciB4tn5Nzt7AOKMldF1JEdxRlRzLUVgz5mCkGkpnhW
         Ta87dftPb7PBTHupLQPBQm0FS/U0oAe8aMme332nxLaV/x3fCN61Zze8Ed3XXIPhW+vX
         0iL2iiET3ELkRNhKSMkvoxbPRbPd7n1zHqFEuyI8qcETQWr8nuELHsJymHWSc8WbgKvh
         8u+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126837; x=1726731637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4cUmRJxiWI+4P3xFKTX4Sejqig+SO3wUE6UW4QGJvI=;
        b=QxSZy62jVO2z4mVV72HZUAaNJAYMtQk4jz0hw+mlSNqwdGg/PT5QyiyESVbqBQKzQ4
         6URsjfPddiRwZ01UpA0Xf0vhK5a6g4O5pdKYUbn9gntRyAB+PJxrfLU6rl8Oh11S05Tr
         N+e+f5dzcJj//ewP6EfITcndrJ9byM97AoPLCtqpEsQJNmhtxbRYKTGH1wctiiibHc2d
         HhZNPWljrdKifR4YG/X+bK7QS+clbjVcMPbTgtkATV+MDVeiuPG8iF0tgWz4mszGYfXL
         DllDC3VWIj0Li2Wv8gD9VtBehSM0cIXFzhXT9Edoev5Z7MinaOsLUhSB8gMCnaFSqal2
         dtmg==
X-Forwarded-Encrypted: i=1; AJvYcCVocuhKYtuita3Hf9ea0uiwHPUilWzOTq/FqcdeK7JvCSfNEalbqJ7n0WxOs+IoHcEfF+sZaAYD4NXY0g==@linaro.org
X-Gm-Message-State: AOJu0Ywh/ChqOsxIOui1InOlE1waMK5mKtxLz7Qcxk3jpXr7Yo88+/i1
	r7tufllY+v9XRApHUDicSPRG0HMff/0jNfI0ctBw72yqpjOg+6ueUO501Hrza/H17w==
X-Google-Smtp-Source: AGHT+IHas1oukAOaDNvjAJwoGhr1NcYPZnCTY9G18MbXXKsVaftCFarfJ0eM/UXI1bph8rnTKBJZdQ==
X-Received: by 2002:a05:6a20:c6c6:b0:1c4:9f31:ac9e with SMTP id adf61e73a8af0-1cf764c2648mr2589519637.42.1726126837349;
        Thu, 12 Sep 2024 00:40:37 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:36 -0700 (PDT)
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
Subject: [PATCH v2 27/48] hw/gpio: remove break after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:00 -0700
Message-Id: <20240912073921.453203-28-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IoLEQ6iZ4OI5

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/gpio/nrf51_gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/gpio/nrf51_gpio.c b/hw/gpio/nrf51_gpio.c
index ffc7dff7964..f259be651e1 100644
--- a/hw/gpio/nrf51_gpio.c
+++ b/hw/gpio/nrf51_gpio.c
@@ -40,7 +40,6 @@ static bool is_connected(uint32_t config, uint32_t level)
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 
     return state;
-- 
2.39.2
