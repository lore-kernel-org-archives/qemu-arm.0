Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp786655njb;
        Thu, 4 Jul 2024 11:36:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtNk5ZegaQkHm1YPjLbxpwv2/mbdU5QCfrvn5LbhLTU+9NO1IIKGVogGCn636p+LyPDlrW4oynlnxTb7NdQC4X1BnmNi0x
X-Received: by 2002:ac2:5dc1:0:b0:52e:9fd3:f0ca with SMTP id 2adb3069b0e04-52ea063b9e5mr1342161e87.33.1720118206801;
        Thu, 04 Jul 2024 11:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720118206; cv=none;
        d=google.com; s=arc-20160816;
        b=stMCbG0dwrd35SqZV1xvAVX7nj5y8vcAlyZthE3eiclEnCyDGfmjTlNLc7aIy+gTRz
         f+JryLoOppne6KFMfRBH89eNq5CN0wnLajm1DK06VK2DeTeDFOCOyDXWiOcySqk4K62y
         vk64V6myFzDbYdYSzGoQ+GtQPE0UgvKjvoZiu+ijYB4Ol9/F8tf7PRDgKPW/3rdHLWT7
         1ftHC3CD8WbrpH/YOEt6rMBS6XELlzNQAGsiRBvkDUMQGiuCrM2ytaGzvtb0gV02DmLa
         sTbrGUqJdGGM3+4k0TBRpXmYd7jNwGhashSa55NpJj9xVh/PWvlKOcTuSBIKvkSKq9p2
         VU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=cQJ05o1jVN71hTnXWfiLF2GTxY/ASb+HHdgiIzEl/2g=;
        fh=hk1gxDuwd3o5etmesasDaa4UkUYnw9ZogSKNcZ49NNM=;
        b=V42jGaftIzIqIxi5VVzLfg+9dylMD3lS5WIQx5SbG2SQ2iKqMg4NmSkZ0ZH8XlN/2d
         msL7q9kX71n2Av07DuyZMY3YcZxNOC8V7LD3EG2FcI3L3gaGtaguuu6B3FNTDq+O3Y3k
         dmFyIZtfgCh8B1IqAcHngjs1bLCmRkiJeYr7qhFEsPumukD2zFlB73nz100Bkms+Gs6W
         N6sXZS/rUTLXp93/456vLVu+mztaAHgrnVzkKVF+JrJWutpmJxyD/8LXgofCak9H5OT9
         tCjjSbvPTuOJLEs99d7CURPguzSTzQCr+OdbHWfOMALIyl7AYflG+QBYfAuB0voafg7b
         RJPQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vt3QDlrp;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-52e9dee67easor630692e87.13.2024.07.04.11.36.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2024 11:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vt3QDlrp;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720118206; x=1720723006; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cQJ05o1jVN71hTnXWfiLF2GTxY/ASb+HHdgiIzEl/2g=;
        b=Vt3QDlrppzOhTrqtAoHpIKaWG1PoFbNPgZ1teJdzakndzbQvKVOJ8ckBfIkGykl4xv
         qZXPW4wwpEDhYAYyel8XGLM6wqQQNKUiTvZRe+lWLsKYG8s8kibz1lyKWiBkFQTmZsyu
         5KZ1BYZFipR5rCcPY0kOKZu+g2Id0N+RgjDjECNrKLSj6UIm9EJ1kNKoVQ2iFTLNN5lD
         EK3Hh4eybUvGopdH/iBclfmcpo6fqzqb0rKuGdgCfoVGRGBl2dtTGLprLYlZAvKZeHB0
         ny67ZyBvA93NnjmKZZtgcVGi/TPoR4aIGjps/QGsbOlQxcNmt5N2KaeOi+GtCtF5YczO
         C8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720118206; x=1720723006;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQJ05o1jVN71hTnXWfiLF2GTxY/ASb+HHdgiIzEl/2g=;
        b=stlPD2CkhxCqQ+wev2QZbGK4uHoFKf/c+fN8W4NKzCcMAf0DykiW/H434RzwGD79xZ
         65ZJy8upubU3boM7UupdTY95dqV8VZ0KmmDX3atdk49kDTq2gWyxR4N0qTjDFU8olfob
         4r4pprO3cgNxWQwCldPwV/pgJuoP5HtATxmoHHjibbiD47EmjlNIq1CjLjkGeBNkPbhu
         QbWvTqdDGfjFRbdFsd7O4CUR9L//W5AZAo3WwwNyeHDlDy3Pq0gpSqaVkpDJdS0luKJT
         cCTlba9kr+b1bCcyX03Xzfe2roPiK8WJzl5S45s+YynBzvzY281PymUS8B9zdforaylo
         p5sg==
X-Forwarded-Encrypted: i=1; AJvYcCWCCQIFqREpxi0xjBPmee+oFKTgapTsJTgSsyr4w8cn+OyosQF4cfc6cd2d2kmEsrQo4AnCMN8g4pIXxwcRkAwjGQ7divO6
X-Gm-Message-State: AOJu0YzPZzUHpWWVpxdXcAeLb77jaObTPxepdcmB0tocqixo7WbPEcIP
	nMoB48xiSV02s4E71SZq9gjhL5IHFs7VoDOsSZAW1kuVY75QTgZh8VTiNIZE+DTUTg==
X-Google-Smtp-Source: AGHT+IGokwTm5e8a3miuCKcpayITWYncAoisbP3rsOcbAs3Wu37k7C2k1MTHKpur3TH5UtezYhSKdA==
X-Received: by 2002:a05:651c:1511:b0:2ea:e57c:a55b with SMTP id 38308e7fff4ca-2ee8edb760cmr22754801fa.31.1720118206197;
        Thu, 04 Jul 2024 11:36:46 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679d07708bsm2302129f8f.40.2024.07.04.11.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 11:36:45 -0700 (PDT)
Date: Thu, 4 Jul 2024 19:36:58 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, alex.bennee@linaro.org, maz@kernel.org,
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH v4 18/19] hw/arm/smmuv3: Advertise S2FWB
Message-ID: <20240704183658.GO1693268@myrica>
References: <20240701110241.2005222-1-smostafa@google.com>
 <20240701110241.2005222-19-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701110241.2005222-19-smostafa@google.com>
X-TUID: q0x2ZeSXZkrX

On Mon, Jul 01, 2024 at 11:02:40AM +0000, Mostafa Saleh wrote:
> QEMU doesn's support memory attributes, so FWB is NOP, this
> might change in the future if memory attributre would be supported.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 807f26f2da..88378e83dd 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -287,6 +287,14 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      if (FIELD_EX32(s->idr[0], IDR0, S2P)) {
>          /* XNX is a stage-2-specific feature */
>          s->idr[3] = FIELD_DP32(s->idr[3], IDR3, XNX, 1);
> +        if (FIELD_EX32(s->idr[0], IDR0, S1P)) {

Why is this check needed?

> +            /*
> +             * QEMU doesn's support memory attributes, so FWB is NOP, this

doesn't

Thanks,
Jean

> +             * might change in the future if memory attributre would be
> +             * supported.
> +             */
> +           s->idr[3] = FIELD_DP32(s->idr[3], IDR3, FWB, 1);
> +        }
>      }
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
