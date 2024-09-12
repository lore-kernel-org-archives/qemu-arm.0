Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422577nji;
        Thu, 12 Sep 2024 00:39:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXkIkKZlvD8H5iul51cfFROpENHgcnCjx1bw+5A9mDDVuKCzf5VRG4mhSD+KjOTVQ21tAqxKrcG1mEkhw==@linaro.org
X-Received: by 2002:a05:6830:6e01:b0:710:e987:253f with SMTP id 46e09a7af769-7110948cef8mr1783642a34.11.1726126798325;
        Thu, 12 Sep 2024 00:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126798; cv=none;
        d=google.com; s=arc-20160816;
        b=jpWEQV2iJvT0zSYexJAq83gx0HIvRrnaj75HV/KVEqozzk8epyymweDbZ+6MuHucSQ
         WBJ9e9WBgSIMtOmKSp9o7sE+MXwCwQ+Pid8Od5uRoJBGxeuLYJzF2H/9Zzb07tXVeuI9
         o1hlg67amBVgFdm0WHDCDZUzT1tq29gOJmFJShFhHh22CIXSFefpwbRXbUaW4u7ogyfL
         Yl944Mo6kxzvD2aDJAGT5ipxF+yQ37lay2t7glft2/512A8NBANm+8tdE3FuDui1EYKd
         iKR/u95LqMkYoagk3Curs9GE6GEC7HbiFyxKZbDKn+voPyJA7gKn9ctgbxxbx8KgAO2x
         d4ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/E70KJJTPx2V75BYTTVlugDcxiGJ3PzFoLEiBX1aDhc=;
        fh=7+nZMpDz4nfSsH/cjjOPbSkcY3pRAPDGzSBTacPblQw=;
        b=EF8b2Q/Ad72PJI3iY1UDg0dIDKLdA5z7nc0+7/8N8t8yuTRV6iYt31y4CCoBH3Lj5p
         PCeKSgTZPPOTgOfJmPaTkfy3EG7CuEsszpbXAOEGuqLOnWqVy/jn8qxiJVjl8zRRgNvb
         ajuMj1F7A+HLbTBeRZ6uLDSaCbAm8FfVrkJ6eErYzQYcTkrlymwLWRMMcWRVtIf9q7mx
         YqDaxSzbMyRBPyQ92z3AntaLxF9Vn9NNefsjpYiqCUQ42t2g/SeT8R3DTEuzFnUZHM/n
         TYYXFuUfx+qFN7sgP0PSUmYhfSBqKC01DNhUWFxewqJGP7j1QRXJBoQwWoF5iPwPrPHu
         PzsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d43eBhVD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-710d9dd15e7sor4538296a34.18.2024.09.12.00.39.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:39:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d43eBhVD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126798; x=1726731598; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/E70KJJTPx2V75BYTTVlugDcxiGJ3PzFoLEiBX1aDhc=;
        b=d43eBhVDfEnuEeWbd4VTmherqNMxzB/B5GCYN+FSi3NF0TDhkuOHscdlQYroji0NTE
         Cwa45eFUdpwC1An+eBMW4WEC/Mp3yBO7kpirvZMDRUPkPEKqM9/Z2mEtZZyN3Okq0ZNM
         xuwL57SW03Lz7OWc7PdmhLPkfbss8XN92ZHqGVrWhZNdK33a2JApggcsd3iCYOSTH3/w
         k05g0seY+zFycuYoi8u997elEy1/Fj4uJycK3etBZLs9TMFHQUL+GLSxY5mtRDcyzbNw
         qSB9txUB9+lIRz3cbELE8idURz6MV+LoTLPx0i9bJuGmgjksnMe4oVT8/Bc6HWwMTDt5
         fwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126798; x=1726731598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/E70KJJTPx2V75BYTTVlugDcxiGJ3PzFoLEiBX1aDhc=;
        b=BeH1Nfzx7ibCbTFVmNTS/8VFftdw3btushLoFZ8niopYer92qOswSqRjKijpofM0St
         BqwaEM8KNfAAAytX7qxdKYBgKiCpDVg+hSeoXz3T0J824ynTcYEe4i7DzLORak8RFUbt
         xz6harm63lDPNwqKu8ZLhTMBZGd7ysGUUiRAU5Uqi6d8eTWhaCUw5sFL73NiOUFLOWj8
         zLOEVew/wCXA5LmrAGkmoBbTsbT9QFVINdsVUCM+bbcjIBlh6p63c43KvDKNHzekstNo
         2iioVmHlWczOvlsZSr63+iUlVjj8kxLf3TFRTUYiDdZKgyJlWcxPaQHoBFRg9hLvvITq
         cUbA==
X-Forwarded-Encrypted: i=1; AJvYcCWgiaEOWA9wPjWeXqAQoro8kM93LI3J9y8KcatYeYWX578K+etVHrViCfO/MEjipeHFN+5AKWZynGcDPQ==@linaro.org
X-Gm-Message-State: AOJu0Yw/a8TQZ5FVihFlyyIpXAVAJnooPX3tYCgVGVtX6fjAPrSrbcIZ
	td+MjaVpwJota1fhJLMNsBOqT8AapIUkereIcmweJLvDmMy1DHvsfD7cyMnQOOIutyI2mPn9SqP
	HUuMTxdfkVRM=
X-Google-Smtp-Source: AGHT+IG5ne8GTfzcAIBppwGJ8l4Yooy0KY6YC3wG/455mCNEr6eNEp84R9bb0cy5D5sMvEwevLyaeg==
X-Received: by 2002:a05:6830:d02:b0:710:bffc:a28e with SMTP id 46e09a7af769-7110949a084mr1707232a34.19.1726126797795;
        Thu, 12 Sep 2024 00:39:57 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:39:57 -0700 (PDT)
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
Subject: [PATCH v2 12/48] tests/qtest: replace assert(0) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:45 -0700
Message-Id: <20240912073921.453203-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: jasdTnYWN70L

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/qtest/ipmi-bt-test.c  | 2 +-
 tests/qtest/ipmi-kcs-test.c | 4 ++--
 tests/qtest/rtl8139-test.c  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/ipmi-bt-test.c b/tests/qtest/ipmi-bt-test.c
index 383239bcd48..13f7c841f59 100644
--- a/tests/qtest/ipmi-bt-test.c
+++ b/tests/qtest/ipmi-bt-test.c
@@ -251,7 +251,7 @@ static void emu_msg_handler(void)
         msg[msg_len++] = 0xa0;
         write_emu_msg(msg, msg_len);
     } else {
-        g_assert(0);
+        g_assert_not_reached();
     }
 }
 
diff --git a/tests/qtest/ipmi-kcs-test.c b/tests/qtest/ipmi-kcs-test.c
index afc24dd3e46..3186c6ad64b 100644
--- a/tests/qtest/ipmi-kcs-test.c
+++ b/tests/qtest/ipmi-kcs-test.c
@@ -145,7 +145,7 @@ static void kcs_cmd(uint8_t *cmd, unsigned int cmd_len,
         break;
 
     default:
-        g_assert(0);
+        g_assert_not_reached();
     }
     *rsp_len = j;
 }
@@ -184,7 +184,7 @@ static void kcs_abort(uint8_t *cmd, unsigned int cmd_len,
         break;
 
     default:
-        g_assert(0);
+        g_assert_not_reached();
     }
 
     /* Start the abort here */
diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c
index eedf90f65af..55f671f2f59 100644
--- a/tests/qtest/rtl8139-test.c
+++ b/tests/qtest/rtl8139-test.c
@@ -65,7 +65,7 @@ PORT(IntrMask, w, 0x3c)
 PORT(IntrStatus, w, 0x3E)
 PORT(TimerInt, l, 0x54)
 
-#define fatal(...) do { g_test_message(__VA_ARGS__); g_assert(0); } while (0)
+#define fatal(...) do { g_test_message(__VA_ARGS__); g_assert_not_reached(); } while (0)
 
 static void test_timer(void)
 {
-- 
2.39.2
