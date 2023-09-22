Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1599348ejm;
        Fri, 22 Sep 2023 14:21:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+0lP4FODB6qlRW9dPN8RRk1PAJMpU7Q+2FWqUkULManRAWWyqRlDUc3QPwU+5cwOfB7oU
X-Received: by 2002:a05:622a:1741:b0:417:b975:6d8a with SMTP id l1-20020a05622a174100b00417b9756d8amr730913qtk.56.1695417659743;
        Fri, 22 Sep 2023 14:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695417659; cv=none;
        d=google.com; s=arc-20160816;
        b=V/9VtR53WyGEzaIK+GD1W5FGNxAW+4wqxXbnTzWJNWlk6jWVnAO08N0abnvu4k2ZeT
         fnlyHHsNxN+DxSjM/7E7B2KqWxvPBLYhyLMkqb8P1fqtepF0kvwSqCBlUXTfPSTNRboS
         mm9RXPdrRxpTkaRG7cZPcOBd4hXmz4A5aYwbxukLZchjAeMmhvJnxcvkcHmjpUlOZlMa
         ixaGyX6SrFmVhA9540Feh6/uFI244Du7douMBKObyvbTIrU9hrOeLZxIAjbpZRf5Otqe
         rVm4DHz4NMfrIkevWgrWSvHMYB0HZz3CYG0UNArbX/Jf/CSgBY5Mf+DD0R+dBQSPiNLm
         jaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8tTiA2/3rErjRJAJbqEVAZaDi9MtkjTW8NXaO0a17vw=;
        fh=dRZ6DC2tqu02nhF1Fq5eNt4MRqLyIZ/pv0e5tuM3uEo=;
        b=RdOJShQgqau23utiiaKIbL7u25VQIBS0gWtzaBNFPT1MkG2Bd232b2zrYfnH6TCs/D
         myHcyyX9TIcua2h8bsgz3Zdb3/4O3J18YFuueAwaia2uPcbsEvVXoFCeSZi0JFDGbYTv
         npE2rgp2A0qS6EwlCObs7oS/hgRVIF30ZhMUmcfIqQYUq7Hu0PPkCHwa9NzhtVcRhQ4Q
         Hu+keLYQeces/Jb+7NGCB8VZru6+2bojSN4mkPM4Asw99ipOs/xwVY7PjFpfB1wTWMx/
         d/+P3Iq8N5LmFw7+K+TQp/DfR9nGs2VTsbOwIeIuCz5VddnaSEa/Wp3dsGRkkk3lhUkw
         YkUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=uXLFrMop;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19-20020ac85a13000000b004179528f250si2934890qta.87.2023.09.22.14.20.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 14:20:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=uXLFrMop;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjnZx-0001b0-Be; Fri, 22 Sep 2023 17:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crauer@google.com>) id 1qjnZv-0001aR-8Q
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 17:20:47 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <crauer@google.com>) id 1qjnZt-0000rX-JM
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 17:20:47 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-690d2e13074so2590136b3a.1
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 14:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695417643; x=1696022443; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8tTiA2/3rErjRJAJbqEVAZaDi9MtkjTW8NXaO0a17vw=;
 b=uXLFrMopvIBipXlHTxcQM++90rfRwbVjinjS3kiZjXGVcXngu3W/pJGRmYmydY79SH
 JMv01s9eI9TDi64WZANdX2x10eTBIZ01guGxjjCw7R26bAXqqkAnW0fFJ8GdgQMMT1AO
 +GqmPj/04FGv4tsJqqIcwxp+QGQkeFFPmNslBu4A9UzvdtGguXAPJNvavOFDIwZghYy0
 KpbIfA9STKJXmeav601W4i5hJZ6BM1j8E6rc8PIda4vFkKAhDtTdk0G35vFkIvXbkoVY
 aGw2jrXpnM8oYqHAv44g4U176hGYFRKYKL1BqNzvvEsVHhOApYFKS8xPCr2nbPBEyTij
 zJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695417643; x=1696022443;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8tTiA2/3rErjRJAJbqEVAZaDi9MtkjTW8NXaO0a17vw=;
 b=Tnpte15yeEM9n0DB4cBndcnMDd7XijPeWNUdrrVaPdKTomCTcLQvdasExrHXcw3Otd
 f6pUJUmN3t7QBzMDFejlJAVubvkk2jKrrOAMGw09mk/+oPs5okO+c3E3J8YD9hIsYonf
 BhfxoSadqVxVCedq24ZvhFRQ7FWwskcLXBNPiDgzzMXohzdi29Fr3aC3tFS/2IQV7EZ9
 bV46qQOAfDLpNbFppFvrYTql+eAHvUnLQnXRLVf4VQVj7u/eOwkWoombdAMnBxSmM43z
 0ldVV7L0ACq5rLnY0niea2kGMGHHrJTOSPu6X6cGoCX3g3jXfbXWltzfma91Jk5uNZr3
 y2Eg==
X-Gm-Message-State: AOJu0YzvMF5j9SClSNW5o9cSEtPMkJHLMjgMFOxgCg8asNFgqJRIkpV6
 PrTeTG9mFgBsEJDlgbiCMHTzK722Aql++FlcO2ygqI0L9aVid31ePws=
X-Received: by 2002:a05:6a21:3d87:b0:154:e7e6:85c8 with SMTP id
 bj7-20020a056a213d8700b00154e7e685c8mr768214pzc.31.1695417643066; Fri, 22 Sep
 2023 14:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230922181411.2697135-1-crauer@google.com>
 <CAGcCb128kdfZTTBB808iGONtdM9cnJF5CGxXhd+aS+eg2U=3Gg@mail.gmail.com>
In-Reply-To: <CAGcCb128kdfZTTBB808iGONtdM9cnJF5CGxXhd+aS+eg2U=3Gg@mail.gmail.com>
From: Chris Rauer <crauer@google.com>
Date: Fri, 22 Sep 2023 14:20:31 -0700
Message-ID: <CAFtMCFXaS-TTPXbBiVWVxdgK9zFUVj1Ft119p5Hzi_wj+=bSKw@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/npcm7xx_timer: Prevent timer from counting down
 past zero
To: Hao Wu <wuhaotsh@google.com>
Cc: peter.maydell@linaro.org, kfting@nuvoton.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005d0fb80605f92e17"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=crauer@google.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YFau7eCILO/0

--0000000000005d0fb80605f92e17
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No.  This patch does not address that issue and is not related.  I was able
to reproduce it about 2/1000 iterations with and without this patch.  I
will look into that issue separately.

-Chris


On Fri, Sep 22, 2023 at 11:24=E2=80=AFAM Hao Wu <wuhaotsh@google.com> wrote=
:

> Is this related to this error?
>
> https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg04903.html
>
> On Fri, Sep 22, 2023 at 11:14=E2=80=AFAM Chris Rauer <crauer@google.com> =
wrote:
>
>> The counter register is only 24-bits and counts down.  If the timer is
>> running but the qtimer to reset it hasn't fired off yet, there is a chan=
ce
>> the regster read can return an invalid result.
>>
>> Signed-off-by: Chris Rauer <crauer@google.com>
>> ---
>>  hw/timer/npcm7xx_timer.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/hw/timer/npcm7xx_timer.c b/hw/timer/npcm7xx_timer.c
>> index 32f5e021f8..a8bd93aeb2 100644
>> --- a/hw/timer/npcm7xx_timer.c
>> +++ b/hw/timer/npcm7xx_timer.c
>> @@ -138,6 +138,9 @@ static int64_t npcm7xx_timer_count_to_ns(NPCM7xxTime=
r
>> *t, uint32_t count)
>>  /* Convert a time interval in nanoseconds to a timer cycle count. */
>>  static uint32_t npcm7xx_timer_ns_to_count(NPCM7xxTimer *t, int64_t ns)
>>  {
>> +    if (ns < 0) {
>> +        return 0;
>> +    }
>>      return clock_ns_to_ticks(t->ctrl->clock, ns) /
>>          npcm7xx_tcsr_prescaler(t->tcsr);
>>  }
>> --
>> 2.42.0.515.g380fc7ccd1-goog
>>
>>

--0000000000005d0fb80605f92e17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No.=C2=A0 This patch does not address that issue and is no=
t related.=C2=A0 I was able to reproduce it about=C2=A02/1000 iterations wi=
th and without this patch.=C2=A0 I will look into that issue separately.<di=
v><br></div><div>-Chris<br><div><br></div></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 22, 2023 at 11:=
24=E2=80=AFAM Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@go=
ogle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr">Is this related to this error?<br><br><a href=3D"h=
ttps://lists.gnu.org/archive/html/qemu-devel/2023-09/msg04903.html" target=
=3D"_blank">https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg04903.=
html</a><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Fri, Sep 22, 2023 at 11:14=E2=80=AFAM Chris Rauer &lt;<a hre=
f=3D"mailto:crauer@google.com" target=3D"_blank">crauer@google.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The count=
er register is only 24-bits and counts down.=C2=A0 If the timer is<br>
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
</blockquote></div>

--0000000000005d0fb80605f92e17--
