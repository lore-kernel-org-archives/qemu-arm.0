Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp2711180dle;
        Thu, 13 Jul 2023 06:17:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGhKsa8HQ09fMK86vcWJfn7WDHWeBw0+WHWqUGuxmVt0piZep4SueBUWs5yBT+C+HLUI/nV
X-Received: by 2002:a05:6808:10d2:b0:3a3:eab8:8ba5 with SMTP id s18-20020a05680810d200b003a3eab88ba5mr2718772ois.27.1689254228975;
        Thu, 13 Jul 2023 06:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689254228; cv=none;
        d=google.com; s=arc-20160816;
        b=R0YJHDJdcxLq80BZZg+mw/NFVccu1Gp8JWScD32EW7jxYH/q3c4+IZie7bJc5X4hSM
         CrXe/mIibecqSE/1wTP7vmrzoUGPg+ZGSEKi6Wru6yWGgoruQu/2bXnqvY+WJD47wfio
         QM/xPKUuW3Us1nNnNKChy661UctWZhn2E1y8SAgz7B8PeIflmKEU0+k29N9y4mmXLwZn
         umqnIBmef7Pf+wVTb9Vlu6da2TclJOfJ7nZL8nzueNBPb7QgOwXI40JUY+tVooLXg5ty
         obbWcW3DY/sDtYv8p8wkExjmqnEKxqZml2lTNbxT/wsZJM3Rpxelrtx/Vg5TeveWr+Nc
         a2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8eVRSo2tSIKZgDQQHtb1nILbj8XZwK9dV3+NgNbNYkQ=;
        fh=EZxuAsAfOqSnSng6QUWjbVyHctHj3zqOW0Uab6f6+Sg=;
        b=C1eGX2NXPp7Ok7DBdmzGBnzkYVrvBSlHdDY8wDqzmPiFN4xSAJLE+/3JppBNrUrNOY
         fUAmtGp103qAWU3hdXDFkgG+Ufqn60sJ6CU03q5+Be+dSGDiocrZLsDLntKBgRHR0KDi
         fvBElJ6Ud/OwBwF47bJF3u7SlYDZWCxoDUKGBrDV6UszTp1z6KZIATfSlt2PsSinP81k
         UVy5ejEHkP2YrtuPZ3Y6/TfeQ6becO8ysPWAkQK+dOwSZoOxURStkYNLhMM8vT60mxCY
         ZBJVCBf2fKb73uOydjiUDYuK4YRhsV6PLMK2i+RltwJb08czjgQxazXYC0waoC9t4sXj
         N+Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=be9miU5E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020a05622a024a00b00403a26c5b61si3040879qtx.57.2023.07.13.06.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 06:17:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=be9miU5E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJwBb-0001c3-JZ; Thu, 13 Jul 2023 09:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qJwBZ-0001b8-Hj
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 09:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qJwBX-0004WR-NN
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 09:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689254202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eVRSo2tSIKZgDQQHtb1nILbj8XZwK9dV3+NgNbNYkQ=;
 b=be9miU5EEL8NeMkfk19cjn6qly9Wto4WjsIwxgpvo9Ceekzmaci68AUUnPb5YG1PwB0KCf
 qh50wgm7SM6sz7m8lnsQ4gkfBcPmHkKJoIyFFBSuvDqnvfUGh7cjKiE1Pz2lDCKqLoWqwr
 DW+TShH9LTAGODWqzdT8UYlVwf9/MI8=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-E6avAs00Pr-BxnbEtDvMSw-1; Thu, 13 Jul 2023 09:16:39 -0400
X-MC-Unique: E6avAs00Pr-BxnbEtDvMSw-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-66700a28586so313294b3a.2
 for <qemu-arm@nongnu.org>; Thu, 13 Jul 2023 06:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689254198; x=1691846198;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8eVRSo2tSIKZgDQQHtb1nILbj8XZwK9dV3+NgNbNYkQ=;
 b=iDx1384ay0Kid7YPQhMYYdWtcTuzptgrz2WYhHEk7q4xGtmJWQvjcH4u+vrEG0IJsq
 d1FqfI3OCjLKSo00p3Se/cP3tYS8tjtbqf/TRHtv1s0h4ua9HMtHnO7gLDwlUqhRF9Pc
 OeRHrvbSunFB3fbU/OBvZsOn5BLaDdaRzu54HihWavJWTZpm8QaPH4fqKJGfSZUj29aS
 43ZIt9NagYDraifpvjlomxGbwoT8YJSeH5vGV8HZton9LV2dEdSVKCEu4CF9gwqSqmMx
 HW0AE6AEDanIoLAtHGUPE8OlQYDxqR5fgWNIqKLfe+mWMtcW5RBvA21Ewk+pBEyygg8B
 se7w==
X-Gm-Message-State: ABy/qLbVpqLIBReRi8nTVrrGvThXl5xA+D/tNtTcVhVR1CNttSsvjg4y
 CamwIUmAnlebivr/Qvu1xZcN9cgoxKxG6oIaKY5LtEFIAOESZhEjSIf/BnfcdWoOd7kjuyRWila
 JwuhCwmCyd7gp
X-Received: by 2002:a05:6a20:7348:b0:133:6e6e:2b11 with SMTP id
 v8-20020a056a20734800b001336e6e2b11mr788156pzc.2.1689254198518; 
 Thu, 13 Jul 2023 06:16:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:7348:b0:133:6e6e:2b11 with SMTP id
 v8-20020a056a20734800b001336e6e2b11mr788131pzc.2.1689254198212; 
 Thu, 13 Jul 2023 06:16:38 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 ff24-20020a056a002f5800b00682562bf477sm5414090pfb.82.2023.07.13.06.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 06:16:37 -0700 (PDT)
Message-ID: <d735c41b-d835-8c35-bb03-6a7a4462210d@redhat.com>
Date: Thu, 13 Jul 2023 23:16:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/3] hw/arm/virt: Support host CPU type only when KVM or
 HVF is configured
To: Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 peter.maydell@linaro.org, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, shan.gavin@gmail.com
References: <20230713054502.410911-1-gshan@redhat.com>
 <20230713054502.410911-4-gshan@redhat.com> <87o7kgq8rq.fsf@redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <87o7kgq8rq.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.096, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sdj/ZUbi4g1u

Hi Connie,

On 7/13/23 22:46, Cornelia Huck wrote:
> On Thu, Jul 13 2023, Gavin Shan <gshan@redhat.com> wrote:
> 
>> The CPU type 'host-arm-cpu' class won't be registered until KVM or
>> HVF is configured in target/arm/cpu64.c. Support the corresponding
>> CPU type only when KVM or HVF is configured.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 43d7772ffd..ad28634445 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -217,7 +217,9 @@ static const char *valid_cpu_types[] = {
>>   #endif
>>       ARM_CPU_TYPE_NAME("cortex-a53"),
>>       ARM_CPU_TYPE_NAME("cortex-a57"),
>> +#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
>>       ARM_CPU_TYPE_NAME("host"),
>> +#endif
>>       ARM_CPU_TYPE_NAME("max"),
>>       NULL
>>   };
> 
> Doesn't the check in parse_cpu_option() already catch the case where
> the "host" cpu model isn't registered? I might be getting lost in the
> code flow, though.
> 

Right, it's guranteed that the needed CPU type (class) is registered by parse_cpu_option().
However, we have different story here. The CPU type invalidation intends to limit the CPU type
(class) into a range for the specific machine (board). Taking "cortex-a8-arm-cpu" as an example,
it's not expected by hw/arm/virt machines even it has been registered when we have CONFIG_TCG=y.
the list of supported CPU type (class) will be dumped by hw/core/machine.c::validate_cpu_type()
in PATCH[1], "host" is obviously invalid when we have CONFIG_KVM=n and CONFIG_HVF=n. We can't
tell user that "host" is supported, to confuse user.

Thanks,
Gavin

