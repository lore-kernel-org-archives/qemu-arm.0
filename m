Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3243688lft;
        Mon, 4 Jul 2022 06:51:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uwh5ck2alPx1jwx1a9Vau2CWAbE0RgSgZniXH+IlicKEi1/KCsZtlm7CjHPlCmMQyV9jNe
X-Received: by 2002:a05:6214:240d:b0:470:46a1:fc74 with SMTP id fv13-20020a056214240d00b0047046a1fc74mr27485802qvb.30.1656942717317;
        Mon, 04 Jul 2022 06:51:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656942717; cv=none;
        d=google.com; s=arc-20160816;
        b=m93fIu4FW05Nv+6l+JLIEvYG4fmaIVuNPkvg+p3TwBeq61ku2XVM3Qsmx97tlfS+ME
         CIkxzYYB8TAiyYQWO9B6I2rus/um1SH+MrhRbJE0IDlnMzJ02NHX+u+BLfrIy7glFb3i
         /Ct1QjJUAD4gqeEe7IeDpuR9YPgAeGkvha9bDw4orpzfmbJEAR8J1rtX2+DTTXJPElYj
         vZQZDFaDffhS/wBzFPPp5Ak5Wr9kn9Y8uHmV8s2TOnkHnsT83tA91CrhrvezKXqih6ke
         LpWy3Zva6Iq/NyxDSk7flp4U6+P9SLChk9mlIbQMw1fuz3gNl+wvsNz8aUTgjm4VpcWW
         jtSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wcgSecBvIC7MUyWscYl78ojZt/mgmz8XK8PYaXANTPQ=;
        b=VCwptN7sVGVBcLTj/Au16rGRtfkLJY5ukHe7OodHt9xy5LtCkOkF+7rIhtU6d8o5oL
         9IWKCPldcjFuqo0rlHry4sP+U+E5Wa4JNHK8LfxYrGKc0Utm/JNXYEDBjbb7GixFllui
         Aff8qNuZOL4btGF9ZrVPAvPQMb/SY8rUoTbytt0NvTLkK47Kw1HdBkuo+eXzIfWf+0y3
         qwWcPx5GINB4/IBVGndu76mv3h2ilP3R7mNFZNVF4V8EVz2BsW1HWNEDP20nT7VCEgxO
         9c6pIZh2BQK7XyKFCOZi05yNpnUYIR52LK9Ar+it1OlJGpWB35mHlZLcC6+eSsVBF5fn
         SDWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y7tP5wqw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4-20020a0562140ac400b0047298eab3f8si2721531qvi.487.2022.07.04.06.51.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:51:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y7tP5wqw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MUW-00046m-PY
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M92-0001ra-Hz
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:29:44 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:41722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M91-00040B-0W
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:29:44 -0400
Received: by mail-yb1-xb34.google.com with SMTP id b85so3663113yba.8
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wcgSecBvIC7MUyWscYl78ojZt/mgmz8XK8PYaXANTPQ=;
 b=y7tP5wqwu5WoLmsXxtKiTjP/ExHJ4i8SXruXYabCSSaLTdNRxXVIKRcDaadhz1jiAt
 LF5mvyZDhakbH2UwOV6tbe6zyLy3MfiarcxY+MLss8BjlvWXBoNxcdRBNmd85YH7gUaj
 9ySUTIUyaCgW+XO4iLR3x2czBLXuJ1q4Ygc1IMxDEhLhzARPrkXbnaXlyx/7ImI9FLR3
 rbhe5FDUG1nbvSeaudx+J0tyFINseaYIHp+qcwONGMcSEeu/OcYlp+5ZBG/TWE/uy7Xo
 j6eKbWUyFbJbOHwormQKDU7u0KhVyx82bwEWxM7ZGMScgtCOnc2JnthtPZ+jiXLbW8Vi
 jlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wcgSecBvIC7MUyWscYl78ojZt/mgmz8XK8PYaXANTPQ=;
 b=2n5L7m3S9KAbHg7pqQFCkE3QU5dxfMtSZT++3YeCv1VoymUmsq8oOKu6sIHpFUIIUV
 F96Wardw1L4ODLubobnVKIDLQNTsHEWCgMuljB+u63XHQkBe7krehihJLZDepAQzhfoQ
 Q3IHArtnJJyY8WlA5i6yz+y+ajFnrQVgF6DwU7Qcbo4+ei9YGv5FE1T1ia+3iFeybv33
 +GOr3dqLms1DEsDtqIQ7NroiZ7+do12pIdKTZsiKge05zEF6HkG3ueTH8/A24FCL7XnI
 iC66tR8B7zuaiDIHLzXi0ZMKJD+K29gVwx7pVE+FOgMSEmsuGgbDYtbz2HUzq3ebgBf+
 /4qQ==
X-Gm-Message-State: AJIora/1Odzc49xtcoThLHIL/S0BRAFv2OD1xjDhMsER8+APll4xqSY3
 Uboas/l5NF60IexPkZXBIOvf6RZ83bvcSj4mipOqNw==
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr6063226ybg.140.1656941382219; Mon, 04
 Jul 2022 06:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-32-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-32-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:29:31 +0100
Message-ID: <CAFEAcA9r6NeyAwmbrU1RcBkV1etS677rS6E652DUy6FOChXKmQ@mail.gmail.com>
Subject: Re: [PATCH 31/40] lasips2: switch register memory region to
 DEVICE_BIG_ENDIAN
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KKwA0KRICqtN

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The LASI device (and so also the LASIPS2 device) are only used for the HPPA
> B160L machine which is a big endian architecture.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index 09d909c843..7bf6077b58 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -245,7 +245,7 @@ static const MemoryRegionOps lasips2_reg_ops = {
>          .min_access_size = 1,
>          .max_access_size = 4,
>      },
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_BIG_ENDIAN,
>  };
>
>  static void lasips2_realize(DeviceState *dev, Error **errp)
> --
> 2.30.2
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
