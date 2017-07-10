Received: by 10.25.44.15 with SMTP id s15csp3629983lfs;
        Mon, 10 Jul 2017 09:31:22 -0700 (PDT)
X-Received: by 10.200.40.150 with SMTP id i22mr5089021qti.59.1499704282671;
        Mon, 10 Jul 2017 09:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499704282; cv=none;
        d=google.com; s=arc-20160816;
        b=sWHRc/vHg1tSzcCPle0PDJvb2iPVjwIHQI77m0nEtLemfzmt+3s2iMR+u2v7zU3qex
         TKj6W3fePIq/47Gvq37E++ul0hgrE2AgmPtvSEGI5RUX6225h/lvZnwBKmSfzMq0qqUr
         SK82+tkJkVUYETW4eLXUXy+ous6WP+eyZVmiZXjiWsPme8kJ5l6ozimTGuUEc5GzTCra
         kO2sIWFLh3pVnXeZiT5sdxf550he+schhf1TaL8aV7PWUZedbFiq+JzuoX/j4aSKHOmW
         btBcSxOtX+g3CLuxJZxgQhe64rw5uDahCYCwjMTGRI+juwd3MGRL9vJQrCV1tpDfBamI
         F7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=K+EDivkQxiqGqqnRnfBWRWeckEdETaB4cEO6+iuvHwM=;
        b=aVrK/PESEg+pS48mf9hL+8+hvzyTf49sRst4xlMBzPhAOiRSRaAuw4N8kBW/A/cUB6
         fjDhZ/8yN5doYUAfdUFzQnZKT1NCZ+KxNNCqhutbDtAqj8CP6tAHV1c1SR+P9RpZ3joy
         TsF62z6VcP4oCRKvlEPpE1K7FgZ1l1RJbRYA9J6b5uHfbS8ileklqKoZCDQgBZXcX+MJ
         HOQOS4kadkKJ/hDyKMXT10l9/4+u9Zl+tuWVKqS/ELfDuTJn+fSO3EfTxS2u72ASH3tg
         3gdj0ai7o+zOiS3XpOXzil1yvUA0ZO2oDyQio8FHAl0mUIZOCApg3ohdW1Eer4Tm+VqP
         TaUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=hx8+SgPm;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com. [2607:f8b0:400d:c09::241])
        by mx.google.com with ESMTPS id p188si10933053qkc.290.2017.07.10.09.31.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 09:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) client-ip=2607:f8b0:400d:c09::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=hx8+SgPm;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x241.google.com with SMTP id q66so2361044qki.1;
        Mon, 10 Jul 2017 09:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=K+EDivkQxiqGqqnRnfBWRWeckEdETaB4cEO6+iuvHwM=;
        b=hx8+SgPmNiWHednJlbalqLjxW3PAdo2gufFsA8OvXsOtSlwcN+hn4GHFTcB6AqXJf/
         NMkumVSLhW8jIHFum2FK+lSIbDFOJoJR9QpW+3nmIxAldi+sWkVsRPBLl2KyrG+f405g
         6p+85XNxXM7nQVW9rHJgJMtOs/3mzoqCQwEJCVLThsQup9xdeJSiw+qubsox9zJv4WtX
         IcvEqxHmhLPCsBIx0KYXJzE2X9rYM4zm9RlSZaXFfQyEIkmCh+fnA0bHSBIWGL+DHfTT
         znaTE/W8gwyToXozO0WGR+OnzPid1IOap60uVXMFFxFoeWtJcTPTAD3ng7w/oBB537BW
         KCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K+EDivkQxiqGqqnRnfBWRWeckEdETaB4cEO6+iuvHwM=;
        b=ZNnAT2CYfnuwccZ/kBMNhg2aKw5irJ776xZXphfGX/Edu6HKfyr5dUl/mGLufOUisT
         qa8YVHstSbnAGTyPeuMUBEJZsZPiszP1AIpY25t4/cx49s3N6/U/8joTWyOFz/i6qTG5
         CZ9NNj2dMmS10izfok+zAljU/LL4q8w//LAm/buEanSmUQXAxYBYfnXSb0+mgfE57gSY
         zgx6Ywywemkezz8aYFetD5SKyMAb4u+4p1S3nYTV9jePWYe9vk35tY63ku2784/SDkZo
         VgsIq043atpMuyMX+ys/57z7TGAa+ABR2qAJvzX0HsB9nBU+ToxOIlZoHFKhumb3G/Wo
         LvrA==
X-Gm-Message-State: AIVw1101/3KjXVScZGpAPjA1TqbYez0V97PAcQ9AhqIeVb61H1ppKeA4
	vsS/80OvJwsY+xpURDk=
X-Received: by 10.55.103.194 with SMTP id b185mr5329113qkc.55.1499704282093;
        Mon, 10 Jul 2017 09:31:22 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id q22sm9408282qte.65.2017.07.10.09.31.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 09:31:20 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v1 2/6] target/arm/translate.c: make DISAS_UPDATE match
 declared semantics
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "Emilio G. Cota" <cota@braap.org>, QEMU Developers
 <qemu-devel@nongnu.org>, "open list:ARM" <qemu-arm@nongnu.org>
References: <20170710154749.13624-1-alex.bennee@linaro.org>
 <20170710154749.13624-3-alex.bennee@linaro.org>
 <CAFEAcA8OjCS9=UJ6NV2_PgT7zciOmcnvrzpTY6FL55D8x965aw@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <0b397419-08d4-b29d-028e-fe196d8122a3@twiddle.net>
Date: Mon, 10 Jul 2017 06:31:15 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8OjCS9=UJ6NV2_PgT7zciOmcnvrzpTY6FL55D8x965aw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: GT+t3x4LTRNZ

On 07/10/2017 06:13 AM, Peter Maydell wrote:
> On 10 July 2017 at 16:47, Alex Bennée <alex.bennee@linaro.org> wrote:
>> DISAS_UPDATE should be used when the wider CPU state other than just
>> the PC has been updated and we should therefor exit the TCG runtime
>> and return to the main execution loop rather assuming DISAS_JUMP would
>> do that.
>>
>> As some DISAS_UPDATE users may update the PC dynamically via a helper
>> we also push the updating to the PC to hhe call sites which set
>> ->is_jmp to DISAS_UPDATE.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   target/arm/translate.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/arm/translate.c b/target/arm/translate.c
>> index 0862f9e4aa..f9c4aee1b6 100644
>> --- a/target/arm/translate.c
>> +++ b/target/arm/translate.c
>> @@ -4430,6 +4430,7 @@ static void gen_msr_banked(DisasContext *s, int r, int sysm, int rn)
>>       tcg_temp_free_i32(tcg_tgtmode);
>>       tcg_temp_free_i32(tcg_regno);
>>       tcg_temp_free_i32(tcg_reg);
>> +    gen_set_pc_im(s, s->pc);
>>       s->is_jmp = DISAS_UPDATE;
>>   }
>>
>> @@ -4452,6 +4453,7 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
>>       tcg_temp_free_i32(tcg_tgtmode);
>>       tcg_temp_free_i32(tcg_regno);
>>       store_reg(s, rn, tcg_reg);
>> +    gen_set_pc_im(s, s->pc);
>>       s->is_jmp = DISAS_UPDATE;
>>   }
>>
>> @@ -8058,6 +8060,7 @@ static void gen_srs(DisasContext *s,
>>           tcg_temp_free_i32(tmp);
>>       }
>>       tcg_temp_free_i32(addr);
>> +    gen_set_pc_im(s, s->pc);
>>       s->is_jmp = DISAS_UPDATE;
>>   }
>>
>> @@ -8146,6 +8149,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>>               /* setend */
>>               if (((insn >> 9) & 1) != !!(s->be_data == MO_BE)) {
>>                   gen_helper_setend(cpu_env);
>> +                gen_set_pc_im(s, s->pc);
>>                   s->is_jmp = DISAS_UPDATE;
>>               }
>>               return;
>> @@ -11619,6 +11623,7 @@ static void disas_thumb_insn(CPUARMState *env, DisasContext *s)
>>                   ARCH(6);
>>                   if (((insn >> 3) & 1) != !!(s->be_data == MO_BE)) {
>>                       gen_helper_setend(cpu_env);
>> +                    gen_set_pc_im(s, s->pc);
>>                       s->is_jmp = DISAS_UPDATE;
>>                   }
>>                   break;
>> @@ -12076,7 +12081,6 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>>               break;
>>           case DISAS_NEXT:
>>           case DISAS_UPDATE:
>> -            gen_set_pc_im(dc, dc->pc);
>>               /* fall through */
>>           default:
>>               /* FIXME: Single stepping a WFI insn will not halt the CPU. */
>> @@ -12095,12 +12099,11 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
>>           case DISAS_NEXT:
>>               gen_goto_tb(dc, 1, dc->pc);
>>               break;
>> -        case DISAS_UPDATE:
>> -            gen_set_pc_im(dc, dc->pc);
>> -            /* fall through */
>>           case DISAS_JUMP:
>>               gen_goto_ptr();
>>               break;
>> +        case DISAS_UPDATE:
>> +            /* fall through */
>>           default:
>>               /* indicate that the hash table must be used to find the next TB */
>>               tcg_gen_exit_tb(0);
> 
> I'm not a great fan of this, because we've taken five cases that
> all want the same behaviour for ending the TB, and we've made
> them handle part of it themselves rather than just letting
> the end-of-TB code do it for them.

I agree.

Indeed, the fact that you've found 5 cases that are all the same suggests there 
*should* be common handling for them, and you're undoing that.

Enumeratiors are not expensive.  If you found that none of the existing cases 
works for some case, then add another enumerator.


r~
