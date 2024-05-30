Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp118821ejk;
        Thu, 30 May 2024 03:00:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPO7wji+BcejU/wWb4AnDevMs6XQM5WXshtd3zo4D/dUQn2OiR3Oke+9MHtuUVgTo8S2lNaaIYTx8aqV8LwLGya+nuqxWZ
X-Google-Smtp-Source: AGHT+IEw0qunZM8McJjgrOyQOvYbzl7d8/a7BZvpP6RjlWDvhaHmq+PDcHTrB0dIOuvcwbJEjdyD
X-Received: by 2002:a67:ea93:0:b0:485:d96e:d18a with SMTP id ada2fe7eead31-48baeafa0f4mr2012531137.29.1717063259395;
        Thu, 30 May 2024 03:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717063259; cv=none;
        d=google.com; s=arc-20160816;
        b=FtyTUzjdxaHHlTDQg0OgjDesOzwysOkBCzKIjO914vCbHbxYrecby2vG2Fsaf/+TOl
         36Uhq8ApDbA+xskZxMY48Jv6athWSViIZG9JfZ99TxuOnolWAD/3upda4Ej4Msf+BpvW
         UG4r1ndlPOF+MeufDBPoFG8tgNEWuY4faZhWK1I0YezZ7ae7Udue10Hdz8C74jNRVTeP
         JYysdjr5ymIZGQw5vfYGloFTXQxbA7cPOBwCwx3+v/M/uOPBEaDtBrbWOuioMQAJOxdn
         XUrDZgv4nwddGmdOrvw03tHxFva/z9+vntPX4CthS2jBU5j9Uy3ezaifZoIYUhbzIHSR
         jZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7kKsk7+o4PrlW0gNizCdINl2EmG27v+XBusYjEYHMm0=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=Hr27wR4pJXLYDBspNq1dNsuQ0saxMWEVmj1SkSFF/SawJO3iH+5V0phB2GtDluUPpH
         2m1/JSc2qo5878FCMUezijhnZLM7TwuNexOeqgE+wM9XrhwV9Lu2ho0wsAF8sRMAYQVL
         vBZWxlKqqqaG7jfVyME+ZW0Y7JssaDDg/a41TZkSCzA5bhr0pAdIgPH1J7tHRbflaWbO
         hynecCKUEYekWAz5abxWYnUoFOq2MDlK6SFb8CnTHRlMl8QLBbjQkbXbx0kibO1YE0Ai
         rnDMhU4pIdL1IYlZpnJw8Svvspjljh6DoXSisZyLQ6cGKIjzMOOrYb72qAyz0yIjzF+p
         FTUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=idF3Qhdz;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.10])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-804cc02cc8asi2656177241.162.2024.05.30.03.00.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 03:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) client-ip=198.175.65.10;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=idF3Qhdz;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.10 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717063259; x=1748599259;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=znO68kctoXTm05SXOnOkWCHEq8CPUvXamn9nrKcDybU=;
  b=idF3Qhdzv1uTe4716DdOwYxJ2adkfs8q0sgsR83fUdoIJQqtaTrzd0aN
   6PCgQZao+CyGkZsna7GEyPDxPmmc/LOfGrz7YWNHqwYaKF1LUnTW/2XWB
   kkxS4KNM/HnH6Qv8P6H4sPJFMkbVqvqMz1Aqf7SxbYipIRzB1lc+F2NgG
   DeuVQluNotIRAuEiaF7VnipnG6BDhXfhSf94WzMHQf8S+CjQhaYBt/Fts
   AkyEIGvqYeuH/wcM0FND9l8czNXSx8Yx7qeMcmxroThp67kSCCO7zV9n2
   HNrKS+eA8vUosu38qVxSKGp3QXP6JJbPFyVnN6KN9lcce0J8z6fxzg60Q
   A==;
X-CSE-ConnectionGUID: 3F+odLvQTyKN1KXGKzC3Yw==
X-CSE-MsgGUID: L735IeaKQdq/1VvVYQvYeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="31032595"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="31032595"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 03:00:58 -0700
X-CSE-ConnectionGUID: neXIx/biQuuMsRJXYFHhLw==
X-CSE-MsgGUID: vImgdb6DR5m+pUdi65nqSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; 
   d="scan'208";a="35705138"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa010.jf.intel.com with ESMTP; 30 May 2024 03:00:53 -0700
From: Zhao Liu <zhao1.liu@intel.com>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: qemu-devel@nongnu.org,
	kvm@vger.kernel.org,
	qemu-riscv@nongnu.org,
	qemu-arm@nongnu.org,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC v2 6/7] i386/pc: Support cache topology in -smp for PC machine
Date: Thu, 30 May 2024 18:15:38 +0800
Message-Id: <20240530101539.768484-7-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530101539.768484-1-zhao1.liu@intel.com>
References: <20240530101539.768484-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: rL+l7xSQIfLc

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/pc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7b638da7aaa8..2e03b33a4116 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1844,6 +1844,9 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     mc->nvdimm_supported = true;
     mc->smp_props.dies_supported = true;
     mc->smp_props.modules_supported = true;
+    mc->smp_props.l1_separated_cache_supported = true;
+    mc->smp_props.l2_unified_cache_supported = true;
+    mc->smp_props.l3_unified_cache_supported = true;
     mc->default_ram_id = "pc.ram";
     pcmc->default_smbios_ep_type = SMBIOS_ENTRY_POINT_TYPE_AUTO;
 
-- 
2.34.1
