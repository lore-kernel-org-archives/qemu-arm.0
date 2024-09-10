Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444611njb;
        Tue, 10 Sep 2024 15:17:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyml/SWBuYZC6T6JNla0Co/60wUvnmvmYH0UgjFmKZG1Ozqx372Ag5DlNXuMn2ITLUQz0DdqbcOyhBgw==@linaro.org
X-Received: by 2002:a05:6a21:6f01:b0:1cf:23cb:b927 with SMTP id adf61e73a8af0-1cf5e1578e0mr2650199637.34.1726006627603;
        Tue, 10 Sep 2024 15:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006627; cv=none;
        d=google.com; s=arc-20160816;
        b=oWud66IG/6bGmo2sFRQV4lxXlU/hQDdpGNePaTJwvAF4TDH+Y1JnonimNUXJmhePzd
         G/r77pBeL3QFVug5eG5laIpiMVOgiYVHWCP62ZQIc1eAyagqAaKYNbmLGHIsrDFDPgQ9
         6v3PK3wUa6xyJhTWVyuQivS0U72bfj0QewGKOZCM+dtBMZxTw+M993EXBKYUi4B9n+Q6
         XT+eN8YexxC4NWeKdHU7PEGWdI+XkyLZnCe9UmYNBxLkH83zA+aXT2mb7N5kA//QjZ45
         NIp1B6CmQccGt9CfcmxfmksfaJCkGqSQvTEktzq8r6Mc3xdtrvXZphYburMd+PEdAgfI
         96Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PMAzhundz5cnlhXkr4isErmBbfbpq/QVHnsSNQckDH4=;
        fh=NE1xUtEcA/L/I+hQ0WaTktlAiZg/FtFSm+VoBHqAtnQ=;
        b=GysGCoou5dOc9JTlvY/BwcQdcRrnjew+aufxizqyU56HoFhy1dGv9Wl8xmUl+gHcm6
         2tyfCXw1DJ/ZDi4ZqFz396e0PP5o3ZTvVX/UQfimRpcSYswBhCMhEuvvVKBI3Xbv0lf8
         waX41ba6FgkSHB1qMunvMI3xzuWwn6oE9X0X7sw9mp8JzkXdKnnwh/4rL29BtxiGaR6B
         1qx9P7+2UzjOJzAMnJbwQOrDhiIjg9WMjSaADLXxP3HHuCoOs+ynvxlfZzohwjSJXe8M
         Dorj3kC+4U+AWhvAaMI9YM8IOKizvuHpfi7t9GDWILKDWQDbsx+qW4rAHn9Bu1h8ikO2
         m7Ww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NPxS0WCj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58ac608sor4267153b3a.3.2024.09.10.15.17.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:17:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NPxS0WCj;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006627; x=1726611427; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMAzhundz5cnlhXkr4isErmBbfbpq/QVHnsSNQckDH4=;
        b=NPxS0WCjwhSvIHBt+ArbU18mXiZ0MtHWDUqYm1pF0EqfbK82qYPB+1POGwIorsNci9
         IVTzSqwDS6mh2hRJFK/VqjVAwHnMi2iW0kB7BHZ7ATu+AGZvPWLeX216dADHMFdJ7yFX
         ao+ECaMeZBDQJL0mivBZaUq5V1g4TAlyM8YZEWP04NJxLDsAvz0+wuL9ef+m7ix87SBo
         GyggV0RiYh+dfHerMyc6j6c4se0VuEoNCT/ax5ZZ8/A5tX1a9PH480Zb+UJ9OMZBDe+a
         owQ1kf9HlI6MqDnd7S6STXz5O250OZZI2eFi8FD0ktzFQP6QWoDLg6jYkvUN7r3sHVgm
         zlog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006627; x=1726611427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PMAzhundz5cnlhXkr4isErmBbfbpq/QVHnsSNQckDH4=;
        b=ZL8mqLLhxjJh7Lu7h+RUbjrJ4WiO4/bbYFGQeWqTW5iKp1Ww8R/7uT68gNFDUyeGYd
         sUfJfeTbDL+Z0E5sQuJt7UahyrDV4fX5AbpVseCnxghE+FlxlWHYSPJ8toDRcmc2sYum
         z4SYU2f8O2LovS4OhOzhq+kfKaPvezKc1Co2UhVww0OII/LFMZqrGJoABlBd3K2mx8KH
         e+7pIRuTSmLlS2nPnRab851vj9HPOljIVaGdDymxWCaq2U+rDjXQ8IDkoKwRPF7BzxBP
         t/X+qOMwlc0DLmtPUg7sXddjzO3ircsnvz7T1fn54Vg+1dfxxqwBcU/jEndUa1iNVWlx
         azzA==
X-Forwarded-Encrypted: i=1; AJvYcCU6UPHacPpXDFeI5wtPCEc+t0xmzi2ZejmzCShqId2Fn57r03D81SBRnnVTZ1ujRoelyWZ+Hr2VI0UnxQ==@linaro.org
X-Gm-Message-State: AOJu0YzZd5e4IfIAF90AMih1fMXAtnp/B1rcNXm3uhI7VRPLWxer+lDc
	TbzQi39Dob9Bz2JISoa5l8gsJd3qfmMd2pyTyLLrJx8/x0CS8O6kfBAXG7kk6zVtaw==
X-Google-Smtp-Source: AGHT+IEi5JaA4MkES+9U+PpXOPIvBZ+R7wRmXVH+oG4VWiCcruy8sEZ0nEXAobw17ZrGyKMKj2WwFA==
X-Received: by 2002:a05:6a21:3a48:b0:1cf:20a7:ec65 with SMTP id adf61e73a8af0-1cf5e19cebbmr2662324637.49.1726006627163;
        Tue, 10 Sep 2024 15:17:07 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:17:06 -0700 (PDT)
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
Subject: [PATCH 24/39] accel/tcg: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:51 -0700
Message-Id: <20240910221606.1817478-25-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ObHbGWtXLRJb

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 accel/tcg/plugin-gen.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
index ec89a085b43..2ee4c22befd 100644
--- a/accel/tcg/plugin-gen.c
+++ b/accel/tcg/plugin-gen.c
@@ -251,7 +251,6 @@ static void inject_mem_cb(struct qemu_plugin_dyn_cb *cb,
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 }
 
-- 
2.39.2
