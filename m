Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1379946lfg;
        Fri, 26 Mar 2021 06:54:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh7eY4gwqQ0WY9m0G2mW5o+eOqwZEI8xq2cRDkHwdq13KI53K6m1VM+uinDhXcUcwcxqa1
X-Received: by 2002:a5e:840a:: with SMTP id h10mr10424427ioj.206.1616766883715;
        Fri, 26 Mar 2021 06:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616766883; cv=none;
        d=google.com; s=arc-20160816;
        b=HNG3pbN1K2prBSzkOLdxuRv1yjL7rcBXWZe89trjEYzJC/VeYbFqnfYazjwXageC7D
         s4f6F5uICe3S4Ebgw/H3I2yFVTofg7mWO6p3w1ddnBT1tHKlWjWQJi4JouguOctPhTFi
         BSoFz8MaGH0GOV5HthalYy3yx6gJf2cXYIAno7+CuaK73H4ES51YmOgaBhrxRsxhsVMU
         AjAL6L4SX/bxQTKfja/d2a4k07wzfU39tDIk/tfbqIca/s+Xd+9Rgl2tPJaTznsvw1IM
         7I4pcfGdsK1if8+rXnWYJa0EOx7eeA1r7SxZelRPIbfMKQohjj3jKWbKKRAS8/avdAFb
         UVlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=wWpNK6/JNPwrVkAGJaGRDopJcyyPFrrlkRr3adMhn3k=;
        b=1E5G2BWzMiBmm9lsNRgK0WmpvyJt5iaq7GoAGLQrjjpHHs9ze90W4t/9qhK1e60tog
         0w1xbJwmup7hDK1PvWezJf4OQCCaWnwmHOfSOR+NQnZDe52DOQTQ93Aux5Qw94unkhPE
         sJVWxSgOjxg4b3LH2ZrrZEvQSKHOVD9socuQWuqj8WSzkiIrbzANxnIFT8XKPGgAv7HR
         cAUR6dhCu/VeAZ4jEIsSlQlcvyjutpS8UdMOvPWrIubd339YvJmi+iiyzAyDrzoxQgPY
         lhD2RjpnLW3+HzJd5m+u1Qf+lcObvU4QVgdkP+5acyx27IAszBjw+1DeVOUo9wPfYQR6
         LX1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sRouph0g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a27si7137187jab.1.2021.03.26.06.54.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Mar 2021 06:54:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sRouph0g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPmvD-0002Gt-2I
	for alex.bennee@linaro.org; Fri, 26 Mar 2021 09:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmuq-0002CI-CA
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 09:54:20 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmuo-0007f8-EW
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 09:54:20 -0400
Received: by mail-ej1-x635.google.com with SMTP id l4so8502604ejc.10
 for <qemu-arm@nongnu.org>; Fri, 26 Mar 2021 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wWpNK6/JNPwrVkAGJaGRDopJcyyPFrrlkRr3adMhn3k=;
 b=sRouph0g0y8G2h7dEwWeUtx/It2ufM5ekPjBqN1sa5wuukxpsqvJNbzlYFptqjmkOg
 tBtIDq6Vu/nNVjFytDAmsddFjjk9v8ht/w0o+D5bybl7L60fe9dVoUHIC7zs+khgWwzF
 NKWWj2SRvII8nZ7xWoyDqst5HQJVFjVwgDWHawBtR+601lYUbIVETvRk3WJ+yXgUetgm
 usN852QzYTkUaxluwapJRdnka1++Stwzs8H9YofRqx39wVzb9bgkI8+lVS+StN88phP1
 1CTcGSxA/4mG4WjhWm5qlk0dejZkxJveOGvQVBJRpzhHfGQlacuACfeF9QpX8ly8SFK3
 2sYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wWpNK6/JNPwrVkAGJaGRDopJcyyPFrrlkRr3adMhn3k=;
 b=bCxqNv9UU8+RePJhSoaRj6J/OgYaspgZ4vi02F2CJ8ggxP9j574d0wO//JsjmeJWPQ
 dxF6lnBDkZLbCJECtlLeVw64pQfH+PC70B/XB7CInhJPXHJG5g1jLthZz/tm7IKoRD7C
 ktQwYiHt8jp8q3gBTKkYqnQ7Ul3MZINLLuxIHqC4pXcvSNk1ZgBk/XSv5TfDKebcnDvF
 HvXBwYtqehYUuorI9/QaT1Yxw5SCbUF4zdMgK80roj5BxJw8VetFdIpXDSjfTkeyqJou
 AhhghRRvnXf9EzUBO1Pk1Dy+aoi6n+E3Umba4DX1RXBbEzmBFdEO6nUaicL//BxZShKt
 gBnA==
X-Gm-Message-State: AOAM530GXmVtwKkdh944UdMmrqS+TO3oRHzRG0rhrDG3zsiUzlyfv4Uq
 wIW9Pw9DBPxh0LLbwWdDBzpC+i/bfzdKDJR1c6draQ==
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr15694226ejg.482.1616766856081; 
 Fri, 26 Mar 2021 06:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210323182958.277654-1-f4bug@amsat.org>
In-Reply-To: <20210323182958.277654-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 13:53:47 +0000
Message-ID: <CAFEAcA8i5BxEpSUDnSwx7Vq5jgdfNA3JuZgzP8ERc8yk5jwaHA@mail.gmail.com>
Subject: Re: [PATCH] hw/display/xlnx_dp: Free FIFOs adding xlnx_dp_finalize()
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EUbs0BElmaNy

On Tue, 23 Mar 2021 at 18:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> When building with --enable-sanitizers we get:
>
>   Direct leak of 16 byte(s) in 1 object(s) allocated from:
>       #0 0x5618479ec7cf in malloc (qemu-system-aarch64+0x233b7cf)
>       #1 0x7f675745f958 in g_malloc (/lib64/libglib-2.0.so.0+0x58958)
>       #2 0x561847c2dcc9 in xlnx_dp_init hw/display/xlnx_dp.c:1259:5
>       #3 0x56184a5bdab8 in object_init_with_type qom/object.c:375:9
>       #4 0x56184a5a2bda in object_initialize_with_type qom/object.c:517:5
>       #5 0x56184a5a24d5 in object_initialize qom/object.c:536:5
>       #6 0x56184a5a2f6c in object_initialize_child_with_propsv qom/object=
.c:566:5
>       #7 0x56184a5a2e60 in object_initialize_child_with_props qom/object.=
c:549:10
>       #8 0x56184a5a3a1e in object_initialize_child_internal qom/object.c:=
603:5
>       #9 0x5618495aa431 in xlnx_zynqmp_init hw/arm/xlnx-zynqmp.c:273:5
>
> The RX/TX FIFOs are created in xlnx_dp_init(), add xlnx_dp_finalize()
> to destroy them.
>
> Fixes: 58ac482a66d ("introduce xlnx-dp")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/display/xlnx_dp.c | 9 +++++++++
>  1 file changed, 9 insertions(+



Applied to target-arm.next, thanks.

-- PMM
