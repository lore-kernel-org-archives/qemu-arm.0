Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp377196njc;
        Mon, 24 Jun 2024 01:46:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmUFHXoXPRktD86Y/B1jC+W3zNMTQVJd6AfiE/UFodjpQR4qP3tlN+WxCeCKscfDdH2tudwgCn7Vc7CsgDiOO9X4NddRcT
X-Google-Smtp-Source: AGHT+IFCdqioXW7bCvNwkGQwVcMB3vvuapTpHSuihPIPkOZm439jgGJs7gPCXpl0vSz1fkAdOlzz
X-Received: by 2002:a05:622a:4b10:b0:444:eb4f:74ad with SMTP id d75a77b69052e-444eb4fd376mr6050821cf.23.1719218764035;
        Mon, 24 Jun 2024 01:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719218764; cv=none;
        d=google.com; s=arc-20160816;
        b=z8+zW4LBLqHSJDkNRv51zxNG7onRDVBXbqOc3ATq+A+xVITPWL7BvtHeV8ThyLr2EG
         UxUirenKQeYdt2ZYv9jO/pl4DKU4lKCa6/uNSB6xDjawi3q1z2eOEZnA0cTqD0n7obYd
         moIwf4IcWF++4iLsppsO3j8E9TnuAIgVYlSZgsNuEbRZO5wdvNOa9HfdkymxSja7aZMz
         +V+hfhLk8xngSK22891eKE65qpEe77Mye7mdKc6NmAQixQBSi9wYfi5R1XKPNxmg1I6m
         SGli4/v7JLmJ+egkOr7zulPyHzElaivNh2oM9EtT7hoCfd8DmzbJUkD7sb7Jn7kHrA1d
         zxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=8G+rX3SYoThotW/I0NXwEG/Yw6Z4/mEUUbnpudACK/8=;
        fh=y8UldgvBpgWdzvo0ZnT6ptMSZ9zI0pieroCu40oTsaQ=;
        b=coNQNi3dTj4YfHHIbwlxLGaDYDIQWZqpY5NfHzcxbpbWQCqftHZouzBLTVQeiTKYag
         NoX76+R+JtuwtTDsLt1aZyvDS+gnZeUHip4a6gMUHoyMPKv0hA5FfHQ6lDq9cx/qLuUq
         Pi2V9tnEb5msKXkdpZ/vVmlQqWluKdeVpAMd4LScr0g74iz2jDmDQKMhkBjY+gKu/RQH
         e/F3dkW+922k8R6Ok7/sQ/3olAW/uJRWrj0xLD9hxn2bvDxz7r79xS1Fki/8wsh2/rL1
         poQhvRRN+avigAFGt4g7COwgwvBgwJGwrCSyK1zOk0ZjEaZU1wUaYaj96qt+f33LhOQm
         4cXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444c2b4e05csi84173331cf.32.2024.06.24.01.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 01:46:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sLfKi-0000HX-QA; Mon, 24 Jun 2024 04:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=voaC=N2=kaod.org=clg@ozlabs.org>)
 id 1sLfKZ-0000Eu-Hm; Mon, 24 Jun 2024 04:45:50 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=voaC=N2=kaod.org=clg@ozlabs.org>)
 id 1sLfKU-0007EF-EO; Mon, 24 Jun 2024 04:45:41 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4W71kh6Xzvz4wx6;
 Mon, 24 Jun 2024 18:45:32 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4W71kd2cnlz4wb2;
 Mon, 24 Jun 2024 18:45:29 +1000 (AEST)
Message-ID: <3b9f1e20-75b0-4192-828d-47e769ef3de9@kaod.org>
Date: Mon, 24 Jun 2024 10:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] aspeed/sdmc: fix coverity issue
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240619093508.2528537-1-jamin_lin@aspeedtech.com>
 <20240619093508.2528537-3-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240619093508.2528537-3-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=voaC=N2=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: PUuGyd42XPDD

On 6/19/24 11:35 AM, Jamin Lin wrote:
> Fix coverity defect: Control flow issues (DEADCODE)

     aspeed/sdmc: Remove extra R_MAIN_STATUS case
     
     Coverity reports that the newly added 'case R_MAIN_STATUS' is DEADCODE
     because it can not be reached. This is because R_MAIN_STATUS is handled
     before in the "Unprotected registers" switch statement. Remove it.
     
     Fixes: Coverity CID 1547112
     
with that,


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.



> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/misc/aspeed_sdmc.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index 93e2e29ead..94eed9264d 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -589,7 +589,6 @@ static void aspeed_2700_sdmc_write(AspeedSDMCState *s, uint32_t reg,
>       case R_INT_STATUS:
>       case R_INT_CLEAR:
>       case R_INT_MASK:
> -    case R_MAIN_STATUS:
>       case R_ERR_STATUS:
>       case R_ECC_FAIL_STATUS:
>       case R_ECC_FAIL_ADDR:

