Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2905349ejc;
        Thu, 28 Sep 2023 17:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl7OZO+/fzpbwv7F+Qv4HnYMgDLA22GQv7HLEoEn9JzYGBVepO0jB9CNjPIikxVJRm+D45
X-Received: by 2002:a05:620a:c06:b0:76f:fd5:d2aa with SMTP id l6-20020a05620a0c0600b0076f0fd5d2aamr2448917qki.47.1695946030453;
        Thu, 28 Sep 2023 17:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695946030; cv=none;
        d=google.com; s=arc-20160816;
        b=gBzi8hYZJhfs/Fo3Ds3W64j2M77OFfq40iBu8KGsSipBFq66vWh5Hs224CuZpKe7rh
         IBpV6qhuWEe0XkqB1HQb1uBCefYw0zTYFrq7Oc3eEAP4dmDt3KB1Opi6P8s70i+q50D+
         9GYG+0OLzylpjR/RJ0ok2GIV0kI+fNaMXJYKwNqwfBYqMAAUk0aZUiUFGY+VBsPrJ5wy
         C90AK73K5iqhmnB36Q4YhT33qXN7l22SSUK7DNpXaKwmPvqEZ3ohgkVec7DdXfiwtRG7
         Wz+a0fF7xoaGPAs6hv5GP9K8mxw3+UrtkyKVGYW9R+tKr/bpd0JdvmP0kkWV0yOA65V5
         3SLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=05DRJFyDe8vk6upmI+dJM7NtLnApDdy7Sg1oM2sN+m4=;
        fh=sz06Ytq5Qd1ikD1jLqAIVDQ/Sto06BlBhro9pf7EAJE=;
        b=rGdfZ8l+SP4CjeQwQUxZSAtqmwIjAFniNPfKFgZOfc4NrI+bQ2LSOAQp5fMDpECclV
         xDLnOCs2ft68qOIbeC3Z1YsmPFhaWh4oUXn+0m2Nhfk/IU9IM1+CeOUxWaKdKdpXBEo4
         CGfm+4eeURMRQ4BTUiLK8Sg4IHFtiKZb89ndgFQJ6a/B/Yo8jQP0+lO2zW2KLPhTTRyo
         8yXXMQKkri7fA4Z0CAU4a0V6MRcrERXWI1FsSnkbRBPlm4Am8MmOinEAOR52miY5mUPu
         c1AZBaRM9E6syGZAsK71TanvA6cMiQ8Zy2YnX1p0/j0w1I+1Q+ZtDZRcEPBumu++9zfe
         yJ9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=iCPVOik0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk6-20020a05620a1a0600b0077584112852si714257qkb.686.2023.09.28.17.07.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Sep 2023 17:07:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=iCPVOik0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qm11v-0001VB-8y; Thu, 28 Sep 2023 20:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crauer@google.com>) id 1qm11p-0001Ub-95
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 20:06:45 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <crauer@google.com>) id 1qm11b-0004hM-Io
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 20:06:44 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-27760c31056so6451480a91.1
 for <qemu-arm@nongnu.org>; Thu, 28 Sep 2023 17:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695945988; x=1696550788; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=05DRJFyDe8vk6upmI+dJM7NtLnApDdy7Sg1oM2sN+m4=;
 b=iCPVOik0mtdfvYFRyHdqsdcZeRkmB9FJ44goKPK4260QFvhkCCmYMwsFvLKwSLz8HE
 OVufIasjjzl97XKENBJylVb1k1ORpZT4vLbQAl+E4/zFgYX0anc85YqmX4xDgzniBsvv
 wgaE7S9HHrkn0mlramobi3U1CsyMtAPTSq95WpxnFrG053CnwSMrK47hcPBw+IPnDeWl
 rg2Q9rQcZgd3w/v1rNyQfKxF+NNEzsFUPte/NYqGZgc/Hbvo0JW7cBSeV91+bUej63gA
 o5D9vdoFT8fo4jgg0+U7F36VJSB517lZ4wigDnZYCk8uAmfH/NrcnBe/WO0huEamx0Zm
 VPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695945988; x=1696550788;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=05DRJFyDe8vk6upmI+dJM7NtLnApDdy7Sg1oM2sN+m4=;
 b=fDNt+KlXGNBMtS3zLP5A1CDPhLaWq0+sdLdEwFl2qEXyGdaDR3yOp4ybzDQCxaH+Lh
 awrcaOr9wx53PNJxzHbbWFJxxvUM/pIxD8XDEZyi3Pf0R4MQ9E3l5fheAMIsAxNcL0N0
 HwJJ36t1euM7r4So3AJNz6ytuVKetFu6TlyfGgo/T3GkF4Bugf0M5IYOq0YPcUha7u5z
 IfS8vIYlJfzsKhjn/ED/0ApQM9+f10+UWC7eTOH+CpLS0IpvUtUHMm6jcS9ye6qVNxeU
 ampKD+SRofPmBr9Iz+yvkjsqaow9tJ/8LkYrV6Z+5qEISFnuX0yskH9151H+RMSRg5eh
 L3Pg==
X-Gm-Message-State: AOJu0Yw6SbCHIxdktVaR2XIzpZuFz3nys6nfaS8FOq5XPUavcKZkXYCp
 RSjaRhyXSYVkmg7Se/4RblQ9nKUH6P3t3H9PEoiVnA==
X-Received: by 2002:a17:90a:d787:b0:273:f51f:1626 with SMTP id
 z7-20020a17090ad78700b00273f51f1626mr2350374pju.35.1695945988175; Thu, 28 Sep
 2023 17:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230928034505.255480-1-crauer@google.com>
 <e5ddb46e-e677-3fc8-4f32-0f59e85eb304@redhat.com>
In-Reply-To: <e5ddb46e-e677-3fc8-4f32-0f59e85eb304@redhat.com>
From: Chris Rauer <crauer@google.com>
Date: Thu, 28 Sep 2023 17:06:16 -0700
Message-ID: <CAFtMCFWPjmgVn++ioNvKHtAft3+fFrba0ci0TePpMTzptwCVsA@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: Fix npcm7xx_timer-test.c flaky test
To: Thomas Huth <thuth@redhat.com>
Cc: kfting@nuvoton.com, wuhaotsh@google.com, lvivier@redhat.com, 
 pbonzini@redhat.com, stefanha@redhat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002fd4c0060674322f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=crauer@google.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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
X-TUID: sxXOaadNWppq

--0000000000002fd4c0060674322f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ack.  will send out v2.

On Wed, Sep 27, 2023 at 9:44=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:

> On 28/09/2023 05.45, Chris Rauer wrote:
>
> Could you please add a proper patch description how this is fixing the
> issue?
>
>   Thanks,
>    Thomas
>
>
> > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1897
> > Signed-off-by: Chris Rauer <crauer@google.com>
> > ---
> >   tests/qtest/npcm7xx_timer-test.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/tests/qtest/npcm7xx_timer-test.c
> b/tests/qtest/npcm7xx_timer-test.c
> > index 43711049ca..58f58c2f71 100644
> > --- a/tests/qtest/npcm7xx_timer-test.c
> > +++ b/tests/qtest/npcm7xx_timer-test.c
> > @@ -465,6 +465,7 @@ static void test_periodic_interrupt(gconstpointer
> test_data)
> >       int i;
> >
> >       tim_reset(td);
> > +    clock_step_next();
> >
> >       tim_write_ticr(td, count);
> >       tim_write_tcsr(td, CEN | IE | MODE_PERIODIC | PRESCALE(ps));
>
>

--0000000000002fd4c0060674322f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ack.=C2=A0 will send out v2.</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 27, 2023 at 9:44=
=E2=80=AFPM Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 28/09/2023 05.45, Chris Rauer wrote:<br>
<br>
Could you please add a proper patch description how this is fixing the issu=
e?<br>
<br>
=C2=A0 Thanks,<br>
=C2=A0 =C2=A0Thomas<br>
<br>
<br>
&gt; Fixes: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1897" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-=
/issues/1897</a><br>
&gt; Signed-off-by: Chris Rauer &lt;<a href=3D"mailto:crauer@google.com" ta=
rget=3D"_blank">crauer@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qtest/npcm7xx_timer-test.c | 1 +<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/tests/qtest/npcm7xx_timer-test.c b/tests/qtest/npcm7xx_ti=
mer-test.c<br>
&gt; index 43711049ca..58f58c2f71 100644<br>
&gt; --- a/tests/qtest/npcm7xx_timer-test.c<br>
&gt; +++ b/tests/qtest/npcm7xx_timer-test.c<br>
&gt; @@ -465,6 +465,7 @@ static void test_periodic_interrupt(gconstpointer =
test_data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tim_reset(td);<br>
&gt; +=C2=A0 =C2=A0 clock_step_next();<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tim_write_ticr(td, count);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tim_write_tcsr(td, CEN | IE | MODE_PERIODIC =
| PRESCALE(ps));<br>
<br>
</blockquote></div>

--0000000000002fd4c0060674322f--
