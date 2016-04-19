Received: by 10.25.208.194 with SMTP id h185csp1918655lfg;
        Tue, 19 Apr 2016 06:17:57 -0700 (PDT)
X-Received: by 10.25.76.68 with SMTP id z65mr1415516lfa.40.1461071877110;
        Tue, 19 Apr 2016 06:17:57 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lf0-x229.google.com (mail-lf0-x229.google.com. [2a00:1450:4010:c07::229])
        by mx.google.com with ESMTPS id v1si122354lbv.53.2016.04.19.06.17.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Apr 2016 06:17:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::229 as permitted sender) client-ip=2a00:1450:4010:c07::229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c07::229 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x229.google.com with SMTP id g184so18398724lfb.3;
        Tue, 19 Apr 2016 06:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=C1aICJDJLu7PAzuBfIfQASi2tp/RFZ0XC23KdbG1fEM=;
        b=MCFLb1NknkmfcySEIYMEDvyjfRNdOc5+ZW2/n4BsiDWdsJ8oVIGxUZ9JoqAZuMvnNK
         vUPnKyFy1DOkMSJ4V4LDtn08TvXhostkRujoikQFGH1C0CJh6xf9jxEi1ByuO5ygPxCA
         r0cbYWut8IAStgGQlCmZFIBlRZ1kFzrndF324UnIlo2FL7q5ZB1SIG6ZfnjLfJT3P9kk
         WVyjmAUA0zU3U/COI+WbqZjy775fvRU8DTDmh1DTY+P+t1dHSdVuh1YiHYkUBnT2Lz1P
         iwYDAtxTy51GrSi3LA3FN5tVtqSWIToiQGXOXP87Jo8Yb0C1mP2vnwNiiVrL/KyqeM8d
         Eluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=C1aICJDJLu7PAzuBfIfQASi2tp/RFZ0XC23KdbG1fEM=;
        b=Um6MUzbHDzncRtgxP8OnC7+yhFClTjmvZ9NsZwfz26ZdKoACVqv1If7V082lP4ztyZ
         gahGWmW6fclXjCqa/yJ/pPrY2U6p6CvcWZJABw24JUvQJTxPR560/sGX19vC8VaDHWnq
         dgrwUk85DM3T+qw8djdn6cfxkHg4r54cqKoq5fGtzNMVbtDUrGbXTsTuduTJP2LPYOfO
         GrYaCjKGTzY4J4ka/vDZpcbWrfF3jXl1bekR6Y9yn9n4BsjxbpXz0bvvOa0l7beMv8tK
         dGriHBRAV54aFsO/yV37i7VOK9dDTBPAYvFcB9ykOSt3sjXvsG0w/ppDQy2ZUMHZZhRk
         c/8Q==
X-Gm-Message-State: AOPr4FXAxYeAOvq1vMEjgzBTcjXyKQjYqfn4onxExDRaKehouocIIa0Z/EFezlbLtQ6utg==
X-Received: by 10.112.155.169 with SMTP id vx9mr1384210lbb.25.1461071876722;
        Tue, 19 Apr 2016 06:17:56 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [192.168.1.189] ([195.91.132.170])
        by smtp.gmail.com with ESMTPSA id tg1sm55147lbb.7.2016.04.19.06.17.54
        (version=TLSv1/SSLv3 cipher=OTHER);
        Tue, 19 Apr 2016 06:17:55 -0700 (PDT)
Subject: Re: [PATCH v3 10/10] tcg: Moderate direct block chaining safety
 checks in user mode
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Sergey Fedorov <sergey.fedorov@linaro.org>
References: <1460324732-30330-1-git-send-email-sergey.fedorov@linaro.org>
 <1460324732-30330-11-git-send-email-sergey.fedorov@linaro.org>
 <8760vdwxqa.fsf@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Riku Voipio <riku.voipio@iki.fi>,
 Blue Swirl <blauwirbel@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Walle <michael@walle.cc>,
 Aurelien Jarno <aurelien@aurel32.net>, Leon Alrae <leon.alrae@imgtec.com>,
 Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>,
 Alexander Graf <agraf@suse.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <57163002.2070803@gmail.com>
Date: Tue, 19 Apr 2016 16:17:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <8760vdwxqa.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: BpBYlsJoCqZe

On 19/04/16 16:10, Alex Bennée wrote:
> Sergey Fedorov <sergey.fedorov@linaro.org> writes:
(snip)
>> diff --git a/target-alpha/translate.c b/target-alpha/translate.c
>> index 5fa66309ce2e..684559e694bd 100644
>> --- a/target-alpha/translate.c
>> +++ b/target-alpha/translate.c
>> @@ -464,11 +464,19 @@ static bool use_goto_tb(DisasContext *ctx, uint64_t dest)
>>      if (in_superpage(ctx, dest)) {
>>          return true;
>>      }
>> +#ifndef CONFIG_USER_ONLY
>>      /* Direct jumps with goto_tb are only safe within the page this TB resides
>>       * in because we don't take care of direct jumps when address mapping
>> -     * changes.
>> +     * changes in system mode.
>>       */
>>      return ((ctx->tb->pc ^ dest) & TARGET_PAGE_MASK) == 0;
>> +#else
>> +    /* In user mode, there's only a static address translation, so the
>> +     * destination address is always valid. TBs are always invalidated properly
>> +     * and direct jumps are reset when mapping attributes change.
>> +     */
>> +    return true;
> The same comment as before with all this repeating boilerplate commentary.

Except this time I can't think of a central place to put such a comment
at. Maybe just drop the comment and get by on just commit message?

Kind regards,
Sergey
