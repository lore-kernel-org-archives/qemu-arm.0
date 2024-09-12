Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422585nji;
        Thu, 12 Sep 2024 00:40:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6JmvE4qrmmH94sS7MjjqHIyzjfy2UpFHMNncvQNv040fVG8dzxIAyxxOMZqUm/tQDesssqvOutVq4vw==@linaro.org
X-Received: by 2002:a05:6808:3088:b0:3da:e02f:eb8e with SMTP id 5614622812f47-3e071af6702mr1634647b6e.43.1726126800791;
        Thu, 12 Sep 2024 00:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126800; cv=none;
        d=google.com; s=arc-20160816;
        b=Ul8pZdpkY1IY+4og8nX/RYJRY+fquUCksz+OiQWmvQIeSlZB7XD8Y9SPhMO+DeToTi
         tSu+Mi0WE+wrfuYOpFQHbviBv3xYM10W1ilqFlD6/sAo2z03X/eThCwLgA+e+JjgPYo9
         8jw2wf72Gdud9k6mnCwC0F40+01iEmDTNVqI3Qjre2i+67G5xgbOAcpAQ7UPJ13cJmqY
         2LfUk+HxctR5fzN+00pdZOJ0tLsiR88X8R/s2leHxjT0e2egsFsOhMnjz6TeFpo8Tqs5
         9Cojh3beefdTgczQaSRluOqtBdgxXGsdOwN6PdK+5BR9iqMzNyFf25hnq+ydzRM64XrM
         7Imw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=F+rVp3/BLJYyjxO33P6GwzzAqjbQ85NDH2br5JtXUaQ=;
        fh=rJ+5i23V3FuzOYxeXxfvuNcGaKQWHE585Niyf0ETHRQ=;
        b=zoudNzXPysxFPoz91yzmFLb84HWJ/cUs9dTJdjuHmhhlALrEqBFOfVFXigi3SFvqKD
         FD+OCDfP0hierBSxnahVD9jxsPmWr0EhAKL3rmgfc++StYyfiocmD1SKt1G56Z7oozJl
         h6KL+OVcXFBr5d3z3bjxlsYYGDCvBWc13Yj8b2/d1Yb6TjO3n56cjkso1HY06J5jv4/E
         gZ0uIFaHXJKEDEr4mNW4Js3nIKgDlkcN2Mepr2g8yUFyCaiSE+5LvOL0/KcFIZBAjIxs
         kNuOwE2XYIrL7bKN4CPTlsUGRWkgKGQBpdGkTkqXw8GJN35UBBRl8x4Y9AqvCCoqgw4+
         cqgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l5Hnpehm;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 46e09a7af769-710d9dd160csor4007928a34.18.2024.09.12.00.40.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l5Hnpehm;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126800; x=1726731600; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+rVp3/BLJYyjxO33P6GwzzAqjbQ85NDH2br5JtXUaQ=;
        b=l5HnpehmT3fjFZE1fROrZmML4XpGeJjH9KOSM8tofADt7eNo6K3Anh+XIE5BNRQC7n
         WtNAxxdsHxqrr5i6gKIwnIkeQQdR326X7QMBGYIGdGylOfwSqn/D51ai65A3cz02Ezbi
         IfkTEFBkf5itvVfRJLiWnXN1ramYp44ek3eE0p7ndShWIcQdzFLPDJ0dEs6yBBJvzQ4E
         VD23utRxx0XQW53Cb1VNsFaxfBQLs9aiqmirf5DKpF8sV5GAgNlDmmpd1LSNQCYEmdkU
         zRrblXdvWe4SGPFcZck/wjuRWs/uR8qlhuQY/5UEbwOJuEw1HMCKcsCanWCs8k29RUfB
         yHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126800; x=1726731600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+rVp3/BLJYyjxO33P6GwzzAqjbQ85NDH2br5JtXUaQ=;
        b=Z00kyLwlt7OhFWtvAr3JpKu7mMgG8C2OZm+DVEhr1IsbN/e8R6Ioe6oLCwWKJzSN/T
         Ff3eUcl77Sms2E/xgS3BGDAhTxJ5tJNq8YQxegzCD/4n5v95G9vFy6dPAHBPh/Ac8a+V
         oIHhXCTWdutO9Y3CC/SmtQhIGr2daKYm4MLvEsv+jnEWeJTHXxe7M+nINtOW8hAPUpxT
         ajvYdtPZAAOEftKtyEYv754EdEJnKzOBCdW1gfKMEG8Alp1tvm5Lm/rE/w38MaL93uS3
         d2XXisewuIBUyt2Y0ZO1wYZqg4GgrEdgEBIhlU0j0TFkfT9Jo9I+5hjOtmcLpNxtOtW4
         KS1w==
X-Forwarded-Encrypted: i=1; AJvYcCVx3GBrgtdBHag4nVcAKajy6XgnYiGZ9WH+617xBQ8wbNs6NSVh06cTIqPD6NaKUKcoP6p/t/A6MW0jOw==@linaro.org
X-Gm-Message-State: AOJu0YzOTn5o3OWyMKCVYzT3Vyb3ivNvygoIfvsR2I+R4MIFk9m1Bz68
	5IdNbqLeU5M8gde6j0RLiWgiPhLtcu9S1icmwa0bB6mwh7mM7lXp0jq84y77j0i5vg==
X-Google-Smtp-Source: AGHT+IG6+n9GSh9VOQuGu9AiTjxnE8dPu+UEy8HMFEQWjdljbFKlQEVbTyzIuHmcncyWJBtD1Vjx6g==
X-Received: by 2002:a05:6830:4994:b0:710:b19a:cea3 with SMTP id 46e09a7af769-711094727c0mr2302235a34.13.1726126800291;
        Thu, 12 Sep 2024 00:40:00 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:39:59 -0700 (PDT)
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
Subject: [PATCH v2 13/48] tests/unit: replace assert(0) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:46 -0700
Message-Id: <20240912073921.453203-14-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: JKh9ezWQVWwc

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/unit/test-xs-node.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-xs-node.c b/tests/unit/test-xs-node.c
index ac94e7ed6c2..2f447a73fb8 100644
--- a/tests/unit/test-xs-node.c
+++ b/tests/unit/test-xs-node.c
@@ -212,7 +212,7 @@ static void compare_tx(gpointer key, gpointer val, gpointer opaque)
         printf("Comparison failure in TX %u after serdes:\n", tx_id);
         dump_ref("Original", t1->root, 0);
         dump_ref("Deserialised", t2->root, 0);
-        g_assert(0);
+        g_assert_not_reached();
     }
     g_assert(t1->nr_nodes == t2->nr_nodes);
 }
@@ -257,7 +257,7 @@ static void check_serdes(XenstoreImplState *s)
         printf("Comparison failure in main tree after serdes:\n");
         dump_ref("Original", s->root, 0);
         dump_ref("Deserialised", s2->root, 0);
-        g_assert(0);
+        g_assert_not_reached();
     }
 
     nr_transactions1 = g_hash_table_size(s->transactions);
-- 
2.39.2
