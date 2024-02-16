Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp1154743ejb;
        Fri, 16 Feb 2024 03:11:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCULeXCZ85P78ecxekju0cdkAzhap/a8+vpMk9KdJU3n8rtdiLCP8wtxg9i05Q8wljAF2sRbw5a7WJMWIfsei7Nicudbm6qs
X-Google-Smtp-Source: AGHT+IF8lkPHdRgc0qu9TxxHRZAAcFS6HSnN3CDcVZfd8zz0A7CuGMwp4Ng5zr3BU2xlaa5v3CSJ
X-Received: by 2002:a05:622a:513:b0:42c:6005:19a6 with SMTP id l19-20020a05622a051300b0042c600519a6mr4720441qtx.54.1708081860376;
        Fri, 16 Feb 2024 03:11:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708081860; cv=none;
        d=google.com; s=arc-20160816;
        b=fBbUP1CEyUmZ95dV8+PidopQz+CzhiCehvL/cmZUC/wkDrB/8AQlumZmhYhvmb261B
         YWHye3s2JZnXvCTOPAgYCFEWNcYXxL4x9KilyIlyBpvvAHksg58Uwyg2rNl9+3C+DVLW
         66HJezC6gb84fymdgYLgv9XrX9Qt1odtKD/0e0vJ40U48HXXEfKjYXnMY9wKWXPdeiuY
         brY6EhDROXBotNKtXxJvIJZcBkgOMjqn2Be9bNx1WyJ92HHxS9Z6JT+Mtv3YNcIgH6AY
         9A/olVfRdELk61P3sA41EDbwOxOxoTBa2iNUsC38OsCkVvHgVNeZvwlrH+2xcebOjbSb
         k8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jnkIS3AaHEP065b9a1SZ9IcaJ8jPciqvA+XhsfUsiWs=;
        fh=0UDKgNz4yjNBVu75Ye1IuKJrBNYD8tZdxMkofi2vxCQ=;
        b=j2YAl+zeCJGpcqoTupAyIG6lLkz/HC4oRQutwGf3QDNzKsikrimaKSGDqcH6II8IUo
         v2GrmLb46WXR8MHANoT9scPzEmCgk5H+XxWsT4q+AF03CrV1YrsqksvvpXsVVC/Tt4zv
         8BB9GKh/FElT7k1dWYi6eqsY1R0+JSijL6r9EVCHDG6gEqehhpGxORZbpDW4FjTFbwaM
         a9cw01ivb/Hho7vl3A+bu59mE1fVnx6oWG5SftJG91fOlSALgSizJJ5TN35WT58IEfaa
         x3Xa/P9tm8uXqAYb65a77Z4qNsusl0Eb+1njba1eK9IAp07S7ZcHLsTAr3vO2DATOzY7
         LlDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xwk2xuO8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7-20020ad45107000000b0068f07ff2506si2808717qvp.223.2024.02.16.03.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Feb 2024 03:11:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xwk2xuO8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1raw0W-0006RL-7c; Fri, 16 Feb 2024 06:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw0S-0006Nk-Pe
 for qemu-devel@nongnu.org; Fri, 16 Feb 2024 06:03:50 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1raw0J-0000pv-D2
 for qemu-devel@nongnu.org; Fri, 16 Feb 2024 06:03:48 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33d01faf711so571675f8f.1
 for <qemu-devel@nongnu.org>; Fri, 16 Feb 2024 03:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708081416; x=1708686216; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jnkIS3AaHEP065b9a1SZ9IcaJ8jPciqvA+XhsfUsiWs=;
 b=Xwk2xuO8gUd5m24pdtCIK+51HtqI0K8DX6rY4qrU8Oh6w/gcQV50/ngb/AZe4bg9op
 oBGmuZE5FVtE56VBWhjNE7YGqWErOzN26YnTMUGbNK8nfeWCOJ5waOKdsNhpX46YGk9i
 Ap8jO/vr8kqza8kGnIAcg+iTVgpDKVrKZIGQlCMIpk0+06OxC4k+AxHzg/MOLVfBh8Ws
 SiJr5mH3+XUmq8+H80MySpDDzokzqoSiBUvXLkZ75v7N/jROevb06vxxPVMAp+kIuo4m
 vp8gznQuv7V/eBCNbhENNuVz7c68oBcoDgu1gHFhj/rMWvOJ5RMGL8zrPI1/v/wrb6f2
 nAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708081416; x=1708686216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jnkIS3AaHEP065b9a1SZ9IcaJ8jPciqvA+XhsfUsiWs=;
 b=uEOE2DqwipAXw5hm9+PfDsErJh/nntv2EILfd21EFmfszjzWCjiZSLcgSfp9iQtHL1
 s3+5i1UMGc0+kkEdhUDCFjflQCLQ4gLgulT0dqU6UCdtn1zesIbds/YAi1ZKh0+d408H
 mWn1y6Hqw0z3IiFvo1WvpicJJOdUo8RpncqajZk/RH+rIsA9d+WQZyRCaO3tl+wpinJp
 /clgXsPYjpVGyEHiiEr882oBo0zmueJvrvHt+K0+eP8yXafGouyJPik6QHPxxI7Oa+4P
 DA6DapO47ZxCqN3eoOhqgiVHrNOy4Wm1Z53BaEKWP3YZXicw73Bq3eyNM0IZEKGK/iLN
 sJ2A==
X-Gm-Message-State: AOJu0YwI2cKFwE7+MNs4A1m6jlBHxD+bNoU1h75WWeoPNlFqU7h6Nq4M
 s1QNAJtzitUunRaCuKvCIp+HDpTEGCzsT83v90oLTMWYG1EkYZTJRSk595+WXOf6DE+1ancgt0n
 G
X-Received: by 2002:adf:f4d1:0:b0:33c:e3da:923a with SMTP id
 h17-20020adff4d1000000b0033ce3da923amr3667425wrp.12.1708081416026; 
 Fri, 16 Feb 2024 03:03:36 -0800 (PST)
Received: from m1x-phil.lan ([176.187.210.246])
 by smtp.gmail.com with ESMTPSA id
 r8-20020adfe688000000b0033cf5094fcesm1863549wrm.36.2024.02.16.03.03.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Feb 2024 03:03:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>
Subject: [PATCH 03/21] hw/ppc/spapr_cpu: Use qdev_is_realized() instead of QOM
 API
Date: Fri, 16 Feb 2024 12:02:54 +0100
Message-ID: <20240216110313.17039-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216110313.17039-1-philmd@linaro.org>
References: <20240216110313.17039-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4EwPPa6QawUJ

Prefer QDev API for QDev objects, avoid the underlying QOM layer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/spapr_cpu_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 0c0fb3f1b0..40b7c52f7f 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -245,8 +245,7 @@ static void spapr_cpu_core_unrealize(DeviceState *dev)
              * spapr_cpu_core_realize(), make sure we only unrealize
              * vCPUs that have already been realized.
              */
-            if (object_property_get_bool(OBJECT(sc->threads[i]), "realized",
-                                         &error_abort)) {
+            if (qdev_is_realized(DEVICE(sc->threads[i]))) {
                 spapr_unrealize_vcpu(sc->threads[i], sc);
             }
             spapr_delete_vcpu(sc->threads[i]);
-- 
2.41.0

