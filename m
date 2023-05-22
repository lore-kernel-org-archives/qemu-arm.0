Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1405734ejb;
        Mon, 22 May 2023 12:06:28 -0700 (PDT)
X-Received: by 2002:a05:651c:91:b0:2ad:d6cd:efe0 with SMTP id 17-20020a05651c009100b002add6cdefe0mr4531726ljq.37.1684782387933;
        Mon, 22 May 2023 12:06:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684782387; cv=none;
        d=google.com; s=arc-20160816;
        b=mv3fOrAdT6NNpUH0/6RQFgLJPxrt8di+y5dOR/nTy9Ru/avbNXhMI78oYtSDF8SlGW
         G7gSKcW6emWZpXjxNxhTVNEDefad1PIqok5NLd4SwvP+S4l7zxZjGwcP5C2fOIRWBQaU
         u+w2CukEcZ7J/S2ObbRHFp7xc2cOeVynMvomb00bJUA8elGpS9FFctLhyCVUJvb/kKye
         8M1vskBbrDiCzyw2mPn5fGNtWo28N1vKbR7QA0ZS5JVbZV8Yyiq+wDvIB21SPKxFSdl3
         ut2jfQF4uE4/DOkB38AyxiUe6Ln6AO2rc9vQQuvJ6ECZpBTAKo8YcurSPPZUVtD72KDS
         xOhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=mjQ4yUw5/YdW0h6Y0ABqBrByAFtiTVlYZTaj9W1aIZY=;
        b=FU0Vu+eFlcIi+Av9GUNT1DI+gEJ8tipO2KKVNoMJKSQ/NsXo3teHOn9CCCFqhsS/hR
         Fvh68zxRCaw2Qa2wWRXVhe2+MgJvC273o19Dj1Iz/Olk1Dr5Bs7u8v8yrwVPghQ43xmv
         Cwo7V3t4OTt4Q4jTaSg588VJQAGorMjK0leMgnOs2HRGyVYRc2XHHpb/ABbRhWg75Nq5
         3iYRiIJulZos0jBVTdvL8NihE6QKPr2IWYC1Yx3ymGookqVO0T0RepXhd/qGdFxkH1a6
         D/J285RODgzZlb6e/THDNJfzeu1MrN43S7jC20cKixF9ep1n58gRnT9hi1DzRNuRTres
         H51g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=Rh0SJI+n;
       spf=pass (google.com: domain of frasse.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=frasse.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <frasse.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y20-20020a199154000000b004f37a46b20asor1315621lfj.3.2023.05.22.12.06.27
        (Google Transport Security);
        Mon, 22 May 2023 12:06:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of frasse.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=Rh0SJI+n;
       spf=pass (google.com: domain of frasse.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=frasse.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684782387; x=1687374387;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mjQ4yUw5/YdW0h6Y0ABqBrByAFtiTVlYZTaj9W1aIZY=;
        b=Rh0SJI+nERNBURTEb2qHCJb4ne2diSQD5o3AZcbstN9br/JJdiFgMwkZ9k0yESQN+N
         /Ly9/8E8czCkVMt84AGsh7xVt6me16dHqjD6V70xQlBlu0nl0L1cdYC4j8hCZpOPCJSm
         GIQ5b8djoxSg6UkGrZ4oamPRuPCcFE1N03UaDtubG2DvWL6Ig366mmzJjK6yKYBsgrjk
         rBSbKJnxEx6JIatiL9JpRFeMC9XYrQbj3YnUsiaSNE/U7HQO9YlAJn90v8RCEfv1eORV
         B8Z9KX2iTgq8puzRz1JP+OFyUDnpKiNW4kKz5EmTIIDrUyG7WdgnPM6S0sUNFzeW0sEZ
         t0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684782387; x=1687374387;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjQ4yUw5/YdW0h6Y0ABqBrByAFtiTVlYZTaj9W1aIZY=;
        b=g4kg6EiTQ5qrbnTzTPlu5LykLDUixrjgBBm/B5KNzctbsOSkWYyK2C1UY4YW/2EhLU
         ipF6fRmikHtOYgydysddFoXDbKANk+1pXneIm/lHD7SCWMmky7uX1HlegaREAx8P+sfv
         Pc3/VdB2/6xKzoBdignWQglt2Vc5SG+cafZHkCaZEB0S/jXRLBJKK6SWNHssBWndeDS3
         OmxhIlNnAGpf4TAYDER9tINSznHZgTJ/yG+OUzIULuIc7rAfMm/kysyUAmIWJBlhXy/3
         xs7a6XG245SEuM58Kdmj0n3ghw8eK9oCsVCT5/+tlBHiDbwhUGU7ex6NXY2flGdW89J8
         5dYg==
X-Gm-Message-State: AC+VfDzUaoCC9r93wjzRqedEV89TQQyciVWebLAtR/oHRQZNd/bC4Vw+
	HOPSipkSH9m23yJmR7PisxWJv0f5BR0=
X-Google-Smtp-Source: ACHHUZ6QWvRFP+Ka/uxsbrKEU1FaQ1VHm3QC77mUBJ+WpRoVksFPyDakz17U80AqVwHtkUjSI+RFVg==
X-Received: by 2002:ac2:5503:0:b0:4ec:8816:f4fc with SMTP id j3-20020ac25503000000b004ec8816f4fcmr3479818lfk.6.1684782386593;
        Mon, 22 May 2023 12:06:26 -0700 (PDT)
Return-Path: <frasse.iglesias@gmail.com>
Received: from fralle-msi (217-76-87-243.cust.bredband2.com. [217.76.87.243])
        by smtp.gmail.com with ESMTPSA id t2-20020ac24c02000000b004ec508e3a9bsm1059187lfq.276.2023.05.22.12.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 12:06:26 -0700 (PDT)
Date: Mon, 22 May 2023 21:06:24 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 01/12] util/fifo8: Fix typo in fifo8_push_all()
 description
Message-ID: <20230522190623.GD6984@fralle-msi>
References: <20230522153144.30610-1-philmd@linaro.org>
 <20230522153144.30610-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522153144.30610-2-philmd@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TUID: PjbiZiMifhE3

On [2023 May 22] Mon 17:31:33, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  include/qemu/fifo8.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/qemu/fifo8.h b/include/qemu/fifo8.h
> index 28bf2cee57..16be02f361 100644
> --- a/include/qemu/fifo8.h
> +++ b/include/qemu/fifo8.h
> @@ -46,7 +46,7 @@ void fifo8_push(Fifo8 *fifo, uint8_t data);
>   * fifo8_push_all:
>   * @fifo: FIFO to push to
>   * @data: data to push
> - * @size: number of bytes to push
> + * @num: number of bytes to push
>   *
>   * Push a byte array to the FIFO. Behaviour is undefined if the FIFO is full.
>   * Clients are responsible for checking the space left in the FIFO using
> -- 
> 2.38.1
> 
> 
