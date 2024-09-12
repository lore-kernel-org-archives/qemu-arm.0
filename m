Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp422836nji;
        Thu, 12 Sep 2024 00:40:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/7nQBkWwzZDGrKB4YM1d+791WynACpq2HVFEkxCw7mY2BqN8OeNgr1JR4IrdjXdBS4KEVp8WfOy0QfQ==@linaro.org
X-Received: by 2002:a05:6e02:194c:b0:39f:bac6:c324 with SMTP id e9e14a558f8ab-3a0848cb626mr19929765ab.9.1726126854112;
        Thu, 12 Sep 2024 00:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726126854; cv=none;
        d=google.com; s=arc-20160816;
        b=xX8pEMjGUplsdfilZDgH+d98sqKwRORwC826xum4AJNE/yXADV7IL9vCiNw7D4JIGI
         K43xMz28TekOthJtwYtGZrFudXmccOf018UfL0O/Ca8ThoGdoLugCLTj2yaLrNZInii7
         AlSB7QJUeI8rtJZ3vmxiEYItRbEErrpQWYpk9tXhbZUvhkRcrOjDT12NIJB08yPIWMr+
         c5BepZwUIxDgjZtVtQYCdRwnfpn4NWWT5WqNUri4sxKgXWUsKxOA1GErI2B/x1wOfPnj
         g/uV83Ref0MXJJRj0ybSn3KHdiq5JxlZAtjSD+7nlsi451txPGSCeXNpZGiSyAg608Iu
         3OLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZcvwE9FJNxmdIVPlBQdfypY65+b/8lDno7KQ7aDgr+A=;
        fh=O9rHDvUVL7sqp72fcox6k+Uxr4lqgz3kuCuWMPZO4v8=;
        b=BiCmttJNjk3frAtZOilykP4+sndRzojwL8QhnZQB7Z8lcpiR8efHrYq0Wi3vfnxz6E
         J6xevLlhQUze91UL2O16nAtmDJ3Vzuobdz3IlJLvN8opD+FNWr6VTrwqaXHlNBIXf+KS
         DvPpiFl81YFZjw/+2sdBm7neX7yW/7j++IplKxdw547LMW9RfwPonjkSQQPZpupTfdZ9
         D/qS3qvDIss6g8T7nMuFAHl2QhbsRT81qTREEGaQ1mqaFxlF3HEoiyqp1DPuRmbNpnB+
         g61x3IBgls5zPHlC5X3MYW3DFCfTaIRoPJrkc5ZfPPx/pHomGDRRS+/1Wry75a98S6LW
         j+yA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kqgNLwKy;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-7d82074491dsor3866681a12.0.2024.09.12.00.40.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2024 00:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kqgNLwKy;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726126853; x=1726731653; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcvwE9FJNxmdIVPlBQdfypY65+b/8lDno7KQ7aDgr+A=;
        b=kqgNLwKyEwu+ydotZ0LD8hJTLwnI6ZyPSAI8FBHdOi22Tj1MAyuhprDdbcda2e9Fw4
         oZuzDqTdjRpBmiDkq0MoyldR2ndAHJkqQPHDxEBrDwVT0p7qqqMn1/diRO/eW61sMtod
         OxA61iI4oD7Cq9+V11ZAZVIl0UgW5sMDUW73u163smN74J9xndjweCy2sCdjLz3ShePi
         qKp68MDciGberLhbIxNVj1xLUrlKkcYRCAgiUfi09sRn2DRvekuORNv8RHvEzDWnFkGM
         djYWLdQ16FvJBQMyulepahxCc0vBdFlWXEiisJr/ux+Mj4PA1Ptardmu8zCh4w7ugdNv
         E1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726126853; x=1726731653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcvwE9FJNxmdIVPlBQdfypY65+b/8lDno7KQ7aDgr+A=;
        b=V4axm6HA1N1WhWmGMbFw+C+oznFmvCRLhVQevSfg+5Pk0tXeDdcnPZD+NSFqqSBrS5
         jmg5PSPaYsdYqa96+rPKUCeIt8uKqNdYxGwwwupwalhVONCWkgOqOyb32lbCG0cMNg5y
         Ron2E7FOz+zB5l0dTGorFUisbGc1cDVKLYMvPJQTvR2qmCgnhZPk4sf6AEbn+XoGG5wJ
         YixKy+Up602EISlsyDJgUQ7BRbpVKgtbpiZberXwWB96q5VnGgLP6Z+KwygxRN7Ts89/
         wmFWEB8ke7f1LsKh9LbkDjVl94n6TKQY4Oh+O3+7FWqXbnekyV8C9ZJ65951MzZUJEpB
         i1Ig==
X-Forwarded-Encrypted: i=1; AJvYcCViung7UgQF0NGv0661AMpOMGA26oo7PqsDW0fCyxA3NBOwpmRy6t774hW8C0s5VGHvEQbvgukJpE0FLA==@linaro.org
X-Gm-Message-State: AOJu0Yznfuz5s2/u5aEuOY1RIT+RSYMZAIz3ioFUWVbYhZYANY1B6FT6
	t+bBQzWVMXJWp8czUxbbsF8jiWCwJJ1P5MJYjxwyFwA1TZ6qqa6eFQv02wVAgVomMw==
X-Google-Smtp-Source: AGHT+IF+BwpPE4A3M7aIxv++xh3a9Ty8RvQxhzK9f6I85GUgpXeWj/nLy6PCJ/dYfr1LgiyAJ779DA==
X-Received: by 2002:a05:6a21:a34b:b0:1cf:6b93:5622 with SMTP id adf61e73a8af0-1cf75ee4d05mr2672158637.14.1726126853641;
        Thu, 12 Sep 2024 00:40:53 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fb9ad87sm983458a12.6.2024.09.12.00.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 00:40:52 -0700 (PDT)
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
Subject: [PATCH v2 33/48] target/arm: remove break after g_assert_not_reached()
Date: Thu, 12 Sep 2024 00:39:06 -0700
Message-Id: <20240912073921.453203-34-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
References: <20240912073921.453203-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +/R9YvH2q9ct

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
