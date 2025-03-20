Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1042067njc;
        Thu, 20 Mar 2025 08:43:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3vt/KShaCEEnJcOi67UNPUoGGpJYGp35GW9WS33aACzlp7I0EXK3VOgq0ygZ/6oaajW/r30bcg3HaBg==@linaro.org
X-Google-Smtp-Source: AGHT+IEbA+tilqMc00tJwAFZsF56fm5mVMJ/zikTnAF34pecflif+eB2ATalvTLQ93tVAZxXUhTH
X-Received: by 2002:a05:6214:4a5c:b0:6eb:2e6c:3e02 with SMTP id 6a1803df08f44-6eb34a0f24dmr50448026d6.21.1742485388756;
        Thu, 20 Mar 2025 08:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742485388; cv=none;
        d=google.com; s=arc-20240605;
        b=VPAOECCdEgpF1UGSdYfzdf+s0AiQmAyKmN16BFX9poOcrk4KA66kypXS49tNr8sd+m
         8dc0wsWbcTfhxoGP5cVZWf+kdZ+wdSQr2NqpJVxhcRWRll7cGpAcZCsQoG1JKQOGAftq
         cNsBeuZFY+ad9LKDJ9DZo0qNmkxfRgdN5TIgBTdAbhsgTWeATwgZ0EJaUBjr6dDc2wx5
         zD5byXB8EfvpXvti/cbUD/E7dJHYSFpoMQrQJPZRMLU0aihCyxkYFKxgu+/1+xxmGPgp
         lxZPpiW7asY6qthyCKUe3EDMKgDMIiXHXE5G/VKV7SXy45ueZKJ5xB0VW214NB624qQd
         ajFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=wPwr5oYVIaghPBmG3tNmTIpiegpJlMIqdWSy5HJcBsQ=;
        fh=yiCb6qugSXUX316ntFvyKXnsptijFdsr3ylK4bM5H7A=;
        b=FO/idTwiOXzJh9/DJASb1a4DMMezi/Ktuho4mpBgQ6eRPrzrRfWNziPwI3Pe4XivYX
         NwxEhxfnHUkFF38K4gnxF/bLTM4LSFOB3278XX4XEXVJIBGOD8Gcxamcn46dDZWwcP6P
         gDVDuRACHBWQBsQhqlEWTkS/XC5hLHEYNmyFTB4NfgA5puHldQjuNYbIikhKI2SjjUaL
         TKroxmnidbCJRnUiEYQfbrBN/PRKR7Yhqxl71HEFZw6VgXUJINXlmlcPgVvgpuFF5n0v
         kQklmuNFjTBXJzDUNUHVKfnNEHi8zjCrzrfrNcvva3dheAYmC77UBqbIMkA9bp/8LV1M
         NuFA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ad5Rbg5r;
       spf=pass (google.com: domain of sebott@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=sebott@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <sebott@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3f059f39si27106d6.478.2025.03.20.08.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of sebott@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ad5Rbg5r;
       spf=pass (google.com: domain of sebott@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=sebott@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742485388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wPwr5oYVIaghPBmG3tNmTIpiegpJlMIqdWSy5HJcBsQ=;
	b=ad5Rbg5rJZE7HUrWrb2ijWI9RMxZQPBASZ2qJZ4ipWiyqMIWzOeAAE/D7IkyH9xhB3d4fv
	NmSjGMtxZEtYUWTMvcQOqNfYXhTa9QQMeGIv/1d2n+HkcHVacZlo07v2WYYVkOh6z7J6tS
	XLaomjIU+O89yG7Ke/Cy34dQbT0YcEw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-NWw5fc7tMe65A6s9ILZKbA-1; Thu, 20 Mar 2025 11:43:07 -0400
X-MC-Unique: NWw5fc7tMe65A6s9ILZKbA-1
X-Mimecast-MFC-AGG-ID: NWw5fc7tMe65A6s9ILZKbA_1742485386
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so5869585e9.3
        for <alex.bennee@linaro.org>; Thu, 20 Mar 2025 08:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742485386; x=1743090186;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wPwr5oYVIaghPBmG3tNmTIpiegpJlMIqdWSy5HJcBsQ=;
        b=DjTvZ+GHPdsEisgBBye0v3/+z2tI6qGg8IwPffUZhYgHdHcN+dS2ehAgv9Xq9kKTDW
         YSRAoFXcVeM97UbLW+KxFqDAcaR/8obf0zkIKf2g1QhorhZLeuDHLVACDGE0iz2cvRsH
         AlwpF51CO/c28PwojnrrOm68Z5egsd3EqIJCHJJCVbho6GcxwN1M8biyNuOjGO2kHT/C
         7+vVUvsUXJ/pvMAsBVQ/MqyNxRaWmseRdpBWCWvlK6/tzArmkvQeA7yGC2uH9U3D+v0n
         aCZNgYIKjiyEDRIbNVh5BRNUAXtWTDXYbN3BO5H5GTWQILdUfVccfiegONRTyd2V6wk3
         FlqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1U8OOp0TFBrlHENMbnKhYBDdo+YSJ1Z6Ol1SL0vHkn21jOKOfOFH9xOuWBHA0MVX/ADmpejaL7GQ8Gg==@linaro.org
X-Gm-Message-State: AOJu0YzQ/QRvAXmIe7FckX5rt06Q/CcRu4S8exP5897Crbp2Nry3kEAN
	SXdrrUzciCmNAj5qVdvGyLsPqGLpqkN6a16lyXDR+hE2llKFqnwiDRGe3xbr40Wa1tfrRw3+0aW
	3qiVl9wlhJNsr8UrnmNxpjLXEeW0as/IpOrTY1cOgbvhwFKsDXBhsQQ==
X-Gm-Gg: ASbGncsBfFvjmyKbW9Rt5g/U9K6f71HPWhrYTNVSX+krcb3e/d8EjhGpaMOp/wKaEWp
	HpUiwT+VO6GSoXNVh6sgX+PTH5Kmt7su/q/JNZnzZx6uSBX1M1bi5b1YnFfw/y5KMonyP8DryXS
	ciVCg5nEV1moPWFfmEu5Ohxf1oG5GjWwZwGBe0q/TUhffyYUbbE+IPOTt2443w26Z8TJt3oxZ1g
	yW8jq8EaU4gxrAkuzprlglu7hwRhJ63JEoQT5TYzoPDDJV1s8umDYT66A4VtWSktfCr/SXBZbta
	kPAGh6466axIk8V6uiw/MdXisoW8G4UXOPnp2/bhwHWUkSDRwfVnSWwaiaz2PYlH
X-Received: by 2002:a05:600c:c8a:b0:43c:f597:d565 with SMTP id 5b1f17b1804b1-43d437986b6mr60472015e9.12.1742485386055;
        Thu, 20 Mar 2025 08:43:06 -0700 (PDT)
X-Received: by 2002:a05:600c:c8a:b0:43c:f597:d565 with SMTP id 5b1f17b1804b1-43d437986b6mr60471645e9.12.1742485385569;
        Thu, 20 Mar 2025 08:43:05 -0700 (PDT)
Return-Path: <sebott@redhat.com>
Received: from rh (p200300f6af11ec00f9928575aec32536.dip0.t-ipconnect.de. [2003:f6:af11:ec00:f992:8575:aec3:2536])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d440ed4cbsm52762105e9.34.2025.03.20.08.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:43:05 -0700 (PDT)
Date: Thu, 20 Mar 2025 16:43:03 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, 
    qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org, 
    richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
    oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com, 
    armbru@redhat.com, berrange@redhat.com, abologna@redhat.com, 
    jdenemar@redhat.com, agraf@csgraf.de, shahuang@redhat.com, 
    mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 01/14] arm/cpu: Add sysreg definitions in
 cpu-sysregs.h
In-Reply-To: <20250311162824.199721-2-cohuck@redhat.com>
Message-ID: <7c6ab887-2c9f-6646-4f0c-790671b28c62@redhat.com>
References: <20250311162824.199721-1-cohuck@redhat.com> <20250311162824.199721-2-cohuck@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: syI8wZ-SyEaN-jBeXFa0tTgOAah7Nepind1Q7q7hf1o_1742485386
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-TUID: RLyfCveRETVQ

On Tue, 11 Mar 2025, Cornelia Huck wrote:
> +++ b/target/arm/cpu.h
[...]
> +/* REG is ID_XXX */
> +#define FIELD_DP64_IDREG(ISAR, REG, FIELD, VALUE)                       \
> +    ({                                                                  \
> +        ARMISARegisters *i_ = (ISAR);                                   \
> +        uint64_t regval = i_->idregs[REG ## _EL1_IDX];                  \

This won't work for regs that don't fit this naming scheme. Up to this
point in the series that's only CTR_EL0, later with the auto generation it
will be more. But I guess this can be extended when/if there's an actual
need..

Sebastian
