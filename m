Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1552048lfu;
        Thu, 28 Apr 2022 00:53:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDFIgYMALJsQrAAOvQFRZfTMRcO4HbO/3qosyTFPnmYe9vF/m2PUonIt0tdd+OgDbfqkXT
X-Received: by 2002:a05:6214:ca2:b0:452:f242:f6e3 with SMTP id s2-20020a0562140ca200b00452f242f6e3mr20795197qvs.112.1651132430577;
        Thu, 28 Apr 2022 00:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651132430; cv=none;
        d=google.com; s=arc-20160816;
        b=hQtD/gEWLQJiqaPoCd8UfuDRkJGZ625s2OMRzzr4sF0jxvBUPDVswU0w1ArgtRQWiz
         24Cpgk6LDyum7+hBz/8ygzqZPKV0fNg8kC7nYLg3njH2X+41jeey61MHV0OEEKi32Swf
         lHjZq0bpSGcEApFtcCLWis5+Pe/xEskXnXhbm15h87luuaSbDSC3YZjSw/mMBw4HY0p9
         XLDv2aXYhz5MqHc0aGUl4qgk3K3K8UENvgQA9Zk7LB0JVARQg9vVEDOtujKNFpNQz+2F
         Oq3yjoHxiFIKjgOuhQvTJfMDm09Yy7s5qujzOmCtu5klPLfJBYfpUU4aOKam3S6FPz7K
         gfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4CnUPrd9pk15XVP0gJJP5BS7DxyRw92zxEwCfGq67nY=;
        b=K3iYFnKiRBIG/f0JZkCEC8H6KDr4Rl5UdM7cgZjqGqLN9UpjmXOkEYNvfZ9F2ZnMGf
         ptBwKl0aMx5kdox9KtboU1JXDho1E/OP9528W1U1wpXoZ72kIP2+vPdTpVWn6XuHDkG+
         eV6bl1eo/ezEqFarbnC6B7pEXV57eEgSn4+Zw5bx1nMwFPcYvrcjiJjXldBUGYHBT8aT
         iH1XZilUoMw38BSNRQ6vkEcQCvuboXmwYhYD7sVyOSPxo89fnMzGC+JM7t8A6h++Ev4v
         PTAh7WtxxZhLJ0PdWaOqkQi88KuuM1dh5dod7fnaaDRQ/kxjuoTiVRSOggOP7dPXwxdV
         my4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TCAO2S+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t40-20020a05622a182800b002ebca184e52si1302881qtc.277.2022.04.28.00.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 00:53:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TCAO2S+G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njyyE-0000z4-3j
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 03:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1njylv-0004ay-20
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 03:41:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1njylt-0003Tk-Bv
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 03:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651131664;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4CnUPrd9pk15XVP0gJJP5BS7DxyRw92zxEwCfGq67nY=;
 b=TCAO2S+GnODjrTW3csq2AscyuSncVuYE5E1wALu7eyg9zWHTIglRpDiCtl2SSolgwVbtYy
 PKHQZ2N1tLnlNOTLtyqtBcxS3GwlVPRDotpB9AQZ47oGw+ZUhujmpVcHjlx//YT+qBsUSf
 IEy5Aw6lLA3ikYOLGXh0YTUEvSNT4fU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-JHWGB5eDOxeNibrKGvGyzg-1; Thu, 28 Apr 2022 03:41:03 -0400
X-MC-Unique: JHWGB5eDOxeNibrKGvGyzg-1
Received: by mail-qt1-f197.google.com with SMTP id
 n9-20020ac85a09000000b002f383ea27cbso2769389qta.16
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 00:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4CnUPrd9pk15XVP0gJJP5BS7DxyRw92zxEwCfGq67nY=;
 b=LO5X2mYWITMyrCnFvlQDJTIjrQIbxZ0CRU36Lxu4Kh9mQoKAiqkR5dH0xq0Xc6okZb
 WlbI+7ctU0jy0WNi/oklUn2/vCqsmEr1UzhtC7QTNEYqPwJb9EX+mboRU34hUHCIaJ4F
 W9NCnSGpix4ddJv6hztWr6MPRV5tXU+/Sf5ReCg34MQHWg/8vpxQMKN3S43y/qgqpEWV
 j8lNvNs/cupdzEl86ZkmedCS+Las+te9zi2RcuWZ3lsDJ7mDRRLNuynnpqU1Gi99eIHp
 1e1rOwypGOoVvgZp6hZSMo6ouTWgq6FVFO/JDwbBIWvpzjo0quPhtqsP54vIuOY9rXum
 eDHQ==
X-Gm-Message-State: AOAM5337Al3HKV3NQ3WIpI0FL6gHYw6idjDzTPoMtoNUNMUzyQ9CEO41
 qRhHhcVp2n+Sg5PBxJRuQA3yx+6g/SsypbwTAfwveWYBWuw0Ld6N1fqQkp2puPiHYeQYv1OlVmA
 +O1P0+hxLMVOF
X-Received: by 2002:a05:620a:46a3:b0:69e:d29d:73d with SMTP id
 bq35-20020a05620a46a300b0069ed29d073dmr18440966qkb.463.1651131662992; 
 Thu, 28 Apr 2022 00:41:02 -0700 (PDT)
X-Received: by 2002:a05:620a:46a3:b0:69e:d29d:73d with SMTP id
 bq35-20020a05620a46a300b0069ed29d073dmr18440961qkb.463.1651131662802; 
 Thu, 28 Apr 2022 00:41:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 h19-20020ac87773000000b002f388ea2959sm494922qtu.36.2022.04.28.00.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:41:02 -0700 (PDT)
Message-ID: <8278541d-26c2-e606-5d46-c665358c89b5@redhat.com>
Date: Thu, 28 Apr 2022 09:41:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] hw/arm/smmuv3: Add space in guest error message
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20220427111543.124620-1-jean-philippe@linaro.org>
 <20220427111543.124620-2-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220427111543.124620-2-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ELC69wkVNN1J



On 4/27/22 13:15, Jean-Philippe Brucker wrote:
> Make the translation error message prettier by adding a missing space
> before the parenthesis.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  hw/arm/smmuv3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 8b1d8103dc..3a989b09cb 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -786,7 +786,7 @@ epilogue:
>          break;
>      case SMMU_TRANS_ERROR:
>          qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s translation failed for iova=0x%"PRIx64"(%s)\n",
> +                      "%s translation failed for iova=0x%"PRIx64" (%s)\n",
>                        mr->parent_obj.name, addr, smmu_event_string(event.type));
>          smmuv3_record_event(s, &event);
>          break;

