Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1847124ejc;
        Fri, 24 Feb 2023 06:58:34 -0800 (PST)
X-Google-Smtp-Source: AK7set/qFN1DkICDY+PBQ30E9kzbnKxTs/ibSxV/j+0hXexA2AFVXiwXR5B+4x3VaJV+TbwOKEkE
X-Received: by 2002:a05:622a:cc:b0:3a5:1ea1:bae2 with SMTP id p12-20020a05622a00cc00b003a51ea1bae2mr14747455qtw.34.1677250714516;
        Fri, 24 Feb 2023 06:58:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677250714; cv=none;
        d=google.com; s=arc-20160816;
        b=0i423/BRKKZhK1idAqhiyJgvfTKynVgWhJnGKcSyzsEP3TJcmkLA+cdswD2vBaHrkR
         5aGBi5har+A22Qci6hsK/YEKVFgtULGa10xP9+pupynFCWz78mPwke9J4X7D23mMwN6X
         kL9zclS8REy1KhqM3znSv6IIa0vfb1VlhLqT7ntl9RwmGEud5rvXWF+sVwwcMk5SkuW2
         dZ8XF2n6KsWHO7HfF3ZLBbm1qpAjKL2O9ZDrtWqbEJ54OBWMqiTwkBjCN1DUS0ilEQ1N
         6EBgQROPzN+2lmwETxuyWWHXqDoSR/4O3SsBJg3Dnl34snADqFqXN5OvsHGrmfrzOiOE
         gxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DJ6YMcMqqVkO2Yq1pRbRxg35LAovBsz1IvyaBn6/Y80=;
        b=SFdG4bAL86jqG6fBo+14jMNhvYP6hQgILUXRGAhRldws7kgsfM9RbpGn4Erw/P9hkm
         focQVWldIoMub3/LnfbIrlFNDs/hjeL++isZAra+sJTLWhJ1Rb0NN1Ux4OYNYzH37ZqU
         OJDB/DxThcBnhv8kA17kJ3JJInDMh1LrRQMI7WU0jVVFcfmVlxAA4B5E+vVEBsfaY6/G
         YQgj8gpsgwCdlGhWIS9v0h42cPRD+tEKWnUo/80JO0uSUiHZjnX3r6dImCAVVWzzp1Zi
         BCFwZoxPXAnts0jN0w1EscgSen8X3Of+C9sTJilKBpNr2Qv0gjsEG/mKmB0YtkJj+Z66
         VjTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q85q8pCl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br9-20020a05620a460900b00709108baa81si6849072qkb.431.2023.02.24.06.58.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 06:58:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q85q8pCl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVZWf-0000EA-74; Fri, 24 Feb 2023 09:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZWc-0000Db-CA
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 09:58:18 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVZWa-0003fB-84
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 09:58:18 -0500
Received: by mail-pf1-x432.google.com with SMTP id z11so705143pfh.4
 for <qemu-arm@nongnu.org>; Fri, 24 Feb 2023 06:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DJ6YMcMqqVkO2Yq1pRbRxg35LAovBsz1IvyaBn6/Y80=;
 b=Q85q8pCledpCv12KcwJ3IvG0ZDweD8+aCre2jcbtR3+iuQQYNvwAHro11a2UqoM7Rg
 QqKMBgK9czJVJNGL5yGtoiDAoSclqmyo3FL68waQXjKfQoeRxXd+31w969ROl96M/7kr
 D7X/C7SSlOrAhutQMX6K53Rc8CJq+6wEHAzZVy6ngdlEUKmzyEVn9Td1rLJE+rh8xvL5
 eH9Zf7/fUOpYW9Brr83thyH3BsEEDbcbkJzs2DMbOWY9JDGrDR+m6pMuMAn1KfOUbLMk
 9hq0iMjo9swnnCXG1duguSyGXtiJfgGj2nPuG32d6UC+3gwVp77rqf8jkbZsjZ2nLt+j
 IqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DJ6YMcMqqVkO2Yq1pRbRxg35LAovBsz1IvyaBn6/Y80=;
 b=Td2vOb/uclgJq0+c17pPguzpI+ME/zzl13lMLB+IpTwRLHVGt9gFmxvd1QdAFS6Ca3
 x6y3jTJdit4OwtnzCimhVDc85UNsK5vEWQrPGqeuVoc6T4QcUBA8G9Eh+I/o93theAxQ
 0qW2daHf5zsvQqme2LlbI7KHxy8s/7KUJuR2okUznKo3gVxWOO8CnK2Nz3FJ314Gw4Xq
 XelfiVrDD3iKGH/QplNTpuV5zbz1ej3s5lZ3QmRAfd0qNZLaVPIlJhmh/cp+lSM/HWuO
 3HmLbuoYTzjotm9ksesJsgiKFR83E43HfXYyRGP+Haf+NYv8/fZqxElcjdfR3FbpM+NG
 skCg==
X-Gm-Message-State: AO0yUKVwbwC/F1B4XszebThJyFLqYwXA025DrsMuUcS0ofl5HAXC4wKZ
 Z3+DoHOYjM+F2nXw46do5blWgUPWH07Ix1ZKWp1eAw==
X-Received: by 2002:a63:6dc8:0:b0:4fb:b556:c9fc with SMTP id
 i191-20020a636dc8000000b004fbb556c9fcmr2978023pgc.9.1677250694556; Fri, 24
 Feb 2023 06:58:14 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-18-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 14:58:03 +0000
Message-ID: <CAFEAcA8_rbuXgj9BbJitDTZcW-Mho8CxpJmouG_JahzMHmTQdQ@mail.gmail.com>
Subject: Re: [PATCH v3 17/25] target/arm: Handle no-execute for Realm and Root
 regimes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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
X-TUID: rFTfVkmJpbrt

On Wed, 22 Feb 2023 at 02:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While Root and Realm may read and write data from other spaces,
> neither may execute from other pa spaces.
>
> This happens for Stage1 EL3, EL2, EL2&0, but stage2 EL1&0.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
