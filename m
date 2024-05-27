Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3052031ejb;
        Mon, 27 May 2024 02:13:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzrqA/p79+zaen2uuTbQ+0FjAf6tucRPt7YVWMmLVmEDai7FuF1i35gufhbQGBRiKxWXGwX4/urGTl8u5afwe5I6UkGjFA
X-Google-Smtp-Source: AGHT+IHdzwE9MIEcvpRLUQgX5oemfuIRfln2bM1mUFBHqmvITBlU23DvG2bUBBwzy7Lo3a1KCwzS
X-Received: by 2002:a81:7303:0:b0:61b:91e3:f971 with SMTP id 00721157ae682-62a08ed7255mr87677347b3.39.1716801197962;
        Mon, 27 May 2024 02:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716801197; cv=none;
        d=google.com; s=arc-20160816;
        b=tMT9Spk1AyqYknRrhvoUrlGOPZ9Hg8gGePTVJyobZDh7/yuCRa1EodTq+OFTthgan1
         D5GjteAG/IZuFWKiQiBAoSmGpNn8zU6ZMwHK1YLeeC05WBcaImNFooixdhaoflseecLY
         MiitVuL9XbXW5cEPeQsiAJYvC+q2iNVjyGgdkS2uqZk9lWSiLzKBvnASULlTDsVdDVM8
         6/KbDFkTVytQneI1TZKbkepeXcW8bq+8TREcuHf5BC6DbiJJlYTcnAnd4IBuEzzSHFM7
         otKEHvsb0ZfugqyB2DkDZ0VJkQcPHrnu/66Jfemz6RAMJt6QoSksD66S6UfCl25y9l2n
         JsWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=iVvNAoHMNiJoUUyHKjLaS+k+f4cnS5B2Jr44bAML6Pc=;
        fh=8HrJMzH/t2XErAq17HehcZAm1OlzjMx3QjRMdNLRncM=;
        b=gP+G8icEwtIVx0Rkv1A4Hv0nIeYV382MKR94jNjUNzuuUrqolA+m0faU0F6BamFRrY
         qjul+ShiHgltIWU6v97YbjUBM1gdEI9wB+p1TNwYhDdE9U4pivklbV2I/R+hxaXpqNS9
         oOIV7uejl5WVW/k6eW12cWzCwviE2pTQe6s6RTnP+NZ372kM4yBOpWs48GXNHJJjQxxm
         VMivx45f2tvPTGgSFZnVLM5dZUy25r7nTlvHxlWiHHoE4JsEavJNZkziMIxY1gkwCPfJ
         iDHuKJvpk8/hhNIDE8+Sks1IUksQO+rWEypEb5M2TKwR9+zz+d96mdlEkfdRAbs4oPrm
         lwtg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=gpquwO89;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.14 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <zhao1.liu@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.14])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac070f0ee9si77160386d6.211.2024.05.27.02.13.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 02:13:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.14 as permitted sender) client-ip=192.198.163.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=gpquwO89;
       spf=pass (google.com: domain of zhao1.liu@intel.com designates 192.198.163.14 as permitted sender) smtp.mailfrom=zhao1.liu@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716801197; x=1748337197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LsG0NLsb5plzK+avJgF7+hm1ZHCZyBHLoqlRGeaxzhw=;
  b=gpquwO892thxtSFZZBrV1WE+1MzTg6DHAhfmhb6hgpMvZP9KIzKWXFH9
   9ZkX94y2OYxEWGQTfwah3N56MaLRUp3DCNJW6LEMfJIzlNafDLqGRPYFO
   AbjtCqtN36AI3BlMYxg0wM1in0L+hZH9tF0Iuhvx0tWoXdmxPkCJrSnPG
   Apd1JiNHRFrPYNX6WwARRkXNXPrypiH7CsHMl7jQX0G468N4iUHAojsqM
   ir8CWsG5NkO8tlM2ZbMDSNwng7TMCc4s1ZnbHWljTD7Sfsd1hyzXR6bJn
   M+zdjnHYJm4wOKlHqM0YVDRQmZtAr9AGkRjRuhk2t/W3ZTj3vtgjoXkD4
   Q==;
X-CSE-ConnectionGUID: +yJ3HF6HRNaOkAtUOf4Qpg==
X-CSE-MsgGUID: eLRobHZeTLWH29GqkA5UzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="13331230"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="13331230"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 02:13:15 -0700
X-CSE-ConnectionGUID: n0LwNNVDRLSA5yHjI2bAxw==
X-CSE-MsgGUID: ToIL70hdRumgFncpPohcaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="39673742"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by orviesa004.jf.intel.com with ESMTP; 27 May 2024 02:13:07 -0700
Date: Mon, 27 May 2024 17:28:30 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, maz@kernel.org,
	jean-philippe@linaro.org, jonathan.cameron@huawei.com,
	lpieralisi@kernel.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, imammedo@redhat.com,
	andrew.jones@linux.dev, david@redhat.com, philmd@linaro.org,
	eric.auger@redhat.com, oliver.upton@linux.dev, pbonzini@redhat.com,
	mst@redhat.com, will@kernel.org, gshan@redhat.com,
	rafael@kernel.org, alex.bennee@linaro.org, linux@armlinux.org.uk,
	darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
	vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
	miguel.luis@oracle.com, salil.mehta@opnsrc.net,
	zhukeqian1@huawei.com, wangxiongfeng2@huawei.com,
	wangyanan55@huawei.com, jiakernel2@gmail.com, maobibo@loongson.cn,
	lixianglai@loongson.cn, npiggin@gmail.com, harshpb@linux.ibm.com,
	linuxarm@huawei.com
Subject: Re: [PATCH V11 0/8] Add architecture agnostic code to support vCPU
 Hotplug
Message-ID: <ZlRSPuJGBgyEUW6w@intel.com>
References: <20240522211111.232114-1-salil.mehta@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522211111.232114-1-salil.mehta@huawei.com>
X-TUID: Xrl6sFYG2GZg

On Wed, May 22, 2024 at 10:11:03PM +0100, Salil Mehta via wrote:
> Date: Wed, 22 May 2024 22:11:03 +0100
> From: Salil Mehta via <qemu-devel@nongnu.org>
> Subject: [PATCH V11 0/8] Add architecture agnostic code to support vCPU
>  Hotplug
> X-Mailer: git-send-email 2.34.1
> 
> Virtual CPU hotplug support is being added across various architectures[1][3].
> This series adds various code bits common across all architectures:
> 
> 1. vCPU creation and Parking code refactor [Patch 1]
> 2. Update ACPI GED framework to support vCPU Hotplug [Patch 2,3]
> 3. ACPI CPUs AML code change [Patch 4,5]
> 4. Helper functions to support unrealization of CPU objects [Patch 6,7]
> 5. Docs [Patch 8]
>

Ran QTESTs on x86 platform, now this series no longer breaks x86-related
tests, so,

Tested-by: Zhao Liu <zhao1.liu@intel.com>
