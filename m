Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1559211ejo;
        Wed, 13 Dec 2023 03:46:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG96R14rYO1OJJSxrbam4SCzTCfuGehUAszTY/lo784ALXtx+pK0Q/7wlDSV0cRgD+D0Y9/
X-Received: by 2002:a05:6512:529:b0:50b:ee9a:4a83 with SMTP id o9-20020a056512052900b0050bee9a4a83mr3223124lfc.78.1702467972659;
        Wed, 13 Dec 2023 03:46:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702467972; cv=none;
        d=google.com; s=arc-20160816;
        b=fPk0aHze6Vu80+HhW4DMC1RxwSvctz55Sww+sXuQhsnOkyzf1mtZ7itx6dpWF9K1EZ
         B/jk6HBl4JCgLZdFC+R5CKMvtrxFgmgVFAjx9Hwi7d1nx6uy/r/QxaNWsaawlWTXiZBz
         Qhym68RyXbA2HNNqxjeNTXeQpLFWjUKmK3EfX8vs7DLCRLifUQOHMxcFN1DI5S1mVxyu
         3k8/uuQWWtJPAhDoelQColUbBUd/6yYtvmhUKSv7DBgLlMhfJBpZzKgWR/DqFbnPtOMk
         vDYLsj2K/9HISZYkH9jQWiDiQgvwDDLZDerpSE6pv9nw8ZHUel5/0yS+eYeh1EwKIODo
         C6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=HtpOsuYUMuv5LJ+ykgRi0X0Di76O8xp4u68L9ecrMHM=;
        fh=XLW1C7I6Sn5JpHNpLRAk07iGFZcHqLv5S3LIVLs4uik=;
        b=mRulNHhphW1PeNQIYYQe7hPuDi/UQ0DBAWr/XIWPH705Pyr/IWJsM5YVe9n8/+7NEN
         dDGrNJ8w4GN+qx8UH8t/6ad5b+DKqBfvpWZmcr2Kuk17fw91omuYK4kVfHt3Wn4/73iA
         8JKbRrcrGrdLqHuoQ08WQRfC6aLewgkA+99/AWaCPYdTCHZ2VIQbZhqrpS36+rnJHa0Q
         an/4S66uNqWgqq+u6bKdsA/6UNxSfwhJLpjDSi7Vc8yS5PelP808tJhMsPJuNEWVKHNZ
         wxlfSyBGA7UV4IWgwIgesAVyCv4UhlcrnjGjKUta8bEoh+7biTisZXeUdOaLRYk1Us51
         2jHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=nXDy39yo;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id o15-20020a056000010f00b003330748208dsi6246889wrx.763.2023.12.13.03.46.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Dec 2023 03:46:12 -0800 (PST)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=nXDy39yo;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HtpOsuYUMuv5LJ+ykgRi0X0Di76O8xp4u68L9ecrMHM=; b=nXDy39yoOPDL+b6DmXloOz8a/M
	bjUS7he5ag7pKfvlBt7Tx1Obt3xYNwprv6mH+lEFgalkTz6hTXufwBrEEIptPDbeVOIZmtO4HDbWY
	7Yh/JqnPhMJTjFXtjubvsY+bm65c5CbGIq9bNQaiXLzYbqy9PhmUWepffr/vooKfLcgs=;
Date: Wed, 13 Dec 2023 12:46:03 +0100
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org, Brian Cain <bcain@quicinc.com>, 
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Warner Losh <imp@bsdimp.com>
Subject: Re: [PATCH v2 08/23] host/load-extract: Include missing
 'qemu/atomic.h' and 'qemu/int128.h'
Message-ID: <hzcm67xbdgtskwqs2vsn6rbpb3s6iftabl5awgnkc6y6jyyxc6@qf3fvojrkxoo>
References: <20231212123401.37493-1-philmd@linaro.org>
 <20231212123401.37493-9-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231212123401.37493-9-philmd@linaro.org>
X-TUID: +wh7Gk8g+Cvi

On 12/12/23, Philippe Mathieu-Daudé wrote:
> int128_make128(), int128_getlo() and int128_urshift() are
> declared in "qemu/int128.h". qatomic_read__nocheck() is
> declared in "qemu/atomic.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  host/include/generic/host/load-extract-al16-al8.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/host/include/generic/host/load-extract-al16-al8.h b/host/include/generic/host/load-extract-al16-al8.h
> index d95556130f..6b47339b57 100644
> --- a/host/include/generic/host/load-extract-al16-al8.h
> +++ b/host/include/generic/host/load-extract-al16-al8.h
> @@ -8,6 +8,9 @@
>  #ifndef HOST_LOAD_EXTRACT_AL16_AL8_H
>  #define HOST_LOAD_EXTRACT_AL16_AL8_H
>  
> +#include "qemu/atomic.h"
> +#include "qemu/int128.h"
> +
>  /**
>   * load_atom_extract_al16_or_al8:
>   * @pv: host address
> -- 
> 2.41.0
> 

Reviewed-by: Anton Johansson <anjo@rev.ng>
