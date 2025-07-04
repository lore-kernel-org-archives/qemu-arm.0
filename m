Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp990197dyc;
        Thu, 3 Jul 2025 22:25:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxpuPeiMFQ42xyM7vZc0Te4BK8sRsjltqcBlpjdrcIqUqbytKpQ+E1xoq723Jntj0xQhZJVYUZvyXVEg==@linaro.org
X-Google-Smtp-Source: AGHT+IGo0iAjl3CS2wlQICmZ0Kqzftw6MAlhJNNOPgenhiEIZIz05WqQPq+xTKiJ9xZ9QNGjnG12
X-Received: by 2002:a17:903:98b:b0:215:b1e3:c051 with SMTP id d9443c01a7336-23c858d019emr22960975ad.11.1751606755429;
        Thu, 03 Jul 2025 22:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751606755; cv=none;
        d=google.com; s=arc-20240605;
        b=Y6DnnQiwS6iLvcmtuNQ2m0X/hc0blyLgF4oqgiX4M79tb/jMIp7Dx4+P4J2337fOw6
         b7gEVea29zmGwvBuiuen0CDbOmTfhxlFedONCm2grUo6ezaOqyFKmfJLJSvZ8ihGSf6j
         H/j7iSwMm+2DfeAVtzkY0Legy3Jjl2ZLfPCU9VGJdzNCiD5u8wH9WajnhjbCI4whm8qV
         X3XFPm/wOp4HKuVB3llAgMSGDJSbLi8M6j2IaaKUWScJx8VtLlZe/gDSmtcIbSxCCwbC
         M1J2EIKe7zCnYDc4/KVdui9qQxXnASn+/9YiJfsechMfmV1evRN+abC5c/HtuX1b44Cm
         kCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=A4A3t4vyMgspLAGFad0YVJF8RB/+5AUwqvncMU/Qr54=;
        fh=pkOP4suNjo1Eb1J8zkfHcs5JFE14yqbXGA0wOP/kg00=;
        b=BuXVf1UeTkpu0va14ez44Kzl0aTOe2m82eSM7GpSEp2Xap7+BAdySFBzYqJwKA0rjM
         BgOLRgDpO1oe0RgLKjngZrDoQQYz018pJAgOOeNfE/OFxwD2oGwq437mgEYKqtjbEZ6S
         m9/lE1vHV/5mAklYuRn4A141o7DtjAwI/Ex+u1BzbkCDfUS1fRde7hzC8C9vjjbzUSCf
         G5WqI7JF7n78Hhtaoi8157/ps+6pblb6fE1Uj5WAfSJrhREX5txz8KxxwGLkAdaOD4+s
         1Xm9o/J0Z+Q4kibDq0q/PLAfXhf5yVkHrNkeCvNR7/ugMQq6d67e0xSSJLBhEIIEuiAY
         nSXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=NCQUIF73;
       spf=pass (google.com: domain of xiaoyao.li@intel.com designates 198.175.65.14 as permitted sender) smtp.mailfrom=xiaoyao.li@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <xiaoyao.li@intel.com>
Received: from mgamail.intel.com (mgamail.intel.com. [198.175.65.14])
        by mx.google.com with ESMTPS id d9443c01a7336-23c842cff38si16246955ad.25.2025.07.03.22.25.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 22:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of xiaoyao.li@intel.com designates 198.175.65.14 as permitted sender) client-ip=198.175.65.14;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=NCQUIF73;
       spf=pass (google.com: domain of xiaoyao.li@intel.com designates 198.175.65.14 as permitted sender) smtp.mailfrom=xiaoyao.li@intel.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751606756; x=1783142756;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Y8KLvXPonrRqtBHQQRecaJVFF8I82/dnoB5RT+uLyws=;
  b=NCQUIF7395nbTCduYESLMDDTYgCvwQJ4pIuK2aTwSOAQ/WEUuZPWHru8
   wYrnqnhCZVLlaLDE9PNxCABugs1II+m/3N23Fo0QRlX8qrDFe+DUbDffE
   OFuAoi5wRDyzsmaSSCj0Sh903XyhYQc+lOz7tcoKL05lkst0VHjdgki9t
   dU4gCGgtRsnVx381r00pURiPpYEL7EG0FRAzEGmD+iLtsVKatiaiXuwDt
   opQuEewDT9HlVjy1VaSsEQe6wZ3C5s1VfvO1jt45ZFwhEAV/Q4chDpH0F
   jyvmKnaLIzjuk4y8geM6U6Z8b75Jkh9IwWNchV0hEALplsLyDyIkMiE9l
   g==;
X-CSE-ConnectionGUID: wpoVqHw8QEqHfZCr8LSxkw==
X-CSE-MsgGUID: 2S3tgcuwRK2D0yektSWHpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57712972"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="57712972"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 22:25:52 -0700
X-CSE-ConnectionGUID: qTBgox/ESaKWV0DXoLhXng==
X-CSE-MsgGUID: rVgbMKKyRfylaqCgU0uQMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154921543"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1]) ([10.124.247.1])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 22:25:35 -0700
Message-ID: <e7e930af-8b27-4d3a-b693-b451b22ca1b0@intel.com>
Date: Fri, 4 Jul 2025 13:25:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/39] accel: Move supports_guest_debug() declaration
 to AccelClass
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org
References: <20250703173248.44995-1-philmd@linaro.org>
 <20250703173248.44995-13-philmd@linaro.org>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250703173248.44995-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jf85njzD6z+P

On 7/4/2025 1:32 AM, Philippe Mathieu-Daudé wrote:
> AccelOpsClass is for methods dealing with vCPUs.
> When only dealing with AccelState, AccelClass is sufficient.
> 
> In order to have AccelClass methods instrospect their state,
> we need to pass AccelState by argument.
> 
> Restrict kvm_supports_guest_debug() scope.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
