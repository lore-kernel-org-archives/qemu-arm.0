Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5772169ejc;
        Tue, 7 Mar 2023 02:28:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+7y9yXRHTcqfg9S/qwj8vBPbIwIeN2GgY1Yt12XWGAcBZZY3pyzHlyoJ1CDMcXapitCEiP
X-Received: by 2002:a05:6214:481:b0:56e:a9d4:429b with SMTP id pt1-20020a056214048100b0056ea9d4429bmr26628955qvb.1.1678184928749;
        Tue, 07 Mar 2023 02:28:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678184928; cv=none;
        d=google.com; s=arc-20160816;
        b=IawfBhwMhT2JQoY/AB6TXlW/QgzbA2UC+fInkpkDOkR58jk61Fbx5WyrrS784YtNsS
         iu9BbebQLCl4bAWq02Ccr7ll/TpVdW2j5BFvtJPhUIgOZz+lqEyz0jWyGMc2adutB+YX
         UI2TCeM/3+qD2P/uRoBkps8ctJarbB/ufbQ4D9IedIpiHl9Qf1FbvXTb6Ai+KKDt9mst
         5/JyUdbNdZDyJvlC/k1i8CTjC6tSpOfhIAgyA/0Eywf300CH3ItE6CfGhmFI1TAdppod
         Z7zZfcknlr9yK2L5d1N5HWyhwB0H8vjM5O6tSzHDrrDQ/N8c9Jr0RA4857GSgjNeHZxJ
         Ce/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id;
        bh=TlSEn9A2nscBUDtb5S2NKe5G/xL7yrcfuDwJjECGnvw=;
        b=ZrIu6AWgyESg2H/sq1GjakbaeMQwHtkwVUU3kVml/pqVD8WBxT1w/cf/GlaLJTUMhr
         Aw9+Pu4tBj6hEEwupqsG5S5jFTCf3RfKNX61tFMLkZPj5GftNJDv2JcttRN0ahyLSpZ6
         1kw4I1AmBCbCaoIp/0JFIsPfmX+E2qiT2jGwvjCbHw9DXIQHm0+cTkAMpuYanUkbZza+
         trJAvUiEheDq0qBN++gLhGS9jd2lMa0UYf8u0+S79451xtv30HWZvx3rNY82zdkliRPR
         4ptnS8s8OZnZQ120rYJNZjqvPII1VF97iEM38vP461fHqwlHDV+9skkJfLUpJIc8JLyi
         nCbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17-20020a0cda11000000b0056d3019643asi9192637qvj.446.2023.03.07.02.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 02:28:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZUYY-0002nk-IF; Tue, 07 Mar 2023 05:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pZUYW-0002nO-E2
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 05:28:28 -0500
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pZUYU-0004C8-Nj
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 05:28:28 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.3])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 9CD8421EDF;
 Tue,  7 Mar 2023 10:28:21 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 7 Mar
 2023 11:28:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002a86da304-a175-462c-8392-5798e56207f5,
 D586700EEA543FC8D630564B717DAE7078976E4F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ddf527c7-20e2-0eb8-0105-2b1c4ef653eb@kaod.org>
Date: Tue, 7 Mar 2023 11:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] Added TMP421 type sensor's support in tiogapass
Content-Language: en-US
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230307101913.3585785-1-pkarthikeyan1509@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230307101913.3585785-1-pkarthikeyan1509@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b40f96e1-d278-44e7-9f0e-9bf9ee797354
X-Ovh-Tracer-Id: 1280429672200637222
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvddutddgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnheptdehtdefledvleejheeuteehfeduiedvvdevkedtleekteeifeetudevkeekudfgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhkrghrthhhihhkvgihrghnudehtdelsehgmhgrihhlrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2dG3TqoG0LhF

Hello Karthikeyan,

On 3/7/23 11:19, Karthikeyan Pasupathi wrote:
> Added TMP421 type sensor support in tiogapass platform.
> 
> Tested: Tested and verified in tiogapass platform.
> 
> Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
> ---
>   hw/arm/aspeed.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index e985ce85e5..c1843693fa 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -545,7 +545,7 @@ static void tiogapass_bmc_i2c_init(AspeedMachineState *bmc)
>       /* TMP421 */
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), "tmp421", 0x1f);
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp421", 0x4f);
> -    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp421", 0x4e);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp421", 0x4e);
>   }
>   
>   static void create_pca9552(AspeedSoCState *soc, int bus_id, int addr)

This patch is only removing a white space at the end of a line. Is that expected ?
If so, the commit log should be changed.

Thanks,

C.
