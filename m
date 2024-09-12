Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422927nji;
        Thu, 12 Sep 2024 00:41:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTC+yKY0vZ1JMaJNOy1r5haCqvKH1Mo9ciHME2DBK/s2xlunFw3ppTSSiXA2rQqo9FfLwJAYumWzxRSQ==@linaro.org
X-Received: by 2002:a05:6a00:10c2:b0:717:87d6:fdd2 with SMTP id d2e1a72fcca58-71926060d1emr3316053b3a.4.1726126872200;
        Thu, 12 Sep 2024 00:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126872; cv=none;
        d=google.com; s=arc-20160816;
        b=rPXEvq27QXKuVkTkhdQCA7+E8IQX5ApfubI/jHqiLhf0m2kap7EztGk+TcyRX53asD
         LUx8QO3x0t0TBJqmYl+8g+Tjnw0vkHlIo1477iuok27F5SNeeDUNGjeXHMgkGXRI8Wsw
         +ufL4B/u2l2nWSRUL5TeOW+RZ/7Li9vSYVzK8I1NER+ju76aSYkP3j/ReZLq7zhdhDW7
         GTX4gsyeTXkGxLxRfvj7yZwG/wB6dbY8S15K+ohoPp2yNdROKbQNADb7/BAR+6B43gZR
         SepX+VzkX5VHczHOTl5Y4jsE63QzzT9RaCfoYzF2u+4MuznIJMfO41gGfN1uYH2gm+3C
         S6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0Q1mMHu0qY1Mg7YdLUybGWIueKQg5CpgXLD+/9rtI1o=;
        fh=Qa1glO/T9XOHCGFMDaOVks9rA69J6eyYXTQBZVZ1DjY=;
        b=yNwNgKWPkuWi7psOiW97pc6pCFs1CWyTIAQ+vEToWogBak783xXolA4U9juwnbomSg
         rhd/1uEVRWX85M31avng6YYPXf5P8mGB1N4mTYIrA2/OOwgS1aFto8MTLDDTWyxxcJT0
         i8ZIP2Oy2x0jDfyup8cFYe638NOqok0DPKd4kTnBNSzZp/3yH1DAZ1I7aRpjrcYaFtvP
         ryiAHcLoNOwtvd1oUbR+lTjx/hIDqcTFFx8UvO/Wi4QMk/kPreCCj4TcoTAkmDEWphUe
         phMx3QdX7WUJRhu8pxfLAzOCx19Y0FCu1GD1ItTc0forrjMEqCyROqDcHG61H/nZHbSx
         xLMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yugfZkEB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e598b19dsor7476042b3a.10.2024.09.12.00.41.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:41:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yugfZkEB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126872; x=1726731672; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Q1mMHu0qY1Mg7YdLUybGWIueKQg5CpgXLD+/9rtI1o=;
        b=yugfZkEBrhJEM2WFJ1fpgVetAHtI0LdzsaWGB88aXN24jinml5YVsOHiN5PQ6lo7k5
         HprXny7Mt/kLHr+y+duCKtCNkS5LrpdZlF7a7kusJdI68VBpdCz7/MeHqPIBlXT+0s7r
         2GIxBkoqmwoi8QqTZQG6P9S7i91CYu9cvgObRmx8NnK92LxJqCdyBMgjao8AsrgP5qsg
         VxKx8PPC58F+zm3Y71b1/qFQpnCjpb6Lngo0hkVeteMDJdiPM6r9ergMSfUXR3a5T9VU
         KTqmiC0dG6wt9tcH6/ewbg1GLdqZrDwqY9ykuoIZmfPrhGs7mAxH1B0GH1ZaORCwh4lz
         y+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126872; x=1726731672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Q1mMHu0qY1Mg7YdLUybGWIueKQg5CpgXLD+/9rtI1o=;
        b=R2KWZofw9jpI3CXgxsp00TMhbpsoRBwSEHCyA7u4b0kY8n3VL5J7xqV/OiqjREIRm9
         yve+5tEk12j3K7vUIFnXF5dpLglgYs20Qx2joMyinzcOzNKjAGOqbthu4WqJU1TY7Hd0
         dYVkQCy805bHa+e6A/epmwU9Zmqev2p5FFxVSedk2RowqGS56rQqsypzlTxgKwjHyXUf
         Zjs5/l7OnQ/azohfKDwt3ebdlZzDljCcVx22Dk/fhOGk5ZxAlCvw4VhPW1xM/IZ11Svl
         GiQf9baa2hwYwno233jhI/EG8w/Vsi25Zbt6HmM6ToG7W15MBZU1iA1gJ7d3IXnGtuDJ
         CR/g==
X-Forwarded-Encrypted: i=1; AJvYcCVxQ09cDba1neB1xfZVJClUJKNlBr5C1AVm3uGYVGrabSmr9eMmQfqmiL4Z//uGDwduKXkUIgB+9FDI0A==@linaro.org
X-Gm-Message-State: AOJu0Yy3mDIqkiVpYbtL1I//XCP5Q1hGtr9OjKXOCL9xfguyVtkfJOTa
	pBQ4NmZeea16N1xV5gPmJjQNcjNI7p5nyqPCZAsbQyW9zh/b1yQ+K0MQvOQJ6dfkXg==
X-Google-Smtp-Source: AGHT+IE7t7Xs2KH5JUIaVOe68OuWPwNTouEEYSj6TZqCiSQvTjYgxD2YaXeBSDQ2jSGG5jMqgQ5hKg==
X-Received: by 2002:a05:6a00:1906:b0:718:532f:5a3 with SMTP id d2e1a72fcca58-7192607ec83mr3028275b3a.7.1726126871623;
        Thu, 12 Sep 2024 00:41:11 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:41:11 -0700 (PDT)
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
Subject: [PATCH v2 40/48] hw/hyperv: remove return after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:13 -0700
Message-Id: <20240912073921.453203-41-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: CiEUwQ7cbldH

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/hyperv/hyperv_testdev.c | 1 -
 hw/hyperv/vmbus.c          | 3 ---
 2 files changed, 4 deletions(-)

diff --git a/hw/hyperv/hyperv_testdev.c b/hw/hyperv/hyperv_testdev.c
index ef50e490c4e..a630ca70476 100644
--- a/hw/hyperv/hyperv_testdev.c
+++ b/hw/hyperv/hyperv_testdev.c
@@ -89,7 +89,6 @@ static TestSintRoute *sint_route_find(HypervTestDev *dev,
         }
     }
     g_assert_not_reached();
-    return NULL;
 }
 
 static void sint_route_destroy(HypervTestDev *dev,
diff --git a/hw/hyperv/vmbus.c b/hw/hyperv/vmbus.c
index df47aae72b8..be7d3172c4f 100644
--- a/hw/hyperv/vmbus.c
+++ b/hw/hyperv/vmbus.c
@@ -1890,7 +1890,6 @@ static bool complete_create_gpadl(VMBus *vmbus)
     }
 
     g_assert_not_reached();
-    return false;
 }
 
 static void handle_gpadl_teardown(VMBus *vmbus,
@@ -1947,7 +1946,6 @@ static bool complete_teardown_gpadl(VMBus *vmbus)
     }
 
     g_assert_not_reached();
-    return false;
 }
 
 static void handle_open_channel(VMBus *vmbus, vmbus_message_open_channel *msg,
@@ -2021,7 +2019,6 @@ static bool complete_open_channel(VMBus *vmbus)
     }
 
     g_assert_not_reached();
-    return false;
 }
 
 static void vdev_reset_on_close(VMBusDevice *vdev)
-- 
2.39.2
