Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444574njb;
        Tue, 10 Sep 2024 15:16:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXij7ogNrG8MYVx789Bo0bd7ZwTLsRWWiadXrpItjk8a0C/DKhXRVZQgyg6W0oBu3kONlL5CXzvDNtJqQ==@linaro.org
X-Received: by 2002:a05:6a21:3a46:b0:1cf:2ad4:30a8 with SMTP id adf61e73a8af0-1cf62d7cba9mr1413405637.44.1726006618571;
        Tue, 10 Sep 2024 15:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006618; cv=none;
        d=google.com; s=arc-20160816;
        b=XU86eylbd8tMaNBUUZttT7yry7inAyvV360u50Ai0381Mjm8JNu5jF+5vbTpTWdlft
         Ho/3ZtjGdFEYuMedRCdu7MA8LVHnWW/aP3VqFkbak96bHF1Sy6Xrfdfqn1JWYYVgY2o/
         rVP8iN31Ka+NnU6BlPYUBl63xYXdrVgTFKJCzpbZjoKjW1/TGtQzRKoPrV3KRBpzCY8h
         KVQ5+jP27ELABL/s7Wx/VDPU8J1/gq+rUmglIZDWKcImIVdoMBTyeo8ecgJ7xOCzwvLA
         lh1jh27lSUXzTvBB52YCn5zaf/Zu/Ad9oRMIYiIfvdRFHYqBTbEime2avgbaoCUUThsA
         CL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qcrIg2qAf6uELGwQ4F3jw2Dk1PoiMNeAX8XN3cIVz0A=;
        fh=Cg9SOOdeaAoapUWHs/Zknvxfd9lA6I4xiekRj9HOQ58=;
        b=x7AkjYGS9ovvpk9AUsispzDsHXDI1cHFBtH6m+TkxVlAZ2TlP4m4fMQa2KH3eQ/HGn
         YXiO+LuW+WrLOn85BdjmUZzMtFE6RoiiM9ZBhrscYkfMWw+qsr7CZ3bFvvpT64PoTXMB
         0FKMf6cAB01pslsnfodSvftkAl07XAhY10bVQaDNSaZ6r7IYBchmmHZayIh9up67IirE
         OxAe3YdnMe6s5SyGBQURFNq5ys+9k4Snxj8VkFwPc25yF8jLBgre/TwISquHjYs+P7Z5
         JUazoUaUpA+KbNketvwV6fhCEANMvqs2aIcJ7sSaJU5UnyzMtyCQxSHQA2eGpzsT/f/I
         aong==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r+08cnWv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e598aa3fsor4627529b3a.8.2024.09.10.15.16.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r+08cnWv;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006618; x=1726611418; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcrIg2qAf6uELGwQ4F3jw2Dk1PoiMNeAX8XN3cIVz0A=;
        b=r+08cnWvy01WYLa+axVIxo1BbKwvjnFeuuI/Ls2GssIhGg2Mhp835cU3vGnFA/z45O
         tHJxm1EKxvsfGoUr+TpSALk4yPOMPcOv257egx0X+ZsO892N9jEd/BKjOcKggBzTbO2b
         CMRVIokVasBtzm/Nwb5rVJmvmvlYwgEfI//uZC7xH6ickxVCqg9JNPjehj33gdt3qXhk
         UTS9QRcuuEeSYTbRr5N07M3FMwP4OtHtqUYRAFnJx/4pWeoU78aDjNpWnldAHnnH/CqI
         14H6x3OJgKF4u1foXwQx2/oQcNbfkdDwG8IlHOD3bw372zM0fMSqCrMI6NcVHm7fdAw5
         Ub9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006618; x=1726611418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcrIg2qAf6uELGwQ4F3jw2Dk1PoiMNeAX8XN3cIVz0A=;
        b=fnTdRxveHIgoKfGI27klohNOo92ZlOAimKFAMXFodplB65eUJ+uhDhH722xV1L/I9b
         vb2u3Eon6n34T0rkNILI6xn9z3DqhLjqaVnQ0Qmg76rC+3BW98xp7uN8QcWWvtR0wmzU
         SFvA9rFb+bpLNgMxd5TyMWBBXMvbyLdjxG/ADZU9CEaP6JmecTYLHsJnwjNK5vyXastP
         VAAf3+khRsdG8x9HqmhNysc/ty2+EbmSdVODMWO4zBptrvUVku1UBAn4kTsTgoLiRgGJ
         cIbiHFO6KbR5oPcrdPfNT2p8aT7hMTyT8OHYfBOKXcbwK7XaRgT49HC5K/lUeIme9l3K
         0awQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcD5smTL5As8J1DaOyzWv70+FBvHgUkuMXD50jYglIAnSBd9vqSMZqrRDIMrXji5i8mApreLj9GySOhg==@linaro.org
X-Gm-Message-State: AOJu0YzZ78Ka9k+8sFxj8hpzMVyhAncux8bw54WIOu6tWuy7LwWAA/j1
	1hou/Qtt/9H/58l1xHFEi8Z+jpP488i6vZaDg/yY7ZdNmQYNyd10moXTlX/9uyX98w==
X-Google-Smtp-Source: AGHT+IHlXcViJ7Uqavmm9h0Agv/EoGh3ujOBi2hWwTsBLR4Ow1eipycn2U7OZZTHFj/uG0XH/qrB2Q==
X-Received: by 2002:a05:6a21:70cb:b0:1c4:9f31:ac9e with SMTP id adf61e73a8af0-1cf62d7bea5mr1368837637.42.1726006618086;
        Tue, 10 Sep 2024 15:16:58 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:57 -0700 (PDT)
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
Subject: [PATCH 20/39] hw/ppc: replace assert(false) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:47 -0700
Message-Id: <20240910221606.1817478-21-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: aVBzDeVg5Bp9

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/ppc/spapr_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index cb0eeee5874..38ac1cb7866 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -645,7 +645,7 @@ static void spapr_hotplug_req_event(uint8_t hp_id, uint8_t hp_action,
         /* we shouldn't be signaling hotplug events for resources
          * that don't support them
          */
-        g_assert(false);
+        g_assert_not_reached();
         return;
     }
 
-- 
2.39.2
