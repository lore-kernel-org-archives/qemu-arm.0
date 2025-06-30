Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2712539dye;
        Mon, 30 Jun 2025 13:29:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXN1REQvqNJ3uiJ/2a54YCZMTdLm6Vbfc4G/xkRpD8INdFiXApYsH4mR5ZJsIz7PpXevk80NX429khAUA==@linaro.org
X-Google-Smtp-Source: AGHT+IFoYY9oCF066VeW4I4O8uKcy2e3n9UdljgTJCVJuD9taOuttCRp2DnKY7kKdCQ6XpKsD3RI
X-Received: by 2002:a05:620a:450c:b0:7d4:4b48:fbdc with SMTP id af79cd13be357-7d44b48fc4fmr1391903985a.32.1751315367848;
        Mon, 30 Jun 2025 13:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751315367; cv=none;
        d=google.com; s=arc-20240605;
        b=KaNscEmUOLfgr46kQY5ljlhivOkfVhkByGrMzlhmIyTVDc0TNkZ9FOnMRQD42oq7BH
         R4r/aASq3DLJN2zgdTl6TXSsUiJ4zK0y5DDl2HzPhtzwuYxxjNgj0EAiA8Iiux3FsIvV
         ePFqYK8fEMiXF+ub10ljpC2G8gZhglqL8+A+rh58AbG3bDbU2Yo//gTr7PxRTtg6rWuQ
         TLVMB3aKmkt63Vc0oAgPyp+ysn2VrdgUxO69isv9HAhwmQYL/K6OXsUx5B5AjCkWw2iM
         76sKikS6+L3LVIbliBgOgK7nIMvRYmQYMqWPDmPFEoiNqvCHelMj/pjpalhTGIlld0Me
         zzdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:content-language:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id;
        bh=b9SHbIA4SwzW7marB6EizY0re311FYUOn0VVHFB4CkQ=;
        fh=y8UldgvBpgWdzvo0ZnT6ptMSZ9zI0pieroCu40oTsaQ=;
        b=eUD3bDOacM7I3IOy6gC5TAHecarUZy8DluNo7dEY5FZjQTbR8EqkL3Mjyda8kYhSTx
         AizPh+OBWPZBhFmYZnZvFyfvMRDiypzApcBdEchfXwJdwwwOxfbLqjiSBRjS0ccKRviz
         voUa/6kLTb1dQEkNGSB8fxz+an9Cz8Frp0fjT6AqUvM9Wdi2TQgLN4ibLyGFdHMa0DZD
         TeNmg4FkThdPaqAhBDphoKzN42RD71ty4hX9U9dzgsxS3OUJYMXeecbjhc3jTX2fCEvV
         6p2nlq3vwkdCfROqsOZO25Pq0KrqD3EGd9qUqa1n4rVGIQmQMfMDLddbrAzBYPgb45DF
         YpXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d4432769bcsi924267085a.465.2025.06.30.13.29.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Jun 2025 13:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWL7U-0006bG-LI; Mon, 30 Jun 2025 16:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=bKmi=ZN=kaod.org=clg@ozlabs.org>)
 id 1uWL7S-0006aI-AY; Mon, 30 Jun 2025 16:28:50 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=bKmi=ZN=kaod.org=clg@ozlabs.org>)
 id 1uWL7Q-0003vF-17; Mon, 30 Jun 2025 16:28:50 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4bWHmn4ZgTz4xQ1;
 Tue,  1 Jul 2025 06:28:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWHmk0mK1z4w2S;
 Tue,  1 Jul 2025 06:28:35 +1000 (AEST)
Message-ID: <9534dc4d-fdf6-418d-b5f7-9bc7f03bf7ec@kaod.org>
Date: Mon, 30 Jun 2025 22:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/18] Support AST2700 A1
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
 <096e8152-ec19-4b2b-aa56-dd566ce7bb6d@kaod.org>
Content-Language: en-US, fr
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <096e8152-ec19-4b2b-aa56-dd566ce7bb6d@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=bKmi=ZN=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: k2y0ziZ6uWyx

Hi,

On 1/31/25 08:34, Cédric Le Goater wrote:
> Hello Jamin,
> 
> On 1/21/25 08:04, Jamin Lin wrote:
>> v1:
>>   1. Refactor INTC model to support both INTC0 and INTC1.
>>   2. Support AST2700 A1.
>>   3. Create ast2700a0-evb machine.
>> With the patch applied, QEMU now supports two machines for running AST2700 SoCs:
>> ast2700a0-evb: Designed for AST2700 A0
>> ast2700-evb: Designed for AST2700 A1
> 
> Let's do that progressively, please add a new ast2700a1-evb machine too and
> a machine alias on ast2700a0-evb. Then we will change the alias on the newer
> SoC.


So, machine 'ast2700a1-evb' was added in QEMU 10.0.0 :

   498c519eb776 "hw/arm/aspeed: Add Machine Support for AST2700 A1"

and machine 'ast2700a0-evb' in QEMU 9.1.0:

   92707992103e "aspeed: Add an AST2700 eval board"

and, currently, machine 'ast2700-evb' is an alias of 'ast2700a0-evb' :

   $ ./build/qemu-system-aarch64 -M ?  | grep AST2700
   ast2700-evb          Aspeed AST2700 A0 EVB (Cortex-A35) (alias of ast2700a0-evb)
   ast2700a0-evb        Aspeed AST2700 A0 EVB (Cortex-A35)
   ast2700a1-evb        Aspeed AST2700 A1 EVB (Cortex-A35)

Should we switch the alias to point to 'ast2700a1-evb' in QEMU 10.1.0 ?
and deprecate the A0 SoC and machine if it is no longer planned to
support them.

Thanks,

C.
