Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp271690ejb;
        Thu, 30 Nov 2023 06:36:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuqg4RaTo865u5s8+DyM3Xx8BxKGm6zh5MDSmbt6g3PiRt7tcexqAfYQvi9rODvbTQlZTw
X-Received: by 2002:a05:620a:2442:b0:77d:858a:59d4 with SMTP id h2-20020a05620a244200b0077d858a59d4mr23184180qkn.76.1701354966611;
        Thu, 30 Nov 2023 06:36:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701354966; cv=none;
        d=google.com; s=arc-20160816;
        b=M9Sp3jHCw/wMATub1nZK52P4uh+vDkxIBJEsLqKodqbEw/kMFfppxLnQS/KvL4yB/g
         /3HXTbtrrtqfnpMgHy6tvDeDYbRLKGmMPBIBJPSK4T67ApEmUsyKre82wMkt5SqXMizR
         gpnfwETGezFBWNg/Dqb/uJ2lmi8Xu1zPuD0yK7br1N9msQtK2VVkJGcKFd0Ykj5nCGWZ
         LvzBZdPWueLo4IZRRkDEJe8hfGFC2ZSAl8e7DQFnaM/xeWqHDMK6JvmCX5c+HTdLOTcg
         g3LETznbtlIyZl4UvXiBaaE1j/ljmmZ4zbimm8D6qs7Nj5jfT7s5+9RoKN98Hi67GGrp
         P8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=8Fp5BZWPN/UpF5qDGDE77iO5ixRV0vutuGnOYigIF1Y=;
        fh=EvzXIS2ygU9QKs+dZ6sztfuJi5WQr5izWtbugpSw92U=;
        b=j3g0wlCOeFZikrfTtwbHlMzuYf565kBDocNV4orM+A/f7jQqtit0Ee1ETlk4l5Ew8V
         +cW7cEwg57ckn89KN/4v14/127Z6poRYTzSbO08xxrqZn5K53O1EF5qZZWhrvF1Y88UN
         SIFQ3dfZfxlQ1WhNZqv6qj9Gkpp6gfvRR6Sp+qSocTKw02w9apfa5k8jCX/0jjjWWpTK
         JT4W2Ej3MfkLiZdtqMtC2Do3qP8KqLRMg+IqaTFNDzLZgN7ENQjbrtwruqKTccR+Un6A
         eW5IWwke1C+sGPj3bZ88g/0FCE5AWGN3itferYxZ1nYksZnBXpjYRKiUXLkU27vXbfuB
         mJfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=H+VxXSsF;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43])
        by mx.google.com with ESMTPS id bl8-20020a05620a1a8800b0077d7cbd1c38si1224152qkb.251.2023.11.30.06.36.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Nov 2023 06:36:06 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.55.52.43;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=H+VxXSsF;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354966; x=1732890966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1ATU854G1+lM0AKtC/FFv0wTbLk1yiIDIW9pRjL09lQ=;
  b=H+VxXSsFz3chkD12VSgY1+82e20680mZKyjyOPrE7wVcCXxNvy/ARUnj
   w9BT8paNtKkt1jeomXsNDKQjhkdUQhYkJLPXda6NkLicSfKWGYC5ulJo5
   88qcHfbAzB71tXIoEQnq9bdLgZ3P4R4BS2zMhJmOx7NUrAFcumUQyGJj6
   /syZgLOCUgB1XYdNNCm/Ns0R/JLooM27w2I9ElJu4Jldn44kDGYoek/Q+
   tfoXJbzfEY8r1RPMIG9xYnc/PBcdAcdPrXkuYstS/2D8FW4wMiqJhtiom
   mIAjtBJwT0/euMXn+kkaMiOaQa0fQNa8l2HE2Q81AbIy/UhLBAw1eQWhz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="479532577"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="479532577"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:36:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="942730346"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="942730346"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orsmga005.jf.intel.com with ESMTP; 30 Nov 2023 06:35:54 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Barrat?= <fbarrat@linux.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bin Meng <bin.meng@windriver.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Zhiyuan Lv <zhiyuan.lv@intel.com>,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 35/41] hw/i386: Make x86_cpu_new() private in x86.c
Date: Thu, 30 Nov 2023 22:41:57 +0800
Message-Id: <20231130144203.2307629-36-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
References: <20231130144203.2307629-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UiJxOmRi89KM

From: Zhao Liu <zhao1.liu@intel.com>

x86_cpu_new() is only invoked in x86.c. Declear it as static in x86.c.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c         | 3 ++-
 include/hw/i386/x86.h | 2 --
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index b3d054889bba..d9293846db64 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -95,7 +95,8 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
 }
 
 
-void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
+static void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id,
+                        Error **errp)
 {
     Object *cpu = object_new(MACHINE(x86ms)->cpu_type);
 
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index da19ae15463a..19e9f93fe286 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -97,8 +97,6 @@ OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
 
 uint32_t x86_cpu_apic_id_from_index(X86MachineState *pcms,
                                     unsigned int cpu_index);
-
-void x86_cpu_new(X86MachineState *pcms, int64_t apic_id, Error **errp);
 void x86_cpus_init(X86MachineState *pcms, int default_cpu_version);
 CpuInstanceProperties x86_cpu_index_to_props(MachineState *ms,
                                              unsigned cpu_index);
-- 
2.34.1
