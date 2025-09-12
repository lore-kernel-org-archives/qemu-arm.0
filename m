Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4469FCAC582
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Sep 2025 21:06:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uxAy4-0008Ek-IP; Fri, 12 Sep 2025 17:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lixiaoyan@google.com>)
 id 1ux7oi-0003hZ-LT
 for qemu-arm@nongnu.org; Fri, 12 Sep 2025 13:44:12 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lixiaoyan@google.com>)
 id 1ux7og-0008Dc-5t
 for qemu-arm@nongnu.org; Fri, 12 Sep 2025 13:44:12 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-621c6ae39b5so1353a12.0
 for <qemu-arm@nongnu.org>; Fri, 12 Sep 2025 10:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1757699046; x=1758303846; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TP6Xkd1ZYogxUzlDoK8soGJmRtUx1u6oSWZyFYXhlcQ=;
 b=X60efN8hPkSaTa7znNTdwG0wI/7G3l1NetjU/jN0+WemTTAjIXtMm9Y96XoeEz7C5a
 hgqbiFchO2b+7AAd+6lT6msbeVXOwWYQWk2hyZZay3pJuCA6bPG3izk/JnVmCc/FdIAd
 ajG97v26zi53tsdCmFXITGylBLn5oyzlzEJs+tGn37j7wE+CVElZ8otRoNx5cyuIax3C
 B/molGou0cpE+sZKoggAtcHBnjLg2WoueWu+PS3QETc4GSwjrGAehcfETRjmPJdNPS/Q
 dCDzkX6fDWJC6hRLUmzOxfZd6cDMV3H3klZNfSpFkmWt8sNRzFRRtmdFh0nYJ69NMgFW
 g78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757699046; x=1758303846;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TP6Xkd1ZYogxUzlDoK8soGJmRtUx1u6oSWZyFYXhlcQ=;
 b=G07EsgYamRiTjrdWcHMW+d8MnPaQDcle3mXlA62ry7VxDkYZEz6Xz/dY1lLPZwuue9
 MopLc8mLvw8bvvTszdNZSz1YzGsrn1Lcmtr3lAtAUgyVVhupheCOf53f+B/47mw5Yna0
 HBMD9w41ScfX4cBLnMhmmdHXZ73hLtz4iEwjfZAvoOIRqw1XC+lTU7CqREZAJZ0NdzkO
 IlNdUkjuxHzfM6VoBfLLhVfyS8OtxBm8CAqi1D+Zxifwzml/39KHj8cXM/GLjWs6ra7G
 U2rI0S3rfvYMclcmpe+rUxxkTZF8Oh3E+91dnwyTYVbIiuLsG1h8RjX9nG1XnXxfcLA7
 3lsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMPfyW8XYxnBnLZ3YiZtRCeCGPyp8iMNfFNDYHZEUZyXPZczMITRXUw/l06N5zLHx+gge2OavSYA==@nongnu.org
X-Gm-Message-State: AOJu0Yxl+us9FpTFfCnSgkq4vLUYkEs5VsTSEU9ykmdLNY2Kf3escDVY
 S+5wCsk8QXLlLO2cxLjcpbht8qyGxzFp1QCUXcQWXICyzxfooyKYnwNZ3Cx4PUvc2nAwEp03uWy
 40Kmei+SSU3u32VeJ6dHbTXy0hDeSsHt9Gf3XyIJQ
X-Gm-Gg: ASbGncs1qkGLjnYDrwucai1vhGP9+Ka+XwWC+VPjlLq6TgGqJNMhKyfqg8/g8fwLpUg
 0MrzICxB1+nkzoFEiyMP8OSIfRODy4J3O7UXeM8DLMC/Sf/L6ML7TvH9wb4ap48PZQjrMGNT94w
 RL3+3cPnzc0BliKp1/V8Op9dzinZzwxjtbddKYliWpNXkhX8ujpUT7s6SgpjZTGQjVQQUfsh9UW
 OWC1ThcmsL91EZ5Qn7Sjfdn9OzDOZU+og8Nz4woPV8HOR+dqR6KlWQzLQ==
X-Google-Smtp-Source: AGHT+IHsyXrGrakgdtLZwlQLBD1M2C5+48aI/x71/auXiYYs4JyM7SJNNkpYMxuTaANPYDbDHEf4WxnzeL1iqtvrdaM=
X-Received: by 2002:a05:6402:d4b:b0:62e:de92:704f with SMTP id
 4fb4d7f45d1cf-62ede927182mr94943a12.1.1757699045538; Fri, 12 Sep 2025
 10:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250903213809.3779860-1-lixiaoyan@google.com>
 <20250903213809.3779860-2-lixiaoyan@google.com>
 <e0e733ff458cf253ddaf2b5570183b86c7c13102.camel@codeconstruct.com.au>
In-Reply-To: <e0e733ff458cf253ddaf2b5570183b86c7c13102.camel@codeconstruct.com.au>
From: Coco Li <lixiaoyan@google.com>
Date: Fri, 12 Sep 2025 10:43:53 -0700
X-Gm-Features: Ac12FXxnuV3NoMwYMKUqwyFl2bgbQRtXILEQhkalURrnZuqfJhl0_N2aCxRvN9c
Message-ID: <CADjXwjjjSQGwOfquXmLfENRAAmHv5KXaGvjkiK7KFzGuehPsow@mail.gmail.com>
Subject: Re: [PATCH 1/5] hw/gpio: Add property for ASPEED GPIO in 32 bits basis
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: peter.maydell@linaro.org, clg@kaod.org, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Felix Wu <flwu@google.com>
Content-Type: multipart/alternative; boundary="0000000000003bd89c063e9e33bc"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=lixiaoyan@google.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -165
X-Spam_score: -16.6
X-Spam_bar: ----------------
X-Spam_report: (-16.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 12 Sep 2025 17:06:03 -0400
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--0000000000003bd89c063e9e33bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andrew,

I discussed with the original author of the patch and the Nuvoton
functionality mentioned above has not been upstreamed since then,
unfortunately.
Aside from the comment above, we believe this patch series allows gpios to
be accessed more dynamically/flexibly in complicated simulation, and also
helps with accessing advanced gpio features, see the sgpio implementation
later in this patch series.

Best,
Coco

On Tue, Sep 9, 2025 at 8:52=E2=80=AFPM Andrew Jeffery <andrew@codeconstruct=
.com.au>
wrote:

> On Wed, 2025-09-03 at 21:38 +0000, Coco Li wrote:
> > From: Felix Wu <flwu@google.com>
> >
> > Added 32 bits property for ASPEED GPIO. Previously it can only be acces=
s
> in bitwise manner.
> >
> > This change gives ASPEED similar behavior as Nuvoton.
>
> Can you point me to the Nuvoton functionality? I had a quick look and
> couldn't immediately see an equivalent implementation.
>
> Regardless, I'd like to see more motivation in the commit message than
> "make it behave like Nuvoton". Can you provide a concrete use-case as
> an example?
>
> Andrew
>

--0000000000003bd89c063e9e33bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Andrew,<div><br></div><div>I discussed with the orig=
inal author of the patch and the Nuvoton functionality mentioned above has =
not been upstreamed since then, unfortunately.</div><div>Aside from the com=
ment above, we believe this patch series allows gpios to be accessed more d=
ynamically/flexibly in complicated simulation, and also helps with accessin=
g advanced gpio features, see the sgpio implementation later in this patch =
series.</div><div><br></div><div>Best,</div><div>Coco</div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 9, 2=
025 at 8:52=E2=80=AFPM Andrew Jeffery &lt;<a href=3D"mailto:andrew@codecons=
truct.com.au" target=3D"_blank">andrew@codeconstruct.com.au</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2025-09-=
03 at 21:38 +0000, Coco Li wrote:<br>
&gt; From: Felix Wu &lt;<a href=3D"mailto:flwu@google.com" target=3D"_blank=
">flwu@google.com</a>&gt;<br>
&gt; <br>
&gt; Added 32 bits property for ASPEED GPIO. Previously it can only be acce=
ss in bitwise manner.<br>
&gt; <br>
&gt; This change gives ASPEED similar behavior as Nuvoton.<br>
<br>
Can you point me to the Nuvoton functionality? I had a quick look and<br>
couldn&#39;t immediately see an equivalent implementation.<br>
<br>
Regardless, I&#39;d like to see more motivation in the commit message than<=
br>
&quot;make it behave like Nuvoton&quot;. Can you provide a concrete use-cas=
e as<br>
an example?<br>
<br>
Andrew<br>
</blockquote></div>

--0000000000003bd89c063e9e33bc--

