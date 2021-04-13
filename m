Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4454708lfr;
        Mon, 12 Apr 2021 19:28:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyugh8wF/HZ3QKbRpqrLLk6N/VqqlpX+ZJjkHxqj9++rpHSGrBATlArhehisEv4OpiBS7+c
X-Received: by 2002:a25:316:: with SMTP id 22mr1338535ybd.523.1618280918977;
        Mon, 12 Apr 2021 19:28:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618280918; cv=none;
        d=google.com; s=arc-20160816;
        b=L6DFX3hjmcRpRC7mkR5HphAywVan/Kstd9hqNKetneNmTCCCMRTYxarh/hpkWRrDzY
         VdmpHpy+BGCoFjY/JX/ku/+BA+xfTCYhBVGR8m2nUEpRja7gQPIw5Tgsv4iFbRZX4Zib
         rTrxbUatRkc3XvpNh7gUOr6vzZ9FUZoPIwRyySUAa/hJnqTu0Ucz4HNGTnzp6gV6qQ3A
         q6dS/TU15yPo0YS32XcYQjYi4qT5dzShEXKufScUGyqi+QnD1IlE0KsbfriH8AmkKnsk
         bTPje5d11Ig/AmkaHfvwRox0qMuJkUJTHp5HDp3LLFhGRqjg5byWj9OJjKyfB25nc34R
         IOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=x7IRPUZjaNzkRN+O5MK9Zb81XDytBP70BW5Qu6Pbod4=;
        b=IIQRSX9V/kyZ2dC5lVm2+sGZwVWOWwn6Fk7s1Mx7fBTeVqFXlq0bf/ZROtZvmn1PIb
         7/2Wfwdf7+vGtYSsEfsstSoUFfDcQ/VyWVqHmJ1fDlvj3FVchuk4jROe70Bhz3UDrAEi
         GCpKmuFMlDmh77tAgUCovqZg+3sgbpHWS9NETAX9kfLwScmHA39oPWQmQ+nOCskovy1v
         +SP+VCxSgNNgatzUUbtTBrYIOMyVFtWrH4Akf48mf2kvizVRZQqMZiQU4uSg4Md+GS3L
         nm+UKMuWZ4Bbe0dc/jOG3LPMKWTmGvMDQNfmnYeZ+K3jqKW5ZQQV3JlYecoUYChIGwuB
         qf3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=NccNQUSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h16si11011875ybg.444.2021.04.12.19.28.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Apr 2021 19:28:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=NccNQUSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lW8n8-00036S-5j
	for alex.bennee@linaro.org; Mon, 12 Apr 2021 22:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lW8mg-00034P-57; Mon, 12 Apr 2021 22:28:10 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:44756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lW8md-0000cG-0g; Mon, 12 Apr 2021 22:28:09 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id o11so7376066qvh.11;
 Mon, 12 Apr 2021 19:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x7IRPUZjaNzkRN+O5MK9Zb81XDytBP70BW5Qu6Pbod4=;
 b=NccNQUSr6fhtm5jWIlJD+EIhH0ddx5JEhDJowi1Z6JGpvp6T9GvTawSH821vt/STYv
 kLGR7ZYAAVHK2Qa1lYGGJSv+skSGfD0qr6sEkAZC+CROqAA9N/LDC7lin5J5coE8/gvq
 hmpjOhNMYEHULMzyvZXAEdC6gCzy9utI5tDcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x7IRPUZjaNzkRN+O5MK9Zb81XDytBP70BW5Qu6Pbod4=;
 b=A+Ce9lVA4XvExRHdOYVkMOKkTwFIOJbNI3hAj6k5JPNyvk3z46ZISx83vW5JuUqMC/
 1q7kRDXA7FxRjRRGGvxWoAVRnunbidElEmBg8sBXbqznLegtzNZ1nnDR1VTUXRbS8G/u
 +leugA1PxE4yyAxlJIB+m0TqIYhOKrIUs+HB4JXD0VHLIAo83h6ddnpDbXVxZRYJK0dz
 zDmVjBi/GMEWzwCkvPYvBbaOT2L2+y5cr/VMxiYwwsLkjl38LQD/L7LGqh/dkzu01j8m
 5QLbb39YxJLaMnJM/EoEXCTZ9M0DwD21XD7VREImb8BBuJUOadv0e7y/5eEu8HtVlg3v
 w6Ig==
X-Gm-Message-State: AOAM53129VbkVNawlIKhCUP5LrbTAS/5ZjjU5IlIDCneqN7uDOeXJ4Ar
 nfjnMZ1wJwOeuSpyIzTraGH5c6AJme647f8SZz4=
X-Received: by 2002:a05:6214:2607:: with SMTP id
 gu7mr30325889qvb.18.1618280885201; 
 Mon, 12 Apr 2021 19:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210304124316.164742-1-joel@jms.id.au>
 <9c004931-648c-3215-6720-647fe35a50c7@kaod.org>
 <66ef55f5-de03-46b1-ada0-089246e0dad1@www.fastmail.com>
In-Reply-To: <66ef55f5-de03-46b1-ada0-089246e0dad1@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Apr 2021 02:27:52 +0000
Message-ID: <CACPK8XdD7xMM-ncxZG7i7QZdpJSvSPVLgSCX+tCgf2g1=Ctx-Q@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Emulate the AST2600A3
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ycK0rkt/e5pP

On Mon, 12 Apr 2021 at 22:57, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Tue, 13 Apr 2021, at 00:57, C=C3=A9dric Le Goater wrote:
> > On 3/4/21 1:43 PM, Joel Stanley wrote:
> > > This is the latest revision of the ASPEED 2600 SoC.
> >
> > Should we change all machines to use the new SoC ?
> >
> > I would prefer if we introduced an "ast2600-a3" Aspeed SoC, that we wou=
ld
> > use for the newer rainier machine, and leave the tacoma-bmc and ast2600=
-evb
> > machines as they are.
>
> I think we just change them all. We're not going to see pre-A3 chips in
> production systems.

We should split this patch into two. The A3 support is not yet present
in any u-boot tree, so it would be premature to update any socs to
emulate the A3. We can expect support in the coming months, and when
that lands we can consider updating.

However filling out some of the clock register reset values is
important for guests to calculate sensible clock rates, so we should
do that now for the A1.

Cheers,

Joel
