Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp797121ejb;
        Thu, 16 Feb 2023 11:16:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/FusSig/wdh5gFFco8e4rN6Jbl4bKQipmleJ0JBIyrQ8bTBDA8b3Lanw/EswhYGDviWrJG
X-Received: by 2002:a05:6214:20ea:b0:56e:b96c:2e03 with SMTP id 10-20020a05621420ea00b0056eb96c2e03mr11679238qvk.25.1676574993291;
        Thu, 16 Feb 2023 11:16:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676574993; cv=none;
        d=google.com; s=arc-20160816;
        b=hL+hin2fVprySoUS02U5LAisTWMngAfw+euCf844OoNuvs2LCyz7MAWhUapHa6Q6Sz
         dqsdLfuOCbniYchZyXIAWd7mAwO/yXvHrH9E30oR1nQTNWKJBdHQp8cOZ/VJcwsAimwQ
         AbCtnSbMe1L55zANlk/m8pSyFMsvYI9S/2PFnEqLDx9ToEiiqX0iJ3uEdOttjzeYuHEL
         dr2hXE7V77SUmJzWVrUKIR72FpASXCjrv6oF9xWzvl6cGclL02S14+TT4TF2VaNB6oVR
         w60A/xiLPSgn6mJdHoSC2JvV2XvdDUvkvCfXUnpPaAVwmmMcc7pl9vdNF4CbO83pzO2g
         V3lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AZeWqv2ZNAQJbJtqJWL9bZQ/ArEq6WS/wXiLtp5D8xo=;
        b=NN8Uzf6cg602L2j+sjDCNzr6RdQhuZ+gsB8bj2EIXaVviFROK1ccdlicDI9f+h7UE2
         mnVuLbh5Z8sv0b3IAx3AICpu8bd/08Qx1XZn/pz4FfzOy1cAdRxZ4kUSGr8JpakT+BvL
         EvRM1/+/M+e9cL3wLDTSSXeamHuTk4MNeTO33dPhmWRXNoZh+b1Dd4fiQYC0MVhqfjT0
         gJbS0mPzGmY65DZxatv/o4Q4T/olQMR0P6aylxSoN0ik3k17GEiU7Bx0Nk49bvFNmP7a
         +aIkM2Fi/fTQXvztoh8MFneDjJYonUjZif97r6uYL3vbsQbH0LY+fJ4DESGN1IdW0C2h
         b/Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S6i9sSlp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10-20020a0cdb8a000000b0056eadae1241si1572497qvk.358.2023.02.16.11.16.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 11:16:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S6i9sSlp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSjjy-0000sa-Kn; Thu, 16 Feb 2023 14:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSjjm-0000qH-Bu
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 14:16:10 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSjjj-00028T-4l
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 14:16:09 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so4491887wmp.1
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 11:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AZeWqv2ZNAQJbJtqJWL9bZQ/ArEq6WS/wXiLtp5D8xo=;
 b=S6i9sSlpUlScXSmjKewv9t2rk6H7jsG1kL+BWjVMjcJqWPHfWTViRi9knNmoTEHGN5
 ng0R4VEpLZx+/KZSVpo9oQikjqkC08WnrjJAe2lT9M9iwDOLLgA8EEyvv76JM80BG1Cq
 EFoIzMr1iqY4joSfU0q+8sxCdjEYcnwPAST54z2OUUdGs1rWIRDVZWXSW6ZPPljfXmCy
 QGjtFgLseOqaPAzP6FchVqPC2ZZtbzfL3kWTgqrko6nmxz8oIcVID9LaRwj1tm62QP8j
 VxBXBBImuI88EbPz8HR8vywVLH8+b45nI9i7QGD4Hd5Gb9oGqD4MpUIeI35hgfToWbdv
 3MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AZeWqv2ZNAQJbJtqJWL9bZQ/ArEq6WS/wXiLtp5D8xo=;
 b=lKZR6qpSb4+5eSfkph9urrO3HrKuQF4glgjNmjtp84X3lBv0uNCAc+SN+Z9HYuRLqm
 NvJYnj0x8YOMvBqR+PF0ulKi25et/pWY63X57hQi3ciWmu2pxkakuIeIJXB4muTYplpe
 ytwbZpm06wmwFzw+ZRZaUBqHuTo6iT9aumn1VtgzhZodrbGuq0VDf3ji7zT8zu9R3mj1
 Hjvkb2jXkb+YONFVGwHs5LJwZafCmcQEPLJEE6bqTRmILmDKsmwZKUduhsLzI5Zop3AF
 24QfEpERlgReUrk8H6SzZulJoHPRv7efY5jCdvGIYG/joWwmYPAPtDKmCQsJVO/MXmdy
 4+gQ==
X-Gm-Message-State: AO0yUKUB1P7d85rJXpNSTQPWo9Gk47CUkCgOTLWeSX91qyAaTt8fgj+f
 jMvUTk8eL0GZKoZd+qeS55ChWA==
X-Received: by 2002:a05:600c:318f:b0:3df:e659:f9d9 with SMTP id
 s15-20020a05600c318f00b003dfe659f9d9mr5270226wmp.34.1676574965097; 
 Thu, 16 Feb 2023 11:16:05 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a05600c205600b003de2fc8214esm2502497wmg.20.2023.02.16.11.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 11:16:04 -0800 (PST)
Message-ID: <56bb0fe8-d1f0-73a6-7881-f2a0e43bf2fa@linaro.org>
Date: Thu, 16 Feb 2023 20:16:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 5/5] hw/ppc/pnv_bmc: Simplify pnv_bmc_find()
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org
References: <20230216122524.67212-1-philmd@linaro.org>
 <20230216122524.67212-6-philmd@linaro.org>
 <e4e0217e-9bd3-1bb7-c91c-0686cf67fc02@kaod.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e4e0217e-9bd3-1bb7-c91c-0686cf67fc02@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: oDqzRpnvV4c7

On 16/2/23 19:12, Cédric Le Goater wrote:
> On 2/16/23 13:25, Philippe Mathieu-Daudé wrote:
>> ForeachArgs::name is only used once as TYPE_IPMI_BMC.
>> Since the penultimate commit, object_child_foreach_recursive()'s
>> handler takes an Error* argument and return a boolean.
>> We can directly pass ForeachArgs::obj as context, removing the
>> ForeachArgs structure.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> ---
>> RFC: please double-check...
>>
>>
>>   hw/ppc/pnv_bmc.c | 25 +++++++++----------------
>>   1 file changed, 9 insertions(+), 16 deletions(-)
>>
>> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
>> index 05acc88a55..566284469f 100644
>> --- a/hw/ppc/pnv_bmc.c
>> +++ b/hw/ppc/pnv_bmc.c
>> @@ -278,36 +278,29 @@ IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
>>       return IPMI_BMC(obj);
>>   }
>> -typedef struct ForeachArgs {
>> -    const char *name;
>> -    Object *obj;
>> -} ForeachArgs;
>> -
>>   static bool bmc_find(Object *child, void *opaque, Error **errp)
>>   {
>> -    ForeachArgs *args = opaque;
>> +    Object **obj = opaque;
>> -    if (object_dynamic_cast(child, args->name)) {
>> -        if (args->obj) {
>> -            return false;
> 
> The purpose of this test was to catch multiple bmc devices and it's removed
> now.

Great.

>> +    if (object_dynamic_cast(child, TYPE_IPMI_BMC)) {
>> +        if (*obj) {
>> +            return true;
>>           }
>> -        args->obj = child;
>> +        *obj = child;
>>       }
>>       return true;
>>   }
>>   IPMIBmc *pnv_bmc_find(Error **errp)
>>   {
>> -    ForeachArgs args = { TYPE_IPMI_BMC, NULL };
>> -    int ret;
>> +    Object *obj = NULL;
>> -    ret = object_child_foreach_recursive(object_get_root(), bmc_find,
>> -                                         &args, NULL);
>> -    if (ret) {
>> +    if (!object_child_foreach_recursive(object_get_root(), bmc_find, 
>> &obj,
>> +                                        NULL)) {
>>           error_setg(errp, "machine should have only one BMC device. "
>>                      "Use '-nodefaults'");>           return NULL;
>>       }
> 
> We don't test obj against NULL any more. This could break the QOM cast 
> below.

IIUC QOM cast-macros are NULL-safe, see
https://lore.kernel.org/qemu-devel/20210107121304.1db97130@bahia.lan/

If you concur I'll try to update the QOM API doc where relevant.

>> -    return args.obj ? IPMI_BMC(args.obj) : NULL;
>> +    return IPMI_BMC(obj);
>>   }
> 

