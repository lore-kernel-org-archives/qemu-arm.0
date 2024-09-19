Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161445njg;
        Wed, 18 Sep 2024 21:47:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXvn/NyNROh91Ly4vx1RetvTmpFbxYxEqBhUYT1Wxt9xCNJ8BcVtOsD3/foSp6VCc0c6DQUCnLLV0+oMQ==@linaro.org
X-Received: by 2002:a05:6808:192a:b0:3da:a16e:1764 with SMTP id 5614622812f47-3e071a85515mr20711146b6e.4.1726721252446;
        Wed, 18 Sep 2024 21:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721252; cv=none;
        d=google.com; s=arc-20160816;
        b=kuyJgdDtQ3vCzpFbHAXLmKGYJO7Puq5ERUnCoY+yQ1zdp/GhbkHXCK4jpVwgRbpUrd
         iPxuJBsnVUirhQMnQ5dIuGnX2jbbI+nnKhnIGy1/548p1RLLOeZlJQ6jLB+XiTqEsX60
         FBrsGgSnMhBqWapXYMLrBTZLOHPARtdVXpVFE4v5CoqeemYNq2UscFGEOAlz8s4GZiLn
         cEEXAsh6tv0ijULoLfLbWMr5ml40UmBhhv27UAkwjV1dEaTBBOxAE9RnhfAYbIpdHfwR
         IjMYSbLsyz0cOjEdtCss6jWVNkvOHmVUHK//z1iEt+V+SKvNBGIYXFKwScQB6L5VPt6U
         GZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=htcD0BwVI8E53kI5D4tk23OSCVl4GJymUerem5Vd+Nc=;
        fh=Ujv0PmIn04XyZ/fGSFuI+j4DbiKXYi+YysuZ8ZRxFNo=;
        b=Uqq9PUFYs3asaVYoQUqA7Tgun9oPfZKBBaWygLL89HmWIZGz8Ll0XgYblSg5QoiQaa
         xmQTknLYGpgbWWq7jFjuLG5OpbfrtaPsAgsJ4iNnhX3BEeJU+C3iyh79hLUc2zd/xog2
         sFZmAwsgcJjHFyYGfm//VzRdnFdgwjVHO4LQ8R2FM8tAKbfqh+KzI6DHU/czw5H3SKs9
         +fVjPBgx9QSla5jnaWOMaH1vTDEOr8OxI369aAGv9HzwQWXyewzc5suqCO0ftdDQucbK
         ErWo11V4B+lwGCQduihGmqMBMa8rB7I5Ds6LnFzvcAYMTi6a5zIbsYYRz+sdWJAgm84b
         Kcvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yI039K0Q;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944ab6ed3sor7569827b3a.4.2024.09.18.21.47.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yI039K0Q;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721252; x=1727326052; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htcD0BwVI8E53kI5D4tk23OSCVl4GJymUerem5Vd+Nc=;
        b=yI039K0QqFYDT07fl0NiXGCTMBVg+HYgTR2cJJ4LYbbmCPXju7P4GpRs+Uvtef6vcT
         mjP2IeB1PjCO9KhdHbBRg2Qhfo4vZOudk0CaWbn4Iza0uazXpYEJH7xkm17WGzNLxWjn
         Db9MtL3+TbsnaofJAWjqHKBsL2f4DS2U2lPkP3uxkiU286YMkEahuNSbZBhDYRJgOkSp
         4o1jeJqJQeBgk7uYEyYdfO0ogJaSbz2+BcqyaphLuNtic0hUtly39Gc2xCzmw2JIR3Mr
         XC5OuLLCajnZpNGmBj5jXhLOdcY7RlKvkrJgl07e8vbNmFradT3uFGjD1OnZv1uW70CV
         OmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721252; x=1727326052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htcD0BwVI8E53kI5D4tk23OSCVl4GJymUerem5Vd+Nc=;
        b=UXJecUM6W4c9snKdzFvEBwV0+37g/En1GOztiQDLNNdbngYhbgbqVg5XvWHAHMgD0A
         LRNKNSbUas9hFf/CZtAob89ZiSvHgvh8SP7azLu9SucbW4amaN9PMz2s2mtYuXEzPGul
         SFOpz2Gr+WemH4iem4WVED3u8D+pZ+hZijsA+xk8luy+EqyA7riy52MPiI/JC3qJKemU
         RGY3W4xRuFLKj0R5Yf0K9/n92mi1MEsAtwFzqsk83WR9ula9MipzZOzpEA0R59BUFxfp
         wgU3+avQnaxnZ0bHSyzMWbfZbJKrYKPU5gv7YYjSMwaOPuOO/cjuRI4ldlpmhCgFLYCY
         wgBw==
X-Forwarded-Encrypted: i=1; AJvYcCULRCdmHE+YxO63RTegEJD4rQzenQaBcUVjxdz75ojmq4eM4rK1yflw80jovZncGvXPDVxPnMyfglXQnw==@linaro.org
X-Gm-Message-State: AOJu0YyIuXv7PDV+TImXM1t8H4lTHE9K2jbbyzjbeicmJRqL0ogvw510
	pDWcVZSr2t8nIxX1BO6DWHb2zFQMuBftzQ1nNByk3gynGlGcMPH7MngMLdjc59+b8Q==
X-Google-Smtp-Source: AGHT+IG3VDWYQsL5o+dqVWGrfQofsayNLblIyTF0AVQE/kr+M4nxrlPbIJFiaP/P/b9fsRX/Gu2PzA==
X-Received: by 2002:a05:6a00:124f:b0:714:1e28:da95 with SMTP id d2e1a72fcca58-7192608198cmr37650198b3a.7.1726721251825;
        Wed, 18 Sep 2024 21:47:31 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:31 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	Bin Meng <bmeng.cn@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Corey Minyard <minyard@acm.org>,
	Laurent Vivier <laurent@vivier.eu>,
	WANG Xuerui <git@xen0n.name>,
	Thomas Huth <thuth@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Ani Sinha <anisinha@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Keith Busch <kbusch@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-riscv@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Jason Wang <jasowang@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-block@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Weiwei Li <liwei1518@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Yanan Wang <wangyanan55@huawei.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Jesper Devantier <foss@defmacro.it>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 23/34] fpu: remove break after g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:30 -0700
Message-Id: <20240919044641.386068-24-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: VDKFmv0zWT5B

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 fpu/softfloat-parts.c.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index a44649f4f4a..cc6e06b9761 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -1373,7 +1373,6 @@ static FloatPartsN *partsN(minmax)(FloatPartsN *a, FloatPartsN *b,
             break;
         default:
             g_assert_not_reached();
-            break;
         }
         switch (b->cls) {
         case float_class_normal:
@@ -1386,7 +1385,6 @@ static FloatPartsN *partsN(minmax)(FloatPartsN *a, FloatPartsN *b,
             break;
         default:
             g_assert_not_reached();
-            break;
         }
     }
 
-- 
2.39.5
