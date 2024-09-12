Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422447nji;
        Thu, 12 Sep 2024 00:39:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/OenMCQEjVxQiWEPLUhfVFBiOH6gDxcoaj9nFx+4eTThxfQVroU/mT3mdCWT4kSMAfaG6R5p2QJ2IGA==@linaro.org
X-Received: by 2002:a05:6a00:1ac6:b0:714:2198:26bd with SMTP id d2e1a72fcca58-71926081831mr3295754b3a.11.1726126769126;
        Thu, 12 Sep 2024 00:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126769; cv=none;
        d=google.com; s=arc-20160816;
        b=Avz+g/Q55P4CK1BBBT7G34Wwfyse8GtsO74Oh1b5grXrDFgAA1bKbQgsi2uvl3jkyp
         D9QEYde9+Gew9aLlv4ldaoTLGRJXFnDvcOT/whQ0ji6W50xVZEo3cqrXhHpH88I0afih
         EtK5lRN/xXHgizekqChUy4/tTzv638QrApeH7UGcrClnseCt86zdftMCB111p2ScKmBh
         AlAqFtYZeCfpQT/eJMY3WcJaAHvMFg4JN9NSLeGdBwjk7QFzlchdT1fKWsqG2yGWz9xw
         e1/KIpjvWJ5Cc3k2G+qP/eMV0JBxpeawP37/SrT+jlu1gXEwtVdN0feKau9UoApIgKVl
         A5CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IRV8cs5vGajAoqqaVP2CMnCi0idLbKzQEkk2XTwPdlU=;
        fh=xE7xALIJp2cv2sxPF3zFR33lz9kpsEZoB9gDSAQ1lqs=;
        b=rF9SJlybFDzDXmXlkk3V0Yyquz3KNOHvjDC+8lCdWKXewxPSEfP5YnakCwd3dyTZTA
         b/hvvgpFwWArfQS878xyLtgmx0wgWyuW5wDmFgIjqggp9XXDdBEjZMn966+6paCJN9Ya
         9yRbym6cS4pDGnJCvvxhtSQ7flP9CvIpcErxDjsDWS12fh9x3eshbqYnamDS6wb3qbH0
         g1h1DnIZbrf8OAQAWvg3oeSC3c5relRbWDUfwyDEV+fIEQbeYieV+SkwJa/1EZMDKoAo
         nmcC3+wRVAKypz/L1OU//G6UyKOZzN2L8H6WmfAapDwt+HkwLBQwMv/f+QtkvtF/0nBx
         CHPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aphDUzq+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e598a435sor9446211b3a.11.2024.09.12.00.39.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aphDUzq+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126769; x=1726731569; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRV8cs5vGajAoqqaVP2CMnCi0idLbKzQEkk2XTwPdlU=;
        b=aphDUzq+074c79XPxrhWNJdmYuc4ziah1h1V1GHhTeBBOwTVA7A05Wo0XhceED/Phm
         w4R7w+/VRM3QCO+6bgc3I8PNTvmlY8wJincOWkzwRcz/4blVR3/h59ajauIggrD4n4kZ
         vwjDOfvq2T4v1rjE1O0q9Bb6XWmxORF1/BQGJlRw6pwWHnLeUmEGYEc+U/JxoMbgOMes
         iQytCCiF0RkYJ2w1M/+vKlknzyqiOBZVsAJPkGNufJmYAVEHj1vS0+x3tyYlDnVXtHeu
         sr/xR1LVuqrlgc5982BGjtamVtThEDtHJKZe7LDGYg0qDEjElvCfLdJ0ZCT4P4ZqPNXa
         2m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126769; x=1726731569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRV8cs5vGajAoqqaVP2CMnCi0idLbKzQEkk2XTwPdlU=;
        b=NEMx5Rb5wWoiu79tRUIE+rclQqycmIaO/ccItefDrBufTnRcsjbjlNUaeA3+B3RXS6
         7Bj8K5hXNTW4yieB9rhQpPNs5LZmEHTtf/gtmIOh1NtSVaO3HFHlFjaXEXj7DLcSe4jC
         zjTjcQGtrlpn3h4MQEaAmV8vrK+NoMqJckXNdl4tG66o/eWjoQefjrcIi85JZ1zhOwjj
         NRMAXSEIYwTMfnIA0sWnYxm4LMBJwIHdto5YwpRX4dSkYgVnVSW9HJ78XRw4wBm3zjQV
         nSRqAF8/4Q84kS1HivZIojcA3YQ3xKxICCB+DNlwpzrTk4gt2hqOAN+GaCexoi9NrS8W
         NNGg==
X-Forwarded-Encrypted: i=1; AJvYcCWh7wOULsnVAIsaE9HhzzjpGaRGcr9A/kiYnAmmM5/tEm5+hZ1myN7Wnb7dJh9ei10bJ5JGHciZ36BNow==@linaro.org
X-Gm-Message-State: AOJu0YxmQUHGnK/PryTSCtfCG1dtFMyoLbzkqsuIFG2kkdThS4y+HCcG
	riG03S31GBcXdpV1PAllNdytUYcuA96sp/ZOlgTmA9QJMQgvrorhyJikTlR0Qv8GMg==
X-Google-Smtp-Source: AGHT+IELQJ4LN1eiiJh78GYcEX/xms21hXHkteEXLmVpd/6Wpu6TPg6l8or6duVIN2euH8mSyIIX7A==
X-Received: by 2002:a05:6a21:10a:b0:1cf:434d:609 with SMTP id adf61e73a8af0-1cf75ec46b4mr3157664637.6.1726126768552;
        Thu, 12 Sep 2024 00:39:28 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:39:28 -0700 (PDT)
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
Subject: [PATCH v2 01/48] docs/spin: replace assert(0) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:34 -0700
Message-Id: <20240912073921.453203-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GL9FfQnbfayv

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/spin/aio_notify_accept.promela | 6 +++---
 docs/spin/aio_notify_bug.promela    | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/spin/aio_notify_accept.promela b/docs/spin/aio_notify_accept.promela
index 9cef2c955dd..f929d303281 100644
--- a/docs/spin/aio_notify_accept.promela
+++ b/docs/spin/aio_notify_accept.promela
@@ -118,7 +118,7 @@ accept_if_req_not_eventually_false:
     if
         :: req -> goto accept_if_req_not_eventually_false;
     fi;
-    assert(0);
+    g_assert_not_reached();
 }
 
 #else
@@ -141,12 +141,12 @@ accept_if_event_not_eventually_true:
         :: !event && notifier_done  -> do :: true -> skip; od;
         :: !event && !notifier_done -> goto accept_if_event_not_eventually_true;
     fi;
-    assert(0);
+    g_assert_not_reached();
 
 accept_if_event_not_eventually_false:
     if
         :: event     -> goto accept_if_event_not_eventually_false;
     fi;
-    assert(0);
+    g_assert_not_reached();
 }
 #endif
diff --git a/docs/spin/aio_notify_bug.promela b/docs/spin/aio_notify_bug.promela
index b3bfca1ca4f..ce6f5177ed5 100644
--- a/docs/spin/aio_notify_bug.promela
+++ b/docs/spin/aio_notify_bug.promela
@@ -106,7 +106,7 @@ accept_if_req_not_eventually_false:
     if
         :: req -> goto accept_if_req_not_eventually_false;
     fi;
-    assert(0);
+    g_assert_not_reached();
 }
 
 #else
@@ -129,12 +129,12 @@ accept_if_event_not_eventually_true:
         :: !event && notifier_done  -> do :: true -> skip; od;
         :: !event && !notifier_done -> goto accept_if_event_not_eventually_true;
     fi;
-    assert(0);
+    g_assert_not_reached();
 
 accept_if_event_not_eventually_false:
     if
         :: event     -> goto accept_if_event_not_eventually_false;
     fi;
-    assert(0);
+    g_assert_not_reached();
 }
 #endif
-- 
2.39.2
