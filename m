Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp171008lff;
        Mon, 9 Aug 2021 02:25:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwd1NtB1gWK99LYe7PwqMgCseC2yjRFuoxGHjPGMB5gK7UdboYKBSSUP8C+B6kRdLFwzqVb
X-Received: by 2002:a25:694a:: with SMTP id e71mr21642575ybc.114.1628501100829;
        Mon, 09 Aug 2021 02:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628501100; cv=none;
        d=google.com; s=arc-20160816;
        b=W6lEuBSV9a0XljSI3rcSAffgxfVqseJyNI/MGCYKKtGfaaGGflBnR6j8Q77PZez/I3
         UeGe2BhEZaXKLtzosFrE9RmffLkGMh2O3ZAtZ33h5lf4wABJNeQLvSHKOJAI59JAu52j
         PwVZdBBq7rimdVrQGHLB7cfcIxAGNY3IGs3yqPuFYr/zcbbP0el9epw79+FcMkrnhQ9E
         lTCvsnp5mTOB4EU+2RG0AgqNXZqfbMkOQUSrLiWUB3N7Nu1yPQ93GVJgzLr5SCvljF+S
         IzLrLkBaSMNHGYt4Xs+sUF39YvMD33sH/m5nFI0n6r2mlrEdJi4zguc0DfZzI7bskd7l
         0ujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zc9LsCX3eHrN5oT51AgJ576zFqbHehbvKRXwn5MJQs4=;
        b=Wb04EH+Lg/6bT+/wc632bLOfHEpOFX0QiFTKZuTcP7LRuNZLkF6TkvHl33q2YoSc7u
         Jo/IaJr/EqJUBGu7uTnyxXm/Z2YlfzB8mgHgGAJ3+GtoOoypGVcWkngJyMzkfBjI0I5q
         EdOOTaLv2JxIFW9UcSoUmInoyaKxgzhJXvtSRn0i07p3f2bIKCRadvM8QdW1nhEh5K86
         a57LY2FhQkDGl+JyvUKwgnYe4ScDbGVSy61S2gjyKGUh4Sv7WeQaEy3pYaneZc7QjRt9
         2RfxVG1ZnOrOKx8dZL9Ff7/o8I0GMpeJ3CgO+vuQSB4Pz6J9JqF3SskxGsrmcaQ033ym
         EfLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="y1B/rG5p";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si6527692ybs.241.2021.08.09.02.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Aug 2021 02:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="y1B/rG5p";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mD1Wm-0003uQ-79
	for alex.bennee@linaro.org; Mon, 09 Aug 2021 05:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD1Wd-0003tG-K3
 for qemu-arm@nongnu.org; Mon, 09 Aug 2021 05:24:51 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mD1Wc-0001D7-2a
 for qemu-arm@nongnu.org; Mon, 09 Aug 2021 05:24:51 -0400
Received: by mail-ej1-x62d.google.com with SMTP id oz16so11589545ejc.7
 for <qemu-arm@nongnu.org>; Mon, 09 Aug 2021 02:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zc9LsCX3eHrN5oT51AgJ576zFqbHehbvKRXwn5MJQs4=;
 b=y1B/rG5pN2hmtC0mUGFn2ckXQZ722GXVFvW4vvOVxusZ1aqEfeyQdPuhJjZhq1hipT
 2OqN6GRbrUWrb8R+UIvduJY1BIFzwwYPxlTPHWOqgb6CNmcEKG0PdJKYZOOUI2TQ1YFR
 HmnzHFm3jyNMqsXIB5PM/pV11llC3cw+biKhyNlZIzb8k0BeXz7oM9PTwFYNWdurCRwA
 a99IB0k6SOJ0e+x8czJj9AZ0lIwV0ly4xOyhupiW/TZ5fiyoRJcuHIRWmTzNvjUiC3Dn
 4A50k6ucfIaEGUXn74WaudSygtZ4NAlA2MOWQRJcTXXaKF8e57jOnhVR0C6vpDX3xmWN
 rDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zc9LsCX3eHrN5oT51AgJ576zFqbHehbvKRXwn5MJQs4=;
 b=B8LVo97Z0IBCULgjg29ZBq0Dr/DImK05hIciDvzOYKN98ArmxNFKrZue9S2yIv/+8N
 tsc5L0JKdU/v44jzgIbSgwv/uScu7BJG9GewENmUCAXTGNfd08xMEjwOl+LzPpvlDvKS
 TsGJq0WGgeHtVK3Hh9HtleAcvuug+Ronr6vHWI9kJkmPNbNzH8UBcQEM8AD2igFoVWRm
 3VXhLa+NP5Isrkx0C9CDiLM44V0IPtgjZbZvb5FHzwAsDxCHJtghoeA81vrIh9YRyX9s
 4bVsR/hmIPhNf9Ohw2RAvR6nTXtwPqjypTxmGhORUE5Q2vYp6lL1eBkc5UG15+mVF8rw
 eRrg==
X-Gm-Message-State: AOAM532KclX2LgJriTPVRudY1KqLhzlzWXHbujEiYbSJEbAOZLuKEEEy
 P3eyE2ZJoDJN3y5ntUFzJ44mE9hA5l5vFnnleaGv0Q==
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr22229847ejz.250.1628501087931; 
 Mon, 09 Aug 2021 02:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
 <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
In-Reply-To: <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Aug 2021 10:24:03 +0100
Message-ID: <CAFEAcA9Qn+PMGWRLtBdPXWpzz=JzoNc+XiaEpPXGv4Wb+YX3=A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiang Liu <cyruscyliu@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Bandan Das <bsd@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xuNJL3j0wsuz

On Fri, 6 Aug 2021 at 15:43, Alexander Bulekov <alxndr@bu.edu> wrote:
> As a side note(not strictly related to this fix) should we continue
> joining reproducer patches with the fixes? In order to test the
> reproducer, you need to cleave the fix off the patch. At the same time
> we don't want to mess up bisection, so does it make sense to have the
> reproducer patch be separate but come last in the series?

My preference is for the test case as a separate patch, last
in the series. For this kind of minor easy-to-review fix it
matters less, but sometimes the right fix for a problem might
be larger or more complicated, and then having the test case
in the same patch makes that patch awkwardly large.

Also the person able to review the code change and the person
able to review the test case might not be the same...

thanks
-- PMM
