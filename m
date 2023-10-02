Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1230659ejb;
        Mon, 2 Oct 2023 03:52:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELW6Zqsj6AzrRi8/1TCDp3sXRxScpFYwqEIHMCK/doDHvdf6vU+9y7wviFCpD3v7XRot/L
X-Received: by 2002:a0c:dc86:0:b0:65d:6a5:1a3f with SMTP id n6-20020a0cdc86000000b0065d06a51a3fmr10126331qvk.43.1696243974017;
        Mon, 02 Oct 2023 03:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696243974; cv=none;
        d=google.com; s=arc-20160816;
        b=RBUdk9C4YRm4oK3vNBo8KKNvrCtimy3wtB3E3MsTq/H5buJcbPe5qfaHvEgBXBbDyP
         WfHqu6oIQtwbQi3642PcI+TR5y0uBa89s7w797nIVQgWK2oSNCPkKk3UHo7iMFfhnIjF
         jjZlkItFX0YQi7fv7uIGR62c5qOafulu3yMDoy8gzPwt+5qbYOhwTyteOYSlOgoDTmmS
         6b0Er3EEcdy8OB2RUZvQJDoMgeF5sgq5vciHdDdZZMC7rX/KZvLpNOd7YnOOjNXunDJZ
         9V23WY8ufL45o+C5YHp435RtaIfPQzz5VKZNFzCLkHuNP6jrNyKoGKpw1uiDmHTURIBb
         dJiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/2eYx7vWVQPzZTFli3GHyOMMIyJ9hN3FK3UP2OelmkA=;
        fh=uPvUmp+vAX4cO0UAhGMxp4hlkvRT2sZWNfwXfuLBcdY=;
        b=GFZew6vzLjSBZGgYbfZVLnu0bTQQSyge82JMWHL/olC4Sd3Ig6J9vtDOMD5KPGQ9GF
         paa0LJBKVnADKfQFwTJ/5aBonTweXTqi+qep3aLmZVw5ZAn6bNp4Ao7aeiYO1nEytB2H
         1EDqnmaaXFWfhnSVMOjFcfu9a5TGiB2a+V/2DZZvCEo/LAhV3WAmKEhg9/nbcEy58Cp4
         WNQt2+NOUh/DcduzF13F3nGbtsnTrmUohMBUMcf595yo6zv7eo8qZO6+etOUhGYN7ezp
         K5mwCeAFWCy/Fzr4mDJk055NE13dSSvV2GpMTAkifSksxBgIaEDS0ZaU9RQPwMunmu2R
         krfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=j7itz7L+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a22-20020a0ca996000000b0065652a344fdsi9021269qvb.397.2023.10.02.03.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Oct 2023 03:52:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=j7itz7L+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qnGXe-0001Fs-38; Mon, 02 Oct 2023 06:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1qnGXb-0001FR-TM
 for qemu-arm@nongnu.org; Mon, 02 Oct 2023 06:52:43 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1qnGXa-0006hn-1N
 for qemu-arm@nongnu.org; Mon, 02 Oct 2023 06:52:43 -0400
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3af603da0f0so3484775b6e.3
 for <qemu-arm@nongnu.org>; Mon, 02 Oct 2023 03:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696243960; x=1696848760; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/2eYx7vWVQPzZTFli3GHyOMMIyJ9hN3FK3UP2OelmkA=;
 b=j7itz7L+oloZu6UHBBuGxbppzsA4dZPaIsqJ0dH4Lx/FpPCH00StuFM3w/cSucl0QY
 D3faRWnwhS87IMBC1bjYS625mXFeKEQSD9drq7mjArdM6VYisUO/dRZUkBUTVhDPjIsz
 VloLHOqXAMItY6bJP8ZAnlVnVOIrTaNS6cK1lhcRKkWmyurpdhAqfP7DiXjkB8+qoQ2f
 wuVpHTc4pZAsFXNoddYYoE5CoeAZx0XNlLf6XcQ1/xoc40AUKQoEwRfJMeBQ1BPA1rh4
 4Tm0YrhbC7bHw1G5AF7ar1ChuMz3qhBMcoZ9HHPwvfZ24iv+tOK2Crsq1jtw/ANgXQCv
 c2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696243960; x=1696848760;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/2eYx7vWVQPzZTFli3GHyOMMIyJ9hN3FK3UP2OelmkA=;
 b=gITFgCQj2DC3YYiCzMJCcnJtyv0KuLFIGkQG0B8/1JjQ4nuapk00geqJtIWWgsnf+E
 hpECpoRGkvzKR3tmlPIRyYpYDNiUU57KcvbUwLu5hDnZ8HgY8UWH/5eb43wuNu6GK1sV
 +xGRVFqrR6zTtmDkNuQgsBnB6ZfeRJAUF9mLUAalR0QI9dbQyXGb0rlL4KnGM2fOkrt+
 xCDEdvTTfltlKbyz/1FYn1GdC/rjymYBs2Iu8LBV6hLlrBHrsWjX59Xy60PW3nMjPk8D
 v2KS9tnUId3PV+oGhJE+REg/L+1Vg0mFTwcvZw+ZbOqZ5sf0FhZ1q8xlY3XF4D+eLuor
 dKNQ==
X-Gm-Message-State: AOJu0YzJxpl0LSLi9Hg4Kbyrn3TmzRPF5/tsSeNh80RGuw1CPz3VdIoN
 rXskuBpWvDXNHG+jf6M/mkos1h1dmqR2Cx7yF7M=
X-Received: by 2002:a05:6808:19a7:b0:3ad:ae62:8253 with SMTP id
 bj39-20020a05680819a700b003adae628253mr14024568oib.15.1696243959717; Mon, 02
 Oct 2023 03:52:39 -0700 (PDT)
MIME-Version: 1.0
References: <CANW9uyvsD8UWJ9yrrvgb4i7nEoDAXNaepk-zsJWuyw=tp_W9oA@mail.gmail.com>
 <20231002102231.GA3075015@myrica>
In-Reply-To: <20231002102231.GA3075015@myrica>
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Mon, 2 Oct 2023 19:52:28 +0900
Message-ID: <CANW9uyu85z9+-v8ait9EWcjWRu1+C8Xx3cM__8oBKof7fJwRwA@mail.gmail.com>
Subject: Re: Quick start guide on RME emulation
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000abe1fd0606b99286"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=itaru.kitayama@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 8Ij+vkD48uzn

--000000000000abe1fd0606b99286
Content-Type: text/plain; charset="UTF-8"

Jean,
It is indeed the latter. Itd be good if we could test how far we can go in
terms of launching a Realm guest via the CCA aware KVM.

On Mon, Oct 2, 2023 at 19:22 Jean-Philippe Brucker <jean-philippe@linaro.org>
wrote:

> Hi Itaru,
>
> On Mon, Oct 02, 2023 at 04:51:46PM +0900, Itaru Kitayama wrote:
> > Hi,
> > Is there a doc that I can refer to when emulating the Realm in QEMU?
>
> What kind of doc are you looking for, details about the QEMU
> implementation or instructions for putting together a software stack that
> boots a Realm guest?
>
> I could try to write something up about the latter based on my workflow,
> although most parts (TF-A, RMM, Linux host and guest, edk2, VMM) are still
> incomplete and out of tree.
>
> Thanks,
> Jean
>

--000000000000abe1fd0606b99286
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Jean,</div><div dir=3D"auto">It is indeed the latter. Itd=
 be good if we could test how far we can go in terms of launching a Realm g=
uest via the CCA aware KVM.</div><div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 2, 2023 at 19:22 Jean-Philippe =
Brucker &lt;<a href=3D"mailto:jean-philippe@linaro.org">jean-philippe@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Itaru,<br>
<br>
On Mon, Oct 02, 2023 at 04:51:46PM +0900, Itaru Kitayama wrote:<br>
&gt; Hi,<br>
&gt; Is there a doc that I can refer to when emulating the Realm in QEMU?<b=
r>
<br>
What kind of doc are you looking for, details about the QEMU<br>
implementation or instructions for putting together a software stack that<b=
r>
boots a Realm guest?<br>
<br>
I could try to write something up about the latter based on my workflow,<br=
>
although most parts (TF-A, RMM, Linux host and guest, edk2, VMM) are still<=
br>
incomplete and out of tree.<br>
<br>
Thanks,<br>
Jean<br>
</blockquote></div></div>

--000000000000abe1fd0606b99286--
