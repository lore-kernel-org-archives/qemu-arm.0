Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp563812ejq;
        Tue, 16 May 2023 10:19:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7AH4U97R8HG+ygIossvQh6JJ6s95kYJUiHcXghH6bh+2bydzI2Yvfp8Fg6Gk+Rohna0Kg5
X-Received: by 2002:ac8:5b86:0:b0:3f3:a0c0:cd6f with SMTP id a6-20020ac85b86000000b003f3a0c0cd6fmr40543336qta.9.1684257563560;
        Tue, 16 May 2023 10:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684257563; cv=none;
        d=google.com; s=arc-20160816;
        b=kBhQdgl33emazb2jaUZ/4v+7zfApjGrsVO0tg2xt1lnflm0y3FEGwhwjKlXdE1KXf7
         qcsy5S7Aj6kV5Cq1Pvt35AbOPX8UTBbp0DrxvGxQSRnOLXcQyJPM7nBF0l0stS6UYteA
         Ce0jyZS3lmIjv58wsGbw1mQgyzg8ptrRlBYf9RWjTl8fk576GlHXOnEwo97vgp/WDMGt
         Osvv2n8m/YDtHplEW4OduFlJ927hcGP/1p7gdJxjIImABaZjee3M4ZaanE8OXkHudMXe
         U95qEDuEcAhC7m+wz1y6f9k/OHmIuvfyRUeyZsRNLeZBuLO9CB2pjX8P3+7LDqfF9MZA
         lKGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0yN+azlWQAFsJEY82hr3p6/4BJ9kW99ndVGXmr10RVs=;
        b=ODAoP1XI9AXav8bFQJKMF0pZVnpjmLWefjX5ej0bKveANzqxzjzDULxCHOyjux4Np7
         D0WbRXRhG0IlutRkD+okuaKFO9qe5/oS0tXuNudfctcEg00ejl24qfnlGF6/dDfHy08n
         /u3xlqPvz4HE+T3cilGBvytufN/VFon/Aa0rNOsQbQR/38ARkkrs1vdB01eaVB43qY9l
         1g7Obo2rAqhaua52gIOJ9DF5yhZ4wTc8q6AV8mK4HZYXsvQ4GxswUbDjAjfIO3z3wD/J
         p2kxhiOnBprLRyADYs6WU2PIjNgH+BCzREqpj9Rz6pOx7HfNL6XGNz7TL0iqcD61Gbkn
         YC5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PBgSxdxg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp42-20020a05622a1baa00b003f0a2ea8f7bsi11337210qtb.304.2023.05.16.10.19.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 10:19:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PBgSxdxg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyyKT-0002jf-Qg; Tue, 16 May 2023 13:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pyyKS-0002bj-Hk
 for qemu-devel@nongnu.org; Tue, 16 May 2023 13:19:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pyyKM-0005Y8-CM
 for qemu-devel@nongnu.org; Tue, 16 May 2023 13:19:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684257548;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yN+azlWQAFsJEY82hr3p6/4BJ9kW99ndVGXmr10RVs=;
 b=PBgSxdxg79dY/PgDqzupR8yk3mtengvNA38n0d8YY6heBlrc5xFqXSJtjQST9ILqZ5J3q6
 nJcvAmXWTa1pazueywIb7s5TM6QHyjiJ54LOdVRinTCxQg/1bZSIf0R1+bYeTMJZySww5/
 frADUvk9NYhbwOLg8moTbApVpoirtFo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-7ASLInVxMyCnQZaSdRTMXA-1; Tue, 16 May 2023 13:19:07 -0400
X-MC-Unique: 7ASLInVxMyCnQZaSdRTMXA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3093cb05431so89348f8f.1
 for <qemu-devel@nongnu.org>; Tue, 16 May 2023 10:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684257546; x=1686849546;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0yN+azlWQAFsJEY82hr3p6/4BJ9kW99ndVGXmr10RVs=;
 b=I5Pg5Zw2TKN51Ax0XRD1HzSJKL4y2Bx1UMHqf7/kBwrhQ8MC3smpETIBJgY3rGeaus
 hP7UjtmpPK4ncTSIXXlSouauctFaCfwvQRJoZnVS4+AZ/PXq/ZjPHOKcQKfx+c0NqiaH
 6SKVYpt152RejwiWgICfepbysHW069KNGmivqCKzzex7zrIZqs+tBAJWHbFtb9NH546u
 fjqg053CQUxXcNMs4K2CmQu6BFRbcX7HqU5IXfaN8IBvFZfQ+RIj7tWYzZ8oHEU1XI0M
 wxXi6/HRgiCOkMID2ykHS2KbbpepgPnNNLmn2ANpEUGvbUQnTwqmzbFoJsvovS6lJezd
 RFeA==
X-Gm-Message-State: AC+VfDwq4oUld/dcKKYCyz8VJ1/9af88ASK4kEaw74euIG24GWOj0w6o
 dLVX0S3JE2WlISapOg34eM582BG0LjHbmGwRlJg5J05rxIhnKrgjGP2Tc5gIJzXNDkVfz6yuimx
 uMhGNd6vel9I/974=
X-Received: by 2002:a5d:4570:0:b0:306:44a9:76a1 with SMTP id
 a16-20020a5d4570000000b0030644a976a1mr22806564wrc.17.1684257546297; 
 Tue, 16 May 2023 10:19:06 -0700 (PDT)
X-Received: by 2002:a5d:4570:0:b0:306:44a9:76a1 with SMTP id
 a16-20020a5d4570000000b0030644a976a1mr22806546wrc.17.1684257545904; 
 Tue, 16 May 2023 10:19:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 e17-20020adfe7d1000000b00300aee6c9cesm61518wrn.20.2023.05.16.10.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 10:19:05 -0700 (PDT)
Message-ID: <392f50f5-9d59-bd01-c7a1-115c351b5d60@redhat.com>
Date: Tue, 16 May 2023 19:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v3 05/10] hw/arm/smmuv3: Parse STE config for stage-2
Content-Language: en-US
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
References: <20230401104953.1325983-1-smostafa@google.com>
 <20230401104953.1325983-6-smostafa@google.com>
 <c5b495d4-8679-8190-9966-d3ab82cb1a6d@redhat.com>
 <ZGJR0yYaIxfddu3j@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ZGJR0yYaIxfddu3j@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.666, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WeTs77zwGep4

Hi Mostafa,

On 5/15/23 17:37, Mostafa Saleh wrote:
> Hi Eric,
>
> Thanks a lot for taking the time to review the patches.
>
> On Mon, May 15, 2023 at 03:03:28PM +0200, Eric Auger wrote:
>>>  
>>> +/* If stage-1 fault enabled and ptw event targets it. */
>>> +#define PTW_FAULT_S1(cfg, event)            ((cfg)->record_faults && \
>>> +                                             !(event).u.f_walk_eabt.s2)
>>> +/* If stage-2 fault enabled and ptw event targets it. */
>>> +#define PTW_FAULT_S2(cfg, event)            ((cfg)->s2cfg.record_faults && \
>>> +                                             (event).u.f_walk_eabt.s2)
>>> +
>>> +#define PTW_FAULT_ALLOWED(cfg, event)       (PTW_FAULT_S1(cfg, event) || \
>>> +                                             PTW_FAULT_S2(cfg, event))
>> The name of the macro does not really reflect what it tests. I would
>> suggest PTW_RECORD_FAULT and PTW_RECORD_S1|S2_FAULT
>> I would also suggest (cfg->stage == 1) ?  PTW_RECORD_S1_FAULT(cfg,
>> event) :  PTW_RECORD_S2_FAULT(cfg, event)
>>
>> PTW_FAULT_S1() and PTW_FAULT_S2() are not used anywhere else.
>>
>> I would simplify PTW_RECORD_FAULT(cfg)  (cfg->stage == 1) ?
>> (cfg)->record_faults:  (cfg)->s2cfg.record_faults
> Yes, this is much simpler.
> I am wondering as stage-2 only SMMUs can have stage-1 faults as described in
> (IHI 0070.E.a) "3.4 Address sizes".
> If the input address of a transaction exceeds the size of the IAS.
> I guess this means that the fault record in this case is still controlled by S2R
> although it is stage-1 fault as there is no CD or stage-1 config.
Yes this sounds sensible.

Eric
>
> Thanks,
> Mostafa
>

