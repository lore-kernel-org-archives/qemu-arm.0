Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp317217lfo;
        Thu, 28 Jan 2021 07:28:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJJy+MzxMhzOvaVek1VYpBujAMOovuPR92GOXcGX9YemKwr7n+F8r1+e+aDHppOmfTk/sm
X-Received: by 2002:a25:6ec3:: with SMTP id j186mr24818368ybc.335.1611847718294;
        Thu, 28 Jan 2021 07:28:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611847718; cv=none;
        d=google.com; s=arc-20160816;
        b=zJXSDje0IfXJz9HGfXarySTdHOtwE6jYEGpPVH5w8Xfx2YSPkB9RdLrfaiethcY9/A
         FH0fzGo1k4GI/XS49Bkz5QMIlWPfnM1jvOfyyWeF/t9+18SZCjUadj9dPgVIHOsj6vuK
         NJVkQgegEA46TSYoY/YhBmr6Cc0VJEblYLEwyKISUgIcq5dAqT7Jli6JaWI4yC3ZlZ/Y
         /p+cyme8H7o8cH40iBgbeq5JSUX58FmowE284n1axtCpo28TC0QQKIZ3ko4syea7Txt+
         Zlf42tCBjZwzRG3QzNYtKLStx7HdHbQ/Q3WtcN4p9v/r2rcY3AAx2yyvUud1mpMyyES5
         hlmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FW8IrmaDYnWKdgHUXE+sN4Ii+nBJ56wUbQ4Ky9VXiQ0=;
        b=iorb6HxPsOjlWqdWqoL8bVKEl1tYGujuwzzl5bthl/e+tWNlMxSxgA9xnLfuC8lWjd
         qo7Dsvk4oWZLX2ZJkf0GVWUab87NwNo4HWb7Pcx4TO/uOCxrKOXba4k6gq7sKSEuPmjS
         miQlfFrmD8BKmyw+0sfNEDRVNVUdmBzY9mQCQogwtE8NcFsnZzIyEI1ezAHBk+XJYPRG
         lebMXhnqOskjBaZcSQFnKup+pLe07Yo7vs5dC36NtlVMpS9yyPMXFdfjzxwawlklZCxd
         zsIo6qPRrl0+KW54d3ITvhTqymnpHfuRmmgrTXqfz+AJaMJWqRB+GCFoy7SWf/MzHOW8
         qvfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lDPS3YDb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k74si5846774ybf.360.2021.01.28.07.28.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 07:28:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lDPS3YDb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l59Dp-0003ek-Mw
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 10:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l59Dg-0003eH-I9
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 10:28:28 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l59Df-0007Q8-3e
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 10:28:28 -0500
Received: by mail-ed1-x52a.google.com with SMTP id z22so7060191edb.9
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 07:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FW8IrmaDYnWKdgHUXE+sN4Ii+nBJ56wUbQ4Ky9VXiQ0=;
 b=lDPS3YDbrJYkyQx+5k2w6iVRdRqsFjM+OSB0/fsWeIHwtmEwEnAPohHDlauqMf6n57
 9diZ/RRoIspYJg4cXbd88cwJHltkqZ84k4aIkb7hDfxa/tBAo4KMZ/iXpeXhntzH8Ib7
 f+tIyW2vwZVHk0Kb4Vvvl9tbclrxISZRhlsNw9AtAFyamH4fhc/d1ykEvA6f9MklszyH
 gNlnWsrBVa7iWg4AGsXzZpM4awpBUnWcqRgr7GC5GN/oH95KUsYaIJ7KW6AVIK93YuEu
 n7KgOSMZJQ+SfE3kZWg/3sOfUAjq5vcSAzk6OaezcQuCPMGVEq0VxSM3iPafzQ8QQdqc
 RT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FW8IrmaDYnWKdgHUXE+sN4Ii+nBJ56wUbQ4Ky9VXiQ0=;
 b=Q/3MH3zZWIGZAMkB0s5SZe1doPnsrhmfs7DRJyPNs0lSrJroE6X44IFyBh0EQ3JrJ8
 YMn8Zqyg96ExP5bTEV0KAO5unWPnX68n/dNdrNrb/99K0kbfDcjc3uoLEXaaD9q3XwKv
 Z0yVQKyaC+S0DTyQKvkICGEZAirCGh1ylWe6mgCZsgCD7YBcfgB5Y2qLhTSOAlU51G52
 +cREz/T1SMl7dngrHaiVSYR1F3F00MQxbBvNMx+LGkhkFHZcCMotE714OYmt2QwO/maH
 H6DRiKq4J8pRq+UOFL4Di3cD6r9dR9GLh0K2JBPF2js8WeIV0ygG+fSlRtxrzVVUN02W
 k8ww==
X-Gm-Message-State: AOAM533CuVFcpL7htc3GcRqaWkBnKyAf0lDM0jKOywjW1BINMk44g7fi
 raLoAcxxCeeojCNGg8Pvh7+GhWLKpqotkixT0YHsww==
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr54516eds.204.1611847705567;
 Thu, 28 Jan 2021 07:28:25 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-7-agraf@csgraf.de>
In-Reply-To: <20210120224444.71840-7-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 15:28:13 +0000
Message-ID: <CAFEAcA8Tm2d+Wmd0X7RddfBHPez_Tjk71YFgXNOo2gycxq32JQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/11] hvf: Simplify post reset/init/loadvm hooks
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RS1C7bUPP1bN

On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>
> The hooks we have that call us after reset, init and loadvm really all
> just want to say "The reference of all register state is in the QEMU
> vcpu struct, please push it".
>
> We already have a working pushing mechanism though called cpu->vcpu_dirty,
> so we can just reuse that for all of the above, syncing state properly the
> next time we actually execute a vCPU.
>
> This fixes PSCI resets on ARM, as they modify CPU state even after the
> post init call has completed, but before we execute the vCPU again.
>
> To also make the scheme work for x86, we have to make sure we don't
> move stale eflags into our env when the vcpu state is dirty.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>

What's the difference between HVF and KVM that means this code
doesn't have the same structure the KVM code does here?

thanks
-- PMM
