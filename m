Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444328njb;
        Tue, 10 Sep 2024 15:16:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXz27JXhcAC7JniilE5cQxAlnPPmd8xN/+W7egky1AkKoxhScDqElBZumQITfTqDoEEnjpqokFDeyS8yA==@linaro.org
X-Received: by 2002:a05:6300:404c:b0:1cf:460d:8b75 with SMTP id adf61e73a8af0-1cf5e041762mr3480966637.7.1726006578591;
        Tue, 10 Sep 2024 15:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006578; cv=none;
        d=google.com; s=arc-20160816;
        b=qG6JGu5NGJFqb7CqSCk39pXkSwKZWGhkqvcyDPamBsw3Y3QQkajsXUHl86D54D5wve
         MTi6GoCamdLfXHKahvymYpXjeOdJUjCzIQG2EQ4SN925le7RErvHOw96lbQ6yBxXPSkt
         +wVfVVqWSCFHKHPO09C3StVj50jTEp5GUuXEzY5qCVTdyTpnHgOIe8RKSzLk+m6rXw0T
         IgQnx8K84SQkHXGsP1E68jhOwKwCn4AdgqBnfUxtjc8gA/yCwp1v3ZaUhwD4nwDcjity
         GMPDo4eJDPp1kfJgraQLlZjTQZxcnZiLD2EdtDjOe5x0RGYYcqyZ1Tn5OvcvwT63r25H
         fJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rtg/fsM266byh2SMTyHSqLuDJEbiLWNPpLD5jMD37ko=;
        fh=nnOF/LyQuYYMmqA+Fv9OdBfvf2t9DIr1wcOY2KWvemY=;
        b=QLBauimfpsEN+6hQvIlpkJaC1QPXptwy0ccE5ZWGE41ro9zm5WSnRArlcmT6b77pVF
         WDGiggfCT2SpK1InkzrgFh3TeF7OnEWYMwv2vFj4Xlu2Vn4bSouBcBd/aFvLIWW+7k4K
         TQcbthqDxoPgZeBejzE90pa5auPQN5TnbeYynB7nT0iZCtcG2OUnxLeadvMIkhmZFYjS
         Yi+y0WW8MszDHkXo7vKkuX1tICTQT9WAMUGT93w1F+Fm87T0ILbjg5muhWO41GsRyVc0
         PViDPz01ukKMs+4VlXRZtjAV2U2dn3HqWX9QrjvHFoxCjVEF/afzdUONrUbfVsAJOBxY
         9QjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CyvD4QRE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e59738dasor3823114b3a.8.2024.09.10.15.16.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CyvD4QRE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006578; x=1726611378; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtg/fsM266byh2SMTyHSqLuDJEbiLWNPpLD5jMD37ko=;
        b=CyvD4QREZn4TCK8wK13zCz14zD1c1/P0L/3gdUiipATbsfPX4rfYmlpGaYfAfJjWKc
         Yr6sPt1NAeJuW4lvbtjDuX2SB8uQpIIRsGcNGOjc2jGO998eLdkwzeedQzRyAwBsAPdo
         eI6jIuC+TwS0SLvORccKMjsR1UwM08NIUjAfI7gO9C/wfJMoasAICdiNBAB4ij8gqfYs
         m68WL2mwAgU9NcQmeaumSX0ZYQj6LV5HA7QawJpjTmDb2RDAf2WzFhOuMqhvLxDtS9JP
         O9IztRz1N7suN+KeajlY3XXIvQdLEQyHMpk2JGq+svGoXNGnq9oAN4yS+V03cWrJvYAi
         JUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006578; x=1726611378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtg/fsM266byh2SMTyHSqLuDJEbiLWNPpLD5jMD37ko=;
        b=e6xPJovpYIMWjJa4EaNBi/RJ6lGOAw0xnPjM9iAdYuGYBeFhZpFlUOApqar61Ssmwf
         flgcZlB5Gayis5Xk7Ux1kstUWVS9nlVx0iAvGgQjwFPY4MLLyNIvUKlqZk/8z5cBRtzF
         ikHjyLBoEKLVM2WGRe77IahsLq6leZKvLHPFOHPcoNlAVFqr+4xo4MRu7CLt0VSPJH3Q
         OIgGTMD3VtRxN6I7J7+TCMWQnwqlqUtsqz9Gd0aE5ijhK4MMLIv6tXgoHX0Fz6bwCD09
         NikIrCAdqESVT2kUKt/Ft9Gb1ZD3HG22UdviRNa6ikWyPuMcukdQuF+afPRrTaETwI0Q
         6yyg==
X-Forwarded-Encrypted: i=1; AJvYcCWa4TBQyVVeSDvReKCFBWzg+sHssk6/Pl1mmXlgaQLhtJahZfimRbC53+CuKIGi/sKeQNXunuet1/2tRA==@linaro.org
X-Gm-Message-State: AOJu0Ywi5FdkkiRFHL6I4LcNKupiguclFl/xVn94lwZAtWc3rNEigPQk
	v3H7glZyci5zHICNGRk8TdHI7RC6Go5R4voYWuJzqURvpm4UlTN3aiN7dzA1CJu2PQ==
X-Google-Smtp-Source: AGHT+IHWOSynm87dcJ/e3spTuAWJklvasOkQ7Uz80yLy824x7t0cXJiqR3CMOljYmSMNtVZtD8XWTA==
X-Received: by 2002:a05:6a21:b8b:b0:1cf:51a1:8e89 with SMTP id adf61e73a8af0-1cf5e1c5ef2mr2725772637.47.1726006578083;
        Tue, 10 Sep 2024 15:16:18 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:17 -0700 (PDT)
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
Subject: [PATCH 03/39] hw/arm: replace assert(0) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:30 -0700
Message-Id: <20240910221606.1817478-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GwPgmnGAkut1

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/highbank.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index c71b1a8db32..72c4cbff39d 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -199,7 +199,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         machine->cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     for (n = 0; n < smp_cpus; n++) {
-- 
2.39.2
