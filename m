Received: by 10.223.183.22 with SMTP id l22csp80740wre;
        Thu, 17 Aug 2017 16:01:17 -0700 (PDT)
X-Received: by 10.98.43.213 with SMTP id r204mr6928135pfr.0.1503010877068;
        Thu, 17 Aug 2017 16:01:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503010877; cv=none;
        d=google.com; s=arc-20160816;
        b=Ufqda0TDJHHj97bSx6YtktQZi8wf0c7i00jx4fZ3lQ7xlrHVUfyRFYabobpjYjR1dq
         ncnJzMvMRncAa1sgOOMOiOyew6JeRrbtRJRyThQpePC/Z/+BewAbbWoHI1nvS2crF3Z1
         O5OKkVPpnzD0MYai6zWzf6uGORZ8/CpnM+Q7sxLpP4x2Grtvllw4/moyv0iVmDPF49eu
         29bv8VyqTPl2qJwcFyvIhkSsh5aZIaAyM1PfucjoreaKMwpoj2KJSdcuVeRtXkSCH8n4
         zRCL2BcMkTqyEPJ/24NbpKRpgsZzIZo+ZCl6d4LOBXfjbDCTIVEUQc/pkPKKFfQdi2Qp
         83Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature
         :arc-authentication-results;
        bh=DJYRuRbwce5SiWkd5QvRqkLl3XKR5Il/AuG5f8zsnfw=;
        b=RojWg0vH4hBR6uiW6cLanFIuIetwssJHh0oOfN56C/sM6m9LTTI0aSkz1oIuIYkre/
         zKKE4edezHBUc1WkWyFCuf8EaYOiBmStT56LPO+dNGlzf+cqoINM+L1SFLDAm3O864W3
         bS+le8f443xHNJ47i1K3E4Et3qaUzuXnhL32GB33U2Klbikgt73Q86mqHapKJU7wmSHh
         5JUEWc9J5K89BVvURqb7p9PEE9zv0rhCcS67QHy+w8Pk46c8tLDpE4AznY8NYn7rvi9J
         ZhEj52TY5Q6jnMpIjlgYgIPPjCfnDDAf3zgYmIOXeIKPvRUWrRVGa34r9Gm1cAwStTRx
         AeoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f8t814X/;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22b as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-pg0-x22b.google.com (mail-pg0-x22b.google.com. [2607:f8b0:400e:c05::22b])
        by mx.google.com with ESMTPS id b2si2692020pfl.588.2017.08.17.16.01.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 16:01:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22b as permitted sender) client-ip=2607:f8b0:400e:c05::22b;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f8t814X/;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22b as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-pg0-x22b.google.com with SMTP id i12so51985589pgr.3
        for <alex.bennee@linaro.org>; Thu, 17 Aug 2017 16:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=DJYRuRbwce5SiWkd5QvRqkLl3XKR5Il/AuG5f8zsnfw=;
        b=f8t814X/uGBzvocKjrIDMk32h1faVMNakUFQ1S3bW+0QGZcGB8kTF5g+zYTDk5M8uN
         4eTH2ywRB0UviQ/w7fpBKyEHFd+9ML8MWeM3hSX3qNaP7fkW25WHp/u0hCXcLLVYOrVY
         8L4cIBo+y2ZC6PgdTkCvpZuf8Css5iXn3ok+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DJYRuRbwce5SiWkd5QvRqkLl3XKR5Il/AuG5f8zsnfw=;
        b=M9dkqvl62YNJIsQoMjYtqpp26TJp+BPk3mpok0MXqjLEwAwlWUVXlf6xXfO22v1EkG
         +RbvPO6fZkpIhbB6/D+EyUQwOhY/NxuVFmefUKx3GHAsNSNvPjR1MS/y2OkIFizmLEm5
         oSA8l53inAeoGRL8/yjnkoOGCzKvjijmoeAi2JCI4oPbPYHku3etfk+hZq6kBbr8XJrk
         Ja5JenxWA/+TqbWguZfCLtoo5Q1njJ7ev9Tdj8CbwmdOx55N65M8tLwz5jdPMp5M5KeS
         x+icxkao22Po3teLIJJfMI/913n9v8sUozsDmyyW+0YS2bYJaSmfL+0Dv2fcQl4aJyHD
         eF+Q==
X-Gm-Message-State: AHYfb5hOxUMi8yxF6vrJN/WW1VXJk/31RA1Rntr98Zzb0mHdiM4wk0FN
	AICaQ9a2uoCatDnzJYY=
X-Received: by 10.99.123.80 with SMTP id k16mr4481213pgn.434.1503010876394;
        Thu, 17 Aug 2017 16:01:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id c23sm5190043pfc.136.2017.08.17.16.01.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Aug 2017 16:01:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 0/8] TCG vectorization and example conversion
Date: Thu, 17 Aug 2017 16:01:06 -0700
Message-Id: <20170817230114.3655-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.5
X-TUID: FDHkp4C3oJix

When Alex and I started talking about this topic, this is the direction
I was thinking.  The primary difference from Alex's version is that the
interface on the target/cpu/ side uses offsets and not a faux temp.  The
secondary difference is that, for smaller vector sizes at least, I will
expand to inline host vector operations.  The use of explicit offsets
aids that.

There are a number of things that are missing in the host vector support,
including register spill/fill.  But in this example conversion we will
never have more than 2 vector registers live at any point, and so we do
not run across those issues.

Some of this infrastructure cannot be exercised with existing front-ends.
It will require support for ARM SVE to be written to get there.
Or to add support for AVX2/AVX512 within target/i386.  ;-)

Unfortunately, the built-in disassembler is too old to handle AVX.
So for testing purposes I disabled the built-in disas so that I could
run the output assembly through an external objdump.

For a trivial test case via aarch64-linux-user:

IN: 
0x0000000000400078:  4e208400      add v0.16b, v0.16b, v0.16b
0x000000000040007c:  4e648462      add v2.8h, v3.8h, v4.8h
0x0000000000400080:  4ea48462      add v2.4s, v3.4s, v4.4s
0x0000000000400084:  4ee48462      add v2.2d, v3.2d, v4.2d
0x0000000000400088:  0ea28462      add v2.2s, v3.2s, v2.2s
0x000000000040008c:  00000000      unallocated (Unallocated)

OP after optimization and liveness analysis:
 ld_i32 tmp0,env,$0xffffffffffffffec              dead: 1
 movi_i32 tmp1,$0x0
 brcond_i32 tmp0,tmp1,lt,$L0                      dead: 0 1

 ---- 0000000000400078 0000000000000000 0000000000000000
 ld_v128 tmp2,env,$0x850
 add8_v128 tmp2,tmp2,tmp2                         dead: 1 2
 st_v128 tmp2,env,$0x850                          dead: 0

 ---- 000000000040007c 0000000000000000 0000000000000000
 ld_v128 tmp2,env,$0x880
 ld_v128 tmp3,env,$0x890
 add16_v128 tmp2,tmp2,tmp3                        dead: 1 2
 st_v128 tmp2,env,$0x870                          dead: 0

 ---- 0000000000400080 0000000000000000 0000000000000000
 ld_v128 tmp2,env,$0x880
 ld_v128 tmp3,env,$0x890
 add32_v128 tmp2,tmp2,tmp3                        dead: 1 2
 st_v128 tmp2,env,$0x870                          dead: 0

 ---- 0000000000400084 0000000000000000 0000000000000000
 ld_v128 tmp2,env,$0x880
 ld_v128 tmp3,env,$0x890
 add64_v128 tmp2,tmp2,tmp3                        dead: 1 2
 st_v128 tmp2,env,$0x870                          dead: 0

 ---- 0000000000400088 0000000000000000 0000000000000000
 ld_v64 tmp4,env,$0x880
 ld_v64 tmp5,env,$0x870
 add32_v64 tmp4,tmp4,tmp5                         dead: 1 2
 st_v64 tmp4,env,$0x870                           dead: 0
 movi_i64 tmp6,$0x0
 st_i64 tmp6,env,$0x878                           dead: 0

 ---- 000000000040008c 0000000000000000 0000000000000000
 movi_i64 pc,$0x40008c                            sync: 0  dead: 0
 movi_i32 tmp0,$0x1
 movi_i32 tmp1,$0x2000000
 movi_i32 tmp7,$0x1
 call exception_with_syndrome,$0x0,$0,env,tmp0,tmp1,tmp7  dead: 0 1 2 3
 set_label $L0
 exit_tb $0x521c86683

OUT: [size=220]
   521c86740:	41 8b 6e ec          		mov    -0x14(%r14),%ebp
   521c86744:	85 ed                		test   %ebp,%ebp
   521c86746:	0f 8c c4 00 00 00    		jl     0x521c86810
   521c8674c:	c4 c1 7a 6f 86 50 08 00 00 	vmovdqu 0x850(%r14),%xmm0
   521c86755:	c4 e1 79 fc c0       		vpaddb %xmm0,%xmm0,%xmm0
   521c8675a:	c4 c1 7a 7f 86 50 08 00 00	vmovdqu %xmm0,0x850(%r14)
   521c86763:	c4 c1 7a 6f 86 80 08 00 00 	vmovdqu 0x880(%r14),%xmm0
   521c8676c:	c4 c1 7a 6f 8e 90 08 00 00 	vmovdqu 0x890(%r14),%xmm1
   521c86775:	c4 e1 79 fd c1       		vpaddw %xmm1,%xmm0,%xmm0
   521c8677a:	c4 c1 7a 7f 86 70 08 00 00 	vmovdqu %xmm0,0x870(%r14)
   521c86783:	c4 c1 7a 6f 86 80 08 00 00 	vmovdqu 0x880(%r14),%xmm0
   521c8678c:	c4 c1 7a 6f 8e 90 08 00 00 	vmovdqu 0x890(%r14),%xmm1
   521c86795:	c4 e1 79 fe c1       		vpaddd %xmm1,%xmm0,%xmm0
   521c8679a:	c4 c1 7a 7f 86 70 08 00 00 	vmovdqu %xmm0,0x870(%r14)
   521c867a3:	c4 c1 7a 6f 86 80 08 00 00 	vmovdqu 0x880(%r14),%xmm0
   521c867ac:	c4 c1 7a 6f 8e 90 08 00 00 	vmovdqu 0x890(%r14),%xmm1
   521c867b5:	c4 e1 79 d4 c1       		vpaddq %xmm1,%xmm0,%xmm0
   521c867ba:	c4 c1 7a 7f 86 70 08 00 00 	vmovdqu %xmm0,0x870(%r14)
   521c867c3:	c4 c1 7a 7e 86 80 08 00 00 	vmovq  0x880(%r14),%xmm0
   521c867cc:	c4 c1 7a 7e 8e 70 08 00 00 	vmovq  0x870(%r14),%xmm1
   521c867d5:	c4 e1 79 fe c1       		vpaddd %xmm1,%xmm0,%xmm0
   521c867da:	c4 c1 79 d6 86 70 08 00 00 	vmovq  %xmm0,0x870(%r14)
   521c867e3:	49 c7 86 78 08 00 00 		movq   $0x0,0x878(%r14)
   521c867ea:	00 00 00 00 
   521c867ee:	49 c7 86 40 01 00 00 		movq   $0x40008c,0x140(%r14)
   521c867f5:	8c 00 40 00 
   521c867f9:	49 8b fe             		mov    %r14,%rdi
   521c867fc:	be 01 00 00 00       		mov    $0x1,%esi
   521c86801:	ba 00 00 00 02       		mov    $0x2000000,%edx
   521c86806:	b9 01 00 00 00       		mov    $0x1,%ecx
   521c8680b:	e8 90 40 c9 ff       		callq  0x52191a8a0
   521c86810:	48 8d 05 6c fe ff ff 		lea    -0x194(%rip),%rax
   521c86817:	e9 3c fe ff ff       		jmpq   0x521c86658

Because I already had some pending fixes to tcg/i386/ wrt VEX encoding,
I've based this on an existing tree.  The compete tree can be found at

    git://github.com/rth7680/qemu.git native-vector-registers-2


r~


Richard Henderson (8):
  tcg: Add generic vector infrastructure and ops for add/sub/logic
  target/arm: Use generic vector infrastructure for aa64 add/sub/logic
  tcg: Add types for host vectors
  tcg: Add operations for host vectors
  tcg: Add tcg_op_supported
  tcg: Add INDEX_op_invalid
  tcg: Expand target vector ops with host vector ops
  tcg/i386: Add vector operations

 Makefile.target            |   5 +-
 tcg/i386/tcg-target.h      |  46 +++-
 tcg/tcg-op-gvec.h          |  92 +++++++
 tcg/tcg-opc.h              |  91 +++++++
 tcg/tcg-runtime.h          |  16 ++
 tcg/tcg.h                  |  37 ++-
 target/arm/translate-a64.c | 137 +++++++----
 tcg/i386/tcg-target.inc.c  | 382 ++++++++++++++++++++++++++---
 tcg/tcg-op-gvec.c          | 583 +++++++++++++++++++++++++++++++++++++++++++++
 tcg/tcg-runtime-gvec.c     | 199 ++++++++++++++++
 tcg/tcg.c                  | 323 ++++++++++++++++++++++++-
 11 files changed, 1817 insertions(+), 94 deletions(-)
 create mode 100644 tcg/tcg-op-gvec.h
 create mode 100644 tcg/tcg-op-gvec.c
 create mode 100644 tcg/tcg-runtime-gvec.c

-- 
2.13.5
