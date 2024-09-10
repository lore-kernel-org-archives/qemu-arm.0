Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444915njb;
        Tue, 10 Sep 2024 15:18:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVVgd7wzNS8JzbNUp+iYlHJgXCE6KK6dfKogenTfOTgHUU5R1dGcsFNbbZErx6ooTDHlUv8AsblixqgMg==@linaro.org
X-Received: by 2002:a05:6a00:1402:b0:714:3a4b:f78f with SMTP id d2e1a72fcca58-719171225c4mr973580b3a.20.1726006686743;
        Tue, 10 Sep 2024 15:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006686; cv=none;
        d=google.com; s=arc-20160816;
        b=agwkxmwAVlB1MNOGZGRRRQf6qTw/oDWr67iN/m/j0k/RmMnI0yD1nL9zt5+Zi+4mPL
         ntvNMkQQf2TbBmF5k7XSIZkg3Hh1WjlsYa4DR4DnFiXdmiNft15yRTzQITAxD3AdQj1y
         GhUKVII9DsoadZi1uPbbraO1lIIfEV/0xhT2blDi9l8dQKdDrQ3lWjXE47T2AjTzkvWr
         plDNW2w35OhPvw9hd17mo2M8aKOGkLDV9WoiXyQNpFdsXhjMhKU9+HEgAH/tFHdNkwy/
         ZmJoCTNWoB+SXNGt8kGvJ9RRhHg4BX/cpJ9lt3CZAi8JHGHX69Cy+uYzH9SBMMyPE405
         0zmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ilTWC8SUeBuQoT7BUDbD2Q85sEksALIaITVdH6ynhyQ=;
        fh=jZeOMUTUrzHWANwV+6wNiOZd3P4ncuQseH9/0xvdyFY=;
        b=Lb/wrM4nLPsfDW1d1bxSG1wnPvDdDpzhA6w8QyslrATdEsy4FVSEGHWvk9u4RF1R/6
         c2drwL2tajDDkmbvDcEZiXsuK2Ikxbrvxfxie/tZS/e5/RHdvlFlMIrTQdANmFzbIuKH
         Nc+3skH5rkCeJQe5JsXqiFCgoZ52DZpvZDQjYkpfklZN2CxkfPUV29oQCwuUx/3yzMLr
         RVP6zBvUVnjoOHI4dJFY9IunEHnYUdWNySHAj1N3MRuT1y5y735mGbC+tTs2TMxnjwt8
         6FBldwwe2gU7NWGlYSE2GIiECI0r0QoAKMRUXlu+lyvW0m1VuLgmAu1bx+TCZwJ8O5/h
         gxsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RLsIxGjN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58acd7asor4722754b3a.3.2024.09.10.15.18.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:18:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RLsIxGjN;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006686; x=1726611486; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilTWC8SUeBuQoT7BUDbD2Q85sEksALIaITVdH6ynhyQ=;
        b=RLsIxGjNeXdwvA3/F3Wjto5LXsZWO3byCjrLElvEJHznnvQXTNuhIqTX+YQdN2B+JP
         DXBNxZqwOeSad0HAmoEqWhkdg3RvpMgIHoqFcmGVOXh1aHi2v6ONP+AYFYEPHUI5r/vb
         TAkY7S9AkY/E4D2lDWhTq2zq7LDJ0H0pqTnk0BSrdSVrASR7VAdbbRpltx6phXADPXbx
         OjEz3StYfmytedPMLbBAPulur3iXkhn6S0GmWn+q1+sJKnUhPPtpPeFWRkXA7ml2OwWp
         7he5wEXeUwymdvTYo4ikiCbg8QpP5/j/UKCOwUUhUkZjePD4WZ54xtaaNL4Bcw056Nnq
         uPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006686; x=1726611486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilTWC8SUeBuQoT7BUDbD2Q85sEksALIaITVdH6ynhyQ=;
        b=JDgpDXTgAYxCHQykSh36G1yftshNH8xt+5aKHvShpyYmWkgwaJrU1xaZWbbLLodHON
         CTQbsAwvO/Q8jBFZdKxDxID8VC7P+0Keb9fbyTF18AQGGu+VYrHuPYVNO1I7pqWxnPqe
         OllIKtJPmfnNy5F6eSRW4pQljQP26Ha/w6uCSPwB091ZW7RYz+8cY5fQHaEDjw491/Ag
         bqsfbW8P/qCZwXv3dGBzNt5Z5zYhKIBBaEst8edaRReUXVPZTKhSUbzEzzttyEjtG+te
         zRBBF1ao9JhTVRMe4rmFTU6buq285f0n+RyyClRj3xjIrOVetHiE72WcqXZYz9g0VZXO
         9KOA==
X-Forwarded-Encrypted: i=1; AJvYcCXAGk2R1b07H5McRmWx6ScINAS/WrqZ8jgtafEoqh98J7E7SgGxYAEwSxeLKryMR5972jbMB83/no8zhQ==@linaro.org
X-Gm-Message-State: AOJu0YxYyv2iNflOsKgnFXuc+PeIoqFPIpcNXdSwh6QaPbd0EMZ29/b/
	L9VKJcxzwh/FuuVriyXvozUlkkgnJRPhlLqM/TsILtw9x6bRZHbAvLXrptaukuO0Ig==
X-Google-Smtp-Source: AGHT+IFCrp/2O2fWq/sOFJdW2m0YIC6PP34v266qfmkWHzxnSrAINIAZCxBzCzEo5+wVOk3yz3M+wg==
X-Received: by 2002:a05:6a00:1799:b0:706:5dab:83c4 with SMTP id d2e1a72fcca58-71916e7d1bdmr1330581b3a.14.1726006686207;
        Tue, 10 Sep 2024 15:18:06 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:18:05 -0700 (PDT)
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
Subject: [PATCH 36/39] ui: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:16:03 -0700
Message-Id: <20240910221606.1817478-37-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: T9up8q5QqWNQ

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 ui/qemu-pixman.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ui/qemu-pixman.c b/ui/qemu-pixman.c
index 5ca55dd1998..6cada8b45e1 100644
--- a/ui/qemu-pixman.c
+++ b/ui/qemu-pixman.c
@@ -49,7 +49,6 @@ PixelFormat qemu_pixelformat_from_pixman(pixman_format_code_t format)
         break;
     default:
         g_assert_not_reached();
-        break;
     }
 
     pf.amax = (1 << pf.abits) - 1;
-- 
2.39.2
