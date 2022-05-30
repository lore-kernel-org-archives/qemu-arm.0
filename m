Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp2633489lfh;
        Mon, 30 May 2022 02:33:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1hKqaDTnP4sQ5KzEfM1EZSzY/1RzYIiTvxJC2Xo8GKvmLp4fzngXkDLqAdu/1AW9buEry
X-Received: by 2002:a05:622a:448:b0:2f3:d76d:7b98 with SMTP id o8-20020a05622a044800b002f3d76d7b98mr42520790qtx.679.1653903238346;
        Mon, 30 May 2022 02:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653903238; cv=none;
        d=google.com; s=arc-20160816;
        b=okgWx1iy7HPASI3kHHtc5Jy7a6QefVHEiNyfDONnosv2W89aHEhoafo/+VKfH0SptG
         sVktKF0SdNiomD7LhOn9JeFSFpQ3WsvZ5jplSMZU3yzU5jwrfXGqEORJAAZr/PCFOVbm
         //5Fz+nkN3T/nvFMEMYI5xhKXNOsR2R0ZLuhSGFVM7XaAAiJiGE8G+G9n7fxYrE4PtcW
         ZUYYJyw7ksU6HHsJdzQCKv7tU6b3TrZpGdL1p9cpWlCGHRTVP+mObcEsTdmZqsgkM5hh
         4U3O2WeFhv0y5iZtFI6DMmd/3ujjvSQcYw/BBhN8+PyzNpmu07ow0aEXoFZcRT4l7cbd
         dYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:cms-type
         :content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:dkim-signature:dkim-filter;
        bh=2/IGmQNakwlvZLpc05nS0DUkRPqmT3kUTbUuxT0Cxuc=;
        b=KYHJYV5CiujKkcFxLwhQuFBH/QffgnxisHNqU4tqBPUuQAro/D3MqsyuH5t0qhyQQb
         +f1XTz0DGZ1Q1JPjz6u8DOm0EMPONcm0V2+bawPqjmOlk+L+ib+ORZkbuSJQH6v7Reif
         jWiWKV/OUUhc5TrBEMBdAng2dmYcc7Jd6VPGKXMs9wXkQQOi1GQNFG+QA4GLjATXHhD3
         shXefVndgQRmp0S8rNnFYJ3GwLqOIPK/tANH1+dl7WlRXPJ/Sr144cYrTz+Mg/ZnZ/++
         sE36TfLiugOCeHvduyeFH4KhO2mhVZ+eITAyIDjgP0yaZoYoWIeon4B/XSfW4r/kPGNb
         Dgcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@samsung.com header.s=mail20170921 header.b=VptnKWv0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020a05622a030400b002f1ff9fff56si7239536qtw.650.2022.05.30.02.33.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 May 2022 02:33:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@samsung.com header.s=mail20170921 header.b=VptnKWv0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samsung.com
Received: from localhost ([::1]:33764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nvbmf-0007GD-SL
	for alex.bennee@linaro.org; Mon, 30 May 2022 05:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.kotrasinsk@samsung.com>)
 id 1nvbmS-0007G2-Qa
 for qemu-arm@nongnu.org; Mon, 30 May 2022 05:33:44 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.kotrasinsk@samsung.com>)
 id 1nvbmO-0003mJ-UP
 for qemu-arm@nongnu.org; Mon, 30 May 2022 05:33:44 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220530093334euoutp026e3ff58747596eed932ba87defb81041~z2DXjWAN30686606866euoutp02o
 for <qemu-arm@nongnu.org>; Mon, 30 May 2022 09:33:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220530093334euoutp026e3ff58747596eed932ba87defb81041~z2DXjWAN30686606866euoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1653903214;
 bh=2/IGmQNakwlvZLpc05nS0DUkRPqmT3kUTbUuxT0Cxuc=;
 h=Date:To:From:Subject:References:From;
 b=VptnKWv0qztEllFAhm3Taq8yuS5PRbC05q9iViXdcG5Ror4BDjiAEjkzNpPaQj9op
 R0Vp2Fu4wmTWmCKQ5ZbG/ue2QJ2KJ3e0HyqFG8075jf8laqtIiikWgJWw9xW0aQ3iH
 P71I7dZ7KwXNxHppxrOJeORfSloNw1XAql27njjM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220530093333eucas1p2fd3a7cac7e85fef5a9366cac91d7f419~z2DXZDyGa2424324243eucas1p2z
 for <qemu-arm@nongnu.org>; Mon, 30 May 2022 09:33:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C2.37.09664.D6F84926; Mon, 30
 May 2022 10:33:33 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220530093333eucas1p2c05b46a5f9c66704919743236753858f~z2DW4lZ7-0316403164eucas1p2X
 for <qemu-arm@nongnu.org>; Mon, 30 May 2022 09:33:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220530093333eusmtrp2370dac5eed2ab096741defe79af2ad40~z2DW4BGLk0280702807eusmtrp2f
 for <qemu-arm@nongnu.org>; Mon, 30 May 2022 09:33:33 +0000 (GMT)
X-AuditID: cbfec7f2-d97ff700000025c0-10-62948f6db654
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 69.48.09038.D6F84926; Mon, 30
 May 2022 10:33:33 +0100 (BST)
Received: from [106.210.134.115] (unknown [106.210.134.115]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220530093333eusmtip1c675d12aa134e12788b05053ce572882~z2DWtCc_V1036410364eusmtip1i
 for <qemu-arm@nongnu.org>; Mon, 30 May 2022 09:33:33 +0000 (GMT)
Message-ID: <e3573c25-1ba6-cb57-f813-99c538a2d254@samsung.com>
Date: Mon, 30 May 2022 11:33:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Content-Language: en-GB
To: qemu-arm@nongnu.org
From: =?UTF-8?Q?Igor_Kotrasi=c5=84ski?= <i.kotrasinsk@samsung.com>
Subject: Help: NVIC, level-triggered interrupts and interrupt pending
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsWy7djP87q5/VOSDL5uNLNY0L2QzYHR48m1
 zUwBjFFcNimpOZllqUX6dglcGW/PfGAquCpR8XHOZKYGxkNCXYycHBICJhI7rzcwdjFycQgJ
 rGCUuPLvAzOE08ck8f3oenYIp5dJYs2bXiaYlkNHNrNAJJYzSjw/OAOqpZtJYvGPBWBVvAJ2
 EjsXbwWzWQRUJY5MvsYMEReUODnzCQuILSqQJDF1ch8biM0sIC7R9GUlaxcjB4cIkL3hiiiI
 ySbgJDFplRRIhbCAq8S95kmsENXyEtvfzgFbKyHwll3i86pdLBDHuUj8v7CCHcIWlnh1fAuU
 LSPxf+d8qAeKJZac3QFVXyNxvnslVI21xK7j3Swge5kFNCXW79KHCDtK3Lt+FCwsIcAnceOt
 IMQJfBKTtk1nhgjzSnS0QQNUTWLarz3MMEuXNT6CWuQhsW31NbBFQgKxEuvv/GOdwKgwCylI
 ZiEFwywkT85CuGcBI8sqRvHU0uLc9NRiw7zUcr3ixNzi0rx0veT83E2MwORw+t/xTzsY5776
 qHeIkYmD8RCjBAezkghvQ/LEJCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8yZkbEoUE0hNLUrNT
 UwtSi2CyTBycUg1MvDd2BTnc9VDfFPXA4GQQ/8ITT+WLzjo9bFuZ17a0dWbfl+jYCG7re/Wy
 r5QON7+Za++11CFfJvuQJ9ORgwLOa1tu+X47ItfmLLm4yiTIL3pLZnIWx5fP0fbqXIKz3K/x
 bn3w6u66tQZszw7UM+4r3Lz7yNv0ksCpizhruopjZpc86JVYHdByv2GdxP9tiyYu5BH+/Mff
 4dYuE6+NIcfStYS6j084H6oqx8wfdpibIy/z5w+2L5OueUq3Oe2Ycln3zsW+Tt1Jf6V7M6uc
 xPZscbi88/pzn0mMPJZXH/2SUty58GadzM/HnLvsLTtYRE+v/jG5+KlT+wfXgp7PIfwlMq/v
 6LTfeb1+xubFP3VdlViKMxINtZiLihMBvajvyn0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJLMWRmVeSWpSXmKPExsVy+t/xu7q5/VOSDF48ErNY0L2QzYHR48m1
 zUwBjFF6NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6
 GW/PfGAquCpR8XHOZKYGxkNCXYycHBICJhKHjmxm6WLk4hASWMoosf7wL0aIhIzEj9Nr2CBs
 YYk/17rYIIo6mSQWLLzNDpLgFbCT2Ll4KxOIzSKgKnFk8jVmiLigxMmZT1hAbFGBJInj22eA
 1TMLiEs0fVnJ2sXIwSECZG+4Igpisgk4SUxaJQVSISzgKnGveRIrRLWZRNfWLkYIW15i+9s5
 zBMY+WchWTALydBZSFpmIWlZwMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzCMtx37uWUH
 48pXH/UOMTJxMB5ilOBgVhLhbUiemCTEm5JYWZValB9fVJqTWnyI0RToy4nMUqLJ+cBIyiuJ
 NzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYNr+I8zgROAd+VdmRky5
 13OTd9tc+p36fnvSbvP7vAeYzZ81CJ40CTspktnLs/PwPHl+jcsKjjvqPysZL2WPqW+Yc6F/
 8Qz2gp3z7W+ZNPBVFdmuPHdl4t9JDTf5pT/xNG7Smi36LmntodVm9o4+m9cpm1mLF7OuNJjg
 c27hy/N8wcEzb6jNLs1QtmT6d+aLSfCe4wuVFQvSE1PnhMo/OOp1r/Oo+Jyer1rT1nEFvuw5
 5s3v/KGGfY5ESKPV/b7zqrmb1q12jT0Rxf7W9Giw6vlDgtti1k5fnW3UsWBLSuO8zgSxfIYN
 spzpcWfyAm1i3i05U+XPJFB/bXe1pNK8h3K7dnne57rkbdawVpWPTYmlOCPRUIu5qDgRAC2/
 MB/sAgAA
X-CMS-MailID: 20220530093333eucas1p2c05b46a5f9c66704919743236753858f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220530093333eucas1p2c05b46a5f9c66704919743236753858f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220530093333eucas1p2c05b46a5f9c66704919743236753858f
References: <CGME20220530093333eucas1p2c05b46a5f9c66704919743236753858f@eucas1p2.samsung.com>
Received-SPF: pass client-ip=210.118.77.12;
 envelope-from=i.kotrasinsk@samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IBCntQ7Sj/G+

Hi,

I've been hacking on QEMU recently, adding support for a custom Cortex-M 
board. One of the devices that I'm emulating is using level-triggered 
interrupts, for which I assume qemu_irq_raise/lower is the right tool. 
However, I'm having trouble receiving interrupts for my device which I 
*think* are caused by interaction with setting/clearing 
interrupt-pending status.

The way I'm handling my interrupt currently is as follows:

1. The device raises an interrupt with qemu_irq_raise.
2. In interrupt handler, I set the clear-enable nvic register and queue 
a handler.
3. In handler, I read data from the device and set a register that 
lowers its interrupt with qemu_irq_lower.
4. Then I set the clear-pending nvic register.
5. Finally I set the set-enable nvic register.

The problem happens when the device re-raises the interrupt between 
steps 3 and 4. I would expect the interrupt to stay pending after 
clearing its pending status, and random ARM docs I found on the net seem 
to confirm that:

     A pending interrupt remains pending until one of the following:
     ...
     * Software writes to the corresponding interrupt clear-pending 
register bit. For a level-sensitive interrupt, if the interrupt signal 
is still asserted, the state of the interrupt does not change.

 
https://developer.arm.com/documentation/dui0497/a/cortex-m0-peripherals/nested-vectored-interrupt-controller/level-sensitive-and-pulse-interrupts

On QEMU however, pending status is cleared and I lose the interrupt. I 
tried to hack in the behaviour described in the docs quoted above, like so:

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 773e311754..4914b1217f 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2393,6 +2393,12 @@ static MemTxResult nvic_sysreg_write(void 
*opaque, hwaddr addr,
          for (i = 0, end = size * 8; i < end && startvec + i < 
s->num_irq; i++) {
              if (value & (1 << i) &&
                  (attrs.secure || s->itns[startvec + i])) {
+                /* If the interrupt signal is still asserted, the state 
of the
+                 * interrupt does not change.
+                 */
+                if (!setval && s->vectors[i + NVIC_FIRST_IRQ].level) {
+                    continue;
+                }
                  s->vectors[startvec + i].pending = setval;
              }
          }

This fixed the issue I was having. However, I'm not sure if it's the 
right solution. One, this affects all devices connected to nvic, so this 
might randomly break them. Two, there's a confusing comment in 
armv7m_nvic.c, in set_irq_level, that seems to imply that all external 
interrupts are edge-triggered:

     /* The pending status of an external interrupt is
      * latched on rising edge and exception handler return.
      *
      * Pulsing the IRQ will always run the handler
      * once, and the handler will re-run until the
      * level is low when the handler completes.
      */

I'd be very thankful for any help with this. I *think* I found a bug, 
but I'm not 100% sure.

Thanks,
Igor
