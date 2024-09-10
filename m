Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444464njb;
        Tue, 10 Sep 2024 15:16:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPZfwFCjUBUzogxGzxMN5acj1z6VNZ0HVgfF9mHkWIt0QYESQKcHOQRCGsahpVWR/NwaWw2XATEOdoDw==@linaro.org
X-Received: by 2002:a05:6a00:cc5:b0:714:160e:8f5f with SMTP id d2e1a72fcca58-718d5e17429mr20593805b3a.11.1726006599224;
        Tue, 10 Sep 2024 15:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006599; cv=none;
        d=google.com; s=arc-20160816;
        b=y9DGryna99Nq8nx7UcU1xVuCua4JZMyrQT9YcQMOYW9UvYSg3F34q4xs0YSCG0iBQt
         xl/3AcJe1VQ6tQbO0MmEGwATp0hRCaD7EKVxf5068uh0cWpDpaQt+oOJRRXCZsv6gWuZ
         cQ6oHamyUfIJC2EQArh7Ryga1MjBvOv/wxmjXZQW6k4hrzL9Ci1pnOz4SOaQg1hCDS5w
         VJsO35NjC66qi4cmUFAJ6h+/wI0OJm9rdxrZZ928HIBxEaL268JpXrisLaD/9rJaP7+V
         R87zoxlJhnHe7j0ob2Aeg4LJVNlSNDIXlPdapI+qYp/5y+3wFcUX7MjGaGZYyocFJQ4X
         am2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5e7jM2SGiugZIDj7hvcHvckpF7J0ao6gx5zsDNU5OmE=;
        fh=sAW7zu93bag5mGObXq3i79mp8+3pohFKuiPkCYlIvJA=;
        b=a3OiZvsGoMNFgQNVt8VN38VS+V2dALOyQSyr8/t6JStMf/qUGW3vHiUQ7IFZMD+/gN
         kadg5zBu+EuwIGseWEOgjzHWYkwwsCt/6CNsxk7aBubrutni4N81yfO96DUOP++v/Xfe
         H8QmADa9kWL/F1lG9ENicKU3g9bC6MrQgsSxkhpsOiftuk6c2Xr0jN3yx6Fuq2DJ7BxL
         qETWjygASDJ7EZfokOI1yHJ2K0jv9uanrDJcHiOXR14VFnh0TnZ0xzgsHVSsu/n54li2
         7h762G9nmKBic94quYKTmH4m4RL4bo0WMBUs88iP7ssWNOh+NIYSb06cWZAd14qRG7hQ
         TIdw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVurTjlM;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e5973b0asor3914729b3a.9.2024.09.10.15.16.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVurTjlM;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006599; x=1726611399; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e7jM2SGiugZIDj7hvcHvckpF7J0ao6gx5zsDNU5OmE=;
        b=OVurTjlMw0UlB5kwaune7tMOCoNYmdg1d4r33r/sWuc5tXWvClarbVlOHsDsNKZXHi
         g+wCoaK/GlNVlpkSTwReqGeEU6RYn+g5Ia0LtUXyS5IB36iw8vW68PR9SpWNRE2FtEJx
         Zs8xy3mTulFy5X5hAfldOQVhVy1HHPJCq0hgWeZLtaiqvQSqu00udoREHrNMTwu9P71K
         qw95B7y0P5VuniGDifNLlIHvscNBEmmrebBq1yl6o0pDzNkXL8m95jmwe1gUFPmlZqHu
         a6uchCWqzIJPXSlHxXnr+siEaYamKNHJCo9qwONJhkOqBVghsqto0SoN9/Y/XMh6zrMZ
         URuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006599; x=1726611399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5e7jM2SGiugZIDj7hvcHvckpF7J0ao6gx5zsDNU5OmE=;
        b=EgkekdrJ+bwhY1jinmnLMZXLJMX3AkE39D9WpNGqV54UFdvmDsgBHO2da+BxYK2TiG
         mvQAztqZS2PBPzFWlun0wnwZIr8eSIi/UsSUSz/fe5uU/r46FI+8Fc1vgYI00HY7Ktvt
         QJ35RIaSIzQHluSas8BDLp9KIM1cQj0VmwMXc0/e3YPFrBp82iI7ipu/qdU6rlRLLQwQ
         nVuR0VZtMD0ByoDZWEXPG3Ixgvtw0bu7pe1KMtNSGJWPYM3P+dwAuJ+IzqoxH4rVeYGS
         k6CvglQu81Lnua0NopcRmJYCDgGC2vCveEHN+ahKGBBtXjqb53ffBGHnRAVlw7UsauRM
         GdeA==
X-Forwarded-Encrypted: i=1; AJvYcCUelSHQ2PIz7pIGFdTVyZgLxpTWD+gygqzVwU21cN2yy0gfVD3uOC6S9QzEU4h1pA7Bhf8c8sU2nDJHvg==@linaro.org
X-Gm-Message-State: AOJu0YzJM+so/f4jwypfuJy+V+CnHOG6JqLzPZgLgkQSEA2O7NgrJMdY
	49gUn5QfhthYfxpOnYEL/VApX1noXNABzVQZ11C80ZejWAjNtU3lZPsniEpOD4eP/waoGD6v9yQ
	VxSEyRq+cOF4=
X-Google-Smtp-Source: AGHT+IGmTWAlHqohfvDcmF4lhCn4e0s9xwSiGMy/9LUB1RgrtDOx1fMalziLV42CXKlDan+123/d1Q==
X-Received: by 2002:a05:6a20:289e:b0:1cf:4348:d5c8 with SMTP id adf61e73a8af0-1cf5e157922mr2270616637.39.1726006598631;
        Tue, 10 Sep 2024 15:16:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:38 -0700 (PDT)
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
Subject: [PATCH 12/39] tests/qtest: replace assert(0) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:39 -0700
Message-Id: <20240910221606.1817478-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: nkvrpa86SpSQ

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
