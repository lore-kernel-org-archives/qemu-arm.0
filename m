Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp808819wrg;
        Thu, 16 May 2019 08:56:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyQvh9+yirSoqDFsW1obcLh9j64dXIa0V4Fv6st5fe/lHoMKlnrWK+Yvf88RVisWKtS6GM0
X-Received: by 2002:a17:902:8f98:: with SMTP id z24mr39461715plo.101.1558022162343;
        Thu, 16 May 2019 08:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558022162; cv=none;
        d=google.com; s=arc-20160816;
        b=wD1zoG8BhAf4NUbISN+BjgrH/Tm8ZbK3lUPmyGvbryTGXzJVQHJ424fK140Iqv69xA
         Tt++0F+H3TKdkmF5Asf3mig6X+A6S3ES4Niu4TvnX+1tb6n1vDsHB9O6r8+vIj3TEL2y
         LIMOsd6xQSG+kE58jI9//PF0u30OMgREl0DHN9v1yUePrCaFIltwT59+Qbvscv81FAHN
         oS0nJ9qHg+gldWmjpTGOGg1Dunmq8KvVAbSkpZmpydS9wKGdb14+vlCD1+LSvrnb42Du
         2oo/l+tOtdUxV9BJQ7XjrMl+WUpnIfTDM2U7Ht08TMi542GzOAxo5VO1m0T5r0prv4C1
         k41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:ironport-sdr:ironport-sdr:dkim-signature;
        bh=LPc+MnIri1A60FEBo7JnUhSgS1IABuaEjVwCS3LoDxE=;
        b=DM4C1SuOsW3Jxn0GI+7BUu0VfWuR6PZbkB8qXVQgogTboG5WtMO2jyWgYgM7FY2oNl
         WZctrFINyBQlCemr3FiYp5zOg81YOFN/XIEmL1D1z/Gm2Ajskr5g12jAJJRfQ7sC7Gai
         /2dLOBUIglL23vMPtU2WIAc5jFPqDNd63coBPXaUuTVk6sNo9NYLMf7JH69C/dTcU+hN
         1FDfFoqaKqrMPAVPQCuuSv4bE6w8Tw4Pe7RuW/FZcbAxhz4v0iAoIzwRjYomb93VgiG5
         uDar2HO3Ego7rrdtTIv41nojnGW2VWdb+Sxk5v6ay0DNqL44S/t907fv9qP7zfWXY/R1
         eEDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=JkZZH6yJ;
       spf=pass (google.com: domain of prvs=032022a23=alistair.francis@wdc.com designates 68.232.141.245 as permitted sender) smtp.mailfrom="prvs=032022a23=alistair.francis@wdc.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=wdc.com
Return-Path: <prvs=032022a23=alistair.francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com. [68.232.141.245])
        by mx.google.com with ESMTPS id j20si5287221pgl.332.2019.05.16.08.56.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 08:56:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of prvs=032022a23=alistair.francis@wdc.com designates 68.232.141.245 as permitted sender) client-ip=68.232.141.245;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=JkZZH6yJ;
       spf=pass (google.com: domain of prvs=032022a23=alistair.francis@wdc.com designates 68.232.141.245 as permitted sender) smtp.mailfrom="prvs=032022a23=alistair.francis@wdc.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1558022162; x=1589558162;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pZrU0rLEl7AtHjWF7GI8X1ehkUlz2HyiMO84c3e1OXI=;
  b=JkZZH6yJQp3A2kJwpwyLzvdeWKUEYhLIUPUmqudYYLZF/j2Bbs/CoGhu
   RyGHyGAfHzzH9bz3KoW0N/oUqRVe/5oj1UXJb3tfp3YOp9WPwZSc1Z8P0
   wx3v3ST60nIze+1oB+6AFC4Sst5fI5M8Zgr6QwI9pcSa0JbTbPl4WW+H7
   GgpAZthsS6F4KXKhhz1YHixaesiVSD19ybY/giT73ILotyCJIpUKUjQZU
   04Tp4IjdU/enGOtHipos/Zame6mLtV54ptUYur8yuENG74UytHRQU71Gn
   nkKQ5u2chL941+zp4G/IjHZ2LfxOt4Lq0mr8Sc1dgKpmWb5tGOtUcI7zh
   g==;
X-IronPort-AV: E=Sophos;i="5.60,477,1549900800"; 
   d="scan'208";a="214552447"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 16 May 2019 23:56:01 +0800
IronPort-SDR: u5snrhihlAJUZkyU1cDVfEQ3ueKJtNqoqWGSqo1qNO0hkjK5vwx0aYVoBMYZTRO/WGx51DGnJ/
 lR1MY7Fnctc4hnMvNMyi/l49DRkS2ApV2t0u6l3KH+JC/Em3tiBmf0AnGIHM1J/ahFNqGzjAMu
 hTEC/W0dmDRMJvSJ6zc42eHCAMjXlmjk/A53HMHlO4fJ2l0765khop9dZsyXwejC7WjPGP2c2w
 0LdLAIwOzhbdp5yFEMPl4bIOZHuI+3ugQ6Xb7mTpiG/lTMBdpb7zQ5nYJXil846leo7xN9lDLP
 xY/qjTG/QPnt4AoT+jQFfV9K
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP; 16 May 2019 08:33:54 -0700
IronPort-SDR: UOieCsjXzhXGKQUiSYIaqfcxYjdEnZab/0yyE/PCdqB7/fXnp9BbOx4fB7dcGnNdjxEkCs73+a
 /bWzqcYqX6cfZQ5rUyHQujhXRLlqhyx51kQD3MyduZ1hEwXrW0zq9ENXV8eQvHQflmQymYgzdq
 YMaRLbK3Jcol/je8OQ/vbUZAr4vD+eB0S3DRfeUjtIP775NlMw/xBYJvGZgv7GfSaBycINj2FQ
 ohhjApOKNT9H46UEvzcr973/G5zz2C9fIevmUA63/VuxG2nlUJhntXj1DZacXtp4vSoHMPNopr
 Rp4=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO risc6-mainframe.int.fusionio.com) ([10.196.157.140])
  by uls-op-cesaip02.wdc.com with ESMTP; 16 May 2019 08:56:01 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair.francis@wdc.com,
	alistair23@gmail.com,
	qemu-arm@nongnu.org,
	philmd@redhat.com,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH v3 1/1] target/arm: Fix vector operation segfault
Date: Thu, 16 May 2019 08:54:10 -0700
Message-Id: <ad91b397f360b2fc7f4087e476f7df5b04d42ddb.1558021877.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 91QWUP1LLAIy

Commit 89e68b575 "target/arm: Use vector operations for saturation"
causes this abort() when booting QEMU ARM with a Cortex-A15:

0  0x00007ffff4c2382f in raise () at /usr/lib/libc.so.6
1  0x00007ffff4c0e672 in abort () at /usr/lib/libc.so.6
2  0x00005555559c1839 in disas_neon_data_insn (insn=<optimized out>, s=<optimized out>) at ./target/arm/translate.c:6673
3  0x00005555559c1839 in disas_neon_data_insn (s=<optimized out>, insn=<optimized out>) at ./target/arm/translate.c:6386
4  0x00005555559cd8a4 in disas_arm_insn (insn=4081107068, s=0x7fffe59a9510) at ./target/arm/translate.c:9289
5  0x00005555559cd8a4 in arm_tr_translate_insn (dcbase=0x7fffe59a9510, cpu=<optimized out>) at ./target/arm/translate.c:13612
6  0x00005555558d1d39 in translator_loop (ops=0x5555561cc580 <arm_translator_ops>, db=0x7fffe59a9510, cpu=0x55555686a2f0, tb=<optimized out>, max_insns=<optimized out>) at ./accel/tcg/translator.c:96
7  0x00005555559d10d4 in gen_intermediate_code (cpu=cpu@entry=0x55555686a2f0, tb=tb@entry=0x7fffd7840080 <code_gen_buffer+126091347>, max_insns=max_insns@entry=512) at ./target/arm/translate.c:13901
8  0x00005555558d06b9 in tb_gen_code (cpu=cpu@entry=0x55555686a2f0, pc=3067096216, cs_base=0, flags=192, cflags=-16252928, cflags@entry=524288) at ./accel/tcg/translate-all.c:1736
9  0x00005555558ce467 in tb_find (cf_mask=524288, tb_exit=1, last_tb=0x7fffd783e640 <code_gen_buffer+126084627>, cpu=0x1) at ./accel/tcg/cpu-exec.c:407
10 0x00005555558ce467 in cpu_exec (cpu=cpu@entry=0x55555686a2f0) at ./accel/tcg/cpu-exec.c:728
11 0x000055555588b0cf in tcg_cpu_exec (cpu=0x55555686a2f0) at ./cpus.c:1431
12 0x000055555588d223 in qemu_tcg_cpu_thread_fn (arg=0x55555686a2f0) at ./cpus.c:1735
13 0x000055555588d223 in qemu_tcg_cpu_thread_fn (arg=arg@entry=0x55555686a2f0) at ./cpus.c:1709
14 0x0000555555d2629a in qemu_thread_start (args=<optimized out>) at ./util/qemu-thread-posix.c:502
15 0x00007ffff4db8a92 in start_thread () at /usr/lib/libpthread.

This patch ensures that we don't hit the abort() in the second switch
case in disas_neon_data_insn() as we will return from the first case.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
---
v3:
 - Resend with hopefully 8bit encoding instead of base64

 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index dd053c80d6..298c262825 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6598,13 +6598,13 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
                            rn_ofs, rm_ofs, vec_size, vec_size,
                            (u ? uqadd_op : sqadd_op) + size);
-            break;
+            return 0;
 
         case NEON_3R_VQSUB:
             tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
                            rn_ofs, rm_ofs, vec_size, vec_size,
                            (u ? uqsub_op : sqsub_op) + size);
-            break;
+            return 0;
 
         case NEON_3R_VMUL: /* VMUL */
             if (u) {
-- 
2.21.0
