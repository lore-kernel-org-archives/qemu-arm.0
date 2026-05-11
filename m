Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A465BCD37AC
	for <qemu-arm@archiver.kernel.org>; Mon, 11 May 2026 14:34:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wMRiA-0008Fb-J1; Mon, 11 May 2026 10:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMRhi-0008Dd-GN
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:34:04 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wMRhb-0006XA-KQ
 for qemu-arm@nongnu.org; Mon, 11 May 2026 10:33:50 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-6746d0b2b4aso6624970a12.3
 for <qemu-arm@nongnu.org>; Mon, 11 May 2026 07:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778510024; cv=none;
 d=google.com; s=arc-20240605;
 b=Q/fCr2p213Tu20hkuFyAgP09otJeAmlvvm+4ugGeMXzqSwcQfRK4Tlrj7zKuFizQE8
 dWdj00LhfSACmLm7VbZ9gTsIAXN+srNDZnETXv9D8Hfy7HODYUKrkSjsh8eDXuZNPcAs
 OLEUqXYIxfGFC5oN2CTIJ2+6K7r75sN263IaVtRsuajGegIWSNFqwgT1vZivlj5x314q
 f4BC+uNLq6gJNNlgxRAWzaPB/aYXSHVf61jujzssmFXKFgGXft3XMYHaR1k+NBgs5L1E
 gNiZerJ1LzxjLtWohQealZncfUbybQ0BB+t0qDDl4/X2i0hLda9ZNIeeGIwSqgYTJLQE
 ZC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dMiKxnwj4kix6XqCs3wmtBcSPTJVyJXP/efIdat9BnY=;
 fh=xHLKd/O5jUw+TU59POH6od55ovp94ADA8pQIj2gsaWs=;
 b=iTZCr5qt0BIxwtOrPXQfUmFaR3HS929HR6/accC1bpIit22wn0v3XeSHeUfWIEan3a
 Z0yqfox89sC/Se1aS+vm7Q+amCOQDa3UrgJ8VnVl4DLxNYF8Fkddxm7oQD81gVCtPepb
 rxOJuxeyy4r4DEWLkyQBHStinO6ajWxV8VIeCO77Xomzx30+qzEEvgzS8x4Y7Iq7Crmy
 83161Mo0UjmTtwsbRRQV/KA7dKkuZs1nUUZpI+b/cgSGx0Mhg/5Mc3cv12lXbjOLFgGJ
 urse6mUSWXUnzIjGo/AtnK2En5GwVWxTEMRD3cT0XjZrOMUCmCrXqp+5X5w17DwQbgHt
 iJrw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778510024; x=1779114824; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMiKxnwj4kix6XqCs3wmtBcSPTJVyJXP/efIdat9BnY=;
 b=y2esZkcJvacYHOfcWnF2aRnGNNolfU8Wk2828WtHlPFTV0L7qIzbDLnUpAJy/pn+gs
 7Myng60JXq6MMk3ohPqsBPppxzewN918YNFW+/JTZ7PE/+weIUrPqzJJYK3/MAF8u433
 Hyeyw6E0ifmf1wXVmFpWllA+MyqoyLKf2m29VunGiCVQpJIjWasW87VUK02g11+qH2X2
 KLtpI99pdukHBOrjnp49bheiSt0EbXz9o1ZtvbUs65t41qfu6gLoFOm9BeFE34gbSrEt
 3oNtfa7fs7zW5YYTKgMiSiSDCm5Jmh0gmd/kxxe88sdcLJzm1WrrqUuWo26bygYybm7D
 EqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778510024; x=1779114824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dMiKxnwj4kix6XqCs3wmtBcSPTJVyJXP/efIdat9BnY=;
 b=p8bgMYayUP4Zeob0eUQ3MxpWsY2d2vP2RPXom42F40DpZWrKzAnqR4ngycWzoWXgcB
 gYrQfgkco55d5Y7PIFo39/92RNeCoVa+z0OSM5zkIi9ykuWyC+e6ZCSKZEFAB86U8WZb
 cYl0YtgnfBEISp5ZY5KJJaVObrFyK+ij/qbR8JZPE2sfTmh36E90zxCCnYkhGjxO4iyP
 ftGEt6RQf04iEiYIGY3N6vTVSv2pK7mrvtvppCXKu/3DAmeWEp1yvMWZJfZejtKbO/9/
 LUUi4i+GnJ8CXVzIIQyOjs4OpNIt0I8mZWe0pKyrMW1SNZFLOq3/fN/Myc93EvHwFaQH
 Vz1Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/8eLg90UYj57h8NYEu2CHepqmbdQt7vqzgoNJ8lzSuWpjWXxyBIZnDxxJFEwEDOpwB1amtzJ+HWw==@nongnu.org
X-Gm-Message-State: AOJu0Yzq2/FBpii02CyIj7q2byKufK9T6bn9the4oGFQw9IYNj0hKycX
 crvmNoPcU2S4dOclu/LEh1vHfvfohOzHQmDBBH+ATz3ZFLKaiR9Mnb3qrSsqSorkobcUsRtcLlF
 Qu2GTSLzHsXYat0hgamvoenpspDaXZ1Zd73XOqSCdeQ==
X-Gm-Gg: Acq92OGF+VV9x0O/KguDOhNe4ynWa7nUGSJxmbpU8qEsuHWdURafyuD7Q/1ZfI/U7Qh
 zBwR8v+vtXzh9D+0/02FbaUksPuCmRDAta57qL2uRK4JEgodGuPwmPxP7sspnEz/Kcu8bFeVHdP
 cgBzZP4JUK0TCXHNRsWE16RYKKz0WTnNsdHcN8jeh/JaqlT1FgVa/UPiNCGb+AnG4YPCuEUqKnN
 kF8+dlEdHsJ2w5yGV+sQYE2B1NQidS4UjxXwdgyEPxZRQzrORS1s03O2k1KNX8qN3xDoA/GOCLW
 YU9PSnShK0kwE5g1+UdjQiVVbL3pgVncMMEE8STUFcfJvXmCxgRuLB20qPdTA12PHdk=
X-Received: by 2002:a17:907:7b96:b0:bcc:ad8e:cffc with SMTP id
 a640c23a62f3a-bccad8ed0bcmr457501466b.33.1778510023830; Mon, 11 May 2026
 07:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260427-qom-tests-v1-0-c413f3605311@redhat.com>
 <20260427-qom-tests-v1-34-c413f3605311@redhat.com>
 <CAFEAcA-tSqa7SQUE-f5yTq_P9eW6p_XrnNSnHZjw4g=Z2WncAQ@mail.gmail.com>
 <4f90d39a-560f-4922-ac54-2c975dae249d@linaro.org>
 <CAFEAcA_LcHgtAAYFjqm+P68ULwSRJWfr6LipMg9YsviyWDxH7Q@mail.gmail.com>
 <CAJ+F1CKFcPy3NtKgVfUruN_Mp1498EiQpRNz65HNE6YeqJD3CA@mail.gmail.com>
In-Reply-To: <CAJ+F1CKFcPy3NtKgVfUruN_Mp1498EiQpRNz65HNE6YeqJD3CA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2026 15:33:30 +0100
X-Gm-Features: AVHnY4IvOAwGbP63OcIwl8KYe3nViuFBGjk2dfTwMRKmTlUXWHXktfQP2nn26_4
Message-ID: <CAFEAcA84KeXuCKKd6B2P13OrH1Du9Y-hgehQZWb4zPSFSVuSHA@mail.gmail.com>
Subject: Re: [PATCH 34/41] hw/arm/virt: free flash devices and OEM strings on
 finalization
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 11 May 2026 at 14:01, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
> Yes, in general, if a device creates & keeps a reference to an
> instance, it should be a strong reference (we don't have support for
> weak reference the way gobject has for ex). It should then unref it
> unconditonally on finalize. Is it ok if it is addressed in a follow-up
> series after this one lands? I am afraid it would delay this series or
> make it longer, and a shift its focus

Yes, that's OK.

-- PMM

