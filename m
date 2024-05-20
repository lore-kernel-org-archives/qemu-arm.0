Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1443712ejb;
        Mon, 20 May 2024 06:31:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLRa7seLvv59n6s4WlEny6HtwdGG4bXgz8ksr0sxbFiYia+2+Rrn5wMvbkgLNdlxAjehBMScWK4jOv4NAfjBYWw/bbQ/M1
X-Google-Smtp-Source: AGHT+IFXKrHHYXyiFl1oq3yfGPiDvHT8tHqWaEEymGdXK5Iwgz5gwB1sKQBpWbyjHLVxwecAG8wW
X-Received: by 2002:a05:620a:284b:b0:794:889e:5dfb with SMTP id af79cd13be357-794889e5ed5mr168529685a.64.1716211864976;
        Mon, 20 May 2024 06:31:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716211864; cv=none;
        d=google.com; s=arc-20160816;
        b=ais/JpzwEsm9YUN+vL/RSFYvRSFbYENtZLo81EplgoFz9bi+qX6fTd6f1U9TfxVG8y
         kRRGIPEktlVELD4QzNRgQ6Q9AhYZkFSjnJ89ZNdEiV0lrfbRHSjUpFrSRRYFHWOV8wzH
         0V4y70Pbv1P33JyX9+Kb5crT2fQon85Y1rmBl6jWJ2EYrozAF9viVwndCIGSPlTm5RgC
         rjhu1GUReN2t2mvqgHZrElW4Ehlwyy85/+sSDBrV3C7tHcjNKmxL36/foBGyjW9ENK6j
         Gq62P8KFvp1241ZhM7ljpOJDqkCKjAE7Fuw0nLXdy5pGVy3PMP0OiQSvWGRvFpHTcSwA
         clhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=mF42ViA9DX/FcnHEc0NXxAvzMh/D7aDDJG8/LXRooTI=;
        fh=wJvXiwRAgadzE68XBi5d+U/BU2PPGXGw9fUhiFXlzV4=;
        b=GErVRDDMM1Lq1xeifYKVaash3iXmPvbQDqRpM7DWWODMc1xax0q4lFM8NCjtWW12xD
         04vS9We3AP4rayMVm1GgYZ/1zXGDwQGBTGvw9/8kimJtZHwmMg4S+YnqtKUl8tj/GcVT
         i8fPIf7Irq1lWTvR0s7ngi7fYtXpPuzvrEkDfPIxfmDw9fOmL7zTtC9wCn5/jP/tlonf
         3EcFEC2hvl/vrQIePtfF4X5jv3dNUx6HPgY/PX+CQSLxW5b3yH+h4pxfwWUMsfL0BMdn
         +fJZt2EoW91TImMy5InhXwb2iEoq94xcqyXTOGPqRVwZML2QLCpfTou57PwFbQM6HadU
         /i4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YaAZDGv0;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-792bf33b1b9si2463969185a.457.2024.05.20.06.31.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:31:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YaAZDGv0;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716211864;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mF42ViA9DX/FcnHEc0NXxAvzMh/D7aDDJG8/LXRooTI=;
	b=YaAZDGv0XGXCKGrXnBx97SKg2rSTXGHvIrMbo8HQD9lbYMb+Bbb3gvFOtnv0WCLE9V6MKO
	H5/EsFrX13HjvqxF6CxMAs8NxCox2mdZdK+rr4356ezqHRM3xb5nkuaYQ2OdP2pULdrkta
	syfUsRn+tK2zCMwbxUlf+Zwolc9taE8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-PgSjJsSLMhye3O4bTG8umA-1; Mon, 20 May 2024 09:31:03 -0400
X-MC-Unique: PgSjJsSLMhye3O4bTG8umA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a599dffe736so1227625566b.1
        for <alex.bennee@linaro.org>; Mon, 20 May 2024 06:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716211861; x=1716816661;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mF42ViA9DX/FcnHEc0NXxAvzMh/D7aDDJG8/LXRooTI=;
        b=M4DfkIYD1pglFenCZzpM99UYeUydrwImeO1lDPkn5T0/IC2nrdZATVkhZeLZguAD35
         mzxdK8ALAkw8GCoUxjL96jSckb5jVA4tgB3na2AkkwmDRTsaOMUenVOhd/UeONiHTFc0
         EK6C448leTJSe6qAcunq5M66IkyZHyi7Q5yw1+SzGX9OxuAmg82d6NxpS1kOmX7pHnTM
         Tl2YGfKpsj7RLa49ki2c+85thbq8xO8yDMsRCbOfs+zrWWXeUvQUoY98CURonAuiHxDB
         uhdT8az0zJQ5o1TlyuVTHX6GN/B/lTXEpsPFmDdBpv1MtEk85B8si5Cn8qZwvVUEVtmD
         eL8A==
X-Forwarded-Encrypted: i=1; AJvYcCVBu2YIOtcToDnkxRM6CTuOqSYRH3KxdiMNoLVVteX42m5BGV/iagJlIZMpVIsBdu0GITQKau32BVIqdcXb4VayPazuduVK
X-Gm-Message-State: AOJu0YzazkbrnTjW8DisEro/Qi7lAmzYMQtVyJtI9KaQKGVJ5J30jIBa
	g0l++hmUz3upP5JD9SiQehKDfk0WS8sX9B/O7yR3NY/4KumYluNdwXLPzjjT6o9rwzPfgHvmEeW
	pH1b8uPE64rNnVWCcH1dCDJVnVBSB/GwG9kEA7uwWmdKoGIN4tXe8gNTw7QoinA==
X-Received: by 2002:a17:907:924f:b0:a59:c3a7:59d3 with SMTP id a640c23a62f3a-a5d5a378936mr479322066b.13.1716211861254;
        Mon, 20 May 2024 06:31:01 -0700 (PDT)
X-Received: by 2002:a17:907:924f:b0:a59:c3a7:59d3 with SMTP id a640c23a62f3a-a5d5a378936mr479319966b.13.1716211860794;
        Mon, 20 May 2024 06:31:00 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5ce2982009sm587167666b.90.2024.05.20.06.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 May 2024 06:31:00 -0700 (PDT)
Message-ID: <b3488980-2136-4620-b875-a11f75373462@redhat.com>
Date: Mon, 20 May 2024 15:30:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC PATCH v3 15/18] hw/arm/smmuv3: Advertise S2FWB
To: Mostafa Saleh <smostafa@google.com>, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org,
 marcin.juszkiewicz@linaro.org
References: <20240429032403.74910-1-smostafa@google.com>
 <20240429032403.74910-16-smostafa@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240429032403.74910-16-smostafa@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nY3BY3+ZUrH6



On 4/29/24 05:23, Mostafa Saleh wrote:
> QEMU doesn's support memory attributes, so FWB is NOP, this
> might change in the future if memory attributre would be supported.
if mem attributes get supported
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmuv3.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 88f6473d33..8a11e41144 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -287,6 +287,14 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      if (FIELD_EX32(s->idr[0], IDR0, S2P)) {
>          /* XNX is a stage-2-specific feature */
>          s->idr[3] = FIELD_DP32(s->idr[3], IDR3, XNX, 1);
> +        if (FIELD_EX32(s->idr[0], IDR0, S1P)) {
> +            /*
> +             * QEMU doesn's support memory attributes, so FWB is NOP, this
> +             * might change in the future if memory attributre would be
if mem attributes get supported
> +             * supported.
> +             */
> +           s->idr[3] = FIELD_DP32(s->idr[3], IDR3, FWB, 1);
spec says:
0b0    Stage 2 control of memory types and attributes is
not supported and the STE.S2FWB bit is RES 0.


Thanks

Eric
> +        }
>      }
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
