Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444348njb;
        Tue, 10 Sep 2024 15:16:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxBnraKXud/dHL6sJgpz9MX7L+M3GX1xX09E2QJT4omGfsazISNRPby/IZu+wFDIXnrAKjsXbv2AA1xw==@linaro.org
X-Received: by 2002:a05:6a00:1746:b0:70e:8e3a:10ee with SMTP id d2e1a72fcca58-718d5ee0415mr17699066b3a.21.1726006583051;
        Tue, 10 Sep 2024 15:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006583; cv=none;
        d=google.com; s=arc-20160816;
        b=xAJncKRl07wWOgJTf5PEsXtiJvq1aLi9FqiSWLiJHis0CK/2vNnVyUDbzOQ6ZCkclf
         GtuksPdXdmPxzLDH3/6d/YF2eqhyFJ65prrJSnlrLiZ3bER334VPejD6+y4wsAFZR9Ot
         Mc3oxTaCpWi7EeCX8PLsQsHwnPtx5/I/bD/k1baQXm3UpzHUx9odXsYYK4LGOsoCLm+A
         hFDpouPy//pxEJmOk8CC2Ndzjle0+7NyEN6HI3ejRn8VTB6CVanhQzbyld2219oFrQc5
         kj02Ky/G0aUaD51dPkn4V9yZh5WVlun8mJAOezVPEO/x6TreRnUNz7T/DCOyv498rmeR
         VDsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8E41vvCuzFfFnWNVteAbOukx+NZntvmSmJeEnMZhnio=;
        fh=VYqSdt1oPgK2KebJBm7IOawsk1fhAjoCSn5V48uUdYM=;
        b=upNsALZ/1uWPa3ygj6ifzW4E9IvibcpGtbvBoWSUxVmYyeVU/Ni5O3ZoolNezO/6tr
         e1+th5rugGD2NZlorvsM/y1c0hCSChjFAfThzg4Jmv0y4+N+pOueUmYCjAB6SQgWMlCU
         epkSqv3NIAwb+Jn9Gm1KC5x0kOwxv8tl4IS76EQBA1KbbpJSFlub9tO0qK5z3Vaj7Dh1
         zzTLX0F/84jqYw4ce6sUBO8gyXPD0pELgJIZi7CNln85wxM5xXCsSnM0b01jsPOL/FXv
         IPntNoB4dfHtXQs0QxykaJy6nVvCBG7sPZWmcE9uQP7LgzkDeGYaeYdJi6mVdTmwypWP
         J9Dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aN0eQyUC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58acb17sor4339881b3a.1.2024.09.10.15.16.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aN0eQyUC;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006582; x=1726611382; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8E41vvCuzFfFnWNVteAbOukx+NZntvmSmJeEnMZhnio=;
        b=aN0eQyUC1i7o0FesxseQ+On6/bJQH+8cfgoCYXkcA/ckjD4rNSYFj5DIdzD8Fq/ZX2
         x5HnPLWl2R3ifGVZaO6nKVJB8gGsZ3PCLPUs89M2rf2t4LWoQHED7mtMvTtnQO+UWKip
         yAmry+l9+wRLobnXIy8nB2OpdzpEOneSG9vvC/to86gip4VhmsAOtwRsLo2Scj0fCNcO
         6NQfLSMc9QvlL0Pvag+mAAS+MyMDKPp4eDLzPitE18nVKmwhfmCx+ZqPvx2EpuvnzYaW
         RIrWWF660IpLJAazaEe5Gg7+TOLoIMBuKYahqIM6dLmw1GoQNxc0V1Q3GqDKTzGAtgBi
         1Fbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006582; x=1726611382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8E41vvCuzFfFnWNVteAbOukx+NZntvmSmJeEnMZhnio=;
        b=jB6RzPjKRrrEJsM+bULBa9VUZgoGvbx+SvpDO+WKC3vvxJE6TtQeEJG/cMNXTz6iXA
         fGBe4Nc5D0PE5WpmOdpKV41HZoVK+xWsS3+bAD8mYa54yAo6pmddG6F9GQ5RYhYwhfzS
         IqHpZ40oxNZb1J1sdW7G228mO04p8z9WJLkXswbaNyGn/uV268jUa2wnCcgSLaqCEQgi
         2ClPEc+XvYsyxMYACYyGbViury8womAHw+2J3fdST5YqnVWZHs9KDX+FzY7BQMdoZB6v
         A2q4HZPEclmiKNseQHVzC/3x8QxoWY2vAQ2C8gkSmVbIC0Azgs2IEfl/I7++o3TJp3j3
         iuJA==
X-Forwarded-Encrypted: i=1; AJvYcCXMSPvFFX3eHffGIotCFMVQAMNbv9KGhLRDmPTQjJFLzkQ6lxwmN6dcDlWIDjlu7kVq8rKYnKVLHFyrxA==@linaro.org
X-Gm-Message-State: AOJu0Yyvf6bTLfuylboM4EZrW276c1/2IamYAwlEt1IKdBMMEOeCIpOR
	yxjTl/TF2k1xCKyk+BIODJmqZ8naDi9KStGV/beYVFcPkLFD6uF/q5mb2S9azy04Yg==
X-Google-Smtp-Source: AGHT+IEpm92TEZ7l/i72e03p8S1n7AWDI6NeOOFfrUtGzNn7Eo7pwNzB53KVkJOarI+xWw/0AjoAnw==
X-Received: by 2002:a05:6a00:218e:b0:717:9768:a4e7 with SMTP id d2e1a72fcca58-718d5ded0acmr15822990b3a.2.1726006582456;
        Tue, 10 Sep 2024 15:16:22 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:22 -0700 (PDT)
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
Subject: [PATCH 05/39] hw/core: replace assert(0) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:32 -0700
Message-Id: <20240910221606.1817478-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Nw87W14zC86N

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/core/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index f8ce332cfe9..14283293b42 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -380,7 +380,7 @@ void parse_numa_hmat_lb(NumaState *numa_state, NumaHmatLBOptions *node,
         }
         lb_data.data = node->bandwidth;
     } else {
-        assert(0);
+        g_assert_not_reached();
     }
 
     g_array_append_val(hmat_lb->list, lb_data);
-- 
2.39.2
