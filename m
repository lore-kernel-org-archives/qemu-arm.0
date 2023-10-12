Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp548790ejc;
        Wed, 11 Oct 2023 21:36:38 -0700 (PDT)
X-Received: by 2002:a17:906:209:b0:9a9:e5bb:eddc with SMTP id 9-20020a170906020900b009a9e5bbeddcmr22051690ejd.16.1697085398376;
        Wed, 11 Oct 2023 21:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697085398; cv=none;
        d=google.com; s=arc-20160816;
        b=eNMZYj+XtyBtgbp4PwdMRwL5/erOwd0qWpHw2X27i28feobRwlgc21QyW3xlPeqDNY
         1YdYkWviwNGepDwpV+2F2ZVQY9/cuZwabVq7D9WtAIklbSlkELSEAYEQ9Cf1Z9h2mYpJ
         p5r9E+WQh3R6HFVng4Rig6QbZlJDSaLyQJi3k/vxtx5e5iszSbILh0JeQeo/N5DYRkDX
         TBOxevgwj5TIlc6KR5sm39pXhYMZkB15IuXVGQ7tWygahJi35+orbYXU3KdYLP9sKuiw
         rs8CInlttYpipp6KAKL7xK5bGOu+vYGT55QgNefRxfeqULMv7gydzZ5w69B7BWV7ad3q
         0qOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rsqWk+2/+fzNt1nwuH5nLLJ02vPdHgexuKsMnzAkv3w=;
        fh=tebFjQw8nyYXdpHWOtCSmNiXXYif6WEiSPQxtAL9eeQ=;
        b=e7ivVQUweFuHf/CGW03lGbDTB7gYnFwLoVE3yNCrCP+TAhczNk9z4jhLWUFJvpC9tf
         ub3yd9hdVx5HW0aAU2Ndda+KRIZTR+eGiF8sdJ5XAgh2VgBH0d29zL2ld8PRyk0W/bTn
         r+c9dJ/MQOMHu4YQu7MYjlFmKE7iATgO2+QhCLyqyi6+WY66zyRVQtRFQUkDhcc9VqIa
         n4P/OwELvmQcC8A+1JSyt/TmYD0RVUKkNm9mJ9YsVxKm5ugnlR/5OzhYSSTYPf3yPfsh
         EDQ2lPGMK/qTpp0pxx8kWUrXXPphkZAk6nZOXUaDiR93fTWauG0Usu1GuH6fNpmWfO27
         62PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=InxYlnDu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h26-20020a1709070b1a00b009b282006ac9sor5512851ejl.8.2023.10.11.21.36.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Oct 2023 21:36:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=InxYlnDu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697085398; x=1697690198; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rsqWk+2/+fzNt1nwuH5nLLJ02vPdHgexuKsMnzAkv3w=;
        b=InxYlnDuKS9TkKtTywZJzGtd6qbPLNQI4iePBt+riDd+Hxk2xmlDcWwy1ldjlQ1FFD
         44l0G7Dc78VfTSeWub+q0G5MXPPTiYL4xDNVNgH/ptD8xgAbdUq3U4J5xekqs2O9e5IH
         pImAS8Iv6iA+v/BMt0ciT+ZlDdzOHNrssuh+NsL2yUBBh0ubNCQ1scm2pv4i4LOHncgq
         a0VkAb2waAkaB0zwuDWBfdtFYyk8ARDeXwjWCWw69SVITdJMann3j75w7QxKHDmslVxS
         fg3K1l5GghXXmZpGQyyUQenamGz1QvrBVHzJQFmeiIPTg05mBaN/vFkSRF5i5+wr5n02
         oIUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697085398; x=1697690198;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rsqWk+2/+fzNt1nwuH5nLLJ02vPdHgexuKsMnzAkv3w=;
        b=gf1saAIWTkwYEz+y5PMB28538ADYsYxCF0rNOnvprRvXVXGcijdgWZ39ieR78gyRnI
         dA5lnh0qGspWw1Q8dh5I6bu0FZNpCPKn+7dFNJyHY2XhT/2WY93VP4GdOcUIQIGj8B1k
         ZLFNcQH3a/eS+szlnDd1oMjciJaWcqPZaOgnKbHiDs04R5FedNh5fzzwmULIhCLWWCFQ
         7P2wFydRfO4oiW8cEOXL6vgIpk334kLW2k2qGtyltouQ3oDkiEvRk36vM4sogpu1skBE
         8Xk50EfSMCe0GV/DaW4r/DZOji3dLNoOp58x1kagREpRp5yN39T0LM/pt5+MLIPSqQuB
         xLWQ==
X-Gm-Message-State: AOJu0Yx5QLjskDaYI08BoxQRL2yLh7gvMgriwnM/vFhv3sfOCoss1ILO
	8TgpNkRL6ckhAX7I+TFuPxlhWszmr9GFFFLGo5hYnw==
X-Google-Smtp-Source: AGHT+IGn5Y1WzWdsdU7MfdCfa5PmA9zEevz9KS71cMQv84u2N+RvvzYye12V78QdPYi70J2QkbPG0g==
X-Received: by 2002:a17:906:844c:b0:9a5:cab0:b050 with SMTP id e12-20020a170906844c00b009a5cab0b050mr19136706ejy.13.1697085397985;
        Wed, 11 Oct 2023 21:36:37 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (dcs23-h01-176-173-173-31.dsl.sta.abo.bbox.fr. [176.173.173.31])
        by smtp.gmail.com with ESMTPSA id y17-20020a1709064b1100b0099cc3c7ace2sm10727685eju.140.2023.10.11.21.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 21:36:37 -0700 (PDT)
Message-ID: <f1998265-a32b-e900-6b0c-3b9508789be7@linaro.org>
Date: Thu, 12 Oct 2023 06:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [RFC/PATCH v0 09/12] gunyah: Customize device-tree
Content-Language: en-US
To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>, peter.maydell@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: quic_tsoni@quicinc.com, quic_pheragu@quicinc.com,
 quic_eberman@quicinc.com, quic_yvasi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_mnalajal@quicinc.com
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
 <20231011165234.1323725-10-quic_svaddagi@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231011165234.1323725-10-quic_svaddagi@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: IKeL5IyNM9rb

On 11/10/23 18:52, Srivatsa Vaddagiri wrote:
> Customize device-tree with Gunyah specific properties. Some of these
> properties include specification of doorbells that need to be created
> and associated with various interrupts.
> 
> Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
> ---
>   hw/arm/virt.c           | 11 ++++++
>   include/sysemu/gunyah.h |  7 ++++
>   target/arm/gunyah.c     | 79 +++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 97 insertions(+)


> diff --git a/include/sysemu/gunyah.h b/include/sysemu/gunyah.h
> index 101e190619..f077837437 100644
> --- a/include/sysemu/gunyah.h
> +++ b/include/sysemu/gunyah.h
> @@ -35,6 +35,8 @@ DECLARE_INSTANCE_CHECKER(GUNYAHState, GUNYAH_STATE,
>                            TYPE_GUNYAH_ACCEL)
>   
>   int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size);
> +void gunyah_arm_fdt_customize(void *fdt, uint64_t mem_base,
> +                uint32_t gic_phandle);
>   
>   #else   /* CONFIG_GUNYAH_IS_POSSIBLE */
>   
> @@ -45,6 +47,11 @@ static inline int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size)
>       return -1;
>   }
>   
> +static inline void gunyah_arm_fdt_customize(void *fdt, uint64_t mem_base,
> +                uint32_t gic_phandle)
> +{

Similar comment than previous patch: stub can be avoided.

> +}
> +
>   #endif  /* CONFIG_GUNYAH_IS_POSSIBLE */
>   
>   #endif  /* QEMU_GUNYAH_H */
