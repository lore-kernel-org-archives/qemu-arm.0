Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2410299njc;
        Thu, 12 Jun 2025 08:04:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU+Sz7H/JaVWhd08oJ4lLddx2YAwT6cdLsSZxOZGwFv3kqcIupO3y1lzh0KiSQtFBuD68fE1wybnCYW2A==@linaro.org
X-Received: by 2002:a05:690c:4985:b0:710:e8a8:7768 with SMTP id 00721157ae682-7114eda1af3mr63761837b3.31.1749740663213;
        Thu, 12 Jun 2025 08:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749740663; cv=none;
        d=google.com; s=arc-20240605;
        b=i0hV1ibGydi0Gd+n/Z6W4muXVRZG/86xhv9nH2Gf8Ae3vIupLXOQUdseMoTwbch477
         aUicayXcMHTGMw+anBAhSSY6QrBNYWJJH+iQOuOQYS6TAHNEORj46UkQ0yCjmYDCKzYB
         IdYpOu/WB/oU9DK9vN/oge1bMLi6odcpJiRiU1PLq0WMbsJIuniwRzoppPvqvmIGbSGx
         CKiHjQ6iv6OtpNHFjhr8WKcqQCgB/SatwlGGq5NmzQQd0d0k86OZ/mRaYWJy3h0/eAem
         wK4+gxFJEpqIXttk+JDf68IpLirt1w5rsEyC/yBS0KVZUwPZdn9D/4yPB8e43HXx9ASF
         UOtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mwRohgyatrsnok8RQFXYdLlHld9AUTUpziIQUj48/Fk=;
        fh=LpWYF1wefUCZEKZ8dEqoobClZoJ2qHnbhl50TElrZIg=;
        b=PSGCCip+eo9VG2muJOCPfjWpPPfBaBBXPlirG67Y0506KCeClcVF1LjOEY1Zw71MyQ
         2IEFqR+3je4EeXyNMGfk5b6iqjK+4x0+BHwcWRmgLVtn6xpmcTBsyYsmuYiAx2cMxNr0
         Q9DfcoqfT9BvBLvLcAEqJk87LxeMmUMKFHBd4YMSO5gvIAxGiFGwRIbOPArBdAS3NUU0
         bC0cZFFc6wnaDZep+R2lUoAIynvHejdnRZ6wMuCjWPe9mIkb+f9Gjexu0ysOnWUKqU+9
         LRwNn3qjJLLHYJ3oi5mNGCyHXMeFgBwWT7oGmuuWzYzPeCkCFBuPXWFM7Ne0Vj3Q2FFJ
         PjBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jnf7N18K;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-711515ae636sor11442007b3.5.2025.06.12.08.04.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Jun 2025 08:04:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jnf7N18K;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749740662; x=1750345462; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mwRohgyatrsnok8RQFXYdLlHld9AUTUpziIQUj48/Fk=;
        b=Jnf7N18K7RCj5UDqhYHHcQHI8q1vSEmXUJWSW92CMNeyHj5nz67YFoSTH9i06U+nt/
         u6/PciFy00c6bJxH6RlohKPaz3Z/3yr3REapR5rXQlLOic+kGzZAX3DGtJ3KkGXhbkG+
         rwYNhyHRSycdsGmRDbU4neu3lR0qJJDuUU6GJOprf96eb3hGDCnBNbOKAzjgNR7RM+wy
         S7l5KtvN9PWC2CpAMAfl78DEHEgNE0q+yqjTKoB3nZvt4iUSvML+hc0iSmX/b/bKHM/7
         6Fv1lNvI5MWbgLf4Lh6+UJ3Zv8tYT5MQZMckod7uEI6W4VjeOj0RgLfBh5Zk+sCNpM/k
         6ScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740662; x=1750345462;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwRohgyatrsnok8RQFXYdLlHld9AUTUpziIQUj48/Fk=;
        b=Zytjc4bAnd4akDa76n35WojrWuDkc1iniG/nkzSuRtqSdQTuWgBguqUFb4Q3FPCTyy
         OqiyM0FtyjB9lxW66gPDrSX5mpuu15W61flLtVwaY5TxMt5iqsRX3TUoly8sd2hnShHg
         /8pMF6YopfgHkAbYouSkxXwEYyk0PY5P62oTqNF4MyCZk1SzsUJahMPo15sYI6jVvbfQ
         x8c9hPP2bfnmPYnAI75h/nb26kMcrvR5TRWNBeerC8SfIlXkZQ3IW/nYW974lYtkx2Sr
         Ij36rePI3WU9Iu8GZjVp4uLNs7FTP/KhTgjw2/kpbHqV4TK+xDA3ikKy61oD/N6RV/Lr
         lk9w==
X-Forwarded-Encrypted: i=1; AJvYcCW7TPk6GSNg984HXtGTDyTqvlPw7FNxutZI6KVB5PQOw9dt107ZsxBp3mbff65/fEgp01J7zkHN3KVMiA==@linaro.org
X-Gm-Message-State: AOJu0YzJXMRDcaxBRIDWb5TPnBa49hyPYaCGojXQB+D4tH7H1P4HZYwR
	6CedpCCtPYTWFlYsy2esd5UymP1+O4t2R8AZz+0aAU1L7qfEB+ZClGMqDcuRWO4+yypV2d1qmoI
	Z/Ts7avSv9WvpyrkSYf1qZa9Hc4N9Xy/CxEyG42TNLjn3
X-Gm-Gg: ASbGnctcn3nmTPjn+S0LirFwAXVAmv8H0wyOw51eGkgmTXP61+J/e108UPvCkZ3k0vi
	srlr38gyb80u1GEy513+8CCbuAV1ixoXeg+UUnq3MriYzNhl/R3hOjlzLmythv6ycwQ5IXePSgq
	E984k/xJRtRrpIx9426SmLpwlg6OPylqqiK7BfBtV3839P
X-Google-Smtp-Source: AGHT+IGkwf3AJrycbkaLsXCktxf09YCtxZ4zQIpiVu3XRTDHJMzFJzu0b0P9/VzPi89aVoUmCtZ/VVXUpqdEnylPPMc=
X-Received: by 2002:a05:690c:498d:b0:710:f46d:cee0 with SMTP id
 00721157ae682-7114edcb04fmr56567777b3.33.1749740662363; Thu, 12 Jun 2025
 08:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250515153907.151174-1-cohuck@redhat.com> <20250515153907.151174-3-cohuck@redhat.com>
In-Reply-To: <20250515153907.151174-3-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jun 2025 16:04:09 +0100
X-Gm-Features: AX0GCFtWVVUEsGciOpuhQYdpTNAk5ugyqKk3hjsV_bBetoONUXe_HXNhehSuotE
Message-ID: <CAFEAcA8y_wwZPoqkyPrNscRNTEwiOQm5Or9C=aiSNMGcZmq8CQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/14] arm/cpu: Store aa64isar0/aa64zfr0 into the
 idregs arrays
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org, 
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev, 
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, 
	berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com, 
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, 
	pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: 3eg25kfTIn4Y

On Thu, 15 May 2025 at 16:39, Cornelia Huck <cohuck@redhat.com> wrote:
>
> From: Eric Auger <eric.auger@redhat.com>
>
> Also add kvm accessors for storing host features into idregs.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>


>      if (!cpu->has_neon && !cpu->has_vfp) {
> -        uint64_t t;
> +        unit64_t t;

This doesn't compile :-)

-- PMM
