Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp243388ejk;
        Mon, 29 Jan 2024 07:19:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHcmpBtnZpEDEG3bSALQ2SfSrHnAf9Rn0K2h9LDo2fcQo8Yy/EKS1b5ab8p84Xgc8aDAsJ
X-Received: by 2002:a05:622a:15c4:b0:42a:b036:e094 with SMTP id d4-20020a05622a15c400b0042ab036e094mr528480qty.91.1706541580670;
        Mon, 29 Jan 2024 07:19:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706541580; cv=none;
        d=google.com; s=arc-20160816;
        b=Ey+ZhR0YcbsTuJXhn+0XcNtl0sDy+bqJWb843+ceN0fUMJdx1RQq6fM8LLPwoVz9LO
         F7v5J6T4Tt/1hmhfrQ/kGPPcr9hJbWC47cMaVB5fTW+gbb++sVaHF14kA4fkkUoyYIvU
         MbF1lhlnUE9YYJ/eQWSHFhwhaoaguduaN1FxqjCWomq4gXLxHPcDmDr+IlsG3NudMI+e
         MnjXrorlI0BJ3q/BWP1mSm7Ewnbz9n43ZO+xtNe7sVDNDTMWj8fNCvkl3uCaxGHRGsqy
         EE8cHPenTp+IGy0zOd7u/2orzu+rT4uJBbwVdJ8fxEiwR6LOm2c8CKnsFSVN/rN/wmEm
         5xsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jC58YmpOm3xZcOtP9AEc7xhs85+MVmwSSZ2Oh6qeQAw=;
        fh=36wJ/nYrPLZmRQQgalgeL37C59AM5Zbikh1oCIbsvWY=;
        b=N7uXG1J9DzGXOIZ6G3y7gxyMTm6CCJd4F3GAy+CeHNwzwTS7QPLKIpNve3LIgSCm3u
         41Gq/5VlY3Fn23Gr991qUhYeNoEduaUYVuTeinHORpfQti7w3wYV4FhOW9l+hlJW5/oE
         bwxzIy67iDUUCmvd0o3AN0XHwSSs1O+1tbB+8Hp2hKz5tHeFuHJjBFMK1CltinPHvBmr
         m8+qv3simi8H8B5HX9rbBY1zhih4W7q7w0pxUZ7onN9s8KZluMX9yK65MEHwr7UUE+8Y
         3sowEg5lxrN+txN2YAEq1ZPgj8n7yagNe4G+EJ1L8JsOmOraRgsg5OM2VnRkW9m9DBks
         J9NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SvNVlvaK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14-20020ac85dce000000b0042a67f2c590si7659684qtx.750.2024.01.29.07.19.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 07:19:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SvNVlvaK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUTPf-0007Yl-K8; Mon, 29 Jan 2024 10:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUTPQ-0007Vk-IN
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 10:18:54 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rUTPP-0007Rp-2r
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 10:18:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33af3c7ef60so507679f8f.0
 for <qemu-arm@nongnu.org>; Mon, 29 Jan 2024 07:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706541529; x=1707146329; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jC58YmpOm3xZcOtP9AEc7xhs85+MVmwSSZ2Oh6qeQAw=;
 b=SvNVlvaKbHPd0DMHsuvn3DyYp/g1jZwlBJMNaocTvAkQxkA0txbZ7h0fwqWWLed5P9
 XziHd8/Os9rIEjRe4oEp/SOLcOohIPXLwB+G1ypXXjn+iWKV7xXiSMernT/S328E+l3o
 2JHpswy4CIdzLtLhoxDFB4x0dz79UhajbEYB0rBHsZdlAckv/BYfNIC1aC94/o8Kv4nW
 J98W0FjV+qS3fw5+HHYFBGi0yBH7AOYrn2xifNaUh/POx87GxFm6dn8k0nktatmbyZCu
 AbjDRtokYe7Mz4g1OPT1ub1iCT3KDp35gel0jNMKnml561ZqbK6A00z/E4SWpV9sfmKq
 5GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706541529; x=1707146329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jC58YmpOm3xZcOtP9AEc7xhs85+MVmwSSZ2Oh6qeQAw=;
 b=ZAdcDWxQkLkG8DtTAUkJagP3ze9V7RfzvInUb5WYVKuRVp07eZLK0GDwJToJNGBDxK
 wSMBehcTv0sKIDKBIgxV2Nn+x5iSk8M1SCPP85572n6/0iR2+9lmNh0BmhK8ew7nVTiJ
 4tQQgKvhVBlaTThsQqrskqWX70wI/xb6FpZOKbsOvxkDSnXjp/E7FOUnsXfAeCl+iIaX
 NmmXWDrzO3LOmPbUp8tOf6zY8rp050bTNPhndMvCOI/GnggP3B0ZtpKD5KzdvmXMqR57
 DS9/ed9p2aC38hBuns5p9RQVdl8wVL1wkvEsYEyIoyXAro6mT3jxiVR7XgGsb8K6pnLc
 PD6w==
X-Gm-Message-State: AOJu0YziqlxzOb7jsVVy8vhGdZzFtDd2IuF+oLI1/x5LB72UvMWgiCMw
 smRt1vV8N7sfOIMw82FS8THaY4JBCQPFNu+6l1ahq7rA9Ng9wwP8AWFV8SLDK/g=
X-Received: by 2002:a5d:4fc4:0:b0:33a:e2d3:c3ec with SMTP id
 h4-20020a5d4fc4000000b0033ae2d3c3ecmr5192736wrw.60.1706541529826; 
 Mon, 29 Jan 2024 07:18:49 -0800 (PST)
Received: from m1x-phil.lan ([176.187.219.39])
 by smtp.gmail.com with ESMTPSA id
 en8-20020a056000420800b0033940016d6esm4250778wrb.93.2024.01.29.07.18.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 29 Jan 2024 07:18:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Tyrone Ting <kfting@nuvoton.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Hao Wu <wuhaotsh@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gavin Shan <gshan@redhat.com>
Subject: [PATCH v3 3/9] hw/arm/highbank: Add missing QOM parent for CPU cores
Date: Mon, 29 Jan 2024 16:18:22 +0100
Message-ID: <20240129151828.59544-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240129151828.59544-1-philmd@linaro.org>
References: <20240129151828.59544-1-philmd@linaro.org>
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
X-TUID: 4lRt+cbt4VLS

QDev objects created with qdev_new() need to manually add
their parent relationship with object_property_add_child().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/highbank.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index e6e27d69af..b8d702c82c 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -209,6 +209,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         cpuobj = object_new(machine->cpu_type);
         cpu = ARM_CPU(cpuobj);
 
+        object_property_add_child(OBJECT(machine), "cpu[*]", cpuobj);
         object_property_set_int(cpuobj, "psci-conduit", QEMU_PSCI_CONDUIT_SMC,
                                 &error_abort);
 
-- 
2.41.0

