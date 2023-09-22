Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1511258ejm;
        Fri, 22 Sep 2023 11:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/3Inxdcl4DWTNAtCycHCgtmKmUe+Af7OfMlr/PvM6tj3yqWsifr0pR2N1h477H1kIUdrA
X-Received: by 2002:a05:620a:16b1:b0:76f:fd5:d2aa with SMTP id s17-20020a05620a16b100b0076f0fd5d2aamr203599qkj.47.1695407086330;
        Fri, 22 Sep 2023 11:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695407086; cv=none;
        d=google.com; s=arc-20160816;
        b=ANeaXd/Mz/w7gE2G/Fo9d6JVWZlYypv2QccTSQB5mtpWYbC0ZboYrb2/Ovn9tMFO/K
         zxUmZYoNkxjQNDBEm/Ai/13WXrgKf8/5AvEMH4CkKjPjgYUNpFApAwD3RYWvDUMH7tf0
         DWToaWlxuokWNM6OE2tBnPBHLIBaVwEH47FgASjYz5rZCD6X93gCWTQhtLX7Afl8GQTC
         rHeNR5SSc9c7B7sgxRLb+pJzsLS45lYN397r+F7xGfqQ6JnXTiMPbiXPJzcxhx8Xotd7
         iLug+Q+Ra4iCZ24Z0nIdAiscv9lV2zMZRmjKuWjmXFImxeAUvPzFHhq8hLZtBA2rFAZr
         Guzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Q9YX3XP+SjP8dNIsi+AfDLWEbL7erHHKGk6ZhuChOIU=;
        fh=HKgNk0ulfEJKFUuoyv+PbHFKbWd5EF5CqTpi/QqrRuI=;
        b=mAqAHhY69CZ9gKAdj2Fqer7BiOHGTXOvVnAEEmVk+/IRSqSNrdc4C0ypbOlGA/3e9P
         VIvt1XUz0hGdQgLevlxCwIKRqJCIjKOPt3j5Q47k4J1wywKdv2uelgeVhOyi4NmDX1yE
         B3kjNPZT09Ag7oH91uJLJSOq0XNTC9aQweP/sgp1GW++9awByKPrgiv4871ZOsRS1I85
         TXrPZC+z5XmXU/sqNrLXcD8007RreDzVprk/7YeWUCM6Yr+ScLtyLeGMFBxYzsWjjaee
         JISEQOUbn9JPUIy7hgmCtCTTgYs8J0hoBh/GwaKaKVbcKkfyScH1QdXoHfBFcqOWw7gU
         /M0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PmpXsWVV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14-20020a05620a414e00b0076cb047fa2fsi2402183qko.619.2023.09.22.11.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 11:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PmpXsWVV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qjkpO-0005yz-Sd; Fri, 22 Sep 2023 14:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1qjkpN-0005yj-FP
 for qemu-devel@nongnu.org; Fri, 22 Sep 2023 14:24:33 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1qjkpL-0001A6-MH
 for qemu-devel@nongnu.org; Fri, 22 Sep 2023 14:24:33 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4053f24c900so12465e9.1
 for <qemu-devel@nongnu.org>; Fri, 22 Sep 2023 11:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695407063; x=1696011863; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q9YX3XP+SjP8dNIsi+AfDLWEbL7erHHKGk6ZhuChOIU=;
 b=PmpXsWVVgfFeqQHHmzAYr039XwMjMFPNwmbtnbq0EJa7WhGUtqSVwovsGV33y1eCB/
 I43/P3jF/Zn2LZvAa+MdmgLWxg2F0TwK5gPI6AAjU8c9Ssoe6YlTgtXj6haR/htiBRmn
 tVB5Vk774t9t2zG6tc2rh8sCU4d7PnlEyeJYtuwZcjGvgZ5vAdQVMeMAg48xXm5POL5F
 uWGxdokEpG00xR46YlND7BYKUSMuJ5AJTg1vxoHahgNdF7zNo/XRCNqdNQPblQqkIw+n
 j+3JgSY8N/T4RP+VuBeXAWadLU2kW88RVw99iE8aN1VrKqjnvgVPaJVEsxFaQlkuz1BL
 6rUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695407063; x=1696011863;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q9YX3XP+SjP8dNIsi+AfDLWEbL7erHHKGk6ZhuChOIU=;
 b=YKHhZMrSHxiLPeqdQNxEptw93BiXWJoEQJrNDCpNHtKngZt7K9tQiVD9aDFXvuo2P6
 vmoXgW31JXh25J3upPJdPazUubtVui5hkZmxZI4/QgYi/XCCD/fh1MZ3M4byGtiZCHXN
 SDGijskjlRq7LnbbHapb42l4HqYGw6w5HnY3OP8xCxIN47t9XAhLBLWPYaOn6e8i0yek
 HPUU2RMn079aBb2ATY6SKML0YE7aiIqvGRVqJVoDlcrfYpzj/yJ68t+O73PzNQgNKpN6
 p0TPnqXvLNxmD9qYc2g2Xl4s6/wbIPZDMv4P7LGYCh7TzSZ58rm1ajbT3s2eZKjwLnSK
 CCqg==
X-Gm-Message-State: AOJu0Yw+eT4ZItuLIoRFf3V11nXoLzvatqiimDkyKkmCEJMbfwcBJbDO
 AdCvIVJntL9S54y9Zrfly7NR4HIhpGgpCwGnI2KQ3A==
X-Received: by 2002:a05:600c:2146:b0:400:c6de:6a20 with SMTP id
 v6-20020a05600c214600b00400c6de6a20mr7919wml.3.1695407062652; Fri, 22 Sep
 2023 11:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230922181411.2697135-1-crauer@google.com>
In-Reply-To: <20230922181411.2697135-1-crauer@google.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Fri, 22 Sep 2023 11:24:12 -0700
Message-ID: <CAGcCb128kdfZTTBB808iGONtdM9cnJF5CGxXhd+aS+eg2U=3Gg@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/npcm7xx_timer: Prevent timer from counting down
 past zero
To: Chris Rauer <crauer@google.com>
Cc: peter.maydell@linaro.org, kfting@nuvoton.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b8dff90605f6b785"
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=wuhaotsh@google.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: apQQVnMdhbHM

--000000000000b8dff90605f6b785
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is this related to this error?

https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg04903.html

On Fri, Sep 22, 2023 at 11:14=E2=80=AFAM Chris Rauer <crauer@google.com> wr=
ote:

> The counter register is only 24-bits and counts down.  If the timer is
> running but the qtimer to reset it hasn't fired off yet, there is a chanc=
e
> the regster read can return an invalid result.
>
> Signed-off-by: Chris Rauer <crauer@google.com>
> ---
>  hw/timer/npcm7xx_timer.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
> index 32f5e021f8..a8bd93aeb2 100644
> --- a/hw/timer/npcm7xx_timer.c
> +++ b/hw/timer/npcm7xx_timer.c
> @@ -138,6 +138,9 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer
> *t, uint32_t count)
>  /* Convert a time interval in nanoseconds to a timer cycle count. */
>  static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns)
>  {
> +    if (ns < 0) {
> +        return 0;
> +    }
>      return clock_ns_to_ticks(t->ctrl->clock, ns) /
>          npcm7xx_tcsr_prescaler(t->tcsr);
>  }
> --
> 2.42.0.515.g380fc7ccd1-goog
>
>

--000000000000b8dff90605f6b785
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is this related to this error?<br><br><a href=3D"https://l=
ists.gnu.org/archive/html/qemu-devel/2023-09/msg04903.html">https://lists.g=
nu.org/archive/html/qemu-devel/2023-09/msg04903.html</a><br></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 22,=
 2023 at 11:14=E2=80=AFAM Chris Rauer &lt;<a href=3D"mailto:crauer@google.c=
om">crauer@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">The counter register is only 24-bits and counts down.=
=C2=A0 If the timer is<br>
running but the qtimer to reset it hasn&#39;t fired off yet, there is a cha=
nce<br>
the regster read can return an invalid result.<br>
<br>
Signed-off-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" target=
=3D"_blank">crauer@google.com</a>&gt;<br>
---<br>
=C2=A0hw/timer/npcm7xx_timer.c | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c<br>
index 32f5e021f8..a8bd93aeb2 100644<br>
--- a/hw/timer/npcm7xx_timer.c<br>
+++ b/hw/timer/npcm7xx_timer.c<br>
@@ -138,6 +138,9 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTimer *=
t, uint32_t count)<br>
=C2=A0/* Convert a time interval in nanoseconds to a timer cycle count. */<=
br>
=C2=A0static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns=
)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 if (ns &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0return clock_ns_to_ticks(t-&gt;ctrl-&gt;clock, ns) /<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm7xx_tcsr_prescaler(t-&gt;tcsr);<br>
=C2=A0}<br>
-- <br>
2.42.0.515.g380fc7ccd1-goog<br>
<br>
</blockquote></div>

--000000000000b8dff90605f6b785--
