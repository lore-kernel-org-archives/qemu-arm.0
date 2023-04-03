Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp29147ejb;
        Mon, 3 Apr 2023 08:02:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350YlToIVzovtkfAUXSrljvuzmFVg8W4ROzUp0VvaGQ7HZFTIs9e9+14cKOhEe51jJNJ/nMdj
X-Received: by 2002:ac2:428a:0:b0:4ea:f526:5bea with SMTP id m10-20020ac2428a000000b004eaf5265beamr5085817lfh.27.1680534132570;
        Mon, 03 Apr 2023 08:02:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680534132; cv=none;
        d=google.com; s=arc-20160816;
        b=Qrq+3ygQggoE82Oei5zKIBsRtLy7EQR1ECoWhVMNs3gZvyyJrnYzRX3Cdqj6DIvxjU
         mg9somSzbHhCHxst8FZGhOkkYXrUbdBmmHLOyzOgxLKENIt+sD5mWPwTGhufL7I/k4GB
         Ih47m6N+p/Nyd5tO9zxs1vrYYk5IsnH8Y3gFR8U6k95ixjJ6kXgWh6X6zgAsLtG5jZi1
         V2eTUQ9+WRxuWPMRu4SxtHYIbmg48Iek04BSuBb9ffRQdYrK3qUnOq3lA3BBYyL8PMBz
         /Kdrld6QL4U4CKcYWMjku4K2qi2T7GzKCWt8odiHE74S9SmuKiLxFyC8KVoIGCcxUtk0
         xayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Y0h61/wI9jjpH/bSL3wwXAuuD+jXZctLihmldfVQfE4=;
        b=NeJa/6a62AQGB50YigD91CE4lSVuPd2Q7Hc9Zh50gDeGnILMtLfV/Cr8G8PCqL7In/
         DNqeXZZNmR+9HtaNGcdJV43MqBNz+MCn3865StMeEKUkdSWpzAnL0fnLWM4qgByjmIpl
         Z5Yrzijw5XPkSs7YU9LGFGnmFGMfUW9wQBS88BCC+0q6Rkf60FxZq/nV2/8FVI5qZZHR
         cxeOnnCCwOCtnoavWWXlZgmRS/nCwGuf7vVA0nmj/lo55m8+0wU8DXUG9a/myKdZq/Af
         M1ULg0SGtWu7XktfybIKkijr6Pjj09Lgu9izeMn5fvJtHoiTSw4BPS0bim8Ef5GuVMp1
         EV4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@osdyne.com header.s=google header.b=chqYbLer;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c26-20020ac244ba000000b004dc4fb5e9casi1650870lfm.347.2023.04.03.08.02.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Apr 2023 08:02:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@osdyne.com header.s=google header.b=chqYbLer;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pjLh7-00064j-9U; Mon, 03 Apr 2023 11:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas@osdyne.com>) id 1pjLUQ-0001p4-2Z
 for qemu-arm@nongnu.org; Mon, 03 Apr 2023 10:48:58 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucas@osdyne.com>) id 1pjLUN-0001V5-WA
 for qemu-arm@nongnu.org; Mon, 03 Apr 2023 10:48:57 -0400
Received: by mail-pg1-x52c.google.com with SMTP id q191so333208pgq.7
 for <qemu-arm@nongnu.org>; Mon, 03 Apr 2023 07:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=osdyne.com; s=google; t=1680533334;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y0h61/wI9jjpH/bSL3wwXAuuD+jXZctLihmldfVQfE4=;
 b=chqYbLervOS4BpzoxOw/RpYI1AaWGwuzEHLzyApjQJuWSSt0bu56tNQDeIdOiylMzW
 DGwycYUJAmaukZ8pQdEKfFVfeb4lhwFxcXuc3UtkDo6ew/LiP47LRicCoOWqSbbisLSr
 Lxqg9BlxwJPJC9iJgigUCsiivcUyr+MTTYlMHh+3OvEC/iGm4gcORPmY88chwc/Mz/Xl
 ePTe9EIMA+Li8mCWuwPGk9A+tkqzdZba1T8C7FCvNZFDUJ8NVUlyUx9dq8aT5ny/J2WX
 27ekxT5cBflaplgTf+YmoJHmiUULfF9E6T6cslEJwR5LQihBEhasnTpIRET+O5yKcUgk
 W7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680533334;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y0h61/wI9jjpH/bSL3wwXAuuD+jXZctLihmldfVQfE4=;
 b=Nb5Bk7rBXke5yRSDVgrcapQN/ui22BkO0VkcJ/uwoAketdgflwxuHHeQZ6257Qq/U2
 UCY2Bliftd02783o+xYlCLd3ZTW/DtXeDntyfFR1c1vs6TZcumqOzWIk3ZBZ4YlgdUvj
 i0fcPwPR9sOtTgJKEV4bQGPsskfCOT54f7HOaRxJKimsuaqyxSu+ZCpZnE47MZG8zxn+
 dtfEF7diFjBOrQj3IiPkFnlwkS6DBnLLo79XbGDbB8Y7v/YWcOI6z4/ghPn/55FgV9zE
 xU28NZggrwovJaD8kwxtmGFEBv8Z1Carqf+v7eYDWV9JoISHD1pAKviS9VM0nCBJ20tX
 hjWw==
X-Gm-Message-State: AAQBX9ecwxb8Fs+UKg/UyXneDS6ndpbBQiiGaWzE5gCEIW69KhtMQ53E
 LGktMIudtC0e9FDi+Lndux3GCMM+lu5+gUySIZNKQw==
X-Received: by 2002:a05:6a00:1301:b0:62d:dfe3:ea2e with SMTP id
 j1-20020a056a00130100b0062ddfe3ea2emr5321709pfu.1.1680533333766; Mon, 03 Apr
 2023 07:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230403121537.71320-1-lucas@osdyne.com>
 <CAFEAcA9ERb4a8kwcgtr3VAxnjaCuOVnKFJ56FfkNx=F73a0o-A@mail.gmail.com>
In-Reply-To: <CAFEAcA9ERb4a8kwcgtr3VAxnjaCuOVnKFJ56FfkNx=F73a0o-A@mail.gmail.com>
From: "Lucas C. Villa Real" <lucas@osdyne.com>
Date: Mon, 3 Apr 2023 11:48:43 -0300
Message-ID: <CAL+Dfo6ysWqeKCR5p4_JMazjgdwqq5+kdYxTXVpHE0oZNMVpOQ@mail.gmail.com>
Subject: Re: [PATCH] stm32vldiscovery: allow overriding of RAM size
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Lucas Villa Real <lucasvr@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, erdnaxe@crans.org
Content-Type: multipart/alternative; boundary="000000000000648c4805f86fa836"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=lucas@osdyne.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 03 Apr 2023 11:02:02 -0400
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
X-TUID: PlEadCsKvqoD

--000000000000648c4805f86fa836
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023 at 10:54=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org>
wrote:

> On Mon, 3 Apr 2023 at 13:51, Lucas Villa Real <lucasvr@gmail.com> wrote:
> >
> > stm32vldiscovery comes with 8KB of SRAM, which may be too low when
> > running some workloads on QEMU. The command line argument "-m mem_size"
> > is not recognized by the current implementation, though, so one cannot
> > easily override the default memory size.
> >
> > This patch fixes that by adding a memory subregion according to the
> > value provided on that command line argument. If absent, the default
> > value of 8KB still applies.
> >
> > Signed-off-by: Lucas Villa Real <lucas@osdyne.com>
>
> Does the real hardware have (options for) more than 8K of SRAM here ?
>
> thanks
> -- PMM
>

Yes, it's possible to add more (p)SRAM via the STM32F10xxx's FSMC (flexible
static memory controller). The new memory is mapped to FSMC bank 1 at
0x6000_0000, though (as opposed to the embedded SRAM's fixed address at
0x2000_0000), as I have now realized. I'm happy to send an updated patch so
that "-m mem_size" creates a memory subregion at 0x6000_0000 instead.

Best regards,
Lucas

--000000000000648c4805f86fa836
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, Apr 3, 2023 at 10:54=E2=80=AFAM Peter Maydell &lt;<a href=3D=
"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 3 Apr 202=
3 at 13:51, Lucas Villa Real &lt;<a href=3D"mailto:lucasvr@gmail.com" targe=
t=3D"_blank">lucasvr@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; stm32vldiscovery comes with 8KB of SRAM, which may be too low when<br>
&gt; running some workloads on QEMU. The command line argument &quot;-m mem=
_size&quot;<br>
&gt; is not recognized by the current implementation, though, so one cannot=
<br>
&gt; easily override the default memory size.<br>
&gt;<br>
&gt; This patch fixes that by adding a memory subregion according to the<br=
>
&gt; value provided on that command line argument. If absent, the default<b=
r>
&gt; value of 8KB still applies.<br>
&gt;<br>
&gt; Signed-off-by: Lucas Villa Real &lt;<a href=3D"mailto:lucas@osdyne.com=
" target=3D"_blank">lucas@osdyne.com</a>&gt;<br>
<br>
Does the real hardware have (options for) more than 8K of SRAM here ?<br>
<br>
thanks<br>
-- PMM<br></blockquote><div><br></div><div>Yes, it&#39;s possible to add mo=
re (p)SRAM via the <span style=3D"font-family:sans-serif" role=3D"presentat=
ion" dir=3D"ltr">STM32F10xxx&#39;s </span>FSMC (flexible static memory cont=
roller). The new memory is mapped to FSMC bank 1 at 0x6000_0000, though (as=
 opposed to the embedded SRAM&#39;s fixed address at 0x2000_0000), as I hav=
e now realized. I&#39;m happy to send an updated patch so that &quot;-m mem=
_size&quot; creates a memory subregion at 0x6000_0000 instead.</div><div><b=
r></div><div>Best regards,</div><div>Lucas<br></div><div><br></div></div></=
div>

--000000000000648c4805f86fa836--
