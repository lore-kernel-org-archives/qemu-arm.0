Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444305njb;
        Tue, 10 Sep 2024 15:16:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcCtEHutbNfyjd0zZl63iiDbCjobwXEVmd8tFgp24zjYn8JYdqi6QbxHkdlKIYUDosM66hlsU2/RmMCQ==@linaro.org
X-Received: by 2002:a05:6a00:4f8d:b0:717:d4e3:df1a with SMTP id d2e1a72fcca58-718d5e194fdmr15757707b3a.9.1726006573362;
        Tue, 10 Sep 2024 15:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006573; cv=none;
        d=google.com; s=arc-20160816;
        b=zw2B85i+zi15VnMbA067h8AeB4IBC0MXysISfHloqtw9hC6s+7fVpph4bvceBlJ30J
         Tca/HOoNyuEqNEJZwxeNVZiiVfhsCxeP5rsE5trihUOQNxOHzSJatU4wn99wJhei0vk8
         zIkuLYdc3mocG2kaEcjlTsH/8K3arQ6J+54tcBOeNBKCAMw6e0sw3cbmDDzDLV3bidFG
         Viwg+pDAfsowXb+EtNHArfTZn9Kob6D8c+UYEZ2MJ08THdxsSlzER36HZ071l5gtX9H6
         DU9L/+9s4QvqGUr5NuUjNjkmx4Wbj730yOOwUqRR3qRxliTO3Knjfh1LL9VNIriEamhz
         xchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CeSGQFthD+JPD1wVuC9PwgsK3RUFyGiI0SGu9xd9Ivo=;
        fh=qoXtLiWzchIBriyeMuenSLWqm3VvkJpZM6YQh2rAzUc=;
        b=KrlqZYEUaDzaQ1IcVMu0N6l9wtS0bhwHCjwVsg/Gn4RWLQpTG5L+Dwr4yQ+YeaIQiY
         r9bLjvd0eqGE0ryCAgyswHMD+xdjddK+Bu1Il8n41U8K3U6kGX3XUk3nF8zZs0gLiiFz
         NZe79MYIRjEJmmziAmsFjtraS67c+NBf8B2c0Ogtrmh2HVbTOfr2dONO4LYH4oDDs3B5
         J/vVdpN4MClZPpP0gfv74vhUULHfdiEbsapjklGYI9Rys5aMwJzX/PLs839R48OUGjjR
         +JeiWnDi1xNrYjQ1j3wnGJHB31GZUpNQNi66BEGByRIbYv4RCMoklQgmEm9HDJV2AOxK
         t+mg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j45Sv1MR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58a38d8sor3781573b3a.1.2024.09.10.15.16.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j45Sv1MR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006573; x=1726611373; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeSGQFthD+JPD1wVuC9PwgsK3RUFyGiI0SGu9xd9Ivo=;
        b=j45Sv1MRMSPR3/OITPhqt4kL7BuuTYokRpguuSsFis/5BwlslbGAwtspmCoIsV4kmc
         QtSdhy2muqQ3ImzhagX/9u80xtl4be4CzDiPya4pmf6rtWRNNnwl61GvhcLMhiqdXYA4
         MygSMWA6x9axgTFpJsWMtndjsvVeipuDQIUwplIS4b7ciBiWve6oFPGTcD/aEolMU/+h
         Fk3rfg2dpkd5l3VwjL+UEEZ/ldDzPUXnVLuX9VAmj5SeaqQ86QZZGEwkScmS1YPX9ldT
         LvtchXTQbncfdXUyul091+bl+tuwC5uejqzb3r+PCAIWX3dxebvro8ktr1Mg0KbVvIE0
         7dzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006573; x=1726611373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeSGQFthD+JPD1wVuC9PwgsK3RUFyGiI0SGu9xd9Ivo=;
        b=aruTt3ehVJlRWfK8tYmsiiAMM7Mvzcr2qa8pcuhBd61T4sOiwB1iAp66r+dmwSjocg
         Xnw9eEmC4mAFf00fNn9RT+C7rFEWsDQKoeyFFeR+2zwFtNAch87n9lJGCFQNGvD2EpBV
         aWJUy+2H2f9GfVLGWQfaSiY98kukA752JLaE05MVsCzQccTHlF6lVRF0xPCkuE09ibZQ
         3r/0VzHMzXxdhyc6rZMHGVPmteVAZ7BzAbIO1nbMERcozIvCkGuuMCoZJMoP+z/Q4Jw1
         ZjlIYWPoFiBFwP98ubOK7Oeu9rfPBUNA0lwUIHLGKFu3Cyps+uAzGWHo64BQNZ5slFfk
         QTIg==
X-Forwarded-Encrypted: i=1; AJvYcCXg23GuyeIVqSr9W2Wz3hYUyoW1+YQx8UgW14eUpBPmnQYaZdqClWaOGvQq+ZRWKIpqGJHHaQVPE27ihw==@linaro.org
X-Gm-Message-State: AOJu0Yy2nw3kz8UalQ74q4+Vat3WtUIe6120YWaAqmsnf/TSogVtQaxl
	1UimPdq1niLMwM+RjCweziDnGldLgQtkST3JLNEDmGDGjHAPEXWlDyhR7OFGCNsEtA==
X-Google-Smtp-Source: AGHT+IE7453ZnoDagMTvxw086SwFz1gaHnvHw1jrau87eetjbI39fjMwGBgCRYADVfAcbJ/ECITkzQ==
X-Received: by 2002:a05:6a20:c703:b0:1cf:590f:ddbc with SMTP id adf61e73a8af0-1cf5e0b7845mr3064462637.18.1726006572754;
        Tue, 10 Sep 2024 15:16:12 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:12 -0700 (PDT)
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
Subject: [PATCH 01/39] docs/spin: replace assert(0) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:28 -0700
Message-Id: <20240910221606.1817478-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 1syoQDqAI5aK

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
