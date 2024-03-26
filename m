Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1433708ejj;
        Tue, 26 Mar 2024 08:47:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCULUndoTIghyV4nMefMzl/238/2u2WJsbHnaYhmFLhHOzSNuPN31ZC0vjpBfMtLG1zdfrIvRu6TEbDQ1YFb6NgnQfznqa+q
X-Google-Smtp-Source: AGHT+IE5sPq5yO0HePidnT7YT5lhrjWhRJ50hZSh+5YI1PXQi2ReCl4SPkY+hh2FcGgcs43GOOgS
X-Received: by 2002:a05:6000:1811:b0:33d:886d:bb51 with SMTP id m17-20020a056000181100b0033d886dbb51mr8471wrh.60.1711468078274;
        Tue, 26 Mar 2024 08:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711468078; cv=none;
        d=google.com; s=arc-20160816;
        b=CvWgKFVC7JBoZRlyUTbiPoRWU9CGLBw8Ki9GZLM7FLFxg26eCgTftkWK2K0xhcZkoH
         1L0+lMRMcDXTMm/n3AUM46xJ+CQZj/b5lGJSaHpaSz02UgK7eAVvpD2kplUCtVf3CUhC
         bdANRlizfjdtoBzZOmI0rJCwgx0C4nquTnRUBbNwMwhBB3EOWAW+3FHaHqCrT69VDlDK
         zZu/kcvOHAtjyVXJNZ+PNZkXzezhU2XU04Ehi/vnjuZAUvULj/uI9RsYZG1KztaD9Zuv
         S0tyGRC2yYNwqkd1QP2PybCoeCYEhUnprDqkUppshEAZtFtJ9n0BPpXagtsuxfzJebJ9
         8dIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IDGvrX1ZbW/accSdyb5WOkWj9+BF/HkrY2XWDQDRR/o=;
        fh=ABR3BqPaI++zUxctK5qPRzzsP8di6cGksqHT7WaT0VI=;
        b=cw/OJHYZcqEcq6u6p86bwYs1N/qMkoVnZZZ3kWHZKW41o3BoTVDtw91xkkk3J6/bpt
         91eVbDKxDMM+X8yZ1SUN1GChZOIE903kfK14IQ2Em7aL+APMFb7yJvBwxeSd1wx7xpWo
         JvsOwqyrl7ceBR5yYVIkqjkqXBoilKtStMMv0gb08NNAJ3ttgISbartVruXMNV3X4zpM
         5ylq6ohUyLahUKtwj1udbsiGJtjaeZpuJQ3c8UeK0nm6KgJoN5dkuCYUQAKTyhW3mVLF
         j5qR6DcBEg+eft1TGvvCvn1kFI+ot4ykwjIHlDT+mABSbeoYn5hxeVPC1bZS/Kg9mJiX
         gHzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CrKUvdeH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dd19-20020a0560001e9300b0033ebb799400si5403670wrb.431.2024.03.26.08.47.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 08:47:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CrKUvdeH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rp8zZ-0003hN-2K; Tue, 26 Mar 2024 11:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp8zX-0003gW-Fw
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 11:45:35 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp8zV-0001A9-1Z
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 11:45:35 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-341cf77b86bso1462091f8f.2
 for <qemu-arm@nongnu.org>; Tue, 26 Mar 2024 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711467931; x=1712072731; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IDGvrX1ZbW/accSdyb5WOkWj9+BF/HkrY2XWDQDRR/o=;
 b=CrKUvdeHFUIn/1DnLxGPmmixXaab6TmnvtqQbb2v0FB3q0WBtRyWJqUDO6rnR/u/jA
 DUnHO4XfvAckIOmygLFv1bqwDwnY3zTFvHbz47o+UoqnrX4rtXeJQ+zkIPp5sQr3Mj+H
 Ra1gsq2hkB6v8YHv+rGKlXADiZzdGuGHSzIv6ksgCynriOa4+2uYP6d1x60SSFW+V3HS
 x1v43Tbi5CRej0jpmdadwJvILvzUjoWV5l88i80iob3Hgjtg7BZuA4FPxxpiwO0Ow4K6
 wvQ3aZio4/CmgkufCmTG31VG2k+yCD2bDXV0T/9/s7V+638p82/PsONUEzwyFpZ6yvWe
 GaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711467931; x=1712072731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IDGvrX1ZbW/accSdyb5WOkWj9+BF/HkrY2XWDQDRR/o=;
 b=b61naKe++RW7Eft9heyDa+C424v2e38DwedIXd3rrDHym++g7IpKYEFVBqFcuFL0wK
 EfE2hxsAtk7SCKvACDm1gymy11vFyi2aGs5bizlBLWfpFPHTpTk1UrNpBj2LlVrDUDqm
 bLFDaRXREz+2cE5SKtAe/ggF5HtGuP3lzpKvoyow5zXvs14GvVCemDHaDRcoZertDMb/
 PZScEBVS/tcGjNW5iaguj2YlpD4g0461akd3XYA7ssssi+sh7b/Q4kbCzFCHtgnH0Js5
 zWSXUEHOrprL+inn3tGIfR15o1uy4J2cVWXpKVX5hoFXSnUx3hZvnwNkGkT70flutrpH
 nq/A==
X-Gm-Message-State: AOJu0Yz6wjstwoLXtZAca/K3Ev/Qn7VOJhBes666cBZnAzQy2VUekqST
 JmkB+8UEKA4ITAKegeXQnRiyc28z4cv2SruUKL/OZ6eSYTpb3xbNFzFZ44gUZyE=
X-Received: by 2002:a5d:67cd:0:b0:341:c000:5f02 with SMTP id
 n13-20020a5d67cd000000b00341c0005f02mr31090wrw.7.1711467931613; 
 Tue, 26 Mar 2024 08:45:31 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.229])
 by smtp.gmail.com with ESMTPSA id
 h8-20020adffd48000000b0033e9d9f891csm12447332wrs.58.2024.03.26.08.45.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Mar 2024 08:45:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PULL 04/13] target/tricore/helper: Use correct string format in
 cpu_tlb_fill()
Date: Tue, 26 Mar 2024 16:44:55 +0100
Message-ID: <20240326154505.8300-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240326154505.8300-1-philmd@linaro.org>
References: <20240326154505.8300-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: So6JhDZyKDFO

'address' got converted from target_ulong to vaddr in commit
68d6eee73c ("target/tricore: Convert to CPUClass::tlb_fill").
Use the corresponding format string to avoid casting.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240319051413.6956-1-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 6d9e80cc0c..76bd226370 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -76,9 +76,9 @@ bool tricore_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     ret = get_physical_address(env, &physical, &prot,
                                address, rw, mmu_idx);
 
-    qemu_log_mask(CPU_LOG_MMU, "%s address=" TARGET_FMT_lx " ret %d physical "
+    qemu_log_mask(CPU_LOG_MMU, "%s address=0x%" VADDR_PRIx " ret %d physical "
                   HWADDR_FMT_plx " prot %d\n",
-                  __func__, (target_ulong)address, ret, physical, prot);
+                  __func__, address, ret, physical, prot);
 
     if (ret == TLBRET_MATCH) {
         tlb_set_page(cs, address & TARGET_PAGE_MASK,
-- 
2.41.0

