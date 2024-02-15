Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp736274ejb;
        Thu, 15 Feb 2024 10:00:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1W2rXjBSyfBJS2ieJlu4VLUp9STbwR21G2Qscb+kZKZKogQc11twLVCCsDLXJsdhrbBcgQPAHjhc0tahbNRERKGoh4wmS
X-Google-Smtp-Source: AGHT+IHZzA0HD6JT4zlwDDFb0rwFGMX2b7HxYZfIJ9MUE5u3wbtkakccY/OyEA+o7IyxYmMLSfz2
X-Received: by 2002:a05:6122:1b89:b0:4b7:49f9:c6f4 with SMTP id es9-20020a0561221b8900b004b749f9c6f4mr5266254vkb.4.1708020058183;
        Thu, 15 Feb 2024 10:00:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020058; cv=none;
        d=google.com; s=arc-20160816;
        b=non/hRg7zNMQd6wuV72vZZzelt/K+qjLXZY40DsC8Hx7Jq/ijw9DcHmu6eWafNNCwC
         UscnRa9XmgL6bt4qEkfZtKZYKrBLkxvoEW9Fnl1KIvwNj8sn0KDXWAmFsEQMwhpWZBWM
         46Vp6lW3Ul48pXxK61WaPfYPaSUYOk0tN36Fw4MmMqhyocMsr4sy/WPXOA4E6mldq9Cp
         xyc/EFv+CN8l0UmyKQXBlwNuH0RxfbjLScCoyI07CQz4ajWQ5cLa+62QUZ3mETg7VpV0
         ryWd+b7Iu2qMYSiuIhOKDfNffCDFAZnRyGDqYXPOn6PjlwPvesXd7izwhKf7Eb0BZOGb
         /PsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sZSw2YzJ/MkCqct1l1ey2O6+43vCJeEZUqJNCv27UXQ=;
        fh=DfaQvLTBUqb2ENBgjw9mmEy6GkgY5sdcva/krOQG0xw=;
        b=YkXLpCa94/UdyYHSK2D3KlyueYOgXa4cPI8JCw8sfQzmE9ZBihfdLrlTnFsXkLYC55
         dnGp8jPXk5ErjgWhCTe5CTYfo6SaYtJkHUHCdDqq6zvTozPMiZI6DSw4AHpdG/Dlkjzu
         xED9kUBRAZJ8nuV1DD2QRjQyRcOUsP05223uHH5nQACQOnTdMD7ZLVsz2p1CjF/M98+U
         TKIO9Q8WSKD7c1Prtm0SPjsaoPq8LpXKrkqPEyQw1SxVsQ2SR9f/SDd8Jn/WyCTc/hLa
         mAkFvDTuGL6V/Og5W1Rc6IflxcV33aDDWwml6UzCUSxE6nkUABkPzYytYCnhXqbsw+1L
         C+dg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qZ+2VOCF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id in35-20020a056130612300b007d67db9eaaesi441596uab.183.2024.02.15.10.00.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:00:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qZ+2VOCF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag1T-0005D7-2z; Thu, 15 Feb 2024 12:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag14-0004Ww-O6
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:59:25 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag12-0001l5-Pk
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:59:22 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-411f895c8b6so9989115e9.1
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 09:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708019959; x=1708624759; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sZSw2YzJ/MkCqct1l1ey2O6+43vCJeEZUqJNCv27UXQ=;
 b=qZ+2VOCFyAL6TebQt2/Cq8snCNo1d5stp7M2EkQofuXexC4QQNx5biV7jWG+1kK/Zr
 bTxqYqj0vHRkhiBWKcIQa0NjoRQbgteHH7tKohkA8eoowGEdSINAihe5JynFKFkOpPTN
 2aOo3gFVTXE22Lfr2xeaSZOtjT68SSOVNIo4Ygla4cRFFd+gvLDuBMu/3/Hhxf3lS3s0
 I6MHK36hJYTyjKnbErSUuDGOGJzta6Mwmf65aDsIwQx0NkXPDb6RCwhWiFFsZcDM9GwD
 kSKEMNbqQLB2HOJOsEh7EbSCkIPcCBS7M7zYqrFD6bfH/WS7b8YfNUl/P7H+vvRTALR9
 NqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708019959; x=1708624759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sZSw2YzJ/MkCqct1l1ey2O6+43vCJeEZUqJNCv27UXQ=;
 b=muqPG+VYdGyh5csS1vnD2EVvwEZNMgVauRDSsizF01w7szomJLd1mt4cS28poLjz+t
 bCThltg0syvRar7y9SP4OafICfNNAh8BIP/EP6TSvdJULXc+UZK6PbibisB7isPhtDpc
 O7lzeRF2MdkmJP+GFPP7rK3JzkUzAy/VpTtA8zP98ucIy9vLpsNT9G3tojNb3B2KTJn2
 JjIbO5x7wc5qe1RNBv4Eha+cKaQMncHckD4p13nf/9G+c9vqfxjJiA2Nr+MJPkoqtvNU
 ssLGYdce1hSOSYzIMocgbEcHdCFOZmAh4PthTfpBCChvRFZKiU6vOXVrDHu2AkuAx92g
 8/aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5GLwRsp+27+p2Ee2m23O+NxexOywtkVgSFLipYFUDV44xK/NacbreI6d1MAN4L+6N0MFwA9s5blhaNM2RRAxI5x5U
X-Gm-Message-State: AOJu0Yygk/UYBMfhvQUxMwQWBo2FZ0FNka9hbHdOTiYIjr/M9wXtJWEw
 R1zxuc+egN17WO5dPZH4r41IL787VapP6KKoRBcaUIVCqX4rgmEd4v3VccEVmUs=
X-Received: by 2002:a5d:644b:0:b0:33c:e392:14c3 with SMTP id
 d11-20020a5d644b000000b0033ce39214c3mr1887111wrw.47.1708019959294; 
 Thu, 15 Feb 2024 09:59:19 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 az7-20020adfe187000000b0033d01fe1f04sm2519246wrb.55.2024.02.15.09.59.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 09:59:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>
Subject: [PULL 13/56] target/mips: Remove CPUMIPSState::CP0_SAARI field
Date: Thu, 15 Feb 2024 18:57:07 +0100
Message-ID: <20240215175752.82828-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: tgXWMnOewWHJ

Remove the unused CP0_SAARI register.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240209090513.9401-10-philmd@linaro.org>
---
 target/mips/cpu.h            | 1 -
 target/mips/sysemu/machine.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 5e97b5b422..7329226d39 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -747,7 +747,6 @@ typedef struct CPUArchState {
  * CP0 Register 9
  */
     int32_t CP0_Count;
-    uint32_t CP0_SAARI;
 #define CP0SAARI_TARGET 0    /*  5..0  */
 #define CP0SAAR_BASE    12   /* 43..12 */
 #define CP0SAAR_SIZE    1    /*  5..1  */
diff --git a/target/mips/sysemu/machine.c b/target/mips/sysemu/machine.c
index 6d1299a89e..213fd637fc 100644
--- a/target/mips/sysemu/machine.c
+++ b/target/mips/sysemu/machine.c
@@ -281,7 +281,7 @@ const VMStateDescription vmstate_mips_cpu = {
         VMSTATE_UINT32(env.CP0_BadInstrP, MIPSCPU),
         VMSTATE_UINT32(env.CP0_BadInstrX, MIPSCPU),
         VMSTATE_INT32(env.CP0_Count, MIPSCPU),
-        VMSTATE_UINT32(env.CP0_SAARI, MIPSCPU),
+        VMSTATE_UNUSED(sizeof(uint32_t)), /* was CP0_SAARI */
         VMSTATE_UNUSED(2 * sizeof(uint64_t)), /* was CP0_SAAR[2] */
         VMSTATE_UINTTL(env.CP0_EntryHi, MIPSCPU),
         VMSTATE_INT32(env.CP0_Compare, MIPSCPU),
-- 
2.41.0

