Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1270467ejb;
        Fri, 17 Feb 2023 00:05:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+/LA/h+X4fG+/GUDtL2XOMna11BnLY4QKgzYuE/hZbavAutUxy1LsxcZpuNjAwUgexjqTl
X-Received: by 2002:a05:6214:624:b0:56f:979:b1e8 with SMTP id a4-20020a056214062400b0056f0979b1e8mr3686543qvx.48.1676621130590;
        Fri, 17 Feb 2023 00:05:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676621130; cv=none;
        d=google.com; s=arc-20160816;
        b=CnHWNYbqNXX0i3YNKrA2DCmXFan+8Y0H+ouBc27Z79kbqjBi7IVIJdYb6zlk5IH8w/
         0+msRTE5h8hQJYgmKGIkbODQR3oqsU7a4Upk/7hcmHFBVa6R6bITRNsbLJHBOOKf3bUw
         vy/IZQ1d9sL4fj/fTtuULvq72ANsjhuDwIpb9OeifZ3nJSalA8MiQFGJym/JXcLJMu/i
         09Fl8M03e/5mRsDAXMzldtBT+LlCRFrrCsPm8EmUwMxzNnfhaIrG/dk0jCRu5b90kLuS
         lhAG8DT9tSyy03h3Lw8nIhkzFqihth+vBitlqI34Jvh8ONykm2gNp6Q5nfvTvA01I87P
         Hw6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=8j/4P2dq36gTxYeVtpMwhtatpnEeUyclFSlJ4VWwGe4=;
        b=WtXo3ayjTKOiuZSym7YUREALUZTOjwza8exBteF98Trkw+durnenCQhG+L88nSyfhV
         oVrVDk9WjUn0isDw8fzw+BTucRBBkMvlU6UDmq6eZqTmo2dm5b/7XFozlYEcFRGd6jsJ
         dnVA96gZR69Zc+ITtICx2ad7i5Y6MQIbtLV+uqiUpFMmLanEv6a50lHU3ywF5pS+vUJx
         RDftnqZUgHE38yUeD/aI+ty/seB9QWIldoDRjQRXZkN8oddRrMRYhaaGzyIEk4SygbSW
         kfC1ilxl+Z9dHvK4CEFfgntaBVPk4zcBSfcg01HqtCHfuK12B17amqMLp4ToNWY3tAF5
         vCbg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1-20020a0cf1c1000000b0056ea575940esi2722734qvl.227.2023.02.17.00.05.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Feb 2023 00:05:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSvjq-00064U-7q; Fri, 17 Feb 2023 03:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pSvjX-0005gO-2f; Fri, 17 Feb 2023 03:04:46 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pSvjV-0004TS-7r; Fri, 17 Feb 2023 03:04:42 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.210])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id F2FA52137E;
 Fri, 17 Feb 2023 08:04:35 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 17 Feb
 2023 09:04:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0016414ffb8-42f3-491e-a364-db46bc645b32,
 D8AD3BA2C27EEBE7B4560DA8411A9B1E3CFED360) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5f15b7d5-c31d-25f2-cad6-51e30b3d0a01@kaod.org>
Date: Fri, 17 Feb 2023 09:04:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH 5/5] hw/ppc/pnv_bmc: Simplify pnv_bmc_find()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Markus Armbruster <armbru@redhat.com>, <qemu-arm@nongnu.org>,
 <qemu-s390x@nongnu.org>, <qemu-ppc@nongnu.org>, <qemu-block@nongnu.org>
References: <20230216122524.67212-1-philmd@linaro.org>
 <20230216122524.67212-6-philmd@linaro.org>
 <e4e0217e-9bd3-1bb7-c91c-0686cf67fc02@kaod.org>
 <56bb0fe8-d1f0-73a6-7881-f2a0e43bf2fa@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <56bb0fe8-d1f0-73a6-7881-f2a0e43bf2fa@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a4f960e5-89d5-42cc-9423-e48228921d0b
X-Ovh-Tracer-Id: 3824400511499537257
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeikedguddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieekheekheehjefgffekffevgeeludffieetjeeugfeftdejkeeggfevffeviefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgrrhhmsghruhesrhgvughhrghtrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepsh
 hmthhpohhuth
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.351,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 1eMbFL+5hzgr

On 2/16/23 20:16, Philippe Mathieu-Daudé wrote:
> On 16/2/23 19:12, Cédric Le Goater wrote:
>> On 2/16/23 13:25, Philippe Mathieu-Daudé wrote:
>>> ForeachArgs::name is only used once as TYPE_IPMI_BMC.
>>> Since the penultimate commit, object_child_foreach_recursive()'s
>>> handler takes an Error* argument and return a boolean.
>>> We can directly pass ForeachArgs::obj as context, removing the
>>> ForeachArgs structure.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>
>>> ---
>>> RFC: please double-check...
>>>
>>>
>>>   hw/ppc/pnv_bmc.c | 25 +++++++++----------------
>>>   1 file changed, 9 insertions(+), 16 deletions(-)
>>>
>>> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
>>> index 05acc88a55..566284469f 100644
>>> --- a/hw/ppc/pnv_bmc.c
>>> +++ b/hw/ppc/pnv_bmc.c
>>> @@ -278,36 +278,29 @@ IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
>>>       return IPMI_BMC(obj);
>>>   }
>>> -typedef struct ForeachArgs {
>>> -    const char *name;
>>> -    Object *obj;
>>> -} ForeachArgs;
>>> -
>>>   static bool bmc_find(Object *child, void *opaque, Error **errp)
>>>   {
>>> -    ForeachArgs *args = opaque;
>>> +    Object **obj = opaque;
>>> -    if (object_dynamic_cast(child, args->name)) {
>>> -        if (args->obj) {
>>> -            return false;
>>
>> The purpose of this test was to catch multiple bmc devices and it's removed
>> now.
> 
> Great.

But it should be an error ! :) See the error_setg below.
  
>>> +    if (object_dynamic_cast(child, TYPE_IPMI_BMC)) {
>>> +        if (*obj) {
>>> +            return true;
>>>           }
>>> -        args->obj = child;
>>> +        *obj = child;
>>>       }
>>>       return true;
>>>   }
>>>   IPMIBmc *pnv_bmc_find(Error **errp)
>>>   {
>>> -    ForeachArgs args = { TYPE_IPMI_BMC, NULL };
>>> -    int ret;
>>> +    Object *obj = NULL;
>>> -    ret = object_child_foreach_recursive(object_get_root(), bmc_find,
>>> -                                         &args, NULL);
>>> -    if (ret) {
>>> +    if (!object_child_foreach_recursive(object_get_root(), bmc_find, &obj,
>>> +                                        NULL)) {
>>>           error_setg(errp, "machine should have only one BMC device. "
>>>                      "Use '-nodefaults'");>           return NULL;
>>>       }
>>
>> We don't test obj against NULL any more. This could break the QOM cast below.
> 
> IIUC QOM cast-macros are NULL-safe, see
> https://lore.kernel.org/qemu-devel/20210107121304.1db97130@bahia.lan/

even when CONFIG_QOM_CAST_DEBUG is set ? I might have missed something.

Thanks,

C.

> 
> If you concur I'll try to update the QOM API doc where relevant.
> 
>>> -    return args.obj ? IPMI_BMC(args.obj) : NULL;
>>> +    return IPMI_BMC(obj);
>>>   }
>>
> 

