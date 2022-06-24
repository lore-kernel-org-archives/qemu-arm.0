Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp449826lft;
        Fri, 24 Jun 2022 09:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uKdmkHIJPXpAtIH7CznP7gvlbPM1MotUOiRMvD6GLuzzUay4eHQbSch+rdG2XmQtEOashP
X-Received: by 2002:a37:787:0:b0:6ae:f34c:9d61 with SMTP id 129-20020a370787000000b006aef34c9d61mr9049qkh.692.1656088429991;
        Fri, 24 Jun 2022 09:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656088429; cv=none;
        d=google.com; s=arc-20160816;
        b=ZONe2MI1EeKY8cWpXq4vuAXb1XoIsnRzheaPPzw3RQRR/nvUdg3fV4zA+LSv9CIia+
         jxDz9IsttcA6RkWkILUnJFIQcKafLWA/B3fy6JgSTKMnlJ/OLp9NHmGxyYCEsYcw7ZFA
         aaihXrNZMjFbJpcW6Qbw+QZDqvy8V0TEWE8MTsjDwuHBR5enXj6XpId+QBQ5HTng3dXN
         bvq7GASxcqAMeVuDggBnwOBn6zuSBd/daehkIPoWDo8Tpv0VLV3VO4rRBOlckNuZu2gK
         j25j7UekJ5JwPV53bSib+iH2hP1K7f45Pq1kiSHSR47ZOiYqVT0It5aUZBV7hci3iLR1
         AqzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VCz+mrOA1QxEy1SLHzgHEqsfbnXpZ4o3pzny4FMWhKc=;
        b=IzevGdJy7Is5XcNyHmO310uAHMzB8b4UCeNzoi7fNGJiUKvcsnh1fb+aRyotdmDSYA
         4PNnDcoO7hoOZ8Q8tQDo64PWPm1DNmMihpCkXhA5n850t7nQWk6Q88u5CUL2N/UnBfkp
         bQR3oAr35yXfF4p1+ZlOhfqS35luQPCdiO3VU7ph0S/5J0ldlY5/gFqlvC0D2s1baEq3
         LEy5uZREAUqkJuWml4w2u7PMjwEhcwtivfTuWfKtEjcs6jTY/JI8zVXJKl01NLBj8cqx
         Hb0coFYhq/aSKC8ZzEyfS5MpQd2vJw88VsYSX1tLWXQBvw2fwT9pSzaOGg8zYALgUIGB
         uJxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V5k/KV4u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8-20020ac85f88000000b00304d9facf44si1882696qta.585.2022.06.24.09.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jun 2022 09:33:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="V5k/KV4u";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4mFh-0005wI-G3
	for alex.bennee@linaro.org; Fri, 24 Jun 2022 12:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4mFA-0005ub-TH
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 12:33:16 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:44822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4mF8-0000YT-Pb
 for qemu-arm@nongnu.org; Fri, 24 Jun 2022 12:33:16 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3176b6ed923so29726007b3.11
 for <qemu-arm@nongnu.org>; Fri, 24 Jun 2022 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VCz+mrOA1QxEy1SLHzgHEqsfbnXpZ4o3pzny4FMWhKc=;
 b=V5k/KV4unUYM+MgCNoKIUOK8OhdanWwM6epc52WOCyaUPe7uPrEtYhrEC3TSjh1/WL
 NeLwt8ZXGTYJAsnRoWYbG9RfIQTZVIJ2h8No5dKp3HPBslbcSiYD9mUmiOWvm+XgHTqs
 CISH4EqeLAr3l/MKc1gXiU1T03qsnggh8O+ty3DRxop+Y+16b0ykU0id/iSN6LhVF418
 4TsX2YfVFqmRuY1ZdYpyeEzUb1+XbquXjIf5TVOisOOoVJNP9l9d6bH5GVfltjjfiAA3
 ukvPqjLsv7OL897IidTbKeaHiqy52eejg6w1odQked93DMGfk+Oh1WxjlRTBoYEGPxBq
 Kzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VCz+mrOA1QxEy1SLHzgHEqsfbnXpZ4o3pzny4FMWhKc=;
 b=6i6RxXS5aBrQHGoLZnq+XX8odFKY1yWjL8liOeS4aHHBmVQ8shVLToUTkI8vc8yke3
 EfeTpg8q2Zv+MdaYgtccxxBiQaCTvqjEh+lsqc3SJ4VgbLh1rwQ59rlEaZ267aup/XSh
 aZE3pYyCjkneZow9zm7455qlywwt2pMuKzkaRqktgmQ/sufyjfsupK3zk8D1ftgwCe8T
 juS/hSk+znH82emiATFaK8aceDhSdh0fssR2BB3vokvTdB+bsYSPUbgRLVIJmy1Qx8Li
 1fJvwGLU84baetvfsvYzh5BLrNNwIRjN2C3vGCS9hjbbz2nELHXGgwvK1clqf5ZD896z
 gg7w==
X-Gm-Message-State: AJIora9qd9VjmER/SuXFHBH/QgmASA0+0fyJESMaszJoXT7Jbg0ZbIpH
 ub5PZjFdhmQc1KT4hEanUilT+VMEyq7QHlEx2QRpYQ==
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr17923074ywd.64.1656088393320; Fri, 24
 Jun 2022 09:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220619001541.131672-1-richard.henderson@linaro.org>
In-Reply-To: <20220619001541.131672-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 17:32:36 +0100
Message-ID: <CAFEAcA9OekbvO1tH-SU16sgXTDmc8gNuDMH3+OkEJoDD36TxoQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: Fix issue 1078
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, He Zhe <zhe.he@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: n6n78mvu+vOk

On Sun, 19 Jun 2022 at 01:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Nicely summarized by the reporter, but I thought it would be
> nicer to pull all of the logic into arm_pamax, rather than
> leave it separated.

Applied to target-arm.next, thanks.

I think the hang He Zhe reports as still present is an
unrelated issue (I should check the v7 LPAE spec about
block descriptors I guess).

-- PMM
