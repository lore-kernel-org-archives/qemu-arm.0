Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp795186ejo;
        Fri, 5 Jan 2024 07:50:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFumiYRGELmNqA4c8elqSTfHmYGvTlUBzVDZbSAckhPfGrFGGAUkbh5yowg9611w+QZwgNd
X-Received: by 2002:ac8:578d:0:b0:429:736f:26e0 with SMTP id v13-20020ac8578d000000b00429736f26e0mr2183797qta.67.1704469813779;
        Fri, 05 Jan 2024 07:50:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469813; cv=none;
        d=google.com; s=arc-20160816;
        b=QpCW1ihxIlxqyTeUEuRqpuMuAO5QWCzjy5ZfjlMI56mjYDQMQmAJxwDHwchLIyzugF
         WwbFOjd52++LbBagwuz50y2pHHkoloeccZwcFAP8LyefzxpBTDZW4sHcF3r3zmA3TvJ1
         ygLfLOSZliG3XsZepWNQyDldReKxzQoQEEg0PrJpGMc3OSSGy9Ts2LA+eTrFg4LbWtX9
         LmAhzlTP7YLHetn13p+wigaaANINrPVV9VjkwPDXRgj4wO4v+OqKSoTDG/5iWXjxZiu6
         JHtb0k3kgm792aeL//EiLlg8knRPR27UVwdcRtiPq/LoWHolHXNdM5EB/ersALgk9oWn
         9vWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SzfKYNH1/2wbsF3ubLhxzVujUnJw+6X9RP1nI43IQ80=;
        fh=PgmdcApeveQDElskOCknLWjCsqveGE+4rfVMPzrMCbA=;
        b=lXI5KB+6vzPYF8Dry1CkBOwgt7qN8lejM5TaQsFFX5JhQdrJJQIVQZ1uEl293Y24fc
         lJx2iWOGLe8D3HyMPYIAenZsk4ipOaWWKUILgJRR1rdLEEbD4tM98NGY2OW1xWflv/hq
         5sy90jCQKZqo/6wUtrnQV0CWEE23ENxS2QXFaZpAaOxSCNnAmWvLl+lEkbZbJl2XFYet
         ou3laqubq/MtUSt8qzv5zmXYHdMekBw7vHqbxIJZb6h0TzcG7hRkN4gmcKCSldDJMOwK
         8uP/qaG0kbE4vpG0ZWXpRIRollBwFtjEQA17HCmG3cgbnLOQRPQ8W1yWjZHYTVq6yJa5
         8BbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ER+J0fYi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020a05622a138e00b00428405c062csi1946809qtk.635.2024.01.05.07.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:50:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ER+J0fYi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rLmQ0-0006Ec-8G; Fri, 05 Jan 2024 10:47:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmP6-0002D6-MQ
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:46:37 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmOo-0003t8-Ky
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:46:24 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3373a30af67so1322941f8f.0
 for <qemu-devel@nongnu.org>; Fri, 05 Jan 2024 07:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469577; x=1705074377; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SzfKYNH1/2wbsF3ubLhxzVujUnJw+6X9RP1nI43IQ80=;
 b=ER+J0fYiSRL3gi+24IzzqLi/vohO2TpKTOVS8ZxzSZqC9Ai0Lvseqm8dV9Kb08KJcp
 dYjRgEm1GVRhyi4n6XMmL8INkuwKezBuUIawlv4TubUjXFsSTgJ/DFg4WcnSeoboAMTK
 S+yc4RVCPE4zI4/4tydWnrUyfNWbDUt/gsyoeG+sgYjCylUll4xy5ogWnaE8+jJqNMqc
 nO3UhJexhrOY0FIBb7wXYBO9DaweNrAaVyYzMJ1Bw9HqfBJPSMyE+sMjpLVaFTLmVLbx
 UO/vG7esM3RKdCkk8QRV1KJNRnx9iuIHWcXVWE4cTzyTo1xIqwepADnoYvsOZTHPxjq1
 F79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469577; x=1705074377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzfKYNH1/2wbsF3ubLhxzVujUnJw+6X9RP1nI43IQ80=;
 b=AUiW8IKyrCJrxJIqs5KSaYSggJkGqliOHk3II4wN7wgtFlQeuwjqZOLlLKa1gkGfwt
 3dmv/SOFWrn9DE0IsvQc2U9yzd53iw/34FM3oTRBO0l/Dq8FENX77qvdfqauilzFt387
 A+FAhFna2XFSf5RdYYQOiki35DdF9RougBwGVybb4broRDG9DLxnhoJ677jPrAWbcT9E
 bXUrllQ90+J5FGcQBnnKzBcaVpPKBH5vLo+pehVUQJV9rgW4oJbe6rcSrTbqFhZealBp
 gj269pgLEmIGBiFVToqlEOPstPVNzpP2hUgxFsWRuZLLBIh0NnskAPcVhjpMkY8R3qOG
 IztQ==
X-Gm-Message-State: AOJu0YxxsDirRU+eoDMmsS7h7ykdHCLVgJdt71lAKrPX1NnNihX7MYHO
 WtlXK2hNNaX+f0e8Tq6Xt2cMda5J4XXiwTlHh4qPwSEmRIo=
X-Received: by 2002:adf:f552:0:b0:336:b9b3:f554 with SMTP id
 j18-20020adff552000000b00336b9b3f554mr797130wrp.133.1704469577055; 
 Fri, 05 Jan 2024 07:46:17 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 y10-20020a5d620a000000b003372befd19bsm1607838wru.104.2024.01.05.07.46.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:46:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 28/71] hw/arm/virt: Hide host CPU model for tcg
Date: Fri,  5 Jan 2024 16:42:21 +0100
Message-ID: <20240105154307.21385-29-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6iaLtMmCzWrN

From: Gavin Shan <gshan@redhat.com>

The 'host' CPU model isn't available until KVM or HVF is enabled.
For example, the following error messages are seen when the guest
is started with option '-cpu cortex-a8' on tcg after the next commit
is applied to check the CPU type in machine_run_board_init().

  ERROR:../hw/core/machine.c:1423:is_cpu_type_supported: \
  assertion failed: (model != NULL)
  Bail out! ERROR:../hw/core/machine.c:1423:is_cpu_type_supported: \
  assertion failed: (model != NULL)
  Aborted (core dumped)

Hide 'host' CPU model until KVM or HVF is enabled. With this applied,
the valid CPU models can be shown.

  qemu-system-aarch64: Invalid CPU type: cortex-a8
  The valid types are: cortex-a7, cortex-a15, cortex-a35, \
  cortex-a55, cortex-a72, cortex-a76, cortex-a710, a64fx, \
  neoverse-n1, neoverse-v1, neoverse-n2, cortex-a53,      \
  cortex-a57, max

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231204004726.483558-6-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8b69aba189..8b060ef1d9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -220,7 +220,9 @@ static const char *valid_cpus[] = {
 #endif
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
+#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
     ARM_CPU_TYPE_NAME("host"),
+#endif
     ARM_CPU_TYPE_NAME("max"),
 };
 
-- 
2.41.0

