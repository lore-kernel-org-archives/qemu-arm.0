Received: by 10.25.208.194 with SMTP id h185csp237836lfg;
        Thu, 21 Apr 2016 08:08:54 -0700 (PDT)
X-Received: by 10.112.137.228 with SMTP id ql4mr6664287lbb.14.1461251334195;
        Thu, 21 Apr 2016 08:08:54 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x22c.google.com (mail-lf0-x22c.google.com. [2a00:1450:4010:c07::22c])
        by mx.google.com with ESMTPS id rc4si1889407lbb.8.2016.04.21.08.08.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Apr 2016 08:08:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::22c as permitted sender) client-ip=2a00:1450:4010:c07::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::22c as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x22c.google.com with SMTP id e190so62600446lfe.0;
        Thu, 21 Apr 2016 08:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=aN6DZQqwFZKlqX1L1j/B9vRddQQ3qbLiIt4JrJ2LD20=;
        b=pDLLkE9Ak1+0m5GJmrXTPLgLIkYO9XOKuXHR6pIA13nVSCEb+DD4WWgX6AI8OmFuo6
         xIDYuQ5Be7QTDqlMuXYQxUr2y9e8YQWgz9RfWJfKp3uqBXnNIkJ57aa+jvOV910kQcVl
         sEBx1vd/I4YqVoQKqS1ArJsXmhti6++C7jm2yTK7lU2s0cD0XI8sPaZUrAnuRilLX68i
         HgwQfyfYroj+idJTqek9e99j4OLdkdLPB5FO/qpi4ng54s9Jr96r2rP1Bl6G+EMk3zrQ
         xS4wYaPamICeN0+RJBjIjM9K/XgDze8t6h/kvl9eWUa3/o8yqCE1NfyAByhMCn1BeGOz
         vRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=aN6DZQqwFZKlqX1L1j/B9vRddQQ3qbLiIt4JrJ2LD20=;
        b=B0OHjxSbzjGubUEQ8d4p+CqnsapnNLGQHdFiFk/F73J4CRR2XjL5otHeV1Nm9zQWDU
         5O+tfIlcgFbmWA++RXFQDZaRfdi3UVDtqNl7oj9EuqIZGYwC+te/58XUeoQvIavGQOua
         a8lRzGiHzRbYR8xnsOmsbwqe5mtMZ3nmWOH3w90m94sDNoS4g+Dc7fVkoP99u5EDKjaY
         DYkyth84Qsi+zfJ6j+gXFXv84SjVP7UhSddp6hBQxbLKmNZ4nelFbCKDFIp2+C4c19m8
         IvvfkLl9Pl0li7jbZixbfE9owql/Z31eh/J/zC171DFMrPlm48AnaPKN5Xo28tAf+0tp
         bLWQ==
X-Gm-Message-State: AOPr4FVAa50gIAy/3MFLQDH8EhJ1iVClPnXv6Q1xLhcOqLGwAM4Jbr12IaiG262c1Yim+A==
X-Received: by 10.25.145.149 with SMTP id t143mr6595570lfd.37.1461251333883;
        Thu, 21 Apr 2016 08:08:53 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.1.189] ([195.91.132.170])
        by smtp.gmail.com with ESMTPSA id sv1sm628029lbb.26.2016.04.21.08.08.52
        (version=TLSv1/SSLv3 cipher=OTHER);
        Thu, 21 Apr 2016 08:08:53 -0700 (PDT)
Subject: Re: [PATCH v4 09/10] tcg: Clean up direct block chaining safety
 checks
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Sergey Fedorov <sergey.fedorov@linaro.org>
References: <1461186921-14977-1-git-send-email-sergey.fedorov@linaro.org>
 <1461186921-14977-10-git-send-email-sergey.fedorov@linaro.org>
 <87y487t80x.fsf@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@suse.de>,
 qemu-arm@nongnu.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <5718ED04.5080403@gmail.com>
Date: Thu, 21 Apr 2016 18:08:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <87y487t80x.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: CnVey+BN9nHJ

On 21/04/16 16:18, Alex Bennée wrote:
> Sergey Fedorov <sergey.fedorov@linaro.org> writes:
>> diff --git a/cpu-exec.c b/cpu-exec.c
>> index bbfcbfb54385..065cc9159477 100644
>> --- a/cpu-exec.c
>> +++ b/cpu-exec.c
>> @@ -508,11 +508,8 @@ int cpu_exec(CPUState *cpu)
>>                      next_tb = 0;
>>                      tcg_ctx.tb_ctx.tb_invalidated_flag = 0;
>>                  }
>> -                /* see if we can patch the calling TB. When the TB
>> -                   spans two pages, we cannot safely do a direct
>> -                   jump. */
>> -                if (next_tb != 0 && tb->page_addr[1] == -1
>> -                    && !qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
>> +                /* See if we can patch the calling TB. */
>> +                if (next_tb != 0 &&
>> !qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
> A pointer to the definitive comment helps ;-)
>
>                 /* See if we can patch the calling TB, see tcg_gen_goto_tb */

I'm not so sure that the comment for tcg_gen_goto_tb() would be of much
use here. Actually, what we check here is if we know the calling TB
(what is called 'next_tb' here so far) and if logging settings don't
forbid us to chain TBs. The note in the comment for tcg_gen_goto_tb() is
all about when goto_tb TCG ops can be emitted by the target translation
code, not so relevant here, I suppose.

Kind regards,
Sergey

>
>>                      tb_add_jump((TranslationBlock *)(next_tb & ~TB_EXIT_MASK),
>>                                  next_tb & TB_EXIT_MASK, tb);
>>                  }
(snip)
>> diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
>> index c446d3dc7293..ace39619ef89 100644
>> --- a/tcg/tcg-op.h
>> +++ b/tcg/tcg-op.h
>> @@ -753,6 +753,16 @@ static inline void tcg_gen_exit_tb(uintptr_t val)
>>      tcg_gen_op1i(INDEX_op_exit_tb, val);
>>  }
>>
>> +/**
>> + * tcg_gen_goto_tb() - output goto_tb TCG operation
>> + * @idx: Direct jump slot index (0 or 1)
>> + *
>> + * See tcg/README for more info about this TCG operation.
>> + *
>> + * NOTE: Direct jumps with goto_tb are only safe within the pages this TB
>> + * resides in because we don't take care of direct jumps when address mapping
>> + * changes, e.g. in tlb_flush().
>> + */
>>  void tcg_gen_goto_tb(unsigned idx);
>>
>>  #if TARGET_LONG_BITS == 32
