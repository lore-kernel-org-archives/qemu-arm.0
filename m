Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp41022lfb;
        Mon, 11 May 2020 02:54:31 -0700 (PDT)
X-Received: by 2002:a2e:6e13:: with SMTP id j19mr9855838ljc.292.1589190871495;
        Mon, 11 May 2020 02:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589190871; cv=none;
        d=google.com; s=arc-20160816;
        b=W/fSju91oMIGN2xwhNSRRP6VsqVLPDjGyITNSgKh2lEjx8kFYOGhO1HwsgFmPyRTyz
         T24KmJbkjkDzpv3TAOyj0EFJdRBcXpmRWU5qYf0Yqvr3L9PV910tB5oWfmKoupmdVr0R
         S73ikmnnHOXoBL4no2fRqjtNUZGxiH6inlJtY50XqQQ9VFGYiuYTB5S4bmnq30N5+XPs
         vdEkH/WmENlH2MuNkFiW+siyyWsA/Yq6Vsn+WLI0h9C9LSZ3rVHFk4eFl7F2xAmhgMWM
         uSCWj3YKxzLaTV1Dk7qDCwv82yWSTqyPguhoG2VOz72Ew2y8kn/ojEXMDsnWUtd8WDSG
         VNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=tiyyfkVX+Vv+hcjnSdTeDu1LOtGQ32sOhl+9tc0AzN0=;
        b=eHywjzm004dXoT5ScK6SAAB0HeLTcBjmWL1NzvTmKVUtd7L202VulWIRkQRRQG4JJe
         xWGpbGzUdWvUe7GEXp/j+xdHW9Cb38jUBWQ4J3uZ0jVDAepcaNf+vusVqpX4HvxjtNYE
         nQ94hCnlIbDxsXPwN7Rh7SmrnjeB3gZGbw27UNJz4VzESR64JUdZkwqVU7txX8k8I/Dk
         jRsbemarrehW6SI583KHbLzmMkRIVPJQqpUuMxbwFsAXLj7Xis9qhYzzq/iAZghbetuy
         nHOEAM3gMa1dIDAdjJy5EqSPGW3gyTvzJigoxnggMvFS5FuC8T6P0Apt0BoEOnI0Bes2
         G5iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=fMKMwzHK;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b12sor5331200ljo.25.2020.05.11.02.54.31
        (Google Transport Security);
        Mon, 11 May 2020 02:54:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=fMKMwzHK;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=tiyyfkVX+Vv+hcjnSdTeDu1LOtGQ32sOhl+9tc0AzN0=;
        b=fMKMwzHKAL+cC6GYL7w6Jo1hhb5zYEWOu+Hm1gsRT7aE0QuTlXpXlcee6I1vIfHTZC
         Vo9VeSvSNJboZSAY84hXz1eBveXwKvejjHIovRw4E9UfTyYUg71VuDjwlGLgEGTSpzey
         gcCq7dQYd/ajywcWswVmaM5wJQSPlaC4vZTjAmuEVpU5L83wA3QvdbZMz8izaqS5NSTm
         oofor2fr+mK8xGjfS7pD7W4SNCyqQdNEB4eWGL+hLA7IQg4UbP2qqb7gMdvDlICBAqFs
         zW7MSa0A1LOrKMzwxLhYfNPT4H0V3Gf4h4sUii3tJFgofR40LLf6Q3o+UA9GeDOw8op9
         sqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=tiyyfkVX+Vv+hcjnSdTeDu1LOtGQ32sOhl+9tc0AzN0=;
        b=qMDb+ZwcAONInqkZ/97vqJL6R5Pv/1g//ijaHW3GHxDM/9qgFzNB5QWuWPx5uTxzP/
         EO+prJsyr/JOppjPZ1JkmBzWG5kY4RJC8/2bqB5JTVyWlvVCUl77HzNfBa00DYFz5xD3
         pojMZ8IbFsNzBeD7R5jpmSjymmZ6gQkv/FkrLIklrMY9W4R65NPmHZ7ybf6QTpneaIzA
         ZiTxQmjoQxVb/vuWjEjrVKNEq30JSzHryG7wA6nWdvl1HtaQgpfAmrIsG80bNq02veCN
         kABVHOmJwL6J/s7rI+5+iI07RcZvriE6Vd/ysUlElcFaxDceKMLF9ZvPQStciHHz45zP
         qXaQ==
X-Gm-Message-State: AOAM530BMPLEYRpc9KvqUXTMsYWGKF4CXIm3QdFzMaoAViDx2/WJKe5W
	oXKWqXyCo/hKHfmQiVnNfJ4=
X-Google-Smtp-Source: ABdhPJz+MtRuntfrRkEMQVanEs2Ehicxuu4xy5lCw5aWu+zWimC9nOZPengQVdTQtuxI9wjfgHFNyQ==
X-Received: by 2002:a2e:6e13:: with SMTP id j19mr9855811ljc.292.1589190871093;
        Mon, 11 May 2020 02:54:31 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
        by smtp.gmail.com with ESMTPSA id s7sm10412923lfb.40.2020.05.11.02.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 02:54:29 -0700 (PDT)
Date: Mon, 11 May 2020 11:54:13 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Roman Bolshakov <r.bolshakov@yadro.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
	Marek Vasut <marex@denx.de>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	David Hildenbrand <david@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 02/11] sysemu/accel: Restrict machine methods to
 system-mode
Message-ID: <20200511095413.GS5519@toto>
References: <20200509130910.26335-1-f4bug@amsat.org>
 <20200509130910.26335-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200509130910.26335-3-f4bug@amsat.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TUID: mlIIyD9vwZ0f

On Sat, May 09, 2020 at 03:09:01PM +0200, Philippe Mathieu-Daudé wrote:
> Restrict init_machine(), setup_post() and has_memory()
> to system-mode.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/sysemu/accel.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
> index 47e5788530..e08b8ab8fa 100644
> --- a/include/sysemu/accel.h
> +++ b/include/sysemu/accel.h
> @@ -37,10 +37,12 @@ typedef struct AccelClass {
>      /*< public >*/
>  
>      const char *name;
> +#ifndef CONFIG_USER_ONLY
>      int (*init_machine)(MachineState *ms);
>      void (*setup_post)(MachineState *ms, AccelState *accel);
>      bool (*has_memory)(MachineState *ms, AddressSpace *as,
>                         hwaddr start_addr, hwaddr size);
> +#endif
>      bool *allowed;
>      /*
>       * Array of global properties that would be applied when specific
> -- 
> 2.21.3
> 
