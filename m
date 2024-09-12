Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422788nji;
        Thu, 12 Sep 2024 00:40:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXsfJUdR7Ywa2bYhUlfp8nYyjQfqQtHc5BK/vqrxdvnIqDTuvUc7WhZ8KcsQSo8EARIaTdJxuH4tZBCaA==@linaro.org
X-Received: by 2002:a05:6808:1791:b0:3e0:467e:f189 with SMTP id 5614622812f47-3e071aab6afmr1680257b6e.24.1726126843148;
        Thu, 12 Sep 2024 00:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126843; cv=none;
        d=google.com; s=arc-20160816;
        b=YToq/3UfBL5wYo1W0eGl9PAtZ7XIHOBkQMdCNiC85VUpINOH6MgQ8En+Eg1sFFnpex
         9ElNtcRE5iH5Wdv3Nl7eglH1jJHfc9hzC9zRlJr+GkvwHlGfsz5BcxsdjhucmCZJRxCv
         nwRmPpuKo7prsW6UZ+S72S25uWxDZA3h/TDsiSl/9xrM+U0QSyqk5hbHKNH7ffIWv9jU
         JBGpf2MysaHwatNc6fDCLTyxp5SJ+ISh6aPd9n/eoFRhE0lHk6gPvk503n+c9/p/XZev
         eqZkMraBBd7zKaLtyHliakCsGJaolJ/NppYGjNwwU2ofSCwl5MoowZyYpgaYE9ysI3I0
         mBhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MrI0OydCanDe4oYc5C9zQMsS9yO07eCq04VfB2/4Bq4=;
        fh=SUiro8fEqwrr5v/8LlOe1tfC1iUASsoZAsPVY/Sl3Ug=;
        b=fgRflT3dD8grZSEf/5g2oZyJO/RCkCpiNSpZt8rkFdNENGxpEfrvqgThvlgnYSTUY2
         dYnvnJ3wu8S+F3hnfeg1YUjOmoXXR5gdp1B1RJDlDKJ/6Ue5YTOBwccMZCE9bdwJx4Zq
         cfolCfvdVqao8K98czJWx3UoQwFmlOkeRwt+7H5LbWgsi4Ii7UgzuJGMOi3NVVE2enT2
         lcqU+n3kyW6Z+sV08d2QwU8LJRV5qzFB4TMc3sv6KeclFRDEG4YGKOcr1Pe1tUssO6S4
         yJZz6mppu+zBVtD3BiG1qLPm2KuKFtvgIlLa4jzFTRiRZDmAwkP+STqjM3AkDFF2JLyb
         9ksQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A12T9kBr;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3e03993b337sor3553272b6e.7.2024.09.12.00.40.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A12T9kBr;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126843; x=1726731643; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrI0OydCanDe4oYc5C9zQMsS9yO07eCq04VfB2/4Bq4=;
        b=A12T9kBr/1+2dLh9U74jQW2OBCwCp55ao4bSMjXKPvBuRTPZ2+txvkH9sYlequRIvw
         TGCv/xTeiGCLwlP9xvtxdMwboTPt5JwpMiLc08zVZx4eWPegS6/lT48I9uILcMyT+ZqA
         xeDBKFc2wiZrFQAssp0K+65JqrJXGe2IikF4D9dHNXy4TdmAjCv1iI3Ghsy/KpRgmmJU
         KTUy0rJssc4vPegi5zLhF1VMwtTg3GMvAPNfCY5VcH3wIJj7Vdz1ISwGxNt4+ur/53Et
         UKek2qoYOXV6eVbuhRieUpFm1YWCzoLFnTZKwQ4kuAhgV/gIcskZu6ufyl4TVWnouKGT
         ZjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126843; x=1726731643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrI0OydCanDe4oYc5C9zQMsS9yO07eCq04VfB2/4Bq4=;
        b=Z2OPGWqY6Lc1hLs7nPudP7nU3whCpMox5RjRG0LsvyC3/cwEkehpoywB7/qkINPlqa
         lRqbpBHxsmFITp3IAbnm9PnSvV6aZRo65TxdBVEZLaW/xo5RgpBMmynpyaznglw9pZX/
         vzCHif0mZanMi+Zs4xB4zGYhdD3Io2wGwP4fBQzgfMB8yFVfMK7A11nqkcj9Ng89DI4g
         CNp276XLnDXOlrkiGq/vzU9APQjq5euvpmF1yQudfbFnSgwTnoCTcq+JbTazTboS5rkC
         E9jK1LJN3kqfNKzngu0zggzb6vXo6AM9ZTJQn70yGarVbl0+V3Xs8Z7s3l0tkCWPA967
         zu1A==
X-Forwarded-Encrypted: i=1; AJvYcCXidZbYQHUzQRxjfNy/8PBg8uJHnH3ShNrvlqHXh/o4jMiaCAYoYzQqTplQBCGgN6y6sZT8h1eYsFntRQ==@linaro.org
X-Gm-Message-State: AOJu0Yy5WB1izb8rvYwEWEy7oGMEE2TGu+HIoQP/v01X3Yw3O+cnOVTj
	kuh/WOoIcnVbKIS+OR4H/LUI8bok2bDUgb9mUc+BmHkzoJFM5eJfEPXQch///ihwlg==
X-Google-Smtp-Source: AGHT+IEML6r9h3ccLEXSox/u2udrMxmikArR/M0ZN/wJcIkH+O7ao0M/eUBiNS4fvB7hhlhdN9XfxQ==
X-Received: by 2002:a05:6808:1594:b0:3d9:27f5:5251 with SMTP id 5614622812f47-3e071a852a7mr1675735b6e.5.1726126842725;
        Thu, 12 Sep 2024 00:40:42 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:42 -0700 (PDT)
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
Subject: [PATCH v2 29/48] hw/net: remove break after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:02 -0700
Message-Id: <20240912073921.453203-30-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: f/go9bnlQhUG

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/net/net_rx_pkt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index 6b9c4c9559d..0ea87344745 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -376,7 +376,6 @@ net_rx_pkt_calc_rss_hash(struct NetRxPkt *pkt,
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 
     net_toeplitz_key_init(&key_data, key);
-- 
2.39.2
