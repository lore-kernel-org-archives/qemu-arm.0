Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp792766lfg;
        Thu, 13 May 2021 12:49:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSAooSbIRJh3NKK+ArlNvSZj3/rTI6wZpA0tAgKzqVquuPK77gpTRKHrO8ow7oDFUDdOyk
X-Received: by 2002:a4a:ab83:: with SMTP id m3mr20020242oon.2.1620935387641;
        Thu, 13 May 2021 12:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620935387; cv=none;
        d=google.com; s=arc-20160816;
        b=QN1K+EyztAooWw1UfNlz85wXIe3IB0aE++D69xdXlSXiBhN1xawfQ5oocYeMSE7YVw
         ujO7/W5vmblcBqrZjXR89V1xeYBJzXwaOtAhnRfhbKIaMKoOa3TBAeIwxvhmSrxesuHI
         pXghkKZq7xviYKPpOAToyNWLIWBYcy81sLDTU6zRhhgw+6mQEdg2WTeBNsxfnFaCyzbI
         DIphwAEsvi4DarQPWIgQIVd6NMBQtsqKivscm95MapduUgnmFSh4WFQvqT8vVvLtMDrQ
         pK1besYlUpHGcB2gGl4E0RxtiVq8aqbd6voZgo8BL1zg1iqYe4PltZCOzIIBy7T9SriO
         zLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3MKnanJpetd+bgL1z3iqqnlJuHGJL8SoANkO+db6Jvs=;
        b=BuCb6M7ABTAE/0fxngx5z4/CVWjWe2RazO+5AjRAbVDCgA96ghJQ/yk5U/j31uaWcD
         XJE0G5pg1iM6LNwfM5c49TKHyI2j3C9fhkFAIm4/m0WT54M2Un/U0g/3yDuMpiI31lHX
         psaKuPuMoqJ/6NAFqxd6xXGkKoU4PhaBBRQOufYe+JKv1Uh6HAvTKQ3vafBLDByFaceD
         hLS0wqm6NHpf0dkDvAasQXJCA92gJ1Z4mO6C63SubxUt++wzd2lV4umxPHMcsqc21XLN
         /BMDU6HXaCH6Xcz1smNHVeqiR+w3Tsk/Wd+u2evOY0oGeUqI6Uh2AmeEjli3+X3Jz+JA
         tOtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wbO1Jo16;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l207si4187380oig.171.2021.05.13.12.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 12:49:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wbO1Jo16;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhHL8-0005Eq-SQ
	for alex.bennee@linaro.org; Thu, 13 May 2021 15:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhHKw-0005Dr-Ag
 for qemu-arm@nongnu.org; Thu, 13 May 2021 15:49:37 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhHKu-0005UB-91
 for qemu-arm@nongnu.org; Thu, 13 May 2021 15:49:34 -0400
Received: by mail-ed1-x531.google.com with SMTP id a25so8129865edr.12
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 12:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3MKnanJpetd+bgL1z3iqqnlJuHGJL8SoANkO+db6Jvs=;
 b=wbO1Jo16KU07q65HDdBNvrqsCDHrqSbHO7gpIUwl3rhpX9x3VmOwSRA/1KbJu9v7XJ
 eMDUrTYxCodSTrH/S21yMblU/hQAHgRir4uRlNKHobtSc8wjhQpROx1XTeLdlLNMSoor
 GB1qRL3CDCsemvjYHLHCZKNMQhKXKMiAFwX1Au0cOGn4Yx53SSyWTuOSbGfLZNJG7Qud
 c3aW/h5axJX5iNNHiLI9J0Dqb3DazCbIasD1ymWdxLRQq4rItRYDwqpIgOIomJg1/sP/
 Q90954stcBL1tNqMAS3rts1Ug4M44HZ0GdlBmC7N3FD+/j9qzFwa29VOpGeFzIim/r3n
 8E7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3MKnanJpetd+bgL1z3iqqnlJuHGJL8SoANkO+db6Jvs=;
 b=Cgrm6fk5WdP99ZBOQY7Q6xYPH339t7u266OaoHtljHWbIUHyMFmvXXop0yg5PFYA8S
 iKsTvl+OWU9PRNzlL9Gr3NCxchK2jqTsucbZ9vGJv7wjsysiOaNX8TmPzcz4uSIuXHBC
 hIYfp/e0iqEHEW75rgqjex9x1jfBbZwyag4BclHt76VOBVrgoUMlkkC4PLUNENecCZSC
 PBLiwf2Va02DfSDKF169injh63h4DXJV6Tow3MFLqm2KEkxUhpCHUngQ20ToIuuC28tJ
 QJMOqrVSdQVom831d2vLpVkZLqxxL3jIwJUMzyFRCwhFnSDoHZi4ebYguHRmFcku0fW/
 Jj9Q==
X-Gm-Message-State: AOAM533OpiWsjoqIZcS4PVYBZwCK6udW/L0FtWbFbKYPwnkPIfiw2mMv
 uemx55WgnW3y4huEip/iZnxfIDZBQUbfTcn+hfkP0w==
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr51648256edt.36.1620935370374; 
 Thu, 13 May 2021 12:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-81-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-81-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 20:49:18 +0100
Message-ID: <CAFEAcA-V+dnrcrnhOLm4ggNajvfKA4CwYLvbML2tXW2mjQJ1mw@mail.gmail.com>
Subject: Re: [PATCH v6 80/82] target/arm: Implement integer matrix multiply
 accumulate
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 91A16p/kFvnl

On Fri, 30 Apr 2021 at 22:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is {S,U,US}MMLA for both AArch64 AdvSIMD and SVE,
> and V{S,U,US}MMLA.S8 for AArch32 NEON.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h           |  7 ++++
>  target/arm/neon-shared.decode |  7 ++++
>  target/arm/sve.decode         |  6 +++
>  target/arm/translate-a64.c    | 18 ++++++++
>  target/arm/translate-neon.c   | 27 ++++++++++++
>  target/arm/translate-sve.c    | 27 ++++++++++++
>  target/arm/vec_helper.c       | 77 +++++++++++++++++++++++++++++++++++
>  7 files changed, 169 insertions(+)

I have to say the decode parts for SVE and A32 (using decodetree
were much easier to review than the A64 part...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
