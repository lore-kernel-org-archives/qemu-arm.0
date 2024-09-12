Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422527nji;
        Thu, 12 Sep 2024 00:39:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtBRogJIfSnHDkY4ekEkyCwriGcI3dM0y3O1giK0hjyMOOiHjgqM4wBUzEVGaQ1fFuLFD3GQpeVGLFKw==@linaro.org
X-Received: by 2002:a05:6a20:c702:b0:1cf:2a7d:705 with SMTP id adf61e73a8af0-1cf75f2a5c0mr3423267637.20.1726126786112;
        Thu, 12 Sep 2024 00:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126786; cv=none;
        d=google.com; s=arc-20160816;
        b=Mpc3Rbn/0PslG/6v6bqzdeee6IFsdg7R0PPlGSq1EuxZUgsgTrMO49JGwsdZ/02T9+
         kMhhSADvnxHTHTiEVouY41xa/qwrAUI2Ju4/ETT0NuiwyewQbIicTfWmzuP5UsG1wi11
         kKcy7Sh/jGuT8lZxNOCuJP4zrRQwTV2WnEC5dAJJ1LaspJkpv4L7732g4zawQmGAnWl8
         4AHbQ8lwcU6jzkGJCGhNhSvpAWVcjMqnUTG1zqyyh9RXSvnmYEPuzVJ2XCzW00F7Iz8P
         xmSfRD2wSUo7FZ0wXgyjc2va7dLy7tdqzp/2u7vbDD6hjQuUl/NXmPFP8nUJ0cLBALbi
         atTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=JPBETK2XAIe21YqE62iAjxbH8O1+L7jgUq9LFf3cER8=;
        fh=abwVqNNpPZSCA55xuR+zUnUnGdQnUKemKYKXzCwqcjg=;
        b=USx1W2vwarYMm0c4q2nuHqgXQCQaQIRyG81AihtsWnEOnHhg00Bqrju2x8sNRvI9xk
         JTNn1/Jjbwibty7V4uMEZq19S+4sqK/yKkFWUcsUx13o8pW78TQmJNtEgyUYfcBMX1JI
         lYhjeC+9zFpWMU1Z4fwBhYcL8x/GeRGEf3fBCwXaR9GVcTuk+1qMSmNJiVRJJWXL3OgW
         O4SKK35rre4PDYojxYY8ziH5upRuWWwFFFb189Un4ZiIVq3Z/OPqJvqnffg7nht0yjBX
         UeoKnI5DwKXK8eIDdsBSRzhxWG/U7wnVT1L6m02vAd/H0PtgypNb0EPJuQCu9f1ic5Wg
         fayg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B1asfSYi;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e596f584sor6553961b3a.9.2024.09.12.00.39.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:39:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B1asfSYi;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126784; x=1726731584; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JPBETK2XAIe21YqE62iAjxbH8O1+L7jgUq9LFf3cER8=;
        b=B1asfSYihXaObLRCDpspJQYRl/9YrpF/Km29DrNGc/Mf5bsw5VhTJlfieKbxQ1eAvo
         o2a2E+byhBhwO7KnNsje5AxDJMnnP5l+yzJ4bPOBx8edUEHVtcZleVP5nOUx6tKi35VN
         vu45Mid2jJrzvQVRZPy87BjXztii6MYOlRCd5IAljxYVXxQnv61Yi7SxBGZwDmc68zi9
         Fkob0k0TLv9wh+WWtRFODjla79m8S/VvXzAQRE1SkaFaPifJHO85bLkHh29NSRtKA2oA
         MwRYyLSFJx5UlIRseIpyWJwiHytTOhOLyFE6cpmGT7VuJiATzZqFq2jeW5NFJ3Ix+qIH
         KmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126784; x=1726731584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JPBETK2XAIe21YqE62iAjxbH8O1+L7jgUq9LFf3cER8=;
        b=k07RvSEd3IKgNnPYeidTwUQj038LLdNnfwzCwCaUFr0EOl5OSqTG6RFNfVOHZ3HZW6
         2i399DT80hT0kdGFJM1Kp1de+DH2BDogQ0P1oDaFkt5zFrF0gJLidh9SsyNczMn+KSAx
         EGa0PVLtvLgClPeUp0qwdwxzwkzeMuHTIAVY6NoGjhASAR7gcb22RaYAvt6GFAD/xJzg
         omdfEqHqXZvGjHYuMMFUg11IDMZYe9Ol+LI2JxvIkINSbWQGZV6Hwh3kWzQx7ZjgDhU2
         Zd6TRrqGar3oayLC8M6PyqieA7gZot+voBrmuoci8z/wZdGLg2KzawCQfmLvQ3VFkorU
         vpYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5HevzMZDpfEEuJPOVKZCD2DftagVm4CVy/yTIVbnBXR+Opx9UFPYa5hCVCSuRULTLwr6vkSV298ZdQQ==@linaro.org
X-Gm-Message-State: AOJu0YydJx2kE4IIHn588LGHDHLvd68JULCbf37F3rXPKrtGNJ263d0C
	1xJQV9wfj07nDLlCpWPpyOXi8kN/nZVADjUDl6LqO4DUnggKJvG77+a+F0G4hoXj8g==
X-Google-Smtp-Source: AGHT+IE8nod63m/5RXrta+YpJQqaG3YPkY5+/q44EiQGD+6nDtI41YYUwLPx+yvQ/t0TsoamRCJlww==
X-Received: by 2002:a05:6a21:648c:b0:1cf:354e:93df with SMTP id adf61e73a8af0-1cf75ec5406mr2741834637.4.1726126784600;
        Thu, 12 Sep 2024 00:39:44 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:39:44 -0700 (PDT)
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
Subject: [PATCH v2 07/48] hw/watchdog: replace assert(0) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:40 -0700
Message-Id: <20240912073921.453203-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pc3hrcUPT+09

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/watchdog/watchdog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/watchdog/watchdog.c b/hw/watchdog/watchdog.c
index 955046161bf..d0ce3c4ac55 100644
--- a/hw/watchdog/watchdog.c
+++ b/hw/watchdog/watchdog.c
@@ -85,7 +85,7 @@ void watchdog_perform_action(void)
         break;
 
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
-- 
2.39.2
