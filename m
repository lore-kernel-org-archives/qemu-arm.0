Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp4068751ejb;
        Tue, 21 Mar 2023 06:34:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set9SDO4D+7XQ5xNDJ4JgqRjgcKV5zd2AvraMM3iGcVGCDa5/qvVCa/uEqxrDj7rMiwccZed1
X-Received: by 2002:a05:622a:150:b0:3bf:b896:ff72 with SMTP id v16-20020a05622a015000b003bfb896ff72mr3954893qtw.68.1679405667865;
        Tue, 21 Mar 2023 06:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679405667; cv=none;
        d=google.com; s=arc-20160816;
        b=ZehzgH4qxNNn8fRiNFAoYclxsE+2UI21es4iROxfTBankRf/gT4XDZzo1uUYWqRlfr
         DFDKeko4udmkAxrTOcEqMapTCByYFziHzek/BnaTCKeOMZo2NmvZHXQ8kh531DYksX6c
         w5aubSt/YahInzqgCWeU5PBn3Sccpg+tjskIj//favMkxFlpfoLUVJpeDCPDpyBdMXIK
         VOw+kvYrrVrnX/ixrnDPwZeUvDLjjAPMVpKQ5LH67B4j7Sylq+yY3pa0rTABEZMVeqcr
         2NJPmFZbdaARibgN7JRC+u8+2kQMvzo+IYvlcWDU6hZqhBk/hJ9KXqbEmlxNH9NjK0ZF
         2aNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Tmkat1LSQSuev1D1I6w/AYW2fG9I2lhhUiUVfxIvFX8=;
        b=UbELhCg9dpCJ2F20N8vKgSdYeCUN9FGmqAZ0Zfb+SJansp8PcLnFujowHS/raZ48dP
         lbFPwfql5URJVXuVcyviXXhoRgEenVrGrmaqAwjpvJJJystjrV9sEj2zVz9hQ5fOsR6C
         Ue8NZ9q6Md/VHQ88VksKr+FQP7YMk/am3fEKWV5r9ENHVDF6iaoVwBVv5ox3fAcSSljU
         3B+aqLu0DewcbholoEcDGLvF9fdVTwQKqfQYs3W0hGu12wooHH8ICTMp6v+p2RPEFo9J
         VVD0EnpSn6uk/rQtHXD29RXb3mBoUdSmXXmhx/9i3uygj43ywSDPBHTzPlAHV9/VrdNj
         tngw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bgy2K1jx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19-20020a05622a051300b003e0e486d8a0si3694276qtx.230.2023.03.21.06.34.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Mar 2023 06:34:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bgy2K1jx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pec85-0006j2-9K; Tue, 21 Mar 2023 09:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pec84-0006im-Mo
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 09:34:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pec83-00066z-0J
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 09:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679405657;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tmkat1LSQSuev1D1I6w/AYW2fG9I2lhhUiUVfxIvFX8=;
 b=bgy2K1jxu2oZ9NE0+1ayFlthANL1KR3ugM0Pnbr/abzO8a2uU5tR5Z9ZU90s0jw62RPIcj
 1x1+IeDMIQj8O1K7O6FozYjmi13C6LRqoDYyrqPn7R7YF69LOPD9UkIF0WH/FxlLcnn4u9
 PGUw++4xGFnajN8ppH37tNqAz/P3TcU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-Do-Mivi8PlSo2MUgSwku8w-1; Tue, 21 Mar 2023 09:34:16 -0400
X-MC-Unique: Do-Mivi8PlSo2MUgSwku8w-1
Received: by mail-qv1-f70.google.com with SMTP id
 jo13-20020a056214500d00b004c6c72bf1d0so7560517qvb.9
 for <qemu-arm@nongnu.org>; Tue, 21 Mar 2023 06:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679405656;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tmkat1LSQSuev1D1I6w/AYW2fG9I2lhhUiUVfxIvFX8=;
 b=V7u0v8p6tzbB06QoKUd+2fQLO2OtYbHV9NAKOL121CL4UBYhNfXU7Yf/JxmVm6tdN8
 fndxwBwQvtZ6QoNLTP3U0zjdBKrdYvJnwENTQ5iikvzWHNELg4OmV9MPYw3Fpvd99I38
 wcGwbyucus8xgmX4IPCmWcuid+z+GmhfSGqW89+l7shXFGnOVsl+m3IxxeHWY67of0Le
 R1O7usa/elDd2QTYr6n92LT73Fb7CcDbI0pGvoU8xAINzBjME/UZd4TqXGD3XHsa4tYa
 95eP9SSIgJKC/8JfGWSwBKHnYA0NYJI274sXpL54/ZxivsYW+UaR03ZNuIHQjLkYjrh+
 tq8A==
X-Gm-Message-State: AO0yUKWidHQMdsN/cJnaI7qJ5KIeRqEBRCICyJtElE3o9FS01yT82lwJ
 UE1tqeipgSxWA7Z1NU48KxyL9sSivzvKRrrYOMaFxLG+3l3dhBR1hFg1iuMr03HWILdtb8ygsQb
 dA7DN7W56lTg8
X-Received: by 2002:a05:622a:1010:b0:3bf:dc57:5034 with SMTP id
 d16-20020a05622a101000b003bfdc575034mr4573221qte.29.1679405656031; 
 Tue, 21 Mar 2023 06:34:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1010:b0:3bf:dc57:5034 with SMTP id
 d16-20020a05622a101000b003bfdc575034mr4573181qte.29.1679405655726; 
 Tue, 21 Mar 2023 06:34:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a378701000000b007456b51ee13sm9289212qkd.16.2023.03.21.06.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 06:34:15 -0700 (PDT)
Message-ID: <a6977389-6a78-71b5-b3ea-005f41d0c6c9@redhat.com>
Date: Tue, 21 Mar 2023 14:34:12 +0100
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
 <d2e9d8d5-1cf6-67fe-e780-41038fcaa376@redhat.com>
 <ZBmxUISDGh8rRJKD@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ZBmxUISDGh8rRJKD@google.com>
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
X-TUID: udR4tHzYPMwf



On 3/21/23 14:29, Mostafa Saleh wrote:
> On Tue, Mar 21, 2023 at 02:23:03PM +0100, Eric Auger wrote:
>>>>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>>>>> -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
>>>>> +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, oas);
>>>> I am not sure you can change that easily. In case of migration this is
>>>> going to change the behavior of the device, no?
>>> I see IDR registers are not migrated. I guess we can add them in a
>>> subsection and if they were not passed (old instances) we set OAS to
>>> 44.
>>> Maybe this should be another change outside of this series.
>> Indeed tehy are not migrated so it can lead to inconsistent behavior in
>> both source and dest. This deserves more analysis to me. In case you
>> would decide to migrate IDR regs this would need to be done in that
>> series I think. Migration must not be broken by this series
> I agree, I meant to drop this patch from the series as it is not
> really related to stage-2, and we can have another patch for this +
> migration for IDR if needed after doing proper analysis.

Ah OK. I get it now. Yes this looks sensible

Thanks

Eric
>
> Thanks,
> Mostafa
>

