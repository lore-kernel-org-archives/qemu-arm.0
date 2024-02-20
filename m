Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1174812ejb;
        Tue, 20 Feb 2024 01:12:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYvwW/+gGhbLEhz5bID7AN/j1WTC8NWe7UTL9aLZImnz9EP8+ON4EMHly8JZt0TYBXcsSyB4Ffyo52XUN8ULEO33Ft3HCw
X-Google-Smtp-Source: AGHT+IFO8m2BiAnsqB1MroQB5IwEob27zFPGA/aUkjmJ6f5OdpD8LAxg5vrlQCaaRLxPgwfWmZHn
X-Received: by 2002:a5b:445:0:b0:dc2:48af:bf17 with SMTP id s5-20020a5b0445000000b00dc248afbf17mr11793083ybp.62.1708420344464;
        Tue, 20 Feb 2024 01:12:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708420344; cv=none;
        d=google.com; s=arc-20160816;
        b=U3cF5ukUmAn7Qal7hoFrJixnAv3IovFqqtgQhVm1p4AoW4Ea9XQZXcuMDvNvk0+mcB
         UgDxdTrp9lzLxAc9CL3Hd3DEDCgUa+bN4mmiU+kW/9z0pWZx97khXpwpiJWASAv+j0xj
         IUuOmqYw0jDqqvD9P2eP7LzhuZ6iT/dlmW0qL8HVzMpeNwMv99recpB+fz/s10EdAyre
         ZI0xkPnECWDzgVgCDqZ1VKZwR1Q17hIEhm0pD3cpTwe3FqcqkwQXuirRwmPioS+5VWfL
         UAXJW/ikuIjzxtqZKjpFo4zFnkWpuxwNI5XOct+NORRSW/xOmCWwg8p8G18ckjAF37dp
         gwfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ztZAu88Lpj5YkGi27K0oLaljmBoAEtp8/9AVpZ+GvPU=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=m1gpWiKvMOm+pNmn9sqpzoZWFFVshnwYN8yBRxHlSdMrEzuklRKlg8kjOEeVxyM1+n
         72Q6SrjI59eShxpXG5YFer1ntWU4l85NmkfWhlTivqjW4G53JI5OYX0Hqj9ZG2n7OjsO
         JFH7ja1ULwYTbzxpwEEUJpxFEw7WbRqX7ULx6x6Iw+4VUEUR9iUmQiGK1ozgrSP6QV5d
         DKWWHyY+TnYkc6xFfv77+IgiP/UgBik3j7ONWa8Y/Jim3x/Q6ehCK6iRpI3PveA6ZOi3
         YI2AZJLxpvzuWYT7mYU9XLneWVwu661S6m+VyhwH+aFuT6zVhuJg5SAhfSPjJAhpIIP6
         Nerw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=eL+PQWpw;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@linux.intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.17])
        by mx.google.com with ESMTPS id qs15-20020a05620a394f00b007873af4a4e7si9151366qkn.764.2024.02.20.01.12.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Feb 2024 01:12:24 -0800 (PST)
Received-SPF: none (google.com: linux.intel.com does not designate permitted sender hosts) client-ip=192.198.163.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=eL+PQWpw;
       spf=none (google.com: linux.intel.com does not designate permitted sender hosts) smtp.mailfrom=zhao1.liu@linux.intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708420344; x=1739956344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N8NOOJ+pARZ8UH7DHP7I4LRh9UGou9oDu+xcL8Vc/Rs=;
  b=eL+PQWpwAx0IbO6IvSkDSMqdtQT45ITqrNu9eqptqE3pKIObIuHwmDLH
   A9Be/1SB3YCSsygP5rRnBRHpvmvcW2G5BZWxkVQmojmykhYkMHSuN/aJP
   ldQWJBgr2yhSAHoSdp09cKBX5bhpPIZCdwIyaYU+jvFZdtODPBCZq8L6x
   8KvfcltPX2KukUj5RfW9i+R+R21UxYskhN+KnKxhUvw9hUsRqFnWMS64U
   +GOABQBcTKgZ2nlCxvHOI0EUHs52OXStSx9Q+ilNGxFxfiOMOAAAUewdQ
   l5eXhwycTYR/Q91HiiT5slNnd+H5yt9BZy2t7ZnwCrMjo8hB4mzdTho4g
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2375030"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2375030"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 01:12:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="5013100"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by orviesa007.jf.intel.com with ESMTP; 20 Feb 2024 01:12:17 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
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
Subject: [RFC 7/8] i386/pc: Support cache topology in -smp for PC machine
Date: Tue, 20 Feb 2024 17:25:03 +0800
Message-Id: <20240220092504.726064-8-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
References: <20240220092504.726064-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: q3UciPV+t1+w

From: Zhao Liu <zhao1.liu@intel.com>

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/pc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 25124a077eea..76148c3337cf 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1848,6 +1848,9 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     mc->nvdimm_supported = true;
     mc->smp_props.dies_supported = true;
     mc->smp_props.modules_supported = true;
+    mc->smp_props.l1_separated_cache_supported = true;
+    mc->smp_props.l2_unified_cache_supported = true;
+    mc->smp_props.l3_unified_cache_supported = true;
     mc->default_ram_id = "pc.ram";
     pcmc->default_smbios_ep_type = SMBIOS_ENTRY_POINT_TYPE_64;
 
-- 
2.34.1
