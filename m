Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161360njg;
        Wed, 18 Sep 2024 21:47:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV11pKlLOIRSQ9kp1T3UwsgpiVRgYbDhcXbYk4xvivRLpFGBSOQWU3ZNhDhFVz/U24qhhIz0tU0ZSd+9w==@linaro.org
X-Received: by 2002:a05:6a00:1953:b0:70d:1b17:3c5e with SMTP id d2e1a72fcca58-71926067e78mr35774641b3a.6.1726721234533;
        Wed, 18 Sep 2024 21:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721234; cv=none;
        d=google.com; s=arc-20160816;
        b=fmvyCcfJ1ogltYV0bYu6fcs8QsjLrdnYREksihMjRC15LB1d77RjzfS8gtwctGRy+w
         ML+DCCPKXRnivlf2C6ycxSkBfCVUU4DQKD+1wdQePnqjdEMVDJ1i0GVeyaU+Oi+tdg4B
         Xk47vkjkp0MUAwKNzuBelHpCmYWe/1fVxIE/pyXkmnX7/YMWzoypzPC2eiM9ieec2/e3
         4p9rdNA1Ep4cORHL7ECut2FgXNdI1Bbcf4CV7Rzh5DQwCJ2ihuUYNYoSSSk0EC5V3nKy
         OhLCWDgICmnprgkk/LkWqvdciT5+lzyvRvZGlKUFr7jIOy3q4jyh0ljc7+fgY9ov00oX
         bR/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7PZhVYqzq4kADvRMhAIMG6rvS/s/Gp2LRBj3c7uTV/4=;
        fh=zMV09JyME8xVHltH6oX86CcRxi6wsGqkEgvXB3rrtdg=;
        b=VbGFlPhZGlqQW4gnXzD6iazeXZ0+Mp6axwnggykD4QeQDLORFSWzkgHxk/qdY58LF5
         z+LY+PHc6C4QoFmbz6LbHaqu6KC/wT0TOrYXK0AtxYhQu5J5wtMRl94z3LPVl0u6Mjxn
         SROJjdb9SUns+fwbYdBlxMdDukwtOwfNf4EX4HPnyzVz5p0t6F+0bq0eYcP8B2uDXGqn
         NMQ5Ahj7Z0xZQHGk7zDpwlCkvZOmi3eEYUI1HSln0Sw+USGeFpR/7JNHZe6CWWoJq26O
         d1btSItBw8G8/RHuOEEtfOP/IgwPW/+c63UAPLR5PYhXOA2dB+x/Cs45oRhSrq9wDR2q
         MM6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fz3ZvamJ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944a97314sor7137584b3a.3.2024.09.18.21.47.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:47:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fz3ZvamJ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721234; x=1727326034; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PZhVYqzq4kADvRMhAIMG6rvS/s/Gp2LRBj3c7uTV/4=;
        b=Fz3ZvamJIi4S7A7iH4aDteGF0xc1+oDkE82I5iozhCcZDJev2b5iRw90NCb3OqUXva
         PMZkXj/BxtJGF8nFi4K0spsjUqsYWDxVDbGJCi/OqE5nI21TT/iy1jKwCcNMkwOJ4aXC
         OILfBTIyGmi82B1+zv2tfYnT4PXaeqGx0a0+/rbQ2XaNA0PGx5P78hxH49VtAREqIro2
         PA9xABO5Iz1dV66aoWTsuBI1RlNRFLvVqtKN5JVz5rx8QL6Stm5ZP7wmtbCOaNiZ5qXD
         KNmInpiB3zAjBM9Aihk7/PRZGk4lgv8kJs5ebufaQ4o9B2BbFW1Pk2YG3fcxU0mCD3VP
         GZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721234; x=1727326034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7PZhVYqzq4kADvRMhAIMG6rvS/s/Gp2LRBj3c7uTV/4=;
        b=UK9epaZ08cpZ3CC4NQ1e0kSP7AdAfxlyaAhRRxC+fPYuVtTOcfhwQ9mUqEmiqO0Zhy
         PpBLCIy+bvDn1M8L1GaXs4OqPUH5ehwJVSo5MfJTsosUHVS9TmMSdxE/+0oYp374pzY6
         178GQSLnl51v3Knfkk0T6oFkRu2x5NlkF2iu1liQfbVLc0QJYcW1EHIbX/18WFS9BKVp
         ki5zPIaM3420qWag65wh+pgOjhflWG2RUaOHbUzyIhTTbQ5XUCQe5JjIiejylufvQ45d
         46wwxTpW6kMLVXP2QRP/HV/gikPMNIqb6SZebs62kjI8bqegbXfE6n2KUHvWGakLpSQi
         bwhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTQg4xncMJ461rPTBLc1zgEsMp/c7wcr2j7uA4uIt8EReaaX3BJSc4EkC/dDiBuzQj2CIUyqDrZk8xlg==@linaro.org
X-Gm-Message-State: AOJu0YyCFOJw5bIXQNtUq1IGUfKt1yFIZ8vnAjVu1PMVMXFmjeW9HBOW
	d2pESbJif6RAoMcgDEFj0kz/cibzx6obCo9UhyA7WUhMKjyFxhfwx1qaXaf6Fskujw==
X-Google-Smtp-Source: AGHT+IFRqXUQzeifeEouuocTRosW9D+grcvLtI1xOR31wi5/CcwZDxPvsAI1HZex+byGlUmwqu8pKw==
X-Received: by 2002:a05:6a00:2d91:b0:717:86ea:d010 with SMTP id d2e1a72fcca58-719261edaa2mr33169557b3a.21.1726721233871;
        Wed, 18 Sep 2024 21:47:13 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:47:13 -0700 (PDT)
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
Subject: [PATCH v3 14/34] target/i386/kvm: replace assert(false) with g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:21 -0700
Message-Id: <20240919044641.386068-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Gwr+D/VPkQiu

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/i386/kvm/kvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index ada581c5d6e..c8056ef83d7 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5771,7 +5771,7 @@ static int kvm_handle_rdmsr(X86CPU *cpu, struct kvm_run *run)
         }
     }
 
-    assert(false);
+    g_assert_not_reached();
 }
 
 static int kvm_handle_wrmsr(X86CPU *cpu, struct kvm_run *run)
@@ -5790,7 +5790,7 @@ static int kvm_handle_wrmsr(X86CPU *cpu, struct kvm_run *run)
         }
     }
 
-    assert(false);
+    g_assert_not_reached();
 }
 
 static bool has_sgx_provisioning;
-- 
2.39.5
