Received: by 10.25.208.194 with SMTP id h185csp1908733lfg;
        Tue, 19 Apr 2016 06:02:10 -0700 (PDT)
X-Received: by 10.25.160.13 with SMTP id j13mr1117266lfe.57.1461070930461;
        Tue, 19 Apr 2016 06:02:10 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x22c.google.com (mail-lf0-x22c.google.com. [2a00:1450:4010:c07::22c])
        by mx.google.com with ESMTPS id c134si73705lfe.177.2016.04.19.06.02.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Apr 2016 06:02:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::22c as permitted sender) client-ip=2a00:1450:4010:c07::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::22c as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x22c.google.com with SMTP id e190so17928366lfe.0;
        Tue, 19 Apr 2016 06:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=X60gJDYFmAmLgnKJz5YoaaQ0CX49EtDvjawJ0mf+sI0=;
        b=rxXRDsYvCfSTKWYZRmqJQPuNxy5iYVui2BN/x2PMkHVRoJ1+oprVFAUqQonMj/VB3e
         hnt8JqSzEj9d5qcuzHlFRALM837trOgtQPFWz+bYhGjQrcSDiDKi3PHOz1g+dULLBCBt
         GUefjYCJd+nxNiHMm+9PHwydNe/T+Fvk53QjwMrU/Tyvc9yb8jCRW6NwaVnYgHZIkRvY
         rKB+WbW9Hm/DCwwhk4gPJNfs4FoxqdudKXCic8HhcF//3P43GD63SfJItvCnIebHEWs8
         lh2mFHAqO6qZNRZMdr2Oz3pSLonWnBsoi4QNLnbmdWL1528MAWvZTp3Bf00kBtZ2yea/
         oeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=X60gJDYFmAmLgnKJz5YoaaQ0CX49EtDvjawJ0mf+sI0=;
        b=VYDLlxgh3oOmfJ9iujWSBxt/RoyUkhVlkE6wPoIbmD0UXC2soh9GL+qx2UKMQvGUZE
         mHHlZgr1OCkMrbEHPW3EB1DgYFKFiRraBqq9K8TGSniJ0R0vulFiLUgxOdPceET3Qha8
         ddwMyNEEsyuqWlFF0HCWebTWOw4VeSa7k3oqHTRfY0YxG7aaqZ1RTvntE8Cdv/UdsuCf
         SxPV5q5ESlDBXm3ptxX4LjlTJEVMlNeGwzW98dw27reB+QXFR8i5965AHQG2jlRGHB6t
         t8YRgIqKR7HEaujehbHdDcQ+5MKeNht38fpXU+89q7ysCrqf1dV8MTD5KNieHKI9ydDK
         XBtg==
X-Gm-Message-State: AOPr4FUv36sdZsAKqeRGKTaD7q99Fw/+CdzrSeQE6EF+hJHdg2SU5is52mVzSNJszAhAOg==
X-Received: by 10.25.91.133 with SMTP id p127mr1452974lfb.14.1461070930081;
        Tue, 19 Apr 2016 06:02:10 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.1.189] ([195.91.132.170])
        by smtp.gmail.com with ESMTPSA id h94sm29156lfi.39.2016.04.19.06.02.08
        (version=TLSv1/SSLv3 cipher=OTHER);
        Tue, 19 Apr 2016 06:02:08 -0700 (PDT)
Subject: Re: [PATCH v3 09/10] tcg: Clean up direct block chaining safety
 checks
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Sergey Fedorov <sergey.fedorov@linaro.org>
References: <1460324732-30330-1-git-send-email-sergey.fedorov@linaro.org>
 <1460324732-30330-10-git-send-email-sergey.fedorov@linaro.org>
 <878u09x21s.fsf@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Walle <michael@walle.cc>,
 Aurelien Jarno <aurelien@aurel32.net>, Leon Alrae <leon.alrae@imgtec.com>,
 Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>,
 Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <57162C50.2000508@gmail.com>
Date: Tue, 19 Apr 2016 16:02:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <878u09x21s.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: jThVdMnuBnpD

On 19/04/16 14:37, Alex Bennée wrote:
> Sergey Fedorov <sergey.fedorov@linaro.org> writes:
(snip)
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
>> +                if (next_tb != 0 && !qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
>>                      tb_add_jump((TranslationBlock *)(next_tb & ~TB_EXIT_MASK),
>>                                  next_tb & TB_EXIT_MASK, tb);
>>                  }
> We've already discussed on IRC the confusion of next_tb ;-)

Yes, I'd rather add a patch to clean up 'next_tb' naming to "tcg: Misc
clean-up patches" series. This series is to deal with direct block
chaining only.

>> diff --git a/target-alpha/translate.c b/target-alpha/translate.c
>> index 5b86992dd367..5fa66309ce2e 100644
>> --- a/target-alpha/translate.c
>> +++ b/target-alpha/translate.c
>> @@ -464,7 +464,10 @@ static bool use_goto_tb(DisasContext *ctx, uint64_t dest)
>>      if (in_superpage(ctx, dest)) {
>>          return true;
>>      }
>> -    /* Check for the dest on the same page as the start of the TB.  */
>> +    /* Direct jumps with goto_tb are only safe within the page this TB resides
>> +     * in because we don't take care of direct jumps when address mapping
>> +     * changes.
>> +     */
> I'm all for harmonising the comments but I think for the common case we
> could refer to a central location for the page linking rules and only
> expand the comment for subtle differences between the front ends.

You mean, it'd be better to put a detailed explanation in a comment for
e.g. tlb_flush() and refer to it in every place like this?


>>      return ((ctx->tb->pc ^ dest) & TARGET_PAGE_MASK) == 0;
>>  }
(snip)
>> diff --git a/target-arm/translate.c b/target-arm/translate.c
>> index 940ec8d981d1..aeb3e84e8d40 100644
>> --- a/target-arm/translate.c
>> +++ b/target-arm/translate.c
>> @@ -4054,7 +4054,12 @@ static inline void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
>>      TranslationBlock *tb;
>>
>>      tb = s->tb;
>> -    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
>> +    /* Direct jumps with goto_tb are only safe within the pages this TB resides
>> +     * in because we don't take care of direct jumps when address mapping
>> +     * changes.
>> +     */
>> +    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
>> +        ((s->pc - 1) & TARGET_PAGE_MASK) == (dest &
>> TARGET_PAGE_MASK)) {
> Isn't this check avoided by the fact the translate loop bails on end_of_page?

A TB can straddle a page boundary in Thumb mode. A TB can begin with an
T32 instruction straddling a page boundary, thus this check should be
useful :)

Kind regards,
Sergey
