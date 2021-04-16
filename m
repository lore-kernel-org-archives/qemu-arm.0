Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp538896lfr;
        Fri, 16 Apr 2021 09:28:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxI2Vb8HuMBFL34GhV9hG0W0rD4qgEDYeckuA7xKSFyjE1WqMn/uJtLrs8qs0N/VTx0U2e7
X-Received: by 2002:a05:600c:4f8e:: with SMTP id n14mr9233645wmq.34.1618590483398;
        Fri, 16 Apr 2021 09:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618590483; cv=none;
        d=google.com; s=arc-20160816;
        b=LJW8N3jy470DAbsR4JKomEdevXLjAS3Xibi89WHY+3WUNqJxLQv1Nzhge/4A9E8psE
         4Y5TD1QGH0izBJ+GKFwlRVhD3xEzWBHz1jlyzR7IBJ+NT61mOQlJJElcrEzIoAchKAfl
         uycw64V4RQ1KgoUx2JH3MGmCHHc+ZWJ2M9XGVD454vsL8vc46tzkhD1px0+JsI37Fs4U
         Zd6+CSzk4OMEjBteiCUoieId9pHCZiHLVRlS8JnKAOxTRbl1HZPaGKXa/sNRljquiFpP
         kqMPxTpRP3xB9pWYsoHIUjMH4pfg8gYMq0lhDvtiiOX3Hpon78miIx2U+Ua0X468mlrF
         +kaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=CdQEvpHwNN3g4Co+9NoEWMSwBRIc95BWO+n1fpb1UVY=;
        b=IeYz7YYlpuUnz07RkFphl0fwZ3zVioTZUDrF9UuOpA3HDTnckMKEL3VLtLZDRMxUUK
         SvD7f2WBf29ik5WpjPs6KE9Y6ga28q639XyaKihooCJGGYylwcf5pbByMLt2ppPMrz5c
         QxNGlv8wjIaC/hhs4PNGSFCuVMYF7n8crZwQ8JH5Yk9GU4yEPK153aDsiV2++RGccwiF
         1LWpA0Dvbl2M2dbcaALYpItWxK5PUxtWqFU6zH/rJ8mCV9fvUiKmwaTIlyhU9ff32WMv
         cmv3nRhgZhuFDMmzD6Kg+uXcQNGGj0rNP1tkV14vKzpnELr12lEK5+qzYg1eKsBLCrcl
         qY7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 188.165.49.222 as permitted sender) smtp.mailfrom=clg@kaod.org
Return-Path: <clg@kaod.org>
Received: from 6.mo52.mail-out.ovh.net (6.mo52.mail-out.ovh.net. [188.165.49.222])
        by mx.google.com with ESMTPS id u18si6634194wml.193.2021.04.16.09.28.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Apr 2021 09:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of clg@kaod.org designates 188.165.49.222 as permitted sender) client-ip=188.165.49.222;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of clg@kaod.org designates 188.165.49.222 as permitted sender) smtp.mailfrom=clg@kaod.org
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
	by mo52.mail-out.ovh.net (Postfix) with ESMTPS id DB86C25DD68;
	Fri, 16 Apr 2021 18:28:02 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Apr
 2021 18:28:02 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-102R004d6a67272-8e9a-431b-9531-619e7147866a,
                    98643AE5B40D77660504470F9E4DE59E1F602129) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [RFC PATCH] target/arm: drop CF_LAST_IO/dc->condjump check
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	<qemu-devel@nongnu.org>
CC: <peter.maydell@linaro.org>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20210416154908.21673-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9e52582e-a010-5426-a645-5046d2eb0f32@kaod.org>
Date: Fri, 16 Apr 2021 18:28:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416154908.21673-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d47737ef-bb41-44b9-a130-e7ef56d21d3c
X-Ovh-Tracer-Id: 13479836636903017440
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudelhedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhg
X-TUID: 4bAsCsVAsyIf

On 4/16/21 5:49 PM, Alex Bennée wrote:
> This is a left over erroneous check from the days front-ends handled
> io start/end themselves. Regardless just because IO could be performed
> on the last instruction doesn't obligate the front end to do so.
> 
> This fixes an abort faced by the aspeed execute-in-place support which
> will necessarily trigger this state (even before the one-shot
> CF_LAST_IO fix). The test still seems to hang once it attempts to boot
> the Linux kernel but I suspect this is an unrelated issue with icount
> and the timer handling code.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Cédric Le Goater <clg@kaod.org>


Tested-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 


> ---
>  target/arm/translate.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 62b1c2081b..7103da2d7a 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9199,11 +9199,6 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>  {
>      DisasContext *dc = container_of(dcbase, DisasContext, base);
>  
> -    if (tb_cflags(dc->base.tb) & CF_LAST_IO && dc->condjmp) {
> -        /* FIXME: This can theoretically happen with self-modifying code. */
> -        cpu_abort(cpu, "IO on conditional branch instruction");
> -    }
> -
>      /* At this stage dc->condjmp will only be set when the skipped
>         instruction was a conditional branch or trap, and the PC has
>         already been written.  */
> 
