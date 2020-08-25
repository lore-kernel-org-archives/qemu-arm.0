Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp30018lfc;
        Tue, 25 Aug 2020 10:12:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMMpsqrV5+TZN6jfb3h5eVdon8b57vI4fpXMziHeKP4ZrPrqfaRABJsl37V9Qe2Qq9feEs
X-Received: by 2002:a05:6102:674:: with SMTP id z20mr1919382vsf.222.1598375534501;
        Tue, 25 Aug 2020 10:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598375534; cv=none;
        d=google.com; s=arc-20160816;
        b=WoL8byzL6Z/UXXyRgGiGKcj9Xxg4Nh+5+4c55sdeR2RUdXHjPMZcltqCxYtX5Ou+Gc
         9E8dDL75Y6o8KPm3PsONoqEU90KVGnRXeY1YGASt2DV/a5/Bim2lCr9pzzYEiaetI83C
         q64zljjaRcrhi8m4axhe1UsoDjrlsr/DoEBNbuc1JYZvo4AyTKcrsft7+tw0EtfYnhOW
         GhLRu5b/8Z+MEtte2BJffLR9NeUSKB6s+PqLT9CnZZe9auoXExpYxrc5G7riKa3znQE/
         TWDdr6DIX8dqROX4QslPwBAAMti64YOv/hgoj/dAlOglOna8zecM+uuuDwFAYkymHbRP
         EaRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NA76D8EjdYf76x8D+LlghBmQPVgl76zZ4X33kokBudQ=;
        b=oSqDBRjvYrx2JxaR4qGTNNPlKy2zBcflU/858pUKyTqV5F9uimnC8AfM4SK35ZlPyy
         R+guTpME9WAtc6J844yIAMmpvzqlPF1tJEHn7D304YuxPV4izj224lQ4cHiq9+lEEkfa
         b2B7SAwNEEAllXP1XtjGn93m1ig/hv8PPFJhVYAodrXq2CMuZoVTcKEsUh8cM0V/Irr9
         LM7zcoc2JN8mzil+9m1u9tetlr/uBRDLeaCFTMWsvpqhkN1pdXj/ZFLjr1/+XfSuda43
         CwY2ocPJs82dKSC+d4YnAwB3FCUUJCBQA0jpg0Xo8tQkgzYbGo5MYONp5b1sKzV956nX
         h54A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oV4SPqB/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w20si2348228vkm.69.2020.08.25.10.12.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 10:12:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oV4SPqB/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAcUX-0000wf-Sg
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 13:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAcUR-0000wU-FS
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 13:12:07 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAcUP-00062C-I9
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 13:12:06 -0400
Received: by mail-ej1-x62c.google.com with SMTP id bo3so17541108ejb.11
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 10:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NA76D8EjdYf76x8D+LlghBmQPVgl76zZ4X33kokBudQ=;
 b=oV4SPqB/UVNXecqXHBwef/c06Y28LWP21fBYNUwQ4n24gLsGlz4mHjQz0+j7C+ubWx
 326PXMvQFtwHkB+IwwNcUTOlcIUDpeFk8jrFsbKZcNKC8fJak2/U5QgTZle0mxs9gSqL
 ve+E+ByD6hAbNJfQNEwTRfe6YS+0ABFY8tEpeBGXtdptjcJr4vNWUunMUQ8s5yfjIEBZ
 iqssd+1ApspEgH+Wi9p3ZW38bNvTV8sEoyqrIGYL5gC3xcSiU/vANAkvkYwgBHGhVPVM
 XE4q5K4mOvdGKDfz96D3AM+KMo7RuqpDvi0ryRWCiadIvIzKhpcvDsvgCOkunPzlnooi
 uitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NA76D8EjdYf76x8D+LlghBmQPVgl76zZ4X33kokBudQ=;
 b=WS+bRMAFEqaXSCg/Loc52Lz+ZiYvFZ9tj7bOOJ63QBrNOfvUaVpYOsMy4341JL5Fl/
 OLatdMch0gaITRmzWwGQLRDbelRiBpFKhpvwrlJPOPp2mo4JTYmuPqXKXaxPI2OlGf53
 B1XDtJWzuMeu/rnMLOc+7blcr3I9vfu66XQfQheu5o9q1PszUZNaTNdn5t0p8wKLRuwn
 HCmIuNrMZmXcpnlSXeD/RUrQ2DEzNxaEDuetAtHLmZsj92D4tXfUeruHG5WLHpaptE8v
 vpbiaZoo3XnMtnr/jo6Na1Ph9Z1jHUCzgWdhZQ3wiQhHv3EGjrnT0kPigYziRGRgATHW
 4bVg==
X-Gm-Message-State: AOAM533amSp/jASc9EJgyP1t5uXhEARCUsbvq2kPnDgO7lG7ogV8fMdr
 bhNhFn5fijVypu4Su0t8Wsbd6Vvu6nuAqJf34JVBiw==
X-Received: by 2002:a17:907:2066:: with SMTP id
 qp6mr2525452ejb.85.1598375523550; 
 Tue, 25 Aug 2020 10:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <554074341.6540650.1598262327794.ref@mail.yahoo.com>
 <554074341.6540650.1598262327794@mail.yahoo.com>
 <CAFEAcA_5a7aGpGMtVxjYjVnnDJNzXkQJwDW-846+TeNjTrAs_g@mail.gmail.com>
 <316503436.6530715.1598263341117@mail.yahoo.com>
 <CAFEAcA_3yUToiV_iXERz4MMtrQFwmmBzRMZ4KzttA0pS9srvVA@mail.gmail.com>
 <887324818.3432504.1598372627788@mail.yahoo.com>
In-Reply-To: <887324818.3432504.1598372627788@mail.yahoo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 18:11:52 +0100
Message-ID: <CAFEAcA-w85dBDPKUrH0ykTO5pBv8=t7LoAccig6QR=6atJmr5A@mail.gmail.com>
Subject: Re: [QEMU]send key event from monitor
To: Mircea Cociuba <cociuba_mircea@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HvozDwDqW7Um

On Tue, 25 Aug 2020 at 17:23, Mircea Cociuba <cociuba_mircea@yahoo.com> wrote:
> What command must I specify to qemu to link the devices UART to a TCP chardev?(windows user here, I have to use windows)
>
> Current command for starting qemu:
> qemu-system-arm -M lm3s6965evb -m 8K -nographic -kernel notmain.bin

Add
  -serial tcp::4444,server

and QEMU should wait for you to connect to TCP port 4444 before
it starts. (Add ",nowait" if you'd rather it started without
waiting.)

thanks
-- PMM
