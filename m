Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp616672ejb;
        Fri, 8 Sep 2023 11:35:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEucdZs+FZhFUSgz/TW0SHe2zjALexzGdydWc683WrzAb98SeE1b47CxsDN9UuNhBdGo8PM
X-Received: by 2002:a05:620a:46a9:b0:76c:e3a2:e73c with SMTP id bq41-20020a05620a46a900b0076ce3a2e73cmr3905750qkb.18.1694198123269;
        Fri, 08 Sep 2023 11:35:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694198123; cv=none;
        d=google.com; s=arc-20160816;
        b=QsBXMKmtcWvpDAycaSI9qJQrPbLANt0+2YmZE83k2hGNYMtpwCYW5+QNTndBNPQyGr
         buOd7tyOgwzTzle2UihU4gG4GHia2vlpt79vuOhr2iZf33Y7a98+imoVt3vVUfHWF0Pf
         IB25vOBoqnzX8eYztCY4cN2hjilLr+sAEy7ZDHbckOOJ/OXEvX5gImuFl9E+aKNig7/U
         X5StvMXyFeCbYhR5f3pd+2tuSuf5cJ4pXw+/eOnzPcvEjFIRbUuWtWR0PE99cgCmbN5r
         fsIJjgA599q0Z2a4VhoXj9LMSH8GBx156lwR+F0VnlTACLx1vkd2dIi4zKr8nYB2nSXU
         nAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DwOs+oep05OkJ7YNSfXeMBL8IW6d898T+S51KR4qq9w=;
        fh=mQRietVuQWYYDWSB3j2PCXbmQvkrEzlVN/NE47iC9ME=;
        b=ZV46if48dP7d8K0EIZCQq2S0Wf+912PvqaGiKiftraYPjJ0ttSPryF48bABttt2/r8
         NfWawhX55GZR2Ma0Pdy3uSlfGveayGxuWh8LnUcOnA1FgtRLxlmiFOIFKqIdSNCyG/SM
         kegruPSHdKEjqy0fJUNLeiWM8dugfPBks6LopWK6C5z9CtsqWBoJPQVFnyFKBjztOv0+
         aPWxoYT6FPW9Ns1zQyreFqMxeNRp9gaWnSP4LlyyWJ4nAmpb4yWRlFh1WkwjSRCgS+9Z
         XiQSrlSDSuWaCuz9rN/vHMHg4rRDK6ABHz9aPtKqtEu9YrdNAxNBt/xT8MCwnA1hW5Bf
         jDlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rut/wnlc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3-20020a05620a244300b007683f5f874csi1419193qkn.645.2023.09.08.11.35.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 11:35:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rut/wnlc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qegJy-0006Cs-I2; Fri, 08 Sep 2023 14:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qegJx-0006Cf-Lz
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 14:35:09 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qegJv-0000Ss-DK
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 14:35:09 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-52c88a03f99so2997570a12.2
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 11:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694198105; x=1694802905; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DwOs+oep05OkJ7YNSfXeMBL8IW6d898T+S51KR4qq9w=;
 b=rut/wnlc+/2OQR4X6kGkCnVBJvU0bVchD5ktxaqR3rWGbkU0o0UeBTrrhIjf4PEZzs
 rWDmjMjF6ycLWNxmLtFRglZvoVMPoEhfH9JwYM0Ssy2Uz6gvcIgnHG6zNKIMXEwFi+3Z
 n6Tost6BGmu/2EM51ic6HgO/MOj3JoP8tsGxpPeBO3UNXqLYwwgnaD38+Ad67y0lVLNB
 PXTMIuKMqQWNEPae/s50fjh18hM7GJrNbusZCsahY3XSDi8qVaL0m5Gkic4hVBm7i9xQ
 vCTuAD/+h/+e7QJS48Z72i+PY68MUPd9QnREXp7uAT9GuCdLxS6sz5x4IeixsMV+Njcu
 RiHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694198105; x=1694802905;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DwOs+oep05OkJ7YNSfXeMBL8IW6d898T+S51KR4qq9w=;
 b=ZU/udjLVfvtD2mVaxpY9yrLHlYZu66RPi+PY2g9fe//3pRIX1HYxKyAKML5Jl6uRrP
 PTzRzF+q7B5FZ3B5R4N0Gvl3WKo13GVWbEd9gQ+9BOrEddw9EGEGRnoaZ97IlO9HC7+G
 TIjF1VJT3DWDPDlvXBdDqexRid2ipp8qPr9/J/xTPsQWB8YvvpQfLc/X492Tf+aifhN4
 u6siT9/pwNgbx1vmeWUrqCXFlXgJftbiTLROoulFYbdu4U32yxGPjnt4z+E3Dwg3wu5C
 TC9NFnMXIl6o6yvPt7ZZN3DidelVYZe+YL0nmPgv/W2Tscrzz5eVhGexms019esSR5Ua
 nKgQ==
X-Gm-Message-State: AOJu0YwMfL+n8UVhSd+jkIOCFcrOjSdZypxZ4r2GOzs64XVgvuQ3VNfk
 ws63UXGiRvm2LAq9drS/n3yWDp4/WTzWWh0uOiP16g==
X-Received: by 2002:aa7:c74b:0:b0:523:c35:c209 with SMTP id
 c11-20020aa7c74b000000b005230c35c209mr2399592eds.12.1694198104610; Fri, 08
 Sep 2023 11:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230831171849.3297497-1-tong.ho@amd.com>
 <20230831171849.3297497-2-tong.ho@amd.com>
 <622751d4-8a89-b34e-171f-9e9f7ac99972@linaro.org>
 <BL0PR12MB48829589D59FA02B93549E65E6E4A@BL0PR12MB4882.namprd12.prod.outlook.com>
 <CAFEAcA_KJFnxg-msgwiaFBzPYkj4RPQeYwLzd4RCy3_br11AGQ@mail.gmail.com>
 <BL0PR12MB4882D72296EE27610D9B04D5E6EDA@BL0PR12MB4882.namprd12.prod.outlook.com>
In-Reply-To: <BL0PR12MB4882D72296EE27610D9B04D5E6EDA@BL0PR12MB4882.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 19:34:53 +0100
Message-ID: <CAFEAcA-F21-kpzoUNMiUJY6t9eyMueJ7b6RqgVOgAu_ZwdRkog@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/misc: Introduce AMD/Xilix Versal TRNG device
To: "Ho, Tong" <tong.ho@amd.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "alistair@alistair23.me" <alistair@alistair23.me>, 
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: 497x/wembe/j

On Fri, 8 Sept 2023 at 18:56, Ho, Tong <tong.ho@amd.com> wrote:
>
> Hi Peter,
>
> The Versal TRNG device is required to support both TRNG mode and PRNG mode, and target/guest
> software selects and changes the mode at will during runtime.
>
> I do agree that, in the TRNG mode, the model using qemu_guest_getrandom() will work without any issues.
>
> When software selects the PRNG mode, the Versal TRNG device is expected to output a reproducible
> and deterministic sequence of values for a given seed.  This is part of the hardware spec.
>
> I fail to see how qemu_guest_getrandom() can be used to model such requirement correctly.

If the hardware documents a specific RNG that it must use,
then yes, we should model that, and the comments need
to make it clear that we're modelling a very specific
thing, not merely "here is an arbitrary PRNG".

-- PMM
