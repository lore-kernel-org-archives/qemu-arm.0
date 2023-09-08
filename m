Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp347508ejb;
        Fri, 8 Sep 2023 04:22:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyRUUgJqbVAExpE4KVN+vDkaXyMEUrKLTN9jKUPsGo9pfvDbOB0Dh64AI5DmGTdJTi5kQH
X-Received: by 2002:ac8:5fd3:0:b0:413:5392:7bb8 with SMTP id k19-20020ac85fd3000000b0041353927bb8mr2245610qta.20.1694172174682;
        Fri, 08 Sep 2023 04:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694172174; cv=none;
        d=google.com; s=arc-20160816;
        b=TRZxm2AWakWwBxlSov/gAws4S2U6j4lG0BLJLTL3NF3QyBxVgapDAy4ZvbfOOqAibf
         nHnp7D69yE5he43R6ljfLCwxNPzJ+zpwI4uRni1L6ESIRQVBqCW/O6NXhYJPn6iKanK4
         4IKb14jB4SgqdLcNEQz0HCbhoCq9b45zElBYvmAZ7LOE+m/4OFtkiLdeOOSFrwkyBKJb
         vG9SPH3EW29G7kyYzQOsLRZCyGQTk5XaXIMOvOEpg3rONykCZPPTdpV459IgY16TjGQm
         THdtXjYqm6fp5dJemY7mV36BtXu+X8QTEsaijoPeVkT6ttfIkzks1PgcGQnBcyXHFI7M
         SiqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=cDNuLK1WUEsuIA3ZtN60Dc1/gMCwnWEdZ5HlLK85gcs=;
        fh=xrkPdSTzLfgAPR/xILKWCY/2YOP2wIq4k78J4mWio7M=;
        b=Bv3cRVBhTUGtwC5ZHEi9Zb51acNadJLeoJQwX65eA9CNPZSV2rbLUCbAW7cVxRNF6h
         EDG0xW2TJwJw4g7Z/4B6A+//zvUd9fVD79Fupdm0Us6o97OsGWScICd84tizzWkqM/fD
         CsNt/6UaPmr2dwDVVNptRXrYtYL6u0gHi36AC7Id3jR01Ds/nAXRJN1KOeBhOwkMzl+0
         Vgts7JgeBwdbwMHZ5mEfVbofqsErFZ9RS/7xw7ujJxnz8QUcha394g2BOjrh1gTgcvFF
         HT/awjsXEZAIu9YB2MgTU+EFbNydhXKes3i4KVbsFFtyGdBzWUM6SoG0GhlIrSEBHNOb
         YonQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqTlCaph;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13-20020ac85a0d000000b004123076a4f8si1017872qta.563.2023.09.08.04.22.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 04:22:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqTlCaph;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeZZb-0003bs-5r; Fri, 08 Sep 2023 07:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeZZY-0003b2-Im
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 07:22:49 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qeZZS-0003UA-Ow
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 07:22:45 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-400a087b0bfso20463625e9.2
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 04:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694172161; x=1694776961; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cDNuLK1WUEsuIA3ZtN60Dc1/gMCwnWEdZ5HlLK85gcs=;
 b=uqTlCaph8+xJALO9CBivdTv+jdPmugzcXxViJv0UrkKqPfbkggtyu99gFv+6Q2qjQs
 3qHSviP2xvL87jtUGhTHV3ASk8VPhC1AmbB9nWh4otXdIgB0vSA7xnVo7wDBlN/zGNtv
 D0Gg3BqpeqXRnZd4hqL6cOPGxVWxg8//a6G0ZLgEiUS7AjCPO3RI/iRyCmYqQb9dZQcR
 q/qQ9WW3eXx5iaecL9SPS7mfTxMOZF+lCiWsb9dV52LrItoYKLG/q6wssu/pYAjMXGkf
 eY8/08i1zd3739wkJmKdDlAfkbw4kXBdHU+9O5kUW8REIskwsRNIBfVdusR8IO7Jtf+d
 SSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694172161; x=1694776961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cDNuLK1WUEsuIA3ZtN60Dc1/gMCwnWEdZ5HlLK85gcs=;
 b=C5IzeQJD9yMT8ohkD0cBpnLozx8ksJ1EXeW2qVVwmmydHQs2v3gV+++3j9wLaiGH/u
 8ccTiSH5xjnX6lbwtDP8eiOg23RB4mTPk/AVpDyVa7/LjRJOsVl2iMihWACK26BfLFJu
 kYscEEYzPHR3AvzeW9gfBCFfgzcJF8udve1ZAE/nwk3KqpKWgRVXjdazvIqOJk3N3vtP
 aSq9RZVUv+wp5lbq8dZUDZy4ZFesgDKfa/SKVIDLeu1NiL5lsT4ioIqOR5GOUbcdgIBW
 LkVq9wPQ2sEVP0nRFtAfCtaIlPp1vf2W2TpMI5DDP3a7jfQgAC9MmKyJS43kGMNOjJm0
 QrOA==
X-Gm-Message-State: AOJu0YwFDj9e3ClIsek/IVjt+UUpy+nevMkkq2rOZjFDezajVzKzmrv7
 uk+lr2+2DZXkvIKhZ7G1SJQGbg==
X-Received: by 2002:a05:600c:c9:b0:3fe:c7fe:206e with SMTP id
 u9-20020a05600c00c900b003fec7fe206emr1894318wmm.16.1694172161010; 
 Fri, 08 Sep 2023 04:22:41 -0700 (PDT)
Received: from m1x-phil.lan (lfb24-h01-176-173-167-175.dsl.sta.abo.bbox.fr.
 [176.173.167.175]) by smtp.gmail.com with ESMTPSA id
 n22-20020a7bcbd6000000b003fef3180e7asm4956965wmi.44.2023.09.08.04.22.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Sep 2023 04:22:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Gavin Shan <gshan@redhat.com>
Cc: Chris Wulff <crwulff@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-s390x@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Greg Kurz <groug@kaod.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-ppc@nongnu.org, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Bin Meng <bin.meng@windriver.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Song Gao <gaosong@loongson.cn>,
 Stafford Horne <shorne@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <bcain@quicinc.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 0/4] hw/core/cpu-common: Consolidate cpu_class_by_name()
Date: Fri,  8 Sep 2023 13:22:30 +0200
Message-ID: <20230908112235.75914-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: 2k3QIdZALsYc

Gavin noticed the same pattern is duplicated in many
CPUClass::class_by_name() handlers [*].
This series consolidate the calls to
 - object_class_is_abstract()
 - object_class_dynamic_cast()
in the common cpu_class_by_name(), by introducing
the CPUClass::cpu_resolving_type field.

[*] https://lore.kernel.org/qemu-devel/ab07d81c-da98-a270-c3f6-0625912c6d0b@redhat.com/

Philippe Mathieu-Daudé (4):
  target/alpha: Tidy up alpha_cpu_class_by_name()
  hw/cpu: Call object_class_is_abstract() once in cpu_class_by_name()
  hw/cpu: Introduce CPUClass::cpu_resolving_type field
  hw/cpu: Call object_class_dynamic_cast() once in cpu_class_by_name()

 include/hw/core/cpu.h   |  9 ++++++---
 hw/core/cpu-common.c    | 15 ++++++++++++---
 target/alpha/cpu.c      | 11 ++++-------
 target/arm/cpu.c        |  6 ++----
 target/avr/cpu.c        |  6 ++----
 target/cris/cpu.c       |  6 ++----
 target/hexagon/cpu.c    |  6 ++----
 target/hppa/cpu.c       |  1 +
 target/i386/cpu.c       |  1 +
 target/loongarch/cpu.c  |  7 ++-----
 target/m68k/cpu.c       |  6 ++----
 target/microblaze/cpu.c |  1 +
 target/mips/cpu.c       |  1 +
 target/nios2/cpu.c      |  1 +
 target/openrisc/cpu.c   |  6 ++----
 target/ppc/cpu_init.c   |  1 +
 target/riscv/cpu.c      |  6 ++----
 target/rx/cpu.c         |  7 ++-----
 target/s390x/cpu.c      |  1 +
 target/sh4/cpu.c        |  4 +---
 target/sparc/cpu.c      |  1 +
 target/tricore/cpu.c    |  6 ++----
 target/xtensa/cpu.c     |  6 ++----
 23 files changed, 53 insertions(+), 62 deletions(-)

-- 
2.41.0

