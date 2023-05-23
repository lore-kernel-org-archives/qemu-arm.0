Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2071300ejb;
        Tue, 23 May 2023 11:29:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5SMVkNG6S/5r6y8xMDqKgEUkkgucgHIYwZhrqJR0S+RZupqES+juDOFvsGK/sGUuPVZDTB
X-Received: by 2002:a05:620a:6541:b0:75b:23a1:8e6a with SMTP id qc1-20020a05620a654100b0075b23a18e6amr4864535qkn.59.1684866589998;
        Tue, 23 May 2023 11:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684866589; cv=none;
        d=google.com; s=arc-20160816;
        b=LSKYSaNWIqEEfaMa23rV2p4/dI8HhcuJqBClfBNNKI6717+H1pUoQvuGSn5xWwNnJT
         5EvXmTNjFsJrcapK7/6PFJnpnLYwcsNLWHPGJ+J1OfJ9nlhIblT3+lWLSSHQUuGVOsAh
         Z23Onq5N8jdgnnFBWqesbnJRLSjB54ZAtSxUjl11QuB9fsXfVzJTMYfGkt6X3/PUp0Hd
         mHN2fKlkRApF8Hmh8fpzR5eFU7W+SH/hv6YRRx2NPmjTkdoKO5jY1Bg6LflVJN1lpvol
         BfQyx8GvxsLM6KnksFYvLKSVbg+ikC2TcdWnPfzHkCLrbXlqSNqzSTc+oqiRgiso2sSE
         ToyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Mz4fIclPRJzGhWG2Ln8IsExyeM4l3/aw3hEW/rJT7UQ=;
        b=W1+TmgJ0H/5A/nXYxE4cu8G08vHibG/T/TSrL0btnk7PFj4ryOvUGUMMamQljuYPGu
         wac+MBwLhA/QUncCuCNVqn8BMd7bV9TmhTFIwoE/8JiutDmcUeQyJATMjj9eZ+z/QOAx
         uQo4Al1I8HY9c4YqppILkpNZjNDaweDw2syMhKZuZLBk6vjfawabHpRpzKnBCzqaX9NB
         DtZHXBxa7Jxi5iKakp1LrfqeKoazsKlr5t8F7Zw1BF4erCABy8OciW3x/ZQ9byRyLIf1
         sdZHwDB/bJuWLgMkdn+ECMF0e55lscGaRrOX1/3JiUKNf1vOQU8F0DpqQkgsp24XDyYb
         OFyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Okm+orEs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s25-20020ae9f719000000b0075835f16ab2si5067939qkg.594.2023.05.23.11.29.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 11:29:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Okm+orEs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1WlU-0000qG-R0; Tue, 23 May 2023 14:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1WlS-0000oT-Pf
 for qemu-devel@nongnu.org; Tue, 23 May 2023 14:29:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1WlQ-0004Vp-5G
 for qemu-devel@nongnu.org; Tue, 23 May 2023 14:29:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684866579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mz4fIclPRJzGhWG2Ln8IsExyeM4l3/aw3hEW/rJT7UQ=;
 b=Okm+orEsWrKNnDmTLegiCSaTbHQBbRGikOrHJ4dLEK42PxDvUnv7BbC/6of2ocGFI1+ldH
 Ifcx3zLQiQCjoqypAqFiA2moiNpUzGrxOM3dPJwmEjvREaqLpisHllIkLDm03J3i954wZd
 oXrwEIqHd7fhvISodZmqbIPdzS9V2BM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-6C7t7ONBOHautx1pfxj1Pg-1; Tue, 23 May 2023 14:29:37 -0400
X-MC-Unique: 6C7t7ONBOHautx1pfxj1Pg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30932d15a30so4569054f8f.1
 for <qemu-devel@nongnu.org>; Tue, 23 May 2023 11:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684866576; x=1687458576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mz4fIclPRJzGhWG2Ln8IsExyeM4l3/aw3hEW/rJT7UQ=;
 b=am2MRcIWoqPIq8RUXOrjnxZk6tteE+MMaYUPK5pIbemEokhVMlkJfj9/lqIwBHvqoj
 zFVC1FJBL1lSxRI1h5csJ1FPf/3fWEo5cJ3zS/a14/lIWRH5pTku3dBMe1pxlzws0gwr
 vOB3cSvC7nGObsCNOh/jmZSI2k6v7Q3v2IeH3vls4Zq9ROqYMgXEUYn66QeXJQ6BmMzH
 V0E9bLlgJTnSNsVF9oaWOuy01Dt4EQhlFHeSb3t50mK8Be8xZfzOUvJAE9HNvYJdXOkb
 rp2WSIurjVPHs4J5M4YzHPRUBWx06xE0PM55puPFRlSMlxPDjXH0QnpL2sOP/srxJyek
 5j1w==
X-Gm-Message-State: AC+VfDzy4NfpassANWBuPuvofthzwAt+UzLo06yhiERDYwQyUfWW39jh
 T8s5VTG2NnQYGedsQKaJMXOT71/zY5rUzc9MYGzM7GxXiaiAs0Eotsswr6Hipxk7W75aiEMvATq
 F8oVfGaQNGQvVgnA=
X-Received: by 2002:adf:e7c8:0:b0:306:462a:b78d with SMTP id
 e8-20020adfe7c8000000b00306462ab78dmr10995548wrn.53.1684866576774; 
 Tue, 23 May 2023 11:29:36 -0700 (PDT)
X-Received: by 2002:adf:e7c8:0:b0:306:462a:b78d with SMTP id
 e8-20020adfe7c8000000b00306462ab78dmr10995536wrn.53.1684866576469; 
 Tue, 23 May 2023 11:29:36 -0700 (PDT)
Received: from [192.168.8.105] (tmo-117-143.customers.d1-online.com.
 [80.187.117.143]) by smtp.gmail.com with ESMTPSA id
 c11-20020a5d4ccb000000b0030631dcbea6sm11817830wrt.77.2023.05.23.11.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 May 2023 11:29:35 -0700 (PDT)
Message-ID: <339e36a8-6846-a127-e80e-9b31a7f9dc42@redhat.com>
Date: Tue, 23 May 2023 20:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/3] docs: sbsa: correct graphics card name
Content-Language: en-US
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <e682f6d5-acbe-7910-54ef-4d75c88a3d28@redhat.com>
 <20230523172855.679018-1-marcin.juszkiewicz@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230523172855.679018-1-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8WOuGgrkmlpe

On 23/05/2023 19.28, Marcin Juszkiewicz wrote:
> We moved from VGA to Bochs to have PCIe card.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   docs/system/arm/sbsa.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
> index b499d7e927..016776aed8 100644
> --- a/docs/system/arm/sbsa.rst
> +++ b/docs/system/arm/sbsa.rst
> @@ -27,6 +27,6 @@ The sbsa-ref board supports:
>     - System bus EHCI controller
>     - CDROM and hard disc on AHCI bus
>     - E1000E ethernet card on PCIe bus
> -  - VGA display adaptor on PCIe bus
> +  - Bochs display adapter on PCIe bus
>     - A generic SBSA watchdog device
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>

