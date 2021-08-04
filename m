Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp3230748lff;
        Wed, 4 Aug 2021 00:43:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzveLlzIF1qiZzsQSFy2Hm9hIekAvmbE62haLEedaOqB+ptFfBkaFBzbdJIdnaFI8G5cOel
X-Received: by 2002:a0c:ca12:: with SMTP id c18mr6624399qvk.14.1628063022967;
        Wed, 04 Aug 2021 00:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628063022; cv=none;
        d=google.com; s=arc-20160816;
        b=DDE3KMcb1eO6O8mhDO7Kx3dQ58WflaELcdm/r0BtGslwrIVptiLeCEFg3OBEkg7SvH
         nvggGll9kzJNoVtvWG0UuYmvqYx3iJSo4Hik/vXhYYNQAMFqGORvB4eWpyP1GwVX/Zij
         GtlGoxXxKKFEHcgx0KkpL8T8VIgq8/k5dLi9I/c7B8tuxocV/gi4ZMejD40TcHXdLaLY
         9DKB+YQVbGlH4G7cGRQeREml4DnXG+e9PLCPBLfhcJy8VJDVd/n+cExvFgbf1L4D5Ejv
         xcSEMM8pbTdoclyhRmfl8KlsT1pG99dk5ZweGyxhoZ3l/+cCZZRgtunXlTiiLU9lS0nz
         okFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IJmGpYCLbHs99vANQS31/pddqszrYwWhZR8T6RdgXlc=;
        b=s6kevQ6j+9UY8CfnxhcYzm1QncTa2S2mhuXD3UxW+AKY/JD68nUrjyNu4/5qcy04ik
         +H0ZpuPLSsbALakCtWkL9Ysy/XFY7Meii3M/PGq/OiOD3SmOxyAOuSusB/oMftWkhRZe
         7e/tCLoaSP2PtyWHgzQNciI0IrycI4LELpzya1TU+qh9Gba9PmhBeneFfj7fjf1sKwVV
         TP40lknKGMkdoe7bwL7IvoAPFwHHirRstluQcloTNF4w30fAc0hT4QnT2RcR7B8Gyb35
         IJU50WvmhrS03TXP608HJrpW1JiU22VLFSAVgeCesfe+34y9/yodiyOGqqnxwbRzHzaR
         wnDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bS0YPknh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s21si1087233qtc.194.2021.08.04.00.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Aug 2021 00:43:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bS0YPknh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mBBZ0-0004xy-8P
	for alex.bennee@linaro.org; Wed, 04 Aug 2021 03:43:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBBYr-0004xh-97
 for qemu-arm@nongnu.org; Wed, 04 Aug 2021 03:43:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBBYn-0002oP-Sj
 for qemu-arm@nongnu.org; Wed, 04 Aug 2021 03:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628063007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJmGpYCLbHs99vANQS31/pddqszrYwWhZR8T6RdgXlc=;
 b=bS0YPknhrg0vRaR9h0sHpFGF0wYIoBHiZFp+2N/TPesC8jy+VD24oIdC72xAaSVvqxCF2v
 087ojZZWee/gkiC/82BPuye9/Rttdk+kM1d5p6hfJdXrbuIbBfvlXoc9QuzK6as5a1GhUx
 Qx2+sPEjmV+ORle7GOPxhGr5SOcweFQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-qwLLSWR5OgyiA6NTKVqqtQ-1; Wed, 04 Aug 2021 03:43:25 -0400
X-MC-Unique: qwLLSWR5OgyiA6NTKVqqtQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o26-20020a05600c511ab0290252d0248251so468281wms.1
 for <qemu-arm@nongnu.org>; Wed, 04 Aug 2021 00:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IJmGpYCLbHs99vANQS31/pddqszrYwWhZR8T6RdgXlc=;
 b=poOSyCPw1zqvbjejnqIp1MYCHAFaKVo7+a83bQ6kt17QFTUSOYGSh3xnNy7RyVshFT
 AK550LUkUzblZjhOkdwsA+sfjvJea2skVUbxUwx8RCmL8y04sI80IIsK/3aHQgjTPzbI
 2sDLptVRCV4ML7r+ZSR8sEmwjmpY50YXUU595hJPGbXKj6PBBn4KERxCg8LSfzniY1Hv
 dNN+JasrtZ5PH1qqEliqKRhUr8DZPbs4kObz6gHr+/ES8kY6wgZYcPPHyXCL3PSWbeET
 hYwJd4qvKBGqPRJYaNcCfHJp5ODR8HwfaSokWkaSjzZmJTwlnjLPYeeUZKSOcKYAQZ2W
 /+rA==
X-Gm-Message-State: AOAM530cVZi+zn711s3kh9OiCBG2Xjeu1UAlIDpp5Ytr1H/7lSa4yc+4
 MB4a2wcZDNHsFjh3wPPOWByW4n7cYu3EqLkCIZsxJCSG3puZ0qiDrYSJ4OmQMN8GT8IC3AQCI6T
 olxeq8zFeKbJ/
X-Received: by 2002:adf:ee08:: with SMTP id y8mr26818914wrn.299.1628063003933; 
 Wed, 04 Aug 2021 00:43:23 -0700 (PDT)
X-Received: by 2002:adf:ee08:: with SMTP id y8mr26818885wrn.299.1628063003616; 
 Wed, 04 Aug 2021 00:43:23 -0700 (PDT)
Received: from thuth.remote.csb (p5791d9c3.dip0.t-ipconnect.de.
 [87.145.217.195])
 by smtp.gmail.com with ESMTPSA id c204sm4935426wme.15.2021.08.04.00.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 00:43:23 -0700 (PDT)
Subject: Re: [PATCH v2] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
To: Qiang Liu <cyruscyliu@gmail.com>
References: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <22f355e1-1c2c-cf24-ad41-45c937221bea@redhat.com>
Date: Wed, 4 Aug 2021 09:43:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ei3Ywxme5rzk

On 04/08/2021 08.51, Qiang Liu wrote:
> xlnx_dp_read allows an out-of-bounds read at its default branch because
> of an improper index.
> 
> According to
> https://www.xilinx.com/html_docs/registers/ug1087/ug1087-zynq-ultrascale-registers.html
> (DP Module), registers 0x3A4/0x3A4/0x3AC are allowed.
> 
> DP_INT_MASK     0x000003A4      32      mixed   0xFFFFF03F      Interrupt Mask Register for intrN.
> DP_INT_EN       0x000003A8      32      mixed   0x00000000      Interrupt Enable Register.
> DP_INT_DS       0x000003AC      32      mixed   0x00000000      Interrupt Disable Register.
> 
> In xlnx_dp_write, when the offset is 0x3A8 and 0x3AC, the virtual device
> will write s->core_registers[0x3A4
>>> 2]. That is to say, the maxize of s->core_registers could be ((0x3A4
>>> 2) + 1). However, the current size of s->core_registers is (0x3AF >>
>>> 2), that is ((0x3A4 >> 2) + 2), which is out of the range.
> In xlxn_dp_read, the access to offset 0x3A8 or 0x3AC will be directed to
> the offset 0x3A8 (incorrect functionality) or 0x3AC (out-of-bounds read)
> rather than 0x3A4.
> 
> This patch enforces the read access to offset 0x3A8 and 0x3AC to 0x3A4,
> but does not adjust the size of s->core_registers to avoid breaking
> migration.
> 
> Fixes: 58ac482a66de ("introduce xlnx-dp")
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> ---
> v2:
>    - not change DP_CORE_REG_ARRAY_SIZE
>    - add a qtest reproducer
>    - update the code style
> 
> I have a question about the QTest reproducer. Before patching xlnx-dp,
> (0x3ac >> 2) will exceed the right bound of s->core_registers.  However,
> this is allowed by the assertion. There is no warning and this
> reproducer will pass. Is the reprodocer OK?
> 
>   hw/display/xlnx_dp.c            |  6 +++++-
>   tests/qtest/fuzz-xlnx-dp-test.c | 33 +++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build         |  1 +
>   3 files changed, 39 insertions(+), 1 deletion(-)
>   create mode 100644 tests/qtest/fuzz-xlnx-dp-test.c
> 
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 7bcbb13..747df6e 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -714,7 +714,11 @@ static uint64_t xlnx_dp_read(void *opaque, hwaddr offset, unsigned size)
>           break;
>       default:
>           assert(offset <= (0x3AC >> 2));
> -        ret = s->core_registers[offset];
> +        if (offset == (0x3A8 >> 2) || offset == (0x3AC >> 2)) {
> +            ret = s->core_registers[DP_INT_MASK];
> +        } else {
> +            ret = s->core_registers[offset];
> +        }
>           break;
>       }
>   
> diff --git a/tests/qtest/fuzz-xlnx-dp-test.c b/tests/qtest/fuzz-xlnx-dp-test.c
> new file mode 100644
> index 0000000..69eb6c0
> --- /dev/null
> +++ b/tests/qtest/fuzz-xlnx-dp-test.c

Would it make sense to call the file xlnx-zcu102.c instead, in case we want 
to add other tests related to this machine later?

> @@ -0,0 +1,33 @@
> +/*
> + * QTest fuzzer-generated testcase for xlnx-dp display device
> + *
> + * Copyright (c) 2021 Qiang Liu <cyruscyliu@gmail.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqos/libqtest.h"
> +
> +/*
> + * This used to trigger the out-of-bounds read in xlnx_dp_read
> + */
> +static void test_fuzz_xlnx_dp_0x3ac(void)
> +{
> +    QTestState *s = qtest_init("-M xlnx-zcu102 -display none ");

You don't need "-display none", it's added by default in the qtest framework 
(see tests/qtest/libqtest.c).

> +    qtest_readl(s, 0xfd4a03ac);
> +    qtest_quit(s);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    const char *arch = qtest_get_arch();
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +   if (strcmp(arch, "aarch64") == 0) {

You likely don't need the architecture check, since it's only added for 
aarch64 in the meson.build file anyway.

> +        qtest_add_func("fuzz/test_fuzz_xlnx_dp/3ac", test_fuzz_xlnx_dp_0x3ac);
> +   }
> +
> +   return g_test_run();
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 83ad237..6fd6b0e 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -185,6 +185,7 @@ qtests_aarch64 = \
>      'numa-test',
>      'boot-serial-test',
>      'xlnx-can-test',
> +   'fuzz-xlnx-dp-test',
>      'migration-test']
>   
>   qtests_s390x = \

With at least the "-display none" removed:
Acked-by: Thomas Huth <thuth@redhat.com>

