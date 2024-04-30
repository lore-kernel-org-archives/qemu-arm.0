Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp3017753ejb;
        Tue, 30 Apr 2024 07:48:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWm5Li28r5kSjoe2bORSlfZLVqx3pVIwn1a/DotBcspF+yMcXYcSVWQkPa4/YAZtqTYE9BhKItPByd0rxqmRToGDjLyGCKg
X-Google-Smtp-Source: AGHT+IHPGREC+9R0OJQyd7KNlX75sIPLLa7h3CR6uTzasYz/3TCyg9MXHd2QRKbwdK5Z4HFLSdIK
X-Received: by 2002:a05:6122:309e:b0:4d4:ef9:71b0 with SMTP id cd30-20020a056122309e00b004d40ef971b0mr13118972vkb.7.1714488514063;
        Tue, 30 Apr 2024 07:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714488514; cv=none;
        d=google.com; s=arc-20160816;
        b=NARHUOh+bZoYG17H6i314/h0qcvV3FydjeU4eXFpsFVLmMU9mmeIlAeI3w4+eADw+m
         8K1eufcBCTEmTK46KwVJeXb3/sbbuCFb+UM+3MOc2V53iFrgxqtU5MRZkYgcYUpHcPgY
         3vIrZ47Cmupvq3hn5E/OzYLJu0FfvsALuAWLWGzRGek0NtWdIuYF0nDFCHPvCdJyL8S9
         YFkCH2qzhtfnv5EYN0jqq3hW3AM1kD/4KpkO72eUkB48NFmasBD/2lyaGZDjNzrSDugu
         AsL/LDdXZ71PjDhsGT6NJrOtm/+KQB9pvOZNF/UsSThuFURHAiLfD6rAW1Mcm481epSn
         h+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zslvtlR4SmnG5iJpymh5rbyidbaYiK8CTF1oZEqGzGU=;
        fh=WRMjVv+oeje/jmIGQlV7pUgfWlnFT3zlHVG9ebCrDXs=;
        b=QYFL+mMA2P4W/FZwGVE4c8Qgdtc9EtbyM6Dv6ynmA4wLrnwLnfdhCAyNXwJRIBX1FH
         Av4J7MDkaPJqVz539C4Svwa0FhIcza+EtGD0K3Yq+X9cYDXBvVhRX2si9VNf+hlT/UTw
         4GofCBdkdvTlSVdRfIKzwLqzTWhl6qMrA/hRZbFrzWFhsaZNSawrFVPzXncMuEeJy/f/
         80chidu/wCSv+KR3ATPa4uGKFuGFOqFrve22VDc/58/PPTOZmN6PehBjUczLdl54nSev
         vTktHlkQfWmBG5Yjlc2qabXo0hFtdcHwBHiXrD9xPgqCViymWzGtJFR7cnEukIIA5Su9
         BWwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pc0prIRO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj34-20020a0561220e6200b004da8b432382si4248933vkb.187.2024.04.30.07.48.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2024 07:48:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pc0prIRO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1omL-0006mI-7h; Tue, 30 Apr 2024 10:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1omD-0006kG-Sj
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 10:48:15 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1omC-0004pM-Cs
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 10:48:13 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56e56ee8d5cso7410497a12.2
 for <qemu-arm@nongnu.org>; Tue, 30 Apr 2024 07:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714488491; x=1715093291; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zslvtlR4SmnG5iJpymh5rbyidbaYiK8CTF1oZEqGzGU=;
 b=Pc0prIRO97cwE/E3JkPpqqZrvn6QkwNJZ4gq8PLCW2I2DM1GPVHg8TINONfjYugDlB
 RrP2cDKZblHtVc04HMukfAVB19migm8OiGXgbcvGR3noYvms8xNxSEa03+eyI1uu5GGx
 2M4imBk2zBpMq9Avnp/8+kssA+pzrzMwh2bbKRgRafkNQd9HRNUhkMfP+Gvfo2bpsW12
 Yl09ktGF6KQFkCSEgV9kEf7XoeCStfxqg3Abhw7L0rpDljS7Yt1MIBsBTsHLn10JAlUK
 zoFNINI5YBM1k0YXMEmK2JB7CBM+Vwp9z549vfApTdvMpWs80svNHoqszye1Plfi/kQA
 CVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714488491; x=1715093291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zslvtlR4SmnG5iJpymh5rbyidbaYiK8CTF1oZEqGzGU=;
 b=KNEMsNDUzi2it14dFPmfIMBAKLfFug7FyqcOm6jzAwzBrdMw29npvlv9wbnU1NJLDZ
 9US8ZqamAV9x2aBoR2tXnneKJ8G+ZkbZOOD4c7dbprWM2MR8YZ/ro+0C/TAkSlDjZqlF
 56CaXx/4FhHn/7/2DZuVN6j8ma+DhINZeZenn9yRdrExoTKx3xCUqa1rgkn26/ERcbwH
 4n2EyPIWB7x/N3yLMzTFpF5eW82eF03fOHYAjqedqJeB0Uia+wvYUvg9WTXAG8xmmmHH
 t34n3d72P5EuN9HNdJhpI0eyU5jYeral0xw/zts8FzHX61PuyWIKNH2EeuZpnYusYDgR
 oX6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmyV55W284ftCVx1H6CBTa63J/Zpgu3zNh+mdjh98QbyYei+JIMtZZfwBlUOWtaR4/5d0sWiKeHHKHGtUbulqWJMKi
X-Gm-Message-State: AOJu0YxVcu+3TjdJhpAV9N9NEpLpQHkdhHQDjvCUr07LbGTvdIJG2TPE
 d1ScrZ9TcJiRijnZxwSkro8ZBXHSFbCrWGybLL5MffOVX1MhusWceNaRd3+H52iQCIVCV/Z1Bha
 yZLTyr7UKBbGy9k8qVOKpNZdRRCoDYzQEgQJYcQ==
X-Received: by 2002:a50:9313:0:b0:572:a723:f1f4 with SMTP id
 m19-20020a509313000000b00572a723f1f4mr38264eda.3.1714488490789; Tue, 30 Apr
 2024 07:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240422125813.1403-1-philmd@linaro.org>
In-Reply-To: <20240422125813.1403-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2024 15:47:59 +0100
Message-ID: <CAFEAcA-AiyEgpeBqAH4L+qZTHPn9T6EOV3N9sNZB9dn2RvzGXA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/npcm7xx: Store derivative OTP fuse key in little
 endian
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Tyrone Ting <kfting@nuvoton.com>, 
 Havard Skinnemoen <hskinnemoen@google.com>, Hao Wu <wuhaotsh@google.com>,
 qemu-arm@nongnu.org, 
 qemu-stable@nongnu.org, Avi Fishman <Avi.Fishman@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: im8Mwr8H/a1+

On Mon, 22 Apr 2024 at 13:58, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Use little endian for derivative OTP fuse key.
>
> Cc: qemu-stable@nongnu.org
> Fixes: c752bb079b ("hw/nvram: NPCM7xx OTP device model")
> Suggested-by: Avi Fishman <Avi.Fishman@nuvoton.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
