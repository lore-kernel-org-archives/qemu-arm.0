Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B772CD5BD0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 16:38:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSHGz-0004vr-FC; Wed, 27 May 2026 12:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSHGs-0004vP-1z
 for qemu-arm@nongnu.org; Wed, 27 May 2026 12:38:19 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSHGq-0001bj-Fx
 for qemu-arm@nongnu.org; Wed, 27 May 2026 12:38:17 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-6579254f996so7521099d50.1
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 09:38:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779899895; cv=none;
 d=google.com; s=arc-20240605;
 b=X5yxdaSW8iXo5WNfe5xrdoA6BpiN71StmkfsudNbaisT/teCSHVQGk/Bhjr5LANVc5
 45kWbAzENGeAN9plAX9ZkVSA3ileQspX8dvmKJWncnm9dRjrRjorYgzcUvWnbUw5PpkE
 8umborERFrcV3nWrIICMTgPc52mOmWMZoQF5bdYdDERw68TwU9NELvR9nOiHfqIdCdlZ
 G6//3QWCPpszpfrg9GEOrwoP11y1iWy3Ke0Fbax1M7xDh1nS9OKiZf5CB6k9CUZkFraF
 MciaqKjv2mt4xyE5qiFCWLnH0r7CqKLSQSlBOC8IfRp4GjB/P8snsUta0mpPxIOUJ+G4
 GuPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=022TXSF4NsUzKi9zlp5RDNvktdo2lu0slIiUiOkxoH0=;
 fh=6MGFbLaQcQyOi/yg7cNn22Zk//cXyohn69MBFYwYkAw=;
 b=NpXR8pxtxrQUE92IM19M8MVo31m15zjMfPE1L/yzFSn762Sje/GHNqC0SprhsNzv0d
 BVtq8wBgNjGo2+5yOV9f4YvV4kzCBu1x+vsqNu+X0hC0eeDHh1Sclcy8em9U0cpMvhCe
 IFnQjvHRqXuMpyiWiWzDBtSByOqgTICN0lWZoI3xzlRIZRMXiynYR7DlTerG0bEWBBbo
 lMxWvYkYE3vPcFIL2CoYPqP8M6EGQ8jK6owrK3/Rqh+OCbVNczhLxflVtquHjyE3jGS3
 7lnGclKhF1wqU6ZsOaCXlebRZzsvFaoTO8lZC9fpUxa3t30XaB8Gfn1FUC93DA9ET3f/
 uU9g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779899895; x=1780504695; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=022TXSF4NsUzKi9zlp5RDNvktdo2lu0slIiUiOkxoH0=;
 b=xJQ7stKuLryawBv28pTIx04mNglE0nLaPEZW8HWAqn07WlmREYt0J8xSpSf5m1EPRr
 +fGtbM0zPi1jMw7hvbps/WXYrD6kkP14Pi+71u79mNhXNYZXvpCpFZDuALzkSoYMXs39
 pDaFidNd3Lrkl3eUxPqvtv+lYZTqnL2Rp7LJm3aydNzgFNhCgO9bqp5MPkoTyDTmJgGO
 jjbdRKp3v2zg+48NIsLEsWW6U+vLsQTS+lY8HRw1hzOIh4VVo0I9fECq/DvSIBQ+APOa
 k74LB7TSaSABa/kPlGdTwgIvmG5V3kVeWcULMksKXxhABet+DaHoMi37PEpTUUwBd07t
 He9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779899895; x=1780504695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=022TXSF4NsUzKi9zlp5RDNvktdo2lu0slIiUiOkxoH0=;
 b=g8Arr3FMtft2AjT756zAgUcIru3eekXRknForEj/wFJiCJoNDr11XDuWQhGI/ij7M0
 /CIAj+R4GdRXvL4wpcWkCijhtswBxwzPE+PiC/tebpy8y7hL2xctx6O7XFe0MDRrgXJM
 PIrOjbyrIzeuATWcnQFzZhhEnYgQnr8fC4MckQRGqzWfoROAGgVSY55525gB4r8nROwr
 rnbq9VVFoEYoJK8OJhNwKCkKdfHasAEMWEmhNcKDUSMLb2cMXdXqiKCij9VRaqxO+Bpn
 V2RMhG3bAYcrYeYRMNd4xqz0M9lQjoKsgB9V+lKM7L/MguzFnt8eSNvu9VpJh7AIH9rz
 /prA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8erj8/f+p0s6iW2wtZCa42IoUdsaDXMxh/pbsCmIsUs39gtL7fR6L/Y527laajtG77AQVv7Z0Xig==@nongnu.org
X-Gm-Message-State: AOJu0YwE+hW1MlgDa9bn/iOVeWSCX5/CeJa6P1dRqfsHBKzMAxCxylzy
 YTWAOgWB4zVjJbquGHiWdGY++YkMt+KcC6QDv5vAbn/mWfUKMrnrUAQUbAHy6nq8hgA+WkRtQME
 QXuyTWH37dXIgfhexwJ9Q/PJuIL6WiNUqQF/OujWhNA==
X-Gm-Gg: Acq92OGbHlQRA+Y8ZyIh1yeDmFBpF961ikrCoZJl3o6jxSowHQJpV+I1QF7+MOBHEYy
 QlsVUbrBGQEkLdbuxS/k0/ilsyXvfG2atQEcfqawaPkM4UL6LtfezUc7ZZR/Y2o1wkj/47cauNr
 QXnomDSfaIxrmZy8t1WMgpI6qtmjPPXrFF7V9/fJrWuSo2lMq+7L1xms6l4Qy/EtMHEpyUjSkxz
 qlCa09gX8ik5VpVUWDhl6tX1RERuQey4liMtB2kppBUWfgnXt9ccqafpFlvTAPto5G1N/+i/Mmb
 28KjLshigfJnMfeddD2P0JT13bWDbkhv+85qMXl75CVlRa2AzKZy8Ms8a5RqNB66a2M=
X-Received: by 2002:a05:690e:c49:b0:660:3426:3ff1 with SMTP id
 956f58d0204a3-66034264363mr1167814d50.34.1779899895236; Wed, 27 May 2026
 09:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260518-pr-pacbti-v1-0-8932a885b03d@foss.st.com>
 <20260518-pr-pacbti-v1-3-8932a885b03d@foss.st.com>
 <875x49x8gr.fsf@draig.linaro.org>
In-Reply-To: <875x49x8gr.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 May 2026 17:38:02 +0100
X-Gm-Features: AVHnY4JAGwT71ORGpbHHm2l4eBCFUen4qv6Y0myYDHJMY-BsDCM_0dMHEMmx5BQ
Message-ID: <CAFEAcA_-tnisyn=THfXK2vDd3LSk2g1qGZCyzi-K5oSxZoYzNg@mail.gmail.com>
Subject: Re: [PATCH 3/3] target/arm: implement v8.1-m PAC support
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Torbj=C3=B6rn_SVENSSON?= <torbjorn.svensson@foss.st.com>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 27 May 2026 at 14:55, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Torbj=C3=B6rn SVENSSON <torbjorn.svensson@foss.st.com> writes:
>
> > The algorithm used for hashing is a simple XOR between the pointer
> > and the modifier using the "implementation defined" scheme.
> >
> > Signed-off-by: Torbj=C3=B6rn SVENSSON <torbjorn.svensson@foss.st.com>

> > @@ -90,6 +90,8 @@ FIELD(V7M_CONTROL, NPRIV, 0, 1)
> >  FIELD(V7M_CONTROL, SPSEL, 1, 1)
> >  FIELD(V7M_CONTROL, FPCA, 2, 1)
> >  FIELD(V7M_CONTROL, SFPA, 3, 1)
> > +FIELD(V7M_CONTROL, PAC_EN, 6, 1)
> > +FIELD(V7M_CONTROL, UPAC_EN, 7, 1)
>
> Hmm my copy of the v7m Arm ARM doesn't include these bits...

If you're looking at the v7M Arm ARM that's the wrong one.
You want the v8M Arm ARM; most recent rev is DDI0553 B.z.
https://developer.arm.com/documentation/ddi0553/latest/

-- PMM

