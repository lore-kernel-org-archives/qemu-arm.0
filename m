Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp795152ejo;
        Fri, 5 Jan 2024 07:50:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPdri8TzgN5iOtvkYlSN3Am58x3Ii2jspXCwikioso8c64MvgIqUIys5Ym97yZiFITpltF
X-Received: by 2002:a37:c402:0:b0:77d:98aa:f7d3 with SMTP id d2-20020a37c402000000b0077d98aaf7d3mr2117130qki.13.1704469810583;
        Fri, 05 Jan 2024 07:50:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469810; cv=none;
        d=google.com; s=arc-20160816;
        b=jHBFH5n9tTVW7bRTxGfL3hHCfvKhfMoVu3GpDntSAaJf83Ic9cep2G49ukDVzqP5ZG
         xNvNfLh/9hQLxZF1iFR4/cOHnkTSUGaM3yZ8HrRfOEbK6lMaE2IlhEPwddVdhmHcCMlE
         WSsTlHCUB/gX2Qi0FIhDM4NUE13yAfFlPF7LoQ3XNQokL3aiTO8kAQkcnzSVpcXXCYwy
         TOJfVJpS6+owy1QrZRWG14BJjwMW+yhZfByXVGv6UVQ4l8d+UXyL2837BLg04yEa5C12
         RIavsLY6X9aObH8xoFrOmG34BktU7iom8HG4SWmOxMRGrwtdmaQDPWrqb4BXeAkfePX/
         ZbCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cFGPQoyiNDNESAoFxHgGgEpoIvyyYwdHUPQolOFmxbE=;
        fh=DS/sjFVyRjQZ2Knf0JWk3Zjoc6VB85xSzRN3yPTMPCU=;
        b=jhvqXSzShN327IDH8i9MIFP7Ea5PHvQMbsZ+c7bDmIgqvQ+EF169182Z7ytnKPbzRS
         5/JHyhopOy/ZURbtwHl/GGKPL17mvdkINlx8/YApbzG9MdROnKNxzNW8R8g+d6uJ7AYP
         sCWhqw+/h5ZK1+WODBrjy9nYcRDXoUSQLSpm+7dZo22g6ILyNLAX7pZ0B78eqTEjI8qB
         0r+sjF6mOOuP9EBYWcP8y7+/e2TEQ+olP8FgX0Y9zwJPxU9hU362TblVtwLWTIE2Mgru
         sYQTTNuVN64Rw9SaBKv5ZS4z/7Z2XW+hbtpbJUM+uezHNzNq2AOF+3v8fXTkIbAk3OyC
         //yA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yDHJUZtu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o22-20020a05620a2a1600b007830c1678b1si977818qkp.565.2024.01.05.07.50.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:50:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yDHJUZtu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmQo-0000h6-8F; Fri, 05 Jan 2024 10:48:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPR-0004L3-Nl
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:46:58 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmPO-0003zS-IO
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:46:57 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33687627ad0so1403130f8f.2
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469613; x=1705074413; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cFGPQoyiNDNESAoFxHgGgEpoIvyyYwdHUPQolOFmxbE=;
 b=yDHJUZtuJ+/pbAiwQ7FJM6Y7cA9os0eiFqDzVhm3WM69UHx4LvAMpspc3VSq7FMsfr
 Qg2vgeASyHqK9nB1MgQMnbKrjeBKPFzmMg5CZWEuM75fok6QhuEVX1TmGUVp7EwgTwQA
 Uq/I+c4a4ig9NuVW6dAFhlcattXWiYKYA+lOmxuL2UdTn/SnAockYNgdNMTQm7BkzUW1
 oB+JMyvUUfWNp6dVTX726vWXDydMFhE2ZcrVd7aGugP7beY28JgxT6lyC3tzEWEnDcLz
 XhmWIUXQdOGuH5rQjN4/955fObhC8wi3LJiZ2eMw7OIEORdf+0XmFJqlNiQAJxjNjs+E
 DVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469613; x=1705074413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cFGPQoyiNDNESAoFxHgGgEpoIvyyYwdHUPQolOFmxbE=;
 b=l5K1n+gXI+uQjgb6zIzeVNsoJqvG4m9044GpL70olq7BK3AcfFYzoZBOLJfG4K01iC
 Dmt04aInej04rZrT1bejH/16BvMO5Y6MfSNgKk2iwOBNpap/kI3pXdQKsHc66lQC87aV
 +eF/+ucTpnc0gGEETP53bHwethkXzE9gX2AfHN4bzQg87iKddSxJAcyHaVdEVnSZ6I7M
 U48NyN+yjv6qXZ/OYR4/zSfhcwa9pHeWEqLBMf6+O/UmaX0bVXdCbq1GfP9WeFwc5eoL
 /jkmaLbj0mGDdm0EBqW2pKUMXaT9fs00p8rnG1zxruATwHzhefPKoNS9IeKhYuAJ6mju
 LA1w==
X-Gm-Message-State: AOJu0YwAuyTyuUfOi53nH993X8kI/q14yTsqnI1r17qeJ17fgP6nzpC6
 F/QD4u2ZXQvpN4t2d1c+6Tjts7Q2vGJrgw==
X-Received: by 2002:a5d:4b83:0:b0:337:49b6:8bea with SMTP id
 b3-20020a5d4b83000000b0033749b68beamr1188216wrt.78.1704469613220; 
 Fri, 05 Jan 2024 07:46:53 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 u10-20020adfa18a000000b00336ca349bdesm1626770wru.47.2024.01.05.07.46.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:46:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 33/71] hw/core/cpu: Remove final vestiges of dynamic state
 tracing
Date: Fri,  5 Jan 2024 16:42:26 +0100
Message-ID: <20240105154307.21385-34-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gpIiHpFsnALM

The dynamic state tracing was removed in commit d0aaf08bb9.

Fixes: d0aaf08bb9 ("tcg: remove the final vestiges of dstate")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231129182734.15565-1-philmd@linaro.org>
---
 include/hw/core/cpu.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 76ef59de0a..44ff954207 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -437,9 +437,6 @@ struct qemu_work_item;
  * @kvm_fd: vCPU file descriptor for KVM.
  * @work_mutex: Lock to prevent multiple access to @work_list.
  * @work_list: List of pending asynchronous work.
- * @trace_dstate_delayed: Delayed changes to trace_dstate (includes all changes
- *                        to @trace_dstate).
- * @trace_dstate: Dynamic tracing state of events for this vCPU (bitmask).
  * @plugin_mask: Plugin event bitmap. Modified only via async work.
  * @ignore_memory_transaction_failures: Cached copy of the MachineState
  *    flag of the same name: allows the board to suppress calling of the
-- 
2.41.0

