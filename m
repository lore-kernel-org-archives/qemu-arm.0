Received: by 2002:a05:7022:4097:b0:84:d798:3551 with SMTP id x23csp2195144dlx;
        Thu, 25 Jul 2024 07:40:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXh9R6Pb0p0ALOhG3+7bKZ1lK8Lz+Y8B/EdAsldapi1ni333LItF/Dp4XZ5NdrINgZpN9X0JnAaGO/G6Iog1ZeRGYuFpGtb
X-Google-Smtp-Source: AGHT+IHFYKXuCeymASnGA+rS9oEnP0UUE6901h5ee2Vvzn0ChPBgMRVObX++OECLjCw6veMmS6bB
X-Received: by 2002:a05:6808:218a:b0:3d9:2562:7541 with SMTP id 5614622812f47-3db14117fd9mr2228114b6e.24.1721918448386;
        Thu, 25 Jul 2024 07:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721918448; cv=none;
        d=google.com; s=arc-20160816;
        b=emrRapSaQJshiYK+1+B7Ze3ok60urFmqorR3FDF0X8sxCqmILLEsERKUTsdJUciD8+
         kNKF5qByZ7f1YmN1uy7RERcBcSmuUHLpHq52gf9tYVSsYWOtSXd1Au3y346xxiSnY5c7
         o/ay8r6qbVWz8GZYZFuSQ2gw6snycXWxgie5sXgZK++J+/9U60SjAIA+qzUPxo/MdlFD
         RrXxX0yIdup4PxktBJI/0YvTlLHeukitfxGdE6MKFSYSMYOC2dK4VVJ7oaEu2bFeGjak
         rsKAmqkCO7lT1lGjRSh7kAvX+B2tRHA1hEIUbGPXQNoBTmS9F1JDmcmdIs/X7FWlj+Hv
         lVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BBxz+yrHbB28ElK3odkOn6nP//maMAIfieOQZI+uRXg=;
        fh=Xez7PlB6B+DijJXd2Q1SwDqqt+cg7O+7aq1qjxAJhck=;
        b=misf+QxXJTFsv1KDjcD8PPbxflvbTXxs7RNzuPe9imgzKXS7ygVcKbzoYyLlXQd3Ct
         HeQzc/UROvPOZTZOjlu8gLwxMS9+s0c8XSTjyfRiMnH0bQI/ia7AY9EyBj8GdevPVW6T
         05pLtEgW+av3JE/gNpzElvco+XMGRLqfjibcX1ueisnKCCiz6pKMxEyJFwk3lcg+fDkC
         UiTFxSQaFljWtiUDq2Y0Kvo8HnlaIhTG8WYq78mcvXP9Mf+7fx/9DF8hFjy3vUowqCVh
         5rdC0YIygZh2PaRSuJL6R1Q96xSDvzEDgMEnf4iuRt39Iv3kiy3q8MP6Bcqm1pPXnb2G
         6JUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TRC2TAri;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe84077f6si16997951cf.396.2024.07.25.07.40.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2024 07:40:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TRC2TAri;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWze0-0005xD-GR; Thu, 25 Jul 2024 10:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sWzdv-0005rW-SP
 for qemu-arm@nongnu.org; Thu, 25 Jul 2024 10:40:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sWzds-0006pH-7d
 for qemu-arm@nongnu.org; Thu, 25 Jul 2024 10:40:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3683178b226so607046f8f.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2024 07:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721918420; x=1722523220; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BBxz+yrHbB28ElK3odkOn6nP//maMAIfieOQZI+uRXg=;
 b=TRC2TArirzkDX1J6wUxZKTrcHICdeu2qRF8QP64HrHDf427cfH2Ajhudrrwy8JwJsJ
 v+1/D5bxW/JxzrhHxR+ssnwtkNLxwCG2DbVTsyt8iDT9YgEE/e/dowxf3f0DV4nN/v76
 q1HQAOtEDnT9FPxqGXr998S06WXSbEKvgSgLfu2nm+KIyOZXbrGEnrnRr9/8VWlrKc+I
 keFVGtC4ySeWtpg6X0v38fbO2V9DF9n2ziljx9Ntu02jDDghYMcYT4KyvSriKDuCYtX8
 xMvDgabS72JiNAAoE89nSuhU8ED2R5P3VGpmMgb40bW96Rx5NykFaLiVT2KyobRW2RX2
 TjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721918420; x=1722523220;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BBxz+yrHbB28ElK3odkOn6nP//maMAIfieOQZI+uRXg=;
 b=einoYkT6TwFkgphRinF/cxmPVqdZmNe6bmD05Cmp4PVQZW4JztsMbq6dk9Ehxs8a5r
 aAS87aFzKt4uia92K0MP5cfsJtIhWH9ykKTIKmfrKdPtY8du/qGka8/HCKgWL1g7+yD6
 RFjJ04OcPozZs+IDG4Ow7BqRqxoAhOAiomq6rhiYffi2tyohiBuv9gyuDG8LJZ6IIYMC
 R4PUzsDfi+YFRuyMhEtvZxZkFUHaUg1ndQb5Z9CT3+Ws3nVCMeD1X0MBdEP5E7BxewG3
 Y8ZohB2KHdx+sWXtcuCGJX7KZhUzzsz+o8xUKrU3HpCLZ12LDs1twv7VyKHFt1sxBFtS
 du+A==
X-Gm-Message-State: AOJu0Yzn3Tvji9DzZd6lLIYR9kquZQvvnGMrsh/sZmU6kXymxm0Hxhtp
 b1v/hSFh/baZ/E6AGnZ+zkng+4Yv8h9okrverCVX2YTwhDu8EJd9Sn5D26Y7RGJBG7rnWcr8GZ9
 yZiE59gWX8CjHpt63aHOcOMoED5suKLhQlo9kBQ==
X-Received: by 2002:adf:e744:0:b0:368:6562:9024 with SMTP id
 ffacd0b85a97d-36b3638a0b1mr1526073f8f.18.1721918420023; Thu, 25 Jul 2024
 07:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240722103531.2377348-1-smostafa@google.com>
In-Reply-To: <20240722103531.2377348-1-smostafa@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jul 2024 15:40:08 +0100
Message-ID: <CAFEAcA8cM59E3RiUD7vXa8ca2fbQues3HqaQzwOV3_-RUXsdug@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Assert input to oas2bits() is valid
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, qemu-devel@nongnu.org, 
 jean-philippe@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: DYuzJ1VXUTHj

On Mon, 22 Jul 2024 at 11:35, Mostafa Saleh <smostafa@google.com> wrote:
>
> Coverity has spotted a possible problem with the OAS handling
> (CID 1558464), where the error return of oas2bits() -1 is not
> checked, which can cause an overflow in oas value.
>
> oas2bits() is only called with valid inputs, harden the function
> to assert that.
>
> Reported-By: Peter Maydell <peter.maydell@linaro.org>
> Link: https://lore.kernel.org/qemu-devel/CAFEAcA-H=n-3mHC+eL6YjfL1m+x+b+Fk3mkgZbN74WNxifFVow@mail.gmail.com/
> Signed-off-by: Mostafa Saleh <smostafa@google.com>



Applied to target-arm.next, thanks.

-- PMM
