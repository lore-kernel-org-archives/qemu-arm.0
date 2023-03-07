Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6267408ejc;
        Tue, 7 Mar 2023 10:35:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9SQX0/1GyHIQ6dTP9Ubuy/eSw4LySvVOUidzAOBWu/AsWMc06iRPCwAvp3tgUM61vbo0l6
X-Received: by 2002:a05:622a:648:b0:3bf:d988:f8e3 with SMTP id a8-20020a05622a064800b003bfd988f8e3mr25787208qtb.38.1678214126768;
        Tue, 07 Mar 2023 10:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678214126; cv=none;
        d=google.com; s=arc-20160816;
        b=P0kOyc9M8vbV+1ncBl+n+qjg2u3zYJLxVJkvuzuWlqbQ9mQAXYKLhNHnMWhoDJ97bz
         yIf8Z+kFkIOtTX4kywDiXC/FL1aayF6tOaQwVFgpaK7aWJzp2TEBFYl6eVVFw8b10INd
         Gf1ZBcX5hD9ac9QsPOM9+48Nt8hgVMGacQdVR9wY9nj2T+8TvEMTmCSyVReHnRYPMHww
         mn1xAYCEwRM9xBki20kuVznB2zuqn/GgVJ/6mgjngYezXyyTWFs2mf4Hq3U9k0kB0kb1
         /krTZ0tAQRMShnjeceTlcdykGZ2D6AtDFtCvs0BuMpM8vJgU3+wHoxaDFnyd9KP+WdyP
         bRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LvRzWvVDOx/4mw8Xks+yN45owXOLBfvuaq+ouOQwf5k=;
        b=D2RVNztuotJ2z5r5HKlbexUddtUQX33T2u/qFUV/sj48W++8vyfuqTvfqJFjdwviru
         /g67yEnA4+5mW2aFhE6LJqWDow0qjscVmxSpluZ1e9GalvBex0jcRuJwCxl7izNhKd+Q
         HCHmtw1F9lFBS1ROEqHyWMOmi1A1kxHMq9cpYUK7ek08IKUL97+BmGPoAULtt/hwzZL1
         s2DTXT4pldGO1jvE3D0Ozdz7HKUzYwJD0oHnfl0kMLkD1RsK+7PMJfSO/KePH1mRO67G
         3KTmROamkxhegNGDgW9MPRv4MVuLznFLM39xXwMtXESTsipd+GpJuDM1wZvbwJYBzKyZ
         xWNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLrYTU0u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n203-20020a3740d4000000b0073ba673d03fsi9281719qka.243.2023.03.07.10.35.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 10:35:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DLrYTU0u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZc9W-0003XD-Ff; Tue, 07 Mar 2023 13:35:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9V-0003Wn-Jg
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 13:35:09 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9T-0007hm-7r
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 13:35:09 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so12707404pjg.4
 for <qemu-arm@nongnu.org>; Tue, 07 Mar 2023 10:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LvRzWvVDOx/4mw8Xks+yN45owXOLBfvuaq+ouOQwf5k=;
 b=DLrYTU0uW0rxfmTKIOrGTG7NBWEpH9QlQDGYadQ3j7DQb6GmBqgq0RrdkPy7c48RI8
 fig/YstyFwB41YL2wf0d9tul/V6v6nTXgA6emezRblGzoi1Xc9phYFUxOnYz2/fZR8Ul
 3mxWB7WevvuxKn/A53nMoqofJHj14zGO0bQ3EtZBQa+TAuFZBxQBUydbq5+ith5wzXC6
 pVsFPd8wugYI/lBYafxg/ki0dIGP3NZYEIpVytF1bpzZPzkkBawPVRDNNOwr2FbJmcmW
 NNBej5s3tZRJN+R2fo1ZlQG6co0IuRITdEfBTbW+mxR0gCY/6rblA80bMAk7X8R1wdPU
 aXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LvRzWvVDOx/4mw8Xks+yN45owXOLBfvuaq+ouOQwf5k=;
 b=fBbhT+HvKZLJ4kcFSf5w8ahrUH58fZb76PTMvkP3AXT52VUkpxng24ZS9LB6gF5oSc
 rW/tCqqIJ7opCBg3x9D1H8gH82TRE3/oo4EHX2JcXSUwjMJqv67Z9/TPpW7lsWzHstAw
 tOG7B+k7jhT5gxdBWxYyBD3QO3cfRR3xDmogqHW+KmGZ4Qof76xeza1egG9bv/l4SCD0
 djyLQR0KcuX52h2U1BRr7/EhX0dCzJXCv/IpA5kWZisW169XcKcqYSKmUXlOHUBehQ8r
 yMLWy3x8Geo6tvrVARuu/2LVWv5w7+s19uLXLJjXo8N9ZRyhcFS0BzbLZQHoau+cmujZ
 Cs2g==
X-Gm-Message-State: AO0yUKUQqn5klE+6PR66AesI+5U6ACW5azto+/cfYGKfItOkr1N0UA4W
 C6KQiUxmzBiNNY1B1DWVYrq61ErPkcvBpzl/8RA=
X-Received: by 2002:a17:90b:3907:b0:233:f447:1271 with SMTP id
 ob7-20020a17090b390700b00233f4471271mr17353226pjb.43.1678214105797; 
 Tue, 07 Mar 2023 10:35:05 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 02/25] target/arm: Handle FPROUNDING_ODD in arm_rmode_to_sf
Date: Tue,  7 Mar 2023 10:34:40 -0800
Message-Id: <20230307183503.2512684-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-TUID: 8Y9giddnyhpf

While this enumerator has been present since the first commit,
it isn't ever used.  The first actual use of round-to-odd came
with SVE, which currently uses float_round_to_odd instead of
the arm-specific enumerator.

Amusingly, the comment about unhandled TIEAWAY has been
out of date since the initial commit of translate-a64.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: qemu-arm@nongnu.org
---
 target/arm/vfp_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 24e3d820a5..90cc324f71 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -1111,10 +1111,8 @@ int arm_rmode_to_sf(int rmode)
         rmode = float_round_ties_away;
         break;
     case FPROUNDING_ODD:
-        /* FIXME: add support for TIEAWAY and ODD */
-        qemu_log_mask(LOG_UNIMP, "arm: unimplemented rounding mode: %d\n",
-                      rmode);
-        /* fall through for now */
+        rmode = float_round_to_odd;
+        break;
     case FPROUNDING_TIEEVEN:
     default:
         rmode = float_round_nearest_even;
-- 
2.34.1

