Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2372258ejf;
        Mon, 8 Aug 2022 01:22:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5rmKi2O+iEwz595lCog7Zs7kYO9AemSdNjOTvIt0JYoRmZ2ONwujlAgdK6NMvXzVaKth4k
X-Received: by 2002:a05:622a:19a7:b0:33e:ca27:6206 with SMTP id u39-20020a05622a19a700b0033eca276206mr15213270qtc.629.1659946921029;
        Mon, 08 Aug 2022 01:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659946921; cv=none;
        d=google.com; s=arc-20160816;
        b=hcH4yZjjhMSNFs8YaPXtJwaEfPsOVSOCeMzXiPAOTRwSvR5+EfOHghU832YUBAwPaX
         QIC3fWIzM/s8ahRV5zabgmq9ETjbi3g/tLotaHtP9Jk1VxmDt6jP4zlKBa7sx72FHMtF
         D7XmT58mk5SRo/OY0J2sDRNPrq9WoGwKP5+9QgbkTONcqFI3cFGRxTWkHiHjTShbCyGF
         tNWh3pBaKVxGT9e3P4tG7CPmRrFFD2TYWduTEokfAEHVIR54h383MQlWirt9Rpnw4Iv9
         iW5e+8jI9349rhj3vJBtlGn6UvX5/wyABRKyWauPh1pA+q/R3CIU/gUvlFqzTC1NYOzM
         xtIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Xu7/rsLO7YUq+P2lrkzebLtqZAoBu1yM0k2w3nmzSTc=;
        b=R9OAaH0EYCfifDWTq/Pqs1TSYDCi1dDt5R9OzmGeD/sfJFtBACCBkZpmaR/5bBPts1
         BOfUlbDyBY2yf3RxEpW2wluukKWl0ZsarX4DEiuFiGhBN87R2ptaZtTN5dW03tE+XzAm
         5meLQDkNzzlRoGeqHpotax+BE9WKY6uKy892q4Xdx6R7BN7oktoYh85FLdA5MggO3sb7
         PFQZPXt+iGuYwXGHqHL18FXpRMdTpLB6U5M5WvK0H2A1R+7aUCi6wRYAckJb9vyP0LiH
         wkHDNo/+RV95hAzLcGKwr6mOmFr5ygIpNUIpKHNuMJnibxdYSR97gF/duK60N5LTbeRF
         b2nA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AdTVd0fy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t124-20020a372d82000000b006b625760264si5415912qkh.164.2022.08.08.01.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Aug 2022 01:22:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AdTVd0fy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oKy1Q-0005yO-Ht
	for alex.bennee@linaro.org; Mon, 08 Aug 2022 04:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKy1E-0005xi-0B
 for qemu-arm@nongnu.org; Mon, 08 Aug 2022 04:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKy1A-0004pV-I2
 for qemu-arm@nongnu.org; Mon, 08 Aug 2022 04:21:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659946903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xu7/rsLO7YUq+P2lrkzebLtqZAoBu1yM0k2w3nmzSTc=;
 b=AdTVd0fy73uaQE04ggOI8TaMFe5vpWPp3kJklFUrHVMQs124Vzoh756x9GOVZDSjFvEmjF
 fFh6kohhmS5TcLGBl7GUlAHNBVPp+PIiiSCTgQBRfS+kNnTqku/CyuJZBK7Beg6tfW60V8
 DNawtH8+ren0GLsjl75CSy04bwZht5k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-mwRDdhBOONO5roC3QYSYtw-1; Mon, 08 Aug 2022 04:21:41 -0400
X-MC-Unique: mwRDdhBOONO5roC3QYSYtw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bh18-20020a05600c3d1200b003a32044cc9fso4460472wmb.6
 for <qemu-arm@nongnu.org>; Mon, 08 Aug 2022 01:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Xu7/rsLO7YUq+P2lrkzebLtqZAoBu1yM0k2w3nmzSTc=;
 b=DULew7mGu/5YFKfPA3GmO9wpZWRIRuhUeTDRZmewPXzp3H22pH0v5sfLbCTzsYHNhc
 D3ZkpdLtuXa/MyuLx3z7C7wuLCA0M28iKgEISF+2p4y0+2lahDuXWN8/ExkiP4LdEp2n
 FqGS/Hv4O78rxA2tO6vYWF/dgR77S7UdRzhKJx2X+ayB82dQkcBmy+V/FhztuKumFapP
 vj0qIGqlFBQ7ADUe5NpefDiiaow+Im3PEdfnL8p1J6MtVRGZ0Lv0xjlDE0/BcjSAFdPO
 JgwaCMBhoExBvcnhHj+HVB8agNGWK8IVmMsnbNrCqpLgh7wUCEYH3BM5fJT+mPIpeap9
 MMOg==
X-Gm-Message-State: ACgBeo3phn7LG/GY6fERQmy7cI51m8IyJSPQxO9usKNOsg48SBWfEAiy
 p9/gLZbK1XmIn0lx2Y4cEokFiTVuTSzYxg+8I2iTMvcFgBK81FZE7fguP3gDj5d3z2S7rhSJQdO
 bbAwCYCSFJ7JM
X-Received: by 2002:a05:6000:1848:b0:223:5eb9:d1d5 with SMTP id
 c8-20020a056000184800b002235eb9d1d5mr620375wri.381.1659946899986; 
 Mon, 08 Aug 2022 01:21:39 -0700 (PDT)
X-Received: by 2002:a05:6000:1848:b0:223:5eb9:d1d5 with SMTP id
 c8-20020a056000184800b002235eb9d1d5mr620361wri.381.1659946899700; 
 Mon, 08 Aug 2022 01:21:39 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-113-71.web.vodafone.de.
 [109.42.113.71]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c240b00b003a331c6bffdsm13277511wmp.47.2022.08.08.01.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 01:21:39 -0700 (PDT)
Message-ID: <3f913138-4746-c8ec-6b54-4bc2d0f49cdf@redhat.com>
Date: Mon, 8 Aug 2022 10:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] xlnx_dp: drop unsupported AUXCommand in
 xlnx_dp_aux_set_command
To: Qiang Liu <cyruscyliu@gmail.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20220808080116.2184881-1-cyruscyliu@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220808080116.2184881-1-cyruscyliu@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RedfuXXboUeF

On 08/08/2022 10.01, Qiang Liu wrote:
> In xlnx_dp_aux_set_command, when the command leads to the default
> branch, xlxn-dp will abort and then crash.
> 
> This patch removes this abort and drops this operation.
> 
> Fixes: 58ac482 ("introduce xlnx-dp")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/411
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Tested-by: Qiang Liu <cyruscyliu@gmail.com>
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> ---
>   hw/display/xlnx_dp.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index a071c81..b0828d6 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -532,8 +532,8 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
>           qemu_log_mask(LOG_UNIMP, "xlnx_dp: Write i2c status not implemented\n");
>           break;
>       default:
> -        error_report("%s: invalid command: %u", __func__, cmd);
> -        abort();
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid command: %u", __func__, cmd);
> +        return;
>       }
>   
>       s->core_registers[DP_INTERRUPT_SIGNAL_STATE] |= 0x04;

Reviewed-by: Thomas Huth <thuth@redhat.com>

