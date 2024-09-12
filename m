Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422599nji;
        Thu, 12 Sep 2024 00:40:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjgOwg1V1PThbYF6TcLOmrnYPGNRM7oXmmL7k3SNVh4rkP3KstvE+x2UJ+Kz7RRJqmW/uH4Ra/aTXFVQ==@linaro.org
X-Received: by 2002:a05:6a20:c799:b0:1cf:53fc:cfec with SMTP id adf61e73a8af0-1cf75ee48a8mr2956563637.12.1726126803458;
        Thu, 12 Sep 2024 00:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126803; cv=none;
        d=google.com; s=arc-20160816;
        b=knEkS8UuRg/mfH6+KzP0pJ8Kj0DkD4+f7BFdPdNqEZ2PD2/tFBw+IZ5KxzsBYQsXMK
         sTFFICtaIcOkiJcT/FQGV2zvaqnGTRjMugfpbLX5LVAPsCYZl1dLR/vo1ydl4u1E/POr
         skrIFfqlbzd0OEpYniXn7bnJatKU9AHg/ku2/9HyxRkXkFEFiIkBNYB96N9x5oECvZvV
         pG6PULEk2v/DpC52OKZDfD4rMThT6ETuOXv05ulCaI6mnWNzH42YAp0YHney/AiAeplh
         Patin4Qu6dwtwZEdJakG7c89x8Eu51OaI65OmKdabHjrJygwMPPHKJoqvpwibIMsy/TH
         td/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cfrMTIgk5Q+XEJO7A3FTmtoXD8cfHvhd3vsooDA9mV4=;
        fh=N2pm/GCWXgAdhuX9lhWONPoqHekDcOP7tYtCXEXIOyQ=;
        b=dYLXKqDRCZlk9DX6C5rJc8txeaqoYjUXC9f4xGncwcREZHH/DTgBqJ4lafqNvNxS/5
         VHQ5160KfGbo/eDICtAOkf5DESklqnNFl453pQnmRkucTUwQRWaD0R16zxGyN0XbYa6H
         oGZgLtA1YeQeq3azNjk0UNp1V3wv5kShMIbHEzzfD7pUrux87BjpxQu8K8L8CinS9SjF
         aEzl3a2Vng/kx6d3/izj96Kdxjvd+R4/XYCpBtOb8b9sGtE1JczkDYulCQpQ7/93ViEI
         knwNT0WnQa09l9rwsGwq/7IVixe2Sh+aOw5UZWRd1qwBXarnUNhKxgMem5gq71+yzwDc
         nZ5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iS4B0fWP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e58a9288sor9357929b3a.1.2024.09.12.00.40.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iS4B0fWP;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126803; x=1726731603; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfrMTIgk5Q+XEJO7A3FTmtoXD8cfHvhd3vsooDA9mV4=;
        b=iS4B0fWPeP/hxj4cdTrijuJaQXf8UehuAYfwt5a0UtWorthU+d1VFd6xP3i+f6c+F8
         5Nk+hl282hYRxJNb+5/zOkmWgpzHW7fIT+YYBoPjW5u82qSH46ZV3Mqp2rD6sZTFqdSf
         Fi8qsKPbXRARNxQh5UPq3SSxSwB6JAdHF1D9sqSwlrAaVKPCcnEokJtYVT+iGR9PYCNe
         NTbwL9dS7d/rU6ywujGpZGlfH5lukXgJmoTKisZIzOpxsAVXobFofa3Wapy5eKfPxNMD
         BDrUwDtiBrYzVNtj1cd3v4K99reQGqa6Jm1UcTWz+sCg8DgByjI++8btIopIK2UF5LQl
         ia0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126803; x=1726731603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfrMTIgk5Q+XEJO7A3FTmtoXD8cfHvhd3vsooDA9mV4=;
        b=a8NZKJM3EbtalLs5VsYM4XkVyvrwNaWX5VPGZEMCFzChngyqM00jANicWWSKRPQLwQ
         GzD85/HuLCTG5NdEoPZzen+CFrBFr8vM+AOLKOPQ8IK4pDiDedBHPxmveA3MfXqGKv7v
         WWgUCdLqsFoQ6XqO7NvRPqzzBpbZe7eIigSBdgQm2jInFVQfojtHwFRTETdUTHdUhEWx
         zxE+xzAEUcuA1lxQ1jiVYMAfu9g8K3g3c0wRn4PqHrs7Vr5jiesuSQUVRhK2w1NuuktZ
         5w5mMQbzZoN+Q14GKxbOX+q3RQ9iUivIvcXhed6zDLCsfP4dcnF0HhSZ3cOdmKG7QphA
         VAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+EnYipnIMXraB1t2Df+X1Ge7yb/zNGKAJfX8Lh69z57HKxq09gSzCMYtE3t7NK9U4ZVpvK/Y4BcZk+w==@linaro.org
X-Gm-Message-State: AOJu0YypqZaRG/GLlkzN16FbfuFS2G733nX7JB28XFvcVdh43kPJNvc5
	7hoq9LgV7Dk8AcDeyFTz85c3zGu2FoVJrIQKBeporGVVo174QD71ud8Z+MVN/YiTHw==
X-Google-Smtp-Source: AGHT+IHWOaE7dY6tBiE9Ghckw7hSP0fZD+0ZwcWT4soLCd5pY4NREymaum+9biUNdbtqFJkCdDcI4A==
X-Received: by 2002:a05:6a20:8420:b0:1cf:d745:d641 with SMTP id adf61e73a8af0-1cfd745d677mr1281589637.18.1726126802834;
        Thu, 12 Sep 2024 00:40:02 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:02 -0700 (PDT)
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
Subject: [PATCH v2 14/48] include/hw/s390x: replace assert(false) with g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:38:47 -0700
Message-Id: <20240912073921.453203-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: eJIlPBfKil/6

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/hw/s390x/cpu-topology.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
index a11b1baa77b..9283c948e3a 100644
--- a/include/hw/s390x/cpu-topology.h
+++ b/include/hw/s390x/cpu-topology.h
@@ -57,7 +57,7 @@ static inline void s390_topology_setup_cpu(MachineState *ms,
 static inline void s390_topology_reset(void)
 {
     /* Unreachable, CPU topology not implemented for TCG */
-    assert(false);
+    g_assert_not_reached();
 }
 #endif
 
-- 
2.39.2
