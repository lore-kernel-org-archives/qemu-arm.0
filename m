Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1390723ejx;
        Mon, 11 Sep 2023 07:37:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8kLmR94OXChewJlBMquGuOJ/Keh/pZmzZqZ24aSyKg53ySoczjpyGeG6WblEECywqFtQw
X-Received: by 2002:a05:6808:1381:b0:3a7:73e0:d18f with SMTP id c1-20020a056808138100b003a773e0d18fmr13042590oiw.14.1694443023162;
        Mon, 11 Sep 2023 07:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694443023; cv=none;
        d=google.com; s=arc-20160816;
        b=gFbMVwlogtNY73YFZKg5e2zlafHoSDWYL6lftt54hQqO3XVMwk8JrVwT+rt6v37JPD
         oMj4KmfsKTuh3ubgRQfWbUVlrJqV8R0U6haoD/x6ykWtKH1wAlzssfdVixXIBkpQAjM1
         nwJt2n/aQ6qOB/MIU9IULo0cuEGN/gNLterdtjGFrNyx9uSZ4+xKJCRDTF/emDFasxNT
         bWZxYNBhKDxQOPBYW4K6X2xd63C/NpJvm5l1xRbIiH/C2wfSFFbweiNPEpmKJ7IbK8Zh
         ZltMkkKga05PqsEkleTq8NAotrZnJ2neZCGIN3LB0D3DBKkgHiWiD3K7A1xlDUb8q8VF
         3Zxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P56pw5Lv6S/ZtHI7icBsS2sYRJaov5ujkufLSu6W+0k=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=LEJ1z3djj9bdesvvJMwk+2sDMahWHcL92LSZNd4yXmfc7vdiXjDhfSrxzI16mAHEhi
         LR87HQl5Mp372k3h9EGYjJ30DVLJozOn35RHdXcVGHcJLpKPeIsgKkw0P52vLgUH2bI1
         MZas+SAKAWR7Vh+na1vtYdyK8ydUOQNmhJDg24Q+Nmce3SgZj5NJOjp7ynGfPbWqtSR9
         sm5VfcHWHo2CBmqn9TfUTjw7dpE7RdzxrYkH/W5B+3sDDb2Rsir4B786m8dxVkUTzT1p
         sfA5U2eiIDqrDhy0Rg0oI5SI2WmN72jLVHMbKdxIS1OeqbxohrXjYYCoicvdeqNei4rr
         LRWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nZ33EJ/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1-20020a05622a130100b003fe296f07casi4905242qtk.302.2023.09.11.07.37.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 07:37:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nZ33EJ/f";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfi1x-0002EX-Sp; Mon, 11 Sep 2023 10:36:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfi1x-0002EH-9Q
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 10:36:49 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfi1u-00055o-U9
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 10:36:49 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-52713d2c606so5916088a12.2
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 07:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694443005; x=1695047805; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P56pw5Lv6S/ZtHI7icBsS2sYRJaov5ujkufLSu6W+0k=;
 b=nZ33EJ/fCS+N649F7+UBNTJYGQVDOVozat2V98kPZlSGVtzCM3rek2WHjPnqCPEbAs
 AmbPoEz3yyU1B7T+brw8VsiGUeVeZJNm/tArK8Cv2BT/DUO18i0SJkIW2j7FDmJZFhqA
 +lD/d3BrzBuNtSn3QG1VLaFvp4Q/MpoNYCqKGpOWhDM10gP8KyDs3j1VuJrFiVUnqcZG
 vDeXfHucGgghPVy/8YIir6g3CLfm2MvbzwVvZtLLiQNUp3e4OBd8Q7w+UI4x8G6hnBtW
 tnT70KalFOkqthDinDgB8CAcm8+Xl363hrObvKmczniNzgPj8UIAXLvlBNXm+VezL8v9
 3z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694443005; x=1695047805;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P56pw5Lv6S/ZtHI7icBsS2sYRJaov5ujkufLSu6W+0k=;
 b=dvV/+ppyg2S6Enckj+g5fiRP9gRqfWv9ZzYVA0JjCb9NX5DweiljxFbJoWM0pgFz3G
 CVzvBM2G4a4tiS2A0XWnoszMF3rWhGYPhM3l2sDN28ClKvy6QFTJaxJ3Im7B/FVR33ye
 pc2EVxVJYxxgPy8PxVDtcFHDcU0AvYV9ImzQHfBpz0xbfdnMu7Zv6BMJnyO4Ju3xyw2n
 i2dyYM9JSg+JDHWEYFrVQXjRzMs1Q+6UHKL0I/xBKRviK9wjkvaotkbKAm3Ncj+6HLeA
 3yAwelH0QF6wHBgC1k6F6z45AaY9eqzZRvBRhZILM+HehR3gtTZVoaYVqbBPj0NzKbGC
 qx7Q==
X-Gm-Message-State: AOJu0YzwZoeMvEl2DEzGhhj7yYhPlFEgmtkaZru2vh34OFar1FyoLw2p
 B1RTY4idh/IQe0ueeHqhmmsg3mLoUGJ8B+6s03fJvh0oE4vMb74O
X-Received: by 2002:aa7:da4d:0:b0:523:4acb:7f41 with SMTP id
 w13-20020aa7da4d000000b005234acb7f41mr7693001eds.14.1694443004992; Mon, 11
 Sep 2023 07:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230911135340.1139553-1-peter.maydell@linaro.org>
 <20230911135340.1139553-6-peter.maydell@linaro.org>
In-Reply-To: <20230911135340.1139553-6-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Sep 2023 15:36:34 +0100
Message-ID: <CAFEAcA_O7T40AXVDd9H1==prySSEDv+0dZauwLDFGaxPTriA2Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] target/arm: Update AArch64 ID register field
 definitions
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: 8NHVNfD8Z+x2

On Mon, 11 Sept 2023 at 14:53, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Update our AArch64 ID register field definitions from the 2023-06
> system register XML release:
>  https://developer.arm.com/documentation/ddi0601/2023-06/
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is intended to allow updating the set of ID register
> fields we expose for user-only mode, so I have only
> updated the AArch64 ID registers, not AArch32.
> ---
>  target/arm/cpu.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

> @@ -2299,9 +2317,13 @@ FIELD(ID_AA64ZFR0, F32MM, 52, 4)
>  FIELD(ID_AA64ZFR0, F64MM, 56, 4)

I missed one line (failed to save editor buffer...):

+FIELD(ID_AA64ZFR0, B16B16, 24, 4)

-- PMM
