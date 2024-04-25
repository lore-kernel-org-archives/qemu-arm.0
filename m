Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1175826ejb;
        Thu, 25 Apr 2024 00:40:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVLnYU+mGgwZfJUTDE28DLzoqjLEK4+D1fW/78FFNKjDMZf6RTfVsOlqSA0ZyyIjrM7yttErx91GZmn1yZDghguFl6Me3em
X-Google-Smtp-Source: AGHT+IF41+41Y8oNJ3F5fsK/fH73WSxOtLilCJHG62UC5tu53+23kV1WO3AhvGUpHe5pfzRaTWAD
X-Received: by 2002:a05:600c:350b:b0:41a:aa6:b59e with SMTP id h11-20020a05600c350b00b0041a0aa6b59emr4289929wmq.5.1714030851806;
        Thu, 25 Apr 2024 00:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714030851; cv=none;
        d=google.com; s=arc-20160816;
        b=vhBs+nrPEhbYEOYlT5asPK3PjsVSj9k2uwRTZpaf2MMrrPLELuMp3esT4avA9caRp8
         unSrNqBHZyqzGm6lyETiH12snIEM/CivUFNR3vdfLPs2ockuCPMEr2ewqbHVuF5DGCiL
         mLdp+RM97ihu/rcb9LuiCuE9QVAvvjijXgayj9bqNZNbiKkCtGtMYGLC/77xsRF+OTZA
         4O8NoAAEFVqez1Td4X1cSRsavj7A5JkCU1Y+KVgjF5LwUoMwici8Y6hb1Qi76shlNxCf
         tTP924V70sqgcO7XbenTSh7463qxSF7cFb71uztKalnczpwSjG8TkW1rJRqV4hdUqio8
         XB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=pnepO0zBuqc+XAIncvP9cfmf9PXJe6QI78Je+G6F3xE=;
        fh=nHpWbJB0TIo7YzYoPHj0qenSABR0dmnhaynyJCfo2PU=;
        b=j3SGKYDkNCNVYR/53eUf429tnmFjqTa/O8HOQCpaqpXiU6rSGEvNMFSJMRjVkjQJed
         ajuC6cAXNPHZAN6Qh1VSzslAadqYqbu5VZbv0HCKgXFAy6Ti2qwBnFZ53Vk8K5TLtotX
         7ucCo7Y93ZSOE/VeLtxtua4Qlgfr2PnrO0aumwsq6hNFOHgYJuiLKvYakKKWPk3lE3JF
         EaleuUI9eCanmJzB7T0aZDbgcN4SpddC9B9+CCby2HcRzJjkW78elz9EJ/LbNHphX70W
         AYl93mWUdv5+E2lElX8pQRTD/L8kD156ybf5qfcHZ+5UR71ZtNE2fuYjISeXnzYg/f8/
         hNcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b="fG/8cL9m";
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id bd15-20020a05600c1f0f00b0041b11992ee6si1348569wmb.42.2024.04.25.00.40.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 00:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b="fG/8cL9m";
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
	List-Help; bh=pnepO0zBuqc+XAIncvP9cfmf9PXJe6QI78Je+G6F3xE=; b=fG/8cL9mS/mOuvv
	WyvlKssUpi75mDcXtszxhRej4+TCnuJsHnMmv0/w1mPpnPcGcgCfvQfYDoNjZQvf01oHSfNMq2DAd
	/8+Vnl5+Ndg37gz2nLEjPn36I1lKONMZ0oSOPNGa9drOIx4sfqOlAumA/20ceghWxmY/Tl9TZyT7k
	yU=;
Date: Thu, 25 Apr 2024 09:42:03 +0200
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
	David Hildenbrand <david@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>, 
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 15/24] exec: Restrict inclusion of 'user/guest-base.h'
Message-ID: <mq2o3t4pyz4g7yczjryzztv6cslctqfkgktrznmsietkieg6fi@as6hdgvawnie>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-16-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418192525.97451-16-philmd@linaro.org>
X-TUID: r1kUdGpEJ4vt

On 18/04/24, Philippe Mathieu-Daudé wrote:
> Declare 'have_guest_base' in "user/guest-base.h".
> 
> Very few files require this header, so explicitly include
> it there instead of "exec/cpu-all.h" which is used in many
> source files.
> 
> Assert this user-specific header is only included from user
> emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20231211212003.21686-23-philmd@linaro.org>
> ---
>  include/exec/cpu-all.h    | 3 ---
>  include/exec/cpu_ldst.h   | 2 ++
>  include/user/guest-base.h | 6 ++++++
>  bsd-user/main.c           | 1 +
>  linux-user/elfload.c      | 1 +
>  linux-user/main.c         | 1 +
>  6 files changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>
