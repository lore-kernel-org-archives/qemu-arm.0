Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp678787ejb;
        Thu, 16 Feb 2023 08:53:54 -0800 (PST)
X-Google-Smtp-Source: AK7set9inmnIEkiDVpTHeHh+useH5HVeY2xjp/Ba68+S4sIBDdfb1WxwbcxBEWVJKEYqmW6tyiRc
X-Received: by 2002:a05:600c:4f88:b0:3db:1d7e:c429 with SMTP id n8-20020a05600c4f8800b003db1d7ec429mr5780060wmq.40.1676566434744;
        Thu, 16 Feb 2023 08:53:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676566434; cv=none;
        d=google.com; s=arc-20160816;
        b=OoBQlSPYOZ48nhq3U3xHK17Ws67OSMFKiAwlvbdU1O5siQqvChBRPHQtX8CBDiyNUW
         0oSlOPkW/UljgGX7iG7XaHsu8KslkCbHZAFR4Kx7IdVrBO5GqTlL49MhrgirlZTJmNBG
         bWWJknAQqfIWsyli519YQfL7c68SsGFNbpPLXVe2tbnIC1zSng+0YgdA2jErqYVsTq+i
         3ePgvBAISKL0HxG46xULpKVQ1ulkyDywGubumpGMih/zV4beYNQB3tUgZdG1SXt9pQhX
         MbOCs5OKk1fKuTMzOFcbRxcE/L2lLKBIyhdpQX9uttceLd8WBh452TFXHFhltMLgfOLk
         kZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=rJJqbKC8LO7aidwKTZzO++r/gji8BZ6xzatsHk7xL9M=;
        b=G1/bTnlf4RZAl+iOG1qb+XuiQ/8V1KC8Jp79r6iFY9VvaE+/vWS42aRcHjwSIyO6by
         kbMPcBxXOsdNbDYpTESuyQuTx9rQ5VUiMLtOGj6EZLoG9y6M+viivj8V5ZPS5C55gUhC
         YyOIsT0DwUP5SFUzMhFHDeUZCtt/UB+0EC7Z3n2MLkvTBX0G9r5uc7X5TaD3hZKqQzij
         SsbxxvSL6B78qX5snL4QUGvFVfGwEMJ5SI2wXZKKeqpz+n0RnJdX4bDzgHDrVvvOrzYP
         gl+BcDnCXjnxquL55JFUTHC9/uXTlcE/4KC+vtmISzoh/jp8D2yxeNLDz6lOKZU2x0V+
         O6Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N+M3Yl4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11-20020a05600c45cb00b003e002ae11adsi6515316wmo.16.2023.02.16.08.53.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 08:53:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N+M3Yl4+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pShW0-0002zU-Cp; Thu, 16 Feb 2023 11:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShVz-0002zJ-65
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 11:53:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShVx-00067q-Pb
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 11:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676566425;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJJqbKC8LO7aidwKTZzO++r/gji8BZ6xzatsHk7xL9M=;
 b=N+M3Yl4+oGodK7RMjjw9K5vBaRQGvZnkEbt2l91ZIWe5OB3DylNNMNjfA0QHQfy9ICEHFV
 DbopF3U3tQLv55/VpUd6jp6wNoAYBuYuvT2OfLCN8Kk8aeNq8ZCHpbWtQ13c0+ck4ZYYCk
 S81HlznMm2ZszLUktazV0WLS7qqd44s=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-_vODliNAPVCjSgKyVSHjSg-1; Thu, 16 Feb 2023 11:53:43 -0500
X-MC-Unique: _vODliNAPVCjSgKyVSHjSg-1
Received: by mail-qk1-f199.google.com with SMTP id
 a198-20020ae9e8cf000000b007259083a3c8so1555646qkg.7
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 08:53:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rJJqbKC8LO7aidwKTZzO++r/gji8BZ6xzatsHk7xL9M=;
 b=QxOjJ5okoViL3d1M+R2LwoVbgBAw3LdaNjTL/6q+7mWfCb/T9x9UF2+c9IpfmFP3a4
 vvb6jgbDEjFe/cfT57S4ggTLvCHc0vf4FwUHM/8MXCNNWaFRsfoYWOcrtuuxpJRV7UGZ
 HUZUOM06JK5lP3cpOYJQ/nXS9Wpbv4pSJOt2iy1wzqqiFER4SxUiyiZHE8KupkPv/7dv
 ARi+7VOnD6zfS4z9zYzy9vLG0hTRsv99Zpr4a5xCjn/5E+gb0kVuhyfdmxuFEWpcBWhJ
 caG/gm3xNs73YDL9Skd33DkPbp6dddjRBGx+gAVI80zb/cW/zw9XeS+EpJyuG1pTa6I1
 Lbwg==
X-Gm-Message-State: AO0yUKVHLAKwxb5vafZ3k+EskdguLwRAN3nfVpPgKO87HG5w6YygOWNj
 FuDcEhSZ0vvIo2K/WmTvdl/HS9NY8GAPZfEtgk5duRoMiFOE1Rlk9SV4w0+Vrx3ozQoUsKOFuxJ
 C8VwFtwIxRnq/
X-Received: by 2002:ac8:5e06:0:b0:3bd:16cf:2f33 with SMTP id
 h6-20020ac85e06000000b003bd16cf2f33mr715019qtx.63.1676566423160; 
 Thu, 16 Feb 2023 08:53:43 -0800 (PST)
X-Received: by 2002:ac8:5e06:0:b0:3bd:16cf:2f33 with SMTP id
 h6-20020ac85e06000000b003bd16cf2f33mr715000qtx.63.1676566422892; 
 Thu, 16 Feb 2023 08:53:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 p26-20020ac8409a000000b003bb822b0f35sm1527230qtl.71.2023.02.16.08.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:53:42 -0800 (PST)
Message-ID: <b0e78b79-18ce-29bb-1362-a3bf2cf83ba9@redhat.com>
Date: Thu, 16 Feb 2023 17:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 12/16] hw/arm/smmuv3: Add VMID to tlb tagging
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-13-smostafa@google.com>
 <ae0d6155-138e-5005-733f-f3932a14c6b3@redhat.com>
 <Y+41c8x5SCoPfZck@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y+41c8x5SCoPfZck@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: 9N+qfiC1TLWA



On 2/16/23 14:53, Mostafa Saleh wrote:
> Hi Eric,
>
> On Thu, Feb 16, 2023 at 11:17:34AM +0100, Eric Auger wrote:
>>>      }
>>>  
>>> -    *key = smmu_get_iotlb_key(cfg->asid, new->entry.iova, tg, new->level);
>>> +    *key = smmu_get_iotlb_key(cfg->asid, cfg->s2cfg.vmid, new->entry.iova,
>>> +                              tg, new->level);
>>>      trace_smmu_iotlb_insert(cfg->asid, new->entry.iova, tg, new->level);
>> you may update the trace point as well
> I can add a stage argument here, however I don’t think it is necessary
> now as TLBs are either used for stage-1 or stage-2, not both.
no I meant adding the vmid value there

Eric
>
> Thanks,
> Mostafa
>

