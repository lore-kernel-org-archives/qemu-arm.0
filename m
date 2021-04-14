Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5913559lfr;
        Wed, 14 Apr 2021 07:48:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7Xl8L0DPjvtebPOYkAp0a3TbpUV7lwJcs8bOs6C9499H9NJksc9FXmwBcnUKee9gxk3Zs
X-Received: by 2002:a05:6602:2e82:: with SMTP id m2mr31070371iow.70.1618411696975;
        Wed, 14 Apr 2021 07:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618411696; cv=none;
        d=google.com; s=arc-20160816;
        b=B0Rzv3swloOtGzG6J2IjRSlSf73pBE26CiLpF3irmpppU2H/u3rGuV1pbd3hWLHbbU
         WeKBmBj2gpkUQ6bBqcjF9Cp24TOWeHGag08YT2p/f4okTj2pWiMVfh1JLX5dT86wCYgV
         UYpLShm34T0b1tuZDvZiXmPFpAwBTjaT86MUOUEwt+QvBeYtfYJqzij5XhkFHaXpwk8Z
         BiadEJUKWDQ3bHV75D/82Bp5kB+mtLiw/QwM8jtLjwV+GF+X9OhQFspjJozWL58oVu8D
         l9HMoZoCT8n5obISVEie3h4TN8HKLykP1rB0VX/k8Dy6ChQMB/QkHSkRwlywbFoAY5n7
         BYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=hW+lXqSwPWnn3khrPgTt6hu9F40iCdPwDBBfF920vVw=;
        b=xuyEMVudzlIlFdqcEe/hwc2KJVJncQ3v8XaMygK/JQxKpFstFe1s44cx7sXARNr75e
         T434S8xp2QpUAQDAUQD81r86abXcPGvEkxskOsA6qfL7SuX0tJN96TnLUgrKEXM80dqU
         MNmuSYhktKoyf2QDh1VrCghUNDaxCVCmZy+rzzdRIqmfjnHtqQxsl9wNNBTBNUofd2Rn
         hV9WWsisbw20cKod1cAanFPrKOKcJYneMsJgdvTlBKAiPXgXkWJo1EoxEcz/kiJkRfpf
         JiAoIWOecCq8ZLEkPBrlCtHa2gPaEhSJ74bORF8a5m3YCJiH75vqlpIpTUd5iKE4NkJ1
         x37Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CXkiUckP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si1878532jak.89.2021.04.14.07.48.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Apr 2021 07:48:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CXkiUckP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWgoS-0001pX-6C
	for alex.bennee@linaro.org; Wed, 14 Apr 2021 10:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWgo8-0001pL-9j
 for qemu-arm@nongnu.org; Wed, 14 Apr 2021 10:47:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWgo5-0006ul-AP
 for qemu-arm@nongnu.org; Wed, 14 Apr 2021 10:47:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618411671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hW+lXqSwPWnn3khrPgTt6hu9F40iCdPwDBBfF920vVw=;
 b=CXkiUckPCKk1vm+93JOXYZdR3P/6WaqGRWnM1pIDGkREnHjm7jCHWXDfczoSRfcw9R5aDY
 ivWOOCb23w6P0ok3GwKvX/OIVc1EBACEYhLjZSwvUrYFUQoxvQ8qg0XmYKLD8X2a0cAGls
 1tppcsqWweALXZIK5+xZKD6euLSzJJA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-CFr03vHePUOYOcFLiQurkQ-1; Wed, 14 Apr 2021 10:47:49 -0400
X-MC-Unique: CFr03vHePUOYOcFLiQurkQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 h60-20020adf90420000b029010418c4cd0cso321863wrh.12
 for <qemu-arm@nongnu.org>; Wed, 14 Apr 2021 07:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hW+lXqSwPWnn3khrPgTt6hu9F40iCdPwDBBfF920vVw=;
 b=RBPpUvdqfUtV9uIdSUT+GX7EWSQ4UVgvOK6YMxqTPTn6scVz8e+3zCP18bMUzTVzIr
 OaN8Fxq3pTjILTjpVxG4iERle67cOYGYKl/T4HbCbGyaCL58XHWAfR/tGQNKGtXbGho9
 wEyjjV6oW2lKawldTTicY/vH0yZo+q1zjlL32jaMdPpCvyt1jeQdcSWl/jCXCeEzdpif
 QLl1fRZrKhH0vVS0VZCMDCUDt35HJnXeV90dBnqoTXStfxRyfvgu7xc5S2mtzhfAXTcw
 eo0ft7ywHsTxV2aZ8wYlg/bUv/xfyOTVlJbVz7ycQzWkiEzv+OPdA7CU29xSOB2KYG/i
 QtDQ==
X-Gm-Message-State: AOAM532Hrg9NCUREx81ZWNvYUblU7Ac2kQKKTWl55VnycMeSgltmC5nd
 o9qWI1kHxX2nGW7KULwEG9YCOJy0s38MPprYEBad0SkqJkTja5f5ljT13VNDtODNJzHOagesf6y
 CPo87du9mg8Cs9+dzV2bmepFyRbmBLZlVYwe8DW9X24a+6qONxDfqnUXJkBwP
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr3407761wmg.81.1618411668288; 
 Wed, 14 Apr 2021 07:47:48 -0700 (PDT)
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr3407736wmg.81.1618411667889; 
 Wed, 14 Apr 2021 07:47:47 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6470.dip0.t-ipconnect.de. [91.12.100.112])
 by smtp.gmail.com with ESMTPSA id n125sm5634825wme.46.2021.04.14.07.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 07:47:47 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] target/s390x: Fix translation exception on illegal
 instruction
To: Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210414134112.25620-1-iii@linux.ibm.com>
 <20210414134112.25620-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <b47fa95d-e54d-f18d-67f3-b0d1179486ba@redhat.com>
Date: Wed, 14 Apr 2021 16:47:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414134112.25620-2-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZFhQRZol3HkQ

On 14.04.21 15:41, Ilya Leoshkevich wrote:
> Hitting an uretprobe in a s390x TCG guest causes a SIGSEGV. What
> happens is:
> 
> * uretprobe maps a userspace page containing an invalid instruction.
> * uretprobe replaces the target function's return address with the
>    address of that page.
> * When tb_gen_code() is called on that page, tb->size ends up being 0
>    (because the page starts with the invalid instruction), which causes
>    virt_page2 to point to the previous page.
> * The previous page is not mapped, so this causes a spurious
>    translation exception.
> 
> tb->size must never be 0: even if there is an illegal instruction, the
> instruction bytes that have been looked at must count towards tb->size.
> So adjust s390x's translate_one() to act this way for both illegal
> instructions and instructions that are known to generate exceptions.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   target/s390x/translate.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/target/s390x/translate.c b/target/s390x/translate.c
> index 4f953ddfba..e243624d2a 100644
> --- a/target/s390x/translate.c
> +++ b/target/s390x/translate.c
> @@ -6412,7 +6412,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>           qemu_log_mask(LOG_UNIMP, "unimplemented opcode 0x%02x%02x\n",
>                         s->fields.op, s->fields.op2);
>           gen_illegal_opcode(s);
> -        return DISAS_NORETURN;
> +        ret = DISAS_NORETURN;
> +        goto out;
>       }
>   
>   #ifndef CONFIG_USER_ONLY
> @@ -6428,7 +6429,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>           /* privileged instruction */
>           if ((s->base.tb->flags & FLAG_MASK_PSTATE) && (insn->flags & IF_PRIV)) {
>               gen_program_exception(s, PGM_PRIVILEGED);
> -            return DISAS_NORETURN;
> +            ret = DISAS_NORETURN;
> +            goto out;
>           }
>   
>           /* if AFP is not enabled, instructions and registers are forbidden */
> @@ -6455,7 +6457,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>               }
>               if (dxc) {
>                   gen_data_exception(dxc);
> -                return DISAS_NORETURN;
> +                ret = DISAS_NORETURN;
> +                goto out;
>               }
>           }
>   
> @@ -6463,7 +6466,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>           if (insn->flags & IF_VEC) {
>               if (!((s->base.tb->flags & FLAG_MASK_VECTOR))) {
>                   gen_data_exception(0xfe);
> -                return DISAS_NORETURN;
> +                ret = DISAS_NORETURN;
> +                goto out;
>               }
>           }
>   
> @@ -6484,7 +6488,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>               (insn->spec & SPEC_r1_f128 && !is_fp_pair(get_field(s, r1))) ||
>               (insn->spec & SPEC_r2_f128 && !is_fp_pair(get_field(s, r2)))) {
>               gen_program_exception(s, PGM_SPECIFICATION);
> -            return DISAS_NORETURN;
> +            ret = DISAS_NORETURN;
> +            goto out;
>           }
>       }
>   
> @@ -6544,6 +6549,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>       }
>   #endif
>   
> +out:
>       /* Advance to the next instruction.  */
>       s->base.pc_next = s->pc_tmp;
>       return ret;
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

