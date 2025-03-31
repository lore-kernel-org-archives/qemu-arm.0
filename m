Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2411636njd;
        Mon, 31 Mar 2025 15:13:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDkU+T6QW31t3qmgew6GKVcU3COs1XSPMLeq0v8KlZoJAXOtmF1fRwV3gHXrhVSUIzwfERfyW23H+KDA==@linaro.org
X-Google-Smtp-Source: AGHT+IG0UHVenAjTQcLUvbSnhhqkufhCXe4SHgCHQ9bWKWW41lnff6ENjm5s4HmL898mHxBM6rQ5
X-Received: by 2002:a05:620a:24ce:b0:7c5:48bc:8c77 with SMTP id af79cd13be357-7c6862e5a34mr1613938485a.12.1743459215308;
        Mon, 31 Mar 2025 15:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743459215; cv=none;
        d=google.com; s=arc-20240605;
        b=CHAwwgOynZWtFkqidwv2ByACr/ayb9lRgh7fUwAOOC8T5QUnYjmwrcVk2CxkdbiXS+
         NNuexCfMQSNRQNcFmBQTPniA1WPUga0B7/sX7LFCh+AOet4ZQqwm6Yq9jtIAtJOgfh7k
         ZDujpmOsxw7pc+v2y+MVq18We7q3jt246WSAjnM2JZPctOQg+18OcaTEiQ8OIEHwAf5n
         f3sHqflcIUKV2FwA0AbY0BCTOn6aLDB6/KJPY5Qj2EpK534LcSqZqBZz/chiTWgCZQch
         xRmk86DtS2+tE48AwsIMifk1MUGRJWzHexnnnHpSwg31t1a3pFmtn2RvwE/q0/p1N1oQ
         JrTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=esZKfQmSZ/gsBmw6ndgWUyspYCTEzTvWG+1YHzWaO8Y=;
        fh=3+dbA+4eXEkCqOaBNG/iGKOO+wzO6HJBeOltTjV7f3w=;
        b=jAxYeVzkXi5HfcDZtiDRk+vGXSvpKyJ9bSw0ZNqJI7RH5FfvPE8IfidPqxOrtRGeHv
         8ItvLGYGDmcI4DxOFOvEz+MUuSJz/O95OeQbesNWQk0ez4cj03CKWFI5jMVCTAT1WBAr
         VcJAmV8HipgyOVL+c9TDYfJDCan6VvlcugsRYd1uhVfi/A9vXe10qdvlib9K+i6BsCJX
         J+TeTD+eMaZVHEmjkTmeyIYT3qnnNqEtS4e3pRaFF/eeKoERqHa7EuYSx9/cuOQiicxX
         xKpdsJog9BW5U5sYXXk6LJ9PfnSuOtQS1gI7pCXXufXRyRZAkDQTgoTaj3dTgtja7OMm
         dpUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVoCxzsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5f7769563si744436285a.242.2025.03.31.15.13.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Mar 2025 15:13:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EVoCxzsK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzNNU-0000e1-Tk; Mon, 31 Mar 2025 18:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzNNT-0000dH-HY
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 18:13:07 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzNNR-00077V-TL
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 18:13:07 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so40123745e9.1
 for <qemu-arm@nongnu.org>; Mon, 31 Mar 2025 15:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743459184; x=1744063984; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=esZKfQmSZ/gsBmw6ndgWUyspYCTEzTvWG+1YHzWaO8Y=;
 b=EVoCxzsK3NiAhYBDTsf4sRxx5mqWAoYgXIaLFCkq5/o5AXMCFBQAhCLcyKN5ayLqEj
 33V/Xdta48kkYAdNVBMaWpcyCqZC3H9gYQIP4ZhzwEdfhYR/t/kcWfqtF2kWVlmjguYE
 wkxw0/hZcbdzCeK4C419hnvkO9kqTYoWOgVTwwfqw6OrqNN6CH9nylINX1h/rqbYpDxK
 oK4kyMB6DN9RN4FU/dXI9yp7KJrOGRpIy3vH6YZGFPRLtxEJH5oicjmOH9hvftVO+JAc
 b8GszzqbYWNHCDL2tL9TksfTG4kgGXSCX4OcClQMR/7+0ftUeuuiH+bFfmFbUod46bns
 M4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743459184; x=1744063984;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=esZKfQmSZ/gsBmw6ndgWUyspYCTEzTvWG+1YHzWaO8Y=;
 b=rBE35Pksp1aejJmg1dDshis5+e9puKbwt4MtLcRbjz1yWG0/0E/ZICR6Sb5T17alsI
 fWxnk/m5K9RFdj8f+rd5ykV69MeKFCWd6uYlf4zKLCio2GfQbY7S+TkO9x7jpnZNqe1E
 cgIF+/+7E0CXQL9Jpe3Ek+rRWw+q7WTClA0TN9OxPq6b9UXzI/W431Pp98qJopCGSagg
 anw7fH7NE3otNrSBJw8t+Mj6K5ePIDxmgaL03COqvKmk5xSnQRnFCkp8kaTSpAfLtwub
 S7ZW+nChs4V5JiHhmAwaMkqWp6v2UcU55DI66nWaCm2uu+V08goUxRSd4mzPQaPn5P7Q
 4GIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF5RuiI1osB8Lk40o7zhChKodFMhTILe4++hysYK63AcMqRgenLXGeIhe4ysN3t2cgUzrwq4dEwg==@nongnu.org
X-Gm-Message-State: AOJu0YyrCeucWtobCXslyLXk5GMemzIOftgDkgJLMVuhgzv/r9JrgGHb
 yav9jZ5OC/MDhxm4ZbVa3I1/uYg84qrWUjuGuDrxDAQ4tk2Dfsf4tPdg7RUcfQs=
X-Gm-Gg: ASbGncsgVTq2uuuedWMPKCeBQdrUXubT1+h0tfCiBHHygy2sL2kF5Cc97p1He0jRDsz
 qn0Aq3Xu+tEIrvmVhyB4js0Fv+9efXngRWI1GSMp3vE4b5UWPthi71C7CvXHxR3S7Zh1ybMs38H
 lN5jHhJvybB2s0WS4ICEWcReq/6NLUyw5AetlHLOJvV/kyOFj8SRWUFH2g5hLUciNI0lHIK6wer
 4J6GK/Qe1dEKXEztPLBMJ98mYLH9cp5+/v5mlDNlTjM/2q6L9K8wvmtCz7JIL+agTyj7pHMW11I
 L1IGmfVoeQ+SRAZiZ6+yNsyZDbZocuLjgJTlstMONTVs+eWvpY3SfUhU+J9ZiN7E8WDFsy9/e79
 9cqShl9WZsYu8XKyfRNo=
X-Received: by 2002:a05:600c:1d9d:b0:43d:1bf6:15e1 with SMTP id
 5b1f17b1804b1-43db61d894amr103198525e9.1.1743459183777; 
 Mon, 31 Mar 2025 15:13:03 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82e834a5sm181906515e9.13.2025.03.31.15.13.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Mar 2025 15:13:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 4/5] hw/arm/virt-acpi: Do not advertise disabled GIC
 ITS
Date: Tue,  1 Apr 2025 00:12:38 +0200
Message-ID: <20250331221239.87150-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250331221239.87150-1-philmd@linaro.org>
References: <20250331221239.87150-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: z4rGHjxxYFDA

GIC ITS can be disabled at runtime using '-M its=off',
which sets VirtMachineState::its = false. Check this
field to avoid advertising the ITS in the MADT table.

Reported-by: Udo Steinberg <udo@hypervisor.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2886
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt-acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index fdc08b40883..b26f0ac8585 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -212,7 +212,7 @@ static bool its_enabled(VirtMachineState *vms)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
 
-    return its_class_name() && !vmc->no_its;
+    return its_class_name() && !vmc->no_its && vms->its;
 }
 
 /*
-- 
2.47.1

