Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2591295ejb;
        Wed, 25 Oct 2023 01:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXG4/zNdya2klLoVpCL9PwYUDsTqMS2Ym4VY/HuqcrFpQDy+FeTvF2u1BoTDKoEuQ9kPr8
X-Received: by 2002:ad4:57ca:0:b0:66d:670:d425 with SMTP id y10-20020ad457ca000000b0066d0670d425mr21875729qvx.31.1698224283700;
        Wed, 25 Oct 2023 01:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698224283; cv=none;
        d=google.com; s=arc-20160816;
        b=lS0yJTqr5TRJi+Gmhq5DKzKzKKpFcD2fIG0EnMSinWB8WEqJvgatWpdXlxHuvOPmts
         lXdNMHRtl8ZZmiIBWck8y+7qDkBA7Ir586WsOA4SdUsklx4Ykh3KdPKnjBnlwl93fkUa
         gnP3LwH0EUam1PUEP29rYPsPAm/1DRbce26WweE831kRIu6sxnmVucu6HuS/CD6MqL/U
         ORFdCmubVtRTZll0RusS/4T9XlaCrc5C8asrLpRmI+7KK88/O/lEl1382hoTWYnNxpFU
         yhAl5yYvz1jMJTYRqX9B4fy4ty/PwHhSCGroipbC2/NUXGL00aOgn68s1VqlJ1G4E1b5
         RAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=8Q15p792oAtPVSo24gFUnKneZcKFaUcgvfNYoPCuuS8=;
        fh=IBEMdZSCUz2uu5kRekkZv6sX69at44dLvDZEK0mMKb8=;
        b=YJomN938uLv1wXQgsyAfKUioSJ1ElqtTm9M+p8PctoZgBmn2uAkqaeE3tRmiXTI/CK
         zkwnH+gZJA90iCxbbRt+1O6HsHH+caxgED1OnK18MgTrm6uphnNUu63/BQfmQST8vCYN
         UbUoJmr2l14vdEo3Qh3ZsBSYVOl8C3PhJOWKFWHWWEaBf3QKXzc5QnEqq7/wZS5tTKGj
         G7oezcccBiIWkdkNNp5WsxWBajW4JdpQeCXBM4Wc/FEJSRuFzDQ6i0af0hZAQq7bhVrF
         bfT3u9GjR+6UWlO8a1vGty0wJy64NLQ0o+xkxtsTb0NeE9IUlpBc1WyhwgY7yiNhp/Ip
         UAcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2-20020a05620a44c200b0076cd7f1c3dasi8284400qkp.247.2023.10.25.01.58.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 01:58:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvZhg-0006f4-Gi; Wed, 25 Oct 2023 04:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZha-0006eM-47; Wed, 25 Oct 2023 04:57:23 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=4l40=GH=kaod.org=clg@ozlabs.org>)
 id 1qvZhX-00048G-D8; Wed, 25 Oct 2023 04:57:21 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SFjVD3BbTz4wd2;
 Wed, 25 Oct 2023 19:57:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFjV95W6yz4wcM;
 Wed, 25 Oct 2023 19:57:05 +1100 (AEDT)
Message-ID: <255f59a0-6666-44c5-9b21-2435c82e17e2@kaod.org>
Date: Wed, 25 Oct 2023 10:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: aspeed: Update Andrew's email address
Content-Language: en-US
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, andrew@aj.id.au
Cc: joel@jms.id.au, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20230925062212.66112-1-andrew@codeconstruct.com.au>
 <aaa71ccc-e7d4-46f4-b902-22a422ff895a@kaod.org>
In-Reply-To: <aaa71ccc-e7d4-46f4-b902-22a422ff895a@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=4l40=GH=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: wL95R+4nNDxF

On 10/24/23 11:36, Cédric Le Goater wrote:
> On 9/25/23 08:22, Andrew Jeffery wrote:
>> I've changed employers, have company email that deals with patch-based
>> workflows without too much of a headache, and am trying to steer some
>> content out of my personal mail.
>>
>> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>> ---
>>
>> Hi Cédric, do you mind including this in your Aspeed queue?
> 
> 
> I am not sure to send an Aspeed PR. May be this change could go
> through qemu-trivial ?

After all, I will send an Aspeed PR. Don't bother.

Thanks anyhow,

C.
