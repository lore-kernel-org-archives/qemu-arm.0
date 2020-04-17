Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp497525lfm;
        Fri, 17 Apr 2020 06:49:43 -0700 (PDT)
X-Google-Smtp-Source: APiQypKyAV2Jy9n+7lnauE1OS75ZgIndQgaA75ryvsn3ve2xPXxGaa6KFUWkz8j8J6WcM6+s+NAT
X-Received: by 2002:a25:6b0b:: with SMTP id g11mr5765047ybc.425.1587131383382;
        Fri, 17 Apr 2020 06:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587131383; cv=none;
        d=google.com; s=arc-20160816;
        b=O3TbI3Acwmf2U8IifRiZ7URq+MQQrb10EpC5XpS4RtKdWtGWYyxGXW7WOCl13Aul4y
         uQjXwP4g1QDgtonPsfatrnAg92uCp43wTzK/Mv/jCD/bN4k4ntLfdp/xLEkqqhE0r6t8
         9/Z/fQnilqtIYwXJaojA5uK07/KJhU4J+JllEMRdAPcJAG6j4Ahlxv46Xo5dmoe1EQJT
         O6nNtLnzlUbxYjFEPZHBHyB+ZT9Mn5TsWXHs3Guk9xG81x1Ll8/EGpA7PtwvoUa9ga7g
         1FgoUAQU9T2ezxBE/J/j4iQkJxbfhGax42GiHjRAxC23lSsVrNIKEQ5z625RMpqZeehV
         HSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=/v5Tuo5D01mrVhyeGnt9r0bZED4rM9BN9Ltazs7guH4=;
        b=rIMOC72K5W2tMmPNrNN/UjoMM0IXMUtR07wiZhNAD8QygMPTQ1FPzgel9//hcZiolO
         mwQ1kh13t/B+QY7NogtlJCfv5UfaJ1v70ywNa0eF3LUqEuRU5reVLJUMgvsi1V9sHukA
         it6BBW/qt/yH35RrYWNZca+bgi7HVy1IqKavR1fKqPxs5ByhvLl06sewxJp5f5uzDbgb
         Xs0WF9WzX4TfCs33SL/JD+EhZYjNXBrwhmEu+/Ne/4/wdd/ukpYud5ZiiIauUYh0Y/qT
         DiDIMeJzErKgq+QSoIOlp85vCeuHCtx3/Sz6olurfJrxsZAOST5qNKKaMIKmvcXOU7ZZ
         WKPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A+rB9Cp3;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id p7si21198912ybg.83.2020.04.17.06.49.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Apr 2020 06:49:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A+rB9Cp3;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587131382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/v5Tuo5D01mrVhyeGnt9r0bZED4rM9BN9Ltazs7guH4=;
	b=A+rB9Cp32lrQEa5DyjoJjVo2AxvlkuKjqN2QOZ4bVWMt4xK2KwFjLoDBCmtCkZdj8RQDHc
	mDPNB4YkBmSvwrDDsg3GD/YhpUX5MzRgl8FnsyV6Kn0NbnQCHxwe53G56pYU72uR+nN1uZ
	E9lHU6tq7FT5blcIEJKRF4Lc/e8ngKg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-ozAw18zAMeSfQvd_s9e7Xg-1; Fri, 17 Apr 2020 09:49:41 -0400
X-MC-Unique: ozAw18zAMeSfQvd_s9e7Xg-1
Received: by mail-ed1-f72.google.com with SMTP id u11so760000edy.17
        for <alex.bennee@linaro.org>; Fri, 17 Apr 2020 06:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5V7yavyfZ0HM3zUpT1F2jPJ2A6hFO+XG3RXrFUzY6h4=;
        b=ZGEhMO+7ApkJi2oUQw8iQZOh9od5VAvmsl1+hXM5kQ1qYGiEHV58fHpIGggY1zd+qR
         5lvfv/MgyW/xcghlOiFZXe8RxYbnY+VEVOD/+ufoysu4oXFT92IgTTu68AWHBEs/XHKi
         u9LNf7LZEG9H1hRJXW2KUx0Lug41IzFDonBQsF56SE4NjRWowWf0TgVU081zFa1NGjCj
         UaR+jSuBlTU+2daqtA38W1k8/iY5Ia+CbH5x5xtz1w+3Q7HE9xdU3xxrHXiWUtyFtN0l
         EOfLn0E5BKXFQgMuWLeUwWa6CWAEij9zccwSQxCsaTewxI9Ya2KGOeJyAx/3nHOmnERo
         IFgQ==
X-Gm-Message-State: AGi0PubFs5gEWmIzM8LPdw0+9x5kQjysxoCWyZN8TtmW48QXVC5tRFxz
	AJnho8R77CAcsFCDwwdZInmF+2c9A18W/PSY41rYp2nrrFAVQufyrfusOHDLq2BQHGCcIfO6K0/
	saz1Jb0/ZcYmS5HFL
X-Received: by 2002:a17:907:40f2:: with SMTP id no2mr3110752ejb.41.1587131379833;
        Fri, 17 Apr 2020 06:49:39 -0700 (PDT)
X-Received: by 2002:a17:907:40f2:: with SMTP id no2mr3110739ejb.41.1587131379533;
        Fri, 17 Apr 2020 06:49:39 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net. [83.42.57.116])
        by smtp.gmail.com with ESMTPSA id q1sm3420124ejf.42.2020.04.17.06.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 06:49:38 -0700 (PDT)
Subject: Re: [PATCH v3 03/19] target/arm: Restrict DC-CVAP instruction to TCG
 accel
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm-devel <kvm@vger.kernel.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-4-philmd@redhat.com>
 <f570579b-da9c-e89a-3430-08e82d9052c1@linaro.org>
 <CAFEAcA8K-njh=TyjS_4deD4wTjhqnc=t6SQB1DbKgWWS5rixSQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5d9606c9-f812-f629-e03f-d72ddbce05ee@redhat.com>
Date: Fri, 17 Apr 2020 15:49:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8K-njh=TyjS_4deD4wTjhqnc=t6SQB1DbKgWWS5rixSQ@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: PcUcoXH/fpE7

On 3/16/20 9:11 PM, Peter Maydell wrote:
> On Mon, 16 Mar 2020 at 19:36, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> I'm not 100% sure how the system regs function under kvm.
>>
>> If they are not used at all, then we should avoid them all en masse an n=
ot
>> piecemeal like this.
>>
>> If they are used for something, then we should keep them registered and =
change
>> the writefn like so:
>>
>> #ifdef CONFIG_TCG
>>      /* existing stuff */
>> #else
>>      /* Handled by hardware accelerator. */
>>      g_assert_not_reached();
>> #endif

I ended with that patch because dccvap_writefn() calls probe_read()=20
which is an inlined call to probe_access(), which itself is only defined=20
when using TCG. So with KVM either linking fails or I get:

target/arm/helper.c: In function =E2=80=98dccvap_writefn=E2=80=99:
target/arm/helper.c:6898:13: error: implicit declaration of function=20
=E2=80=98probe_read=E2=80=99;
      haddr =3D probe_read(env, vaddr, dline_size, mem_idx, GETPC());
              ^~~~~~~~~~

I'll use your suggestion which works for me:

-- >8 --
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -330,8 +330,20 @@ static inline void=20
tlb_flush_by_mmuidx_all_cpus_synced(CPUState *cpu,
  {
  }
  #endif
+
+#ifdef CONFIG_TCG
  void *probe_access(CPUArchState *env, target_ulong addr, int size,
                     MMUAccessType access_type, int mmu_idx, uintptr_t=20
retaddr);
+#else
+static inline void *probe_access(CPUArchState *env,
+                                 target_ulong addr, int size,
+                                 MMUAccessType access_type,
+                                 int mmu_idx, uintptr_t retaddr)
+{
+     /* Handled by hardware accelerator. */
+     g_assert_not_reached();
+}
+#endif /* CONFIG_TCG */

  static inline void *probe_write(CPUArchState *env, target_ulong addr,=20
int size,
                                  int mmu_idx, uintptr_t retaddr)
---

>=20
> (1) for those registers where we need to know the value within
> QEMU code (notably anything involved in VA-to-PA translation,
> as this is used by gdbstub accesses, etc, but sometimes we
> want other register values too): the sysreg struct is
> what lets us map from the KVM register to the field in the
> CPU struct when we do a sync of data to/from the kernel.
>=20
> (2) for other registers, the sync lets us make the register
> visible as an r/o register in the gdbstub. (this is not
> very important, but it's nice)
>=20
> (3) Either way, the sync works via the raw_read/raw_write
> accessors (this is a big part of what they're for), which are
> supposed to just stuff the data into/out of the underlying
> CPU struct field. (But watch out because we fall back to
> using the non-raw read/writefn if there's no raw version
> provided for a particular register.) If a regdef is marked
> as NO_RAW then it means there is no raw access and we don't
> sync the value.
>=20
> (4) I think that in KVM mode we won't deliberately do
> non-raw accesses, and a quick grep through of the places
> that do 'readfn' accesses supports that.
>=20
> thanks
> -- PMM
>=20
