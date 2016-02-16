Received: by 10.25.208.211 with SMTP id h202csp1526996lfg;
        Tue, 16 Feb 2016 13:09:15 -0800 (PST)
X-Received: by 10.112.171.100 with SMTP id at4mr10491547lbc.7.1455656955589;
        Tue, 16 Feb 2016 13:09:15 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x22a.google.com (mail-lf0-x22a.google.com. [2a00:1450:4010:c07::22a])
        by mx.google.com with ESMTPS id qi9si19170864lbb.151.2016.02.16.13.09.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2016 13:09:15 -0800 (PST)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::22a as permitted sender) client-ip=2a00:1450:4010:c07::22a;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::22a as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x22a.google.com with SMTP id 78so115269819lfy.3;
        Tue, 16 Feb 2016 13:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=feUUZzEPbyv7WylgjcRPOQlxoHIWGovUopAntKGvPtU=;
        b=l6XxlrU9M3ranNI46Q/NklWc79lIELxpyT8jtdgbKLBVVX5+aXgu38mdVgpWGFP7AN
         62kCXYinP0XZPDu+3A5gp7Y2/lIDLwIjR43T+mKEVoVxGNOT0epdSnSzp3rHBMjJunPh
         BwdzBtVjsQhdlx+wwXD0+s7mVOKWgHyzTT105KkV+hexpVVBhEXljVI7JN4HKeuBmxMK
         bvDzQnLNAPNwkPZIrEsIQmEv7/zcc/3rIYNzjnq+VW9GeK0tNGSELnXVGKh+ewmAoUkB
         V//lcAoZjKW0ZpzRmvyRpR42spc1XDm3fmJAp9rSKGNUJKc4s0ItUJqht9P+ub73j0pu
         ON2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-type
         :content-transfer-encoding;
        bh=feUUZzEPbyv7WylgjcRPOQlxoHIWGovUopAntKGvPtU=;
        b=LE4gMKm53yv+owi1OR3hlmwh1fjBKeSIHXtChBUVGj+DDsHkXKfssbMBeVxfO+OMqY
         F7cbBDDZOvB5o89yj+efcNXH1DmkbC6YCYAmM+weecrDTg6Mpjc1CQN2CqGF9sxdKWRs
         8KuHiE3pkCkftpG+wseXhnq7lmlR/ltZ8OjDOlb7RUGud6VSf+5BzRfc0c+tlNrLNH2C
         FS3PRqpFbdH8rbXjNQJ6hQUDnYNLvSWyiyMD808oaBKTHKlWq8IMvS7HFzFBTm/OaL1X
         zt3CbIum/deGmpYM4FzxIJiMi6EHrEnfR1Ax7gkTEr3+uN883IicTqTWR1mvjBz2H0Gh
         pKtA==
X-Gm-Message-State: AG10YOTWd52/dOV0UfXie0Sqp4utgyTQMSMDztQLQGYOJACBLa9t28NhhPfv4FqJzLa9lw==
X-Received: by 10.25.91.20 with SMTP id p20mr9151411lfb.79.1455656955278;
        Tue, 16 Feb 2016 13:09:15 -0800 (PST)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net. [46.188.121.154])
        by smtp.googlemail.com with ESMTPSA id n96sm4534462lfi.45.2016.02.16.13.09.14
        (version=TLSv1/SSLv3 cipher=OTHER);
        Tue, 16 Feb 2016 13:09:14 -0800 (PST)
Subject: Re: [PATCH v1 5/9] target-arm/translate-a64.c: Use extract32 in
 disas_ldst_reg_imm9
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
 <1455287642-28166-6-git-send-email-edgar.iglesias@gmail.com>
Cc: alex.bennee@linaro.org, rth@twiddle.net, qemu-arm@nongnu.org,
 edgar.iglesias@xilinx.com
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C38FF9.1090301@gmail.com>
Date: Wed, 17 Feb 2016 00:09:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455287642-28166-6-git-send-email-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: WE69MXYmSByt

On 12.02.2016 17:33, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Use extract32 instead of open coding the bit masking when decoding
> is_signed and is_extended. This streamlines the decoding with some
> of the other ldst variants.
>
> No functional change.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/translate-a64.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
> index 7f65aea..bf31f8a 100644
> --- a/target-arm/translate-a64.c
> +++ b/target-arm/translate-a64.c
> @@ -2117,8 +2117,8 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn)
>              return;
>          }
>          is_store = (opc == 0);
> -        is_signed = opc & (1<<1);
> -        is_extended = (size < 3) && (opc & 1);
> +        is_signed = extract32(opc, 1, 1);
> +        is_extended = (size < 3) && extract32(opc, 0, 1);
>      }
>  
>      switch (idx) {
