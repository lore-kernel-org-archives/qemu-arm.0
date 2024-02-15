Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp735347ejb;
        Thu, 15 Feb 2024 09:59:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW9hcGpg46leYz0wfZlGLSe5q954Io9tYzH5+zcZ+1iJZPei42CuDt+peYRezKEdiJL9QtqNqFqBps/RmAGtkAVGQfAv/20
X-Google-Smtp-Source: AGHT+IEOOPQJd9vCBOz08Qf69Zt+OMO7m1wWnca5nMV+TtBwyPcr+ws4QAF/BhXkgwf4FAXjPA51
X-Received: by 2002:a05:6808:1646:b0:3c0:395e:fc3 with SMTP id az6-20020a056808164600b003c0395e0fc3mr2624027oib.28.1708019986331;
        Thu, 15 Feb 2024 09:59:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708019986; cv=none;
        d=google.com; s=arc-20160816;
        b=d3uUiliY3FCw5YR+0nNwCkENs8MzhbViB+pEZrMDNxoxoesxkwhuKI+JMuG9Hf5Ujf
         Pm6evSy+dALo97ugnoqWk5kNKWKYU0gQLK/2efY2Eudi+Vd3Ye2O68LrQSHubkgpl35e
         N4Mw6Bpk2mb8URfSZsidJsY8sjWNwIQYFwMaz7rWTSn2pWTgFnjH5y4TRm52hYfL4FaE
         Rlo3zARwVtF4AQUzXQFZxUQAXNkFocXg3i8cD7TD2aKQJPFXrAz1nhPPZMoo34a0+i6y
         F1lmy3vIC8v2kb+7CfflyGSthKupB/7zxM+OSOHlX6kWmJjxIyrTpGbpSCx1QzlsXbXZ
         OKlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yChT06qqS/oR/UqktZBd9s/sYDht+XeML6XM2cVxcUo=;
        fh=QlZWhvZ3A8phpS1YzM3ibxTGvdmrYJvDUL/4mCzDBQw=;
        b=Gt5Xj2Pmh8ebr8LjqyQwYZQgcnFP0zAyMdjMMjTJT93fYV2iA9BObsx8TW1PkOuEca
         eII4zzpQVj79G0/pp0Cx+DUd01o4EIhHQZfURVCawp+PGb/KbuQfvs8Q97PQsMHnrEWY
         sVQym6eaHFqlxb0I6pIlhAktl5ZbpzMTV7YML/qN/F9Dgi0nIzoRB2LDBD+ofwXpO9eO
         5is6gvFEda/D2AwYQGKIdO5o4SiCxiKUgJ0bZJ5ZoPMYf7P38dqtfAfjNHVEUqFRFtHi
         2Fpmer4Yi0xaHiq1zf+Yob60dLSIKb3vMwXFVqSnvfBz3iPhe1+AVUR4DqaJ7iNSk13g
         UriA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s0LTadxW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020ad45baa000000b0068f12128636si1918768qvq.21.2024.02.15.09.59.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 09:59:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s0LTadxW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag0s-0003uV-M9; Thu, 15 Feb 2024 12:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag0s-0003rG-4r
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:59:10 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag0q-0001gn-52
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:59:09 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d0d95e8133so14604151fa.1
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 09:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708019946; x=1708624746; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yChT06qqS/oR/UqktZBd9s/sYDht+XeML6XM2cVxcUo=;
 b=s0LTadxWgdGGcm4OR5WqSXjeZB3fvYXLUVhq9E8nnUdLPqmvAGEAWLR8S3+GY+cju1
 Jub++tGYY6pTMCGPn2WXNAdSH3Ve5YAvEM2Z/aQ2GlZTJcmw4oHL0cKn6LWcbHIXZoWn
 8eUNA9tLCqrcLML/lOziAxohLVxnJKKXMsdN3lvRDqca0oipj/hdK/dY/JKq1ay4slXk
 2aZnCtGV0uhvOTwENeaTOLK8wCsO9hdQh6dYunXXno54fvSpRET476MhH14qkD8eCJie
 CETFALxFEUdjInuzbrWniL5iAPPMqA9X2dHOE75p4QA4mPXfjVa2CuktBDEFrf0dmDXe
 0iuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708019946; x=1708624746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yChT06qqS/oR/UqktZBd9s/sYDht+XeML6XM2cVxcUo=;
 b=obZSDkYOpacc8bdOHsCF4oNYL1fMTDGQL/F2O+gJ4IwkoXhGbhIblVYW7JDrX+JWJa
 /xzngmaMqc60/FCstOPWbs7n9LWDx46Ug2scnZ0xYIFvyytgkoSJNx4buyIaAczODk/Z
 ajQXDB5dXzNaaUfiiMz5+wAQNjRazU+VbcfJIWPpmVcVgPyoA8yHa0iOA9SupCE1GDvU
 0OuOkNHYE4XMRajz+v2lCexoGg100/81zKfTjhhCQmHB5+GAya+kf7iQF41FT0M9wjJA
 TKApBMTcJHMBGKZVrOT1CvpgOOLgAq2BgLOSK/zGwqGXKLuDqTIrKQGQ5N3S/Sozs4ii
 OJpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWikME4NkAhVqp5hcSL608P4mgKTRBKgqbsO3Hb1fe/5eLYYwgZV6mE+FdadIMP4WsMER7TLkDVBjbtO6S6ykwBQbU/
X-Gm-Message-State: AOJu0Ywjytw811WCbJi6MCJobihJE3N8u+L3ocgAHA0qi88xQXn5VcXn
 m4SBfnFFZy23y6Ij9FJaxGP74nVbNVBqTeYZPjfiaKmDp5y0vZuHC9jDxsrsII0=
X-Received: by 2002:a2e:7a12:0:b0:2d0:b003:95b7 with SMTP id
 v18-20020a2e7a12000000b002d0b00395b7mr1959454ljc.13.1708019946401; 
 Thu, 15 Feb 2024 09:59:06 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b0040fafd84095sm5636762wmi.41.2024.02.15.09.59.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 09:59:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>
Subject: [PULL 11/56] target/mips: Remove CPUMIPSState::CP0_SAAR[2] field
Date: Thu, 15 Feb 2024 18:57:05 +0100
Message-ID: <20240215175752.82828-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x234.google.com
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
X-TUID: ycknBotSJOzD

Remove the unused CP0_SAAR[2] registers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240209090513.9401-8-philmd@linaro.org>
---
 target/mips/cpu.h            | 1 -
 target/mips/sysemu/machine.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index ef1d9f279c..5e97b5b422 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -749,7 +749,6 @@ typedef struct CPUArchState {
     int32_t CP0_Count;
     uint32_t CP0_SAARI;
 #define CP0SAARI_TARGET 0    /*  5..0  */
-    uint64_t CP0_SAAR[2];
 #define CP0SAAR_BASE    12   /* 43..12 */
 #define CP0SAAR_SIZE    1    /*  5..1  */
 #define CP0SAAR_EN      0
diff --git a/target/mips/sysemu/machine.c b/target/mips/sysemu/machine.c
index 218f4c3a67..6d1299a89e 100644
--- a/target/mips/sysemu/machine.c
+++ b/target/mips/sysemu/machine.c
@@ -282,7 +282,7 @@ const VMStateDescription vmstate_mips_cpu = {
         VMSTATE_UINT32(env.CP0_BadInstrX, MIPSCPU),
         VMSTATE_INT32(env.CP0_Count, MIPSCPU),
         VMSTATE_UINT32(env.CP0_SAARI, MIPSCPU),
-        VMSTATE_UINT64_ARRAY(env.CP0_SAAR, MIPSCPU, 2),
+        VMSTATE_UNUSED(2 * sizeof(uint64_t)), /* was CP0_SAAR[2] */
         VMSTATE_UINTTL(env.CP0_EntryHi, MIPSCPU),
         VMSTATE_INT32(env.CP0_Compare, MIPSCPU),
         VMSTATE_INT32(env.CP0_Status, MIPSCPU),
-- 
2.41.0

