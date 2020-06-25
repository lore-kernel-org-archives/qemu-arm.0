Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1430545lfm;
        Thu, 25 Jun 2020 08:54:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxisJVelvDJIXbGCVtghhB6kZWVImjz/6SzQbLe6ZcmyF7DRR1Yb8f3a3NLpCeTZm+igyk8
X-Received: by 2002:a05:6902:4a2:: with SMTP id r2mr54733857ybs.176.1593100489109;
        Thu, 25 Jun 2020 08:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593100489; cv=none;
        d=google.com; s=arc-20160816;
        b=PnB6XjStLsBh8Ruimz+aI/WR+i1aupUhCjtX+5YSwNONv1KldBjYLUiq2pM71Uqz9B
         WU/dmsKkmmWfTv/tz+h5kGQQgcHmhWxj801VeAKe//71KGzvqvhrkHBWgQdo7fpHunyR
         +L3JH/MjydI2SuawWVGyN0BoPV6ClpgXzvqC9mHpXvEoB7QnCokmw6znq7Vl5tDnNpkA
         mpm4bbavxqi0Xij+ya9zOvRKNZRa7w1vCiMoN9LOpueTDE7+F2R1hcFzLWyeasP6m9q0
         tGQTnpg3o+rkxBD+tId2uICwQlXIYB0MHqMPfy7AVk0jW1p93wLaCdnypUT23GZWSW/3
         ojgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OPobJVv/bg8YqK/ZN142RvDlQ5+alsiGLy9Ctc2eeRc=;
        b=wnmgkXPVOla7C5NtzjQOQGocyEcPeIsJbg+QZkSMGEUZZl1a3Bkf7i/LHcawr5krVD
         YBtCF3ex8WM3cuQHJTb6f7d49gaB1lUoyrUkfdBNMJZbSimYWQw7Fa8qIPcFsg0voRkH
         y+AWS2zQX/742z8YvDs6mS+BbUh73/ovEdBaqPJh2eTKoLA1GHrCnbm1e9qIZJOOfbG4
         08aPZzbmBB8jRRtD3VXgvTIuYCFvUcuwnX3X2htQCFDq3f9GD4l66Sw+m1/Q5sSbo+FN
         7ooSXOtz7bgzQoZfiZKvGjBuiPUaQHcMYV7fUvZv69zEyOZn5sqJm/SvprAqc+BlqEOQ
         6x1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hKcHQjuj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si22048754ybn.417.2020.06.25.08.54.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 08:54:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hKcHQjuj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joUDA-0003IN-Ez
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 11:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joU25-0001uW-83
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 11:43:21 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joU23-0000BW-H7
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 11:43:20 -0400
Received: by mail-ot1-x341.google.com with SMTP id n6so5708334otl.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 08:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OPobJVv/bg8YqK/ZN142RvDlQ5+alsiGLy9Ctc2eeRc=;
 b=hKcHQjujCHHX8tQZTQiwOO1gd2zW+2NWgpsZbDU/5JUEP3JiYjmqqzRHn9FS4IfyYL
 VxRCV3DalUKOku5zQ8a3ys3xUTYE8MmTwwzGxhXZV5biI7azN9IO/bZOqzPHp4D6+iH5
 FLMiPjks85EgFchdoiK3kwVVBtiDw4/R8P8QT+gSSnJhJsfGS/dS6rqmoQ2o7FEaak4z
 btA3bP0mI88LTe5Xhw0DyFRc4e0DjY+QnSxH4ihGikfk2OEL4WRm+dQG8LE8hVVRcUAs
 oKEIRMI5gubDg6efZ4U1JycQ+nU9ha/lSBJkiJYwqfp1iEdTbB0ayYtPHOsGOpNJbnZ0
 cc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OPobJVv/bg8YqK/ZN142RvDlQ5+alsiGLy9Ctc2eeRc=;
 b=CfZozWf5IZ9vrZsOhHiaQn1xFQxP7mg9MfccIImi57ZQCccU5e1Fef7rPqXPwAtxwc
 ny516DEDZsFDn03Av+hh9FZa6IKK8sn3gt5AcRBjAsKGrj6UsBnWcB4YNLNCGXTpwkvH
 ekZVN9nPZcKSOHhFLZnrRQ3Oala1w43X7sb3ToY4TkwpWaEeS9mWbesxIw9oU64uAFgv
 /upgjiRjA9h7XVZG5F9s7L7uAiM9ydYAkTivsmS77D6xHsJ7UpAhGoLMN5hMdJ/E2r7U
 Utw/7w0kX5zUuOZSn/zfBdRoLGJknVxKX5spgeJLkQ/gU8naKMpvpwC+uetQh1+s9DIb
 VOug==
X-Gm-Message-State: AOAM530LYH947c1qk9xc733SckZ6DxF2j1n/fIjKSYxZ5xjowqssSXX4
 +CQqIwl0sg8LQFUEHlyBDkxa3HIMh4fYkgVgMT+k4w==
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr26096902otn.221.1593099798111; 
 Thu, 25 Jun 2020 08:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200611161500.23580-1-eric.auger@redhat.com>
 <20200611161500.23580-9-eric.auger@redhat.com>
In-Reply-To: <20200611161500.23580-9-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jun 2020 16:43:07 +0100
Message-ID: <CAFEAcA8_ESO6ofRTgh2z2fvmaASSrOKg7_bRqsuR=DEv346p=w@mail.gmail.com>
Subject: Re: [PATCH RESEND 8/9] hw/arm/smmuv3: Get prepared for range
 invalidation
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bqttRosR39IT

On Thu, 11 Jun 2020 at 17:18, Eric Auger <eric.auger@redhat.com> wrote:
>
> Enhance the smmu_iotlb_inv_iova() helper with range invalidation.
> This uses the new fields passed in the NH_VA and NH_VAA commands:
> the size of the range, the level and the granule.
>
> As NH_VA and NH_VAA both use those fields, their decoding and
> handling is factorized in a new smmuv3_s1_range_inval() helper.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Haven't looked too closely at this patch, but see my remarks
on patch 6 about keys and lookups.

thanks
-- PMM
