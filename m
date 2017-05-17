Received: by 10.25.0.6 with SMTP id 6csp237500lfa;
        Wed, 17 May 2017 07:06:54 -0700 (PDT)
X-Received: by 10.55.178.5 with SMTP id b5mr3101320qkf.258.1495030014701;
        Wed, 17 May 2017 07:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495030014; cv=none;
        d=google.com; s=arc-20160816;
        b=piTQjDPT2kMvp6Ewq/CTlMDZcmUjiLnC0yzC/PiRSDHAwRzsrJIHsTOsEL50GLEO6J
         2HLl3FT3EA5V/ZAgAI4xSkFDNZbGLmp/7gi1vq+Khg3VStEDrhDYlWr0pEPQ2MqyxpF4
         y/PKsn1+5pTwatPhANo+0uRopX0LXXXQz07fTds8not2ZQkwwAwmgQ1dHpdRgDOzOQXx
         B7GN3gVTR+dl7WaBNB+KOgBvggovVaVBtHZNC3Xx8o8DD8Dbxe2t82ii2caPq5clDp4W
         BGmW9fIRNuZGFUQwEXXCtzYPQcK5RTHi5XsgBujqfKbYJX9KwWUlgGFFgyg3Oiwpvxwn
         28pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:mime-version:user-agent:from:date
         :message-id:arc-authentication-results;
        bh=/TERmfl/KRyoIrPQcBVYwi6UCfzW6l1JlPLGU2amByE=;
        b=gg22wU3EPr5i+Nq3siR2umxveKXem1O8j7Hran1JA1SLoqYO6jm244Z9Poun5Aesxp
         P8W1C6h4skSMSIhmwJymPUsgD/RblOjiQB1mx7xOIFrjBwq/0FzRnCwTAc7A8aIWMtvP
         BadmeLGXxBBn9JE8nLdNxfQHpMtreFwPoxx8L+umlnRBT4WslLwi/O2bNtb9oJWxWJC9
         QsERpgDSI6H21HdXhAbfR3RxuI//UeSS8WEvslSl9uxVSJWm+765dN0Ce29ICP4j3re4
         CKmiYsCpPWe8rmFKv1Xwk3JoeLUPH2tpdzF7rsz0Q5pWs4qpoRhJHkZHyXjDtmIIP5Pv
         XwTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b16si2209033qkj.311.2017.05.17.07.06.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 May 2017 07:06:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAzbK-000627-4f
	for alex.bennee@linaro.org; Wed, 17 May 2017 10:06:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <smolov@ispras.ru>) id 1dAzWT-000451-Ng
	for qemu-arm@nongnu.org; Wed, 17 May 2017 10:01:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <smolov@ispras.ru>) id 1dAzWO-0002ZQ-PR
	for qemu-arm@nongnu.org; Wed, 17 May 2017 10:01:53 -0400
Received: from bran.ispras.ru ([83.149.199.196]:46564 helo=smtp.ispras.ru)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <smolov@ispras.ru>) id 1dAzWO-0002X1-H7
	for qemu-arm@nongnu.org; Wed, 17 May 2017 10:01:48 -0400
Received: from [10.10.2.131] (castle.intra.ispras.ru [10.10.2.131])
	by smtp.ispras.ru (Postfix) with ESMTP id 6845960E77
	for <qemu-arm@nongnu.org>; Wed, 17 May 2017 17:01:45 +0300 (MSK)
Message-ID: <591C57C9.6070202@ispras.ru>
Date: Wed, 17 May 2017 17:01:45 +0300
From: Sergey Smolov <smolov@ispras.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 83.149.199.196
X-Mailman-Approved-At: Wed, 17 May 2017 10:06:44 -0400
Subject: [Qemu-arm] [aarch64] how to get the value is stored by MSR insn
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SJAaR1oBOAkb

Hello, List!

I'm running an Aarch64 assembler program on QEMU. The program starts 
from the following instructions:

movz x0, #0x50, LSL #0
msr vbar_el1, x0

My task is to print the value is stored into the vbar_el1 register to 
the console (it should be equal to 0x50, I think).

Here is what I have in target/arm/translate-a64.c that is related to MSR 
instruction simulation:

[code]
/* C5.6.129 MRS - move from system register
  * C5.6.131 MSR (register) - move to system register
  * C5.6.204 SYS
  * C5.6.205 SYSL
  * These are all essentially the same insn in 'read' and 'write'
  * versions, with varying op0 fields.
  */
static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
                        unsigned int op0, unsigned int op1, unsigned int 
op2,
                        unsigned int crn, unsigned int crm, unsigned int rt)
{
....
if (isread) {
...
} else {
if (ri->type & ARM_CP_CONST) {
             /* If not forbidden by access permissions, treat as WI */
             return;
         } else if (ri->writefn) {
             qemu_log("is-writefn\n");
             TCGv_ptr tmpptr;
             tmpptr = tcg_const_ptr(ri);
             gen_helper_set_cp_reg64(cpu_env, tmpptr, tcg_rt);
             tcg_temp_free_ptr(tmpptr);
         } else {
             tcg_gen_st_i64(tcg_rt, cpu_env, ri->fieldoffset);
         }
}
[code]

In my case the branch "else if (ri->writefn)" is executed. I've tried to 
take the value that is stored to vbar_el1 from tcg_rt variable with the 
help of GET_TCGV_I64 macro, but it returns the value (0x19) that is 
different from the right one (0x50).

In what direction should I dig?

-- 
Sincerely yours,
Sergey Smolov

