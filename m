Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp3230267lfb;
        Thu, 23 Dec 2021 01:20:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyH0YRIIg6m2KrMZcftFk9a0ZcCzkt40NSK51G4B8kFfbNVM/ZQUbL8TwQ5DH1hMmvtbnS
X-Received: by 2002:a05:6902:1542:: with SMTP id r2mr2285866ybu.444.1640251236075;
        Thu, 23 Dec 2021 01:20:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640251236; cv=none;
        d=google.com; s=arc-20160816;
        b=U23UbEYBRvWAjNNo62XGkKmwqqGR4KD5uBTb5q7XksRCZfspF8HNu6lCAtdY3CjYfI
         yug0IwAoZDcbRQ/94EBb2Kr8jv4ir73l7ahDO7gZlXzIV9xRNqcu2dHoiJiPm6VeQ+bc
         7VZ02xoa+2Wb/WOsHHc/M4oiu2BPAzE9NotaJA8d2EGpzWh1AMfTMcAyj5xBG+WZAhxB
         D/uobZrcnYfVHloh6XYvBdkQjATBrdYOnRPLb5+wmCviHbDbWVnoeBpHVejYSTmytvAI
         w09omLKRhLZ4mQ8sKnv5UBNa8836X1Bw1kO2UrkQH9VCSzdCAdIyIYhg4OTRAqgZV8/6
         frRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=E4Ec8frVaCj3oFO9Qa/yc00V7bw4tHtc79acwq5dG/U=;
        b=Fs4ywVdOHcIUJhfEk12SFUvvBfBM+cY1mdkFrsgSAiMkVK9wUFpR3cOOqCL0zGuCPo
         9S5LeFvm4zOz8exveSw0LY+uC0UqytQEYOStWJbxVz/juHNFL6M4NxCuIiJnykQvY0la
         E0wk9zMGk2/BpBD+UYBUcC7Btwhm5XXn/xu5+WNEtXxtA7NMxs7iM9W57hzImzCOWdqO
         Qp7Pqm9ctD3SbY0qsA8CfNqZnZsZIDiFRWe1MsWqJxEB10YXtdiDkT0qv3mMEXCIbU4W
         FBeEmkXFI3Y5OxYezfgJlH76+w8aQ5WqT/RPj+iuI1JRBR6r5DuSdXz951W6W59JtuhW
         x1ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v62si4096022ybv.206.2021.12.23.01.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Dec 2021 01:20:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n0KH5-0005rn-Fu
	for alex.bennee@linaro.org; Thu, 23 Dec 2021 04:20:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n0KGW-0005qi-Qb; Thu, 23 Dec 2021 04:20:00 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:46901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n0KGU-0001YY-Um; Thu, 23 Dec 2021 04:20:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.171])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DA323D399489;
 Thu, 23 Dec 2021 10:19:54 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 23 Dec
 2021 10:19:53 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0058f6b82b9-810d-4f4a-a954-7c86fb70a68a,
 8CA006CF2B51D87471028670A5C113E20BDD9F51) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <b1a7eba2-97e4-d0aa-c120-6445fe520dd4@kaod.org>
Date: Thu, 23 Dec 2021 10:19:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH qemu master] hw/misc/aspeed_pwm: fix typo
Content-Language: en-US
To: Troy Lee <troy_lee@aspeedtech.com>, <openbmc@lists.ozlabs.org>
References: <20211222102423.3121181-1-troy_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211222102423.3121181-1-troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 69bbe511-017f-45b0-92e9-2139ff38ee45
X-Ovh-Tracer-Id: 4555953973363968876
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddtkedgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, leetroy@gmail.com,
 "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cCp2uVjfWIEA

Hello Troy Lee,

On 12/22/21 11:24, Troy Lee wrote:
> Typo found during developing.
> 
> Fixes: 70b3f1a34d3c ("hw/misc: Add basic Aspeed PWM model")

PWM is not upstream. I will include the fix in a new aspeed-7.0 branch.

Thanks,

C.



> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---
>   hw/misc/aspeed_pwm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_pwm.c b/hw/misc/aspeed_pwm.c
> index 8ebab5dcef..dbf9634da3 100644
> --- a/hw/misc/aspeed_pwm.c
> +++ b/hw/misc/aspeed_pwm.c
> @@ -96,7 +96,7 @@ static void aspeed_pwm_class_init(ObjectClass *klass, void *data)
>   
>       dc->realize = aspeed_pwm_realize;
>       dc->reset = aspeed_pwm_reset;
> -    dc->desc = "Aspeed PWM Controller",
> +    dc->desc = "Aspeed PWM Controller";
>       dc->vmsd = &vmstate_aspeed_pwm;
>   }
>   
> 

