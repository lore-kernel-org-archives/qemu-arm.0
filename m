Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CD7106703C
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Mar 2026 15:18:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0ho1-0006uA-4I; Thu, 12 Mar 2026 11:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1w0hnv-0006pv-Jm
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 11:18:30 -0400
Received: from 10.mo533.mail-out.ovh.net ([46.105.72.194])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1w0hnr-0003Co-00
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 11:18:26 -0400
Received: from director3.derp.mail-out.ovh.net
 (director3.derp.mail-out.ovh.net [152.228.215.222])
 by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4fWrpx53vSz5x8Q;
 Thu, 12 Mar 2026 15:18:17 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net
 (director3.derp.mail-out.ovh.net. [127.0.0.1])
 by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <jamin_lin@aspeedtech.com>; Thu, 12 Mar 2026 15:18:16 +0000 (UTC)
Received: from mta11.priv.ovhmail-u2.ea.mail.ovh.net (unknown [10.109.249.154])
 by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4fWrpw6gfSz5vZt;
 Thu, 12 Mar 2026 15:18:16 +0000 (UTC)
Received: from kaod.org (unknown [10.1.6.7])
 (Authenticated sender: clg@kaod.org)
 by mta11.priv.ovhmail-u2.ea.mail.ovh.net (Postfix) with ESMTPSA id
 CA0DD24038EB; Thu, 12 Mar 2026 15:18:15 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-111S005803ca4ba-89c6-4ccf-9dbe-078dcd3b2f7c,
 A44AD0A7FA4CC2C77A0E4155D0E1898E03217822) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <588b3b38-172a-493f-a842-5a2fb5796391@kaod.org>
Date: Thu, 12 Mar 2026 16:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RE: [PATCH v4 0/4] Support HACE to AST2700 (resend)
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>
References: <20250225075622.305515-1-jamin_lin@aspeedtech.com>
 <675766c2-4015-43e8-b070-d58f2cdd23e7@kaod.org>
 <SEYPR06MB5037484B224FD0F3DE53B117FCD02@SEYPR06MB5037.apcprd06.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <SEYPR06MB5037484B224FD0F3DE53B117FCD02@SEYPR06MB5037.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 15652260507586702347
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGZ2NyMEo3yNeSW5Yh4O0xIEVJ9XtLdyeo942UV3Dsa7j/KpJJTeTHlZv3KhjxTjJ/Z714e2ilOqSfzNTh3o/F0IZPbqMvTGELyQpjV6YuHrdGsC5L/LpcK9cio+a6unhVoumFKu0ccSaEAwgvmmK//ZWufL8tXx8yl6pBdQSotOx/vxjwcN3+ppud8995bVj9qKboo5h0X1X6TNAesi6zSBSP/3K9uu6BP0BsmOvsN3jk3X6yneipGkt+5vd2WgoJkW+9D4ei4w/kw81DjXSJ8B6MP+yavcwgemjd2nqznW3aGFiin7nCZ/4sCWptAgIitSfPKJNQONOtlpbRsME3HRfYuio/q4EYg0zpDoj8cLq2VE/nkkv6ahOMF0Uy9NxEQszTnSNAcHQRpMozH7ZJ56zO6nOcl2B87pAWLhiaYDHY3zojZMy6K3ugAu1wYoStybO64Cmj6pthI6YbHOmbBpoLn8Y3Y8xVyRoZfwTxBfkr0Toh/8hYDeDag0yNbBku0C0H/UpW/b5ATfOCCP12LKHbHJuu4nVMxS8u2jjcaG1N4vZUSkq17lFue/E7S/bEpgBx91uhW6uYotx6oF5c3rj3IoEK/YM0FLZagNoZFVWp/cIPoXXNgDbvuSrunfEUoSI9TMYZiUbLZ/SOlUu9bEkCCpKRs0R76IuEmbnL9ug
DKIM-Signature: a=rsa-sha256; bh=bGj8kaQJB3oG9QFPWfQjULuDfoi2rP9vg/jUpRRSWPo=; 
 c=relaxed/relaxed; d=kaod.org; h=From; s=ovhmo393970-selector1;
 t=1773328699; v=1;
 b=nnO8TzyRb3qVShGd6aBQ39xPEaDsn1Ara1T6e5mKNNWAGD75LUEasj9GDeGZdr9Gv11xPp77
 6Iw5EQ7dM39cH5NlLZnJtc7jibxjKQYFfZ8JYyVYA6GrWOwUY7USd1QLKNQpUztXs11X6YK+7KI
 jqflkal7va+5+yyMTrjD7XGHtQA2gIhrcGugMkr7LvY0M80z00D1hv0DRRJ8D6QBLLkdV7u1oux
 hvIyVdC1+hAVoGRjwJ4OMYnhdVo3OfwsbZ059OMlvkRhGN5M2Sc0ECQ/ahLxglKwgdxVSILlJKj
 TW4ZEb5ciHacMpCVZudJRBsjq/PoFAOYAYrEB9bVKkxwQ==
Received-SPF: pass client-ip=46.105.72.194; envelope-from=clg@kaod.org;
 helo=10.mo533.mail-out.ovh.net
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.819, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.903,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hello Jamin,

On 3/12/25 10:32, Jamin Lin wrote:
> Hi Cedric,
> 
>> -----Original Message-----
>> From: Cédric Le Goater <clg@kaod.org>
>> Sent: Wednesday, March 12, 2025 5:25 PM
>> To: Jamin Lin <jamin_lin@aspeedtech.com>; Peter Maydell
>> <peter.maydell@linaro.org>; Steven Lee <steven_lee@aspeedtech.com>; Troy
>> Lee <leetroy@gmail.com>; Andrew Jeffery <andrew@codeconstruct.com.au>;
>> Joel Stanley <joel@jms.id.au>; open list:ASPEED BMCs
>> <qemu-arm@nongnu.org>; open list:All patches CC here
>> <qemu-devel@nongnu.org>
>> Cc: Troy Lee <troy_lee@aspeedtech.com>
>> Subject: Re: [PATCH v4 0/4] Support HACE to AST2700 (resend)
>>
>> Jamin,
>>
>> On 2/25/25 08:56, Jamin Lin wrote:
>>> This patch series is from
>> https://patchwork.kernel.org/project/qemu-devel/cover/20250213033531.336
>> 7697-1-jamin_lin@aspeedtech.com/.
>>> To expedite the review process, I have separated the HACE patches
>>> portion from the
>> https://patchwork.kernel.org/project/qemu-devel/cover/20250213033531.336
>> 7697-1-jamin_lin@aspeedtech.com/ patch series into this new patch series.
>>>
>>> v4: Support HACE to AST2700
>>>
>>> Jamin Lin (4):
>>>     hw/misc/aspeed_hace: Fix coding style
>>>     hw/misc/aspeed_hace: Add AST2700 support
>>>     hw/arm/aspeed_ast27x0: Add HACE support for AST2700
>>>     hw/misc/aspeed_hace: Fix boot issue in the Crypto Manager Self Test
>>>
>>>    include/hw/misc/aspeed_hace.h |  2 ++
>>>    hw/arm/aspeed_ast27x0.c       | 15 ++++++++++
>>>    hw/misc/aspeed_hace.c         | 55
>> ++++++++++++++++++++++++++++++++---
>>>    3 files changed, 68 insertions(+), 4 deletions(-)
>>>
>>
>> The kernel reports a lot of errors when running the crypto tests on a
>> AST2700 A1 Soc. See the functional test logs :
>>
>>       $ grep alg:
>> build/tests/functional/aarch64/test_aarch64_aspeed.AST2x00MachineSDK.test
>> _aarch64_ast2700a1_evb_sdk_v09_05/console.log
>>
>>       2025-03-12 10:10:42,705: [    2.206831] alg: skcipher: aspeed-ctr-tdes
>> encryption test failed (wrong result) on test vector 0, cfg="in-place (one sglist)"
>>       2025-03-12 10:10:42,706: [    2.207328] alg: self-tests for
>> ctr(des3_ede) using aspeed-ctr-tdes failed (rc=-22)
>>       2025-03-12 10:10:42,707: [    2.207894] alg: self-tests for
>> ctr(des3_ede) using aspeed-ctr-tdes failed (rc=-22)
>>       2025-03-12 10:10:42,725: [    2.219342] alg: skcipher: aspeed-ctr-des
>> encryption test failed (wrong result) on test vector 0, cfg="in-place (one sglist)"
>>       2025-03-12 10:10:42,725: [    2.219511] alg: self-tests for ctr(des)
>> using aspeed-ctr-des failed (rc=-22)
>>       2025-03-12 10:10:42,725: [    2.219651] alg: self-tests for ctr(des)
>> using aspeed-ctr-des failed (rc=-22)
>>       2025-03-12 10:10:42,733: [    2.224344] alg: skcipher: aspeed-ctr-aes
>> encryption test failed (wrong result) on test vector 0, cfg="in-place (one sglist)"
>>       2025-03-12 10:10:42,734: [    2.224775] alg: self-tests for ctr(aes)
>> using aspeed-ctr-aes failed (rc=-22)
>>       2025-03-12 10:10:42,734: [    2.225015] alg: self-tests for ctr(aes)
>> using aspeed-ctr-aes failed (rc=-22)
>>       ...
>>
>> What is something missing in the models ?
>>
> 
> Currently, we do not implement HACE/CRYPT in aspeed_hace.c.
> https://patchwork.kernel.org/project/qemu-devel/patch/20250225075622.305515-5-jamin_lin@aspeedtech.com/
> 
> Known Issue:
> The HACE crypto and hash engine is enable by default since AST2700 A1.
> However, aspeed_hace.c(HACE model) currently does not support the CRYPTO command.
> To boot AST2700 A1, created a patch which temporarily resolves the
> issue by sending an interrupt to notify the firmware that the cryptographic
> command has completed. It is a temporary workaround to resolve the boot issue
> in the Crypto Manager SelfTest.
> 
> As a result, you will encounter the following kernel warning due to the
> Crypto Manager test failure.
> 
> ```
> alg: skcipher: aspeed-ctr-tdes encryption test failed (wrong result) on test vector 0, cfg="in-place (one sglist)"
> [    5.035966] alg: self-tests for ctr(des3_ede) using aspeed-ctr-tdes failed (rc=-22)
> [    5.036139] ------------[ cut here ]------------
> [    5.037188] alg: self-tests for ctr(des3_ede) using aspeed-ctr-tdes failed (rc=-22)
> [    5.037312] WARNING: CPU: 2 PID: 109 at /crypto/testmgr.c:5936 alg_test+0x42c/0x548
> [    5.038049] Modules linked in:
> [    5.038302] CPU: 2 PID: 109 Comm: cryptomgr_test Tainted: G        W          6.6.52-v00.06.04-gf52a0cf7c475 #1
> [    5.038787] Hardware name: AST2700-EVB (DT)
> [    5.038988] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    5.039315] pc : alg_test+0x42c/0x548
> [    5.039505] lr : alg_test+0x42c/0x548
> [    5.039697] sp : ffffffc0825e3d50
> [    5.039862] x29: ffffffc0825e3df0 x28: 0000000000000004 x27: 0000000000000000
> [    5.040226] x26: ffffffc080bcada0 x25: ffffffc081dac9d0 x24: 0000000000000004
> [    5.040700] x23: 0000000000001285 x22: ffffff8003ded280 x21: ffffff8003ded200
> [    5.041458] x20: 00000000ffffffff x19: 00000000ffffffea x18: ffffffffffffffff
> [    5.041915] x17: 282064656c696166 x16: 20736564742d7274 x15: 00000000fffffffe
> [    5.042287] x14: 0000000000000000 x13: ffffffc081ba555c x12: 65742d666c657320
> [    5.042684] x11: 00000000fffeffff x10: ffffffc0818ff048 x9 : ffffffc0800a36e4
> [    5.043077] x8 : 000000000017ffe8 x7 : c0000000fffeffff x6 : 000000000057ffa8
> [    5.043461] x5 : 000000000000ffff x4 : 0000000000000000 x3 : 0000000000000000
> [    5.043751] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff800415e740
> [    5.045544] Call trace:
> [    5.045693]  alg_test+0x42c/0x548
> [    5.045878]  cryptomgr_test+0x28/0x48
> [    5.046052]  kthread+0x114/0x120
> [    5.046226]  ret_from_fork+0x10/0x20
> [    5.046413] ---[ end trace 0000000000000000 ]---
> [    5.071510] alg: skcipher: aspeed-ctr-des encryption test failed (wrong result) on test vector 0, cfg="in-place (one sglist)"
> [    5.072145] alg: self-tests for ctr(des) using aspeed-ctr-des failed (rc=-22)
> ```

This is a bit confusing for people running the tests, since it
might be considered as a regression in the models. I understand
it is interesting for real HW and so, it would good to complete
the implementation of the QEMU models too or, may be, we could
deactivate the tests from the kernel command line ? if possible.

Thanks,

C.



