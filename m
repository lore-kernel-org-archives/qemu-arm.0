Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1466949lfb;
        Fri, 20 Nov 2020 08:48:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjUAjeSMyP0Sy57HFRTQDg68/BY8NP1JSqFWbSn5oJl+UqgST8nIh1KnNN/znlWbgnyXkL
X-Received: by 2002:a25:1987:: with SMTP id 129mr22734668ybz.188.1605890922111;
        Fri, 20 Nov 2020 08:48:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605890922; cv=none;
        d=google.com; s=arc-20160816;
        b=h33UsbFELyLtDSjQBkL3TRqvEgk+DsEIFxzLA6Obd8E+cYQJYIZlTyLCLGIBiYpef8
         YzUSsFxr2A8NBFs3RzSczr0jSOzH+q9pYlanlFf3Uf7D/pnZ7hg5O9OK/PZbg7GnezNB
         Db9ln0HOr5Z2deh0+fpz6UdOwuGwgBnGEQsfYF5wWyN7YL6+EgkMdH+1NA5B7n10Avzq
         m/0hxwrwj9K4ZmoJzsK4W8l57Xwbbzv4YGgHVHNVX8ApyCnFjwqgU2DAclQoymyvmr7o
         NU6gyVBAgsg3drElXZh1zeH2Ml4WML2cKorFfdlIIEbXQKQXUP7NjopJGkQHT0ZYpifA
         pTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=PPPKBYAiDqptk788z53LcyJhrcZDocJaQEsVvVQJRNM=;
        b=TTebvFS3sWpkKS4ahDbMJ141t9ZYUS6Cq9aymy10ofHsYRs053gAIbKrTRFAwsOLfc
         ip83WyEk8ZRpAQiTrZ0EF91kICtjR+bNwqrbH/0j6K9Ow457dhcGMjR/fdZn50jC3/Er
         53OCfFkgjDtLoW9alCzDahN6xefvdgDZaTPUusMRhDt3WjaihiKaAD4xxnmeEvx2KiFo
         LMw6GoBbI4bBNCK9DonTEnuuA5JnkScsu4Gw1MgcZqe70wb69eugk9lMNPW3ijMa9i6D
         q5wBdZXIMjcjbzU2p8F3xTuWewVHOsnXStJo0VVBtRKLw1KEGLf7OVbe6jHIEtPY4+Kj
         44gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qNkKGnm9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h31si3230036ybj.403.2020.11.20.08.48.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 08:48:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qNkKGnm9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg9aT-0000Ow-H5
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 11:48:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9Yp-0006G5-Mv
 for qemu-arm@nongnu.org; Fri, 20 Nov 2020 11:46:59 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9Yn-0002Ht-9M
 for qemu-arm@nongnu.org; Fri, 20 Nov 2020 11:46:59 -0500
Received: by mail-ej1-x635.google.com with SMTP id y17so13726573ejh.11
 for <qemu-arm@nongnu.org>; Fri, 20 Nov 2020 08:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PPPKBYAiDqptk788z53LcyJhrcZDocJaQEsVvVQJRNM=;
 b=qNkKGnm9MVIUHFsIPfcKlHv+IvszNNUWR9y1LKwS9GKDF4YLBXEGtXVVMFtYMjWBny
 2/KbtsjxRwazeczYlPAj6ZqqRm3JO8InW6p0JJ6i2HvpbxRkylWtIseZPECt2pAzumLb
 Z0KDPRf5sm5N/3UTIxtkQcMwuOZamdmQpGfUd+DcDgdES/OiiIYugltXtnMGYAEDd0rV
 gxZ5nfxPvdEFVoC4NY3xMmw+8oVS0Twy0xLuLLhjBl7jXzOY1vWw3g3aQ2qX49MvlObN
 HtNKS9jGSt05hC4STfw8bSbt7Q2meXp0FEDJm0i+r3g6OQVEUgrebfCGJgUDY4e/WVod
 rfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PPPKBYAiDqptk788z53LcyJhrcZDocJaQEsVvVQJRNM=;
 b=q1KEmUop42/IU2+Myy0y7xk56M0UPatcXZ+U1znui53gvpXz11xxe/m/ip9XnTOkvG
 niedul1kYgHRo0WbbdcVk9qb4PCm8Nd7Mwj+AlX5EizgfsViAuqGWsSZXlVpTBQVj4dm
 arlFUcNEy3dWFTMtopZAjtSy9Uq3Y7pMKS4MITSKW68WqXagMe/JDBOlViTswX7D8hH3
 L3kPMaMUHzaqNfDojlVXoY6Lc2+VZdT2EXLomErcA4+zS6n0RCoXYG9y3v7nybArHN2M
 TGvN9v+zNvPsfWFk3VOCN2QOsmWFcNW7DZ13oMnZGjmEgR5lihRtecaQiYxBSqpSP3hL
 HDjA==
X-Gm-Message-State: AOAM533l8ha1I0P+h37VhYAjSxXEAAyQVWOFcZUb4yEOY5ceCoizsCXJ
 2CIJzBf9HKisp1SCgTwAwy1BNSL6X70jkm1k8HUM4A==
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr32520180ejq.407.1605890815595; 
 Fri, 20 Nov 2020 08:46:55 -0800 (PST)
MIME-Version: 1.0
References: <20201120152140.2493197-1-f4bug@amsat.org>
 <20201120152140.2493197-2-f4bug@amsat.org>
In-Reply-To: <20201120152140.2493197-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2020 16:46:44 +0000
Message-ID: <CAFEAcA8udfqjmYn64PZJP6xv_T_v=7Ff7CAj1jeapuZbvBupxw@mail.gmail.com>
Subject: Re: [PATCH-for-5.2 1/4] docs/system: Deprecate raspi2/raspi3 machine
 aliases
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Krempa <pkrempa@redhat.com>, Libvirt <libvir-list@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SPZKtu4NFSB3

On Fri, 20 Nov 2020 at 15:21, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Since commit aa35ec2213b ("hw/arm/raspi: Use more specific
> machine names") the raspi2/raspi3 machines have been renamed
> as raspi2b/raspi3b.
>
> Note, rather than the raspi3b, the raspi3ap introduced in
> commit 5be94252d34 ("hw/arm/raspi: Add the Raspberry Pi 3
> model A+") is a closer match to what QEMU models, but only
> provides 512 MB of RAM.
>
> As more Raspberry Pi 2/3 models are emulated, in order
> to avoid confusion, deprecate the raspi2/raspi3 machine
> aliases.
>
> ACKed-by: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  docs/system/deprecated.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index d98464098f5..d1bc03d7e61 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -346,6 +346,13 @@ This machine has been renamed ``fuloong2e``.
>  These machine types are very old and likely can not be used for live mig=
ration
>  from old QEMU versions anymore. A newer machine type should be used inst=
ead.
>
> +Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +The Raspberry Pi machines come in various models (A, A+, B, B+). To be a=
ble
> +to distinct which model is used, the ``raspi2`` and ``raspi3`` machines =
 have

"to distinguish which model QEMU is implementing"

> +been respectively renamed ``raspi2b`` and ``raspi3b``.

"been renamed ``raspi2b`` and ``raspi3b`` respectively"

(or just drop 'respectively' altogether and assume the reader can
figure out which is which ;-))


Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
