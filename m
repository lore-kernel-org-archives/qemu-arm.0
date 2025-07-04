Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1261301dyc;
        Fri, 4 Jul 2025 07:41:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkLPsbcFpCVtzcZb89D1ueaczS/xiRsCCMrRzOj7yfLyNjrrSF/p0oAhNu1jeL0j/RocQ7WOzCVuRINg==@linaro.org
X-Google-Smtp-Source: AGHT+IEfvP81iI8duYbp9KPR21vV1nTbA/uisG3K20UMtnwS66rZ+1oWZ9B1jJ4rNeDB6kS2EqCX
X-Received: by 2002:a05:6102:304b:b0:4c5:1c2e:79f5 with SMTP id ada2fe7eead31-4f2f1ed35a9mr1503263137.16.1751640081922;
        Fri, 04 Jul 2025 07:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640081; cv=none;
        d=google.com; s=arc-20240605;
        b=c+HKsRlzvfASz9A6feToYb3loOIkKDAMWqZ7e/MKcM5jzrv74hyzTDi4Wd7c4HDkS6
         HwneQuroyp+aOnMrWfFtw2zHXe3nGwx6kXrYPzTeNHOZz5dPb1DXGfgtmGXsfg7J9ctt
         mk0xEG6IRjhNKWv3KiRjREeVrvXiTzxqsfhP8ymHEIpEbk+BS7k3R0djUbNWxUt2X3iN
         5ay5nS7yxks0c6NTykyR+msGwG49YQR+1kd7jMbUDVErLUEPkC4M3Rojv5oP0ST1DDtb
         yUcOpdI5kjGH5fRVuFfY4n1xd52ZZoldLq9uT9iQaqMaMlxbJ3L5aGomzLEsODwf0Bg/
         qK8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hwo8yflGFxZLtr4Vksv45YT861XKQ5Dw7SfYxI0Ogtg=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=LE2tlHGW292ZJaC9EUXN/Vlj7MN7t8qLSx9A0MSqZPStHnEtHgP/FYvRdDUcO9ScMY
         M0J8aseVjkKrxzNO595KsVSH8yztH5OEFOtllocYhhULEPoZKSfSddjpNOo3FjcxvpFe
         mmo/3OF8JhfhaK4k9bhiJFSusgdvgRCDVKKiJH+uKNtSdc9wUFRVpjYaf/hOV/VglGw9
         k1jnkqABXI78sqaxjnmuMIe81aC9VHPwxrB9Fa9/rixi5CER0ns1Pp/2hGw729OtGoz1
         dHjm6FmHTSrs1Pyz41MNxFDxyhIHbC15gjIjYRFOXj2Aw33vmrkttEz4lAIUlmjhu2+g
         P+9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bkZxZrrF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea783bb1si637467137.618.2025.07.04.07.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:41:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bkZxZrrF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXhWL-0006yW-1C; Fri, 04 Jul 2025 10:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPe-0003cW-KN
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:29:15 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPZ-00025A-4E
 for qemu-devel@nongnu.org; Fri, 04 Jul 2025 10:29:14 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-72c16e658f4so659942a34.1
 for <qemu-devel@nongnu.org>; Fri, 04 Jul 2025 07:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639348; x=1752244148; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hwo8yflGFxZLtr4Vksv45YT861XKQ5Dw7SfYxI0Ogtg=;
 b=bkZxZrrFBJrpeaD6FfxUJayrbrWf+WbIapH1dY+wQBxYrpro81Nae3So3HNAhEXBlf
 zNyVXnNl6tMQdQpCYaZLh1L9HJGsID3PQKWx29u57D6XV9KkglVTL0t5I26tpaV4XE6C
 NXDbXOev8YNJ5/O6mezPkfq11gVD8ix73yF6QMmh1eTqIAVeog75fGUn+ErNWVDowkoe
 hdc3MH9qXMTg0CQXTVWihcZWfhXJWS7zhX3fnkGe6qUGGu07sRCk4Sv0aUJ2gZKIDpdq
 9DGfUVlJUl9gbWJLZWByUKx4b0zfCZE7bLoEYlumgu5VlW8VcMvuSdPCjMSRLla5LHoc
 NGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639348; x=1752244148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hwo8yflGFxZLtr4Vksv45YT861XKQ5Dw7SfYxI0Ogtg=;
 b=dI8XYlk+ko0w7PQJKwf42lpd5nCqyPRzMyIwCSXKsuZA0j9v3Mnmebr/KfmaDYpB1M
 MawEaqnkCNRToC0BaOGzABLUe/aVXxCiI/i/MUVGMCYdOukZa6Ru5Nj5dlX7ezgqO8fN
 vQnKH0zUPHX5VNiNSpRMc693OZSozn5cVpKtnyuXkZLrpvO/Z5UYHCUqmQ5IXii7dDOi
 1wt4Rkz0YrpbtChTuVlLESOOB2PG1GU4o/eni2J86ANUp4b8u/t2ORFtJIvN5mW8W46c
 jsw2+ckAZ9+66Kb2dR/9rmCcToreno9hKM3h8KP/pgEacRmzmk0SJn/9nUZO6WCmpcCH
 Iuig==
X-Gm-Message-State: AOJu0Yw/v0DWUV/J5uaTaZev+FWnDgE0oObdMnWlrIwHoYoJRVcCZPvr
 TuWOKrPKf6d3Cn+4SsURcNVp7rkg+u6AsFfLBbGumkcDEif61Fa2+5r5S+pXyyQ1inKIlBVV8wI
 sTn/TTSk=
X-Gm-Gg: ASbGncvsniL/OSw0X6EF7K3uaCcoOzwd6d+mi5Oa9Yuw003WCX/3fB/wvFfAVR0aQVo
 QHR1Jh6LO8kqXUaPUXuZVKQ9glU59aGQJ8oTJA7gjcIpjv1V4LBdk/bv6r++tu3owc4d1VpmDyX
 BxubH79Mf4mlEGGvGnNjqVGiiYwsjyaf+dEXFa8rQYrCdqCn7MYwEGS2BjMSs3PCJiwQEO1hjw2
 S0Nj/xi+dZ+nyZV7uimX0IrhjFZZVR0s5yfRPVmwaq8ujMB20QO128BBvcDwjoL/aoohr9Qm1VE
 3058aSSirlwEP+4DbdkYQ7pS4Og/rds4t3OZJWboCENf87+zzUrgx/zfBO19SLTuuLVYL9wJDGp
 V8AL/5cd7Tb8QTTBUrFmTCdkF9H9cUjXXTsth+rxJG8IrvJy1
X-Received: by 2002:a05:6830:730f:b0:73b:32bb:7a06 with SMTP id
 46e09a7af769-73ca66d76e4mr1748532a34.20.1751639347624; 
 Fri, 04 Jul 2025 07:29:07 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff55633sm531448fac.20.2025.07.04.07.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:29:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 107/108] linux-user/aarch64: Set hwcap bits for
 SME2p1/SVE2p1
Date: Fri,  4 Jul 2025 08:21:10 -0600
Message-ID: <20250704142112.1018902-108-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
X-TUID: aWDKi4uko90m

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 2add1665c7..ea214105ff 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -915,6 +915,14 @@ uint64_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa64_sme_fa64, ARM_HWCAP2_A64_SME_FA64);
     GET_FEATURE_ID(aa64_hbc, ARM_HWCAP2_A64_HBC);
     GET_FEATURE_ID(aa64_mops, ARM_HWCAP2_A64_MOPS);
+    GET_FEATURE_ID(aa64_sve2p1, ARM_HWCAP2_A64_SVE2P1);
+    GET_FEATURE_ID(aa64_sme2, (ARM_HWCAP2_A64_SME2 |
+                               ARM_HWCAP2_A64_SME_I16I32 |
+                               ARM_HWCAP2_A64_SME_BI32I32));
+    GET_FEATURE_ID(aa64_sme2p1, ARM_HWCAP2_A64_SME2P1);
+    GET_FEATURE_ID(aa64_sme_b16b16, ARM_HWCAP2_A64_SME_B16B16);
+    GET_FEATURE_ID(aa64_sme_f16f16, ARM_HWCAP2_A64_SME_F16F16);
+    GET_FEATURE_ID(aa64_sve_b16b16, ARM_HWCAP2_A64_SVE_B16B16);
 
     return hwcaps;
 }
-- 
2.43.0

