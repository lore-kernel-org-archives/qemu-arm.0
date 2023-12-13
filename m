Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1627163ejo;
        Wed, 13 Dec 2023 05:44:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFd+BQ6o/FXHz3ujhPIpBi2R/MZY/glxsCNHTvnwCTwbij6WykSAaHkK0og6Xkgrkrxeevk
X-Received: by 2002:a05:6000:105:b0:333:db9:47d2 with SMTP id o5-20020a056000010500b003330db947d2mr4815537wrx.66.1702475079437;
        Wed, 13 Dec 2023 05:44:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702475079; cv=none;
        d=google.com; s=arc-20160816;
        b=l+MTobEeMMbJ9Fl3OAzV2NuYH5XgRlWTbVySglBo+IWwF4+QgFRX0ytROY4lAsbxn9
         Ayi1eJO4MCuBEjJWJMcUU2lebQsK0uSsh2QJQkBMkLQaSLAeT8/w+jLVQ8dKdoZn7Y1g
         eBWBge7pZj/H0mxPrqNFxvYXqLG8dj9SaBXZEfNDWT6aJZOSAq6qPbG8hCdZBKHJMhur
         z4HanFYLIlI0t3WHF8whAYdqsMNfkd1QzIdgM2zhPYOXE11i5WyS2DxYoGXauN4RU25x
         Kz6ZKKcLUdnIq7kwh38ALqt7OjJmV/GWQcylr2jwx74kWQJvbX1jHrX/s9cPLL1Gu7PZ
         dqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=QvRrr1ggHR1iB7s/vU//ZWm9HwdfpH6rvLKIBIODlSo=;
        fh=XLW1C7I6Sn5JpHNpLRAk07iGFZcHqLv5S3LIVLs4uik=;
        b=05C7rbqeOAFE2v6jFmmk09s4UW8FS0KjvS9orrEqhtP1rAxCenDfC0K+qHFlT/XA7s
         rv3i9mR5sCGxn2jp1c4XV5BqCapr5HMtQ2hUmN9mdKoA69990QwfGuKRXJOKuzGMjMCg
         s18oNb45HI3moqhWoI+iEWYk2nE4dsYSJ5xm1bzQdGPCXuABWrKzHdMeSaV0Yvz0H5CK
         WhQ+SfRCV8s4vxNyJDkXalT4nS3J+4bUJroPSXvz8wm0MFbaJgw08YDMRkbxqeRSqpiO
         uu6WRIKzpGriioGy7/MvcIbgI72qsz86WbTDF86X4ZKI4/qTaMchDfTNcRzGB7fnMvIJ
         mm8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=qCfBEgF6;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id i8-20020adfe488000000b0033339d3d059si6487634wrm.827.2023.12.13.05.44.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Dec 2023 05:44:39 -0800 (PST)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=qCfBEgF6;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QvRrr1ggHR1iB7s/vU//ZWm9HwdfpH6rvLKIBIODlSo=; b=qCfBEgF6uelWl7gBcfX/Dv/eJx
	u78aQmU8U0Cr/A9VXFWq/sSX0SVnhErEfvaixl9Bt/G8Io9UAuyPSJtMZwje4PUYOUczCkdnS/ZKF
	OWolvUZJz+tF8zq2dKRYf6GOg7J/yP2FKKtj8onnxgHfqvJE3mhwRMIGO7UwpyVxLZy4=;
Date: Wed, 13 Dec 2023 14:44:30 +0100
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>, 
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Warner Losh <imp@bsdimp.com>
Subject: Re: [PATCH v2 12/23] exec/cpu-all: Remove unused 'qemu/thread.h'
 header
Message-ID: <gipmgja5d6h2wii4m23ae3rjdr4qliabq7f6vfuhn7akrajsu4@yyztbzwbnwbh>
References: <20231212123401.37493-1-philmd@linaro.org>
 <20231212123401.37493-13-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212123401.37493-13-philmd@linaro.org>
X-TUID: M3JwLQmvrqgM

On 12/12/23, Philippe Mathieu-Daudé wrote:
> Nothing is required from the "qemu/thread.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/exec/cpu-all.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 9a7b5737d3..26b44ca125 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -22,7 +22,6 @@
>  #include "exec/cpu-common.h"
>  #include "exec/memory.h"
>  #include "exec/tswap.h"
> -#include "qemu/thread.h"
>  #include "hw/core/cpu.h"
>  #include "qemu/rcu.h"
>  
> -- 
> 2.41.0
> 
Reviewed-by: Anton Johansson <anjo@rev.ng>
