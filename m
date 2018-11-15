Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7099080wrw;
        Thu, 15 Nov 2018 06:54:02 -0800 (PST)
X-Google-Smtp-Source: AJdET5c4g2n0viHErsq9WcCRhXIt1smmJM7ZsJJwgjhZyEnG5l7cENVA+Cnr/7P+BoQt6OESN6Dy
X-Received: by 2002:a37:c597:: with SMTP id k23mr6102936qkl.87.1542293641953;
        Thu, 15 Nov 2018 06:54:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542293641; cv=none;
        d=google.com; s=arc-20160816;
        b=0qWzTqwJ877pmAFHVozXzXjCJaUiNZa5sDio+gha7Sc7kQguKO3ZZgxr5/MKNUnkQW
         2vAIRskIoTjC6u9mRU2g5rQVZSA17wEog99IoZMZW7nbZesRZlL0ZvDpbRvUg2JBW/FI
         ltz88VDRdsvh7GNXjYZveQner+KQOX6npnQDlMGVKvz0O9/P9rUoxf5hN3vZ+tyrdY0C
         1MCMjbQ1sn8UV3dm4KKZuFoWdFZf+W2OFRyeV0DBQKCUo9WtTkkr9VF1Chh1zc1lj1co
         H2IOFo4Xfm6qVqkP4URkujldCjcqTvBNX7qsZghYXo1it/TEcgf02gjWvG9bksyYv5/O
         dEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=7GQfz9+dprfkVsavSHN7k0E0JA9bwgLLsQ7tNUlxlSc=;
        b=PooGQDoc6i7t64I9Q6SmiWcnSq5YXzhlwl4Y6ngU/oteeXx2xcX9uJBY07Za5ot7Jw
         kvonlOCrC4zCzuKmXH4Q5hg1X5veIgVBnrqnOMK1MuBmhrIEUHrkEeFNp7m7OrlhZcIz
         lbD34OHDEzsrslc9bfPbSUCyCQRNFApdpIgHvGVyxFZOo4adJd7h7GYD6nLB+1ctOrOr
         Wvq4QwpbRMdhExCIqeeiPGP4H92uk7ijFgb/kceK5PSDFG2zFQUrOr02DgiABkDrip36
         bYsZNH+YWQknJVSH4Vi8pUHaJ1vz06c3tpB08ZawqLLhHIoFiWfdHUVCV3vuBv5vjvkt
         /Etg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T6+0xPcI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f57si3128058qtf.362.2018.11.15.06.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 06:54:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T6+0xPcI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39320 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNJ1t-000479-Da
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 09:54:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNJ1f-00042A-Jm
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:53:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNJ1e-00089M-Vq
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:53:47 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNJ1e-00088q-QV
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:53:46 -0500
Received: by mail-oi1-x242.google.com with SMTP id y23so7813259oia.4
	for <qemu-arm@nongnu.org>; Thu, 15 Nov 2018 06:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7GQfz9+dprfkVsavSHN7k0E0JA9bwgLLsQ7tNUlxlSc=;
	b=T6+0xPcIq/h0kFZ7Kd20PwlgFCRvg4AMpDK9vebqDQDbW2OoGiNLz4ThI6/SC4b6uD
	NWgz+GNbGbCWdC2iFOQr6fxGH4HR3AVi3l4DhCjzfH1UNcwol/V/qofhwlntmEmN+u+m
	OnXIZk6ZGSJ18/NPrmRdT3HpgQu3HkBMv2aj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7GQfz9+dprfkVsavSHN7k0E0JA9bwgLLsQ7tNUlxlSc=;
	b=Lz8hXy1GOwWIRc/knMtP/xAsSJWCx4eEJtvZR+Oc+fnLR15aAp3sTjE8OgydW4p3aw
	SO79cBlCcOJCviKTahM+TM7SJrJaCSe7DwFtZJmYfleC5nLTJojyECTZt/nLLtqOT/YK
	kSVNL90MIAZccPPy3vbLCAEfcdHfpyYc5vUtO7lgIzvFpqQ+tETuYq1abgr+UvFBLH2w
	+5WLtQG3w2xuKd60PHQvIvZOy2asBQJYtpGpEn61JWicl5rJGh31zkA5Zx36q6paW+sk
	Q3tZ96w6MCKO9ZokJuUcE03CJQBagqRdNHtctwLJOqDIRv7sbzz3eecniRBEuSr/xVy+
	1S9g==
X-Gm-Message-State: AGRZ1gLvlvKA9GziLXMqT9nNtaFXWvg4BV4U3zR7VWNlGrbXtbEgiFNf
	xC364v23NrlgQCYJPl3oCwk0JN0Ot8vm/RKi633ByendtNE=
X-Received: by 2002:aca:c512:: with SMTP id
	v18-v6mr2957501oif.48.1542293626133; 
	Thu, 15 Nov 2018 06:53:46 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Thu, 15 Nov 2018 06:53:25
	-0800 (PST)
In-Reply-To: <20181113180154.17903-1-richard.henderson@linaro.org>
References: <20181113180154.17903-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Nov 2018 14:53:25 +0000
Message-ID: <CAFEAcA8SEjdH6euMazKkQpPfDWQupZAdUigs+=uxLuEUy5W2Bg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v5 0/4] target/arm: KVM vs ARMISARegisters
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r14EaKOkVg4p

On 13 November 2018 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Facepalm.  I managed to not push the v3 changes anywhere,
> so the v4 changes were done on top of v2.  Ho hum.
>
> r~
>

Applied v5 to target-arm.next for 3.1, thanks. (And tested on
both the aarch64 and the aarch32 systems that had problems
with earlier versions of the patchset.)

-- PMM
