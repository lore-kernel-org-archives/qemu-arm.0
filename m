Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp348011lfj;
        Fri, 13 May 2022 08:04:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYdxBQw9Z7bWNq581yJYv3lc1LrMX27j3TH1iyuoXQy4S22zRV2Nw1Uexuos9aY0TxKbIb
X-Received: by 2002:a05:622a:5c8:b0:2f3:c946:b0bd with SMTP id d8-20020a05622a05c800b002f3c946b0bdmr4920035qtb.298.1652454266450;
        Fri, 13 May 2022 08:04:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652454266; cv=none;
        d=google.com; s=arc-20160816;
        b=CDBVcAoeZuEWgi7cjTUVsxC3sk586TVuEsz08y0nEpFHI/MERfib/4bv0VSMW3apgP
         uiBeZmUtRUKw+3lmREd4Z9AsiktqKd6/j3ngaxTJsyDybT1nDFOz3rimarUpoCguLVCq
         uuRXYi2obK0fde81cN3+9al57/Th9niZ2ONPI9mWdGOK2r0RXDxW2Taftt+aPHxxAg+k
         sp0lvRHoqShbyKqPCa0KX4AUoanOcPlNn6u1cdoPn8ZljXK8dvIm41778EzW69/hIzQA
         lWKpg1KOEkcK5FOjXCVQzOedF/A2vjCLb/IUAumQIMr2iza9RpRXRmfCtsF0OqhZsKNu
         gr9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=4G8k3o1ml8jXaVuocd7kLrPCzdC22deNg3JORR5gl1g=;
        b=X6jpo5FVyxxmrutFBQ2koSlV8VTKpp3NlGbkjwpYUm7vBGh/uznJi6khDH6CzalH65
         Otuy4mgFs46V3rB5YknNbbAWshVLLdHRlWJ990aVeJ3gGGMkYHRkGEAGA4DxEYqnDSdI
         9iNMEjoOrQ2+PeIj68iMfz6KabIRE3ghQak72TszaJgVv3Tbmp8aiBtFYBL5nnRUW71/
         ECjgW7hlFG9Gc95gp6buxgd+5RLIJHZmAwn335tPftuRnvU/rBDiKnruRiSewLafRj0e
         vt1GxTrSoaLNDyE5XnEdYvtX8GK1owzMFYd/AQ/PBGNVTldGLU25+cYcBuGLEnIiRFhf
         cN1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18-20020a05620a289200b006a0328f1cabsi1969976qkp.744.2022.05.13.08.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 May 2022 08:04:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npWq9-0002VP-Ur
	for alex.bennee@linaro.org; Fri, 13 May 2022 11:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1npWpb-0002SI-Tz
 for qemu-arm@nongnu.org; Fri, 13 May 2022 11:03:51 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:58787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1npWpZ-0001BF-Pt
 for qemu-arm@nongnu.org; Fri, 13 May 2022 11:03:51 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.120])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3FBCD2581A;
 Fri, 13 May 2022 15:03:46 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 13 May
 2022 17:03:44 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S0039175db26-ae51-4bfb-a646-5e08de6a5917,
 97912ADCF8BE5A44427C4FE81E404CB8FAC57E21) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c26c0c3e-9eba-050c-9feb-3a2ffd72e266@kaod.org>
Date: Fri, 13 May 2022 17:03:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] hw: m25p80: allow write_enable latch get/set
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Iris Chen <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-block@nongnu.org>
References: <irischenlj@gmail.com> <20220513055022.951759-1-irischenlj@fb.com>
 <bfbffeef-e7d1-8003-24ca-4cafc90e60a4@kaod.org>
 <4613a814-c858-1cac-3750-789b388cba8d@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <4613a814-c858-1cac-3750-789b388cba8d@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f705113b-57c7-48f9-bdb3-1f80c939042f
X-Ovh-Tracer-Id: 8309422791764380545
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgeelgdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: idQ8B1GGtwn6

On 5/13/22 16:37, Thomas Huth wrote:
> On 13/05/2022 15.54, Cédric Le Goater wrote:
>> Thomas, and others,
>>
>> Are you ok with the qtest extension proposed by Iris ?
>>
>> If so, I can take them through an aspeed PR.
> 
> Fine for me!
> 
>> On 5/13/22 07:50, Iris Chen via wrote:
>>> The write_enable latch property is not currently exposed.
>>> This commit makes it a modifiable property.
>>>
>>> Signed-off-by: Iris Chen <irischenlj@fb.com>
>>> ---
>>> v3: Addressed comments by Peter and Cedric.
>>> v2: Ran ./scripts/checkpatch.pl on the patch and added a description. Fixed comments regarding DEFINE_PROP_BOOL.
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> 
> 

Thanks Thomas,


Reviewed-by: Cédric Le Goater <clg@kaod.org>

C.
