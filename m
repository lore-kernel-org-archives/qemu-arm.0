Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2678962eja;
        Mon, 6 Nov 2023 03:09:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZiLctzICr3fPU51iPUVqorDra+n8JiuZyPB2V14xjyc14sXuTTpbH3ttxNidT3mqZKASl
X-Received: by 2002:a05:6808:abb:b0:3ad:fdfb:d384 with SMTP id r27-20020a0568080abb00b003adfdfbd384mr28014703oij.53.1699268941573;
        Mon, 06 Nov 2023 03:09:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268941; cv=none;
        d=google.com; s=arc-20160816;
        b=zCN0NAYWTXfbXPTX0SaHwaIgLQiv1r1BT1dmKNP9qc8e8gaeXHytDn2PvOCjwbg+Tm
         4I/mG2Ng6Glhx1HCd6l5XdIlIaqogCSYtPEMwef/kJqz26uwXYVDtvTrLS+64RPtH73z
         zMHLRzn93VzaQJ6O/NKInyXRlYG50IGIbfG0GMFsm4/8nlLdiFF4R+aBi6XlFN2FII6U
         ghocbiIJYOD/GYXC1vFFw5mB9zNY8d+2YyKWuUUEYFErf3NvaNUFZyCT7f+M4Jz2dZKZ
         tEJsDqFpSolThEyiueZA5s8VS9dt7DNIDrgpKx4sLulRTExxrufA/NbfIXvCWR1MYcvt
         dC3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=GYvSXfF+xbSSjVZB+VdYev9ZdU+Lgrd51drrmwgB968=;
        fh=CqydUC7z3m+1ZVgnQUk3DlZOYjanITV9J2t5qJRJPD4=;
        b=Raf/tatCO3gDtl+C6JD6lHQULGcasHpiv9LIcbXMWkfzBNSugcpipwqS1mGtJhGIWt
         9pxmAExSia92/rrMPpxnWm6D58BF4qQr6entyTTXCc4m7sUe4rXxMxmZJpqlJZBCBapI
         LLK7pP+Ovybpl5hed0v1mvATnf3/ZGdLac2JkqAJAsmTKHVfG+AdMfZncmXT1Fdf1SXw
         N3+5RIwZmIQtkm9VhiXj1Z3Wd9rfF7PAIPBcgU+6NnlKAMt5/6aQTckM4B4spfxrOS+B
         Mkh8Bs8W3K7BX2t3MLEXwV557Pw0rSM/f+c9KSWnDYZXpkSPiqeBP1qBLefdAPNhtVph
         3hlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CkQ8+o90;
       spf=pass (google.com: domain of kvm+bounces-715-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-715-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-715-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d17-20020a056a00199100b006c145de9d27si8111891pfl.128.2023.11.06.03.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:09:01 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-715-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CkQ8+o90;
       spf=pass (google.com: domain of kvm+bounces-715-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-715-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4649281227
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7459418AEB;
	Mon,  6 Nov 2023 11:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CkQ8+o90"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9240718AE4
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:08:57 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63944BE
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:08:55 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c6ed1b9a1cso58270251fa.3
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268933; x=1699873733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYvSXfF+xbSSjVZB+VdYev9ZdU+Lgrd51drrmwgB968=;
        b=CkQ8+o90NA2u6JPpvKczDywY7M8BOWYlaSBORGMurJ+6MmTCZhU1OuftboX5QmrcQq
         xdzdu0AxOS4W2l7h8D6sHWj43YNGLlYUQdFgx4ZYf8es/ppkRNeYoQhIzh8Esyrw9Pqs
         /SzWW3Ya08Ne4UXlR0atk9ckrBem9RrfLd8ljgcdhlUwrHtjf2XcdYkt/GuswMrujN5J
         ufflOzaTd3nqIBmRc5HcT/ItsaWz9h4ZHcrEXB3Uiigm53YxcugoXL2Y+WrUBzCo9xW/
         SKRFdNYD/DuSY1Fz6Nygo763HxQ+LXpXgJEN7CsP5ioGVBquiYyFHWZ9zk8LNlxO6GTB
         glew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268933; x=1699873733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYvSXfF+xbSSjVZB+VdYev9ZdU+Lgrd51drrmwgB968=;
        b=PAdTctFTWQhzOZgmODDHacX4ds1I3YRXd0hoyc4VHJk6z8mzahRpmaaAEDq2QwQrko
         +7FT32nKrEwZgTdzsD3A9YxZdcSBe5AFptV9+mRJ0dgkUZLubOCg/fa/wbyOnbMB54qI
         z843GeoabzdbkXCQV0Wyv9mwUrJ6zjtX6cD/CJaYwrUaO9rMYGDAIU7rV5TBVYQ6bZec
         34jDjyHgI6N0L8Z3X1h7PS1r2KPLAl41k2kTlSjVnG90mz+R28ZVJCtPgjDpljkMdSZj
         o5mkiu59ZZvCiOH033MI/pPD5eOKt60vT+h1dOnOW5uD48Sij2M9iopFj6hl5HXjeras
         0UDg==
X-Gm-Message-State: AOJu0YxA97a0R4HAkBew9e/vAPyqnPBTnlPvA3gQkUWph5Tjg73SGpRI
	pwpjv0ii4W6SugtSM/WpL0Zryw==
X-Received: by 2002:a2e:7a17:0:b0:2c2:a337:5ea with SMTP id v23-20020a2e7a17000000b002c2a33705eamr22917103ljc.27.1699268933639;
        Mon, 06 Nov 2023 03:08:53 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id h15-20020a5d688f000000b0032f9688ea48sm9121553wru.10.2023.11.06.03.08.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:08:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Babu Moger <babu.moger@amd.com>,
	Yongwei Ma <yongwei.ma@intel.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 46/60] hw/cpu: Update the comments of nr_cores and nr_dies
Date: Mon,  6 Nov 2023 12:03:18 +0100
Message-ID: <20231106110336.358-47-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: toMK2VRhBfK6

From: Zhao Liu <zhao1.liu@intel.com>

In the nr_threads' comment, specify it represents the
number of threads in the "core" to avoid confusion.

Also add comment for nr_dies in CPUX86State.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Babu Moger <babu.moger@amd.com>
Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <20231024090323.1859210-5-zhao1.liu@linux.intel.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 2 +-
 target/i386/cpu.h     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 77893d7b81..c0c8320413 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -408,7 +408,7 @@ struct qemu_work_item;
  *   See TranslationBlock::TCG CF_CLUSTER_MASK.
  * @tcg_cflags: Pre-computed cflags for this cpu.
  * @nr_cores: Number of cores within this CPU package.
- * @nr_threads: Number of threads within this CPU.
+ * @nr_threads: Number of threads within this CPU core.
  * @running: #true if CPU is currently running (lockless).
  * @has_waiter: #true if a CPU is currently waiting for the cpu_exec_end;
  * valid under cpu_list_lock.
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6c6b066986..b60a417074 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1882,6 +1882,7 @@ typedef struct CPUArchState {
 
     TPRAccess tpr_access_type;
 
+    /* Number of dies within this CPU package. */
     unsigned nr_dies;
 } CPUX86State;
 
-- 
2.41.0

