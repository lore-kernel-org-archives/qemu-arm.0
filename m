Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp533644lfm;
        Fri, 17 Apr 2020 07:19:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypI35n7min35V1562eqitse4aR/GiObtr0D907o417p8MoWYnKUX4TPb1KMWnflAjZRSG6wt
X-Received: by 2002:a25:aaa4:: with SMTP id t33mr5975139ybi.324.1587133182450;
        Fri, 17 Apr 2020 07:19:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587133182; cv=none;
        d=google.com; s=arc-20160816;
        b=HvvHByvnaFbFBbm1QCSpUvgPA37ODFI4aY+Tim3WSiHU+3GkKDFNIYB1FhUSAjkT3V
         V8IuqtxHU80RpYAORZrRC+LHySt5iH6MDliGfGeu24+Ow9yGC1Oxd9qUH+HRT+iPJPfF
         2lOce3cBxLe0xndO3mBQhQC0Zaxp5J+V74iXhRnaydydSiQeIQbMuo8WJEiqn+Fgjfwp
         a9Fp1leRoNgSFoa+yZ3z4eCI0R4SCT3852ww0ZXs1lXeGNcE31aBnhHKwmA+WkxT3ERL
         PhQs0BcscCNvaMn5Y1Xgb/8SQ9ClsNkj7mhtUItJU9nwyu1zkt+i1S8yf/7iACKmuT9d
         y40A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=4r74DZJi9yFkPK/p+/NY16Ui+26N7oMG9UwwN8a5z2Q=;
        b=WJ8esmIbmqvPWyqMszCBW7aRx9rzhvM0tSE3c3GepwbFyRUVgTzDLTYnukMdl83loT
         aZFV7K/ZaIn6ehO1XmBhsUK2T/f0qjIwOC7PhZjPlF3uDIGdpHP6b4K+d9sAZvZcSi7v
         U9dHppvJABiYjGrOULGNGmYMyk5d09x5g62V0o6iL1RH4tMNs7xs8pO0erJjpHrkD/uz
         jEWkXvieC/p+aKnjyzAuzxCkaradq4XD2Hq5wsGkOuaCXoScfzv6fbST2PR3urQLN2zJ
         amuJfeNq982zSjjyvGbz+lPbwgSuR1KTu9I2BPPcgpjCTYPmNbCfKeMxJu1VQX7YQF+3
         q3GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WrJ1x7Fq;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id a8si20553386ybc.285.2020.04.17.07.19.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Apr 2020 07:19:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WrJ1x7Fq;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587133181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4r74DZJi9yFkPK/p+/NY16Ui+26N7oMG9UwwN8a5z2Q=;
	b=WrJ1x7FqLvDTafDtpXb1bnG+yoiioKs0HbQ1ZAJzdKXJN6qyAUoNgLR1VMERRLMFnI0+1t
	tCCF2Lilz8mVm9JoHOniTeipZ7ZWwekrNhEuNqLxisZECYQHi1y4/Y5sID/UHaAbtn2ZWK
	LxvZFsmJc7ubbuIT6kkDwzOdOYPXkUY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-Mx1RfVOvPum0XSUJdHzKhg-1; Fri, 17 Apr 2020 10:19:40 -0400
X-MC-Unique: Mx1RfVOvPum0XSUJdHzKhg-1
Received: by mail-ed1-f72.google.com with SMTP id a10so815169edm.3
        for <alex.bennee@linaro.org>; Fri, 17 Apr 2020 07:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DAdieQ2sXt/NeBUDGNTNawrWk821Y/E983QoU7SMcFs=;
        b=m/PJPG8urKuZc6aFwx/3BbfvmX825av3gCRVHp7fRvAE9I3DF9nTGc0lM0EB8YsxV5
         nvFaIiQ8+dkMlObNQcrKFku+AzQ67o9cAD90P1lkHCCG1juJ53yIZRpwD14R4nNYRkda
         FaaN27MMMIJL2fMPYHUfL8UShqOdDUMOOA9SuAgIoDHLIwBusemh+9mQV+VWXurxTZ1+
         VkgpYGc+vSeM+GNjEB9lAWCAYeFpUxY6LV5ZLE2XYux3A5U/FX0Jy3dBWKS8NmBnXgiX
         /EKlXYKch0dewD673B86IROHB8CVDWc6aycQFZdUwXPndO8rSzzS68L3VvJjMMmQrSY+
         A7AA==
X-Gm-Message-State: AGi0PubHi4NhDtu+WJbj7nOCJZjgz1VFNBG0KHmmHaje+3tlHlSlhv+M
	Q6QcutQ8jkwWMLOvsyoBjc5i/pOeE48XZBn+SoYBHyfgcph1QqzsDvZtvg9mO2qcFcW91lyu8L3
	Pnq1qzCUBErNfsdaC
X-Received: by 2002:a50:9dc9:: with SMTP id l9mr2672148edk.39.1587133178646;
        Fri, 17 Apr 2020 07:19:38 -0700 (PDT)
X-Received: by 2002:a50:9dc9:: with SMTP id l9mr2672131edk.39.1587133178375;
        Fri, 17 Apr 2020 07:19:38 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net. [83.42.57.116])
        by smtp.gmail.com with ESMTPSA id l91sm2911342ede.64.2020.04.17.07.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 07:19:37 -0700 (PDT)
Subject: Re: [PATCH v3 03/19] target/arm: Restrict DC-CVAP instruction to TCG
 accel
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, kvm-devel <kvm@vger.kernel.org>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-4-philmd@redhat.com>
 <f570579b-da9c-e89a-3430-08e82d9052c1@linaro.org>
 <CAFEAcA8K-njh=TyjS_4deD4wTjhqnc=t6SQB1DbKgWWS5rixSQ@mail.gmail.com>
 <5d9606c9-f812-f629-e03f-d72ddbce05ee@redhat.com>
 <CAFEAcA-4+Jcfxc5dax8exV+kBJKYEnWZ2d-V1A6sm6uJafZdPg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <16bd73d1-ec39-7da6-77c3-a18eea5992e0@redhat.com>
Date: Fri, 17 Apr 2020 16:19:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-4+Jcfxc5dax8exV+kBJKYEnWZ2d-V1A6sm6uJafZdPg@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: Eya536slJwrG

On 4/17/20 3:54 PM, Peter Maydell wrote:
> On Fri, 17 Apr 2020 at 14:49, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
>>
>> On 3/16/20 9:11 PM, Peter Maydell wrote:
>>> On Mon, 16 Mar 2020 at 19:36, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>> I'm not 100% sure how the system regs function under kvm.
>>>>
>>>> If they are not used at all, then we should avoid them all en masse an=
 not
>>>> piecemeal like this.
>>>>
>>>> If they are used for something, then we should keep them registered an=
d change
>>>> the writefn like so:
>>>>
>>>> #ifdef CONFIG_TCG
>>>>       /* existing stuff */
>>>> #else
>>>>       /* Handled by hardware accelerator. */
>>>>       g_assert_not_reached();
>>>> #endif
>>
>> I ended with that patch because dccvap_writefn() calls probe_read()
>> which is an inlined call to probe_access(), which itself is only defined
>> when using TCG. So with KVM either linking fails or I get:
>>
>> target/arm/helper.c: In function =E2=80=98dccvap_writefn=E2=80=99:
>> target/arm/helper.c:6898:13: error: implicit declaration of function
>> =E2=80=98probe_read=E2=80=99;
>>        haddr =3D probe_read(env, vaddr, dline_size, mem_idx, GETPC());
>>                ^~~~~~~~~~
>=20
> IN this particular case, DC CVAP is really a system insn rather
> than a 'register'; our register struct for it is marked up as
> ARM_CP_NO_RAW, which means we'll effectively ignore it when
> running KVM (it will not be migrated, have its state synced
> against the kernel, or be visible in gdb). If dccvap_writefn()
> ever gets called somehow that's a bug, so having it end up
> with an assert is the right thing.
>=20
>> I'll use your suggestion which works for me:
>=20
> Your suggested patch isn't quite the same as RTH's suggestion,
> because it puts the assert inside a stub probe_read()
> implementation rather than having the ifdef at the level
> of the writefn body. I have no opinion on whether one or
> the other of these is preferable.

I'll let Richard modify the writefn() bodies if required, as he=20
understand what they do :)

Btw since we have this rule:

obj-$(call lnot,$(CONFIG_TCG))  +=3D tcg-stub.o

I'll use the following patch which is less intrusive:

-- >8 --
index 677191a69c..e4bbf997aa 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -22,3 +22,10 @@ void tb_flush(CPUState *cpu)
  void tlb_set_dirty(CPUState *cpu, target_ulong vaddr)
  {
  }
+
+void *probe_access(CPUArchState *env, target_ulong addr, int size,
+                   MMUAccessType access_type, int mmu_idx, uintptr_t=20
retaddr)
+{
+     /* Handled by hardware accelerator. */
+     g_assert_not_reached();
+}
---

>=20
> thanks
> -- PMM
>=20
