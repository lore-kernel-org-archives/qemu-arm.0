Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1332570lfe;
        Tue, 17 Mar 2020 03:05:35 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vulbAFAIF2SEDwvs9qJCxBt5AKb6xc7FtXzfLvEIcrMm/dWfS+OCI8f4k3a95DDhAvoeWEv
X-Received: by 2002:adf:e511:: with SMTP id j17mr5459545wrm.25.1584439534781;
        Tue, 17 Mar 2020 03:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584439534; cv=none;
        d=google.com; s=arc-20160816;
        b=Bv+o8pRKd9Ev6EsaQquNdmx8Vg3IUsoiAhzr4i5uqOAT5wgg7LNUydL9USqIx5wNnp
         6PVnW1jHQdCukzWDA7ABniyDpEa7deWt2YLiyfWzaeAwGM0gKFfA3n1zW2XwwuUCS7oz
         B5yjASac3AaK46ZVp4epFyIiVZQAjxCaNiQFDWyDaSpd0nl3tjwk5/Qwu5xmfLLmQnY1
         fpnzwU3fT/RMVlMaRIS+oC8XMgqNJrtQzkr1hofXe/HRI+tsmktf++HkgTOYL7Nl90T+
         Qkv0/Mgj6FQbrwy7ETfZmnNxcbajJDSsTeWECkUs5d6z4tIwKo7sRwwEUcICmdvjuQhS
         S/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=rRy5gbVbBssfqnTE4/fNCnzS8878j1YS+ngVXy5RyKY=;
        b=F93aYYWo7vH0CQ69wmvXlwUNFjgqVWGlPEg/QZIymmx3fx1cCbGJWrBoTaf/sGB3LS
         cD4I8P4JhZvOESakbJ821puEyVeHgsJaOQChMob+sgN9fxOZYU9n1Y5uEirz7Xwsx5yt
         3OTSfqM6is5z2Gi68SdesXtZ1jn6FyWTzQwT0ZAZJIHZ9SQc5MxX/GbAdVBoxed5pQ0F
         jBEJXLpQouwSRTsywZlfOZgOvMDUh538d+E85GuRyXP4nrdLBjkEavYqE5UWtf2jd4+h
         boIFosuZWnWJ4UpS1MSWBtG2UYFkrlhLLe6nfikQwyMCyrjtLQDpHYDDfEuK6JqZg3os
         NDiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e7xp2v+H;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [216.205.24.74])
        by mx.google.com with ESMTPS id q2si2324431wrn.419.2020.03.17.03.05.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2020 03:05:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) client-ip=216.205.24.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=e7xp2v+H;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584439533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rRy5gbVbBssfqnTE4/fNCnzS8878j1YS+ngVXy5RyKY=;
	b=e7xp2v+Hi9fX8/hVwVPmFAZeOzEbCQSaKb+o+LF8rrGHkmh44awd8a48Xkmv+I7YiTAi9J
	DfNLt364H7Z5cOUy50qnX5lKApok0uCcqpJwJqhLrcW6N1/0jDAzW7qPJp5dqzjGJff06r
	6fNUQcjWpe36wUQCrbg+oYjcme/iq8k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-_Mu50P-XNhqW4lFtIeOYLA-1; Tue, 17 Mar 2020 06:05:31 -0400
X-MC-Unique: _Mu50P-XNhqW4lFtIeOYLA-1
Received: by mail-wm1-f70.google.com with SMTP id a11so3610358wmm.9
        for <alex.bennee@linaro.org>; Tue, 17 Mar 2020 03:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mbViYDInhtzhzOnjgxz8a5DkEbv4zhEsie9K0pgxCUE=;
        b=aEzmLCcGuE4gxdKBOW29pbJ2NkGoojj+XouR3TSIOucIe78Q5WqJZ1DN2paOD6Bvb8
         3LF2PBMopFyoN6lreg5mjMpYv09N+AuCQPzHRoo0TuGleUk+rbgMOYfHaG711PMo/2Rd
         vshb+6/S95h2abAhqh/2ovMd7yM/HBufK6q5E5R6WGxLzlt3EZrSd3xxOv394U8CQov4
         dHkHVEWAb/BaxyBOcxiJTmY9JwC9Th7u0LVBUiCZBH5efRWkyCe4DxJMRkqY3i4ZoIH5
         xlmBDo0VZan0UnbdrqQ7h8CEwFToXwYC2kLII5/mDMGuBKevNLCElsYKrqDj8sOXqY5G
         tO/A==
X-Gm-Message-State: ANhLgQ3bt1+xabKPJE0ypgAyKuRRck2QfqBxA7XQLsL24hp0ct/L+S9I
	3qz96+rXKefA+4GalSYqJdI158wQLgWkkshFGFnKv7N2+lDjMApszoqHFurl5EeXl5keZ1bVqyP
	RczDCoXYFiN8dzF+T
X-Received: by 2002:a7b:c354:: with SMTP id l20mr4408347wmj.40.1584439530591;
        Tue, 17 Mar 2020 03:05:30 -0700 (PDT)
X-Received: by 2002:a7b:c354:: with SMTP id l20mr4408243wmj.40.1584439529181;
        Tue, 17 Mar 2020 03:05:29 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.34] (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id h15sm3608071wrw.97.2020.03.17.03.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 03:05:28 -0700 (PDT)
Subject: Re: [PATCH v1 13/28] target/i386: use gdb_get_reg helpers
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
References: <20200316172155.971-1-alex.bennee@linaro.org>
 <20200316172155.971-14-alex.bennee@linaro.org>
 <9ecb1d64-c447-5c0d-0280-ce9cd6537fa6@redhat.com>
Message-ID: <59d09313-963f-ffaa-a069-f89e597ac28f@redhat.com>
Date: Tue, 17 Mar 2020 11:05:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9ecb1d64-c447-5c0d-0280-ce9cd6537fa6@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: WMpVJCzJAS95

On 3/17/20 10:53 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 3/16/20 6:21 PM, Alex Benn=C3=A9e wrote:
>> This is cleaner than poking memory directly and will make later
>> clean-ups easier.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> ---
>> v7
>> =C2=A0=C2=A0 - remove stray space
>> =C2=A0=C2=A0 - fixup the floatx80 set/get routines
>> ---
>> =C2=A0 target/i386/gdbstub.c | 27 +++++++++++----------------
>> =C2=A0 1 file changed, 11 insertions(+), 16 deletions(-)
>>
>> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
>> index 572ead641ca..e4d8cb66c00 100644
>> --- a/target/i386/gdbstub.c
>> +++ b/target/i386/gdbstub.c
>> @@ -98,26 +98,22 @@ int x86_cpu_gdb_read_register(CPUState *cs,=20
>> uint8_t *mem_buf, int n)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return gdb_get_reg64(mem_buf,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 env->regs[gpr_map[n]] &=20
>> 0xffffffffUL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 } else {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 memset(mem_buf, 0, sizeof(target_ulong));
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return sizeof(target_ulong);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 return gdb_get_regl(mem_buf, 0);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return gdb_get_reg32(mem_buf, env->regs[gpr_map32[n]]);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (n >=3D IDX_FP_REGS && n < IDX_=
FP_REGS + 8) {
>> -#ifdef USE_X86LDOUBLE
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* FIXME: byteswap float val=
ues - after fixing fpregs layout. */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(mem_buf, &env->fpregs=
[n - IDX_FP_REGS], 10);
>> -#else
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memset(mem_buf, 0, 10);
>> -#endif
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 10;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 floatx80 *fp =3D (floatx80 *=
) &env->fpregs[n - IDX_FP_REGS];
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int len =3D gdb_get_reg64(me=
m_buf, cpu_to_le64(fp->low));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 len +=3D gdb_get_reg16(mem_b=
uf + len, cpu_to_le16(fp->high));
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return len;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (n >=3D IDX_XMM_REGS && n < IDX=
_XMM_REGS + CPU_NB_REGS) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n -=3D IDX_XMM_RE=
GS;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (n < CPU_NB_RE=
GS32 || TARGET_LONG_BITS =3D=3D 64) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stq_=
p(mem_buf, env->xmm_regs[n].ZMM_Q(0));
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stq_=
p(mem_buf + 8, env->xmm_regs[n].ZMM_Q(1));
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn 16;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn gdb_get_reg128(mem_buf,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env->xmm_regs[n].ZMM=
_Q(0),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 env->xmm_regs[n].ZMM=
_Q(1));
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 switch (n) {
>> @@ -290,10 +286,9 @@ int x86_cpu_gdb_write_register(CPUState *cs,=20
>> uint8_t *mem_buf, int n)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return 4;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (n >=3D IDX_FP_REGS && n < IDX_=
FP_REGS + 8) {
>> -#ifdef USE_X86LDOUBLE
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* FIXME: byteswap float val=
ues - after fixing fpregs layout. */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memcpy(&env->fpregs[n - IDX_=
FP_REGS], mem_buf, 10);
>> -#endif
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 floatx80 *fp =3D (floatx80 *=
) &env->fpregs[n - IDX_FP_REGS];
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fp->low =3D le64_to_cpu(* (u=
int64_t *) mem_buf);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fp->high =3D le16_to_cpu(* (=
uint16_t *) (mem_buf + 8));

Note, checkpatch complains for both lines:
ERROR: space prohibited after that '*' (ctx:BxW)

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 10;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (n >=3D IDX_XMM_REGS && n < IDX=
_XMM_REGS + CPU_NB_REGS) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n -=3D IDX_XMM_RE=
GS;
>>
>=20
> I'd prefer both USE_X86LDOUBLE hunks in a separate patch, anyway:
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
