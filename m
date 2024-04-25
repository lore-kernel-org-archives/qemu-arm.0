Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1178026ejb;
        Thu, 25 Apr 2024 00:45:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5O6I2nfKR0RUuxbYGNqxt1DXRY16gsuk5Fm8u4gojcn+v7NpbG9YrIrmW3Wdljk1No+h3AIKvdnfbVda7tHz4Zqj/h6R6
X-Google-Smtp-Source: AGHT+IHxoVsWKAGTp7BbeUn8MsR7JY0OhCA/tNq1nKi6EuA496Y8MKYr/7a6O+FT8oEHFaRcO6VT
X-Received: by 2002:a5d:5581:0:b0:346:305c:b0eb with SMTP id i1-20020a5d5581000000b00346305cb0ebmr3365794wrv.22.1714031141895;
        Thu, 25 Apr 2024 00:45:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714031141; cv=none;
        d=google.com; s=arc-20160816;
        b=OEPghH3T3QsoYdwarNfD3XsUJMSLHfr3AJq0axPoVTRuKAnaxiGYD4mk2Vy+DDPYbY
         d7pM7pxWPVaGIZ7B5TXNa2A7Wv/RIGL8JVCShc7DdZJ5DUe78odSQC+PgJ0fBNSPldHj
         0KUlmNb/+gaNuaQqHdTJ3aO7/KFD/K/FLW+GBha1if98sR3X/nvBmOxG3DMwOiwOHa7Q
         QQsxFR6rt8USSp6wKDsXJvjZwx1EgesegHFq9cKM3K45yA7eERZEFPX9K2uJm1+dVNYj
         Z72W3w2EpiMuqRD51t+3HLxAsUT5CEbEzDsBKAzgzW8lo+svv8bzXCXNTui47ZAEetLv
         p0kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Rq8d06m6s42X4h2ib9fAy+KULI9FU3Q5txL6pm2U1n4=;
        fh=WcrvJTPFaUUPGE57EAh2RrQ9m0Xo+/8f8wWFiRkEmHs=;
        b=IJtLfViQQx9K5OlJez2GJEyJu6COPTwO5spd46saa7x64to5MbvXbVrEn/MlQhtcIe
         frCZg3LjgJvipIBGCOfAZScWbBdPFpMFYk4DM/Gnjp9DUIQbH7VjG4pmNxoL4U9AxaHB
         F0Qmby9wstek4N9PnMQP7F0gNq/i6URrhakceS+xKMQh7vt4zNYwnOZY5Z1bUm8WRDdf
         uJw34jVFd14D0xZqFlxpaMy6MOc9uVEvnILojAAorAoT+iWbswH5ewV2x96Axan3n9an
         I2yu5eoHV2TLXxUTFlEhcXKJvuWJ8RgAEVmnRJ83qOlfurVU1XkKXV2kRT9gyA5gIqGj
         EA8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=M4ke973g;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id j17-20020adfea51000000b0034a74fc67b7si4962439wrn.980.2024.04.25.00.45.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 00:45:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=M4ke973g;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
	List-Help; bh=Rq8d06m6s42X4h2ib9fAy+KULI9FU3Q5txL6pm2U1n4=; b=M4ke973ggf9J5/p
	+c1KL9nqZalPyKaANSq98z/Ddboyx0H4d4oS8lRFlfxUbpdDwFCt6lbKOMc7JOL/9zO5stwugHk1I
	JICNOKtRbhI5I4gloqfcVKOwMDrs1TH4cQCZz31V2BwdM/Ot498SWSToTAe2IxShO+uYK/GYUDBNx
	NU=;
Date: Thu, 25 Apr 2024 09:46:53 +0200
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
	David Hildenbrand <david@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH 20/24] hw/xtensa: Include missing 'exec/cpu-common.h' in
 'bootparam.h'
Message-ID: <hp5oea7xa673uxb7jqf3m357bjvheehbjxn5ktxqooa3cowvq4@q3hx27in2tyj>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-21-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418192525.97451-21-philmd@linaro.org>
X-TUID: kdN+yIxdQ3Ue

On 18/04/24, Philippe Mathieu-Daudé wrote:
> cpu_physical_memory_write() is declared in "exec/cpu-common.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/xtensa/bootparam.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/xtensa/bootparam.h b/hw/xtensa/bootparam.h
> index ade7891ec5..f57ff850bc 100644
> --- a/hw/xtensa/bootparam.h
> +++ b/hw/xtensa/bootparam.h
> @@ -1,6 +1,8 @@
>  #ifndef HW_XTENSA_BOOTPARAM_H
>  #define HW_XTENSA_BOOTPARAM_H
>  
> +#include "exec/cpu-common.h"
> +
>  #define BP_TAG_COMMAND_LINE     0x1001  /* command line (0-terminated string)*/
>  #define BP_TAG_INITRD           0x1002  /* ramdisk addr and size (bp_meminfo) */
>  #define BP_TAG_MEMORY           0x1003  /* memory addr and size (bp_meminfo) */
> -- 
> 2.41.0
> 

Reviewed-by: Anton Johansson <anjo@rev.ng>
