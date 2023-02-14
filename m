Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1532085ejb;
        Tue, 14 Feb 2023 10:36:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+ckmsesN98TinK8ZFbeWD2/vnIxrhLkkhwOlwQvHajrwwUCMNwtDKxjPCcWsmAR0HUm7/S
X-Received: by 2002:a05:6214:528d:b0:56b:fa99:7866 with SMTP id kj13-20020a056214528d00b0056bfa997866mr6793390qvb.7.1676399819564;
        Tue, 14 Feb 2023 10:36:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676399819; cv=none;
        d=google.com; s=arc-20160816;
        b=urkEqDxh7agDETJCdU7q/g/MxdIy1LbxLt43UJhRVoshtOlItW/0kIwN1as393noyE
         a8M03nHctROq6mT+fiov7DXVBinNGtrZT1SQFSnCs2X50oYP2nKesCEDDtd+FjorPIfq
         kxYI1FB2NBAQ6zxTEzOl/NuzDsQKXJS8kDxzRlJ8e6ZGx6jhMNUBZA8LbFDN+jS95P6q
         W7DN2CVrhK2ShxCVx8B63UKfDmQGbz3EPie+tUGHHBwntTeDX81HCCDueHHs1CgwzZlx
         GG+xNhdXAizcooxQgrJqZZziOVo4gtj+kfOtDb+Z7bIyrjNeWWHfVZgc2M8AnR9fcQoR
         1l4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gBgLUGcPfnFXu97/glbl0dWUsFAyQv/dLxT+7R0QfV8=;
        b=wNE0hVl3dU4O3biVOn2eTGvXtxTx3yJ0bo1Q5ZpyFA52lKeARRyfhtnQAOscPSDGAa
         eRq4/Tl9qEkPSKxIbi2eywPkqqOxk+VJ2UaKhS+7eMF0gTuE/UXHQgCuDHBFS+XKnZ16
         Dpl2aTr8lSoggMe1HPCbKaOKcmqAui6cTeiTBCKYYXJIhhE1jtWiZisd9lm+EdyFGbVl
         AQCx+iyKbW4A4OMfgppqEyWtBr93IAJrPZJMEQefXJuqBB1LFGzIrfkny0n5JGrj8dIZ
         yByZyp+G77yFjruIXWxlgc0Z4e1PlcM7GW4g0Kl69Wzz8ahiE/GyUBQJGvZHkoSbKmeD
         vpgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CchvTZu4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7-20020a05620a28c700b00718de0ca2ffsi13629114qkp.220.2023.02.14.10.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Feb 2023 10:36:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CchvTZu4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pS0AX-00016r-LJ; Tue, 14 Feb 2023 13:36:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pS0AU-0000wY-4C
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 13:36:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pS0AS-0004VT-8s
 for qemu-arm@nongnu.org; Tue, 14 Feb 2023 13:36:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676399799;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gBgLUGcPfnFXu97/glbl0dWUsFAyQv/dLxT+7R0QfV8=;
 b=CchvTZu4gBoL2hIEhATWxrOuHLY1mw0dmIoXXYCUkJdLU6jcM6C6wIJMadE0Kz9pw2RvPn
 JiYMNEVLzmuBkxgiqdXMY9V3eVAJHICJ+tOPr29W4u3n6cMncofo453zx2Os7N3Lfm0Hse
 dgWOqwth2jZYmov3HKS/FsAOketWgnU=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-58--hbB_3-YNMqhRRWUo6rAHQ-1; Tue, 14 Feb 2023 13:36:37 -0500
X-MC-Unique: -hbB_3-YNMqhRRWUo6rAHQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 a6-20020a05620a102600b00729952b4c73so9862936qkk.6
 for <qemu-arm@nongnu.org>; Tue, 14 Feb 2023 10:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gBgLUGcPfnFXu97/glbl0dWUsFAyQv/dLxT+7R0QfV8=;
 b=FA+G8JLOi/gFGH2JdgUbdxy27e5DMGNIJOLBnnZF7ml2lztVxaD91UZyYjkvYXVxn3
 0n7hiAgJzjZ/z2JizfJZQZFkmpNKfOkl2/cIpp1kunWTjhyu2EpupGotywVfESSLdGyK
 GjMWKWX2qQS0jaNTNo7vSe74Py5RnqCdvxfywS6L4xnurf7NRwYkveWCMNyf1CBBI4nS
 mNYC9Xz1BrjeIgxlSQppDwTxP/Iss3BYhi+7Ic5n43CczzvufknT4S46HiGzMab6C4EF
 PKrx66uBIwmO3ZtxoF7EU1RdMcZltVyuOzkHS+zp+juf5/WPnHC8u5EcdFk2aPQooVaB
 fk7A==
X-Gm-Message-State: AO0yUKWdE9g+W+jicXxD9JFcB7vN2JjfxPYXLFEms9RQM1UvnFB6yhzG
 tMAcxu3EgCm60jWVkf7BeL11tiqKADg/NybnnTYNwEYVSmw0IjHxviA8xChmqTD1zW2fHmkm0u+
 GohKbMXq/Cb4s
X-Received: by 2002:a05:6214:2a83:b0:53c:5e57:cd02 with SMTP id
 jr3-20020a0562142a8300b0053c5e57cd02mr7268137qvb.38.1676399797265; 
 Tue, 14 Feb 2023 10:36:37 -0800 (PST)
X-Received: by 2002:a05:6214:2a83:b0:53c:5e57:cd02 with SMTP id
 jr3-20020a0562142a8300b0053c5e57cd02mr7268096qvb.38.1676399796912; 
 Tue, 14 Feb 2023 10:36:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 w3-20020a379403000000b006bb29d932e1sm12365822qkd.105.2023.02.14.10.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 10:36:36 -0800 (PST)
Message-ID: <b0a296a9-1ca8-fe6c-56e9-27807a1d0f5e@redhat.com>
Date: Tue, 14 Feb 2023 19:36:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/2] hw/arm/smmu-common: Fix TTB1 handling
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 ola.hugosson@arm.com
References: <20230210163731.970130-1-jean-philippe@linaro.org>
 <20230210163731.970130-3-jean-philippe@linaro.org>
 <1964d20f-e18b-5875-914b-16f2f3acee37@redhat.com> <Y+u7A/QubSdEe11M@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y+u7A/QubSdEe11M@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: 1UcgzMCNrvvn



On 2/14/23 17:46, Jean-Philippe Brucker wrote:
> On Mon, Feb 13, 2023 at 05:30:03PM +0100, Eric Auger wrote:
>> Hi Jean,
>>
>> On 2/10/23 17:37, Jean-Philippe Brucker wrote:
>>> Addresses targeting the second translation table (TTB1) in the SMMU have
>>> all upper bits set (except for the top byte when TBI is enabled). Fix
>>> the TTB1 check.
>>>
>>> Reported-by: Ola Hugosson <ola.hugosson@arm.com>
>>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>> ---
>>>  hw/arm/smmu-common.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>>> index 2b8c67b9a1..0a5a60ca1e 100644
>>> --- a/hw/arm/smmu-common.c
>>> +++ b/hw/arm/smmu-common.c
>>> @@ -249,7 +249,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>>>          /* there is a ttbr0 region and we are in it (high bits all zero) */
>>>          return &cfg->tt[0];
>>>      } else if (cfg->tt[1].tsz &&
>>> -           !extract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte)) {
>>> +        sextract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte) == -1) {
>>>          /* there is a ttbr1 region and we are in it (high bits all one) */
>>>          return &cfg->tt[1];
>>>      } else if (!cfg->tt[0].tsz) {
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>>
>> While reading the spec again, I noticed we do not support VAX. Is it
>> something that we would need to support?
> I guess it would be needed to support sharing page tables with the CPU, if
> the CPU supports and the OS uses FEAT_LVA. But in order to share the
> stage-1, Linux would need more complex features as well (ATS+PRI/Stall,
> PASID).
>
> For a private DMA address space, I think 48 bits of VA is already plenty.

OK thanks!

Eric
>
> Thanks,
> Jean
>

