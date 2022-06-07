Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1936027lfb;
        Tue, 7 Jun 2022 01:58:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSkQS46ENXGDldjhbmY8Ckf3XpQRYygQFLJibXzKSVZzps5zZCgh+TQ0+2xuM+ukYK+s/Z
X-Received: by 2002:ac8:7f04:0:b0:304:e37a:41da with SMTP id f4-20020ac87f04000000b00304e37a41damr14969774qtk.352.1654592291837;
        Tue, 07 Jun 2022 01:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654592291; cv=none;
        d=google.com; s=arc-20160816;
        b=zN85RxFkrR+Zls3hcFiVNWlfY92gR4zPicjDaZWiDqMSVpL3nJOLBYiUH4A8MJhzlF
         I3rn/9k+6ap1X2cCl95nVPBCBSjQGkxgl7BCgHDE5e/UtMyqD/PBTD9+YwpFfeI0tGVO
         +XTLLT+cyKOVUew343b40MmnLXNF/+ASk/pD1BOgr6Di45CNRX4w3tTlnzgNGpE0SrFj
         W35b+AFRIu5a72b+RFTk80cfzld1r2iUHf3fE3Jdv9G8J+De6bhX6TlRYBsawhTBcJsX
         cDSLPwIKQgdzpqI8ePtTe0HcEPgkkAZryacFuHik2UQViHUh9kqOFAyxfV+yfn3bu9MC
         wQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XbSqCXHJKmDx3SNsT1EOjb100Zgdd8ZCRDv/YCy5RVw=;
        b=KdoFHRd3WeoPNs1n89f9HObZjXN06dbWzXwwICOO93d1GSggOEL8vUueKAS1ObGOsB
         DOIbWz1YdvxD5FzqhdSPpnEz5T3lxq0onQhhbyH5HkToa9E322iJieDR9rwvDfX9Ini+
         p5+nZ6vKdzZp3WSHBTV9K6WQwHV4MvjsmgNmekO+FVfPxd6LpeWHlermGxfYKHwjHr7x
         tJ3s6oiA4PTuXIwVBs4UfhBMSBzWBSEklNUaGxVZ1SyF/19wMH9M+MxKs5iqI+sfMG8C
         gg/PkCRIy6/7l/jWAzZjhhsA7BwWFTrbYX8DF23KDRXSLC0Vl/EQevMBClo5ri++DE7W
         eDEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvRDfPnL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jm10-20020ad45eca000000b004621982fa3asi9011343qvb.300.2022.06.07.01.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 01:58:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mvRDfPnL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyV2R-0004g6-9X
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 04:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUvl-0007tC-GT
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 04:51:18 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:45023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUvf-0003rX-9r
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 04:51:17 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id y188so527421ybe.11
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 01:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XbSqCXHJKmDx3SNsT1EOjb100Zgdd8ZCRDv/YCy5RVw=;
 b=mvRDfPnLMS9awug5YY58gfgRuacWkv9z7Jhvr8YMPfJVVl4kP8wzstMF/U5H3wQqrh
 piFT8cmD91L/1Pz5Ng7mPLkqBLDhltIq+S++tQleZROztHswNkQTcyrD6ynHzanCIzDn
 BXPuazcdIJEbj8S3zVIBlGmu0k5ZdjL/8mcA2wMaXqYFxF6MnLlijn/SpWbQU/YBXolr
 JVoTDRyo6ESVnUYyVvFTmqDYeFUuVEVgfViTjWA9uKh+1NKdJ1VtivE5BCHcNwe+YmUy
 xoosn5BZq/nt+vytMG+hgW9t9pJaHdJgMeKHNGIZAkZkHwwxWNBov7jHXeRMIjbwYYHZ
 Xtyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XbSqCXHJKmDx3SNsT1EOjb100Zgdd8ZCRDv/YCy5RVw=;
 b=e+uiMx5PRoD7hMwi4ujTEeEk6QhAqoq7jaj43VqOCoQthnTPeHfMbcUL/eI+FoMbuC
 WSkO4tUIx1jPVdcuYvC5KGiY235H6M2XwdBfCXUQzi6jBqXFLqTb4oB4A0zlBRm2+oUA
 Vzwa4/AqUqrRugZ1pJM2Diaxg9fVmhIevg86SLuuqWNyWb9r7RwKFSNubZomhvbEslLi
 7DujQ0qz0C1bSANifCi9rU/nrctJML+9n3AEt+mFLzPBQ8+/B/CKuK/YhjD/yeawjHZP
 zwqkkooSRJK/4CwvHqAvvS8L7T+JfjqeuUdRPYBm5UAs8DjK9k44STKMhT7pU66Bu7tc
 tQng==
X-Gm-Message-State: AOAM533VUF1Pf0QL6yVlNpXYO/GlxmiRgE1tE5koB/PxQDR0SC41vFnP
 WLanJD7wjBZVInh42KzCBBPia5gdK1L3gACJiq0MWQ==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr29411768ybq.67.1654591870195; Tue, 07
 Jun 2022 01:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-36-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 09:50:59 +0100
Message-ID: <CAFEAcA_aAY3jpOFBR0_aNAUubfQr=r6_Y3Z0KTz+F+Zuakn6NA@mail.gmail.com>
Subject: Re: [PATCH 35/71] target/arm: Move arm_cpu_*_finalize to internals.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OsVgSNKLll4f

On Thu, 2 Jun 2022 at 23:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Drop the aa32-only inline fallbacks,
> and just use a couple of ifdefs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
