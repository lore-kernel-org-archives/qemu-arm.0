Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2426732wrg;
        Mon, 17 Jun 2019 05:12:08 -0700 (PDT)
X-Received: by 2002:a05:600c:2182:: with SMTP id e2mr16710616wme.104.1560773528809;
        Mon, 17 Jun 2019 05:12:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560773528; cv=none;
        d=google.com; s=arc-20160816;
        b=0INZ6iQmKsWXhD0k8sZhEEMk3jjci7k/67GlpMjOaUVsjpYqbbRB6PP6hWZNZupz7m
         JUh6oOAE10txbSwO15/AimkJt/0Nj6tqtmjAqcVX+Di6Zizn1ubyye/Ksebn69vgE3qB
         wlhdnRaWAV3oWXYNRKod6iso0gTtGAfig/vi05Ysg6m3S3XR8ReqV9T8TKpnOcONqzy1
         LKy4fQgEy60DiOvQRkWlk5rIBeEaRP2//89wO7o9PhhlnEkimJYyD4sT67kWJOZwPNsc
         v9FnczQRJP7KXff+1qZ6sRPfdT8vWeQyjWPskq3RJ/8vCFyIeESGqhGbl7vKPzfCgQXA
         ExVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=iYhRqtipY8lTadhJ8jkJECmpD3KKBXyobpIx1DI+a64=;
        b=Na2S9RUGJ93Ry9oR7G01Mlyo3ZGwBxoMMxxKV3TwLe5F1vucDeTeEqMAxoSyDeuecV
         sPYQZpxhf9IpZRXWaqd/p8i32Xrg4tOy/a3W/YDpoxWZySQrOIp3xPUBXZFN44wyZWDp
         iBibSBVJ556/UP4HfE+LjI0FiPrDfRIMrWBxdhyyACUcnFilM/vS1RoVRJ9aJ3V2g2UX
         a7KrUBWpQEfAltEyEVRT4r/1TNCjPTtTiaxQTPImsBdOkbK0Kr0KlzBs7ZcSEYsVRZfS
         2bXLUGQnAiPXnLG54eHBx+vAdhlpzoODPHgmhbNQ53wlV2QGrqCt5045gJAJKaGFk2ps
         2cAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d1sor5428288wrm.51.2019.06.17.05.12.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Jun 2019 05:12:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iYhRqtipY8lTadhJ8jkJECmpD3KKBXyobpIx1DI+a64=;
        b=oBkJxDmGuCilBXJEPnAfknMvYq6Le5EzKwlbHoAgbRNoOd4DGoEZebsVwu6KRYajH6
         hu2+Y0Pb9CyziCZaoSDco+mSQrn1GJiQQyKRqnh4dN6G1gCE7q6MUAUjxyo8de8x4cCH
         p248faSmERGtNZhy762tnnzKZA02rIwWmbkK/r1t3H/K5i6fTr/YeKxDWzviA3wh/5Wd
         OAd77YQR4kD+JcPjIiVxStRWuLt+oj17WvQKYIgJQtQAdEbS5xq7UT3v49C/+dLCK6yV
         4Ouhse29iIZZoRYzad63XE9HwDTX4WzVA915e8an6D5//lJa+h/MnpTeWj98EQb7gFES
         3tag==
X-Gm-Message-State: APjAAAVI+NuYviDetOJzydCzLvjwLmUYtfNH1wWRFew2SDpqJb5H+OFe
	Y3Yi3Jmp1UsVVxfBb0vPadPyu7Cn6qE=
X-Google-Smtp-Source: APXvYqwETXqPjzpGcTidWlv/OoIszCK7awfLbFK/nvzmAXINxtm+YI28nbLgfBu4FLLTy+WGa8yNmw==
X-Received: by 2002:a5d:4908:: with SMTP id x8mr8176083wrq.290.1560773528602;
        Mon, 17 Jun 2019 05:12:08 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net. [88.21.202.183])
        by smtp.gmail.com with ESMTPSA id y6sm10446243wrp.12.2019.06.17.05.12.07
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 05:12:08 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 08/23] target/arm: Move all v7m insn
 helpers into their own file
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Samuel Ortiz <sameo@linux.intel.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20190615154352.26824-1-philmd@redhat.com>
 <20190615154352.26824-9-philmd@redhat.com> <8736k8bfph.fsf@zen.linaroharston>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4fbdbd53-13c7-efff-4a32-dadf28c0be2d@redhat.com>
Date: Mon, 17 Jun 2019 14:12:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8736k8bfph.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 5M4Fg1c0XoVS

On 6/17/19 1:42 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> From: Samuel Ortiz <sameo@linux.intel.com>
>>
>> In preparation for supporting TCG disablement on ARM, we move most
>> of TCG related v7m helpers and APIs into their own file.
>>
>> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
>> [PMD: Patch rewritten]
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Is there a way to not use $CONFIG_USER_ONLY?
> 
> Is this because the CONFIG_ARM_V7M symbol only appears for softmmu
> targets but we still want vXm -cpu's for user mode?

No :(

If I use this diff:

-- >8 --
diff --git a/target/arm/helper.h b/target/arm/helper.h
@@ -58,24 +58,26 @@ DEF_HELPER_2(pre_smc, void, env, i32)
 DEF_HELPER_1(check_breakpoints, void, env)

 DEF_HELPER_3(cpsr_write, void, env, i32, i32)
 DEF_HELPER_2(cpsr_write_eret, void, env, i32)
 DEF_HELPER_1(cpsr_read, i32, env)

+#ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(v7m_msr, void, env, i32, i32)
 DEF_HELPER_2(v7m_mrs, i32, env, i32)

 DEF_HELPER_2(v7m_bxns, void, env, i32)
 DEF_HELPER_2(v7m_blxns, void, env, i32)

 DEF_HELPER_3(v7m_tt, i32, env, i32, i32)

 DEF_HELPER_1(v7m_preserve_fp_state, void, env)

 DEF_HELPER_2(v7m_vlstm, void, env, i32)
 DEF_HELPER_2(v7m_vlldm, void, env, i32)
+#endif /* CONFIG_USER_ONLY */

 DEF_HELPER_2(v8m_stackcheck, void, env, i32)
---

I get:

target/arm/translate.c:10607:29: error: nested extern declaration of
‘gen_helper_v7m_mrs’ [-Werror=nested-externs]
target/arm/translate.c: In function ‘disas_thumb_insn’:
target/arm/translate.c:11224:25: error: implicit declaration of function
‘gen_blxns’; did you mean ‘gen_bx’? [-Werror=implicit-function-declaration]
                         gen_blxns(s, rm);
                         ^~~~~~~~~

Because:

static void disas_thumb_insn(DisasContext *s, uint32_t insn)
{
    ...
    switch (insn >> 12) {
    ...
    case 4:
        ...
        if (insn & (1 << 10)) {
            ...
            case 3:
            {
                /* 0b0100_0111_xxxx_xxxx
                 * - branch [and link] exchange thumb register
                 */
                bool link = insn & (1 << 7);

                if (insn & 3) {
                    goto undef;
                }
                if (link) {
                    ARCH(5);
                }
                if ((insn & 4)) {
                    /* BXNS/BLXNS: only exists for v8M with the
                     * security extensions, and always UNDEF if NonSecure.
                     * We don't implement these in the user-only mode
                     * either (in theory you can use them from Secure User
                     * mode but they are too tied in to system emulation.)
                     */
                    if (!s->v8m_secure || IS_USER_ONLY) {
                        goto undef;
                    }
                    if (link) {
                        gen_blxns(s, rm);
                    } else {
                        gen_bxns(s, rm);
                    }
                    break;
                }

Should we add "#ifndef CONFIG_USER_ONLY" all around? I believe we rather
not...

For 'cps' and 'mrs' we have:

                        /* Implemented as NOP in user mode.  */
                        if (IS_USER(s))
                            break;

but not for 'msr'.
