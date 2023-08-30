Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp4177036ejc;
        Wed, 30 Aug 2023 00:14:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERh7rq/RkDUbBcJhgIoK2vbBvnKz2PMg619S95Pu0MTsmyb9nf5FOywDXwNro9TlPVfdfk
X-Received: by 2002:ac8:5b0c:0:b0:410:a3ec:2fbe with SMTP id m12-20020ac85b0c000000b00410a3ec2fbemr1616400qtw.5.1693379656585;
        Wed, 30 Aug 2023 00:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693379656; cv=none;
        d=google.com; s=arc-20160816;
        b=w1sShU0VjzSqXWIhkIRdamVuOjBPen8erKuZxvmggxlOMNexM4YYegA0tfP0WclehO
         hTFrnjOgCzZUe2C5vn5YF3jf11nZtPipPSiet+HcPIASFJezfEZS1QK6aO4GcmsQArSq
         9bzGu0po0FY5/nv/XVN+PkBwMSwQAdBhLShb1RSXcLANn/ZgcPER3kXmXnl8agZ5c42l
         N/ao6GcHrne9aY35kSViFpD5UFoDLW2ElZEf9mX/oa8g+Ob7tbFhCGszEqOU6+pqguJa
         cj5rtQ4GB35qrDdqkS3gdjqcvzkUjHI6dZscbb+vsL6l799LjEsLU8XZjnZbQeFyhaOk
         xtew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=pBnycIeHyFUzCNiWlCVPK2cYS8RE6Gxd7WrcSFgs9FA=;
        fh=XyHsil/UgII5xin1955AMnlOwHpacJWa6F+kKpQ8czo=;
        b=ATy2wvorp97QR5RO6Gprlb1SCgdWCwL9cpNL0BJHjM/uVCwGg4m+QNydzvR2vQlHnS
         N+p2Meakz5+n6wzstRrakc6UzzsfXULN+SP52ImHyCooqwZd/dPt2lIZk3nzopEYDWYa
         z2AZkpNGYI0fUvJlPml5R+PQ3T4WutB6pGX5XqnnOzQILElwd1U86rNT10Wtk4wmbQia
         NcmjO+1jtlK2btBfomjIqHZeKnuSYnfxrXw1XjAIjblHUd8yqXA6hszoutDdvkBLHYrt
         F0TaMenFIBOqfVd4OTvDxhcHqS99ty3z1V63QNMo4rj8GZjf5PWD+yv2PiQGzqrP2lC3
         sEHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4-20020a05622a100400b00410a3b28d66si7147857qte.538.2023.08.30.00.14.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Aug 2023 00:14:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbFP1-0002p0-Qe; Wed, 30 Aug 2023 03:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=CWUu=EP=kaod.org=clg@ozlabs.org>)
 id 1qbFOk-0002hD-Tv; Wed, 30 Aug 2023 03:13:56 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=CWUu=EP=kaod.org=clg@ozlabs.org>)
 id 1qbFOi-0005hZ-6j; Wed, 30 Aug 2023 03:13:54 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RbFrn62Brz4wy7;
 Wed, 30 Aug 2023 17:13:45 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbFrk1Rn4z4wxn;
 Wed, 30 Aug 2023 17:13:41 +1000 (AEST)
Message-ID: <c722f63e-697b-eeab-82f0-7155b2a4632b@kaod.org>
Date: Wed, 30 Aug 2023 09:13:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 8/8] hw/fsi: Documentation and testing
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Ninad Palsule <ninad@linux.ibm.com>,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 berrange@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20230830022638.4183766-1-ninad@linux.ibm.com>
 <20230830022638.4183766-9-ninad@linux.ibm.com>
 <0cdc9d0c-b146-e55f-cd2d-81e6827e64e4@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <0cdc9d0c-b146-e55f-cd2d-81e6827e64e4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=CWUu=EP=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.242, SPF_HELO_PASS=-0.001,
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
X-TUID: Ujk7gOetd1a1

On 8/30/23 09:05, Thomas Huth wrote:
> On 30/08/2023 04.26, Ninad Palsule wrote:
>> Added FSI document
>> Added basic qtests for FSI model.
>> Added MAINITAINER for FSI
>> Replaced some qemu logs to traces.
> 
> Sorry, that's not how we rework patch series in the QEMU development process. Please squash the log traces changes into the patches that introduced the original code, and please put the MAINTAINERS update, documentation and qtests into separate patches.

yes. This is true for some Kconfig changes also. On that topic, please
make sure FSI is compiled only when ASPEED_SOC is selected. It could be
useful for the PPC PowerNV machines one day but the models are not
available yet.

I will try to go through the series this week. Wait a bit for the v4.

Thanks,

C.


