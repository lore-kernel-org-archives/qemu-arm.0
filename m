Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp4057503ejb;
        Tue, 21 Mar 2023 06:23:19 -0700 (PDT)
X-Google-Smtp-Source: AK7set8UTHWdUp2BWSEjelHLBSGBbXhzrl71F1TFgtGRssnvuarYKix9dI7am9OXiBGlil1iATBW
X-Received: by 2002:a05:6214:528a:b0:56e:a9c6:d2c6 with SMTP id kj10-20020a056214528a00b0056ea9c6d2c6mr3535200qvb.6.1679404998834;
        Tue, 21 Mar 2023 06:23:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679404998; cv=none;
        d=google.com; s=arc-20160816;
        b=gztZM1C04yuRBFMymCxTEDKWrCNRjBcbH4Ibm8CbZBf2kpqCGsM1nSDyl8xH0+dsvB
         cQw/+xp3WBcns5gAySpCyUl+vKGAcRrMzCL4EO41fKaYcNoJ5iudLP4ADg1ZlH5B6/IA
         aqItSjYTNa70E80d8Mv8gAmabWHSOlWYIfo80TDtElMyUhslcyW93MQ7LR3IZ/ryliKS
         sxzXPgvKD+geH2Dl2nCzHKF/VZN/xeii5/lfqh8a0N37rCORrSSM+DwaXB+LSsZCSiJU
         wIN6SlPyShB1jlUcI9lI3hG6xvWOUR8m2lV/C54kR/bxrDx+IEeQ4QsnlsDZURBXylvL
         8Pag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fadMJGg/aM6de+s+5IKvugmInuaa86crxGsVLbONVkA=;
        b=Q0cYWfxq41H+WONhu9DCs/ec5nrFGNaNAg6KrelC8iDAIV5JSe/iO6KUv2JeVWEvgL
         Uv26pvAudfuQR6KtTB7z0E2UyxtVgqC9dcmc/kMqNtU3xHL+vbFNacW2lC1TIDDbFo2i
         TCTa9yeFHPmXgsvfhIgplqnWUBSniWeS9gIYYgEYdkmNpcK5KwkpLP5r8iRaXvF+iKKH
         dKNQ3Ka3GI4EjJw2AY3Fu+oUhv+awqa9ISTk7rTtS2xN2jnHsYVU56iqdoDG/0L9AGXd
         GJnZfYFoot6xwDz/Ak/tZNsAaXnsyZhWKpYEATTd0fumtH4/PPe9pZDZyVezKukUs5OF
         QAtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DNAicHtU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3-20020a0ceac3000000b005a5226116fesi7424297qvp.497.2023.03.21.06.23.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Mar 2023 06:23:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DNAicHtU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pebxJ-0005ol-Dh; Tue, 21 Mar 2023 09:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pebxH-0005a5-E6
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 09:23:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pebxF-0008Pp-LR
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 09:23:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679404988;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fadMJGg/aM6de+s+5IKvugmInuaa86crxGsVLbONVkA=;
 b=DNAicHtUswAlt+KkJOX6B5NEp1eHUvHunVY7MBc1WjgmmLi/LZSz/AmmF0Uim/irCRpCE0
 4ew1+ZUIuPdKWvHpD4An4aJoP9YLd4pj1FxIBHWYIEhIOZDrzIhyxqyMscdmu+kn6+8T+r
 sRRJ8VE878p+y/q/bPvXq6qwnpX0mNY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-fOCsxOPWPV2xQGDLG4Gb8g-1; Tue, 21 Mar 2023 09:23:07 -0400
X-MC-Unique: fOCsxOPWPV2xQGDLG4Gb8g-1
Received: by mail-qt1-f199.google.com with SMTP id
 fz25-20020a05622a5a9900b003d6c5910689so8694197qtb.9
 for <qemu-arm@nongnu.org>; Tue, 21 Mar 2023 06:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679404986;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fadMJGg/aM6de+s+5IKvugmInuaa86crxGsVLbONVkA=;
 b=o+aBaesN1odk5WiSJPDQ/PYnMYj/mKiFL+J9YuHHgLgrKByrhREBrdRhsHynyY6yIq
 Vn/K34GvbLWw1H1XDqAaJ4hd4ouPbf1z1ufajk5b34OoxCKqeg4hdvpYXo/258rxFz4V
 aBFd1S7GnCj7UwKhiYF6edjZkjzlNtItAkCWWemm8oPinVjettoEf1Fq2qz1GSAgp9/U
 wt/CZXioa1GQSrEQwgXigYCNG6Lh+In9BLMTUZX1jG2BfT+rmfuLO78LVQ6G6LYXSTsk
 dkchF261Qu/421oRQqUTku9oa4sH9xr+wlziP/DVnKT9cSpiw0SYom6c0SOaOliEeOXr
 Z34A==
X-Gm-Message-State: AO0yUKUX2azrDpFK4CeoHh27jwqFa+xIIL3FFZePWsqun8qNmDqyuYbq
 NPFof7GWm5VFpR6d/mkz7ako9TdMtJL0XzocUdT/fMYUmefyZ2KyF+BvZI9cBRTfdgZELBoryy+
 cuva4QM82dkQe
X-Received: by 2002:a05:622a:1446:b0:3c0:3db8:387 with SMTP id
 v6-20020a05622a144600b003c03db80387mr4445180qtx.11.1679404986659; 
 Tue, 21 Mar 2023 06:23:06 -0700 (PDT)
X-Received: by 2002:a05:622a:1446:b0:3c0:3db8:387 with SMTP id
 v6-20020a05622a144600b003c03db80387mr4445148qtx.11.1679404986351; 
 Tue, 21 Mar 2023 06:23:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 l6-20020ac848c6000000b003bfb0ea8094sm1712039qtr.83.2023.03.21.06.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 06:23:05 -0700 (PDT)
Message-ID: <d2e9d8d5-1cf6-67fe-e780-41038fcaa376@redhat.com>
Date: Tue, 21 Mar 2023 14:23:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 10/11] hw/arm/smmuv3: Populate OAS based on CPU
 PARANGE
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-11-smostafa@google.com>
 <6e6810c3-c01a-5a2f-4fed-64c9391e22ba@redhat.com>
 <ZBmruj7OME3Pfbh1@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ZBmruj7OME3Pfbh1@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Ej35l6RWadYW

Hi Mostafa,

On 3/21/23 14:06, Mostafa Saleh wrote:
> Hi Eric,
>
>>> +     * According to 6.3.6 SMMU_IDR5, OAS must match the system physical address
>>> +     * size.
>>> +     */
>>> +    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
>>> +    uint8_t oas = FIELD_EX64(armcpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
>> is this working in accelerated mode?
> I didn't try with accel, I will give it a try, but from what I see, that
> ARM_CPU() is used to get the CPU in traget/arm/kvm.c which is used from
> accel/kvm-all.c, so it seems this would work for accelerated mode.

yeah I ma not familiar enough with that code but it is worth to be checked.
>
>>> +
>>>      /**
>>>       * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
>>>       *       multi-level stream table
>>> @@ -265,7 +272,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
>>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
>>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>>> -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
>>> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, oas);
>> I am not sure you can change that easily. In case of migration this is
>> going to change the behavior of the device, no?
> I see IDR registers are not migrated. I guess we can add them in a
> subsection and if they were not passed (old instances) we set OAS to
> 44.
> Maybe this should be another change outside of this series.
Indeed tehy are not migrated so it can lead to inconsistent behavior in
both source and dest. This deserves more analysis to me. In case you
would decide to migrate IDR regs this would need to be done in that
series I think. Migration must not be broken by this series.

Thanks

Eric
>
> Thanks,
> Mostafa
>

