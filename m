Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp999732dyc;
        Thu, 3 Jul 2025 22:55:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUYJknYeV7pKTCIeMqqlvG+bwQKt9YU5yyjLSTkwLW7Gh7GHH3mLbXVwPpgMc5bTSzvwYsIDh3cJ+GD2w==@linaro.org
X-Google-Smtp-Source: AGHT+IFLxzV0mHOGRZ0Jugh1BhtfVhPThl++hdPNaIua4BBFVoH+bU337K6ZB2XSKZaMyjQe7oMJ
X-Received: by 2002:a17:90b:564e:b0:313:352f:6620 with SMTP id 98e67ed59e1d1-31aadcad20fmr1409716a91.4.1751608504315;
        Thu, 03 Jul 2025 22:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751608504; cv=none;
        d=google.com; s=arc-20240605;
        b=SWx7DsYhw9qdyjSllCyEu2W+uRUduPv0HrviozBIMuGdwCKXL2nG6mwC6mhEBspOn0
         zVmSqfQpJIdvX1bN5KyUY2X7v2hdUm5+RBgGjgCo/7BUFRpz9oAx2vM+mAaWmYRl+5wX
         3kMgdTOtNTcpcbtPqBy9RJ7rtQN0w5lceNBaQw6t8PojaKEXBY1v0vT62D6K4q0BXmsJ
         GkDdf6OpNLpqSJFNQwvp8+0ei3GICJQfgiWudT64D0UHBZMvQMM++bRlXbK4DiuzR4iu
         VIdsyJsXg7+2L6X/95pWs7fLuGvtk5IbDOP4VLdGkY/lSSVVh6MZ3kxuJ0Nj34Gg4M0C
         BUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iqprXucpiHTUP3E4fOonmrJOeHi7DBbG3psI4kJQzF0=;
        fh=u4eNVWyLhG9hfmGg+PSOApp2kLdV6Jwvy3eGSQoZvGA=;
        b=cz1ij9+pZzSCDTb6s+ypG6taLGmMLYRD+TMrKCs4YGjkLX1rsecJhZNr9GaLs+59Ju
         iAFs8kY6RCGa1Hq5zwzcC3JruZjeFsPyp8MjBHYERi6STiEVh2bfq3ZczBLzMz32U0l4
         XYNlQQ6AcGEisWK8z5ia6zm1fxNTQznlVpkX6PCskGpjHUek0Z4AfGF5bHWzSLzeFi1U
         7CDoYZL6cJlIiQT972gqXfwe6c5nxd9fOErj3KISGyB9hf4lOkCky6tuB7eV3aeOGEHE
         BoXnbmeX7McvL9HwSzqlkqw7O4hxa30s+MIY8Zhya8K4LIOQs0wx01yq9M1mRJTWVzMC
         DluA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=NCLSSL6A;
       spf=pass (google.com: domain of xiaoyao.li@intel.com designates 192.198.163.13 as permitted sender) smtp.mailfrom=xiaoyao.li@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <xiaoyao.li@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [192.198.163.13])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-31aaaf69922si1709373a91.131.2025.07.03.22.55.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 22:55:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of xiaoyao.li@intel.com designates 192.198.163.13 as permitted sender) client-ip=192.198.163.13;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=NCLSSL6A;
       spf=pass (google.com: domain of xiaoyao.li@intel.com designates 192.198.163.13 as permitted sender) smtp.mailfrom=xiaoyao.li@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751608504; x=1783144504;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=o67P1q5Q52pVrNMFWAYOas0D/uvRyXq8gx1ScWIhf8s=;
  b=NCLSSL6AR+VpxfCDxhFdrUu90qDXS6VCLsk+vRKla7uMIpMQtknaNEZz
   IlOGUqb9x8A7yd2OUn/JwBNhGLz6iY158LpxKrnpx+fxSQEa4GH9bki9j
   +NEPKhmI73IMA6FeXkzkpOLYvsxSZ/cnzX6d3HrDmWzPvuUQzssIHKBLD
   iHDurIihy9dabTsGpPQUlVfnLyUxvBA73Fcq9ooMjerjJxCNTt7UxuEG/
   3s+kjlWXXqKfyN/i4EGEGty+mnE1Gel4zzuoIuDpDNl1McAbMoCodCCai
   SoXUDOAJ18TdAGAFcSGqUFPhrmiQx02VS53P3jhqdhlUmZO6lt0T8zqNi
   w==;
X-CSE-ConnectionGUID: 46QXjhgnQvWrViNaZegxKQ==
X-CSE-MsgGUID: RMN4+jpeS0W51gQYV1fFwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="56565441"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="56565441"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 22:55:03 -0700
X-CSE-ConnectionGUID: o/YmJJ0nTg+8xY4j0L/Exg==
X-CSE-MsgGUID: 4wLXsiZHQJ2VcNC5xQXX1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="159111742"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1]) ([10.124.247.1])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 22:54:59 -0700
Message-ID: <7b981087-5338-4728-a3e7-981f347c3862@intel.com>
Date: Fri, 4 Jul 2025 13:54:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 18/39] accel/hvf: Replace @dirty field by generic
 CPUState::vcpu_dirty field
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20250703173248.44995-1-philmd@linaro.org>
 <20250703173248.44995-19-philmd@linaro.org>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250703173248.44995-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: U5lxlZ9Xp88F

On 7/4/2025 1:32 AM, Philippe Mathieu-Daudé wrote:
> No need for accel-specific @dirty field when we have
> a generic one in CPUState.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
