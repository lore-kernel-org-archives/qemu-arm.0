Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444866njb;
        Tue, 10 Sep 2024 15:17:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWL99Mvqei0tG7ozBCaK5HMmd62zjPe77pbj5TrYWWuQiX2BSq6SGloaba9QJTJ3mispUirpi/MP+MuSg==@linaro.org
X-Received: by 2002:a05:6a20:c997:b0:1cf:3461:296f with SMTP id adf61e73a8af0-1cf5e4701d2mr2954566637.13.1726006679460;
        Tue, 10 Sep 2024 15:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006679; cv=none;
        d=google.com; s=arc-20160816;
        b=nE1b+WfxwHwT9Na0QpBNwkH5f3r5/Q7RZlyZbL3nsq7sJPGi6kIDdjzz8xfOegaR7I
         JNTxcIRM9ZXMFr+vK72tpbTX3p6wkkeLfZCoyVOPBcTlLyKIIFGuMoDdq5fJGTBe+/ie
         hgSiPpaDLjzvThro9WXoGKgLB/wdifWgx5Ktgm42vnYnTSOUMrAzhI2bt0mZd4CYHBEh
         cekv0f6OVgzKH0Zkiv5a0W8oKofKsorXEUCyYx92FRKaJ7/EVq/nglWAT+KpEffqRIPZ
         mdhoe7WU/ABSyOYvNA8urzvXSPtVWaiNWIN/im2R8YqjDknhQpKcsJsSSsJLLDi+ExBl
         QUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CCyNLuF1LstqlhxKrvBEXR8Gg4TvMK5bWfzhaE1qWNA=;
        fh=eWW//DBPYQ+AK1FKR3BxN0gKXVeWhuxLcrWrZimJyas=;
        b=Axa7Xw7cwyA7o77xtXbbTcUjvwJ9sYKR+nlvmyBq7CTAzxlCVCvzgacbML6XLmnNMX
         H4XVF+JmiFOLnjmdCYkFpp/Y0gAEwUBFoprOH9n2vecTZVquphSiM5+0P1bkvTbEhz61
         MK/j72KcZXPEvf/yJ6Qqm0bxV8adxRs/y5a3/0QFxTW0AK7xMeLvI7ikqUbU0S+UWnU/
         1CKfj2N5Jb9m5PisYW6OacSBQJb/Sk4tatIQsCoukLti6toINMQsjRhppJmbtKcXxFQj
         9IzHjvPKvCMqhciVnvP0UjSamhYDHk6cEUv+Bfcwpw1ZFBAFckkIjy5Ko8hpop55x/Rl
         gH/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="st9jF/ax";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e57cea70sor4186222b3a.3.2024.09.10.15.17.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:17:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="st9jF/ax";
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006679; x=1726611479; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCyNLuF1LstqlhxKrvBEXR8Gg4TvMK5bWfzhaE1qWNA=;
        b=st9jF/axqz8Mkxp/5WLuxN3ggtvnm6qptVwm2/j1u0ZmXCNIoNDsZaBXsF/QYJCstv
         MT1WXpzdvP3IVceDeymdZDJz2y0dnIYmHGgy458cYn/TSUr9hNFoS4LhfwY4AJ+TPbTz
         0kNnnLNY7E7QcAuUqlFnC33mi7WiEzHFnh2HkDQ14P77gZg6KEQZo6Bp5Yl7VOG4Gsy6
         86HHcdeL9vbhhSLcYIFr6cocr5o/qitYV0vkbdV9i5bBTiwmapMaZaunjU06/VDPhfUo
         2b3lnN33X3AwOjMC3k7lzRi8h1w4AetdrT+S6W1ogK9rbLlmGLGd3MSzIKpj2Hl13twG
         VoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006679; x=1726611479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCyNLuF1LstqlhxKrvBEXR8Gg4TvMK5bWfzhaE1qWNA=;
        b=Xlb5m7zS6xzjx7IJg+sL1aii4W+Av6oxbhlND7JOyIijWF/rHD9ToE5qSbOOnRQDtB
         LFGbff17w6df4lDOs4QVCFo5y/H93nR/Cmchi0F82HP/scvl56kWR/PWK//VQyCffndQ
         zR7W9bqQllAxTbi6AnY33E3vKNAx/oOG/4agzWSwqwQOvRYtFLVbmyNe3giJTpSKlY2p
         C0ahM60Ix3BTftxAvStNO0ArYesE1iFHdvERlyE5qfJQLJ6S/nWWl25pHplCFoTwW/Zi
         JXKZuSfevW4E9MUQU36lS9Su9Bou9EV/Q6+z0aCZkdSGPMWsV8DWSh83pciPHItLsLAd
         24oA==
X-Forwarded-Encrypted: i=1; AJvYcCWqEBffAWRPDY8NEw0OJgZD+RusBPiWWEMDm7iAr+P36iGzylgnMJrztP8P6i2M36g3D06nD9zoDvWeLQ==@linaro.org
X-Gm-Message-State: AOJu0YwxrHZNsI0UulsHoyK5CTbjstFVkQqfLWtw0Wgi6y98+bhnuDro
	9stGc9NfjjqXroABrxpdKWSAL68KlAjjTJmOVm0WgfdPJWsa+hm63g2BOMIkLqE8AA==
X-Google-Smtp-Source: AGHT+IFmGoBUAFx1KDM5UgKFB0SE/hPbgLc3THVYv58BQ1Gnmra8mNjSAuaAbG/yO+FnHS2rRbeS3A==
X-Received: by 2002:a05:6a00:3095:b0:718:d628:3d7c with SMTP id d2e1a72fcca58-71907f54f75mr6220196b3a.10.1726006678900;
        Tue, 10 Sep 2024 15:17:58 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:17:58 -0700 (PDT)
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
Subject: [PATCH 33/39] target/arm: remove break after g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:16:00 -0700
Message-Id: <20240910221606.1817478-34-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: U+sOnCv9HZMX

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/hyp_gdbstub.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/hyp_gdbstub.c b/target/arm/hyp_gdbstub.c
index f120d55caab..1e861263b3d 100644
--- a/target/arm/hyp_gdbstub.c
+++ b/target/arm/hyp_gdbstub.c
@@ -158,7 +158,6 @@ int insert_hw_watchpoint(target_ulong addr, target_ulong len, int type)
         break;
     default:
         g_assert_not_reached();
-        break;
     }
     if (len <= 8) {
         /* we align the address and set the bits in BAS */
-- 
2.39.2
