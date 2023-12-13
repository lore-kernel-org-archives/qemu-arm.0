Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1623627ejo;
        Wed, 13 Dec 2023 05:38:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE05/ptv4Ck7HsfGXL0rgfEmoMejSFkmM0+m4gP6J40bxB3RbF6w5jpDC1oy2ad/mY05ScV
X-Received: by 2002:a05:600c:1d1f:b0:40b:5e1a:db94 with SMTP id l31-20020a05600c1d1f00b0040b5e1adb94mr3026936wms.53.1702474704067;
        Wed, 13 Dec 2023 05:38:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702474704; cv=none;
        d=google.com; s=arc-20160816;
        b=BiJopbG++6tHjJ5/FG+Tj5+F7wF7Qi0j62Htj/RAyw0jc7wxXVw0i4+8984B3eGhpi
         KKxSAXTYSKmXBepjpz3Y+YArhN8vsxWnMsftJRZZU4/fCZrWP8qR6axO5yne/ej25tOa
         zIgtkzIPgq8szgvfeVLhLGphe3bwfFIsvsqGtmmCnhuKO79F7O1p7+FSlyEoKHo5a2PE
         TB2C4tYLTdaMTLJ02hlMa2UFWioa3l9EeDI40dA2K64qqX5by7bJWSydnWViHzVXQd/7
         3R76ccr7xPXoY3ZEjhmgmaLePLpjTiSVBa0rkviEfIVxAfSDB8sQuOAKf5zhZdqK0f1v
         c3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=UUEDryXTf/4wJmlqQ++H9789dv4kj1oMrzKnsjqUFfI=;
        fh=XLW1C7I6Sn5JpHNpLRAk07iGFZcHqLv5S3LIVLs4uik=;
        b=bAL8rMleHMSWyAF/UI3iGqwjh4Y09STqnrswcJuMMp8/zdwWkRIiglo9JvPuIj/Axt
         SIukuM5YT2lkh9kEmgOxIcBEMD2QENcJ3siNphGovGKVNwxrXgXY1ut4dzM5Hzi4GlH0
         iu+GBqWIOP6XHOoX5A6DK0Cy0yFptthIzM3ewjhTgE3JC+w7E1Av5+6PFDIsHUZOXEEu
         mD7/TiAVw+DUFo3JflJ5iIQ577LFQjX7AbctTl45xUkMVyHmsv+LqfF83L984FYKGf85
         bwVisLjPx0Wh2jNF3Mq0AAVP+O1FN5wotshI+QCNzLu4cglfqKiEsR+47M0uaDXgqkAU
         csUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=NgYsU72U;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id u18-20020a05600c19d200b0040c5c86c26csi622076wmq.207.2023.12.13.05.38.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Dec 2023 05:38:23 -0800 (PST)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=NgYsU72U;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UUEDryXTf/4wJmlqQ++H9789dv4kj1oMrzKnsjqUFfI=; b=NgYsU72UFCC+I495Q//dJTEAVH
	X1iwOxiMTBUGCHRHfRTOdzo8NKiHboOjKMH4jf3ABc5VCAYVWoWIDvu3jkx3kVrChL41r/Aw6Vf9H
	y8Q/BUa+GbQEcVDlecqOc4ktXFl3maCIxdTpVU3WtaXPC/QWUVtBEyfi3ew9SkfITlIw=;
Date: Wed, 13 Dec 2023 14:38:14 +0100
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>, 
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Warner Losh <imp@bsdimp.com>
Subject: Re: [PATCH v2 11/23] accel/tcg: Include missing 'hw/core/cpu.h'
 header
Message-ID: <i4jss7cf7mnol6va7qwxuulkkk574gocpx7zumeiqymt5f5ap4@npfce2ik7csv>
References: <20231212123401.37493-1-philmd@linaro.org>
 <20231212123401.37493-12-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212123401.37493-12-philmd@linaro.org>
X-TUID: JzcYTjAoMXwK

On 12/12/23, Philippe Mathieu-Daudé wrote:
> tcg_cpu_init_cflags() accesses CPUState fields, so requires
> "hw/core/cpu.h" to get its structure definition.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  accel/tcg/tcg-accel-ops.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
> index 1b57290682..58806e2d7f 100644
> --- a/accel/tcg/tcg-accel-ops.c
> +++ b/accel/tcg/tcg-accel-ops.c
> @@ -37,6 +37,8 @@
>  #include "exec/tb-flush.h"
>  #include "exec/gdbstub.h"
>  
> +#include "hw/core/cpu.h"
> +
>  #include "tcg-accel-ops.h"
>  #include "tcg-accel-ops-mttcg.h"
>  #include "tcg-accel-ops-rr.h"
> -- 
> 2.41.0
> 
Reviewed-by: Anton Johansson <anjo@rev.ng>
