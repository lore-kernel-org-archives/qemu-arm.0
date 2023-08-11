Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1649245ejc;
        Fri, 11 Aug 2023 14:41:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn0EHCesTWlVMv+n426cBThhhLELtmfEfCGJaxgoLjwcQUpIAeTe1yiJZhL1Dq0SGm3SkK
X-Received: by 2002:a05:620a:2a10:b0:768:14ee:234c with SMTP id o16-20020a05620a2a1000b0076814ee234cmr4428709qkp.50.1691790090877;
        Fri, 11 Aug 2023 14:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691790090; cv=none;
        d=google.com; s=arc-20160816;
        b=gLH1iW6I8ZjTkEHW9f8ed79Zpn9xdZT+5jv/33bxgpgAb6SypXTq02VT7t/ronByMs
         /dogaAdbioYGE5OBsn3pi3FwJWfIjMgyS+IEZ2tyyfyqZwYtHxubLHdlBJnR+A/tSAeZ
         ovAVdqXrCDMrnqxrJd8lcGKjephCovkeEJ1Lr9H9ue9MbKp6Vv0ak/bqdY0peJocVx6h
         SqV0uOmHbxCRXuU7VeS3Rvjfpwqk0NI/WR51OPl2U4StboEJqATCwxd54EccvWbDcpN+
         S8rcvoQy7p+MR5IwKHyagDLfHMJBsnExPAPTPr6OEtY3W7rTRcqgDldN2ZzwzDZGv2M5
         vyuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3XmEXwWgr34F4lUBgO2f5fSa8ByD9tZ8lTL3vDvsP/s=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=VVSF3rEUTKf8QVYQDXssVPIkIGqZsgj8lGUnbgnVAIU6DtGAQz2SVh9m7iSWkkxTzV
         QbshRTLXwhcH9c61wgtS8KzSKmQrxPqP9tGseE5ZBV7gaFC0k1PPE9KEjvj9/oW53Qtu
         thUR7vlLpKzhErPMOqCMDMSRbZ1tirEeiEsh//q8tvjwwXHoGOpJehLql4AbJ+RyuTJc
         FJf46Z09tkIc5geYvWb1dEt5q3dZtqeoIzQTZrGXicwJT+AYQn+qQwFBuXFJFqNIHRV2
         mNQxF/cHWKYKR8vuOrDScWe00OQXAFE60e8/rPPsPQmRZ9a2HKkUtsUk6kll4a1+tseX
         v65g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f10TfHzv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3-20020a05620a130300b0076cae6b0801si2623923qkj.640.2023.08.11.14.41.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 14:41:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f10TfHzv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qUZsG-00039y-LS; Fri, 11 Aug 2023 17:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUZsF-00038M-G8
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 17:40:47 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUZsB-00028K-8j
 for qemu-arm@nongnu.org; Fri, 11 Aug 2023 17:40:44 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-563dfffea87so1845576a12.2
 for <qemu-arm@nongnu.org>; Fri, 11 Aug 2023 14:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691790036; x=1692394836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3XmEXwWgr34F4lUBgO2f5fSa8ByD9tZ8lTL3vDvsP/s=;
 b=f10TfHzvb/6L1OCjgwbEDfFJo7Li5Bw+QYVUX1nMhsCUYFbsS6XnZ/aBe6jF3QlWUG
 w1UioYaRLdAF7Mhl+9mvI6ityFYrO1v6jnJnMqnCWBQtoEQ1JIcd37jvkSJ+BqJWWWOp
 nNA3CByRYEKSqZgAf4MD24uXQWzCUe4i3XPCOYjNTCnUD0WsA6dIXDw5SIaKhItf02yK
 JyRGmz4vc8uLY9kv1YLopjIE546aD9MUoiNVl8b5Z4Y25/AF3HH2XnUR7cnUnXkZxng9
 VT6dJSuO2lJtWzhub7h5fJbDn+hqtkcDm9AZ69oquLu6+ogx4jLiR4KfRVJxMhWcdSKL
 gO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691790036; x=1692394836;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3XmEXwWgr34F4lUBgO2f5fSa8ByD9tZ8lTL3vDvsP/s=;
 b=bPvl2FX/Q7I3CurQgpssSZXHvroRSsB+D/Ddt4aJNOVSka48p9vmBbTY3H6sdgaEtd
 n5v1u3xefx7S74rkl1BzfnEcLplYZwvO9119+PVe/FBQ00+bG3WDWmCVsDOau6+WFuiX
 P66+N61xc0Xg/Sdl+blE51U0ozmqCy1pJlpkOs4JxAMoCX1aTPNXsQoO/TlEq4PXvBfj
 mGurAN32GnFdy/1jczL0uknydboVeNlPV1c0gSwf5pOlYM5XpvbsCo+Bl+RlWgPHT6zt
 XFbbk7N6O+zze3zHgA0Lf8vjqA2WhZPqrR8cOnqQBVf6RTLGGLA8zfID1d18YIc4aNC7
 /G+A==
X-Gm-Message-State: AOJu0YyCt00kRFD/94gz1tnHgkP97A0ZSEUZ82FWcSpKClhkeMZzVcjK
 m7kyF0Y3MAQPUicxz4OnG5tbvQ==
X-Received: by 2002:a17:90b:3e86:b0:269:1d16:25fa with SMTP id
 rj6-20020a17090b3e8600b002691d1625famr2662413pjb.12.1691790036619; 
 Fri, 11 Aug 2023 14:40:36 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:e773:351d:2db2:8a8a])
 by smtp.gmail.com with ESMTPSA id
 gk18-20020a17090b119200b00263ba6a248bsm5723840pjb.1.2023.08.11.14.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 14:40:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 04/11] target/arm: When tag memory is not present, set MTE=1
Date: Fri, 11 Aug 2023 14:40:24 -0700
Message-Id: <20230811214031.171020-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811214031.171020-1-richard.henderson@linaro.org>
References: <20230811214031.171020-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: qFsvFBiMJGDt

When the cpu support MTE, but the system does not, reduce cpu
support to user instructions at EL0 instead of completely
disabling MTE.  If we encounter a cpu implementation which does
something else, we can revisit this setting.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 37e8c35677..85c02308e4 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2067,12 +2067,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
         /*
-         * Disable the MTE feature bits if we do not have tag-memory
-         * provided by the machine.
+         * If we do not have tag-memory provided by the machine,
+         * reduce MTE support to instructions enabled at EL0.
+         * This matches Cortex-A710 BROADCASTMTE input being LOW.
          */
         if (cpu->tag_memory == NULL) {
             cpu->isar.id_aa64pfr1 =
-                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
+                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 1);
         }
 #endif
     }
-- 
2.34.1

