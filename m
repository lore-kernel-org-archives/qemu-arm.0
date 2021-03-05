Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp213042lfg;
        Fri, 5 Mar 2021 02:23:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRuUwZPSUhIFR4xjd0+euyQ7An7vz6jcPFUyN4H+BrnhTnOq66PkjFeUUSN0r9tPVYaH8r
X-Received: by 2002:a92:de0c:: with SMTP id x12mr8074445ilm.62.1614939818027;
        Fri, 05 Mar 2021 02:23:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614939818; cv=none;
        d=google.com; s=arc-20160816;
        b=e1pawGlUHWQ2Besd6dErGpbaYOzrrTs+XS6RVuz3dbpzvEzOzR5Heuazi+8rN5vtwt
         lvO1lMwYYSbL5Uzid+1DH1Wd9zRfZU1lTj+NFCZkOYc6AuabJ2QGp9XvfJLuCSBUGtga
         mecXHlHwsM9Oo+m2ZgZDam7FqzUUQyKj9Qt+45ZYFouOv3xf6iCe/UufrOfKugPAfGbi
         6N40whelBbI5Y+WWHzgtc3MHFcVORgBOl1/kD3g4DeWqrFdzHAx/H62TDzUsQfPy8MrK
         eLHkVoWT6l7EFQObFQ5gEx3wUY4jL+TuWJwSF9PXMnm/Vz/d9H+Emln++Hzofjn9Ib+J
         rI+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6VCuuBtbuc8EStm0rgjyCLYmu6kKh/SbbcBZq5BmvOI=;
        b=Ni54TS7tNA88lKuG5V7vXMmj/c/skBsi0GZmu/cxyyQzkciyq4ahh3PSG/81VPnOEz
         +0qrlXfU1JT8BeMao6CL8tQs9OQ2gkk+4M1zH4xRseUVsyTAV8nqxaU6JaU6XfVn00W4
         72C/xdjo/4r0GywWA7yyXPdNBFb/VoNOh/MIH0R8qzgc+jDq3RL7xTjjy0Tmzo9Mjd3M
         4iD3knSEHKy0UU4oqax6zPV1p7KmPWEIAsOv1jPD00rORCaQFgExgmHWjNPNTiQN6/Rd
         StpES03q5+i0nArHUXQ+5+VRAJTBDIC4PVPnl+/aLy5qbN9PMHn9cn4p1w1muBUJBq/8
         AY5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y+BEdgaC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x10si2004130ion.14.2021.03.05.02.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 02:23:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y+BEdgaC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lI7cP-00046K-0Q
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 05:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI7c7-000427-00
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 05:23:19 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lI7c4-0002xe-2X
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 05:23:18 -0500
Received: by mail-ed1-x52c.google.com with SMTP id bd6so1809503edb.10
 for <qemu-arm@nongnu.org>; Fri, 05 Mar 2021 02:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6VCuuBtbuc8EStm0rgjyCLYmu6kKh/SbbcBZq5BmvOI=;
 b=y+BEdgaCBzdC+JZSkiSPqTwo5LYtWRXgqNaWCN6ZdgtoUyf0fZhoghWlnY1xjAuxsH
 jPEeGNt1ps/Z/FrhQtqCc3gs4OaXqdQ22Covk9quVYsMhy7ltDox/trBFY1rWERFvR8L
 BSPPJfUY8M/3gxPnO2JsXl/9YpO953TqQtZOX4b8zGUPOc9RG3jasRo7itkF3kuT5mFh
 tA1lFxeBpad3WE0dahG5mDk6BZJgPfuhBgbLPv1AjvFgCHvnn2mlqihf+oh9t0Hzux9O
 +h6ppIWu5tRIjZ0f74zEGy5wV1LUX830tJNjD19cZKMXKbQNoYl66X66Y0dzQWo1pFbQ
 9LLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6VCuuBtbuc8EStm0rgjyCLYmu6kKh/SbbcBZq5BmvOI=;
 b=bvyf9La1xgQRP7yD2Ehz8VmTOkXkIl/xpSMffMxtVFCoz0xsp9yHdnVzDWJgVNULrH
 vDT/azMWUXMBbNt6zb8T2r7HC5cSk9At2aNVcPLbMcdSr9JaDgJzVuNS9slPYJIAEeOD
 ML4S0zXgcySgiQBc+XRTF0IFAu4I8CpC3ugIR8bXYyb4CQ9uMTVIWJxVmqCwNvvzxt4Y
 JFrgkHakJkXMPDZ22iT4f8Py0GQxWJk/QPvE4XAlz5c8yFuYO5u15YsrA0q5k973wk9R
 r7pKp8L98ZLm8qu9PMnDXpxITpoS5yie135XyFVkQfcgoHCsygRGMnBNIKsuIs0Zfp4l
 04AQ==
X-Gm-Message-State: AOAM531n2jHyhNdHH+WzyiJ9fZCNg9ug6q6ZCfTGDty+9wCTRQF6QHSy
 OZteiEHg7KWwPoXGuRUlYVEGxcDdwPH3FJnmv9PVoQ==
X-Received: by 2002:aa7:c804:: with SMTP id a4mr8290734edt.251.1614939794628; 
 Fri, 05 Mar 2021 02:23:14 -0800 (PST)
MIME-Version: 1.0
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-44-peter.maydell@linaro.org>
 <5283165e-f8f8-fd5b-843c-2010d212785b@linaro.org>
In-Reply-To: <5283165e-f8f8-fd5b-843c-2010d212785b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 10:22:59 +0000
Message-ID: <CAFEAcA8kLV_gxbD+Gt+c4ShTxcPKEUHYvF26gmtDA_-iAuWdTQ@mail.gmail.com>
Subject: Re: [PATCH 43/44] docs/system/arm/mps2.rst: Document the new
 mps3-an547 board
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: qgjDSY8SeRMo

On Fri, 5 Mar 2021 at 01:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/19/21 6:46 AM, Peter Maydell wrote:
> > @@ -1,5 +1,5 @@
> > -Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``)
> > -=========================================================================================================================================
> > +Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``, ``mps3-an547``)'
> I think you should drop the list here, as it has gotten *way* too long.
>
> > @@ -27,6 +27,8 @@ QEMU models the following FPGA images:
> >     Dual Cortex-M33 as documented in Arm Application Note AN521
> >   ``mps3-an524``
> >     Dual Cortex-M33 on an MPS3, as documented in Arm Application Note AN524
> > +``mps3-an547``
> > +  Cortex-M55 on an MPS3, as documented in Arm Application Note AN547
>
> The list is down here, anyway.

The title is what generates the text for the table of contents in the
next page up:

https://qemu-project.gitlab.io/qemu/system/target-arm.html#board-specific-documentation

I like having every board model listed explicitly in that ToC. (Though we
have broken this rule for the Aspeed boards with "*-bmc"...)

-- PMM
