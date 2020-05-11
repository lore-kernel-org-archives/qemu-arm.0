Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp83722lfb;
        Mon, 11 May 2020 03:55:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypKr+VEyuFz6eJlrQAxxMPUZ0av363aRNcMvy4l+tQuKe1TxHUm1nbrR50KRzidSbNbApwpK
X-Received: by 2002:aed:308e:: with SMTP id 14mr15708875qtf.146.1589194510038;
        Mon, 11 May 2020 03:55:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589194510; cv=none;
        d=google.com; s=arc-20160816;
        b=ev3gBnaIjXFYaf2WHBhNTU1gNAQSi3UVL8pHkiznlXTAxje2ShtsjcToixXWznxb/Q
         DzLdjPPyywLNdDZ/GAJj50iDbhapvYK3dTI9mN0LOa1ULmxuL6zriZdkp5F9N3R1TcyA
         n9aQDvLdK+GRia8nXs1e7KEonyt1c5XzwVrI7/kTElsoh5rkxqT6Idz/SXgnuF1LgQYw
         A+u994svPUyaCEf1j7/59DUbWwj0dmajIkCY8mAHxsFzDpGfmAylm3jBF5Ho+HuJkhl8
         t8FcZeYKmIQ9tpc0FFnX0cnkjZ63qoIeEWxCLWkXNnwlADO2xK/nAfvQe+C1zFOAIQRw
         tNkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=QjaTUArLqqwGoWa/w8L2qR728XtmXgTP5JiymM5u3wY=;
        b=lWNYXnU8KWZT+QUoO9ChUTCWDH8LfThxpwfmSp68opJBGL3E8EPrbQPivxJrjQ/7Se
         jzMsc37X+jBLOY4RTk1FlV0TlYpp2nrFJXzSEnLiPX3g+2a9KDYEj3iX3nK2YRvGvX9D
         W+HxloabJZx+SFHDOFLMpEplBNX3gFEl+StefWRZNg4v9YBtgpUiDzhbV/4IlX/nQD1z
         051PxVkX5z81j1W1bnm8rUdnpzIhatEQNXuQ5Zh2oHtKaoHVU2qIPCOvaX/U/YvdJDSr
         eNDK29MCzW6xivPdHrrD0N2Lxpplmu8WQF9zGWlK3HIvBwz59e2e5IDPYPuLhf+MRSRm
         4zpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SKZcWQcH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si5403900qvq.200.2020.05.11.03.55.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 03:55:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SKZcWQcH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY65V-0003dF-Fq
	for alex.bennee@linaro.org; Mon, 11 May 2020 06:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY65J-0003c0-KG
 for qemu-arm@nongnu.org; Mon, 11 May 2020 06:54:57 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY65H-0002Hv-5k
 for qemu-arm@nongnu.org; Mon, 11 May 2020 06:54:57 -0400
Received: by mail-oi1-x244.google.com with SMTP id j16so14668203oih.10
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 03:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QjaTUArLqqwGoWa/w8L2qR728XtmXgTP5JiymM5u3wY=;
 b=SKZcWQcHnSXpnDa/lTWWyOQ9hVDjzBBUtZVkr36MY4+dFSoqIPzJ1rmRJW1VqEo7Ha
 XBcy9YX8p5WBMLT//m3GvKrrIfPJUFh+bQaE7jtRKP/LhQt4TI5CaIHBLotnubulAKKh
 UcMJEbKyGqA//SuPMFwpxSHvflJsoHlH0jzexEZjCBrZv3ZBv+AO23erAlXqwRe7tsNY
 QiRuaXlFrpY3vcL5RQg6XUcoZgYOfnAnHwEyxbfu7wjD0rCTiQmvNOk80yRyraieBb8u
 p64vlY0A/cq9SWKXF4ino5KMdaE2oDhivl0qqXYtURvBSkXc2+//t/SmZh0KpSpcigBk
 5xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QjaTUArLqqwGoWa/w8L2qR728XtmXgTP5JiymM5u3wY=;
 b=mIgBkgg7rj3lKZ4F+fJ0Dd3PeJkNiHA4Al7mGLwYu7dPMLcmSSRH5f4Plxc7RlnoF0
 6uOgmGVPaZASe6aYA5CaNsop2cWX9qZUxI7JAOLyQq/ab/dVVrEpO2ZqMFcqgr7vm5Cx
 FzJmPB22pe2gWmWHfRgleCc706yl22jLDLZSHpO2dDAvR4S+vK7naZtJvRSvRcB0OXL3
 4Ydo20ecx6P5c9t/uFy3VJNJt5UFV4K7f1ekYUCml84ERkG2Du5iCo/4Vz/s4ubKOkOQ
 05D2+oJSId34/I4KtXL3ck8UV4GUOf/+uIaOQJ/WeIpbJVsjuzsGAJGpZxQr7u51B9nR
 iWOA==
X-Gm-Message-State: AGi0PuZ1apMYF0vmedWuysy7bpvk0IMsHFQYKrrZK53uJLDWZdjiCw/B
 zgiMJY3x9BtHzs2rsbBmZ5LqrvD2DuZWnudZw7zIdw==
X-Received: by 2002:a54:400c:: with SMTP id x12mr18504395oie.146.1589194493404; 
 Mon, 11 May 2020 03:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200506173035.2154053-1-patrick@stwcx.xyz>
 <20200506183219.2166987-1-patrick@stwcx.xyz>
In-Reply-To: <20200506183219.2166987-1-patrick@stwcx.xyz>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2020 11:54:42 +0100
Message-ID: <CAFEAcA8RMhq3aZcqzqFkaWCkwkzfptxAyAogEEg+BcqNU1BquA@mail.gmail.com>
Subject: Re: [PATCH v3] aspeed: Add support for the sonorapass-bmc board
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Amithash Prasad <amithash@fb.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Vijay Khemka <vijaykhemka@fb.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s/TnBEavyfxd

On Wed, 6 May 2020 at 19:32, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> Sonora Pass is a 2 socket x86 motherboard designed by Facebook
> and supported by OpenBMC.  Strapping configuration was obtained
> from hardware and i2c configuration is based on dts found at:
>
> https://github.com/facebook/openbmc-linux/blob/1633c87b8ba7c162095787c988=
979b748ba65dc8/arch/arm/boot/dts/aspeed-bmc-facebook-sonorapass.dts
>
> Booted a test image of http://github.com/facebook/openbmc to login
> prompt.
>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> Reviewed-by: Amithash Prasad <amithash@fb.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Looking up through the thread I can't find the email where
Amithash gave his reviewed-by tag -- did I miss it?

PS: for the future, v2/v3 etc patches should be sent as
fresh emails, not as followups/replies to the v1.

thanks
-- PMM
