Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp746939ejb;
        Thu, 16 Feb 2023 10:12:43 -0800 (PST)
X-Google-Smtp-Source: AK7set/sybSMXcqYsFVarQV6Uuhx61i7OBXDjQOyZUGVvqElIG8uVr6cl1ANMzQ5gitQyt96O8js
X-Received: by 2002:a05:622a:1aa0:b0:3b4:7efb:36a7 with SMTP id s32-20020a05622a1aa000b003b47efb36a7mr5328917qtc.27.1676571163415;
        Thu, 16 Feb 2023 10:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676571163; cv=none;
        d=google.com; s=arc-20160816;
        b=cQhDZkknPaoHp6Cwiag0IhjMt2sillf5vNqkudd/zqKTWfxzBXqKA0Vg9mmdIRWLvJ
         tlqrtbS+sE0KVkL1B0eDSkC7euSwonUvo+UsNM6bI4BJ6/HjM5gjA4cJAI/hPeYhXOzh
         YhqKya8tRDDVrOH/C3ZtG8amnrQra2MOsMLQSvyr56qQ3Z2G6nCO0d+Kya1sRQGVo2K/
         1Ch2VRVNwxKFmygKwl2LPisr7RZGZ66l+XYh/8i6ZQ8E2lnX56tTVgmuWhwa3Y9Kajuv
         W95xsevudyCnR+Ls+EN1GaWtngQu4/ZrZwVbdfTNTE39dhK8YXab4DkuTSH6Rvd5HncK
         m3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=H5zqsdeUxXswGDdriB2mt9f1ZTEDRRth9BMApg21obs=;
        b=PMPp3nLX6f8Njojyyy/YdgbR1dLYpzrfUOR+KB4uXoRzi4N3PAQRTil9M2fy6OxM+7
         T6mj+qWFIJKbakouDklnhsmSptJmmZv7rVh2sJoFYMcaJXympbedADzCglmRsBqv6gPi
         2uTppatENZGTWWtqMDUaxo2IOvLQsWv7+Hovnk8GJg7Vu5TTn9yguYOhrM78QV4IqQPR
         rPPnL1RQOfXSM/JwqQALjZL6G5JVKHGoX5rQg0enkQwcyriN4f79WpddUqLuB56LRvf1
         rl4nz4dXw3qXb6KYx02zxSPR0Et13ynYS8FNn+e8noHH8lJRcGJ7DFWp4V5KHegH8+ux
         Oj5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020ac84042000000b003ba0a929839si1859104qtl.104.2023.02.16.10.12.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 10:12:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSijs-00083i-K4; Thu, 16 Feb 2023 13:12:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pSijr-0007zy-Eb; Thu, 16 Feb 2023 13:12:11 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pSijn-00029s-Ma; Thu, 16 Feb 2023 13:12:09 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.48])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 5E80F206BF;
 Thu, 16 Feb 2023 18:12:04 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 16 Feb
 2023 19:12:03 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006c3d769c1-1982-4562-ab08-f9211698d00d,
 6472B0FD1AC4FAE7C483658EB00F62ED22160684) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e4e0217e-9bd3-1bb7-c91c-0686cf67fc02@kaod.org>
Date: Thu, 16 Feb 2023 19:12:03 +0100
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230216122524.67212-6-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: af17be2c-659b-4256-a52d-3d65338c1a49
X-Ovh-Tracer-Id: 8211188022095940457
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeijedguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgrrhhmsghruhesrhgvughhrghtrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: U3mR9f1vT+dz

On 2/16/23 13:25, Philippe Mathieu-Daudé wrote:
> ForeachArgs::name is only used once as TYPE_IPMI_BMC.
> Since the penultimate commit, object_child_foreach_recursive()'s
> handler takes an Error* argument and return a boolean.
> We can directly pass ForeachArgs::obj as context, removing the
> ForeachArgs structure.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>
> ---
> RFC: please double-check...
>
> 
>   hw/ppc/pnv_bmc.c | 25 +++++++++----------------
>   1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> index 05acc88a55..566284469f 100644
> --- a/hw/ppc/pnv_bmc.c
> +++ b/hw/ppc/pnv_bmc.c
> @@ -278,36 +278,29 @@ IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
>       return IPMI_BMC(obj);
>   }
>   
> -typedef struct ForeachArgs {
> -    const char *name;
> -    Object *obj;
> -} ForeachArgs;
> -
>   static bool bmc_find(Object *child, void *opaque, Error **errp)
>   {
> -    ForeachArgs *args = opaque;
> +    Object **obj = opaque;
>   
> -    if (object_dynamic_cast(child, args->name)) {
> -        if (args->obj) {
> -            return false;

The purpose of this test was to catch multiple bmc devices and it's removed
now.
  
> +    if (object_dynamic_cast(child, TYPE_IPMI_BMC)) {
> +        if (*obj) {
> +            return true;
>           }
> -        args->obj = child;
> +        *obj = child;
>       }
>       return true;
>   }
>   
>   IPMIBmc *pnv_bmc_find(Error **errp)
>   {
> -    ForeachArgs args = { TYPE_IPMI_BMC, NULL };
> -    int ret;
> +    Object *obj = NULL;
>   
> -    ret = object_child_foreach_recursive(object_get_root(), bmc_find,
> -                                         &args, NULL);
> -    if (ret) {
> +    if (!object_child_foreach_recursive(object_get_root(), bmc_find, &obj,
> +                                        NULL)) {
>           error_setg(errp, "machine should have only one BMC device. "
>                      "Use '-nodefaults'");>           return NULL;
>       }

We don't test obj against NULL any more. This could break the QOM cast below.

Thanks,


C.


>   
> -    return args.obj ? IPMI_BMC(args.obj) : NULL;
> +    return IPMI_BMC(obj);
>   }

