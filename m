Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3588657lfh;
        Tue, 31 May 2022 09:45:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3SJq7/gH1gBKrHI8moRj3GmCLcbMjKwyOtCRuhZTzqQXI8zwDIrtKQknZJPPvkM4I/+UD
X-Received: by 2002:ae9:f213:0:b0:6a5:c3e5:3832 with SMTP id m19-20020ae9f213000000b006a5c3e53832mr17432974qkg.314.1654015509564;
        Tue, 31 May 2022 09:45:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654015509; cv=none;
        d=google.com; s=arc-20160816;
        b=dM244uVfbHtKabnPmboSMnbY0IZQpQTqiQxB+1TlYuaQzP9baNnyCNhl7c/MZMcRXy
         PnLDy+WGC0uj8u7/hsub+HDyiJ4TvVl8dLHXPrF2BRuTz5gWM9VfGXhmWPxtI3oq3nkM
         Qy0cU/3E9KXmaha8FFKQOPShUgYORvsxpR3LN7HKTeRl4bwVFc6tpeOwigO5aXpaDCn5
         fqCVLhyjHM8sN0gzUqep/r18HZ4kY3pszKshHlOHQSxiVv/eQIjOi4YmBl4/kBixwYic
         4S4iG5mWc89LFvuaDzq9GWeK4nAKgSVStBOE/WtjXTO104oDJ/k5OJn7COMH2EOJP+vC
         5GOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KIKeAqkrG19d4My41f/svEHozW5TdYssAHIH19GQ9fA=;
        b=F16+7mzH7EMAaKaqGpZUdsh4P552Xbl8Zkk3HIMFjTUAuwFkFpTnrBnMFR6lHb8Z6W
         +Vn/87T9Pwb1s/4koXCmQXZB0u5q1nePwFPeAN9ZDK46ZoAAoU3VwoAxOKYVv5zSDj+M
         jg+Ujy2Xvh06fk3O1g9MJZ7VzFpw2FZy3R2ayjt96BiW7Y5UkH8IjETbXUpeZSk6QFxI
         3nasKCqhDyvkK+KFRF3b4Wq0E2lX8KSht2Bqpci0JcwqetChlCYMU2rZ14LGqgR/SCOd
         H6oB94SSvm3ZC9UMs2AjQ/PcX+ZARvYRkZwDymGqajUzLsLaaTX3AI9l2CBgp/SIECHQ
         xd4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=tP9Rf9qK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kl18-20020a056214519200b0046205d7aa71si8343325qvb.18.2022.05.31.09.45.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 09:45:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=tP9Rf9qK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:37408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw4zU-0003Bh-R9
	for alex.bennee@linaro.org; Tue, 31 May 2022 12:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nw4mS-0004Pz-0i
 for qemu-arm@nongnu.org; Tue, 31 May 2022 12:31:40 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:41869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nw4mO-0005vn-NR
 for qemu-arm@nongnu.org; Tue, 31 May 2022 12:31:38 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id r1so12312471qvz.8
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KIKeAqkrG19d4My41f/svEHozW5TdYssAHIH19GQ9fA=;
 b=tP9Rf9qKhwP+AZZ/rpTX27784bvPBI/RVELijOsQFudJ3T7Z03VmD5P3VBjNLQR0E3
 zUFq8Oynr5MGfjsBQSK5Lerxqbv35edOL5t9A19e/PeNLy1le0GJOdqyJ4ozSkJPJXmJ
 i41jE10x3MVErzG6q/veReKM8FT/T7fU2TnGaYcZfZujQf8ne9diq8PxenwTVSeXjpjI
 0K39/ZGakaW+bx8RWjt813nPKB2yUa94T4W+xb2qGYTTyp3o3YdgHS22DHQTLK+T8BPV
 SgEMCPk/Ak9K+7xEJi5AZHtCsRCdqvEPW9W3+bhtFrp4p6pviH63YW7Y0+ana0ebDBwN
 T32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KIKeAqkrG19d4My41f/svEHozW5TdYssAHIH19GQ9fA=;
 b=2UDfCBZnOLpbm74R4VMMeeVQdyTQOVbq7rul30lkiGFr2hAZYBA2wpgnxxXUZlsw2A
 PkTOhvUqP+au0lVvjC6sKVYG3WFSlomHoCHVT5FosHHzcjjugpIHMHg5TAwdmLBLj9gZ
 KDuK3BQCmq9TQUWEYAuUcePuACIl0s07ZuWbBOAigz4obN55kLJTmNhlVN9w0eKoo0kR
 F/h09MJzEkV4zhLMwvTj05aSO4vuTJH852qFXF3IHAJrrGsP7yucHMd56zsjpm3QuIum
 W8NOckkRNn29+EweCQJgBMMP33GzNJJ7QGkpbhr/eBg9LT644zfeEOV9Q+g2FDZWtM9S
 dNIA==
X-Gm-Message-State: AOAM532NAzUF9LDZ+5fUH2LR1gYk/A8qk+P4p2P/VvOsgDRvIQUwLASy
 2iEoUOhQmqAIyiWZF+KdfA26j41KeWCnISwRjI78sg==
X-Received: by 2002:a05:6214:224f:b0:43f:cd6a:1d6b with SMTP id
 c15-20020a056214224f00b0043fcd6a1d6bmr51826881qvc.12.1654014695062; Tue, 31
 May 2022 09:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220531080921.4704-1-linmq006@gmail.com>
In-Reply-To: <20220531080921.4704-1-linmq006@gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Tue, 31 May 2022 09:31:24 -0700
Message-ID: <CAGcCb129Mz-ZDSc_wFF=Z6SiNHiC6Lnr+4TGvUKMOaYWchaCPg@mail.gmail.com>
Subject: Re: [PATCH] qtest/npcm7xx_pwm-test: Fix memory leak in mft_qom_set
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000005aa52805e0514ed0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=wuhaotsh@google.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: Z3JrfO/10ogs

--0000000000005aa52805e0514ed0
Content-Type: text/plain; charset="UTF-8"

On Tue, May 31, 2022 at 6:18 AM Miaoqian Lin <linmq006@gmail.com> wrote:

> g_strdup_printf() allocated memory for path, we should free it with
> g_free() when no longer needed.
>
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
>  tests/qtest/npcm7xx_pwm-test.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tests/qtest/npcm7xx_pwm-test.c
> b/tests/qtest/npcm7xx_pwm-test.c
> index c4a5fdcacd79..e320a625c4b6 100644
> --- a/tests/qtest/npcm7xx_pwm-test.c
> +++ b/tests/qtest/npcm7xx_pwm-test.c
> @@ -268,6 +268,9 @@ static void mft_qom_set(QTestState *qts, int index,
> const char *name,
>              path, name, value);
>      /* The qom set message returns successfully. */
>      g_assert_true(qdict_haskey(response, "return"));
> +
> +    qobject_unref(response);
> +    g_free(path);
>  }
>
>  static uint32_t get_pll(uint32_t con)
> --
> 2.25.1
>
>
>

--0000000000005aa52805e0514ed0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 31, 2022 at 6:18 AM Miaoq=
ian Lin &lt;<a href=3D"mailto:linmq006@gmail.com">linmq006@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">g_strdu=
p_printf() allocated memory for path, we should free it with<br>
g_free() when no longer needed.<br>
<br>
Signed-off-by: Miaoqian Lin &lt;<a href=3D"mailto:linmq006@gmail.com" targe=
t=3D"_blank">linmq006@gmail.com</a>&gt;<br></blockquote><div>Reviewed-by: H=
ao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt=
;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/qtest/npcm7xx_pwm-test.c | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.=
c<br>
index c4a5fdcacd79..e320a625c4b6 100644<br>
--- a/tests/qtest/npcm7xx_pwm-test.c<br>
+++ b/tests/qtest/npcm7xx_pwm-test.c<br>
@@ -268,6 +268,9 @@ static void mft_qom_set(QTestState *qts, int index, con=
st char *name,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path, name, value);<br>
=C2=A0 =C2=A0 =C2=A0/* The qom set message returns successfully. */<br>
=C2=A0 =C2=A0 =C2=A0g_assert_true(qdict_haskey(response, &quot;return&quot;=
));<br>
+<br>
+=C2=A0 =C2=A0 qobject_unref(response);<br>
+=C2=A0 =C2=A0 g_free(path);<br>
=C2=A0}<br>
<br>
=C2=A0static uint32_t get_pll(uint32_t con)<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000005aa52805e0514ed0--
