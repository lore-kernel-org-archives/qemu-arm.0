Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2872057ejb;
        Mon, 5 Jun 2023 08:31:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5l7fYEPE3yv3RrgxuZBPhR2vrdOgHsmf/CwLA63zCGCiy3RxAvN8AV7u+O55SQrLjtw64e
X-Received: by 2002:ad4:5bc8:0:b0:5e9:2d8c:9a06 with SMTP id t8-20020ad45bc8000000b005e92d8c9a06mr6922016qvt.39.1685979119699;
        Mon, 05 Jun 2023 08:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685979119; cv=none;
        d=google.com; s=arc-20160816;
        b=rhiXZ3frGgvS8k8xkpnfMFYMhw22uE/52HiV3Rbm1LcX1dnAsJWRB1syAd1MflqcEa
         NX68raWEih6slceARogd4X3fX/HYEdjK6xu1wm2nfJD9wB2FQ16FPg2AId4tscqc/znX
         azKIlninuNJ1/fDZZhzeFVnUhlrsh5i1tfvtabe5hM2kjX+rTIIgk3Sx9RPdZ6o/rQ4S
         IbhBoovqAiKE/wiZdeScSdi/9pd5b6EoVgwnLTeGxaLaptHLa0/OUSuaXxFouJ3mu4Li
         jq5+16RZqWWpaJHV3aWsdF1ZnBnJJIavP66GaUM5Mb7pAX/p5EMsIa6QSKC9q4haeW7r
         QI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=FtGN9lzh++Kjs7WlpOkGj/xHKtWX1JywaOWgqN88Lic=;
        b=tSR/N7jBtD/SE0RyLbGecvXFtoMDA6Q89spc7OY8dDG4uhccuIAZddQckxRIZh7SCH
         +P/MVPSjlvUTwACRGpBjNcUeTR/hTWdW4to/6EeloCYJv9kHnhoBITW+KuBfTeZ3DtVN
         t7VqzWMLXPXl1JzR2Z8UqzDM6afSOEyifxjIFERUU+mLvSj6SKaLMs9jNXARDOiC/7P0
         EMlyOtZDV8VFhRFdLaOcv7BImNmAFaFJ1GNWzTg23zP0W1yirCEWVPo/lhtSAL5qpE3k
         FfuTSOXe4Kbwjzn3YHO386WAufAoTWvLE66HBHnPQbI3i4Na3WWix9CWuyvrwu2fIFz2
         vbhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uQ7Bt2fh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9-20020a05620a152900b0075ec7f9e8e2si73458qkk.263.2023.06.05.08.31.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 08:31:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uQ7Bt2fh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q6CBQ-0004aH-AM; Mon, 05 Jun 2023 11:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6CBI-0004Y2-4N
 for qemu-devel@nongnu.org; Mon, 05 Jun 2023 11:31:44 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6CB4-00078S-C9
 for qemu-devel@nongnu.org; Mon, 05 Jun 2023 11:31:39 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b1badb8f9bso30823031fa.1
 for <qemu-devel@nongnu.org>; Mon, 05 Jun 2023 08:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685979084; x=1688571084;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FtGN9lzh++Kjs7WlpOkGj/xHKtWX1JywaOWgqN88Lic=;
 b=uQ7Bt2fhS3wA/sfGoxQ4mIB1gbCAQSDvpLd1EPKViz0XvR/UPhm9tFvqlcTvJ8i8cZ
 oq6jHjeWlTJmJmJilKu6bdC1Fe6AgZI8XolR/vSHpiM4B+yaAd4Jkkosr/fBlBVANiYD
 oBh4hB7HjVbcC63lksuZyHGxsqPi+WhoM7i6mAvuL0bXkssElYc38wp+Yd3kMTosInIE
 3xQin22XkgPyt5cJqQVd6iJZPz66xB0N60BUIBXoY+NfCWxFF6JYptpVWkZUy7hsCkk8
 orDmK3PKiA4l4EnKGBlt90AbhOKzqtaEJV1oKauLKIyZh0rRIheYQrv82E6haG26Qlel
 Uh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685979084; x=1688571084;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FtGN9lzh++Kjs7WlpOkGj/xHKtWX1JywaOWgqN88Lic=;
 b=RQtBJQ4AJKZjLOPNlptEkadrAU+9dtFN0dRFwhEJxIVw/4ih+LBHf55v0F/JPl/beb
 /EAGD1j/Vk9QxNdzg7TJ/wtCBPKb8eVUKrT423uIoGb0jj4TwmBo34oBnORrLXAuqtWI
 sBMspAqoFkv+nSWVE10Zk2fvsuBfAbP6OtxIYqle4AsT5LHSuvmzgFURFad1TwfRMHUk
 GutXNftjw8ETYHwBOpUjHyA5FzEFL8o/SXPKWfSzCimr8lx82NO/J+iTBmM65bV18c6y
 7HHTG0lQmbfJ7cD1K7tlb47BcLRobQzbovjGV0T4A1boIUphtSLqmjDa7dJD4O/DAW/2
 kzoQ==
X-Gm-Message-State: AC+VfDy765zUsFwqyRlk9U5dMuHX0FT5IsTdd83IomMWicJAt51l/L5I
 niKTNbpw1GUzFzH5OqEcn7GQjwaE+VMJlCfww95t8A==
X-Received: by 2002:a2e:9c5a:0:b0:2ad:94cd:3cb7 with SMTP id
 t26-20020a2e9c5a000000b002ad94cd3cb7mr4275539ljj.51.1685979083985; Mon, 05
 Jun 2023 08:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230523100508.32564-1-qianfanguijin@163.com>
 <CAPan3Wr1phuot=613sXh-hT0An1-A5vuhcxMZ9SCGTze9w_PdQ@mail.gmail.com>
In-Reply-To: <CAPan3Wr1phuot=613sXh-hT0An1-A5vuhcxMZ9SCGTze9w_PdQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jun 2023 16:30:50 +0100
Message-ID: <CAFEAcA_6hcAVef1HCcQHMF4qsxGrMGuFeATviJdnCzVXSkvZng@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] *** Add allwinner-r40 support ***
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qianfanguijin@163.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5quPnN4sE9IB

On Thu, 1 Jun 2023 at 19:48, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> Hi Qianfan,
>
> Thanks for sending the v5. From my side, I have no further comments on the content.
> So please feel free to add the following to each of the patches 01-11 in the series:
>
> Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>
> As a reminder and explained here on this page, you'll need to make sure these lines gets added to each of the commit messages:
> https://www.qemu.org/docs/master/devel/submitting-a-patch.html#proper-use-of-reviewed-by-tags-can-aid-review
>
> Doing so would require you to send another updated v6, and baselined on the latest master.

The rebase was simple, so I've applied this v5 to target-arm.next.
(The patch application tools can pick up Reviewed-by tags that are
on-list without requiring a respin just for that.)

Qianfan: thanks for working on this feature and for your efforts
in working through our patch review process.

Niek: thanks very much for taking the lead on the patch review of
this series, it's been a tremendous help.

-- PMM
