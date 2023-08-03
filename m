Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp911699ejb;
        Thu, 3 Aug 2023 02:40:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE0Lx4vkeLAkUW5df3BfTyWXRjv3zU0doKQ7RMFjv1MrPcoB5xi29jHn21N5Za2bEaiCgUh
X-Received: by 2002:a05:622a:114:b0:3ff:c677:a033 with SMTP id u20-20020a05622a011400b003ffc677a033mr24417764qtw.29.1691055600828;
        Thu, 03 Aug 2023 02:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691055600; cv=none;
        d=google.com; s=arc-20160816;
        b=mWRo4T0p4EC+YTOMUTwcPYPGK1r/7ju0rJspBLRPHo+1185qkbkoZQ2zVY8MTlZukT
         CZpr8Ah+wZLQSHQOpsWTDvt27lWy70U/tCLr2SakAd9bwaiBKrBtL1wecyQH2lwDnxiD
         HhiK9o3CXu+0UguHILzph9SLQo5C2DyCPhRD+kwHmkWxFtK39sV6LPA/j4Ywv9uz+TOR
         KamFyupWI6kvczmVDUVC58CQmqAfTocnD1d6xwZG/q+75f/qNlBboOaPyf7CG30dVn5R
         jq9L3P3szSpsMXVuf5Ui5xe5uahlgtoWpiPHmAy3UD/TWqJpVdAfHMnnp6tDokxJb/ks
         Ijyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=is8zk/BeQXeWz740uat6ne3U5/bgf2O9Ih+bPWxX9Fs=;
        fh=PRqmxkSwlZfMezANGBsUaQKdu96qnh3eMpL3EBzUtiY=;
        b=qjZQOreK2cIj+nPkHVz1Wu0O44Qsxcg6V9pUYJX7rRx5YH3S2KCnRUpZHZ+d/JTHQh
         IVkJRcv0D65NFxhkMbJVIQIEnu/jNTyj4xRwgLB4jlLmRhpys3AtcdrYmmwZrnJTwoQB
         7QH36r5zoT30cJ2LWf0dGbENeqCUNbpe2sxdKSly/iFlpf7Fan/ZR6EwYpUXr9PJpU1d
         Rr9Qr7KoJzFhCPHzGeyeaZJcvi6h9FkqGs1XVw2cvequbj6GTBb1IZB5SFnu2pY45zju
         k46XSmak5cLMXPfQDXMzciuhe01BiSfJI6Akf7kuA8sgTxR2zR7RPS0UTBPp74g9/9Lv
         /7PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cSaY5RvD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4-20020ac85b04000000b00403e7db8913si9925274qtw.124.2023.08.03.02.40.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Aug 2023 02:40:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cSaY5RvD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRUo5-0003rI-Np; Thu, 03 Aug 2023 05:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRUo4-0003qq-3Z
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 05:39:44 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRUo2-0002K9-M4
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 05:39:43 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51e2a6a3768so921877a12.0
 for <qemu-arm@nongnu.org>; Thu, 03 Aug 2023 02:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691055580; x=1691660380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=is8zk/BeQXeWz740uat6ne3U5/bgf2O9Ih+bPWxX9Fs=;
 b=cSaY5RvDSJCl2sTX2ME0KrW1knzBJ+9Rq01PvtuTrcW8S3RrCJ6K7GVSnLjO2AkGmE
 cm6az2bEjz+p45DopT7YxSBRQiFcomJGYLvm4ZpAu9E8IfiEkIOqXYOe1HmDovFw5/Ri
 NtRGbrOcDcgXreyQQFV95Hwy1Gd3kcsAOPcamSNguNqKGH+kRR6bt40YzQ/zYexQBxIN
 +yFcaUdhRsp59FPy4IkW0txydFigrxzNkFI3qtw0oM+jAgLA52mW8Da2zxdOVnzwZQ06
 krMTmYtnUMsUpaQ2s4gPX4gUS2maOSCTK11CYfZArub2l8k6rCCiyUxWfmBGddpwKu5X
 u7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691055580; x=1691660380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=is8zk/BeQXeWz740uat6ne3U5/bgf2O9Ih+bPWxX9Fs=;
 b=MYpknurlbqASQg4hmAncmz0UB59MtPYNIxM8R5HyybPpDPnkzfU4D4BfoxCOqtOqhn
 jn5w921q1PkmQMLqwu6EC894AWjgZmKElFN9zneJZadwFaHWpI7Liio85Mg+WcfVEOHq
 MYC7I9n4pBLsmBSYC4xiaiI9LO2L1A5tQzOd6u2ZEPeoJCiLbxNg/B3JUhBnf5Eoa4VK
 F8YobScNTD49AxNX97ssSjxI1lRTEHENAQocdU0fTUYx7Qx28Fc5O0cv6R8rYI5GWaMc
 mjs4oTqLQQJb8ltOrk9fsYGSz83HPskKtkPssiihRPeqhacvLPCUv9k0qcF68cC6IEDf
 vueA==
X-Gm-Message-State: ABy/qLZy4b4mcQ8MPo0ZXAzlMQEna1y8tI7J683ZbjbaPmVqcQYdx5jQ
 L9EhY6PfOQ0vNAbrrq1JqAwaWQHMia3ryQwjVPmudJdGZIBmBz0d
X-Received: by 2002:a05:6402:894:b0:522:5957:44e0 with SMTP id
 e20-20020a056402089400b00522595744e0mr7503173edy.28.1691055580099; Thu, 03
 Aug 2023 02:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <6b1211f5bb004b12a57c142b54fa82a3@quicinc.com>
In-Reply-To: <6b1211f5bb004b12a57c142b54fa82a3@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Aug 2023 10:39:29 +0100
Message-ID: <CAFEAcA_H8L6s6390YGJBtkyu-_D42U_KTbfJQ1+LSjQmZrRCTA@mail.gmail.com>
Subject: Re: ARM64 EL3 Exception SP_EL3 Issue?
To: "Chad Karaginides (QUIC)" <quic_chadk@quicinc.com>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: xBCM91rqnT4j

On Wed, 2 Aug 2023 at 21:04, Chad Karaginides (QUIC)
<quic_chadk@quicinc.com> wrote:
>
> Hello,
>
>
>
> I am executing the Zephyr RTOS on a QEMU A53 core with Trace32 as the fro=
ntend.  I am seeing a behavior difference between the QEMU A53 core and rea=
l hardware.  Execution is in EL1h and an SMC call is made.  Execution trans=
itions to EL3h but the EL1 stack pointer is not propagated to SP_EL3.  Is t=
his a potential bug or is this functionality covered in a test case somewhe=
re?  If it is a bug I have no problem diving in and trying to help fix it. =
 I am new to QEMU but willing to help.  Just wanted to make sure I am not d=
oing something wrong first.

Why do you expect EL3 to execute with EL1's stack pointer?
On entry to EL3 the CPU should use the SP_EL3 (which EL3
has set up before it dropped down to EL2 or EL1).

thanks
-- PMM
