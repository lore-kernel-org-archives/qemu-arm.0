Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp1146887wrx;
        Thu, 28 Feb 2019 15:21:21 -0800 (PST)
X-Received: by 2002:adf:afe3:: with SMTP id y35mr1199781wrd.318.1551396081069;
        Thu, 28 Feb 2019 15:21:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551396081; cv=none;
        d=google.com; s=arc-20160816;
        b=SrQTFo9LhdOzU3lb3AICtP8rSKF2zIzHw9Oms8XOklLr9+Zt7Mj8w/yVSqEMqVKB7H
         RYGnjkNO60neeL/ydaiJ8zm7zUhcMqDLC/eH57ymr/t8ggdNf+mSvLmmIqaPb7WbP316
         SOlBe4JDpLqi66BRFyqo78ROvTDIjj06NVHt1e8Fev3wRpKJIaD4X6TxLwpr6GPl2gdJ
         wZmRruYnukNLxg/ceLKJ6e2LwEq/yurCdUe4cCAc7rsp4JUW+bwy4QqbxWPuWVIp+8n8
         VWX0vc+cIAfi9XVhIGt9/0AqXP5TQjwBPmItWfoY6gTiE32Iu/mKm9LoRRJkMJwBC2Gg
         anhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:cc:to:from:subject;
        bh=IeDw+FriRKdMbOaIXefl9mKJSVcUE0/VaEO1i3ZavZg=;
        b=ha5IiCHWB2Pbyeqei5lvS2Pc9YpH4c1GIQ5yg5mdaI8+MY8U1v3TkxiFAMlkBOCuQO
         i9roNCEVFcB6ro0u9/plXyOQyqCcSBTVmCLpNnTKm2F0KyJrhpwooLlYNnXndNtXj5K4
         IeKuj9TPZaHaq4xd0a9Ptj3nvudA9TJLdLEoHlMYsRXbckhYo5CkzUrTjmqqjDLSZAxs
         OS+BpmvGoFhNEF9IVwYbhDENAtSZBBEqm0MnVcaK9uz2czwldN76e2aXRkIYdkLVxVr7
         NBrUth3rSAg2RB/skayfrJ078nRYpnvEkFsFv2WFCuHL81jJEz6hYy8snMnRU4HV/r1m
         fM8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id i13sor14539339wrr.51.2019.02.28.15.21.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Feb 2019 15:21:21 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IeDw+FriRKdMbOaIXefl9mKJSVcUE0/VaEO1i3ZavZg=;
        b=c8N1aRsjpRXTglF0IUc7NWuODZnpNFY8LPbWH2EovmGwOlngflVAP4rcQsvtdQoYAH
         NhWsQDeK5WvmHcglvV8AVWQvg+5Lu8phMlv5KGbGV/fzh4jOudWLkngGwb51dQDymeUA
         LHXah51vsi87YF6bJ7xPuIgE2ej9yDtF2BbJoAQPhb68ET/AcZblClg/EsVRJgCHPSdR
         shsDFlKELw4m7aFU4VCqYX3lTqxkR+dkisd468Zy1X4UZc9V0fWban1778e2iN2MBpMi
         flWtgnzPGtsZGBlrDqIfAmc+YwFHZjuwj96FtJlQgb8LaC6LP2fGWJN5OK70SN2iBzM2
         WUpw==
X-Gm-Message-State: APjAAAXu8PQ8W8CnQ+9ZyCjPGZeCaxkq6k44BOS153F184vcGo8ruPfw
	WJiwfoCvjFrrVG8wOx2qqb6WqQ==
X-Google-Smtp-Source: APXvYqyIWxs8R8zptx2E1ztv7FoG6MMIoHHLHTMr6BMSdAUTJwLQzJ3rAti+WSmfHKrih8NzEa2NgQ==
X-Received: by 2002:adf:9d14:: with SMTP id k20mr1156729wre.97.1551396080608;
        Thu, 28 Feb 2019 15:21:20 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.37] (43.red-88-25-181.staticip.rima-tde.net. [88.25.181.43])
        by smtp.gmail.com with ESMTPSA id k6sm29168833wrq.82.2019.02.28.15.21.19
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Feb 2019 15:21:20 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 10/16] tests/tcg: split cris tests into
 bare and libc directories
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: edgar.iglesias@gmail.com, qemu-arm@nongnu.org, jcmvbkbc@gmail.com
References: <20190228202537.4638-1-alex.bennee@linaro.org>
 <20190228202537.4638-11-alex.bennee@linaro.org>
 <fec89b30-8da5-daa9-e8e7-22ddfc055ac6@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <b225123f-3e6f-1ae7-8985-e72faf6d5a5e@redhat.com>
Date: Fri, 1 Mar 2019 00:21:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <fec89b30-8da5-daa9-e8e7-22ddfc055ac6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: XcuaQzLkLClt

On 3/1/19 12:07 AM, Philippe Mathieu-Daudé wrote:
> Hi Alex,
> 
> On 2/28/19 9:25 PM, Alex Bennée wrote:
>> Bare tests are standalone assembly tests that don't require linking to
>> any libc and hence can be built with kernel only compilers. The libc
>> tests need a compiler capable of building properly linked userspace
>> binaries. As we don't have such a cross compiler at the moment we
>> won't be building those tests.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> ---
>> v2
>>   - split between bare/libc instead of system/user
>> ---
>>  tests/tcg/cris/{ => bare}/check_addcv17.s     |  0
>>  tests/tcg/cris/{ => bare}/check_addi.s        |  0
>>  tests/tcg/cris/{ => bare}/check_addiv32.s     |  0
>>  tests/tcg/cris/{ => bare}/check_addm.s        |  0
>>  tests/tcg/cris/{ => bare}/check_addq.s        |  0
>>  tests/tcg/cris/{ => bare}/check_addr.s        |  0
>>  tests/tcg/cris/{ => bare}/check_addxc.s       |  0
>>  tests/tcg/cris/{ => bare}/check_addxm.s       |  0
>>  tests/tcg/cris/{ => bare}/check_addxr.s       |  0
>>  tests/tcg/cris/{ => bare}/check_andc.s        |  0
>>  tests/tcg/cris/{ => bare}/check_andm.s        |  0
>>  tests/tcg/cris/{ => bare}/check_andq.s        |  0
>>  tests/tcg/cris/{ => bare}/check_andr.s        |  0
>>  tests/tcg/cris/{ => bare}/check_asr.s         |  0
>>  tests/tcg/cris/{ => bare}/check_ba.s          |  0
>>  tests/tcg/cris/{ => bare}/check_bas.s         |  0
>>  tests/tcg/cris/{ => bare}/check_bcc.s         |  0
>>  tests/tcg/cris/{ => bare}/check_boundc.s      |  0
>>  tests/tcg/cris/{ => bare}/check_boundr.s      |  0
>>  tests/tcg/cris/{ => bare}/check_btst.s        |  0
>>  tests/tcg/cris/{ => bare}/check_clearfv32.s   |  0
>>  tests/tcg/cris/{ => bare}/check_clrjmp1.s     |  0
>>  tests/tcg/cris/{ => bare}/check_cmp-2.s       |  0
>>  tests/tcg/cris/{ => bare}/check_cmpc.s        |  0
>>  tests/tcg/cris/{ => bare}/check_cmpm.s        |  0
>>  tests/tcg/cris/{ => bare}/check_cmpq.s        |  0
>>  tests/tcg/cris/{ => bare}/check_cmpr.s        |  0
>>  tests/tcg/cris/{ => bare}/check_cmpxc.s       |  0
>>  tests/tcg/cris/{ => bare}/check_cmpxm.s       |  0
>>  tests/tcg/cris/{ => bare}/check_dstep.s       |  0
>>  tests/tcg/cris/{ => bare}/check_jsr.s         |  0
>>  tests/tcg/cris/{ => bare}/check_lapc.s        |  0
>>  tests/tcg/cris/{ => bare}/check_lsl.s         |  0
>>  tests/tcg/cris/{ => bare}/check_lsr.s         |  0
>>  tests/tcg/cris/{ => bare}/check_mcp.s         |  0
>>  tests/tcg/cris/{ => bare}/check_movdelsr1.s   |  0
>>  tests/tcg/cris/{ => bare}/check_movecr.s      |  0
>>  tests/tcg/cris/{ => bare}/check_movei.s       |  0
>>  tests/tcg/cris/{ => bare}/check_movemr.s      |  0
>>  tests/tcg/cris/{ => bare}/check_movemrv32.s   |  0
>>  tests/tcg/cris/{ => bare}/check_mover.s       |  0
>>  tests/tcg/cris/{ => bare}/check_moverm.s      |  0
>>  tests/tcg/cris/{ => bare}/check_movmp.s       |  0
>>  tests/tcg/cris/{ => bare}/check_movpmv32.s    |  0
>>  tests/tcg/cris/{ => bare}/check_movpr.s       |  0
>>  tests/tcg/cris/{ => bare}/check_movprv32.s    |  0
>>  tests/tcg/cris/{ => bare}/check_movscr.s      |  0
>>  tests/tcg/cris/{ => bare}/check_movsm.s       |  0
>>  tests/tcg/cris/{ => bare}/check_movsr.s       |  0
>>  tests/tcg/cris/{ => bare}/check_movucr.s      |  0
>>  tests/tcg/cris/{ => bare}/check_movum.s       |  0
>>  tests/tcg/cris/{ => bare}/check_movur.s       |  0
>>  tests/tcg/cris/{ => bare}/check_mulv32.s      |  0
>>  tests/tcg/cris/{ => bare}/check_mulx.s        |  0
>>  tests/tcg/cris/{ => bare}/check_neg.s         |  0
>>  tests/tcg/cris/{ => bare}/check_not.s         |  0
>>  tests/tcg/cris/{ => bare}/check_orc.s         |  0
>>  tests/tcg/cris/{ => bare}/check_orm.s         |  0
>>  tests/tcg/cris/{ => bare}/check_orq.s         |  0
>>  tests/tcg/cris/{ => bare}/check_orr.s         |  0
>>  tests/tcg/cris/{ => bare}/check_ret.s         |  0
>>  tests/tcg/cris/{ => bare}/check_scc.s         |  0
>>  tests/tcg/cris/{ => bare}/check_subc.s        |  0
>>  tests/tcg/cris/{ => bare}/check_subm.s        |  0
>>  tests/tcg/cris/{ => bare}/check_subq.s        |  0
>>  tests/tcg/cris/{ => bare}/check_subr.s        |  0
>>  tests/tcg/cris/{ => bare}/check_xarith.s      |  0
>>  tests/tcg/cris/{ => bare}/crt.s               |  0
>>  tests/tcg/cris/{ => bare}/sys.c               |  0
> 
> Here you move the current sys.c which includes stdio/stdlib/unistd to
> bare ...
> 
>>  tests/tcg/cris/{ => bare}/testutils.inc       |  0
>>  tests/tcg/cris/{ => libc}/check_abs.c         |  0
>>  tests/tcg/cris/{ => libc}/check_addc.c        |  0
>>  tests/tcg/cris/{ => libc}/check_addcm.c       |  0
>>  tests/tcg/cris/{ => libc}/check_addo.c        |  0
>>  tests/tcg/cris/{ => libc}/check_addoq.c       |  0
>>  tests/tcg/cris/{ => libc}/check_bound.c       |  0
>>  tests/tcg/cris/{ => libc}/check_ftag.c        |  0
>>  .../{ => libc}/check_gcctorture_pr28634-1.c   |  0
>>  .../{ => libc}/check_gcctorture_pr28634.c     |  0
>>  .../{ => libc}/check_glibc_kernelversion.c    |  0
>>  tests/tcg/cris/{ => libc}/check_hello.c       |  0
>>  tests/tcg/cris/{ => libc}/check_int64.c       |  0
>>  tests/tcg/cris/{ => libc}/check_lz.c          |  0
>>  tests/tcg/cris/{ => libc}/check_mapbrk.c      |  0
>>  tests/tcg/cris/{ => libc}/check_mmap1.c       |  0
>>  tests/tcg/cris/{ => libc}/check_mmap2.c       |  0
>>  tests/tcg/cris/{ => libc}/check_mmap3.c       |  0
>>  tests/tcg/cris/{ => libc}/check_moveq.c       |  0
>>  tests/tcg/cris/{ => libc}/check_openpf1.c     |  0
>>  tests/tcg/cris/{ => libc}/check_openpf2.c     |  0
>>  tests/tcg/cris/{ => libc}/check_openpf3.c     |  0
>>  tests/tcg/cris/{ => libc}/check_openpf5.c     |  0
>>  tests/tcg/cris/{ => libc}/check_settls1.c     |  0
>>  tests/tcg/cris/{ => libc}/check_sigalrm.c     |  0
>>  tests/tcg/cris/{ => libc}/check_stat1.c       |  0
>>  tests/tcg/cris/{ => libc}/check_stat2.c       |  0
>>  tests/tcg/cris/{ => libc}/check_stat3.c       |  0
>>  tests/tcg/cris/{ => libc}/check_stat4.c       |  0
>>  tests/tcg/cris/{ => libc}/check_swap.c        |  0
>>  tests/tcg/cris/{ => libc}/check_time2.c       |  0
>>  tests/tcg/cris/{ => libc}/crisutils.h         |  0
>>  tests/tcg/cris/libc/sys.c                     | 58 +++++++++++++++++++
>>  tests/tcg/cris/{ => libc}/sys.h               |  0
>>  103 files changed, 58 insertions(+)
>>  rename tests/tcg/cris/{ => bare}/check_addcv17.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_addi.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_addiv32.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_addm.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_addq.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_addr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_addxc.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_addxm.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_addxr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_andc.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_andm.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_andq.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_andr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_asr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_ba.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_bas.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_bcc.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_boundc.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_boundr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_btst.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_clearfv32.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_clrjmp1.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_cmp-2.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_cmpc.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_cmpm.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_cmpq.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_cmpr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_cmpxc.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_cmpxm.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_dstep.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_jsr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_lapc.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_lsl.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_lsr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_mcp.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_movdelsr1.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_movecr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_movei.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_movemr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_movemrv32.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_mover.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_moverm.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_movmp.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_movpmv32.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_movpr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_movprv32.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_movscr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_movsm.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_movsr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_movucr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_movum.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_movur.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_mulv32.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_mulx.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_neg.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_not.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_orc.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_orm.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_orq.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_orr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_ret.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_scc.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_subc.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_subm.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_subq.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_subr.s (100%)
>>  rename tests/tcg/cris/{ => bare}/check_xarith.s (100%)
>>  rename tests/tcg/cris/{ => bare}/crt.s (100%)
>>  rename tests/tcg/cris/{ => bare}/sys.c (100%)
>>  rename tests/tcg/cris/{ => bare}/testutils.inc (100%)
>>  rename tests/tcg/cris/{ => libc}/check_abs.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_addc.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_addcm.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_addo.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_addoq.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_bound.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_ftag.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_gcctorture_pr28634-1.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_gcctorture_pr28634.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_glibc_kernelversion.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_hello.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_int64.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_lz.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_mapbrk.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_mmap1.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_mmap2.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_mmap3.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_moveq.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_openpf1.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_openpf2.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_openpf3.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_openpf5.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_settls1.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_sigalrm.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_stat1.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_stat2.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_stat3.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_stat4.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_swap.c (100%)
>>  rename tests/tcg/cris/{ => libc}/check_time2.c (100%)
>>  rename tests/tcg/cris/{ => libc}/crisutils.h (100%)
>>  create mode 100644 tests/tcg/cris/libc/sys.c
>>  rename tests/tcg/cris/{ => libc}/sys.h (100%)
>>
>> diff --git a/tests/tcg/cris/check_addcv17.s b/tests/tcg/cris/bare/check_addcv17.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_addcv17.s
>> rename to tests/tcg/cris/bare/check_addcv17.s
>> diff --git a/tests/tcg/cris/check_addi.s b/tests/tcg/cris/bare/check_addi.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_addi.s
>> rename to tests/tcg/cris/bare/check_addi.s
>> diff --git a/tests/tcg/cris/check_addiv32.s b/tests/tcg/cris/bare/check_addiv32.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_addiv32.s
>> rename to tests/tcg/cris/bare/check_addiv32.s
>> diff --git a/tests/tcg/cris/check_addm.s b/tests/tcg/cris/bare/check_addm.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_addm.s
>> rename to tests/tcg/cris/bare/check_addm.s
>> diff --git a/tests/tcg/cris/check_addq.s b/tests/tcg/cris/bare/check_addq.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_addq.s
>> rename to tests/tcg/cris/bare/check_addq.s
>> diff --git a/tests/tcg/cris/check_addr.s b/tests/tcg/cris/bare/check_addr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_addr.s
>> rename to tests/tcg/cris/bare/check_addr.s
>> diff --git a/tests/tcg/cris/check_addxc.s b/tests/tcg/cris/bare/check_addxc.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_addxc.s
>> rename to tests/tcg/cris/bare/check_addxc.s
>> diff --git a/tests/tcg/cris/check_addxm.s b/tests/tcg/cris/bare/check_addxm.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_addxm.s
>> rename to tests/tcg/cris/bare/check_addxm.s
>> diff --git a/tests/tcg/cris/check_addxr.s b/tests/tcg/cris/bare/check_addxr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_addxr.s
>> rename to tests/tcg/cris/bare/check_addxr.s
>> diff --git a/tests/tcg/cris/check_andc.s b/tests/tcg/cris/bare/check_andc.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_andc.s
>> rename to tests/tcg/cris/bare/check_andc.s
>> diff --git a/tests/tcg/cris/check_andm.s b/tests/tcg/cris/bare/check_andm.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_andm.s
>> rename to tests/tcg/cris/bare/check_andm.s
>> diff --git a/tests/tcg/cris/check_andq.s b/tests/tcg/cris/bare/check_andq.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_andq.s
>> rename to tests/tcg/cris/bare/check_andq.s
>> diff --git a/tests/tcg/cris/check_andr.s b/tests/tcg/cris/bare/check_andr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_andr.s
>> rename to tests/tcg/cris/bare/check_andr.s
>> diff --git a/tests/tcg/cris/check_asr.s b/tests/tcg/cris/bare/check_asr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_asr.s
>> rename to tests/tcg/cris/bare/check_asr.s
>> diff --git a/tests/tcg/cris/check_ba.s b/tests/tcg/cris/bare/check_ba.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_ba.s
>> rename to tests/tcg/cris/bare/check_ba.s
>> diff --git a/tests/tcg/cris/check_bas.s b/tests/tcg/cris/bare/check_bas.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_bas.s
>> rename to tests/tcg/cris/bare/check_bas.s
>> diff --git a/tests/tcg/cris/check_bcc.s b/tests/tcg/cris/bare/check_bcc.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_bcc.s
>> rename to tests/tcg/cris/bare/check_bcc.s
>> diff --git a/tests/tcg/cris/check_boundc.s b/tests/tcg/cris/bare/check_boundc.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_boundc.s
>> rename to tests/tcg/cris/bare/check_boundc.s
>> diff --git a/tests/tcg/cris/check_boundr.s b/tests/tcg/cris/bare/check_boundr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_boundr.s
>> rename to tests/tcg/cris/bare/check_boundr.s
>> diff --git a/tests/tcg/cris/check_btst.s b/tests/tcg/cris/bare/check_btst.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_btst.s
>> rename to tests/tcg/cris/bare/check_btst.s
>> diff --git a/tests/tcg/cris/check_clearfv32.s b/tests/tcg/cris/bare/check_clearfv32.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_clearfv32.s
>> rename to tests/tcg/cris/bare/check_clearfv32.s
>> diff --git a/tests/tcg/cris/check_clrjmp1.s b/tests/tcg/cris/bare/check_clrjmp1.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_clrjmp1.s
>> rename to tests/tcg/cris/bare/check_clrjmp1.s
>> diff --git a/tests/tcg/cris/check_cmp-2.s b/tests/tcg/cris/bare/check_cmp-2.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_cmp-2.s
>> rename to tests/tcg/cris/bare/check_cmp-2.s
>> diff --git a/tests/tcg/cris/check_cmpc.s b/tests/tcg/cris/bare/check_cmpc.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_cmpc.s
>> rename to tests/tcg/cris/bare/check_cmpc.s
>> diff --git a/tests/tcg/cris/check_cmpm.s b/tests/tcg/cris/bare/check_cmpm.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_cmpm.s
>> rename to tests/tcg/cris/bare/check_cmpm.s
>> diff --git a/tests/tcg/cris/check_cmpq.s b/tests/tcg/cris/bare/check_cmpq.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_cmpq.s
>> rename to tests/tcg/cris/bare/check_cmpq.s
>> diff --git a/tests/tcg/cris/check_cmpr.s b/tests/tcg/cris/bare/check_cmpr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_cmpr.s
>> rename to tests/tcg/cris/bare/check_cmpr.s
>> diff --git a/tests/tcg/cris/check_cmpxc.s b/tests/tcg/cris/bare/check_cmpxc.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_cmpxc.s
>> rename to tests/tcg/cris/bare/check_cmpxc.s
>> diff --git a/tests/tcg/cris/check_cmpxm.s b/tests/tcg/cris/bare/check_cmpxm.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_cmpxm.s
>> rename to tests/tcg/cris/bare/check_cmpxm.s
>> diff --git a/tests/tcg/cris/check_dstep.s b/tests/tcg/cris/bare/check_dstep.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_dstep.s
>> rename to tests/tcg/cris/bare/check_dstep.s
>> diff --git a/tests/tcg/cris/check_jsr.s b/tests/tcg/cris/bare/check_jsr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_jsr.s
>> rename to tests/tcg/cris/bare/check_jsr.s
>> diff --git a/tests/tcg/cris/check_lapc.s b/tests/tcg/cris/bare/check_lapc.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_lapc.s
>> rename to tests/tcg/cris/bare/check_lapc.s
>> diff --git a/tests/tcg/cris/check_lsl.s b/tests/tcg/cris/bare/check_lsl.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_lsl.s
>> rename to tests/tcg/cris/bare/check_lsl.s
>> diff --git a/tests/tcg/cris/check_lsr.s b/tests/tcg/cris/bare/check_lsr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_lsr.s
>> rename to tests/tcg/cris/bare/check_lsr.s
>> diff --git a/tests/tcg/cris/check_mcp.s b/tests/tcg/cris/bare/check_mcp.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_mcp.s
>> rename to tests/tcg/cris/bare/check_mcp.s
>> diff --git a/tests/tcg/cris/check_movdelsr1.s b/tests/tcg/cris/bare/check_movdelsr1.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_movdelsr1.s
>> rename to tests/tcg/cris/bare/check_movdelsr1.s
>> diff --git a/tests/tcg/cris/check_movecr.s b/tests/tcg/cris/bare/check_movecr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_movecr.s
>> rename to tests/tcg/cris/bare/check_movecr.s
>> diff --git a/tests/tcg/cris/check_movei.s b/tests/tcg/cris/bare/check_movei.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_movei.s
>> rename to tests/tcg/cris/bare/check_movei.s
>> diff --git a/tests/tcg/cris/check_movemr.s b/tests/tcg/cris/bare/check_movemr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_movemr.s
>> rename to tests/tcg/cris/bare/check_movemr.s
>> diff --git a/tests/tcg/cris/check_movemrv32.s b/tests/tcg/cris/bare/check_movemrv32.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_movemrv32.s
>> rename to tests/tcg/cris/bare/check_movemrv32.s
>> diff --git a/tests/tcg/cris/check_mover.s b/tests/tcg/cris/bare/check_mover.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_mover.s
>> rename to tests/tcg/cris/bare/check_mover.s
>> diff --git a/tests/tcg/cris/check_moverm.s b/tests/tcg/cris/bare/check_moverm.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_moverm.s
>> rename to tests/tcg/cris/bare/check_moverm.s
>> diff --git a/tests/tcg/cris/check_movmp.s b/tests/tcg/cris/bare/check_movmp.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_movmp.s
>> rename to tests/tcg/cris/bare/check_movmp.s
>> diff --git a/tests/tcg/cris/check_movpmv32.s b/tests/tcg/cris/bare/check_movpmv32.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_movpmv32.s
>> rename to tests/tcg/cris/bare/check_movpmv32.s
>> diff --git a/tests/tcg/cris/check_movpr.s b/tests/tcg/cris/bare/check_movpr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_movpr.s
>> rename to tests/tcg/cris/bare/check_movpr.s
>> diff --git a/tests/tcg/cris/check_movprv32.s b/tests/tcg/cris/bare/check_movprv32.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_movprv32.s
>> rename to tests/tcg/cris/bare/check_movprv32.s
>> diff --git a/tests/tcg/cris/check_movscr.s b/tests/tcg/cris/bare/check_movscr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_movscr.s
>> rename to tests/tcg/cris/bare/check_movscr.s
>> diff --git a/tests/tcg/cris/check_movsm.s b/tests/tcg/cris/bare/check_movsm.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_movsm.s
>> rename to tests/tcg/cris/bare/check_movsm.s
>> diff --git a/tests/tcg/cris/check_movsr.s b/tests/tcg/cris/bare/check_movsr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_movsr.s
>> rename to tests/tcg/cris/bare/check_movsr.s
>> diff --git a/tests/tcg/cris/check_movucr.s b/tests/tcg/cris/bare/check_movucr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_movucr.s
>> rename to tests/tcg/cris/bare/check_movucr.s
>> diff --git a/tests/tcg/cris/check_movum.s b/tests/tcg/cris/bare/check_movum.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_movum.s
>> rename to tests/tcg/cris/bare/check_movum.s
>> diff --git a/tests/tcg/cris/check_movur.s b/tests/tcg/cris/bare/check_movur.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_movur.s
>> rename to tests/tcg/cris/bare/check_movur.s
>> diff --git a/tests/tcg/cris/check_mulv32.s b/tests/tcg/cris/bare/check_mulv32.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_mulv32.s
>> rename to tests/tcg/cris/bare/check_mulv32.s
>> diff --git a/tests/tcg/cris/check_mulx.s b/tests/tcg/cris/bare/check_mulx.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_mulx.s
>> rename to tests/tcg/cris/bare/check_mulx.s
>> diff --git a/tests/tcg/cris/check_neg.s b/tests/tcg/cris/bare/check_neg.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_neg.s
>> rename to tests/tcg/cris/bare/check_neg.s
>> diff --git a/tests/tcg/cris/check_not.s b/tests/tcg/cris/bare/check_not.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_not.s
>> rename to tests/tcg/cris/bare/check_not.s
>> diff --git a/tests/tcg/cris/check_orc.s b/tests/tcg/cris/bare/check_orc.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_orc.s
>> rename to tests/tcg/cris/bare/check_orc.s
>> diff --git a/tests/tcg/cris/check_orm.s b/tests/tcg/cris/bare/check_orm.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_orm.s
>> rename to tests/tcg/cris/bare/check_orm.s
>> diff --git a/tests/tcg/cris/check_orq.s b/tests/tcg/cris/bare/check_orq.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_orq.s
>> rename to tests/tcg/cris/bare/check_orq.s
>> diff --git a/tests/tcg/cris/check_orr.s b/tests/tcg/cris/bare/check_orr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_orr.s
>> rename to tests/tcg/cris/bare/check_orr.s
>> diff --git a/tests/tcg/cris/check_ret.s b/tests/tcg/cris/bare/check_ret.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_ret.s
>> rename to tests/tcg/cris/bare/check_ret.s
>> diff --git a/tests/tcg/cris/check_scc.s b/tests/tcg/cris/bare/check_scc.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_scc.s
>> rename to tests/tcg/cris/bare/check_scc.s
>> diff --git a/tests/tcg/cris/check_subc.s b/tests/tcg/cris/bare/check_subc.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_subc.s
>> rename to tests/tcg/cris/bare/check_subc.s
>> diff --git a/tests/tcg/cris/check_subm.s b/tests/tcg/cris/bare/check_subm.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_subm.s
>> rename to tests/tcg/cris/bare/check_subm.s
>> diff --git a/tests/tcg/cris/check_subq.s b/tests/tcg/cris/bare/check_subq.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_subq.s
>> rename to tests/tcg/cris/bare/check_subq.s
>> diff --git a/tests/tcg/cris/check_subr.s b/tests/tcg/cris/bare/check_subr.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_subr.s
>> rename to tests/tcg/cris/bare/check_subr.s
>> diff --git a/tests/tcg/cris/check_xarith.s b/tests/tcg/cris/bare/check_xarith.s
>> similarity index 100%
>> rename from tests/tcg/cris/check_xarith.s
>> rename to tests/tcg/cris/bare/check_xarith.s
>> diff --git a/tests/tcg/cris/crt.s b/tests/tcg/cris/bare/crt.s
>> similarity index 100%
>> rename from tests/tcg/cris/crt.s
>> rename to tests/tcg/cris/bare/crt.s
>> diff --git a/tests/tcg/cris/sys.c b/tests/tcg/cris/bare/sys.c
>> similarity index 100%
>> rename from tests/tcg/cris/sys.c
>> rename to tests/tcg/cris/bare/sys.c
>> diff --git a/tests/tcg/cris/testutils.inc b/tests/tcg/cris/bare/testutils.inc
>> similarity index 100%
>> rename from tests/tcg/cris/testutils.inc
>> rename to tests/tcg/cris/bare/testutils.inc
>> diff --git a/tests/tcg/cris/check_abs.c b/tests/tcg/cris/libc/check_abs.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_abs.c
>> rename to tests/tcg/cris/libc/check_abs.c
>> diff --git a/tests/tcg/cris/check_addc.c b/tests/tcg/cris/libc/check_addc.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_addc.c
>> rename to tests/tcg/cris/libc/check_addc.c
>> diff --git a/tests/tcg/cris/check_addcm.c b/tests/tcg/cris/libc/check_addcm.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_addcm.c
>> rename to tests/tcg/cris/libc/check_addcm.c
>> diff --git a/tests/tcg/cris/check_addo.c b/tests/tcg/cris/libc/check_addo.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_addo.c
>> rename to tests/tcg/cris/libc/check_addo.c
>> diff --git a/tests/tcg/cris/check_addoq.c b/tests/tcg/cris/libc/check_addoq.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_addoq.c
>> rename to tests/tcg/cris/libc/check_addoq.c
>> diff --git a/tests/tcg/cris/check_bound.c b/tests/tcg/cris/libc/check_bound.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_bound.c
>> rename to tests/tcg/cris/libc/check_bound.c
>> diff --git a/tests/tcg/cris/check_ftag.c b/tests/tcg/cris/libc/check_ftag.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_ftag.c
>> rename to tests/tcg/cris/libc/check_ftag.c
>> diff --git a/tests/tcg/cris/check_gcctorture_pr28634-1.c b/tests/tcg/cris/libc/check_gcctorture_pr28634-1.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_gcctorture_pr28634-1.c
>> rename to tests/tcg/cris/libc/check_gcctorture_pr28634-1.c
>> diff --git a/tests/tcg/cris/check_gcctorture_pr28634.c b/tests/tcg/cris/libc/check_gcctorture_pr28634.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_gcctorture_pr28634.c
>> rename to tests/tcg/cris/libc/check_gcctorture_pr28634.c
>> diff --git a/tests/tcg/cris/check_glibc_kernelversion.c b/tests/tcg/cris/libc/check_glibc_kernelversion.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_glibc_kernelversion.c
>> rename to tests/tcg/cris/libc/check_glibc_kernelversion.c
>> diff --git a/tests/tcg/cris/check_hello.c b/tests/tcg/cris/libc/check_hello.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_hello.c
>> rename to tests/tcg/cris/libc/check_hello.c
>> diff --git a/tests/tcg/cris/check_int64.c b/tests/tcg/cris/libc/check_int64.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_int64.c
>> rename to tests/tcg/cris/libc/check_int64.c
>> diff --git a/tests/tcg/cris/check_lz.c b/tests/tcg/cris/libc/check_lz.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_lz.c
>> rename to tests/tcg/cris/libc/check_lz.c
>> diff --git a/tests/tcg/cris/check_mapbrk.c b/tests/tcg/cris/libc/check_mapbrk.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_mapbrk.c
>> rename to tests/tcg/cris/libc/check_mapbrk.c
>> diff --git a/tests/tcg/cris/check_mmap1.c b/tests/tcg/cris/libc/check_mmap1.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_mmap1.c
>> rename to tests/tcg/cris/libc/check_mmap1.c
>> diff --git a/tests/tcg/cris/check_mmap2.c b/tests/tcg/cris/libc/check_mmap2.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_mmap2.c
>> rename to tests/tcg/cris/libc/check_mmap2.c
>> diff --git a/tests/tcg/cris/check_mmap3.c b/tests/tcg/cris/libc/check_mmap3.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_mmap3.c
>> rename to tests/tcg/cris/libc/check_mmap3.c
>> diff --git a/tests/tcg/cris/check_moveq.c b/tests/tcg/cris/libc/check_moveq.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_moveq.c
>> rename to tests/tcg/cris/libc/check_moveq.c
>> diff --git a/tests/tcg/cris/check_openpf1.c b/tests/tcg/cris/libc/check_openpf1.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_openpf1.c
>> rename to tests/tcg/cris/libc/check_openpf1.c
>> diff --git a/tests/tcg/cris/check_openpf2.c b/tests/tcg/cris/libc/check_openpf2.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_openpf2.c
>> rename to tests/tcg/cris/libc/check_openpf2.c
>> diff --git a/tests/tcg/cris/check_openpf3.c b/tests/tcg/cris/libc/check_openpf3.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_openpf3.c
>> rename to tests/tcg/cris/libc/check_openpf3.c
>> diff --git a/tests/tcg/cris/check_openpf5.c b/tests/tcg/cris/libc/check_openpf5.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_openpf5.c
>> rename to tests/tcg/cris/libc/check_openpf5.c
>> diff --git a/tests/tcg/cris/check_settls1.c b/tests/tcg/cris/libc/check_settls1.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_settls1.c
>> rename to tests/tcg/cris/libc/check_settls1.c
>> diff --git a/tests/tcg/cris/check_sigalrm.c b/tests/tcg/cris/libc/check_sigalrm.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_sigalrm.c
>> rename to tests/tcg/cris/libc/check_sigalrm.c
>> diff --git a/tests/tcg/cris/check_stat1.c b/tests/tcg/cris/libc/check_stat1.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_stat1.c
>> rename to tests/tcg/cris/libc/check_stat1.c
>> diff --git a/tests/tcg/cris/check_stat2.c b/tests/tcg/cris/libc/check_stat2.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_stat2.c
>> rename to tests/tcg/cris/libc/check_stat2.c
>> diff --git a/tests/tcg/cris/check_stat3.c b/tests/tcg/cris/libc/check_stat3.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_stat3.c
>> rename to tests/tcg/cris/libc/check_stat3.c
>> diff --git a/tests/tcg/cris/check_stat4.c b/tests/tcg/cris/libc/check_stat4.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_stat4.c
>> rename to tests/tcg/cris/libc/check_stat4.c
>> diff --git a/tests/tcg/cris/check_swap.c b/tests/tcg/cris/libc/check_swap.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_swap.c
>> rename to tests/tcg/cris/libc/check_swap.c
>> diff --git a/tests/tcg/cris/check_time2.c b/tests/tcg/cris/libc/check_time2.c
>> similarity index 100%
>> rename from tests/tcg/cris/check_time2.c
>> rename to tests/tcg/cris/libc/check_time2.c
>> diff --git a/tests/tcg/cris/crisutils.h b/tests/tcg/cris/libc/crisutils.h
>> similarity index 100%
>> rename from tests/tcg/cris/crisutils.h
>> rename to tests/tcg/cris/libc/crisutils.h
>> diff --git a/tests/tcg/cris/libc/sys.c b/tests/tcg/cris/libc/sys.c
>> new file mode 100644
>> index 0000000000..b8e759eee3
>> --- /dev/null
>> +++ b/tests/tcg/cris/libc/sys.c
>> @@ -0,0 +1,58 @@
>> +/*
>> + * Minilib helpers functions for system test
>> + */
>> +
>> +
> 
> ... and you add a copy which doesn't include stdio/stdlib/unistd in
> libc/. Don't we want the opposite? Maybe we can avoid duplicate code
> having each including ../sys.inc.c.

Now I see your next patch...

Is it possible to invert them, first clean sys.c up, then move the files?

> 
>> +void exit (int status) {
>> +	register unsigned int callno asm ("r9") = 1; /* NR_exit */
>> +	asm volatile ("break 13\n"
>> +		      :
>> +		      : "r" (callno)
>> +		      : "memory" );
>> +	while(1);
>> +}
>> +
>> +ssize_t write (int fd, const void *buf, size_t count) {
> 
> The CPP should complain about size_t undefined.

You #include <stddef.h> in the text patch :)

> 
>> +	register unsigned int callno asm ("r9") = 4; /* NR_write */
>> +	register unsigned int r10 asm ("r10") = fd;
>> +	register const void *r11 asm ("r11") = buf;
>> +	register size_t r12 asm ("r12") = count;
>> +	register unsigned int r asm ("r10");
>> +
>> +	asm volatile ("break 13\n"
>> +	     : "=r" (r)
>> +	     : "r" (callno), "0" (r10), "r" (r11), "r" (r12)
>> +	     : "memory");
>> +
>> +	return r;
>> +}
>> +
>> +static inline int mystrlen(char *s) {
>> +	int i = 0;
>> +	while (s[i])
>> +		i++;
>> +	return i;
>> +}
>> +
>> +void pass(void) {
>> +	char s[] = "passed.\n";
>> +	write (1, s, sizeof (s) - 1);
>> +	exit (0);
>> +}
>> +
>> +void _fail(char *reason) {
>> +	char s[] = "\nfailed: ";
>> +	int len = mystrlen(reason);
>> +	write (1, s, sizeof (s) - 1);
>> +	write (1, reason, len);
>> +	write (1, "\n", 1);
>> +//	exit (1);
>> +}
>> +
>> +void *memset (void *s, int c, size_t n) {
>> +	char *p = s;
>> +	int i;
>> +	for (i = 0; i < n; i++)
>> +		p[i] = c;
>> +	return p;
>> +}
>> diff --git a/tests/tcg/cris/sys.h b/tests/tcg/cris/libc/sys.h
>> similarity index 100%
>> rename from tests/tcg/cris/sys.h
>> rename to tests/tcg/cris/libc/sys.h
>>
