Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE73CCA471
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Oct 2025 06:34:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6kDw-0002tS-9l; Thu, 09 Oct 2025 02:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6kDt-0002sA-NW
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 02:33:57 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v6kDp-0003DJ-BO
 for qemu-arm@nongnu.org; Thu, 09 Oct 2025 02:33:57 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ee1381b835so533135f8f.1
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 23:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759991627; x=1760596427; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GYzC75wWAZej4UuEIDmUKOezyjzGUUOJzlifIRQQ6O0=;
 b=SHOfi0Emmg2E7i3jxkguBsnyC8JwVqIwCi/xVp8VD7Hg5mT5zhTI2bD+vMUbE4iB9+
 f/m5Ob6PxroooEaNY7lMR0SUONk0JeNnr8/+CE8XGv/Erd2suwTErc5m8GY1RpY1n3sB
 ExDcrAxXQLd8txzsOj2o/R+4ldzuDyCj+YIiTcysaRvTQVO50Wrob8HwhGNywzdoi0ZH
 tcbZpa5ryTItD8FQOmz1iDwS7V6VWjmoLlS8o91I7fegJk/RTEGZzTiS5ZDD0aRC7n1i
 7Jgd0UmcAgFZI7cHMFmQglSyuw90QUxxtZWyeVby6NlIP4B3JIJkKk97b5u8aGJ2gJDB
 FwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759991627; x=1760596427;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GYzC75wWAZej4UuEIDmUKOezyjzGUUOJzlifIRQQ6O0=;
 b=bqp+emlkJ1Xnuh0CqRaBqoVC+86NToC3tqRb2izh+Tbsp7aOhlFGNZcXVlJxeWF2p4
 nlioK9Tas+1hV7rbvzzO7b/WTRQ81pFiF96EJTiPT4wY2BaLMiynMZeZlgQHgo0dskny
 eJvMtD/AIQj/7f1ucpQw0QWeU8SR7nURUWtYITU+zXm0B+YPolXRZQyTWrUjJuwB0HTc
 egaRK6MlQsxF1DSx9HaAzrSaTQbGRUL8isSuajSrCLcYFxXbIHtyuCik5mjy8SeO+Axb
 kcWuZpe/hKE2pEezLvE4a5wg6sxiTMT2/tWw4VNPePuYjJXd62MVN7G39bS8gNHInmeH
 E/pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXEBTatcrmVCXJAhajDNDhKIcLVPvJ4wQyLrm6t3qNmUDBUdcokXbzWIGUtd9VKuGsz45ozJam8Q==@nongnu.org
X-Gm-Message-State: AOJu0Yw6eonS1LOdtig6AbIIWTcFqnYmiLa4oVPwZJD+zk9iZH/irwPW
 rYOAOhd3oKPxqG7TwnhNTEgUfFuOdnJ6/c74On1bgQz3bER3H42UBh3qnJm20eJEu7w=
X-Gm-Gg: ASbGnctEoxM8AFkgENSdh6zlkxOrdbreECAN6nGjF1Tf8pmw34XWfIQ0vfD4SHKcNd9
 78tieHyEk5tby7itrCoAf9kvGXadrBFDnW+rsIzs+SqMImIYAiGE7MQ83yih3fHLxXVdLsa6fjh
 Hw9u8kV/X5vvFmcfazBlUCfweT5yfWEXWxCahe1Ig3DsVFQ9GFH9CGIbtLAou1FWWRLY691Ub/V
 se0tEt0OSEdjXxmVP5cMw9u/9qju3D9T+w3b+4fUGzGbWIY4vyqqTOJbc2HpuIw6Ie7dUP2nzc8
 LJA6YNv5gUlfvRv8piU057wPU/M6I4TV0O9pbggoaK37J+UhB4GAzVjm9DdFQCi/YcIFOpadPh2
 XouFXD0uV5dXSFITmB6IRMKcydxLXJfwSFmxDsgRYYyblG07ooD6ihYtmI7i+yt2rnUe4YgqKRJ
 cNhf00YducmLpgnsZR4Q==
X-Google-Smtp-Source: AGHT+IGRMfMbS5ExzOnBQ/G6CiSdh8HoLtJx633PjWfgjJCF6PZk2X/grgTybN/DDUN7UTdjIRcIUg==
X-Received: by 2002:a05:6000:240d:b0:425:7c3c:82cf with SMTP id
 ffacd0b85a97d-4266e7cdc8fmr4338579f8f.11.1759991627504; 
 Wed, 08 Oct 2025 23:33:47 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e9724sm32855296f8f.28.2025.10.08.23.33.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 23:33:46 -0700 (PDT)
Message-ID: <bad14513-b99b-4cf8-b6d0-2d338e4ebc50@linaro.org>
Date: Thu, 9 Oct 2025 08:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Register API leaks fixes
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>
References: <20251002073418.109375-1-luc.michel@amd.com>
 <64f40ff8-3694-4c9a-80b6-0f58f01d7995@linaro.org>
In-Reply-To: <64f40ff8-3694-4c9a-80b6-0f58f01d7995@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/10/25 08:23, Philippe Mathieu-Daudé wrote:
> Hi Luc,
> 
> On 2/10/25 09:34, Luc Michel wrote:
> 
>> This series addresses the memory leaks caused by the register API. The
>> first patches fix the API itself while the last ones take care of the
>> CANFD model.
> 
> 
>> Luc Michel (7):
>>    hw/core/register: remove the REGISTER device type
>>    hw/core/register: add the REGISTER_ARRAY type
>>    hw/core/register: remove the calls to `register_finalize_block'
>>    hw/core/register: remove the `register_finalize_block' function
>>    hw/net/can/xlnx-versal-canfd: remove unused include directives
>>    hw/net/can/xlnx-versal-canfd: refactor the banked registers logic
>>    hw/net/can/xlnx-versal-canfd: remove register API usage for banked
>>      regs
> 
> I had few issues with your series:
> 
> ../../hw/net/can/xlnx-versal-canfd.c:1917:30: error: unused variable 
> 'canfd_regs_ops' [-Werror,-Wunused-const-variable]
>   1917 | static const MemoryRegionOps canfd_regs_ops = {
>        |                              ^~~~~~~~~~~~~~
> 
> ../../hw/net/can/xlnx-versal-canfd.c:1871:42: error: use of undeclared 
> identifier 'TYPE_REGISTER'
>   1871 |         object_initialize(r, sizeof(*r), TYPE_REGISTER);
>        |                                          ^
> 
> ../../hw/net/can/xlnx-versal-canfd.c:1700:48: error: incompatible 
> pointer types passing 'hwaddr *' (aka 'unsigned long long *') to 
> parameter of type 'size_t *' (aka 'unsigned long *') [-Werror,- 
> Wincompatible-pointer-types]
>   1700 |     if (!canfd_decode_addr(s, addr, &bank_idx, &reg_offset)) {
>        |                                                ^~~~~~~~~~~
> ../../hw/net/can/xlnx-versal-canfd.c:1651:52: note: passing argument to 
> parameter 'offset' here
>   1651 |                               size_t *idx, size_t *offset)
>        |                                                    ^
> ../../hw/net/can/xlnx-versal-canfd.c:1722:48: error: incompatible 
> pointer types passing 'hwaddr *' (aka 'unsigned long long *') to 
> parameter of type 'size_t *' (aka 'unsigned long *') [-Werror,- 
> Wincompatible-pointer-types]
>   1722 |     if (!canfd_decode_addr(s, addr, &bank_idx, &reg_offset)) {
>        |                                                ^~~~~~~~~~~
> ../../hw/net/can/xlnx-versal-canfd.c:1651:52: note: passing argument to 
> parameter 'offset' here
>   1651 |                               size_t *idx, size_t *offset)
>        |                                                    ^
> 
> I fixed them by re-ordering the xlnx-versal-canfd patches first,
> having canfd_decode_FOO() taking a 'hwaddr *offset' and using a
> temporary __attribute__ ((unused)) for canfd_regs_ops[].
> 
> I'm queuing this series as fixed, except if you disagree.

Bah, qtest/device-introspect-test is failing:

# Testing device 'xlnx-zynqmp-efuse'
Broken pipe
../../tests/qtest/libqtest.c:208: kill_qemu() detected QEMU death from 
signal 11 (Segmentation fault: 11)
Abort trap: 6

(lldb) bt
* thread #5, stop reason = EXC_BAD_ACCESS (code=1, address=0x50)
   * frame #0: 0x00000001007dcf18 
qemu-system-aarch64`object_finalize_child_property(obj=<unavailable>, 
name=<unavailable>, opaque=0x00000001561f0c90) at object.c:1814:23
     frame #1: 0x00000001007d9ebc 
qemu-system-aarch64`object_property_del_all(obj=0x0000000138008000) at 
object.c:667:21 [inlined]
     frame #2: 0x00000001007d9e1c 
qemu-system-aarch64`object_finalize(data=0x0000000138008000) at 
object.c:728:5 [inlined]
     frame #3: 0x00000001007d9e14 
qemu-system-aarch64`object_unref(objptr=0x0000000138008000) at 
object.c:1232:9
     frame #4: 0x00000001008af32c 
qemu-system-aarch64`qmp_device_list_properties(typename=<unavailable>, 
errp=0x000000017002ac98) at qom-qmp-cmds.c:237:5
     frame #5: 0x000000010092d7a4 
qemu-system-aarch64`qmp_marshal_device_list_properties(args=0x0000000145809400, 
ret=0x0000000104827a18, errp=0x0000000104827a20) at 
qapi-commands-qdev.c:65:14
     frame #6: 0x0000000100948784 
qemu-system-aarch64`do_qmp_dispatch_bh(opaque=0x00000001048279e8) at 
qmp-dispatch.c:128:5

I'm dropping this series, please have a look.

Stashed changes:

-- >8 --
diff --git a/hw/net/can/xlnx-versal-canfd.c b/hw/net/can/xlnx-versal-canfd.c
index 81615bc52a6..d559fc06804 100644
--- a/hw/net/can/xlnx-versal-canfd.c
+++ b/hw/net/can/xlnx-versal-canfd.c
@@ -1784,3 +1784,3 @@ static bool 
canfd_decode_reg_bank(XlnxVersalCANFDState *s, hwaddr addr,
                                    hwaddr first_reg, hwaddr last_reg,
-                                  size_t num_banks, size_t *idx, size_t 
*offset)
+                                  size_t num_banks, size_t *idx, hwaddr 
*offset)
  {
@@ -1809,3 +1809,3 @@ static bool 
canfd_decode_reg_bank(XlnxVersalCANFDState *s, hwaddr addr,
  static bool canfd_decode_addr(XlnxVersalCANFDState *s, hwaddr addr,
-                              size_t *idx, size_t *offset)
+                              size_t *idx, hwaddr *offset)
  {
@@ -1916,2 +1916,3 @@ static const MemoryRegionOps canfd_ops = {

+__attribute__ ((unused))
  static const MemoryRegionOps canfd_regs_ops = {
---

