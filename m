Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp35785lfb;
        Mon, 11 May 2020 02:46:24 -0700 (PDT)
X-Received: by 2002:a05:6512:3190:: with SMTP id i16mr3759194lfe.158.1589190384839;
        Mon, 11 May 2020 02:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589190384; cv=none;
        d=google.com; s=arc-20160816;
        b=GL9FPtnvmaNW9tBNyTlMMCIiNzFDdiXsghTDffsx3s2taAFON7kCuEwWuv2iWIjN06
         vrwE3sZdZnpDoG5HwifJHRBVSioOP1iDcaR/Ex2mDF2ASM1DD2sqHMHsLmLQa1L2ap7M
         +/mkWzVfXqWotDD1HyzhobuAo//E0jjKeeaiRMjFf8XOeVfCKUZa+OhzgqiQ93lNpWTq
         AWOHICXS73/oE0rDLaFDixowhb70BaI5jsNbWS/WTdeuS9JN7WOaswpB01VvsxFLM0s1
         m8FhkfKIY8c782Uk9N4mXPHJf87VMzRSPbeYtWRjax7OcbyN4cGNneW6jvwq6EARrHXY
         Mcfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=gpH2tKXCjUnkJ4UxAw3yg9UWeRqETvSZhoIE66gIUc0=;
        b=isMpfdxczWjwaVtLyR9uhe5/QD2Be6o4Z1jYxSdWCkPFcDnt9k9/WIVtaAfhSuJ1r7
         1jiO+Z4OY6oZPTs4RrEQSBim2TRvA3sAQU7yhy1A7G7jEyDRGe1jx2OcA+4KyObjvlY9
         pmITgtZeZafs/z5HhYVNcYdNhcDtMrUseQkRVIYBhJT7EXIcj/rVP/jxpEK6vn1q5qjT
         IRv/1sXvotfuADFKyDIlule44pPh64eC9+qBxnIJGd+HFTHTiZFrLEs84l9+E8OSm9lx
         iSNzCV0FXqF9iPSzDW7Fv5THCxf+jwvXasAyaQ3xowdWBBr4t1L2Rw1/SUQKfGHkt+Sj
         yJWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tjfULMxv;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h25sor3007121lfg.26.2020.05.11.02.46.24
        (Google Transport Security);
        Mon, 11 May 2020 02:46:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tjfULMxv;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=gpH2tKXCjUnkJ4UxAw3yg9UWeRqETvSZhoIE66gIUc0=;
        b=tjfULMxv5t3BSqs/JN7wUWndEZqMYaZqFK6eRZML9KlurmdQjAcmSfX5JBOf6fRSFW
         gSyq+YNFmXb8SLmxH8Fbrbh38XL6i6rw+zGGjkN4l15rZsAoT9A5Cw0O8d2ziiIk45II
         VdKEQEmaLiWWq4HCJNW+sFO16P+S2Zx5FwH+9BowQUydjC/7RQszYuriSx9TvJY2nXtQ
         2q3B6TUCBLHKXdM9shi1KNjWkGE+aL71ERDa+ef2FCYOFbvTgspB2uGIuXMp1qebXPiM
         xUHZ/xMfY+hVrF/CXJXFSzUf7zyZu6z7567s0P/YoNF/kypUutYFV5LTKXXZExnAiu3o
         m/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=gpH2tKXCjUnkJ4UxAw3yg9UWeRqETvSZhoIE66gIUc0=;
        b=n6NHZYDftnD4XU4rw4O2mTSgJTzTResSHeyhKTcWE7GCH1E/8Dagms6kXlQ/3WAYoq
         CfZ9d3iV8N+5YqBqhmX+/AFkLJNGYmXCbW4qFurmhFGomHiL7N0vtxIUvCNGgg4NhWNA
         8s2ULJ8Frhj4OhgQfCbih7+wxzAgpU7v/CPIbE1Sh8lhOdJ23SHCgPN9zLXzy+SA5yOH
         im8bfmxK+SPtPutAIW3K5WezDfwiCJJB3AcPz5AFXc2UuZzSNL1uyeqXeHVUaM1I6AzY
         v6Tk2rvmZYEgrCYlLFrq5df5l5+1RNfCGfdnsC4kX4JVt7WOhv50HLKL+ItQrldxtHtM
         Y6AA==
X-Gm-Message-State: AOAM533N3WYvGCCVV8YDjkNMEOLiqOsOTyarnNwUqUwYPqrHcsAMnVaD
	8itHAr+4NMOu8hRFkfQQoP8=
X-Google-Smtp-Source: ABdhPJwKQcIsUR1P9Gu4NnWXlNjZRtdZ0QmSECJkJzR5ySzhfdIptBEcQ3dJQ8rAXmrZEQ1EJQZr4Q==
X-Received: by 2002:a19:700b:: with SMTP id h11mr10497912lfc.62.1589190384034;
        Mon, 11 May 2020 02:46:24 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
        by smtp.gmail.com with ESMTPSA id z5sm9255843lji.30.2020.05.11.02.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 02:46:22 -0700 (PDT)
Date: Mon, 11 May 2020 11:46:06 +0200
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
Subject: Re: [PATCH 03/11] sysemu/tcg: Only declare tcg_allowed when TCG is
 available
Message-ID: <20200511094606.GQ5519@toto>
References: <20200509130910.26335-1-f4bug@amsat.org>
 <20200509130910.26335-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200509130910.26335-4-f4bug@amsat.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TUID: APyn0All6WjD

On Sat, May 09, 2020 at 03:09:02PM +0200, Philippe Mathieu-Daudé wrote:
> When TCG is not available, the tcg_allowed variable does not exist.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/sysemu/tcg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
> index 7d116d2e80..d9d3ca8559 100644
> --- a/include/sysemu/tcg.h
> +++ b/include/sysemu/tcg.h
> @@ -8,9 +8,9 @@
>  #ifndef SYSEMU_TCG_H
>  #define SYSEMU_TCG_H
>  
> -extern bool tcg_allowed;
>  void tcg_exec_init(unsigned long tb_size);
>  #ifdef CONFIG_TCG
> +extern bool tcg_allowed;
>  #define tcg_enabled() (tcg_allowed)
>  #else
>  #define tcg_enabled() 0
> -- 
> 2.21.3
> 
