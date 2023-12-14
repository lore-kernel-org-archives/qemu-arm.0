Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2407185ejo;
        Thu, 14 Dec 2023 07:34:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFlOa5Cb+HvTAqwxe1perDva6BWsnD0DGe249UZYRunIoSeE81PaV81eX0+YbC0jviLfQ5
X-Received: by 2002:a05:622a:41:b0:425:91ca:31ae with SMTP id y1-20020a05622a004100b0042591ca31aemr13390781qtw.109.1702568096126;
        Thu, 14 Dec 2023 07:34:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702568096; cv=none;
        d=google.com; s=arc-20160816;
        b=PhH9dyveYTor+zosZzIt3uHMqaAYnO1+YB8TV9rhANE8SPq7Hrp8C511jIRa/86m3+
         mn5Oc4/QJGx5qRuWrO0I0HSftt0WLZvsFUIwVJeK76Ulq/hE8vTrCFwp8UBTTnI1v978
         PGSta+1i/12GyECL3w1GPF6C5N73qxbmy5zr94mXI8C6sKOomYZc/Q6mMIx0l3IASmUj
         icYx2xW/ROlR46ytix3Zp7yo+7TinIvnSyFx6DiB5fGuE7m7R07UVP3kbWWvVY/Py/g/
         FvOKnlhONIgch7Hi36gCM7a6O3k7Mb4AxuiO9U5kd6InizKOa5Nr+/rK5VT7J5N97Rnd
         b/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=nv2TX1Ip2iaU3Gdt+lOUIp5X3QhzzFnX3LN7f4+v81w=;
        fh=eoQB7mYEuRt05nElmkj3IN/dFmrbGZnIdf4aRaj90HM=;
        b=aYFj9HbGahi3Pas9ArPwA4NS71pho5Nfmd720Ry5UFC3FqlZ8HIyw1HiKf8MiO00ZP
         o/005mS6k2OZSZ6VuFuIQlHS+EL2Suxs/Q3B/0Sm5V6kJZIBtNQfYdmB2VQdWltWA2/h
         77q3NLL8Xzf26gh0keeENfz/ip8O7wi+lwsDji6GoQyKxB50QI2deUHzBAZnGsGSlKgU
         JrBulzpfsaG3Q3RsCk1RmNaBwUOAx73fzj7Xh7/RmmhiIkBuFx9qJ2jbwvNdBuLfd00b
         WlJ/xXwm5wEMAJE8B0qA9Xh/3+D2R5xex8DErl2noQSd2cpRLvPlPb9wH2pZ42AiHiGP
         ORDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lbd5qCcd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb27-20020a05622a1b1b00b004236ed850d4si15809078qtb.166.2023.12.14.07.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Dec 2023 07:34:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lbd5qCcd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDnje-0007M0-Pw; Thu, 14 Dec 2023 10:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rDnjd-0007LK-Aw
 for qemu-arm@nongnu.org; Thu, 14 Dec 2023 10:34:49 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rDnjb-0005zr-Pl
 for qemu-arm@nongnu.org; Thu, 14 Dec 2023 10:34:49 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-54f4f7d082cso9339040a12.0
 for <qemu-arm@nongnu.org>; Thu, 14 Dec 2023 07:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702568086; x=1703172886; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nv2TX1Ip2iaU3Gdt+lOUIp5X3QhzzFnX3LN7f4+v81w=;
 b=lbd5qCcdV/FjJkcifIgNYvGYjaGjAISKHRLYbGqA1om6VRVVA70eju8yxNx5GdYWQN
 wJGCCFT32BP5wYKDwtpX34uGZ+qr0wJFUptuH3KsDmn5QOIT3Sff8mAajVGZUg3zdkBd
 7z+Uro79pGzWrdlirMsg2NIKHppJMUNsvFJRuxPOnlxykKSXOGgk4lNGKpJxonyi6Ih2
 xg4hNJOdYvrGiSxowua1N5a6fDWpuNM+pZGphSYERtyCvLQBPaGqceEIJdwdQmnIfilT
 GS0/R917XqvMy4jB0tCwdQtBu64qrq48wT3lEPuD6wtsnTpxvsBtMSjUcedun4STvIc2
 uYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702568086; x=1703172886;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nv2TX1Ip2iaU3Gdt+lOUIp5X3QhzzFnX3LN7f4+v81w=;
 b=pqj7acBr6bnM89tytcvsTY4hm7+b1Zon9OOFJCyh/+c+1ojDkVN40E81tg9VIPvnW/
 +VVGe+T8RPKK3SOONxkM0Tp1RkwFgk1l1U9eq9BwWS4WBMJzezrhWzhNmU7zgEExUebx
 3RqkSFVkfXKCw/t4MeC8Ph6+PQ1yjyaRe8n64Nx5bJFznZ4t0dQ/kHiEQDcLadR1j51O
 gPCsZsbmbjlfkOR5LQ0lzX9DVIexUurk71H84S6/jl0q70xbX2xBe6Zv/vu2nDBKv6PE
 Lqe9SmpBhNM/fRFHo1ZddwJqPJ62sjHP4WNCh14JTuQP4OJP0H4Ub+07jkIWGBUhAw2E
 8RQg==
X-Gm-Message-State: AOJu0YwzK5Cc/JoT08oYPE/AwBfrR6HU+ChxqhrfGo0+O1V60LQ1zdnW
 VLTK/HA4dcnIF37p3YvSxEMwoLrcvL5erDl42dWFqA==
X-Received: by 2002:a50:9514:0:b0:552:31c2:83b0 with SMTP id
 u20-20020a509514000000b0055231c283b0mr1088462eda.39.1702568086292; Thu, 14
 Dec 2023 07:34:46 -0800 (PST)
MIME-Version: 1.0
References: <20231123183518.64569-1-philmd@linaro.org>
 <CAFEAcA8S7Ug8uFpvDO9FarLpLhTr_236H8gOK=dEOWQZe-3zgg@mail.gmail.com>
 <e4443aa8-1b36-41fd-b1a8-6ed7ddb2f130@linaro.org>
In-Reply-To: <e4443aa8-1b36-41fd-b1a8-6ed7ddb2f130@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Dec 2023 15:34:34 +0000
Message-ID: <CAFEAcA9v33h4EgfvFdH0EtVaf0jxtyAahUwEqoVDA39Z1izwTQ@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 00/16] target/arm/kvm: Unify kvm_arm_FOO() API
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8Q/GpQUDr8ua

On Wed, 13 Dec 2023 at 09:42, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 11/12/23 15:36, Peter Maydell wrote:
> > On Thu, 23 Nov 2023 at 18:35, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> Half of the API takes CPUState, the other ARMCPU...
> >>
> >> $ git grep -F 'CPUState *' target/arm/kvm_arm.h | wc -l
> >>        16
> >> $ git grep -F 'ARMCPU *' target/arm/kvm_arm.h | wc -l
> >>        14
> >>
> >> Since this is ARM specific, have it always take ARMCPU, and
> >> call the generic KVM API casting with the CPU() macro.
> >
> >
> >
> > Applied to target-arm.next for 9.0, thanks.
>
> Thanks Peter, the only change I added from Gavin review is
> on top of patch #3:

OK, I've squashed that in.

-- PMM
