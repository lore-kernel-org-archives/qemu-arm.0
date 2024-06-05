Received: by 2002:a17:906:bc9a:b0:a66:557b:2f6e with SMTP id lv26csp403448ejb;
        Wed, 5 Jun 2024 10:49:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUl7h261p/EsYhSTBUZtyNSlXwXOQt3CBTfB4hvU4RZQiSVeZm6MUg6JQfq6Ne5s4lR3DPcsz8NnFbJvKFWAtYqRlduhDdc
X-Google-Smtp-Source: AGHT+IEitizNiCog9l31ek/27NMfUXFGAk0Z7B3lmtkhcl64d5OCBmSjk5d1ok0glOinML58JrE4
X-Received: by 2002:a05:6214:3c9f:b0:6ae:1042:2229 with SMTP id 6a1803df08f44-6b02bf5f695mr41438546d6.18.1717609788530;
        Wed, 05 Jun 2024 10:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717609788; cv=none;
        d=google.com; s=arc-20160816;
        b=ndW7YHIDRZpWKDAZNfz74KC/dWkHLp/nd0Oj9PVE3KWkuryj6ppQkRzHj/W/DNxlcu
         2XGziJ+QMl9wIj430sWrAcSm0JZeCozZuugEVgnDuC3if0DdxQsAPgFIecvC1m2yX82e
         5u+7nSdnngiWL28gKbAqnpcMfpYrtuVf0R4hYeZEloCISPKWKQXXVhYmS0uxDGERyc4m
         aJEHO1k9n0J6AVbf0LHZZWtzKJfN1+Ksx4xYvR5FOaZKPKho7Lap+t15PNg0LC3NCaZN
         WkQpeLRWAlF3b3m6RtX2Jtbzm423EaNgOH5II2wSfibRGXmkh5dK2zCIFAjADWW6avJU
         0H0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=/mCDyOscSvOaHRbfVHpVWltEOtVTKewytlqkZLEIcOs=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=sEiN33cL2zNbtX0llKUxNHtArNRBdBoKDSQZZFYOF4qWJ/3lTVWvMEV0sqx9F/LHqq
         H0IKC8XDJnujXd9uujXfD/XJfpfWfTJjLYd1GCfbQkbA+jmjc5+VT3+Lkr63ZDD3ge0G
         UqAzelUpN94hALhZOuR0/JEN1eXOEF+wbHriBJIh4EtKIvsYI0zzduyksjRHO1njlSrZ
         K0LTCzz5vkplRgamuIZSjwzRMTUhO/OypXrA0xPS8DHQ+dnnZ6ZNbuRDD26bjFfbWVka
         P10D8fCdSmNhftIeGzooKaZikX8JU71KTeTgTzIRBeihsZ+0pzENBh6sIjaJP3XTSnqH
         IKPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bo6P42FY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b4299c5si143405486d6.434.2024.06.05.10.49.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2024 10:49:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=bo6P42FY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sEulZ-0003UQ-O8; Wed, 05 Jun 2024 13:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <koliagogsadze@gmail.com>)
 id 1sEtLu-00030Q-VW
 for qemu-arm@nongnu.org; Wed, 05 Jun 2024 12:19:06 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <koliagogsadze@gmail.com>)
 id 1sEtLt-0004I6-08
 for qemu-arm@nongnu.org; Wed, 05 Jun 2024 12:19:06 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57a32b0211aso3118282a12.2
 for <qemu-arm@nongnu.org>; Wed, 05 Jun 2024 09:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717604343; x=1718209143; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/mCDyOscSvOaHRbfVHpVWltEOtVTKewytlqkZLEIcOs=;
 b=bo6P42FYblG4G5ZZ/ZWYqLCL6LkOuE2tpTRi7qYvCQViVqND35uDcE9o6CRfkTdBTp
 x21LG5yIvSo68ZKGxSd2rK3f3KBv6LA4K3Dn3kZhOi3UCuKfHAwiBxQxSE7OzoX9UpKc
 EN2gVaz/bHqOfNUTOsLSqaLh8y3u5UrPr6S0p90RcVFzjQbw7ieQS/QZE80dtmMBGdYY
 Hdtg6KjPrPK6XEMn8mOdBuNYgUrRauO7uZu/Ub5krSH3IgF3n3Rr6n5ZvEuxX3j7zHFr
 8oIhKgWMAGUfnMSl85EzBzG8VXUSi08i6/ZE+5QsrnjfQIMXWSFjPHWBp7clI+6tB7IP
 hmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717604343; x=1718209143;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/mCDyOscSvOaHRbfVHpVWltEOtVTKewytlqkZLEIcOs=;
 b=ntGYBSzL06qZbHUc6TGRXxbHppRq3ucnZJanJJFbAA3JFbJ0w7tZPFb0FBShXgAgLR
 YaNdKfWRXh+W00jtITzsuVm6WeGx+bYDpTO1NBG+K2zzagFcxzrZu3ga4EotSQCj1jDx
 9zzIXIujcXlkXqfEEMHqqc9OwV/idcOU+PtmHrZJwyEaCK8prE6vpPiP/qpVb3TiEBjv
 iTxIsaIvuLej9Cb9LtndQjs8/VSuqcB8DXGBTuY9detTiQS1RfUZcfdHkjLtX8qEHNYB
 WyUymstcbBRVPn8uwtsiRFw7OtE7IGGAhrc+ejzSwPqjGjhM96JWeHmm0efH5nLiad5H
 fb/Q==
X-Gm-Message-State: AOJu0YySPV3u/OYQheCUas6YJ0DHqGlXqrsbhk8I9M9sGXL//i2UMxp9
 rUy5wl/uiROKY92+8hGk7ZIS6OSX9a9O61eOD5D+qL66fFaFJW+NPgsWwiPAmTMyXR6qdTyjpgx
 pL6Lp9h+4OVt/f7icc0C9YuhPLGuoAip4rfE=
X-Received: by 2002:a50:cd81:0:b0:572:1589:eb98 with SMTP id
 4fb4d7f45d1cf-57a8b6a5379mr1844157a12.12.1717604342287; Wed, 05 Jun 2024
 09:19:02 -0700 (PDT)
MIME-Version: 1.0
From: Nikolay Gogsadze <koliagogsadze@gmail.com>
Date: Wed, 5 Jun 2024 19:18:48 +0300
Message-ID: <CANm_edoii9xoBNs6-hMdbmjjF9MXAo9UkbhduTMMkohZOvnviw@mail.gmail.com>
Subject: Arm64 FEAT_MOPS option B support for heterogeneous systems
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b021ee061a26ec25"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=koliagogsadze@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 05 Jun 2024 13:49:41 -0400
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
X-TUID: D/KLhBG02eGR

--000000000000b021ee061a26ec25
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I have a question related to Arm64 FEAT_MOPS support in qemu
https://github.com/qemu/qemu/commit/5d7b37b5f675d9cee0c9c1f8b386b3daa3cc2d9a
https://lore.kernel.org/all/20230907160340.260094-1-peter.maydell@linaro.org/T/

It looks like there is no possibility to emulate MOPS instructions with
option B, only option A is supported.
https://github.com/qemu/qemu/blob/master/target/arm/tcg/helper-a64.c#L1579-L1590
https://github.com/qemu/qemu/blob/master/target/arm/tcg/helper-a64.c#L1681-L1684

I checked linux kernel patch add support FEAT_MOPS
https://lore.kernel.org/lkml/20230216160012.272345-1-kristina.martsenko@arm.com/T/


and found an interesting thing: a memory exception can happen in a
heterogeneous system if one processor implements option A and executes
prologue or main cpy/set instructions, and if after that the kernel
re-scheduled to another processor that implements option B, it will be
memory operation exception. Arm provided an algorithm for the linux kernel
to reset the registers and resume execution from the prologue instruction:

https://github.com/torvalds/linux/blob/32f88d65f01bf6f45476d7edbe675e44fb9e1d58/arch/arm64/include/asm/traps.h#L104-L154

>On Thu, Feb 16, 2023 at 04:00:09PM +0000, Kristina Martsenko wrote:
>> The memory copy/set instructions added as part of FEAT_MOPS can take an
>> exception part-way through their execution and resume execution
>> afterwards. If however the task is re-scheduled and execution resumes on
>> a different CPU, then the CPU may take a new type of exception to
>> indicate this. In this case the OS has to reset the registers and restart
>> execution from the prologue instruction. The algorithm for doing this is
>> provided as part of the Arm ARM.
>>
>> Add an exception handler for the new exception and wire it up for
>> userspace tasks.
>>
>> Signed-off-by: Kristina Martsenko <kristina.martsenko@arm.com>

>It may be worth adding a short note in the cover that the architecture
>allows two options to implement the memory instructions and on a
>heterogeneous system we can have different implementations between CPUs.
>That's the reason for an exception after migration (it's not obvious
>from your text above).

>Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

It would be great to add support for virt board to choose which option of
mops implements CPU to emulate and test such cases.
I didn't make patches to qemu but if this proposal is acceptable, then I
would be happy to help add support.

Best Regards,
Mykola Hohsadze

--000000000000b021ee061a26ec25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello everyone,</div><div><br></div><div>I have a que=
stion related to Arm64 FEAT_MOPS support in qemu</div><div><a href=3D"https=
://github.com/qemu/qemu/commit/5d7b37b5f675d9cee0c9c1f8b386b3daa3cc2d9a" ta=
rget=3D"_blank">https://github.com/qemu/qemu/commit/5d7b37b5f675d9cee0c9c1f=
8b386b3daa3cc2d9a</a><br></div><div><a href=3D"https://lore.kernel.org/all/=
20230907160340.260094-1-peter.maydell@linaro.org/T/" target=3D"_blank">http=
s://lore.kernel.org/all/20230907160340.260094-1-peter.maydell@linaro.org/T/=
</a></div><div><br></div><div>It looks like there is no possibility=C2=A0to=
 emulate MOPS instructions with option B, only option A is supported.</div>=
<div><a href=3D"https://github.com/qemu/qemu/blob/master/target/arm/tcg/hel=
per-a64.c#L1579-L1590" target=3D"_blank">https://github.com/qemu/qemu/blob/=
master/target/arm/tcg/helper-a64.c#L1579-L1590</a><br></div><div><a href=3D=
"https://github.com/qemu/qemu/blob/master/target/arm/tcg/helper-a64.c#L1681=
-L1684" target=3D"_blank">https://github.com/qemu/qemu/blob/master/target/a=
rm/tcg/helper-a64.c#L1681-L1684</a><br></div><div><br></div><div>I checked =
linux kernel patch add support FEAT_MOPS=C2=A0<a href=3D"https://lore.kerne=
l.org/lkml/20230216160012.272345-1-kristina.martsenko@arm.com/T/" target=3D=
"_blank">https://lore.kernel.org/lkml/20230216160012.272345-1-kristina.mart=
senko@arm.com/T/</a>=C2=A0</div><div><br></div><div>and found an interestin=
g thing: a memory exception can happen in a heterogeneous system if one pro=
cessor implements option A and executes prologue or main cpy/set instructio=
ns, and if after that the kernel re-scheduled to another processor that imp=
lements option B, it will be memory operation exception. Arm provided an al=
gorithm for the linux kernel to reset the registers and resume execution fr=
om the prologue instruction:<br></div><div><br></div><div><a href=3D"https:=
//github.com/torvalds/linux/blob/32f88d65f01bf6f45476d7edbe675e44fb9e1d58/a=
rch/arm64/include/asm/traps.h#L104-L154" target=3D"_blank">https://github.c=
om/torvalds/linux/blob/32f88d65f01bf6f45476d7edbe675e44fb9e1d58/arch/arm64/=
include/asm/traps.h#L104-L154</a><br></div><div><br></div><div>&gt;On Thu, =
Feb 16, 2023 at 04:00:09PM +0000, Kristina Martsenko wrote:<br>&gt;&gt; The=
 memory copy/set instructions added as part of FEAT_MOPS can take an<br>&gt=
;&gt; exception part-way through their execution and resume execution<br>&g=
t;&gt; afterwards. If however the task is re-scheduled and execution resume=
s on<br>&gt;&gt; a different CPU, then the CPU may take a new type of excep=
tion to<br>&gt;&gt; indicate this. In this case the OS has to reset the reg=
isters and restart<br>&gt;&gt; execution from the prologue instruction. The=
 algorithm for doing this is<br>&gt;&gt; provided as part of the Arm ARM.<b=
r>&gt;&gt;<br>&gt;&gt; Add an exception handler for the new exception and w=
ire it up for<br>&gt;&gt; userspace tasks.<br>&gt;&gt;<br>&gt;&gt; Signed-o=
ff-by: Kristina Martsenko &lt;<a href=3D"mailto:kristina.martsenko@arm.com"=
 target=3D"_blank">kristina.martsenko@arm.com</a>&gt;<br><br>&gt;It may be =
worth adding a short note in the cover that the architecture<br>&gt;allows =
two options to implement the memory instructions and on a<br>&gt;heterogene=
ous system we can have different implementations between CPUs.<br>&gt;That&=
#39;s the reason for an exception after migration (it&#39;s not obvious<br>=
&gt;from your text above).<br></div><div><br>&gt;Reviewed-by: Catalin Marin=
as &lt;<a href=3D"mailto:catalin.marinas@arm.com" target=3D"_blank">catalin=
.marinas@arm.com</a>&gt;<br></div><div><br></div><div>It would be great to =
add support for virt board to choose which option of mops implements CPU to=
 emulate and test such cases.</div><div>I didn&#39;t make patches to qemu=
=C2=A0but if this proposal is acceptable, then I would be happy to help add=
 support.</div><div><br></div><div>Best Regards,</div><div>Mykola Hohsadze<=
/div></div>

--000000000000b021ee061a26ec25--
