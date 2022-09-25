Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1530613ejy;
        Sun, 25 Sep 2022 09:21:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6oPijxuFPxPCSj1BBiTTN2ZzzfqEYihWbjRH16RTexQJGCCB01mO28zzay/mKi6rUcAFoj
X-Received: by 2002:a05:620a:4310:b0:6ac:f9df:178d with SMTP id u16-20020a05620a431000b006acf9df178dmr12181513qko.773.1664122911341;
        Sun, 25 Sep 2022 09:21:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664122911; cv=none;
        d=google.com; s=arc-20160816;
        b=ehrQqch+XkBnZ5nyCrBPSj/Awqn+MlTScMv0CDbhPIhi3ofsWbb1oTl0VzIV8InY5N
         TgbcvVHnB+SuA9JVco3gWPYt0/d+kFoVfpUxwwytYd7216lit4uReDjJmYoaj1bI4Vhe
         Nk02ojO9M4/0X8ZTnstw6uuiQ/hxn7Urz76X0NOB4EP8brn33CtSbsWx0u0qP0Zmg3jI
         NoxBQLhWrPGOY1GxtpsDGLzlrH5Ch6xMx8mK90vWjYOshToe3gFbiQ6to3NCLE6YQHd8
         GS1aEfUrp9ykM9LH/5bI5Gf/GM/nBvvPaub4AbETV5ny/diPTQpGbZlFdZYBrn0XKeME
         N11A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=XfzijjvuzL2ahfsW00utValVSF+Wpr74LB7yw2XdSAQ=;
        b=kVpYxbxrDiHDubqDWvitCOFnWXtlb/fL5U09voQjNgG5IZQmUNTxlBMYTBRThlBftk
         I0/4gf2uXiEDbzmHEdoHUK8k1I/wNm8+YNNz8+1zZgqeyRIRwFHI8H7R83gIDSXV2AgM
         d6QhIvtik0tYn0rugxpzTO/GObd6ar4mbrHjxHFWu+Wa0LprpJPWoLD2jV7NGxwPuQRw
         dxCxlrQJTAqwbfzpOQe9iXPBo3V+PYhZpEM6qwQLcmTCxComnNq0y6JIgGFMt3SABLUw
         av2zwBj4N6Rvbc7Aaqpko7MyuDkbJEPU+UqIgZmta/MTJVrLIhEd6q8OmjaNc/l7YOve
         91TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12-20020a05620a448c00b006bbb3edd637si8332071qkp.30.2022.09.25.09.21.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Sep 2022 09:21:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ocUO6-0004Rv-QL
	for alex.bennee@linaro.org; Sun, 25 Sep 2022 12:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ocUNQ-0004P0-9h
 for qemu-arm@nongnu.org; Sun, 25 Sep 2022 12:21:10 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:51071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ocUNL-0006CW-Cc
 for qemu-arm@nongnu.org; Sun, 25 Sep 2022 12:21:07 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0D69312BE0160;
 Sun, 25 Sep 2022 18:20:51 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Sun, 25 Sep
 2022 18:20:50 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0029cf5d7cb-dd61-4561-8765-c1aa0b1aba99,
 F2BAAC272AACDAE9383B0CB74E4F720F3B7CB042) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5ebb56ed-d570-e69e-7406-f7f1d6218d05@kaod.org>
Date: Sun, 25 Sep 2022 18:20:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 06/54] tests/qtest: aspeed_smc-test: Avoid using
 hardcoded /tmp
To: Bin Meng <bmeng.cn@gmail.com>, <qemu-devel@nongnu.org>
CC: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>, Bin Meng
 <bin.meng@windriver.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Thomas Huth
 <thuth@redhat.com>, <qemu-arm@nongnu.org>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-7-bmeng.cn@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220925113032.1949844-7-bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 16583110-3dfb-4a6d-b8e7-c997661aa31d
X-Ovh-Tracer-Id: 9214927790472334325
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegtddguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.766,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6ttRzXn2ui/Y

On 9/25/22 13:29, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> This case was written to use hardcoded /tmp directory for temporary
> files. Update to use g_file_open_tmp() for a portable implementation.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
> 
> Changes in v3:
> - Split to a separate patch
> - Ensure g_autofree variable is initialized
> 
>   tests/qtest/aspeed_smc-test.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index 05ce941566..c713a3700b 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -608,16 +608,15 @@ static void test_write_block_protect_bottom_bit(void)
>       flash_reset();
>   }
>   
> -static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
> -
>   int main(int argc, char **argv)
>   {
> +    g_autofree char *tmp_path = NULL;
>       int ret;
>       int fd;
>   
>       g_test_init(&argc, &argv, NULL);
>   
> -    fd = mkstemp(tmp_path);
> +    fd = g_file_open_tmp("qtest.m25p80.XXXXXX", &tmp_path, NULL);
>       g_assert(fd >= 0);
>       ret = ftruncate(fd, FLASH_SIZE);
>       g_assert(ret == 0);

