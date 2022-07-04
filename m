Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3259601lft;
        Mon, 4 Jul 2022 07:15:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s9XYxFBbkBKmNNAR473wvHuwdrWBoqyvXV17X25KqMxkW1S05N+YFC1iAlBiXbjyAe34/P
X-Received: by 2002:a6b:b74e:0:b0:675:594e:140d with SMTP id h75-20020a6bb74e000000b00675594e140dmr15978683iof.154.1656944113512;
        Mon, 04 Jul 2022 07:15:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656944113; cv=none;
        d=google.com; s=arc-20160816;
        b=zgi/DC9m02t0vtWptLn+aFs0JCQl2PZhCl+WKvEIXI03ehwWYSErf+je1/ZgkhLFnh
         zcUPE9Hw2kW6t+9DRmXPaadvsK7BD3dWYYVvAuie1TS9SnvZB5HU/h1gLG/uYhjx3/aF
         HVN4LMOJCcicGbrzfxJXeoCP3K9YyfyUK2OKscx8goUlcJF4bDH9dF4H4yi2g+V17Fjm
         7wMp6mTOyP0w+E0sgKfKSFa44JXZ4Q8qpcXwHInsiTHlCgTyHpltOxGP7AyoDjAsXtiC
         fggMt3LFt+tLL8SWCqu9CcPzbJbecKL/j9cvysOz73EfH2ViP0w0IveMvSTf9pD7Xr6B
         Ghew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yy4+5eFyeHmKz2oOB4Rsd4wjdlwzBoozCKwPTwCQwqo=;
        b=cnsauzn/11DJvzAFE0yfLB31XkWaksiadK7ohD7j6yS+sYrOJ3/nt2cAlNvoiTQsNR
         NJVkNoJLWnkmHU/z7ydgMSV2TFbMVStQJ/mEm8+yh+KEMn7DIFvcgmxoOdWfHAqbOX6+
         YSlv9AA6lH7RSdTZ2yZXCdLU47j9oPeS2TsG4T1pYGe5whRc9eJPOVgNwKAoRqOCcx5P
         j9WoXKVOmq3Hapa14xnvdz8Nvzlcoc7xCrvKEa66faO2Wa6V43uSk0WrgmuIaBRfRntE
         4tPko8pFUSaMtx0+ZXq0/wI4623HkEZbT4Y3eBSsMkZqsPPsCu4UzQygoEJIBDQAB0dU
         Hx+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ebN+ueDH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16-20020a0566022c9000b00675733d542fsi27551088iow.105.2022.07.04.07.15.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 07:15:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ebN+ueDH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Mr2-0007rl-S3
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 10:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M9b-0002Y5-At
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:30:23 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:35729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M9Z-0004Nc-Fr
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:30:19 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id e69so10331497ybh.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yy4+5eFyeHmKz2oOB4Rsd4wjdlwzBoozCKwPTwCQwqo=;
 b=ebN+ueDH7xUe+PQg4j8NWzRuNGBXaVu/fcy5KWo6btYC5PUkRmPcIo/GiRismGmfiO
 2GLH0Z0sPEjrn6QhTF34T10rCwW5GUH5vjwsjVt5jXXnk+0jUNKL9XMmsuX8of/KfgIz
 UjQNLr/g9x+avXHjap+ziW4HzcGt2Xxx6qUmv3r1MJbp2fkhWetRw4gjcGSDfhDzDUvX
 HN03Kp7Wsze8dcne3ikKJ3efHPyZ80192V+snnpbDoJfeOlWXqO8I+ArSnG4Yv+tLJd9
 vGCqNrngMrUNSlekWNOdvB4QK+3fSlLtjdmB/c+uaBa8e+zNv5SGvdDKO8m+E+vP7boB
 HWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yy4+5eFyeHmKz2oOB4Rsd4wjdlwzBoozCKwPTwCQwqo=;
 b=rrO7AenmBtMTpbVqv4RAZeBAsGbmYlqyWUC3rHOdwaB+zS0bw9d7LkShliPEfVd9gt
 FklVpMz/a8UUL8RTAkA18TOVo9P4ThzRJqapSBcuYeBaMJBSM7006OsgunT7TbopFXHf
 oCOOo+lv3t3j7KSTaXxWBy0XtYFhfZyhnecXDMseWPk1H/RPQ2wWc+9o2w2/lGARz2Tl
 /N7NlrJ5iD+EFB+VXlE10wH+lK0O7G/puLIK+alYuZUkHYZfwLHwZKieT/4jnP28AJBz
 XQUiE80XWZVUuhYn3aNz/JvBHbpuAI6+KRGW5ZA99brP5OqRpcj4Mo/JpvOI5l2Xvbta
 us5g==
X-Gm-Message-State: AJIora+ovY4zcTW2XslltZ2J8PDdBUwkSRfeAvuJsChmtuJULPqJA/E1
 pL9DLe8daKf3UKEm3yQnunSz5o++zKrdcpjGKRA6wA==
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr30473921ybr.39.1656941415449; Mon, 04
 Jul 2022 06:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-34-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-34-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:30:04 +0100
Message-ID: <CAFEAcA8tGGf+6y19+7-fyEKkSZVmBof_DjQ9WZZtit4D6QWKxw@mail.gmail.com>
Subject: Re: [PATCH 33/40] lasips2: don't use legacy ps2_mouse_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rd6ML0HIUwqj

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Instantiate the PS2 mouse device within LASIPS2MousePort using
> object_initialize_child() in lasips2_mouse_port_init() and realize it in
> lasips2_mouse_port_realize() accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
