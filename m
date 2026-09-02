Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70D1C624D4
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 06:11:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1eBA-0006d2-Rm; Wed, 02 Sep 2026 02:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1x1eBA-0006ch-49
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 02:10:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1x1eB8-000304-Do
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 02:10:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788329433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qXeEYmdq+fv9GR9jc2xTGC+4M1iZskHC1ufE+rb/9/M=;
 b=Tx4g1K3FvCO4YUD1+uMtyp/KKPyktlOs79J0IH6hxp2pW1yUxVf2RwPoSz42BcA1aarG6l
 0aSLPptxb9TXxXjn8Pihieg9R+vJfJ4L2mSuAx4ZIZsSLeqq6dKwhAog5qLMEkx3sg6QJ6
 7OmNOrG3wjL4xvd+T8lS7NidCnCFY+g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-bKgm6OGYMdehngN8oMZyeQ-1; Wed, 02 Sept 2026 02:10:32 -0400
X-MC-Unique: bKgm6OGYMdehngN8oMZyeQ-1
X-Mimecast-MFC-AGG-ID: bKgm6OGYMdehngN8oMZyeQ_1788329431
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4997b060af8so4578355e9.1
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 23:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788329431; x=1788934231;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=qXeEYmdq+fv9GR9jc2xTGC+4M1iZskHC1ufE+rb/9/M=;
 b=nbrA4jNy4khbNJVWXSMFWEm5EgM8efk9UCJXqfU22OecFD/kjjuvMeI7s8vDMYQo1y
 EiUZyXY66p/bGycGdI0VJd4wL72SeRnbJZk3aUfpFjRRAcckqkvekTT/UHr0LG0u//j5
 ymue48aQ3SvEZneVLbLwlk+lqwqJbQ6iTUbeUtFYeEChPzyrQAJcX48YiLapqlQCRlrL
 0RnCsOMEF65TQdUYqczUbyW0hEFjlTYN7fklIyYhD3hwyf3sRcAIJLrrCD/76FDJNlCY
 YB0Thw2eUsJTqd+UXBzsxaiSKOjSOFWnIqSVObB7XlDc5EM7GWA8futW14kvJ1AtQ9tg
 SJpw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrTGj9ZqlIjzzBV1Kc+Irdnojw2IH1+U1b6dQueUC4rxwR1K41x1m2P+Z5zQZT7gKbTK7FcbD+17w==@nongnu.org
X-Gm-Message-State: AFuF++kkModSLzUW9oQRblqdJhdkfNOiBHZXUvRjzeyXkd+3gFDJKMVE
 NNnEsgZbK2DX5/5cuymX11CfiGA/EYh1qWCr0GZhr9BoCHh4YnuNy3AyIpSE6bcKDa1IhWq/ic2
 E7tUH/8mIK+bpDYqQtrZI1bPw1hAxabpebE5XGYgNYbif2eXfaHVYOA==
X-Gm-Gg: AR+sD10q8XzBxU+dIQ5yrje4xiSIajcJ7GtFUlHPpQSoOyd54zXLq4fUqwD/0FqrmgY
 vur9GbkiO1N9NfvoWLQK9StRGQnya9pK9RNdkJI1jzwZF8zPMdFMiuYE/lz1Km08Du+eMl/kxDT
 TEu8LEtnKtTUVSkmdoeyqbz6FEnHR5eZUrUDVnOcnSqjaSammFhZhkl3FPO70p3IlTnP3u64qo8
 xpiGOaCACq3RaT1s9k0uDP1ei/l5dUl7wLtkcHj7jtIhkKItMFOajIwhVvfgWrT1AW5NTbWNhpX
 9mHm8n6PLDay6K/pYnq/luoDRhTGXtMW/QaO+iBDNR3sypDNkjvt7ldNgMfMVLif4pj6LBUGLIH
 bggnXYGEnN3eYNJ0Q+f76mKwTWjY1DpbW0UT0CTo=
X-Received: by 2002:a05:600c:4744:b0:496:c9cd:e7ab with SMTP id
 5b1f17b1804b1-49ce5813246mr32723445e9.5.1788329430670; 
 Tue, 01 Sep 2026 23:10:30 -0700 (PDT)
X-Received: by 2002:a05:600c:4744:b0:496:c9cd:e7ab with SMTP id
 5b1f17b1804b1-49ce5813246mr32722465e9.5.1788329429995; 
 Tue, 01 Sep 2026 23:10:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:2cd2:7ace:8238:f7f4?
 ([2a01:e0a:280:24f0:2cd2:7ace:8238:f7f4])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce4642382sm44871145e9.3.2026.09.01.23.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 23:10:29 -0700 (PDT)
Message-ID: <8c52d30f-da14-4069-88ce-8a52377c65ac@redhat.com>
Date: Wed, 2 Sep 2026 08:10:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Add ECDSA akcipher support and the ASPEED SBC
 ECDSA engine for AST10x0
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20260901085238.995968-1-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20260901085238.995968-1-jamin_lin@aspeedtech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x9IagjHwUKBwwQO4lyF2TS_o7E36si8vTuQtCMv8NMg_1788329431
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/1/26 10:52, Jamin Lin wrote:
> This series depends on:
> 
>   1. [v4,0/4] Add ASPEED ACRY RSA model for the AST2600
>      https://patchwork.kernel.org/project/qemu-devel/cover/20260901081531.898176-1-jamin_lin@aspeedtech.com/
> 
> This series adds ECDSA to the QEMU crypto akcipher framework and models the
> ASPEED AST10x0 secure boot controller (SBC) ECDSA engine on top of it.
> 
> The crypto side adds ECDSA sign/verify for prime256v1 (NIST P-256) and
> secp384r1 (NIST P-384) in both the gcrypt and nettle backends, using the raw
> big-endian form (public key Qx || Qy, private key scalar d, signature r || s)
> with a pre-computed digest as input.
> 
> Both the AST2600 and the AST1030/AST1060 have a Secure Boot Controller (SBC)
> that supports RSA and ECDSA verification, but only the AST1030/AST1060 have an
> ECDSA verify engine, so this series models ECDSA only. RSA verification is used
> solely to verify the AST2600 SPL in ROM CODE, which ASPEED does not release,
> so it is very unlikely to be used by end users.
> 
> v1:
>   1. Add ECDSA akcipher support with gcrypt backend
>   2. Add ECDSA akcipher support with nettle backend
>   3. Add ECDSA sign/verify unit tests
>   4. Support the ECDSA verify command for AST10x0
>   5. Add ASPEED SBC ECDSA engine qtest
> 
> v2:
>   1. Wrap the SEC SRAM in a container mapped at offset 0 so the device
>      addresses it by relative offset (drop the "sram-base" property)
>   2. Add a patch removing the obsolete unimplemented SBC mapping
>   3. Add Qtest to ast1060-evb machine.
>   4. Rename R_ECDSA_CMD to R_SEC_TRIGGER, since the register
>      triggers both the RSA and ECDSA engines.
> 
> v3:
>   1. fix typo
>   2. Replace g_printerr with g_test_skip
> 
> v4:
>    1. Reorder the patches to fix a QEMU startup failure at an intermediate commit.
>    2. Add public key type validation for ECDSA verification.
>    3. Add private key type validation for ECDSA signing.
>    4. Remove sbc_unimplemented from AspeedSoCState
>    5. Update the commit messages.
> 
> Jamin Lin (9):
>    qapi/crypto: Add ECDSA algorithm and curve id
>    crypto/akcipher: Support ECDSA sign/verify with gcrypt
>    crypto/akcipher: Support ECDSA sign/verify with nettle
>    tests/crypto: Add ECDSA sign/verify tests
>    hw/arm/aspeed_ast10x0: Remove obsolete unimplemented SBC mapping
>    hw/misc/aspeed_sbc: Increase register space to 0x1000
>    hw/arm/aspeed_ast10x0: Wire SEC SRAM to the SBC model
>    hw/misc/aspeed_sbc: Support the ECDSA verify command
>    tests/qtest: Add ASPEED SBC ECDSA engine test
> 
>   qapi/crypto.json                  |  33 ++-
>   include/hw/arm/aspeed_soc.h       |   1 -
>   include/hw/misc/aspeed_sbc.h      |   6 +-
>   hw/arm/aspeed_ast10x0.c           |  14 +-
>   hw/misc/aspeed_sbc.c              | 158 +++++++++++++-
>   tests/qtest/aspeed-sbc-test.c     | 194 +++++++++++++++++
>   tests/unit/test-crypto-akcipher.c | 236 +++++++++++++++++++++
>   crypto/akcipher-gcrypt.c.inc      | 340 +++++++++++++++++++++++++++++-
>   crypto/akcipher-nettle.c.inc      | 272 ++++++++++++++++++++++++
>   hw/misc/trace-events              |   2 +
>   tests/qtest/meson.build           |   2 +
>   11 files changed, 1242 insertions(+), 16 deletions(-)
>   create mode 100644 tests/qtest/aspeed-sbc-test.c
> 

Applied to

     https://github.com/legoater/qemu aspeed-next

Thanks,

C.


