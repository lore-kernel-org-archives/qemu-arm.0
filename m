Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp997512ejb;
        Thu, 19 Oct 2023 22:40:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMW8pg3An0ZesZB2QxY7Pl0qalS7zA7bi+FtLWBFcOknhKv5PzAO6L/exhhCbipoGkf2xa
X-Received: by 2002:a05:620a:3951:b0:775:cf5f:8a81 with SMTP id qs17-20020a05620a395100b00775cf5f8a81mr793507qkn.62.1697780423929;
        Thu, 19 Oct 2023 22:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697780423; cv=none;
        d=google.com; s=arc-20160816;
        b=rTEyj+34pNmXoKXxKy7XQeIFQfWCVl6PG54EufXVb5bC5cgHvqxMfyb+8IVP58FtE4
         E43swuu3zfDykigUOg2VZ8VWsEw+3tE2spDbBxLb3F+DwLWtZLA6PkQPayqMF1k4KmP1
         yEm4/Uueqg6uUCJztazzxlgL9VeyVVCqKoxA/DXhloshZCQRLLeqd6Vete3Iyg08sRXe
         VYbHJRbMmooZnuUJsrvmYgydeXHeceDfL0cuIJZ+X40h8CvTmE+OBiZ/nCzs5g7cUU5H
         dGjPPY6pbM8azc0PeSX5zJyK2VbAdDQ7YCC55cV/RyK7pS9yEEED/ksBU40LZIoNA8KU
         TuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=qCvrnks7f1vNmAwT6fyPqURGfBpxff3LXX8FwyJL2Ps=;
        fh=6LIferDA4/z/iWTju/wr9elUK8av7rGIJzQfEXz5NGs=;
        b=dlg+wa/w0uYE8dROK9/1luooKciSyp/AngDiL8U8Qba6nhdhj/khd7WgUurvsTUEN+
         LCRnDBp4SPbX+dZYo2lqZinQq0QoSTD9XCltAqJK6Bp1XEnCv1XCO69zAjCP1vlLbgKV
         +Si59GXzANT/24/yMxf2LpI5/yGnwjo5FU9pEakQ2VK2F8cASzpZbje0b7/Z8TP+1Tjm
         Pl4r0Da8T2LxODrtNjJHUgYaq7uqLK5UHG8yenPFmOyoJLlVnvjJ5FfPXVC+1u8f10nL
         ygUGeIOsx8oMD/Fk5XrqrGIwVbf2oBIT3NgPQfDpJ2iL/TC+9AmGJzI/Q1o9oGuIR/fn
         5u8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GsdI8XwC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020a05620a400a00b00767f226bc82si739683qko.315.2023.10.19.22.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 22:40:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GsdI8XwC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtiEf-0002an-L9; Fri, 20 Oct 2023 01:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1qtiET-0001yz-M5; Fri, 20 Oct 2023 01:39:38 -0400
Received: from mgamail.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1qtiEQ-0002GN-MP; Fri, 20 Oct 2023 01:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697780374; x=1729316374;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5THOytgmg4oNLebsyKLqtM1EaWFPJeHdlAiScgBgbRM=;
 b=GsdI8XwCljuQMivBuHAJP4mFU1xCZj12cJYEVnG30TySVQh8d0mlj3It
 rVV91FFvdfGgQv8KJFAdaIwgKPvxUlVVVQ4dU0tFHWL30M70sqqtzHCNU
 EHi7lxZhTLYnJ19FTi28d/FsF03Yf1v3L6Qqi6b3OU+obB14leUqPy9hx
 UNA/E+icdNR7oxZbwLJyOTS4jKbx4QtHnsj/Jy2/bRMjL8XwyO1vrfpcr
 5RgbPApmQdX5krymrKcaQO4gjkl6gElYkSSyd8bMgxDiGoG6PMo1UzmDC
 SuGrmxM3mXV0wp/P+f5kvu+c1k0R61LsP8Vziopf5UJR/kKLBCewvrJ7m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="390315888"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; d="scan'208";a="390315888"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 22:39:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5003820"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.36])
 by orviesa001.jf.intel.com with ESMTP; 19 Oct 2023 22:38:09 -0700
Date: Fri, 20 Oct 2023 13:50:57 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Stafford Horne <shorne@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yanan Wang <wangyanan55@huawei.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Marek Vasut <marex@denx.de>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Brian Cain <bcain@quicinc.com>, Thomas Huth <thuth@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Michael Rolnik <mrolnik@gmail.com>
Subject: Re: [PATCH v2 00/16] target: Make 'cpu-qom.h' really target agnostic
Message-ID: <ZTIVQfTmkK05fln9@intel.com>
References: <20231013140116.255-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231013140116.255-1-philmd@linaro.org>
Received-SPF: pass client-ip=134.134.136.65; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Gj6wKdZrmN8n

Hi Philippe,

On Fri, Oct 13, 2023 at 04:00:59PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Fri, 13 Oct 2023 16:00:59 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v2 00/16] target: Make 'cpu-qom.h' really target agnostic
> X-Mailer: git-send-email 2.41.0
> 
> Since v1:
> - Added R-b tags
> - Addressed Richard comments
> - Postponed OBJECT_DECLARE_CPU_TYPE() changes
> 
> A heterogeneous machine must be able to instantiate CPUs
> from different architectures.

Does this mean the different ISA cores in heterogeneous machine?
And is this case for TCG?

> In order to do that, the
> common hw/ code has to access to the QOM CPU definitions
> from various architecture.

About this kind of heterogeneous machine with multiple CPUs, is there
any initial configuration command line example?

I'm not sure how to configure this case...The main unsure thing is
whether the configuration is based on the granularity of the CPU
(by "-cpu") or the granularity of the core device (by "-device
xxx-core").

-Zhao

> 
> Those QOM definitions are published in "target/foo/cpu-qom.h".
> All 'cpu-qom.h' must be target agnostic, so hw/ can include
> multiple of them in order to create a heterogeneous machine.
> 
> This series strengthen all (except PPC...) target 'cpu-qom.h',
> making them target agnostic.
> 
> For various targets it is just a matter of moving definitions
> where they belong (either 'cpu.h' or 'cpu-qom.h').
> 
> For few (mips/riscv/sparc/x86) we have to remove the target
> specific definitions (which 'taint' the header as target specific).
> 
> For mips/sparc/x86 this implies splitting the base target
> definition by making it explicit to the build type (32 or 64-bit).
> 
> PPC is missing because CPU types are currently registered
> indistinctly, and whether a CPU is 32/64 bit can not be detected
> at build time (it is done in each cpu_class_init() handler,
> *after* the type is registered).
> 
> Based-on: <20231010074952.79165-1-philmd@linaro.org>
>   Introduce qtest_get_base_arch() / qtest_get_arch_bits()
> 
> Philippe Mathieu-Daudé (16):
>   target: Unify QOM style
>   target: Mention 'cpu-qom.h' is target agnostic
>   target/arm: Move internal declarations from 'cpu-qom.h' to 'cpu.h'
>   target/ppc: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
>   target/riscv: Remove CPU_RESOLVING_TYPE from 'cpu-qom.h'
>   target: Declare FOO_CPU_TYPE_NAME/SUFFIX in 'cpu-qom.h'
>   target/hexagon: Declare QOM definitions in 'cpu-qom.h'
>   target/loongarch: Declare QOM definitions in 'cpu-qom.h'
>   target/nios2: Declare QOM definitions in 'cpu-qom.h'
>   target/openrisc: Declare QOM definitions in 'cpu-qom.h'
>   target/riscv: Move TYPE_RISCV_CPU_BASE definition to 'cpu.h'
>   target: Move ArchCPUClass definition to 'cpu.h'
>   target/i386: Declare CPU QOM types using DEFINE_TYPES() macro
>   target/mips: Declare CPU QOM types using DEFINE_TYPES() macro
>   target/ppc: Declare CPU QOM types using DEFINE_TYPES() macro
>   target/sparc: Declare CPU QOM types using DEFINE_TYPES() macro
> 
>  target/alpha/cpu-qom.h      | 21 ++-----------
>  target/alpha/cpu.h          | 17 ++++++++---
>  target/arm/cpu-qom.h        | 61 +------------------------------------
>  target/arm/cpu.h            | 55 +++++++++++++++++++++++++++++++--
>  target/avr/cpu-qom.h        | 20 ++----------
>  target/avr/cpu.h            | 18 ++++++++---
>  target/cris/cpu-qom.h       | 24 ++-------------
>  target/cris/cpu.h           | 20 +++++++++---
>  target/hexagon/cpu-qom.h    | 27 ++++++++++++++++
>  target/hexagon/cpu.h        | 20 ++----------
>  target/hppa/cpu-qom.h       | 20 +-----------
>  target/hppa/cpu.h           | 16 ++++++++--
>  target/i386/cpu-qom.h       | 42 ++-----------------------
>  target/i386/cpu.h           | 39 +++++++++++++++++++++---
>  target/loongarch/cpu-qom.h  | 23 ++++++++++++++
>  target/loongarch/cpu.h      | 14 +--------
>  target/m68k/cpu-qom.h       | 21 ++-----------
>  target/m68k/cpu.h           | 17 ++++++++---
>  target/microblaze/cpu-qom.h | 20 +-----------
>  target/microblaze/cpu.h     | 15 +++++++--
>  target/mips/cpu-qom.h       | 23 ++------------
>  target/mips/cpu.h           | 21 ++++++++++---
>  target/nios2/cpu-qom.h      | 18 +++++++++++
>  target/nios2/cpu.h          | 11 +------
>  target/openrisc/cpu-qom.h   | 21 +++++++++++++
>  target/openrisc/cpu.h       | 14 +--------
>  target/ppc/cpu-qom.h        |  3 +-
>  target/ppc/cpu.h            |  4 +--
>  target/riscv/cpu-qom.h      | 26 ++--------------
>  target/riscv/cpu.h          | 24 +++++++++++++--
>  target/rx/cpu-qom.h         | 20 ++----------
>  target/rx/cpu.h             | 18 ++++++++---
>  target/s390x/cpu-qom.h      | 41 +++----------------------
>  target/s390x/cpu.h          | 34 ++++++++++++++++++---
>  target/s390x/cpu_models.h   |  8 ++---
>  target/sh4/cpu-qom.h        | 28 ++---------------
>  target/sh4/cpu.h            | 24 ++++++++++++---
>  target/sparc/cpu-qom.h      | 23 ++------------
>  target/sparc/cpu.h          | 22 +++++++++----
>  target/tricore/cpu-qom.h    | 15 +++------
>  target/tricore/cpu.h        | 10 +++---
>  target/xtensa/cpu-qom.h     | 26 ++--------------
>  target/xtensa/cpu.h         | 24 +++++++++++----
>  target/i386/cpu.c           | 50 ++++++++++++++----------------
>  target/mips/cpu.c           | 23 ++++++++------
>  target/ppc/cpu_init.c       | 52 ++++++++++++++-----------------
>  target/sparc/cpu.c          | 23 ++++++++------
>  47 files changed, 528 insertions(+), 588 deletions(-)
>  create mode 100644 target/hexagon/cpu-qom.h
>  create mode 100644 target/loongarch/cpu-qom.h
>  create mode 100644 target/nios2/cpu-qom.h
>  create mode 100644 target/openrisc/cpu-qom.h
> 
> -- 
> 2.41.0
> 
