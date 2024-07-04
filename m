Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp333500njb;
        Wed, 3 Jul 2024 20:01:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmGU3q8HOPFBhcQWRpVZCflZdkZI8iJrgRXOYn/g3OvhHF58IMSZWt1P+q0NwDu0P+Ux/9jMBdJyXFIwRkwAbTfkipVG1e
X-Google-Smtp-Source: AGHT+IEckRzRCyooP7qbb6dmBkwnWAi78PwIcbRsPei4Z96BxTaKmBujQqw6m5MiERY10PVejAEU
X-Received: by 2002:a05:622a:1441:b0:446:5a62:ea71 with SMTP id d75a77b69052e-447cbf5e61fmr5010571cf.49.1720062074799;
        Wed, 03 Jul 2024 20:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720062074; cv=none;
        d=google.com; s=arc-20160816;
        b=YmLn6ZpTsnwfG6kfklzKpsoOk/4QVGzvYrb0ggexQkaulwXl4ECfecCXFpbkxasr/5
         WvQNDF7J6+Bta1jiv41y14He07UrzGIFLcb1EbvgS1MdC3q6dnHtzkA47fOCvqLvBr+K
         H7itnFX5DH0oFgzq9gHyk1pNeCTGjBnOplK8L0yGy1UwgWaKvjXy0IY34S2R5qxtmibQ
         YwbZfz2qsltott8hxJAUC7YHIL91/NbfnGBqNZocCw0PlgznJ9EPNUENH4zDFPaAUkAl
         oroBOBmopOlhXhFyLxXuDBd1Yo92AiTVqlo7XL5cTy8RPDxGZ7hBb6On3QDVZx31v3xS
         CUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=g+DT31eyVlKnq2UUJ/bydDk9uyJTHJn3Y8jlBLnkT/Q=;
        fh=y/QRFpE0iuVKIel+vmNXxcobwLojV9zTrUXcyY9wJvQ=;
        b=wSObkcR2jKrNpv/Z9nNEoOsPqKW2NCOrYbd2P+n1UdXSQrh7aUQCF00KFGZ81XD3Tp
         f43nOTgrKZeozVleM/NbhL/YqER94Vm7koOKQc40rE1gmqmCOH6K1lnJ4jHBpP5Y1Yaf
         HOu5eo9d+WpGeeGKt/ZA9IDmnzkBrHYkk047CCclQMA/cfUzRWSpYtv8I/jrVi5nQGyT
         xYKkIXZVkntIOwFddxMdt5sRVKc2ICVYdzCIoLxLNBlrO/aiSYMogE0c8I54oXJZsGET
         YHy5J0k1ITVH8rRRzHJ1E6j7Bu0V2ykxfP9kEHxJnPAb2LkO5d9cLfznCKODg/YviGrv
         Qx0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=gDNXJcOX;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.9])
        by mx.google.com with ESMTPS id d75a77b69052e-446513c1f7bsi141580431cf.89.2024.07.03.20.01.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 20:01:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) client-ip=198.175.65.9;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=gDNXJcOX;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 198.175.65.9 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720062075; x=1751598075;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7xazZwz0EnajiB5Y3BpYOkdjmqrqDIqJeO1R5Tf6FMU=;
  b=gDNXJcOXBOlqJKQ+bZ2X0cORPwvbXtvZItGOzBQlHABryeCmq3mtnCsO
   E8JQD/d1oxtW04nXKOFqlrCJEvr3KYbq+mpp14kKUQcx/Aw5XpphXQkyJ
   djwbWFXq4sqDpy+FR/Q7BluGsO/pBDbHfLe0Jfz3857KvCY8yf7vhwFLP
   jNDvD5PZK6hyBt1SPyuH6LYyQaE3IHj73sUUuBZAJ0nsqEEwF2tTSJ1UV
   0fMi3PBZEobxrobE+HIWPPv/JAGPqXm44IKJA7igMggnwYr0HdiofSpEe
   XpAPscunJpOcwVSc4fQEKDZQe49DxAZvf+30P18s8SM6N4zbiMAO+Eh4A
   w==;
X-CSE-ConnectionGUID: NhKAVraOQEK/oewI1fLUdQ==
X-CSE-MsgGUID: BidaqBACQqeo33LMKJQ0kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="39838166"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="39838166"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 20:01:13 -0700
X-CSE-ConnectionGUID: uK+DmRjmRO6RTIeeRo8L0Q==
X-CSE-MsgGUID: PAO0ufSFQueLjRECY+D3Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51052503"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2024 20:01:08 -0700
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
Subject: [PATCH 8/8] qemu-options: Add the description of smp-cache object
Date: Thu,  4 Jul 2024 11:16:03 +0800
Message-Id: <20240704031603.1744546-9-zhao1.liu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240704031603.1744546-1-zhao1.liu@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NvrPBrnkh6rY

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Changes since RFC v2:
 * Rewrote the document of smp-cache object.

Changes since RFC v1:
 * Use "*_cache=topo_level" as -smp example as the original "level"
   term for a cache has a totally different meaning. (Jonathan)
---
 qemu-options.hx | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8ca7f34ef0c8..4b84f4508a6e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -159,6 +159,15 @@ SRST
         ::
 
             -machine cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=128G,cxl-fmw.0.interleave-granularity=512
+
+    ``smp-cache='id'``
+        Allows to configure cache property (now only the cache topology level).
+
+        For example:
+        ::
+
+            -object '{"qom-type":"smp-cache","id":"cache","caches":[{"name":"l1d","topo":"core"},{"name":"l1i","topo":"core"},{"name":"l2","topo":"module"},{"name":"l3","topo":"die"}]}'
+            -machine smp-cache=cache
 ERST
 
 DEF("M", HAS_ARG, QEMU_OPTION_M,
@@ -5871,6 +5880,55 @@ SRST
         ::
 
             (qemu) qom-set /objects/iothread1 poll-max-ns 100000
+
+    ``-object '{"qom-type":"smp-cache","id":id,"caches":[{"name":cache_name,"topo":cache_topo}]}'``
+        Create an smp-cache object that configures machine's cache
+        property. Currently, cache property only include cache topology
+        level.
+
+        This option must be written in JSON format to support JSON list.
+
+        The ``caches`` parameter accepts a list of cache property in JSON
+        format.
+
+        A list element requires the cache name to be specified in the
+        ``name`` parameter (currently ``l1d``, ``l1i``, ``l2`` and ``l3``
+        are supported). ``topo`` parameter accepts CPU topology levels
+        including ``thread``, ``core``, ``module``, ``cluster``, ``die``,
+        ``socket``, ``book``, ``drawer`` and ``default``. The ``topo``
+        parameter indicates CPUs winthin the same CPU topology container
+        are sharing the same cache.
+
+        Some machines may have their own cache topology model, and this
+        object may override the machine-specific cache topology setting
+        by specifying smp-cache object in the -machine. When specifying
+        the cache topology level of ``default``, it will honor the default
+        machine-specific cache topology setting. For other topology levels,
+        they will override the default setting.
+
+        An example list of caches to configure the cache model (l1d cache
+        per core, l1i cache per core, l2 cache per module and l3 cache per
+        socket) supported by PC machine might look like:
+
+        ::
+
+              {
+                "caches": [
+                   { "name": "l1d", "topo": "core" },
+                   { "name": "l1i", "topo": "core" },
+                   { "name": "l2", "topo": "module" },
+                   { "name": "l3", "topo": "socket" },
+                ]
+              }
+
+        An example smp-cache object would look like:()
+
+        .. parsed-literal::
+
+             # |qemu_system| \\
+                 ... \\
+                 -object '{"qom-type":"smp-cache","id":id,"caches":[{"name":cache_name,"topo":cache_topo}]}' \\
+                 ...
 ERST
 
 
-- 
2.34.1
