Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1808999lfc;
        Tue, 3 Dec 2019 09:18:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqzu0x5gUBX98fIzmTh9cuA3IK0VGwj8HknQyO+29PQ7KHFneIKGdt0XUwdo2s74awCATifm
X-Received: by 2002:adf:c50a:: with SMTP id q10mr6669366wrf.374.1575393520029;
        Tue, 03 Dec 2019 09:18:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575393520; cv=none;
        d=google.com; s=arc-20160816;
        b=KJo7tq90313RyZ+EufoHn3AgH1I7/BrJb332NMHpbUYfYVFVJcqAhZkovQ+ALkNNb6
         YFYfI9xr34jGP2WWTXQ2IJX7LUyug7+UqWHa8Q9Qn1KvjziXeVv5X8vNzXy2NIhN9w9f
         Z5uUsCyEOe059O1jeArc+FsWUlcLtrgdb8IhGI4lucUYWBcR+T4F1jDBeBd90Uw3/gMT
         RWyLB/OKCSu+KuNLpAaXo0J6inEygVlpogvWgcn7pRZaw9lD6NcyS6ZZuUcroH6LSpqH
         Hk2885k+34IB5O8EjhgtsQmJQVew1a3k0RtrW52XMBfHX/WtMNM4SeDqYZSX4BPR3A0R
         ssMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+OMYhskkZ9V6o9Mq+CP1YBBMIFI1DP97rUoerzwObPY=;
        b=kcUY5Z3VbCLx9qfw5KpLdfpW6RygY0MaBQeC2xizTpIB/B93Zmh96P9+6HMesXCKDv
         FpwQWU0XS+dWjIFCJrxPx7qvxMHm03CzOK/L3TnmAdE5VCgYQ56mahGsfmoqfuG6ZKWm
         t5F1VKjb00af3jLPAJYygJjA2r7qJkguWgFQDrB1oMuenK7rrWFHbt7z2zutvLmageJL
         zz4b9KN+TkADh9px1BrNYiGHcW6r+LitpBW3BMZ7cI/rfMiQ8d+C0gUuuc7iPn7v2C72
         8eqIgZTs1evbwL4NWzsSqMw5Mk3DZR9XxEG0OUI+BUUe1RKWilB2mCuR0x6jGIGrTD/I
         vhhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oRH4s+ib;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i26si2500770ejh.159.2019.12.03.09.18.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 09:18:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oRH4s+ib;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icBor-0006E1-Bn
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 12:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44389)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1icB0r-0003z1-2V
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 11:26:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1icB0n-0003gS-P2
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 11:26:55 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44521)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1icB0k-0003cl-Pj
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 11:26:51 -0500
Received: by mail-ot1-x342.google.com with SMTP id x3so3397428oto.11
 for <qemu-devel@nongnu.org>; Tue, 03 Dec 2019 08:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+OMYhskkZ9V6o9Mq+CP1YBBMIFI1DP97rUoerzwObPY=;
 b=oRH4s+ibQPvdpaRHlFJeMZYoAtAD0r6gPcKQdPyWGcjl39aOLnq4VL6lXEPxMZZ+ak
 OmdygDpmwCBQQZyBLiWAj7x5oTpzQtnl99eqfLcI3lHrcZZGesv6UG7jPCAsDn1hN2OC
 FQiLMDQUyNEgJoy6ACwYVHzeHdfMXhlkJb1Nm0T13Dwua3K5u7v3zovHO4fwPXiwmjal
 ZQdu8Hy4gmgQ8+wZw4nzFzeJSNq4I2HsD0wAcmfgh70xZOInRvhdEYS6qs0viwsIxssq
 Y6gSlo9YGP2VbN3vCin0gber5UTU4PaeYaJCv5JghGalTkkJ6PMlK9PfguarybQF9XSd
 8LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+OMYhskkZ9V6o9Mq+CP1YBBMIFI1DP97rUoerzwObPY=;
 b=c2k3mcQ3pc0uLuTJl908oAK9qqpaBvhOMvJILyBxPJZoJuhHe7YX0ajHJJ1Tx6djUm
 SfApnroaxhFG9KqcEozWJUNNrb0HczuX1nDhoPd18OvgqfVm8FnXMY6B2HFrpr+BQDn9
 Rvf/Xiy/tCSnP8tmBfCEaJPd4ZVFxsJnM2X6daJghx8qt3ZxfhekfcyOkxTOtDl+ykQr
 1Sv8eBjTnBR7tjiP0KA+KBtFnD4VjiwrVfEZhpphvqNXrQoUIP6HWy/unsGGVaSzjUl2
 ToVaMXOzNqF9GMVvSMz6Qcvp16t/SIHnSstS4NIgbd82MahR6Gi7FLxjITLWcs9Und1J
 HvBQ==
X-Gm-Message-State: APjAAAXgqHexxl0lRRstdkO6+NM39XH+TS26QkS4UjMFKuKHfiy+prt0
 AMrJVWky8FQxGZH+UJZTJt9p/ZC/vZRuYA2Vbk+anA==
X-Received: by 2002:a05:6830:2001:: with SMTP id
 e1mr3484930otp.97.1575390406703; 
 Tue, 03 Dec 2019 08:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-5-richard.henderson@linaro.org>
 <CAFEAcA_WOMbFzFQghakLxxuCTc2b3p6eb18nS5KSrSj+oW-Ckg@mail.gmail.com>
 <5fb06e8a-3cc6-072e-a906-0c83fd2d107c@linaro.org>
In-Reply-To: <5fb06e8a-3cc6-072e-a906-0c83fd2d107c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Dec 2019 16:26:35 +0000
Message-ID: <CAFEAcA9DyGaxQMEk7v-4uK02EBU2NnDM3UGYtvaN_PHDOUQUcw@mail.gmail.com>
Subject: Re: [PATCH v5 04/22] target/arm: Add helper_mte_check{1,2,3}
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9VBFbx8/G6IG

On Tue, 3 Dec 2019 at 16:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 12/3/19 1:42 PM, Peter Maydell wrote:
> > This reads a bit oddly, because (in the final version of the spec)
> > physical and logical tags are identical (AArch64.PhysicalTag()
> > just returns bits [59:56] of the vaddr).
>
> I missed that change between draft and final.
>
> Wow, that's really annoying.  If they were going to drop physical vs logical
> tags, why did they keep the language?

It leaves space for a potential future architecture making
the mapping something other than 1:1.

> Is this really intentional?

Yes.

thanks
-- PMM
