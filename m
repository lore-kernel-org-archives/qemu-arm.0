Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4921304lfk;
        Tue, 7 Dec 2021 12:24:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+PtIz0WgSS9MF6riBRk54mpBiCWywaz46XXFaTdjr4knnYUMAwxXFi4n/s5IcktKQ87K4
X-Received: by 2002:a05:6102:a2f:: with SMTP id 15mr49400863vsb.55.1638908690952;
        Tue, 07 Dec 2021 12:24:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638908690; cv=none;
        d=google.com; s=arc-20160816;
        b=IhnYfOnNe8JFKlfS1vFEtoC0lZt39Bm57lGqh3RVxQcNolhY1ADTIwtKdPaIhMj8p0
         zoJJeItSTnecUfQEA3L8qAcCqAL0ubbwrKQZjxUwQCJRCfyGqSQm+A2XtlsJDgYgK/wu
         K1nhVGrm/Hr39dt09/leDhFIYpjnsdGZ+rZvXqBHCZU0h+nZew/PeXpvAo1mnTiY/elb
         pCZdwQfo9tR6FlxaTZpDiIhmSid43uFaYJ/tk8reAI6plJTHitkl8w96D34sZC2LIut7
         GY519wNobjhLcRiucsyaBgacEtIzDIawdtIVtvg8WmMYajsnh96RvH/RW/iW9K2Xs21/
         97fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=he1+55OMQrhPzn/Du0g9rhBuLpjE5wn6quFfOCTwcD0=;
        b=kp6AGca2xC/B2dLV/R5D7CfYwNYwSHcUHGdvnbVCdu0uoeDAe7noGXfB9h55xHdgsJ
         z1EFW8thMOoOZvQtJlD1uWHhQIypnOIELiZzsM55fjrVf0/H9aGlKUhnKGtYXHPr5q/X
         ViN+L6RLrt6grFPYgBzqUS7awe7QiNeEBsLrlgvgS+7fbXMFqaWfAbguxdugruKvd3H0
         cpNBRYWkalTMNN+aTNxECb8nDQR8LBntMM9A1JOcHLMrewQd9Muz45UHarhKcs8hgY2w
         VQJYMZMvLlHiF7LGimVQQfL9gVV77z8GLlBByeSJ3v4JKxdIIrfo/DsIkWYFzgAKh8pR
         1l2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KNQjSbf/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si1190393vsj.418.2021.12.07.12.24.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Dec 2021 12:24:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KNQjSbf/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1muh18-0005GB-BL
	for alex.bennee@linaro.org; Tue, 07 Dec 2021 15:24:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1muh0e-0005Di-Dw
 for qemu-arm@nongnu.org; Tue, 07 Dec 2021 15:24:20 -0500
Received: from [2a00:1450:4864:20::32d] (port=42581
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1muh0d-00071P-1n
 for qemu-arm@nongnu.org; Tue, 07 Dec 2021 15:24:20 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so357180wmd.1
 for <qemu-arm@nongnu.org>; Tue, 07 Dec 2021 12:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=he1+55OMQrhPzn/Du0g9rhBuLpjE5wn6quFfOCTwcD0=;
 b=KNQjSbf/TdPbqMQEq0JvNed7qlINYd9P8mcpAo/fjXBCIXA/bzc000NI9Y8fzR8P2d
 UsJPqUY6fnHE9pebFfnLvZGuBRynz30nkX+4sPm2l0Sup51Bnos+JbCJWpWtTuhpMHda
 V8CAqU6f0oVJN18ir8pOjy6wQQl5X/AZ9t1woQuxpP49oQvtCxKXeaypi13v45ngqaeB
 wi3RN5HrklXeJvb4c7wh/lvbY0Qgs//+b/aWkqz6EU2EqGdi5/vVlWzhcQQsU18CKMy7
 SDjkDNWF1oPBR2z138EY7hprF7dF4zgRK77MFeKve2gKk71u85eN4mOc5doAt+qYNvJf
 RvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=he1+55OMQrhPzn/Du0g9rhBuLpjE5wn6quFfOCTwcD0=;
 b=n7Ie/8ppqeQpdGRMCiVVU0XJRFy4nh5X7JbwKA0OWYdx4CEseof5VwuJ9S+N5IvYne
 EdNvswj3TEc5+XW+G466Gj02PX/MZ45g7VgAnZ8Re2Z3dX8aEdjgVnzwjTia3nmVFrc/
 tL750K9rXxhUN9Cp2beaNMNb1oOrLufNHwo3hszqs/BxdiT8TT72e1uO3fhAlW5u7ZSk
 oetmzNvkhHMxdaTZZ3aFKihr/wDSB9zV8B4ObVYWuzC02L78DSdbYkg1FEC1d+PkiVBb
 5pfD1dVvxrkhm7qB4Cw6Y/3Zdi7bpOo+IHtz0lCWnW+ZG1gZkgvOpt2ydOciHT5g5n3R
 RaiA==
X-Gm-Message-State: AOAM532742BW2uKvVPIbfJmxdQeNOJOQRLH21o6zt15+A/oT31nSIXRu
 imR3xfUntM5rB4zvMQu5z8yPw79fAHr3RTCgdjCnEA==
X-Received: by 2002:a1c:7f43:: with SMTP id a64mr10069090wmd.133.1638908657078; 
 Tue, 07 Dec 2021 12:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
 <CAFEAcA-=8an6Q0ZC2Nx6=VoaB0_rucv+vEGS8Fy+ChMc2zCqHg@mail.gmail.com>
 <SN6PR02MB42054732F8B59940998D01EDB86E9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <CAFEAcA-x_e4NrQziTEpYrTZn7X_enEMjKn0bHEK8uS4ED1vjzw@mail.gmail.com>
 <CAFEAcA_C17byZDDdenOfmD6TU4UuTq=uHfXQxdurppaa18S4mQ@mail.gmail.com>
 <7c9d97ab-1662-106a-5b51-630a4d2375cf@greensocs.com>
In-Reply-To: <7c9d97ab-1662-106a-5b51-630a4d2375cf@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Dec 2021 20:24:06 +0000
Message-ID: <CAFEAcA-29QMZ0CX-irpoa0mpa_WUTBAAYhS9QUhCzBsEiWbYhg@mail.gmail.com>
Subject: Re: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Brian Cain <bcain@quicinc.com>, Sid Manning <sidneym@quicinc.com>,
 Carl van Schaik <cvanscha@qti.qualcomm.com>,
 "shashi.mallela@linaro.org" <shashi.mallela@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mCvFZIK72A4E

On Tue, 7 Dec 2021 at 15:49, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
>
> On 12/7/21 16:45, Peter Maydell wrote:
> > On Tue, 7 Dec 2021 at 15:24, Peter Maydell <peter.maydell@linaro.org> wrote:
> >> The bug is a bug in any case and we'll fix it, it's just a
> >> question of whether it meets the bar to go into 6.2, which is
> >> hopefully going to have its final RC tagged today. If this
> >> patch had arrived a week ago then the bar would have been
> >> lower and it would definitely have gone in. As it is I have
> >> to weigh up the chances of this change causing a regression
> >> for eg KVM running on emulated QEMU.
> >
> > Looking at the KVM source it doesn't ever set the LRENPIE
> > bit (it doesn't even have a #define for it), which both
> > explains why we didn't notice this bug before and also
> > means we can be pretty certain we're not going to cause a
> > regression for KVM at least if we fix it...

> We are perfectly fine with this not going into 6.2.

I thought about it a bit more, and realized that we could
end up giving KVM spurious maintenance interrupts even though
it doesn't set the LRENPIE bit, because the incorrect OR
meant we'd send a maint irq whenever the EOIcount was nonzero.
So we've put this fix in for 6.2.

Thanks for the patch and the discussion.

-- PMM
