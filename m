Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4659CCA5FA1
	for <qemu-arm@archiver.kernel.org>; Tue, 29 Sep 2026 05:30:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBQPa-0005to-Mi; Tue, 29 Sep 2026 01:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBQPX-0005sU-Pg
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 01:29:51 -0400
Received: from mail-ed2-x0f.google.com ([2a00:1450:4864:33::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBQPS-0001qb-QN
 for qemu-arm@nongnu.org; Tue, 29 Sep 2026 01:29:49 -0400
Received: by mail-ed2-x0f.google.com with SMTP id
 4fb4d7f45d1cf-6aaf10bf094so4955887a12.2
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 22:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790659785; cv=none;
 d=google.com; s=arc-20260327;
 b=L/bUQbqzaK6L/Cy/MDSrD/uG/wTxZKLWibsjqNYx58m9JkA/3fpPYIXcjcHIiH68O2
 4QOALmh4MhMq9l6p7smOOKNzZ+Sdzl4DplC4zDMtHIrXgotaZDsIV4vWoHROWFxSTKKR
 IZQ13FYuE/hldquF7ZXDqWJTfvYQQRHXlOmsm2T8FvOuuwn3w078mpz7vu3kYL8idRVo
 xtMzc+vsyDFeUryZgAt+UZAYuJ8/J38USeCY5TwyKkHWwUNayjnZlLyOy1F7RXjX/GlO
 ESIhU4ju2s/eYsgihkOxvgqWHslAMoj60ssAJVoRk7JwPy9Z8USRfC73NeKLbL6E4W8Y
 8OWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=xV5ttRcpYOm4eTqxOEwdri0P3mUYdyXck72/42+CiY0=;
 fh=910/BYM5mHMS+YB+CJeGOZQzm+X4qAhIzE4NwmuInxA=;
 b=GcC5UQvL2DpaFwaW5DEsLOHTHZdplZlm90EyAoJqNBbi9K4wKNjpGvs7f13KbmCz08
 FAMt7tVFvjcmULkqvbMSbgBQVzb07QZzaXDF/aJYikXTqENeC3OI6FnUR4McDOW9hgKQ
 agTiJqx4JRXqriyCkx6ZZVUuXaiHDsEjCDUBFYoRwATJBNkJpzTcr/H5GYcUWn+9xc6p
 zo8TC6+ViZqR2zfvKP7AacHH5TBaRMZfvefq0eGAFuTiOqrSV73zBI4MXZoRE64svtFm
 FaOHDj3oWJuMr2ySZcRTF8S7NleXTmDrki2NU/CSfljYp7ctl8Ia5K6GcpjvGo7XySKO
 4Fsg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790659785; x=1791264585; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=xV5ttRcpYOm4eTqxOEwdri0P3mUYdyXck72/42+CiY0=;
 b=BgTyLnyUnvvMBYn9DZ+sHxS2v5VhPjKsSzIBIVlZiXq8+bM+SMK/5UpsTI7e4zzj4B
 nfuoQ/fGI+dFt29CUsqlQ6K1b7tgyuBbPBlUvWaMHjTD3qwXSvQkPaHTPFDjKybdA04j
 6JN06BcWsbTHsvoFTdyYWMPEikCNJzHxn233weY4ERJliaAoOS69mYlhPlEKKUQw/kro
 Sz8Kj2J11PgjlMX9Bu6RxbhOP6ULc+rtsKPFhQolj1CgljQE6q0ZBZS7j0xBdDxCO6rt
 K/jbZbnB7/FfiZa9sZdYnXPc6P7pTWcti3UoQ9N377sAMc+ejJn0lHdlPuF9NEnrYu4H
 kOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790659785; x=1791264585;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xV5ttRcpYOm4eTqxOEwdri0P3mUYdyXck72/42+CiY0=;
 b=fidxGvBNdJtlN/0ig5Ov+Wcq4xTBi63Rauz9SCJ/2x6s6g5in2zpiodcud3J7Egv5s
 8ZnKRTp2ctA8h76k139tECA+fg7X7vyLo+M4XrucTuSVj/KBVMCKaxS65mHn38QpxyTb
 VYUWrmWWLGhin5HPr7zvrGvh53a8pAMBYiT4FEn3U9VESv+ACdIinHeZx8tMCXtWFk/0
 Yp98e1bO3c5D0A1/xVhbiWQN4hy3zSNrcBuI/KAFH+larFX8QrdAiBgTFaF9b+LcLXUL
 a5FX3UfcXpl5Ql0WyHPaTOXkTsfyzrlyiveJmROcV9TFcphIXGvhibDB7X5rJ8CIyIXi
 OltQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByam1fmQbfqQD75W97nQNRoKPavoZzoLBSHQ3PaI847qW0buVRIInRZ58XyNXVJT0X4ePdX8s+vwQ==@nongnu.org
X-Gm-Message-State: AFq9FYLgy3rFytNpUIpkb7tWkPa6YeKz7nabzzsRRBK92+q1gWkir/0p
 1fsFZnSaANJU4xJnZyH9sJVWq0GJ109wVRIgD7IgMl97CNQARLJ4xwokMJlF7FYc9C20ssPx5mL
 cT58+435TM4lEfXKYsJwwCDz3zokx6+0=
X-Gm-Gg: AYBFou3bbF6skeibOytij1mG0RMdoNj8P1KdOM0vTuO1hEyQ1AAYrXAmfE/3ui7/rTu
 hlms976cxQfsdILGmJmUNt0owR9VD/NAKmZWPk1XZXt62d9IbWmfwDP0UWPmidDiHda/9jP/dHq
 h7TZQxx47I+8IW3ojrhAR0cVQMvams2vSHYEvz823S+ncK8h63n8nbs3w4V2tDmrNCzGSUAklOG
 1VOAqE8IayTflpCKraW31vHZL7011zVWsYZWWopjznrosmeWnEe2Q9PO4/9Ljd9KuI50lWjWj6x
 uQy5e5eUenKYsuciKupxvGVFIycGVI05TH2vqxL9vYb3D/slAgtTma+ReYNP59eqIg==
X-Received: by 2002:a05:6402:1d4d:b0:6aa:734b:1a33 with SMTP id
 4fb4d7f45d1cf-6aac90a25d0mr12269867a12.45.1790659784584; Mon, 28 Sep 2026
 22:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260928052051.251-1-luoyonggang@gmail.com>
 <20260928052051.251-5-luoyonggang@gmail.com>
 <0c156b42-3476-4ac3-bd29-f4e878108f0c@oss.qualcomm.com>
In-Reply-To: <0c156b42-3476-4ac3-bd29-f4e878108f0c@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Tue, 29 Sep 2026 13:29:31 +0800
X-Gm-Features: AclHuK-hBYjfdyUtFue77G6Rrnmj0ZHq-R9b0MFpLMGayDCYUEm7imkFjKaFk54
Message-ID: <CAE2XoE9VC6YfqsOQBM_KLrdaKpU-=bD9CscCDGi63EsQt-EhFg@mail.gmail.com>
Subject: Re: [PATCH v2 04/24] target/rx: name guest trap numbers RX_EXCP_*
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Helge Deller <deller@gmx.de>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Weiwei Li <liwei1518@gmail.com>, 
 Brian Cain <brian.cain@oss.qualcomm.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Chao Liu <chao.liu@processmission.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>, 
 Nicholas Piggin <npiggin@gmail.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, Eric Farman <farman@linux.ibm.com>,
 qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, 
 Glenn Miles <milesg@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, 
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:33::f;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Sep 29, 2026 at 1:26=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 28/9/26 07:20, Yonggang Luo wrote:
> > Add RX_EXCP_* in cpu.h for the guest trap numbers stored in
> > cs->exception_index.
> >
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >   target/rx/cpu.h | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> >
> > diff --git a/target/rx/cpu.h b/target/rx/cpu.h
> > index 64ba48a7329..521e494172e 100644
> > --- a/target/rx/cpu.h
> > +++ b/target/rx/cpu.h
> > @@ -71,6 +71,16 @@ enum {
> >       NUM_REGS =3D 16,
> >   };
> >
> > +/* Guest trap numbers. */
> > +enum {
> > +    RX_EXCP_PRIVILEGE_VIOLATION =3D 20,
> > +    RX_EXCP_ACCESS =3D 21,
> > +    RX_EXCP_ILLEGAL_INSTRUCTION =3D 23,
> > +    RX_EXCP_FPU =3D 25,
> > +    RX_EXCP_NMI =3D 30,
> > +    RX_EXCP_INT =3D 0x100,
> > +};
>
> Thanks for splitting in a previous patch, but we want to
> add the definitions and replace the magic values at the
> same time (i.e. the changes in rx_cpu_do_interrupt() in
> the next patch go here), but also s/21/RX_EXCP_ACCESS/ in
> update_fpsw, etc...).

Do you mean add a single enum value in a single commit? so it can
be tracked clearly.
So when RX_EXCP_ACCESS is introduced. all usage of 21 will be replaced with
RX_EXCP_ACCESS?



--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

