Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3330954njd;
        Wed, 2 Apr 2025 02:48:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2VkR24K/hhC2jChGoS5Vqtj/+28VkHdQ841lxoZ70XBkzGQxVc+elOftEXxLHtFbioIr3fhIaOsPK7g==@linaro.org
X-Google-Smtp-Source: AGHT+IHwrQQDt6zcZa2o9tTzDEGCDIZEZJMa9anEIWoI4K7hiaEK1Ts+lHn+Yv24/fymAgsQItCQ
X-Received: by 2002:ad4:4eec:0:b0:6e8:fa33:2969 with SMTP id 6a1803df08f44-6ef02bceeb3mr34361566d6.10.1743587299907;
        Wed, 02 Apr 2025 02:48:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743587299; cv=none;
        d=google.com; s=arc-20240605;
        b=YgOimf3DnSY0mg94WDZl0wofAKaPu6G1BkM76x08+uIViwTMuBvGD4rGPs6orw1Ima
         /2BcjKuUBM8FiuwKpQbURmhZVvEfM073FOBvHHEJatu1c2mXA76Oyusi+qNiIBZuuWKh
         eZDUIgRJqCp9xj/c1DGMD2EuDKqlWj0zwG7uhDQdKARM+vYyLzReeCTFWNgWGk1fVDdy
         TFkrhYDUp/0kBn7t6IyDVBPiYKDk204af8HqmP0lt9G41STyP37y9e+yByzZXG4JyizC
         qH0UdNgYn/LMPLe5IC9Nzd+TBO7m4Lw7N7tqSDginSsusYHoGhhW3HO0zu9uOEburUXO
         8DlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id;
        bh=SlJg3yfwhoT34XBmups7BTyNuS/Ov38CH0HZcvW1/No=;
        fh=KIQWrerkHcHGY8pI9tE4eJlk73GRvR/oZFuXy8RkeGg=;
        b=ZKy/u78woXtGvBVE5BJQpwFypw5rImFC9+VwlpwVmo6oAy0kFgRCRqyQjA2dg7K0CL
         1MPkhsiWbEaU5zux6bhLKGqQWFuJgcCku40xV64BXAScnyhy0AAjh/WApkAx22D0PnkZ
         oQRrdbE1+IT7uVoedqZeNsFih9M9okhyp2H6OpAyN64WQAW9yOxgDpcDN+3jHY8Bwtrb
         FOiD8BIZZLH5VAYyawILzhflb2O+0I2I61rfdD8bB0RUsv7WAPz7CzUxo+pA7qaAjBO7
         Lw12JzyIekFRcd8ZLhMAgisbRayW1lKhGT9iVeVNoqKACX0q5Dtj9W3KmF6v/TYz8Hb0
         k2SQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec962d3d7si108415856d6.73.2025.04.02.02.48.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 02:48:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tzuhh-0004oS-LX; Wed, 02 Apr 2025 05:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1tzuhe-0004ne-Ds; Wed, 02 Apr 2025 05:48:10 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1tzuhb-0002eM-LR; Wed, 02 Apr 2025 05:48:10 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4ZSKmj0F7fz4x3p;
 Wed,  2 Apr 2025 20:48:05 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZSKmd0Dxrz4w2H;
 Wed,  2 Apr 2025 20:48:00 +1100 (AEDT)
Message-ID: <3a9dcfc4-f14e-4e97-a4e4-1d4183957759@kaod.org>
Date: Wed, 2 Apr 2025 11:47:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/22] Fix incorrect hash results on AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=yfRC=WU=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d7lbuo+eKDrr

Hello Jamin,

On 3/21/25 10:25, Jamin Lin wrote:
> v1:
>   1. Added support for 64-bit DMA in the HACE model
>   2. Refactored the do_hash operation in the HACE model
>   3. Fixed a crash caused by out-of-bound memory access in HACE
>   4. Added more trace events and implemented dumping of source hash data and
>      resulting digests to improve debugging
>   5. Refactored the HACE QTest framework to support both AST1030 and AST2700
>   6. Added a test case for SHA384
> 
> This patchset resolves incorrect hash results reported on the AST2700 platform.
> This update addresses the following kernel warnings and test failures related to
> the crypto self-test framework:
> 
> aspeed-hmac-sha512 test failed (incorrect result)
> aspeed-hmac-sha384 test failed (incorrect result)
> aspeed-sha512 test failed (incorrect result)
> aspeed-sha384 test failed (incorrect result)
> aspeed-hmac-sha256 test failed (incorrect result)
> aspeed-hmac-sha224 test failed (incorrect result)
> aspeed-hmac-sha1 test failed (incorrect result)
> aspeed-sha224 test failed (incorrect result)
> aspeed-sha256 test failed (incorrect result)
> aspeed-sha1 test failed (incorrect result)
> 
> How to test it
> 
> Use the following command to dump information about the supported digest methods
> via the afalg hardware engine:
> 
> root@ast2700-default:~# openssl engine -pre DUMP_INFO afalg
> 
> Digest SHA1, NID=64, AF_ALG info: name=sha1ALG_ERR: , driver=aspeed-sha1 (hw accelerated)
> Digest SHA224, NID=675, AF_ALG info: name=sha224ALG_ERR: , driver=aspeed-sha224 (hw accelerated)
> Digest SHA256, NID=672, AF_ALG info: name=sha256ALG_ERR: , driver=aspeed-sha256 (hw accelerated)
> Digest SHA384, NID=673, AF_ALG info: name=sha384ALG_ERR: , driver=aspeed-sha384 (hw accelerated)
> Digest SHA512, NID=674, AF_ALG info: name=sha512ALG_ERR: , driver=aspeed-sha512 (hw accelerated)
> 
> The status of SHA1, SHA224, SHA256, SHA384, and SHA512 should be marked as
> hw accelerated, indicating that these algorithms are supported by hardware
> acceleration via the aspeed drivers.
> 
> Create a test file on the host machine and compute its HASH value as the
> expected result
> 
> Create a 256MB test file
> 
> $ dd if=/dev/random of=/tmp/256M bs=1M count=256
> Generate Hash Values Using SHA1, SHA224, SHA256, SHA384, and SHA512
> 
> Use the following commands to generate HASH values for a 256MB file using
> different SHA algorithms:
> 
> $ sha1sum /tmp/256M
> 7fc628811a31ab87b0502dab3ed8d3ef07565885  /tmp/256M
> 
> $ sha224sum /tmp/256M
> 2d261c11ba05b3a62e0efeab51c307d9933426c7e18204683ef3da54  /tmp/256M
> 
> $ sha256sum /tmp/256M
> 5716d1700ee35c92ca5ca5b466639e9c36eed3f1447c1aec27f16d0fe113f94d  /tmp/256M
> 
> $ sha384sum /tmp/256M
> fb6bc62afa1096dcd3b870e7d2546b7a5a177b5f2bbd5c9759218182454709e0c504a2d9c26404e04aa8010a291b7f1c  /tmp/256M
> 
> $ sha512sum /tmp/256M
> fbceda7be34836fe857781656318ecd5b457a833a24c8736d5b8ef8d07e1950eebcdb140eebe4f12b5ff59586f7eb1c64fa95869c63dd9e4703d91261093c5c9  /tmp/256M
> 
> Generate HASH Values Using the Hardware Engine
> 
> Use the following commands to generate HASH values for a 256MB file using
> various SHA algorithms with the afalg hardware engine:
> 
> 
> root@ast2700-default:~# openssl dgst -sha1 -engine afalg /tmp/256M
> Engine "afalg" set.
> SHA1(/tmp/256M)= 7fc628811a31ab87b0502dab3ed8d3ef07565885
> 
> root@ast2700-default:~# openssl dgst -sha224 -engine ast_crypto_engine /tmp/256M
> Engine "afalg" set.
> SHA2-224(/tmp/256M)= 2d261c11ba05b3a62e0efeab51c307d9933426c7e18204683ef3da54
> 
> root@ast2700-default:~# openssl dgst -sha256 -engine afalg /tmp/256M
> Engine "afalg" set.
> SHA2-256(/tmp/256M)= 5716d1700ee35c92ca5ca5b466639e9c36eed3f1447c1aec27f16d0fe113f94d
> 
> root@ast2700-default:~# openssl dgst -sha384 -engine afalg /tmp/256M
> Engine "afalg" set.
> SHA2-384(/tmp/256M)= fb6bc62afa1096dcd3b870e7d2546b7a5a177b5f2bbd5c9759218182454709e0c504a2d9c26404e04aa8010a291b7f1c
> 
> root@ast2700-default:~# openssl dgst -sha512 -engine afalg /tmp/256M
> Engine "afalg" set.
> SHA2-512(/tmp/256M)= fbceda7be34836fe857781656318ecd5b457a833a24c8736d5b8ef8d07e1950eebcdb140eebe4f12b5ff59586f7eb1c64fa95869c63dd9e4703d91261093c5c9
> 
> 
> The HASH values generated here should exactly match those computed on the host
> machine using software-based OpenSSL, verifying both the correctness of the
> hardware-accelerated results and the functionality of the afalg.
> 
> 
> Jamin Lin (22):
>    hw/misc/aspeed_hace: Remove unused code for better readability
>    hw/misc/aspeed_hace: Fix buffer overflow in has_padding function
>    hw/misc/aspeed_hace: Improve readability and consistency in variable
>      naming
>    hw/misc/aspeed_hace: Update hash source address handling to 64-bit for
>      AST2700
>    hw/misc/aspeed_hace: Introduce 64-bit digest_addr variable for AST2700
>    hw/misc/aspeed_hace: Support accumulative mode for direct access mode
>    hw/misc/aspeed_hace: Add support for source, digest, key buffer 64 bit
>      addresses
>    hw/misc/aspeed_hace: Support DMA 64 bits dram address.
>    hw/misc/aspeed_hace: Ensure HASH_IRQ is always set to prevent firmware
>      hang
>    hw/misc/aspeed_hace:: Support setting different memory size
>    hw/misc/aspeed_hace: Add trace-events for better debugging
>    hw/misc/aspeed_hace Support to dump plaintext and digest for better
>      debugging
>    test/qtest: Introduce a new aspeed-hace-utils.c to place common
>      testcases
>    test/qtest/hace: Adjust test address range for AST1030 due to SRAM
>      limitations
>    test/qtest/hace: Add SHA-384 test cases for ASPEED HACE model
>    test/qtest/hace: Add SHA-384 tests for AST2600
>    test/qtest/hace: Add tests for AST1030
>    test/qtest/hace: Update source data and digest data type to 64-bit
>    test/qtest/hace: Support 64-bit source and digest addresses for
>      AST2700
>    test/qtest/hace: Support to test upper 32 bits of digest and source
>      addresses
>    test/qtest/hace: Support to validate 64-bit hmac key buffer addresses
>    test/qtest/hace: Add tests for AST2700
> 
>   include/hw/misc/aspeed_hace.h   |   9 +-
>   tests/qtest/aspeed-hace-utils.h |  84 +++++
>   hw/misc/aspeed_hace.c           | 194 ++++++----
>   tests/qtest/aspeed-hace-utils.c | 646 ++++++++++++++++++++++++++++++++
>   tests/qtest/aspeed_hace-test.c  | 577 +++++-----------------------
>   tests/qtest/ast2700-hace-test.c |  98 +++++
>   hw/misc/trace-events            |   6 +
>   tests/qtest/meson.build         |   5 +-
>   8 files changed, 1074 insertions(+), 545 deletions(-)
>   create mode 100644 tests/qtest/aspeed-hace-utils.h
>   create mode 100644 tests/qtest/aspeed-hace-utils.c
>   create mode 100644 tests/qtest/ast2700-hace-test.c
> 

It looks good overall. There are a couple of issues in the tests to fix
and I think we should take this opportunity to rework do_hash_operation()
and make it simpler by cutting it in smaller pieces, one for each mode.


Thanks,

C.


