Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp253649ejb;
        Tue, 25 Jul 2023 19:58:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHPLMp7fMbkX7V87paU7/kjpL006ZY6xP7G9c/aQdEreezi2cfnUQ1/HJSapkVyeNf8D+8G
X-Received: by 2002:a0c:a78a:0:b0:63c:7584:a3c0 with SMTP id v10-20020a0ca78a000000b0063c7584a3c0mr691036qva.52.1690340312790;
        Tue, 25 Jul 2023 19:58:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690340312; cv=none;
        d=google.com; s=arc-20160816;
        b=EKj3T2A8MMJg1a64I7Pl3WbdC2tUB9HWCHx4+DlSktNViME78kIzpd9UKy81e/8CxA
         7ACXHMFypL+Njf/qDmgOLyHpVOWWrw4cZX4MjQ+Gc8Q5gDgF2j0ld2yGiyUDLNf6XmKC
         ytp1215QNDANg+N15G5dX7VF0fyH+nw6pn2hj6Bmmrq9CPdDceMJ2zN/Qn1LUznXe+Bu
         lSVdLou+OvLp/b/Y4Ycj0hR7gaYhosAhHXDAXKE2pYJJrpH7kevT+aOI3SxpXZc/ayYy
         qxffEQbRekk5N4dUv8fFIGseaAP/ZgzBQPvllUxEJBLR1zzAnazjTJHbWNDudp7PA1up
         Izsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :cc:from:to:dkim-signature:date;
        bh=ZbDZVwo4EgVC2ugQueEQiI+EhXNMlvZ1R66J5uSyu+Q=;
        fh=uvGlSLfcSt9vnSvrMWc6y0Q6mWiTDHJnOxMsFuBeqTg=;
        b=v3Z+skAPUr/lEkzJUEahy93bjWlytosLPANSAYrJ5E/ETdc3ZCR1DyQrR1SIfL23vm
         +06oiUj/HApj+Yue0tRLJ4Z2vUCeO8LVfW05VkDDq7LgK9FQWIMCLUUE3DEI+XgohDyx
         ql82lLH6pT42XPFZHNSvnhOIQqzO5hTUxu9jk4Wmxjgv1ygcunb0xkCIAQE6vFWALTNu
         RFgZI+HTtD9MDQb0Xr6ZdWhFkdane/V4WmnQRiMWzTCSDgvTQCK5ar2f11lVSYNs3hpa
         jGspJpHnVDXJC8CJY5PUyyH8/PxyY8Rv/ov+5XQb35HvHu5qFsJinQW9CL/EsSsU/PER
         dKxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=kNeCvdCl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n11-20020a0c8c0b000000b00635f3c2e880si7368623qvb.467.2023.07.25.19.58.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jul 2023 19:58:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=kNeCvdCl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOUjK-00081J-3V; Tue, 25 Jul 2023 22:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>)
 id 1qOUjI-000816-0A; Tue, 25 Jul 2023 22:58:24 -0400
Received: from mail-4317.proton.ch ([185.70.43.17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>)
 id 1qOUjF-000179-4c; Tue, 25 Jul 2023 22:58:23 -0400
Date: Wed, 26 Jul 2023 02:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1690340297; x=1690599497;
 bh=ZbDZVwo4EgVC2ugQueEQiI+EhXNMlvZ1R66J5uSyu+Q=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=kNeCvdClRm2lEZZClHepewMH1/vohtxrHD/z6+fSz/w8oazCh+sQnW6be9aaa2Rl4
 xWHzMfyFXig6P62z6rsbKiVnb3BfejiQL1+tbU3sHPf1/YsLEEueMzqpEdGQRE9Q4G
 VC8aAz0RIjtcNevAAjW7NIsAc6I4GG5N0sXC/wK43NNYxoQMSIBnom0nzgNf0nOGss
 YSSe78cuV11sUJmenD/HOBEZkjSWnxC7fGIytDpb5qpGtPwbjnmcZoCPp5DwV3ngMN
 AD6vDCDfL9+Z3qv45CElfJDCth+DjV3UVqUWhqnCxPafPzvzZe6Ieftz0QooyudZIR
 C8W8I0LO/HdkA==
To: Peter Maydell <peter.maydell@linaro.org>
From: Chris Laplante <chris@laplante.io>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Subject: Re: [PATCH 0/6] Add nRF51 DETECT signal with test
Message-ID: <v4T6r3Jo6rECeBH-guxuM1tF9cBnN5Xx3NGteXN-4Wgk7U7BquDfPxeRI_ZOm7BA3xEixxpua3w4fONi7j8HYkyu3E3IVfWqbGZ_57VYBNA=@laplante.io>
In-Reply-To: <CAFEAcA_HWapg170-7yu2cZ-ePTe4PaX-tWyL7FJzENgig=dq5g@mail.gmail.com>
References: <20230714232659.76434-1-chris@laplante.io>
 <CAFEAcA_gGia=ckyv4=XHNX4=VHJJ=rmVGXQbdnOAGv5h1rzLzw@mail.gmail.com>
 <uJ83qRpjm3C76JRjI4OOm2NAz3uF-RDUa2WL8sp3ftAzoH16KDfxZhwxsqxqxrHTfXHKkZZXy0JY6UUpq7nD0jfYEUtYM_K340O6E6BFwJY=@laplante.io>
 <CAFEAcA_HWapg170-7yu2cZ-ePTe4PaX-tWyL7FJzENgig=dq5g@mail.gmail.com>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.43.17; envelope-from=chris@laplante.io;
 helo=mail-4317.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: BH4GHp64Uw8x

> > 2. I also have some implementations for pieces of CLOCK, namely the HFC=
LKSTART/HFCLKSTOP events and HFCLKSTARTED event. Should I include that in t=
his patch series, or would you prefer it in a separate series? It is unrela=
ted to DETECT and POWER.
>=20
>=20
> If you think they're ready to go in, and it doesn't
> make the series more than about 12-15 patches long,
> you can put them on the end of the series. If the
> patchset is starting to get a bit big then it might
> be easier to get the POWER/DETECT parts reviewed
> first.

I'm just going to send the POWER/DETECT bits first. There is quite a lot to=
 emulate in CLOCK, POWER, and MPU, and I'd like to do a good job on it.

Thanks.
Chris
