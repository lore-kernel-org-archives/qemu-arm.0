Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11631286wrv;
        Fri, 26 Jul 2019 01:48:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzu+ntDavLOE6QHFr6GlJd7sbIfBR9Qf29BZGU0w0p04bOYM4khlmWaHJ1wQ0V5DrDjKb0B
X-Received: by 2002:ac8:ce:: with SMTP id d14mr65498119qtg.149.1564130882767;
        Fri, 26 Jul 2019 01:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564130882; cv=none;
        d=google.com; s=arc-20160816;
        b=pNQJc0/9IMqYH0nsl++1yNiBJxRHECiS9mdH4c3iqjyXaYktCtVwcaqAw33aYEfb1X
         8xy9zTXiUhKz40Fgd/0Xlk+3uf/J2u2tcCfzyQs9X687rSNkHCz4j4aYQeQI5UADQlRO
         uOO8xktdbZoIwkcfjgfwY2g0DAM+E3MEnd64dOLmX/deY8+cQWHHxnpMTYhSeA2UDWMS
         Ox+EfcI8E9IYSaxa8LJh9z/kfL3+94KErat8tkQQFpSr84iMQexBeaxx0ZWOTofPgwLp
         6+nho7sNbIZp7kYvWF2mqCcveNgbTS1EjpgxkDUbuvYmu9hrnR2Y6EHubPmyRHyQW7Kr
         gXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gtdn1fD4cI8QtI0wMIK5kEuem9S+JqfXC8U4yoaa6FU=;
        b=UqhT7nxEshfnWyWRwonEtHygwEbV3wkYMt6PbPjYzc/zY/T6EcjZUf6HwRQnEmx2u3
         4Yrk2yT1NzyLddVkuNBib26wRBG7L76wh4PVX5lyOgCLcwX0oLrOATEAG23chyYXud+E
         wHgGeCV0F/EVI5EI2qBVRQVabnV/h3cRU2aSyeBeruxzrHrSVShQ8K44pfAHpvq1yMg3
         MV6QlSj+VBlRPNiLC/cfGckgr9PQGNi2cuwZ8rgpJaXT9vh3QZzjZ4BN+bPkv5S/OEMr
         rMTxXbyNaXwebJm+LRH7wn445kapPNFSm6ec10INf6BSFG7+hH5ptR8Ni8NqiC1Gs4yd
         IlOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ox70SePT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17si11905127qtk.203.2019.07.26.01.48.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 01:48:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ox70SePT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqvtQ-0003eG-3q
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 04:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35453)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqvtI-0003PD-QW
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 04:47:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqvtG-0002WO-QF
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 04:47:51 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36694)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqvtD-00026H-JR
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 04:47:50 -0400
Received: by mail-ot1-x342.google.com with SMTP id r6so54599603oti.3
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 01:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gtdn1fD4cI8QtI0wMIK5kEuem9S+JqfXC8U4yoaa6FU=;
 b=Ox70SePTCu4wm3EzTY5qI7jt8yBvG8I6awGHhs1WXyxvUXQvGZK4kcPmG2byTe7od5
 xrvRvSmAKksH66BkTMrcSmlHPZH7B9kHqSD1ndMvqxjFnuR+GQE1u9ysG6eZliOpDCwi
 6l/swi6qxQsn7LMO3vFDePlc97K0E/aWjb3aTYmBEASsMd/h4ng7ZZ/OmNGWbQtHlc5V
 NXKmPuEv19c3pwhlD8tMjUZMnGIMi4rIm/UiChAKXUUTQkrwK/m0eqZfyjJZuMoBClEV
 KvGjfvjKsj1j0R47QMqSzkGHdmCq8IvaPJQuwOPwpS+MhbylQpk6ybTjnLIRLamIeF7Y
 +00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gtdn1fD4cI8QtI0wMIK5kEuem9S+JqfXC8U4yoaa6FU=;
 b=KkINtoGUPQF/78h2G5MR2g71KCtwrz9WsN5FCfC3YeMFAcJuNEuWeRCpNrsE9qvyWA
 2xz5L4mpELU6ggC4VhF76BJjWXneiZFKwWJhZMuSlnrDt+sadkeOwS8rPt248Lnvt0tu
 juMwYUV6LvdnWP7EnDJaSOtu5f/b8gQGWJczet9ih1gTplc0TT032zko8yqVsIEolgrQ
 4e0D2h5z9wLTdKXEBC/UnxyoEDiJPjvrZEzeWYfGqyf4RXPt+kRcehvTYd67eo8Y0V0R
 rYbq6fWLPQv2ndR1JahzW0jZ0R3zI3YZb5aqSX6764aOHuGp2f89NrA5t1ypGJhNJEN5
 qqiA==
X-Gm-Message-State: APjAAAVv31X5fgqTzx97zjaX4Xe8Cg6JIItU4/OLtd4pC6UsH6JHZh0A
 ZIkEb/61oC7RZXX7PY6HiqGZjdnzGrCLt+ChYYtEGw==
X-Received: by 2002:a05:6830:1653:: with SMTP id
 h19mr13801663otr.232.1564130851631; 
 Fri, 26 Jul 2019 01:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-2-peter.maydell@linaro.org>
 <20190725170228.GL2656@work-vm>
 <CAFEAcA9RQBz=t8F_nOTH9FZu_jKD0XVMJtPwmdnJBfnFR4G9oA@mail.gmail.com>
 <9631a4e2-80da-9369-038a-45f3b0399bc4@greensocs.com>
In-Reply-To: <9631a4e2-80da-9369-038a-45f3b0399bc4@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 09:47:20 +0100
Message-ID: <CAFEAcA-qv5NF+bOyiQ42+7=BHZnfkXn-tq8V=ao58uXTapooZA@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-4.1? 1/2] stellaris_input:
 Fix vmstate description of buttons field
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tWZuflHjA90N

On Fri, 26 Jul 2019 at 09:25, Damien Hedde <damien.hedde@greensocs.com> wrote:
> On 7/25/19 7:59 PM, Peter Maydell wrote:
> > As an aside, I'm surprised also the macro doesn't complain
> > that we said the num_buttons field is int32 but it's really "int"...
> > arguably a different kind of missing type check.
>
> We would need to compile on a host with int size not being 32bit to
> catch this kind of problem I think.

I was under the impression we did catch attempts to use "int" with the
VMSTATE_INT32() macro, but we do apply the type-checking magic to
the 'value' fields in the VARRAY macros, so I guess I'm misremembering.

thanks
-- PMM
