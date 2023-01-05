Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp357599ejb;
        Thu, 5 Jan 2023 06:44:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXscfjBAOaExBazTgYqtOUu7R018101OxHrOMRp+XSc2imG5+T85GxxA/e+QAyMO+UaUNyYp
X-Received: by 2002:a05:6214:390f:b0:4c6:ed83:9f7b with SMTP id nh15-20020a056214390f00b004c6ed839f7bmr77416171qvb.30.1672929872751;
        Thu, 05 Jan 2023 06:44:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672929872; cv=none;
        d=google.com; s=arc-20160816;
        b=Y9zU6kbcxae0VgYwv9LasnalKtqnFnqcPKb2y/FlW0amTY0DF4cIH15gleIdoy4dov
         J4hqNZuJt88eFcI4D/+Tk9m0hnuBGJWmEeIQ0siY9PBeKznlWzAYPW79cSDKvdzj9IOL
         LqJZMEKI0FzuREmsUfF6vV+SmlF3bGz/m6fENJ/MLtLF1wLbUK2XdqSsYUJj9iWeYVOQ
         ZfD5AwtinZl/cnC0RVzxtJe7p1Il37762Lj96ViB273rOTjPkwGFYcSuQclgvARFWpWg
         gGxkin/1+/4UAKa4l4l5VOr9NlGp2L2hRC+34M0wXK8mB61iCsUtzvi4jKoWYAECtg1U
         lEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3QZrlP459/zsHdl3hgb/XluW5OwPo5HLqJ99CBkBggQ=;
        b=GQb3u22RCvZFr843KrIn6n/IhHRgpdU8nb89gqXJPx1dPhy7kaxhKRy3Uyox+LAap1
         bCZScoNL3UA/0I1KvchQfx/es/jFm9zDyP01p6exnKT46nJ0H9fqc84umIOb2AsiaW2n
         rvO4eUFMbB8VH63LGSLsziS7BL5mnpVQ2Qys+1zK6hEEaShep+N5qgjB8/dTP7rgcBAw
         hlPZWLMlEMpcpWlwYb6BYKilfHYhEvXx+/8pQSHemKL32wZYbwTSYenhSLJrvEJUgjmk
         BfPpxjovXj77hxCJXpScflzPg3cOpMIk1bEg6yigH6zDfLoX/P+xCosK80D3dJD932fy
         b7vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p8SmlzKA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jn15-20020ad45def000000b004c6e7ceb679si19277615qvb.443.2023.01.05.06.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 06:44:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p8SmlzKA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRTF-0003qr-Sd; Thu, 05 Jan 2023 09:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDRTE-0003m5-LY
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:43:52 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDRTC-0004NW-Gw
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:43:52 -0500
Received: by mail-pl1-x62b.google.com with SMTP id c6so6322945pls.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 06:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3QZrlP459/zsHdl3hgb/XluW5OwPo5HLqJ99CBkBggQ=;
 b=p8SmlzKAkEtZVNJH9yGD828p8+EUSYEhXkSqRhrrl6SmyDDuenovucI6wliMIBj1Yt
 srUuuUKgIhObweFQdjMogEsPR0qYYG9yUd8QeuGIBT3ISGw6/hKs2wzRVwmAm1JeF2jt
 fOt56pXLYKAqK2kG/F/H8Jv4MUL7JHgdxHLfW2s7K2m54WD/RhV0M0/eaWjAbxS/r4nX
 KvxsYhxnnb1tVdohqis4NkaEvevs38+obHNUANahDSYdOi2K5i7gWJW74iBf2yLyW7/D
 xyYkTzkfqNZ9TA0IGw8kMJQdrGOU4T3b186usEDvl8zebQwLR5mlgBzKCIsfdLxCySGu
 iwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3QZrlP459/zsHdl3hgb/XluW5OwPo5HLqJ99CBkBggQ=;
 b=TvxkdsjvoSwd8LBcBORkbtQ2kCCNe9dIvgoIYYX2qkkpevq8oGH+3JGxpsUxR4pbwU
 QEWDNN5GIaRQepsZDfcWlQKMSbhciQLn2EGSQ4mQsqo8DgG8vvp7Z3KFuQhmm9aGhqML
 bdv4MOaho/wrjHyur8YPPSw5mCV9l5c9iJicx9MCOgWcwWkO73avQBBRuu4cF/TH41Ts
 5IkJ66163BCedLTcf9N6cLQO9xS4eP6K8YYrwc2O/T0mxSdWnQvHNg9yvpMOHIMmus1c
 SACxcBqs47Ibdp/S0pcoQCJyXthyUV62lrdZ97KZqYXs7Sjv/s0mEWI/XaRC4K5RqlIn
 ppoA==
X-Gm-Message-State: AFqh2krpadOjb2gRkqLpyOdKU2UJ3UogHEPdrhuHnXH5hxikHcRp2nVl
 4C4jlNYXa+pvOmVnFHMpLzuWB2LAPt11UvvK/wU/cg==
X-Received: by 2002:a17:90b:3d0e:b0:226:9f33:76bf with SMTP id
 pt14-20020a17090b3d0e00b002269f3376bfmr721979pjb.221.1672929828963; Thu, 05
 Jan 2023 06:43:48 -0800 (PST)
MIME-Version: 1.0
References: <DS7PR12MB6309FB585E10772928F14271ACE79@DS7PR12MB6309.namprd12.prod.outlook.com>
In-Reply-To: <DS7PR12MB6309FB585E10772928F14271ACE79@DS7PR12MB6309.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 14:43:37 +0000
Message-ID: <CAFEAcA_Dwxqe_XAR_u9wOaAA-6tk3xQf1Az7SLcRKgbm6EWTrQ@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: align exposed ID registers with Linux
To: Zhuojia Shen <chaosdefinition@hotmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: SOOOFUblcHm7

On Sat, 17 Dec 2022 at 01:49, Zhuojia Shen <chaosdefinition@hotmail.com> wrote:
>
> In CPUID registers exposed to userspace, some registers were missing
> and some fields were not exposed.  This patch aligns exposed ID
> registers and their fields with what the upstream kernel currently
> exposes.

This fails to compile the test program on my system:

/tmp/ccWsT6Ea.s: Assembler messages:
/tmp/ccWsT6Ea.s:413: Error: unknown or missing system register name at
operand 2 -- `mrs x0,id_aa64isar2_el1'
/tmp/ccWsT6Ea.s:544: Error: selected processor does not support system
register name 'id_aa64mmfr2_el1'

because the assembler is too old to recognize these newer ID register
names. I'm going to fix this by squashing in this change, which
uses the fallback Sn_n_Cn_Cn_n syntax instead:

diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
index 7d9b0168da2..46b931f781d 100644
--- a/tests/tcg/aarch64/sysregs.c
+++ b/tests/tcg/aarch64/sysregs.c
@@ -22,6 +22,13 @@
 #define HWCAP_CPUID (1 << 11)
 #endif

+/*
+ * Older assemblers don't recognize newer system register names,
+ * but we can still access them by the Sn_n_Cn_Cn_n syntax.
+ */
+#define SYS_ID_AA64ISAR2_EL1 S3_0_C0_C6_2
+#define SYS_ID_AA64MMFR2_EL1 S3_0_C0_C7_2
+
 int failed_bit_count;

 /* Read and print system register `id' value */
@@ -114,11 +121,11 @@ int main(void)
      */
     get_cpu_reg_check_mask(id_aa64isar0_el1, _m(f0ff,ffff,f0ff,fff0));
     get_cpu_reg_check_mask(id_aa64isar1_el1, _m(00ff,f0ff,ffff,ffff));
-    get_cpu_reg_check_mask(id_aa64isar2_el1, _m(0000,0000,0000,ffff));
+    get_cpu_reg_check_mask(SYS_ID_AA64ISAR2_EL1, _m(0000,0000,0000,ffff));
     /* TGran4 & TGran64 as pegged to -1 */
     get_cpu_reg_check_mask(id_aa64mmfr0_el1, _m(f000,0000,ff00,0000));
     get_cpu_reg_check_mask(id_aa64mmfr1_el1, _m(0000,f000,0000,0000));
-    get_cpu_reg_check_mask(id_aa64mmfr2_el1, _m(0000,000f,0000,0000));
+    get_cpu_reg_check_mask(SYS_ID_AA64MMFR2_EL1, _m(0000,000f,0000,0000));
     /* EL1/EL0 reported as AA64 only */
     get_cpu_reg_check_mask(id_aa64pfr0_el1,  _m(000f,000f,00ff,0011));
     get_cpu_reg_check_mask(id_aa64pfr1_el1,  _m(0000,0000,0f00,0fff));


Applied to target-arm.next, thanks.

-- PMM
