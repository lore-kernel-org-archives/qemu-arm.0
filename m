Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444411njb;
        Tue, 10 Sep 2024 15:16:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZthHaq6JFkUrQkeTh5hGoI+Uc3cM1k3kwzpdPvaDJBTAZ31mwUg8sQ727teAqPEa6OCfFORHMNjAAWQ==@linaro.org
X-Received: by 2002:a05:6a00:2f9b:b0:718:d4e4:a10a with SMTP id d2e1a72fcca58-71907ea941emr6543001b3a.4.1726006592472;
        Tue, 10 Sep 2024 15:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006592; cv=none;
        d=google.com; s=arc-20160816;
        b=emV6VxQcoY+sU9P9DXgbmBuIpaVU2UUi5mDHd3jXUlbKD8jb1KMutSzH/KlQomUPSW
         k0NqwOvdQk7R1mxE0KKA0Rp/4B2Y3TgiJsAegtvy2dGwjfOxx1vaQ6Fm6TIJsPBvCLyB
         IEg+/5kP2UgPtzMBYS9BXgi41x1DhgWWnW43blQ39wtJKdg1Rr8VKqZzaHTGKfTrZOoL
         F/6slngMhhQkb1wYb/fruBMCRzPmPxuyYh7u72eMmYHcXg7f4Y+reL3QDQOGiXkEq5/4
         i+axLg0www0mQx9i3XnVmqLDTCnlCudUebd2d8hsSsrWcB7UVyDBM/2uOXZHWXxVARb7
         Hn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=W5hvV7fm4k2lFXirrgZp/rTlQTvUf+N/hoDJJrlREps=;
        fh=/aEyH5gKXU36wGBZ9GyMpq11EUGGKK4tnP1RADwHZzI=;
        b=kg1GpvSOL7h5V15mMfkqca3BQIvhusnue51XPg31Kaw8NgcFz4qfnVrlgsxTGp3ZGi
         qb1p/NF6T0Ct1yexHd6uBcWz+dh6qHLV1OERiBk9NCbTtcnv0C+6QdbfU7LS19RwBsvz
         4E9jx9yhRmEoyRLreGj9T4eMBFSt5dpZOmzCQrT1eg94Decd6apJ5EJrsRpXeVDEDXEd
         1/cr3B3PT8U0B40LxTcaSkQJ+PDy+U51BhuO6u6mx1oMx7x1NW1tm1pJDw76CwVRWLuN
         djAax6HvViKLz5RSueEOgAKimDpbCw3+Wly1UpY5ZovBvFG3u2Lzm69dlO23udtauZih
         O7iw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e9dZBoUB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e573c089sor4298956b3a.2.2024.09.10.15.16.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e9dZBoUB;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006592; x=1726611392; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5hvV7fm4k2lFXirrgZp/rTlQTvUf+N/hoDJJrlREps=;
        b=e9dZBoUBXq++uecU4iwQAaQJop2+ZxaD0byBxU7nJCWRrrkNSWaFZGje7ciR3bkNU3
         R4p7eWw+ajAFc10HdB/VfEaGCQnQasD5XCgnQxdxrNvW2lCbZ4ALO9nDhMCgWFEW4F08
         qxUkkkr/fi1ShKxm9yYODouCkitFF+BZrsbevx6F+Rtu4ukDT3oOo545g8VJf+KpLeW1
         ehyKLhqGxxS5p15QEZaX67/Vk2mXAZ2WtQYagBcASfRZoI1iBdbNJ1bcTpjs3w1O85/k
         8PXa8BxfpjD8nVtmsjEBs59E/xIOLAH5I6igC2wKmnjPnQFSMQGah+u3luaN0/2Wof4u
         cbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006592; x=1726611392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5hvV7fm4k2lFXirrgZp/rTlQTvUf+N/hoDJJrlREps=;
        b=olo2dIr48JJCTZ/Y5U6kH2obaXR41R2WVi61DkeQzQcMF6jQwiQ20yJGkC1++YlgiJ
         C1iO3ZnCYzQgj063sftxrGbAE5bY3mH3yrrJSxYwIgYPs3OhqJzmAHKJAeKYjWsMOouk
         Wxj3Glomwp8lRHQ9NrR/zf15SxdWe6teyfpC2L00BV/aES1noobSd/K5DvJ2XGD7deJC
         2wrJFEWyRARC3hI3FWpbc3K+WxMJfZguDU6LmhQa8FD4V/30Cs6oTtALx2UD6N4CsD/5
         M4tMNR9Xu7SX+eor5ioT3mwOaqv3I5INLjyXkUxUeDSDwZSClEbzW4a8MoK8nhZFsvP+
         vddA==
X-Forwarded-Encrypted: i=1; AJvYcCWBWzn31mq/kR8bfzODicYIDxZs1giz5/V97wKBs5OU2nhLGMchz1eCrP92BXhuYYQX057V+NFp7DTHWA==@linaro.org
X-Gm-Message-State: AOJu0YzvkHRFex7f2kUNSJ7uiLoEj6Mal83q4cQA/Qy3AhLUNnMrhAtK
	25yayGEIKRpsJt3zAaGIgNN1nm8zL0nWrF0zs8BhuhldDI9fJ8cGnV7Mg+yNJdMkzg==
X-Google-Smtp-Source: AGHT+IHrtwn2gYefVYx/2/5eCHyu9r4kicYal1I+8TgQBE4ci3czTkRyYRsTQrsB0YAMlykwKK3uTQ==
X-Received: by 2002:a05:6a00:2d28:b0:704:151d:dcce with SMTP id d2e1a72fcca58-71907eb69b2mr7001325b3a.5.1726006591899;
        Tue, 10 Sep 2024 15:16:31 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:31 -0700 (PDT)
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
Subject: [PATCH 09/39] qobject: replace assert(0) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:36 -0700
Message-Id: <20240910221606.1817478-10-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bGZg8wLUPP+5

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 qobject/qlit.c | 2 +-
 qobject/qnum.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/qobject/qlit.c b/qobject/qlit.c
index be8332136c2..a62865b6423 100644
--- a/qobject/qlit.c
+++ b/qobject/qlit.c
@@ -118,7 +118,7 @@ QObject *qobject_from_qlit(const QLitObject *qlit)
     case QTYPE_QBOOL:
         return QOBJECT(qbool_from_bool(qlit->value.qbool));
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     return NULL;
diff --git a/qobject/qnum.c b/qobject/qnum.c
index 2bbeaedc7b4..2138b563a9f 100644
--- a/qobject/qnum.c
+++ b/qobject/qnum.c
@@ -85,7 +85,7 @@ bool qnum_get_try_int(const QNum *qn, int64_t *val)
         return false;
     }
 
-    assert(0);
+    g_assert_not_reached();
     return false;
 }
 
@@ -123,7 +123,7 @@ bool qnum_get_try_uint(const QNum *qn, uint64_t *val)
         return false;
     }
 
-    assert(0);
+    g_assert_not_reached();
     return false;
 }
 
@@ -156,7 +156,7 @@ double qnum_get_double(QNum *qn)
         return qn->u.dbl;
     }
 
-    assert(0);
+    g_assert_not_reached();
     return 0.0;
 }
 
@@ -172,7 +172,7 @@ char *qnum_to_string(QNum *qn)
         return g_strdup_printf("%.17g", qn->u.dbl);
     }
 
-    assert(0);
+    g_assert_not_reached();
     return NULL;
 }
 
-- 
2.39.2
