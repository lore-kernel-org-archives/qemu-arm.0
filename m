Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4887819lfm;
        Mon, 6 Jul 2020 06:12:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDghSHl2/WYwJ6w+06jX2u/4rkpxFDk389tb/BCcJHwHkp2jxYg9JK13MlYIwkbdsIigtE
X-Received: by 2002:a25:c306:: with SMTP id t6mr76340329ybf.297.1594041157906;
        Mon, 06 Jul 2020 06:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594041157; cv=none;
        d=google.com; s=arc-20160816;
        b=ll+5ifHVkS6mmybzx/s/ZmfY4f1/5JR6hIk5Yslc0017BLujhsGkJ8akAgijbsZ2j/
         x01TdsD+zK5ey9hvFQu+VqewDI1Cn4wafSBFrscReQjUzWvVk4w6aU4bgL/ZyTng4Lrc
         FpYNMGc/826j1gOCvbPV5AL98TDVwLnayGjSMwnFC5DTd2AWUnPZIT1pD/RAWaUO/UoM
         TnCG0s9oLby3rdFxXA+fzth32DIiQv3HXz+pYRW5vy/xWEjVlWzRhbd1GP8Ae7Wwzvi6
         6lD1eMIS05hQjyPyeYZQRsxwufJ7zLjQlYHilJ1ZbOwiZUODLzt6JvD2tZmg1P5ATQuV
         wjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HJZIVMbh85zgg52/dXzLSk9awQ2Rxw7e9TOEaFxQrWY=;
        b=BfluwB68rzaJjbCqncnxB+BjHSI+k+wuBQ1VTlctnw3O3zNehWQ8a9SlBgCNAJEF3n
         1IBDjP3HMvwXSR9/8nKpyI4BbLf+nzxq/j4XE/ZiDkga1R2wy0PYIFaZd9UbPj2TzUOT
         TZ0mpqIAwgL1Mwh/brZnUMDozc58+r7vydKc7FhHlGmn7b3YqKzwhuSmtP58vOh0cUa1
         k37Xj6aGLHBJi46yKfA1nrfvmxYKcxqZ0TMxFB+BaYLwNXQH7SA8rG73lELnIckhcDE0
         enDvIJ88NPSeqirbKPxWKsmgToNSubcS176neT5lMxMpJknJtBQ3IDw7LKdL5OMV/rTO
         B2gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OUO8+X50;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g204si19226872ybg.404.2020.07.06.06.12.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 06:12:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OUO8+X50;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsQvF-00068a-Bv
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 09:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsQuZ-0005ZN-J2
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 09:11:55 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsQuX-0008H4-Ti
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 09:11:55 -0400
Received: by mail-ot1-x343.google.com with SMTP id t18so18774506otq.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jul 2020 06:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HJZIVMbh85zgg52/dXzLSk9awQ2Rxw7e9TOEaFxQrWY=;
 b=OUO8+X50b1mtJ322j/BHoRQm/GBGdEN/GDdaeN3LvH5ZMm6dEbTRCZdCE3lq1SnYfM
 D9slxNF1DnJN72rwOpMjufmFI/5dLPU93/o3E8r/MfjvCzJIoIwHNyoOAUTBzEIDQNpO
 dFx3JZWDooRVnFAkUy7wSVTCa1JaRLq9nO9EVnWP6oSr0+Tef5bGc51OjnocKzeTcOwg
 ViW76joAMWl2yIabdnOxBW7EECux5H3SumdL4M8b+cOdsJrY+1thqb1/OYXS5hZ/U2s/
 aqHKemXn4OELDolnPRTTAGJJ3mdp64MAjL2xKtiBBHyw9QkkIAcUo8+5AszF49kAgeMl
 0IVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HJZIVMbh85zgg52/dXzLSk9awQ2Rxw7e9TOEaFxQrWY=;
 b=YD7q0h+3WeRYINhsYRtqMmiWiJc895XhmKyeoqfwTjpss+1ZaP6zpP5Pr3yAVNFmBW
 S4+FcQ9KSGVtB03Bcdx/Rf2HrXc3wwDIV2zb6ZK64kjP10Nkf7oMNeGq+YTSEDG3bHqS
 to1BuCZekuuweFurQRyr0AzKNTIXQBN6Pxm27BCLAyy/aMx2g503OPR3FbkFytLhngaM
 +h7s6nj5q0LfHnPO8/6+7rUfBMLbuEY2s9OVRPmEY3uZ3x3E+eSwhqwPt3MfrzWgiwR3
 W5+r7lNGQq916hc6HnnlMiPFNko0Rn8MtBS/25d9XkDny0S3yxI74L9nnM/bELMPe3mY
 0PNA==
X-Gm-Message-State: AOAM5323l4UERO/4eI49Hw7x3D/7R5Md7S+SdTB3pVvz6WC7sY7XKj+F
 54o7apOXuTTF/wFHZjsRkpoyl1s+JcafxLjlnlaywA==
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr33885658oto.135.1594041112393; 
 Mon, 06 Jul 2020 06:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200702152659.8522-1-eric.auger@redhat.com>
 <20200702152659.8522-2-eric.auger@redhat.com>
In-Reply-To: <20200702152659.8522-2-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2020 14:11:41 +0100
Message-ID: <CAFEAcA9JA5xe4o_7C71K=hVDeCyno20WPi9mc-Nc+m6jvXzhfw@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] hw/arm/smmu-common: Factorize some code in
 smmu_ptw_64()
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 zhangfei.gao@foxmail.com, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NV9iTFxsSMjK

On Thu, 2 Jul 2020 at 16:27, Eric Auger <eric.auger@redhat.com> wrote:
>
> Page and block PTE decoding can share some code. Let's
> first handle table PTE and factorize some code shared by
> page and block PTEs.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v1 -> v2:
> - restore goto error in case get_pte() fails
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
