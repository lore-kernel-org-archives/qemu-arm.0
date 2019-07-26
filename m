Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11694485wrv;
        Fri, 26 Jul 2019 02:52:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwIzSzELhaF4dfG+jWeXx8U03EshhWz/Xk8W9qsDuH8fdf0DQsot9GDm9vph1c8Sw6thRSQ
X-Received: by 2002:ac8:f99:: with SMTP id b25mr58228452qtk.142.1564134751051;
        Fri, 26 Jul 2019 02:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564134751; cv=none;
        d=google.com; s=arc-20160816;
        b=fTfOdQov2D8H9kzSMxr/5/bXEYL3Ootw1VTAWpyDLSF1K4R4fiSXeI+fHLAW6Vj1f/
         cucrPjKStc1VdObAnj+K8NOquDG2q/h/mTxK1nmdvqEMGXb8A3QQBDcMiPUpCo/uXoPF
         ty7q8Pby01SE+9fmcEVQlCauQKHO8ixQAxMyq1JoT/Ihr2afZErLaZKRYC4KMzMxyqdp
         PJHnxEiod4u3jdgdAi68xiT7uh3w09JgxictpSBo4CuRgRUyW6FkaMkQt7DDEZJ3TB+2
         5hoHwIxNCgdMhaqaU4KyhlPYYpAraoJ0YnSeb7ZYYd6ALM6JE66ICRkWfFDyyAhUZ1b9
         LyHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=4mYSBdPiIPkzLnUxeR75ZEp7DWfaNSOgQ2gziwNFtU8=;
        b=kmSYYGH1f54i/RCT8+dAZgpa8g7MV0W1XzbRrBYOm+HoGB9I7DmZLdHzBRSAg+m48a
         8lIhTi1rjXxUIyo0TmETYcg3siZXlBCTJeg0iKfeVY7VztykyfcYZtT/phDGKdqyXM68
         yLmlH4GETA3KINGdVHAXeeFU1L6D1pu7bbjY1or3BhzpAuV/EUe9iGMG3OLBDMAkkCI0
         zbzd2JcIRfh1qwrbqTpsgW/cH9dk9+ffm1ax61nvZWcQ/AuyOfkSWUnCnhsZtPTzYxaA
         Y8GSTL1coxFCmGk3ehE+nHAcauxT3H4fjCIkN+nVbm72BvPZ2CURFwLe0hGZehg2sfLb
         ZxnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fXDWMeH9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si17729460qkg.189.2019.07.26.02.52.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 02:52:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fXDWMeH9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqwtm-00079I-LF
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 05:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58858)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqwth-00077f-Bt
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:52:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqwte-0005Gl-Bh
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:52:19 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36382)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqwte-00056e-2W
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 05:52:18 -0400
Received: by mail-ot1-x343.google.com with SMTP id r6so54755451oti.3
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 02:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4mYSBdPiIPkzLnUxeR75ZEp7DWfaNSOgQ2gziwNFtU8=;
 b=fXDWMeH9q9LcoJgZ1/hxdIsjG05fgznICbZBxTqU/hZ2JBB7xhkjb6h31GocBw5DiE
 ZoMHxI7w7foACg3vPx6M2e0VkAKB9SMB9zeJXd65+tdHAZT5a92mFgp+G33VZ6wQCvIj
 xI7VHRBMR63kta6TWtb177UXhPVe9mr8YGMOw1o/59U6JbzWxc82A130zcAhLgmzznUe
 a3PjFLEXdis6j0PF5Yw1Xr/7GdHejzFFXH4VzkfmIvjnNGDLOhnhrPv6PFFTtxxhVlVw
 9SmIz9SvIofOoIEf6l3CV/b1LgS+v3+U+JB4uaSmlknr5NEMVY/hrWk+9x2D+P7heb7v
 oF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4mYSBdPiIPkzLnUxeR75ZEp7DWfaNSOgQ2gziwNFtU8=;
 b=fX0L2CwnSarRIDdjlqAUo9u0jeXLozuaLdgdOEEq2hEB4um5QRplK71ORcwOMdUjOf
 wnpWTJLlhmGDILJrqpSyX9OOTIoaq0xiaN0mMHW6sUPyCYeKfdwd6jgjw9cl5KGsrO/q
 ffTiZRICZCkYCUawpFP74yDOf+CMsd/tjMMw8TVznKuaAQ1or2Hpgx+Gh6GEM174dK05
 Jd5LLATBwK0KcauBVCcN3qMtnKDGW2LvRdlacNKkfcvlZgxt/AALdfAhOpgg1tOc07a1
 CWSXPmFTcChBu/Zn20JaOE9pyYOo/D6WKQuw0O7eu77jua2JWpwdjVGu3Cpt2PUp789B
 PVWA==
X-Gm-Message-State: APjAAAXlG8FeL10Gw/h2H6u+oQs1Q7B6ZgQgG+9qeHyNQhvMjSqBIygD
 chK2HtturMkvbLyYlyRAD1RsXAwb3rWwg6dYZ6WUiGOpMSo=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr39502736otn.135.1564134736255; 
 Fri, 26 Jul 2019 02:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-2-peter.maydell@linaro.org>
 <20190725170228.GL2656@work-vm>
 <c5a0799e-2ebe-5a79-915a-af52d471a589@redhat.com>
In-Reply-To: <c5a0799e-2ebe-5a79-915a-af52d471a589@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 10:52:05 +0100
Message-ID: <CAFEAcA8PROpFeKfxXFdVvVoZaus-MsX_EHGxw+yEUty_mnQdMQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Juan Quintela <quintela@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Avh0PwjwWA74

On Thu, 25 Jul 2019 at 18:40, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 7/25/19 7:02 PM, Dr. David Alan Gilbert wrote:
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> >> gamepad_state::buttons is a pointer to an array of structs,
> >> not an array of structs, so should be declared in the vmstate
> >> with VMSTATE_STRUCT_VARRAY_POINTER_INT32; otherwise we
> >> corrupt memory on incoming migration.
> >>
> >> We bump the vmstate version field as the easiest way to
> >> deal with the migration break, since migration wouldn't have
> >> worked reliably before anyway.
> >>
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > OK, it would be great to change num_buttons to uint32_t and make that a
> > UINT32 at some point;  it's hard to press negative buttons.
>
> Since the version is incremented, now seems to be a good time.

...except this patch is for 4.1 and we've already done rc2,
so it's not really an ideal time to put in code cleanups...

thanks
-- PMM
