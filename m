Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp225959lfo;
        Thu, 28 Jan 2021 05:34:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz49IK5XPufnk1u2IA4unvEd6NYMs9nkML3vwEtFgswC9XuLUyr0438bbCGrmd6KXkLjXw4
X-Received: by 2002:a25:bd91:: with SMTP id f17mr23663513ybh.427.1611840882334;
        Thu, 28 Jan 2021 05:34:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611840882; cv=none;
        d=google.com; s=arc-20160816;
        b=c7MLZw7x1HH9C4EQAYiO/xPcNC6CKvtx7WBy/pAsz2aKZWDDzlH/4uarMI8hdUvQ3U
         Nbl5HTlAUR6neZjplLdu2lHUPjJG4QyAWX4+YQ4NYSlrR7dCe02JduXU/bOynbOLhrrG
         /mumofumPR6oGFcfSeISVyE3d/fjtV2JUyS46xTSL9mRVvTBWELrK/GyjnLG4y2KQwFF
         caicW5xwJO+R3/0SjNPUUHXpAgJWUE3ozm/K6Q30npHTpt4WLf6LHCYgg449TzOslCVH
         V2zd5PqJWFP+g7xemS7UCA8OQ9oRrO9kz197ZfeMwwISbUpA3r9kthtPNw7wFflqiNHj
         8xqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=FDbVfjV0OH07Xlau7gYTFjUmJwQAphIIVLwJHzEZa2Y=;
        b=Oxq+xVugDKLJdghWMeICHRi1JA/zVJXR1p8eHoJpFLVv39gbbB0UIBOtTp9mj++6jx
         GLJQXoarA7uGJdoBhTLdbKz9mOpkLqbqf8P6fou3PmE3V7kmq27GlTwh3Otvd4vi1mnt
         J/1BSEVsuB+ZVSKGMcWVJ8gAjfAu/mUw/InMpQuWLc8lAoJ+XWOA9JgNml01oQe8tJCX
         qkZ8kbwGV/Jt2XWS6JOzLRvUzEhvCaJ4rv6yhKWfHS4YQ0fc2FRXjKStTnhhvlYTyf4d
         9sPY27duIa7ZrCLhgUat38ZgctqTauvJDQxhqb6V/zVRsyCkPZMESfYY4FVr4EIOQZbA
         1IGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qUmcW5Jb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si5642241ybp.206.2021.01.28.05.34.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 05:34:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qUmcW5Jb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l57RZ-0001RU-LZ
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 08:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57RM-0001PA-Mh
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 08:34:28 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:42065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57RG-0001g8-OV
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 08:34:24 -0500
Received: by mail-ed1-x529.google.com with SMTP id z22so6615879edb.9
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 05:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FDbVfjV0OH07Xlau7gYTFjUmJwQAphIIVLwJHzEZa2Y=;
 b=qUmcW5Jbih0a9zAcxiOt3QM9cabsUqNeXqt2kyevHcZ0KC6ljbTWh9wYgeZgKhixtK
 ONr6zMMQIoqaar+AidC3HQX6hBmTdkKFgsKaXQNUzydEvBL5C+y2JsJlHyZqBd6ovHDN
 ASZTdTyAoy5YlFZFRlAKNFDHqFypvP8pJceyP3BaqRKjMEGd4U67slBAdpJyACfND7LS
 RQqnUPx7LxlQ+Rn/Qfy891eSgg7NXCT75p4UJyfq+Lg+8YOs7SAqoV+rDYpxS7tGOej1
 alOVKpnFf05kC7RlC0/lfRJ8UP9EoUgHN2bi3s28fbmP+BOEm6PG76pab/IrP6hyBzvw
 Lijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FDbVfjV0OH07Xlau7gYTFjUmJwQAphIIVLwJHzEZa2Y=;
 b=Z7FU9LYGU6nH6RTWWM1/DTrH/qKYFgYXJt8vhAe28lVgwDcFXrbBop30u3W+WHqvzE
 bvn2HQtThsbfrAcUrAzrKIBdHE8aucAIxfnfK84AnFf5MMFz2zrayaslabGjvh1ZSTxb
 4SehTz/cAqE/1yayN1gqJOA3FP3sdsmoT3KNNO5kdkPsIrIUNHqvV3DpuD626i0Ltb2Q
 9pZFDwCydTBg3jJvTqYNZrBKqWvw1p0sc39oTKfiZXL8W98s6BW0OiXe2MUX/ZnBGi5i
 5HxikCgRBBosbzyCQxozpAK1mnJtNZA3tOdtJ9qtghhCGNZl6virZBLH0wGUWhTJ4Gjp
 2FPA==
X-Gm-Message-State: AOAM533eo7DTgqA2FL8tOAizK5XDOnnPqYXy79DNs//FtmwLFtclecTu
 QI2eQoGMpvCAI6WEiEF7EoQUM02UcR/h5N9GV5BoHg==
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr14092231eds.204.1611840859716; 
 Thu, 28 Jan 2021 05:34:19 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-7-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1611063546-20278-7-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 13:34:08 +0000
Message-ID: <CAFEAcA9cjJo8W6oOF0uASQDGLuXUdgURkammsXkJOsLkaZU3fw@mail.gmail.com>
Subject: Re: [PATCH v8 06/10] hw/ssi: imx_spi: Rework imx_spi_write() to
 handle block disabled
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QuNUPu4zKPUA

On Tue, 19 Jan 2021 at 13:40, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> When the block is disabled, only the ECSPI_CONREG register can
> be modified. Setting the EN bit enabled the device, clearing it
> "disables the block and resets the internal logic with the
> exception of the ECSPI_CONREG" register.
>
> Ignore all other registers write except ECSPI_CONREG when the
> block is disabled.
>
> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
>      chapter 21.7.3: Control Register (ECSPIx_CONREG)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20210115153049.3353008-6-f4bug@amsat.org>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
