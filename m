Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3471528lfb;
        Mon, 13 Sep 2021 01:47:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWFVkHyPkSiZ2kMqsmug9+9rPBGQgt44k3gJUWBpg8yvkQ/ZQwT2k2hPOstczPN/U7ZXSt
X-Received: by 2002:a25:424a:: with SMTP id p71mr14051384yba.243.1631522864930;
        Mon, 13 Sep 2021 01:47:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631522864; cv=none;
        d=google.com; s=arc-20160816;
        b=Ztxt1QCngZEH4pBrwLGFgKrOEYDlejGCTeJZIlyQbIr/kKw18jl++EPwyGWSX14Ibn
         tIsNWmKIMHEZm8X0kGp1UTFL0H36Vda05xln8JlxHNh/i1olhNYhQ6PwrarpzwGXYoeQ
         vdSL5KP2Hw9d+jko6vzFKksaVNR633wl11n2gj/23e3MkugLyj7S0dzkWYoOmCWGgCOR
         UUVE0/ze8vgrYcfN653LiJCtnkurTUhvb0wVJ8bQpiYa6PORQjABn4XKiVItUmxYprSV
         zxZjMp5UqfJUJvmNnuwenEzjUBANcef7UIRACR1/85AEpbfr3dm48kQ4etvTxmicNKiQ
         fWSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OfsnD68QQ/T9iWz6jm/a56Xia60wrmmtfyBwat15JNw=;
        b=iFoN7mSz9PRBOTvy/Li9lYh262FCqzs7HhjhMFLo/8/GnB3D6Z7G5SKs9i/g1Kq6Zx
         41MZZdhqdRZDELXQARUIMAlinEMDdzS5drhekEvd8wLNEthrYS2V4fkakTiSzF9QQy/R
         rpvClr+PBN6VMr3qP/chZpIAfEKjd4sILEqQuH5l7xJh88RjBvBdWU7MNp6Tmy1A5wmo
         3CXv5160Qpj7I4OMfYPrr/Q/Kbf2gSXwn96we/bBqfySOc7NB8LYF7R+7jd8Nj3Rfz+n
         16objDDAK561LKOUrRn9NnYtKSjlKC2MHQ+Gbr27vHJYuBMzCNARiMuzWdzCUvkPDlqp
         runA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mt1elrNY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q82si7743022ybq.502.2021.09.13.01.47.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 01:47:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mt1elrNY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPhcu-0002Z5-B3
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 04:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhcZ-0002Wt-LY
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 04:47:24 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:44806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhcY-0003j3-63
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 04:47:23 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so6000797wml.3
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 01:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OfsnD68QQ/T9iWz6jm/a56Xia60wrmmtfyBwat15JNw=;
 b=mt1elrNYfVnAA5vnvlJeV30zJi52E12QXm0bTzeSEqWGCuwRjfk3U86N1wdPR3beNB
 O+ufT3KhCHkJueci6woJ8t4rG6P2NUkTYTdWpiF+mqep9MR3QJyDorq0mD+F9sxxl4cw
 RUnbrPDm4h95wJFhXcbwKWdQWErQIXrm3PLvZbCjmtIyGb9VcMJ0xai13ennL21pFjkE
 39dBjG5OODXZe2q9R+mSA0OsVduW4RpyDbdhmQNPOfcw0a2WYQlLD/HtQgpdehoih+LD
 YSRJk06qbl1U18QszOT9zWvV0aGzGAdaCm+gJxISuyrwyenCfwO41H/dKyMMaynhFFLo
 8Qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OfsnD68QQ/T9iWz6jm/a56Xia60wrmmtfyBwat15JNw=;
 b=AR4K1o/5uxeXs5b8E+7wtjaoAM1H47ed11szXe8yfMVseZC138uuUtQc2uGQ9E+oBD
 5Z+Fb6D+tu0KWFmN0wfOelzsn5LJ723jd/TUZpz9HOzIMLkN1h1IPiTjbQE2ADwuVpGC
 8XfpWs4cUyASP2U3v6omN4Lnxc/vN8PTyqjvLeA5Ydhx3kIX08NfxuQ12a2xACnrjUkB
 gITnA6M1yZEAtSUpekYFyTOcVNK8Ay577oZnM0W/ZS5UuXQJSL63bQr8jwMNIH/lQVt3
 pe71+4bBws4CIUs6jY3B3sQKMJTuTO1qfjw19nYv6CF+m/l04UZfKvgz1UGqAS15a2yz
 l3Tg==
X-Gm-Message-State: AOAM530ppdHqHQIRLZLvgCtCFzmX00h9lcam+INZsHauqfb+3V8nuGL+
 Z9R2GSlQQHF269Ha9uiawWW2/OwEW5Hi0owHSxSUtg==
X-Received: by 2002:a1c:a505:: with SMTP id o5mr9952379wme.32.1631522840669;
 Mon, 13 Sep 2021 01:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-11-agraf@csgraf.de>
In-Reply-To: <20210912230757.41096-11-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 09:46:30 +0100
Message-ID: <CAFEAcA9YXjPcps-9z68fND5HCrE90UbmcQTSCCWVd3d=TdWqDA@mail.gmail.com>
Subject: Re: [PATCH v9 10/11] arm: tcg: Adhere to SMCCC 1.3 section 5.2
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B7sJKDT6c2BG

On Mon, 13 Sept 2021 at 00:08, Alexander Graf <agraf@csgraf.de> wrote:
>
> The SMCCC 1.3 spec section 5.2 says
>
>   The Unknown SMC Function Identifier is a sign-extended value of (-1)
>   that is returned in the R0, W0 or X0 registers. An implementation must
>   return this error code when it receives:
>
>     * An SMC or HVC call with an unknown Function Identifier
>     * An SMC or HVC call for a removed Function Identifier
>     * An SMC64/HVC64 call from AArch32 state
>
> To comply with these statements, let's always return -1 when we encounter
> an unknown HVC or SMC call.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

Thanks for tracking down the spec requirements.

I agree with the code changes, but the comment at the top of
arm_is_psci_call() also needs to be updated, as it currently
says that we check r0/x0.

-- PMM
