Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp133939ejk;
        Thu, 30 May 2024 03:31:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0MXPKdEcK9qxBJGMnfN5g9FFC5uzViq7o9dO2I3daflnbdARFCQtt8XOAg/4pgdLUu/ZvrG1hl/hyY0KfpWeOfNVmDITu
X-Google-Smtp-Source: AGHT+IEYyREQdbdDfUrR+kyekul2mz4rnwzTsIaY94V1czRVbGGowV/RkhFGIoH9Y9Tr1ZBxyv2/
X-Received: by 2002:a05:620a:25d1:b0:792:643e:ee7b with SMTP id af79cd13be357-794e9e22371mr192272585a.49.1717065064745;
        Thu, 30 May 2024 03:31:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717065064; cv=none;
        d=google.com; s=arc-20160816;
        b=fjfwxhnAm443NirwzbPdEbl8pMcpqbBmw2jy8zH8R9XtbluHQiNvtxKvdrkZAU9wTt
         2Rjffa9nmAS2M/LkIaAeaeVhKMtHjaQv0TuejxiBgP5XUYAZNptGA2KkGVTgtgOY7toN
         TkzD+Ftr/77t/CvUxn+5ZlyTWFmlibIFOwv8M+6lrTVPQ6V52fpQ7iM4JjKPhNxISRbb
         d4Vu2NanpDTfOI4hfXfC6wRg8rTsETiVI3PPAshhGTCcoEMyJ+lnTWrY4Ag0K2K1MyC0
         qIdC/KBkxYpIjsPvHGxHUdUEwalniBTII9CHyUtCu7BaxyD6/JPA1OdGgwPVfBKnRZep
         x2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jt33+swSTK2dSEH23iCR5MbnCc7IK5ESWO5qH12q7hc=;
        fh=O6ab3YHMRL8y2jWRWdlOhditeceATFdb92T+GHlu1nY=;
        b=t4wzYSSTyyCKNZ55JLYj48C5Hd4GAUNO46UwVPVhNa6ycdwiU3dOZHrYgO4rMeTeAG
         xmjOsLUMHqbF87tKc/tQCKqEnFwYvfO84JbpEi/Xknh0mKE+aNlwigOkAO+mXJo87WjW
         elp4ey9wUZaz64VQmriPy4wHpofiptUEfvacqRscW3BOFSRDsTIyAAR37lC5cRZOVXnp
         6Ic8Lkwrn0Z5F7RIsiJqV0h44iW9FeveFcT3fN6DYsl7xCEL9IB9UyWn9VEamRXApAV1
         AuTeD86Zf501COjOa3TvgvLmPfZzBtIgAEQFAH5YvVkpGbrx25um7+6Rswyw8H9qb2/8
         w1Cw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nO05KcAz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd608d2si1458189185a.757.2024.05.30.03.31.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 03:31:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nO05KcAz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCd3G-0001GC-Ay; Thu, 30 May 2024 06:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCd39-0001F6-JI
 for qemu-arm@nongnu.org; Thu, 30 May 2024 06:30:28 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCd37-0000pt-4E
 for qemu-arm@nongnu.org; Thu, 30 May 2024 06:30:22 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57a20ccafc6so483085a12.2
 for <qemu-arm@nongnu.org>; Thu, 30 May 2024 03:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717065019; x=1717669819; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jt33+swSTK2dSEH23iCR5MbnCc7IK5ESWO5qH12q7hc=;
 b=nO05KcAz+D5+jH6bMZjGY3++VnxcV3PmLnCQvLe5h5RZPiL9pJS/weEqifcMQI2Blt
 kMueb3fiKyHyfqhkb9CBTPvbKmdYKEnsCC71i2JevBLcrTD2yma8eFu+zX4X0pKWHrfh
 FgY9GZE5ecvyUSxk19uS1n4PQ3WebEQviuu4fJlsA8ed5UxK1n+gnND2Pi+Buu6btAQP
 GzwP4bY+azbf6GBClHyR02OHOM2CKQYsAtsFPsLleSvkUyAKU5dOV2wjOMyoUFbw8nLr
 /7B4PW6aqAI9yTDQuPC7EkK3AaDWOD3+18QLeQQXDlRzWhT31p4SZ5nbywHW/Ik7/9sJ
 wcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717065019; x=1717669819;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jt33+swSTK2dSEH23iCR5MbnCc7IK5ESWO5qH12q7hc=;
 b=m6rO0JaqQYQfP0BFjIEEH6LTsCBqzTYhPSY1LaPaaURYdQf6cfZdkDk4STe5ViNVzm
 orOf3bctTDs3PQ8annQWutBiO9XFTdaTBKf5skpXHLzI4KyCmGdyRDIcMY1UvgHlGGz8
 HOXPclPrSI3GiOUHbmfeqm9Jnhk+D4RN9fyjWLN8MDU5we1BIf4lQnI31zNFXo+YMGcM
 gXEkVN36i5tcCa/kc5sCKnt9QH9dtdgc1W6evDioGi9o8c3pulNlHNVWmt7O5fd/Syei
 dIJrHsAZgvACAKxDCi47iDw2roUM0D7LaL/p/gyeT7q017Fku+oRj34brA1Mi4fHYDGk
 TzzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVdJnQRq+gruEUjWfIuDlhmMt3vv+BJwH36u1s4mFeVfS284AcQoPoeatUMZfDQuvLNI01RiezG+moxlLaNvDgcIkJ
X-Gm-Message-State: AOJu0YxVuDCPL4GboiPagDGK3QHdZZBZ4Z4wRuEaPSeJCwgaxbM4rGH1
 u+CZFKJ0MXx0vx+y9xoG0h3QfgJUK0Gb2QxTGYuWlR7BB2JMG/h2IOjUv5rBY8bpuR5mrZXg24f
 0ZjmIipZCSbmlOKEn446SkfxrOcJw8gGbn5SgFsU5UI+1MGCA
X-Received: by 2002:a50:9f2f:0:b0:57a:23eb:13b3 with SMTP id
 4fb4d7f45d1cf-57a23eb1421mr607671a12.12.1717065019278; Thu, 30 May 2024
 03:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240524120837.10057-1-sebastian.huber@embedded-brains.de>
 <20240524120837.10057-3-sebastian.huber@embedded-brains.de>
In-Reply-To: <20240524120837.10057-3-sebastian.huber@embedded-brains.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 11:30:08 +0100
Message-ID: <CAFEAcA95Vnz4kyBeTNZWJoa-dmxTnijteFrDzMUqHhuBvmHcSQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/arm/xilinx_zynq: Support up to two CPU cores
To: Sebastian Huber <sebastian.huber@embedded-brains.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: L3SfWs5U0EKa

On Fri, 24 May 2024 at 13:08, Sebastian Huber
<sebastian.huber@embedded-brains.de> wrote:
>
> The Zynq 7000 SoCs contain two Arm Cortex-A9 MPCore (the Zynq 7000S have only
> one core).  Add support for up to two simulated cores.
>
> Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>

> +        DeviceState *cpudev = DEVICE(OBJECT(zynq_machine->cpu[n]));

You don't need to do a double-cast like this, you can say:

   DeviceState *cpudev = DEVICE(zynq_machine->cpu[n]);

(I'll make this minor fix when I apply the patchset to target-arm.)

-- PMM
