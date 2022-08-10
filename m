Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp115912ejf;
        Wed, 10 Aug 2022 13:44:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4ATEjoY94lScrONjfpmTamAtYhLZy/YzbJoKy3bCykBbN5P+wbdmLVJokoj4FvEFJSbGWA
X-Received: by 2002:a05:620a:28c1:b0:6b5:e608:3edd with SMTP id l1-20020a05620a28c100b006b5e6083eddmr23168602qkp.730.1660164247960;
        Wed, 10 Aug 2022 13:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660164247; cv=none;
        d=google.com; s=arc-20160816;
        b=Wp/9zwej01fQ3oun+8pg2ELtwVF9C4ZfPsSiBD3E+P+aHyH01xGyzs/YH/SKDtE2tA
         IoSKEtVewvVUa4Yomwob35lrQZb1vfwyT9KhsD8tt9q3G8+4BhlImhYLuFUDXUsD/eGR
         sZ4vbY7D4BfG/yy9vlA+Wq41dwJenbyqyi1QjB+f6e7IoUkZedIWcZKGZeR89zxJKXDZ
         nGxW7oLegW9fYRuHjGHsPQOL/oWvFi2nX0gy72fPTaCTOJnuAivz/MsxYqo01vq1ifst
         k5lNHsX7fffinDp959RzwKwDl5i1HeSarUBk6i7QdC8YbE0A5nb9RkWieoGmFqXA5G2L
         5W8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TTulQ3YO/CzEPVPJ4IAzgqP9p38NHbJewrEmD+X7kbk=;
        b=zWYRQTHBA/FHdsnwP5rHI4bfy4OZYf1+eg+gKSSR72DqDAPBIDddNxw1nZAi6rz3xY
         JCLKGttXg9rD06MAKYt/cAyNhk+E7Hcujwg8dpW+B+tujqFReERdSkF78lWHOPuyceEk
         K/qyHXJvNQVyBhD/HOZL2RaAiSXIQ3FIvgzObaoY9gZoDYQZlSHf7p2xM9eLBkdhyyJP
         Rd/uQUKyiKmRlwHOYNgrog2dcmmrrBqe+ViMbTKh1G/AVXBnb4sZ5WagJ0zupzdhZNse
         RN0oLvPPfbQXG6KRuk4dOXZnvOcI92Zakn5p5DfLOiwGA066ktk3Q1D/ESxDCsPUSbJK
         OPpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=XOXNZDZd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y9-20020ac87049000000b00342f2052170si409994qtm.661.2022.08.10.13.44.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Aug 2022 13:44:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=XOXNZDZd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oLsYh-0001j0-Ad
	for alex.bennee@linaro.org; Wed, 10 Aug 2022 16:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vitalybuka@google.com>)
 id 1oLsNq-000336-UO
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:32:58 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:33440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vitalybuka@google.com>)
 id 1oLsNm-0007Ps-F6
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:32:52 -0400
Received: by mail-ed1-x531.google.com with SMTP id b96so20653844edf.0
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 13:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=TTulQ3YO/CzEPVPJ4IAzgqP9p38NHbJewrEmD+X7kbk=;
 b=XOXNZDZd0h5Usr/PGrmwIac9ipK85oH5PuhmZdJZQmpihKhWc6Vyde3s6jxeR949eg
 2iIgEtJ6/etd+eBwhpeWQ0gy+E4eG82eXmI/GLjc7OPCgzLqVrG/iGlQmL1DtnNzxStV
 N7sZ41beOh+H02VBkRjQF3MH+VzvD0MG0b4NnmYHOgkLEAJlBQQmSnPUgwE+t9ofY4RJ
 le3j0zc0GbueP4dX72VJI52kNAJIzJjMBsgg+Wv18vky+3Q6t1Wc8MIjjNZdcg7tni7L
 IR3TiJs7yF2bf5kN1fu0q4lu5dMaCEgDECVfEZAdiul2prijN1jPYYkETdoAM0pe0dF8
 GPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=TTulQ3YO/CzEPVPJ4IAzgqP9p38NHbJewrEmD+X7kbk=;
 b=KeDHswDCUAqnMof705I3ccT9h9O5Zt3Ytm6+69fg9gw28/XRQKKCt40ev3hW3JcrSg
 nM3S5vmgEWwlymcPzlgq8I6Zi5bMmYWHTdGrt0IS2upzqfJGRc8M0GdZH32UOKlqKeS8
 CWFipS+p8fmSsLF4o2juPtIthDz2OBv9OGMoCFCkpYcCo+tacHPPwA7JFoBHTY5yKycc
 V7Z9p2c2Jl7iFRc0SQmlU1lfVpRrRv7ATgKFivGxe4TW+aAaYmsXA0uJxyZO2TjglSMG
 mARcRuSQOYqqJ/jpZaHCWTLLhmzBfgMLnwdxaAMqwO8LQPvDvRWhHJZ98g+R0+SGmEUH
 QwOQ==
X-Gm-Message-State: ACgBeo1N+gAwcAxVIWc6IV6jL/AP4BK599odzzgQSaoeXRepylRQ9rm3
 2lFxsmVyBVKh+tZOnsoISQTaD6xsADljac4W6VlIAw==
X-Received: by 2002:aa7:cd51:0:b0:440:595d:aeed with SMTP id
 v17-20020aa7cd51000000b00440595daeedmr20069393edw.143.1660163566875; Wed, 10
 Aug 2022 13:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
 <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
In-Reply-To: <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
From: Vitaly Buka <vitalybuka@google.com>
Date: Wed, 10 Aug 2022 13:32:09 -0700
Message-ID: <CAPjTjwuNwXdemwFYOUDi4Qnc5fA9KWzAEZQ1JaCNu+0x3RUh7Q@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000aca42205e5e8f319"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=vitalybuka@google.com; helo=mail-ed1-x531.google.com
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
X-TUID: eqlYZqGSEKAt

--000000000000aca42205e5e8f319
Content-Type: text/plain; charset="UTF-8"

Sorry, I only noticed today that it's not submitted.
Version is not critical for us, as we build from masters anyway.
Richard, do you know a reason to consider this critical?

On Wed, 10 Aug 2022 at 13:04, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.com> wrote:
> >
> > How can we land this one?
>
> Pinging it a week ago rather than now would have been a good start :-(
> I think it got missed because you didn't cc the linux-user maintainer.
>
> Is this a critical fix for 7.1 or can we let it slip to 7.2 ?
>
> thanks
> -- PMM
>

--000000000000aca42205e5e8f319
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry, I only noticed today that it&#39;s not=C2=A0su=
bmitted.</div><div>Version is not critical for us, as we build from masters=
 anyway.<br></div><div>Richard, do you know a reason to consider this criti=
cal?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Wed, 10 Aug 2022 at 13:04, Peter Maydell &lt;<a href=3D"mailto=
:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 10 Aug 2022 at 2=
1:00, Vitaly Buka &lt;<a href=3D"mailto:vitalybuka@google.com" target=3D"_b=
lank">vitalybuka@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; How can we land this one?<br>
<br>
Pinging it a week ago rather than now would have been a good start :-(<br>
I think it got missed because you didn&#39;t cc the linux-user maintainer.<=
br>
<br>
Is this a critical fix for 7.1 or can we let it slip to 7.2 ?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000aca42205e5e8f319--
