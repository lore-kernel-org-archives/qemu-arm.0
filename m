Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp360992njc;
        Thu, 19 Jun 2025 09:04:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVa9iM6FYv2SPfZXjg+oUOVrx5OOPs+nUYQCSeNsrgtgcLwvYjN4aDiZ1xeNvFTiXM8VYim8Z5Sa5lb7w==@linaro.org
X-Google-Smtp-Source: AGHT+IGI7z80Tj7AOOQSaGKV+MSGRd8ndIEkfURiHP2zUlKQHQdl0QKYApndOC/foCKZPywEUF9R
X-Received: by 2002:a05:651c:1993:b0:32a:7d76:2642 with SMTP id 38308e7fff4ca-32b4a3088a4mr69951691fa.2.1750349094668;
        Thu, 19 Jun 2025 09:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750349094; cv=none;
        d=google.com; s=arc-20240605;
        b=kAtiSJ7vIQ11V6n1C106sPAGz78PH5X7bqrKMpq0O5XzUg+03MfuHunwLTqpXM6vCt
         NV5EHgF80nDDE59Qjsgc/wY861a9SUi3r82a8lkIcngBesbXca/cY3nFQN3wLQVXRfkg
         wJ+jxibMk0xWu7P9BlVp40s9JlmNN9gIMYgxXFdmkSaLypcGaY+d+q9XDXvwmmNLnEl0
         VEITxJ7JM/18EP/2ESePCLOoKGddWWti/MIvgEdROhFJo3FTcDwrykmIKg36DZEeaD/E
         R68NIqbddGC1ZUJd/cI+MIlz2aMKrDBwAzTytKDDaZGofUEmkGkbvx25TI5cVOcE2M1P
         atDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:feedback-id
         :dkim-signature:dkim-signature;
        bh=4Mw7RZCpfTRj8HYjbNRaqIyYTqg2qub9w1A9PzZ8RBc=;
        fh=Pr/hiE8aQ1bjfrwbkLFNkfzXTVi/RZ4dwQ6A9DbnmF4=;
        b=A7YKXddojTSNyoClr2BAk/AkZmpdhDVPPcGXLGLDIMUrrW6QWFPR+1iQ9ripSqnq+E
         kvSwM96gUbpKJys59MkHFQ/FPvgq7lK47GfWU1QEK2sssHxq+7JYcDKmpt9TaVEFVD7l
         onO/LTIWjlvgRr4J4ij3JKasSwpRBO27KvsFDWtl+jOTswZR1cLgWet4yaZhuCMnD7LO
         5aT9HUWPsfqJO3UzRX7R/Souch9++ZzBX86qiaRoF6tHtRe9Uy8iMh47sg/ev1oYLZRc
         SDd1JnUgK6iHNJRhyh9FkitHvPmnx18/TQC1f9NRYg2w46HDqTmoivrU6hN0sHQ47371
         JNYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@alyssa.is header.s=fm3 header.b=VbeY6U2H;
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=YdlMF5rx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 38308e7fff4ca-32b8b3b8dd6si6757501fa.495.2025.06.19.09.04.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jun 2025 09:04:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@alyssa.is header.s=fm3 header.b=VbeY6U2H;
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=YdlMF5rx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uSHkY-0005k9-44; Thu, 19 Jun 2025 12:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hi@alyssa.is>)
 id 1uSHkS-0005jL-LW; Thu, 19 Jun 2025 12:04:20 -0400
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hi@alyssa.is>)
 id 1uSHkQ-0001oq-2L; Thu, 19 Jun 2025 12:04:20 -0400
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailflow.phl.internal (Postfix) with ESMTP id 43CA9200676;
 Thu, 19 Jun 2025 12:04:15 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 19 Jun 2025 12:04:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1750349055; x=1750356255; bh=4Mw7RZCpfT
 Rj8HYjbNRaqIyYTqg2qub9w1A9PzZ8RBc=; b=VbeY6U2H0uusMeI87Anwctlm7F
 6VsemNtrGpex1ryZKx1Xc9MaNgHyLSweaP9TL8vDP9lbm2HzDVd9uajYhgVYiBnP
 ZdSxoi06iiQUTRsFxLg01UYC/UHbsmKgOEROnj//8Z3rv4u1XPigmKwb0HzXExkn
 qSApkFWdRz46Hu6Nt98IINZFR14ewtO5IxPkZ178PFt+a6rjzqTJxg7FZIncW0DB
 bgpPBuX6Y2mYULVSIJEuO+UYNIONvUl9aDokbPYpOvMmjWf2rJM7MATiDLNyhkMl
 +H1PWguFkwMbALRWDFwRwozfvoaSDjdBT19lFMKM8ZodakZ6tbbLKh580eUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1750349055; x=1750356255; bh=4Mw7RZCpfTRj8HYjbNRaqIyYTqg2qub9w1A
 9PzZ8RBc=; b=YdlMF5rxpRGWF/yFAEyN1w5jwoJWQl5eCt7TUqzbTRmMl0dnhjv
 g2jVf7Q42gTdSwAZPuZHfvOqpA+PACopiJOyfV9yh3a1iGshN0/BKYzzJRBI+E8n
 dZwjmW8XWSh25Tjcgyhi0er1FeGRqCQW4RXCbarLOs5NBCNID7t/2+WDaAbRZ1GN
 DLT3rE4kXIOQbXCRJBHWwipEAHznRYr9I2VXHc9Wwr8B/mfWJhhqJdbIa5ZmUj/K
 Ya7q14Nb+1Sonm+6LNURFXJ1izEKiCsCUNvMt/Prcx7C4bL4e3zimI3dzMu9rYFJ
 +eRIxDYT9imBhq6bJdNBcOcpWy42C0Acu7g==
X-ME-Sender: <xms:_jRUaFsBlu6EE0S2ZncBtSzCNuS6L61j4h2d-6_XbP9Sy00vQ5YNvg>
 <xme:_jRUaOdx8MwaME33-vCMNGGeGUkuEMO7MAlllkx-Byjbu1ETRExBm9Opwaf63YzV3
 SujOem2_geMojJiEw>
X-ME-Received: <xmr:_jRUaIxhCpMHgr08mRCee_V33taBSDQus7vrt8qaZn2SeOxKlhmTk6gN3LTSk7k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 ephffvvefujghffffkgggtsehgtderredttdejnecuhfhrohhmpeetlhihshhsrgcutfho
 shhsuceohhhisegrlhihshhsrgdrihhsqeenucggtffrrghtthgvrhhnpeetheevudfgje
 fghefhieejudelkeeljeegvdekueeuhffhgedvveefteevgeetieenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehhihesrghlhihsshgrrdhish
 dpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehg
 khhulhhkrghrnhhisegrmhhpvghrvggtohhmphhuthhinhhgrdgtohhmpdhrtghpthhtoh
 epvghrihgtrdgruhhgvghrrdhprhhosehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgr
 iieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslh
 hinhgrrhhordhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonhes
 lhhinhgrrhhordhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdroh
 hrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhrtghp
 thhtohepmhhighhuvghlrdhluhhishesohhrrggtlhgvrdgtohhmpdhrtghpthhtohepgh
 grnhhkuhhlkhgrrhhnihesohhsrdgrmhhpvghrvggtohhmphhuthhinhhgrdgtohhm
X-ME-Proxy: <xmx:_jRUaMO8AonOOpLZlXwCJpEMHtEgq8yBHHSpDJLrNubR7kP30LTLuA>
 <xmx:_jRUaF9VySVNfRppp6LANAWjN5RrDFlUmLNXRPRBkjvImnSrCwc8OQ>
 <xmx:_jRUaMVP5489f_ogQwEyQxI06zzJ-RMvEOnJU6kgEQPchs4yMYlh9A>
 <xmx:_jRUaGeGYekoNGad-Ctdhuh63X2hmDjpf5I3kEhyXwGTbG3YzYWeRQ>
 <xmx:_zRUaBxcWO60nVfWYyVQ2c7SAbiF3SFubtToCQS6qK2B55udmayiQkII>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 12:04:14 -0400 (EDT)
Received: by mbp.qyliss.net (Postfix, from userid 1000)
 id 2DD449BA578; Thu, 19 Jun 2025 18:04:13 +0200 (CEST)
From: Alyssa Ross <hi@alyssa.is>
To: eric.auger@redhat.com, Miguel Luis <miguel.luis@oracle.com>
Cc: "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>, "maz@kernel.org" <maz@kernel.org>,
 "gkulkarni@amperecomputing.com" <gkulkarni@amperecomputing.com>,
 "gankulkarni@os.amperecomputing.com" <gankulkarni@os.amperecomputing.com>
Subject: Re: [PATCH v5 5/5] hw/arm/virt: Allow virt extensions with KVM
In-Reply-To: <01ab0b6e-ccd5-4465-98c0-70b8ec2ac87a@redhat.com>
References: <20250527062534.1186004-1-eric.auger@redhat.com>
 <20250527062534.1186004-6-eric.auger@redhat.com>
 <875xgutpuh.fsf@alyssa.is>
 <D3582F3A-B07A-4F05-827C-B030617B77EA@oracle.com>
 <efd4cb44-3d63-43b5-9568-1263ccf7566a@redhat.com>
 <0EA149E9-D637-4BC0-A10F-7B896581A914@oracle.com>
 <01ab0b6e-ccd5-4465-98c0-70b8ec2ac87a@redhat.com>
Date: Thu, 19 Jun 2025 18:04:11 +0200
Message-ID: <8734bvyays.fsf@alyssa.is>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Received-SPF: pass client-ip=103.168.172.141; envelope-from=hi@alyssa.is;
 helo=flow-a6-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TCyW6B7w9qck

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Eric Auger <eric.auger@redhat.com> writes:

> Hi,
>
> On 6/17/25 5:50 PM, Miguel Luis wrote:
>> Hi Eric,
>>
>>> On 17 Jun 2025, at 15:41, Eric Auger <eric.auger@redhat.com> wrote:
>>>
>>>
>>>
>>> On 6/17/25 5:23 PM, Miguel Luis wrote:
>>>> Hi Alyssa,
>>>>
>>>>> On 17 Jun 2025, at 14:17, Alyssa Ross <hi@alyssa.is> wrote:
>>>>>
>>>>> Eric Auger <eric.auger@redhat.com> writes:
>>>>>
>>>>>> From: Haibo Xu <haibo.xu@linaro.org>
>>>>>>
>>>>>> Up to now virt support on guest has been only supported with TCG.
>>>>>> Now it becomes feasible to use it with KVM acceleration.
>>>>>>
>>>>>> Also check only in-kernel GICv3 is used along with KVM EL2.
>>>>>>
>>>>>> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
>>>>>> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>>>> Hi!  From what I can tell, this will produce an error on hosts that
>>>>> don't support nested virtualization when QEMU is invoked with -accel
>>>>> kvm:tcg
>>>> I didn=E2=80=99t know '-acell kvm:tcg=E2=80=99 could be used as a fall=
back mechanism between
>>>> acceleration modes. May I ask whether do you manage the =E2=80=98-cpu=
=E2=80=99 type for =E2=80=98-accel
>>>> kvm:tcg=E2=80=99 with cpu =E2=80=98max=E2=80=99 ?
>>> Does it exist?
>>> qemu-system-aarch64: -accel kvm:tcg: invalid accelerator kvm:tcg
>> Maybe Alyssa is referring to =E2=80=98-M virt,accel=3Dkvm:tcg,virtualiza=
tion=3Don,gic-version=3D3=E2=80=99 ?
>>
>> The above didn=E2=80=99t triggered any error. Anyhow if the above does w=
hat Alyssa=E2=80=99s saying=20
>> we would just be missing the check for || !tcg_enabled() in this patch, =
I believe.
>
> After discussion with Paolo, the lack of the CAP should be detected
> earlier in kvm_init/kvm_arch_init to allow the fallback to TCG.
> in target/arm/kvm.c kvm_arch_init() some generic caps are checked but
> none of them are related to machine settings and this code is virt arm
> machine agnostic.
>
> I checked and adding
>
> =C2=A0=C2=A0=C2=A0 if (object_dynamic_cast(OBJECT(ms), TYPE_VIRT_MACHINE)=
) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VirtMachineState *vms =3D VIRT=
_MACHINE(ms);
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (vms->virt && !kvm_arm_el2_=
supported()) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_=
report("KVM does not support nested virtualization");
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =
=3D -EINVAL;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0 }
>
> at the end of the function would do the job. But as I said previously
> this is not done for other virt arm machine options that are accel
> specific or require special KVM caps (secure, mte for instance) so it
> would be a change in the approach.

Right =E2=80=94 if it's not done for other options it doesn't need to be do=
ne
here either; I wasn't aware of that.  It would be nice if QEMU worked
differently, but that's certainly not in scope of this series.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRV/neXydHjZma5XLJbRZGEIw/wogUCaFQ0+wAKCRBbRZGEIw/w
oslFAQCwbeDiKhVAP4TiTUfAmPy6zAeumOa/B93qy1GIZYC1/wD/Uc2goZzJ09nD
SpvhOfwnYAFooTtVuv8KH3u+WGETwQI=
=Be5P
-----END PGP SIGNATURE-----
--=-=-=--
