Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp1183291ejc;
        Tue, 26 Sep 2023 08:30:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWYCJwjwaxzda4I+RkIvFuepf/Q97Q79bKv1dPruMygINEavhZZW1nR5lsj7a+t2yGDjxq
X-Received: by 2002:a0c:ab17:0:b0:65a:f989:8bac with SMTP id h23-20020a0cab17000000b0065af9898bacmr10186918qvb.20.1695742223448;
        Tue, 26 Sep 2023 08:30:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695742223; cv=none;
        d=google.com; s=arc-20160816;
        b=palea4+Rc1qvP1DR4BJwiEua0SMv06OxswbOYsLkJAO9aCWlYCkAzTPX7tGaGJSAIC
         pQp5J/K9DqnmTorlEeiAXzcYgf/m7IVoYsVhq/ceUmyY+fwa2g81AvRY8RLs5SA2opSo
         1Did7Hix/l3st7WQczLzBJR3cGHPtbM+4MuIbG+2ZKjFnEU/3v/hktsZYXZbrbMaLK9K
         o9+nrq3xYo6fwG3odjLcFJjVA8YEaTpF4dMMWcD0Q1vxacVlxZm6q3R5TRf+aOslR0/g
         jKiRqWmaVKKg7p5ZjTpY4RwPIjKNdz7Fzytlu1U8onr+ax5nYrL9Zdz/o4JI0SjwWOem
         xoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=h3FpuoAVjtgmfR0gVBEUMoD+Y244oU+eFd2lNOx6WV4=;
        fh=0EG6RQyxC2EtFbpWOKakEtxYjFPaJnFsRkAqgEoOp2M=;
        b=GGxI3h0IJN465I2/mwxfzFn6HbDvgPovhq9CcASQnwZyZJwtmbvsbFru9LT4iyrmDK
         8hc9923fw4l2jfQCjiQE49IeQEzsruI9vDFZmm9TPJ5vWrNtQSMvERshb+ZTP2L+22oV
         mKR2fdDZLpG+NeunC0jWUeHFUcMpqWPVj0fBC5Vjrpq+b/1y8dM1lGA8HQD7jZaQZStY
         vMeJHRsR9fyj5Q4NioW7EfwDhQUSZFnl52sBjrJduRUaUmdjfDZFNAFF9cM9iGidIwv1
         BBbdLmR/cHnHrhvBk047dIo2WvQ7y+xQFNextb3PPfyii1u2TttCfKIPHEhw0BuMCxPp
         cW+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ro1pnt5B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8-20020a0ce008000000b006558aa10404si2477923qvk.63.2023.09.26.08.30.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Sep 2023 08:30:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ro1pnt5B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlA0V-0006yJ-D9; Tue, 26 Sep 2023 11:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qlA0U-0006xy-1n
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 11:29:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qlA0S-0000aA-Hr
 for qemu-arm@nongnu.org; Tue, 26 Sep 2023 11:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695742186;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h3FpuoAVjtgmfR0gVBEUMoD+Y244oU+eFd2lNOx6WV4=;
 b=Ro1pnt5BIi5+vGYFbs+z0tC8er5XliPxxDA2RMGQxb4ddGU2w7W3MVMsHWkcNwJiqoAlEG
 xN2IkwYJnn8J70iLX5LWoJa3D0ayUtx46BVWjV7XVK64MVnrG5Q1ceo7VX7r7SFVMFzcsW
 crwJ00Pzl4QIEjTIEGTPGpNmLn5MEFk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-PeTfyhJ5N8ansthDQNUL-w-1; Tue, 26 Sep 2023 11:29:45 -0400
X-MC-Unique: PeTfyhJ5N8ansthDQNUL-w-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4052d1b19f8so81602715e9.0
 for <qemu-arm@nongnu.org>; Tue, 26 Sep 2023 08:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695742183; x=1696346983;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h3FpuoAVjtgmfR0gVBEUMoD+Y244oU+eFd2lNOx6WV4=;
 b=wFEPJOT3qwEwXorBgSkuRCvzrISH8UmMkIoaO0TqM+OikVyjvJlmRM6Ogyeqv9PjIr
 d7TAqA+JgqwNY8b5wc57h/OnJ82fPD3GpEo649fQ2iGpiJLDALtsfYDQv1F4M5PXLWX2
 glSqwyKsl0pzuMPxHsoFotAc0HPRWXweifiYNZ6TuJItxDfYiwtou0taH/FS9DzAdRia
 Nl/8NcnQoCh3DIGS2zZgDsfMU684sBU++YtwXJz7DsfbLPOHoF2A0l//WItarwfH3bGU
 t8Y1d0IF3KUegBivtS2OFf87MFod41uAwTHLJfnwXjypo6ENWcokCcH8fY+t8SpQy+s3
 Bjfg==
X-Gm-Message-State: AOJu0YzblHrqKCnwH8kUSGAcakI3f7lRou/syZ09nB24isdA1XmDNTpj
 Cq5CXv1ZFm3IaSa3bLjTOZG73TCGJMNMQ10MmJe4pCRkb+2NbAJgILGAVkYA3bR1lbCDLytiauS
 ba2/gro50gn57
X-Received: by 2002:a1c:7718:0:b0:401:519:d2 with SMTP id
 t24-20020a1c7718000000b00401051900d2mr9129647wmi.23.1695742183700; 
 Tue, 26 Sep 2023 08:29:43 -0700 (PDT)
X-Received: by 2002:a1c:7718:0:b0:401:519:d2 with SMTP id
 t24-20020a1c7718000000b00401051900d2mr9129635wmi.23.1695742183357; 
 Tue, 26 Sep 2023 08:29:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 c2-20020adfe702000000b003217c096c1esm14914913wrm.73.2023.09.26.08.29.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 08:29:42 -0700 (PDT)
Message-ID: <5c5ca6f8-18f8-b721-eee2-d1977210906a@redhat.com>
Date: Tue, 26 Sep 2023 17:29:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/3] hw/arm/smmuv3: Sort ID register setting into field
 order
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Mostafa Saleh <smostafa@google.com>
References: <20230914145705.1648377-1-peter.maydell@linaro.org>
 <20230914145705.1648377-3-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230914145705.1648377-3-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DansPvwubr6Q



On 9/14/23 16:57, Peter Maydell wrote:
> In smmuv3_init_regs() when we set the various bits in the ID
> registers, we do this almost in order of the fields in the
> registers, but not quite. Move the initialization of
> SMMU_IDR3.RIL and SMMU_IDR5.OAS into their correct places.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/smmuv3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 1e9be8e89af..94d388fc950 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -278,15 +278,15 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      s->idr[1] = FIELD_DP32(s->idr[1], IDR1, EVENTQS, SMMU_EVENTQS);
>      s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
>  
> -    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
> +    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);
>  
> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
>      /* 4K, 16K and 64K granule support */
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
> -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
>  
>      s->cmdq.base = deposit64(s->cmdq.base, 0, 5, SMMU_CMDQS);
>      s->cmdq.prod = 0;
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

