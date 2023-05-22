Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1060323ejb;
        Mon, 22 May 2023 01:36:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7uCTAXAfxjd94RUOtrbJ2Mk1nEaCGFyh8JQNjD2tW7xbHNUymOWU/fpQme7ARmXqFcUVpN
X-Received: by 2002:a05:6214:f0a:b0:5ef:4455:fd35 with SMTP id gw10-20020a0562140f0a00b005ef4455fd35mr18590908qvb.4.1684744571604;
        Mon, 22 May 2023 01:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684744571; cv=none;
        d=google.com; s=arc-20160816;
        b=Tsty4NtBdeMICHscIbpRO842lRBJFyHrksTjRVb8WyA7XF52qg1CTJVHS/RF4xsEM9
         UCqocOtgBbQ2l8ZApLZSV53owx4DxvCXWUKcHO+iVDA/WyYfCt6pssfieOwhUcK9rf5P
         QZx/JYakrc7xQGAa3egtCKV4TLKdnDdEspyeNTZtChUAcQWb+4Mit8qlaACyuaA7zzu2
         u3R7X/0U7XilXgkC4JNg1CKGO+m34DTKnoEVOe82tbvA7D2skPGGMt/LAgDgmXKVrJcM
         yLzFxh8ST63jybwki/32vm7CLe6sKrW7VGb5pAI6+YlYzxx3mvJ/P44Lmr6MX/Ppmysn
         TSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=5rQjupu9GicA/BOA6PlqXcc1t9Dba2HBp8MZe7eVLPk=;
        b=bZ0Kqa3gXAP0WFmFalM/QKg8GqV50UyZO3LJWuuEym8d9661YN7izmkMOhZiag/ids
         7YrAwieE3UeaMp9am9F29UxuCq09HqciwHlIhaCEqtsE5Z7PHIqMXf7K+GZcY9rBqLBw
         +PVKHjAOViSQYARDcPwquUvCIbYaKMxwjMwYL+cJic1cYaARIwoGsTxGpu1+fE+TjH7g
         sok2Xu9HT0iwczcgLVr8zorzImJkeyLjPvHxBpqa205WPotVeh8YySVJ3ncvUZkCyZf1
         AlerSa7gQ9kuMho+oK3XgIwwCW/Pna+HP/dVqD/7jTDRZZoskG+J+b98lsqZr6jMv7gS
         6DmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T9UvfNgW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4-20020a056214062400b00618c7a30a50si3198049qvx.504.2023.05.22.01.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 May 2023 01:36:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T9UvfNgW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q111J-0001pC-OZ; Mon, 22 May 2023 04:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q111I-0001ow-Fq
 for qemu-arm@nongnu.org; Mon, 22 May 2023 04:35:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q111E-0006FD-4Q
 for qemu-arm@nongnu.org; Mon, 22 May 2023 04:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684744550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5rQjupu9GicA/BOA6PlqXcc1t9Dba2HBp8MZe7eVLPk=;
 b=T9UvfNgWA3anJiHM6QkAKUNuLzIjckAoaMJfg9N0RYiXZu/MjMfX5klVM4Z5Ad9O/AVjpk
 8NPA72svFpGQRcoBFSevXgsVBZjGwqpLDnQt2kFS8NprGtr6wxSY6oQSyBgrNmegOn0qsG
 5BUeUkMeerpuRxdYM7+3S03sEi+F9CA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-3y8sdRQlMES0w46WLsqWeg-1; Mon, 22 May 2023 04:35:49 -0400
X-MC-Unique: 3y8sdRQlMES0w46WLsqWeg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30620ebd3c2so3687967f8f.0
 for <qemu-arm@nongnu.org>; Mon, 22 May 2023 01:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684744548; x=1687336548;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5rQjupu9GicA/BOA6PlqXcc1t9Dba2HBp8MZe7eVLPk=;
 b=NfVYia9wujNs0qcHxdJHnuzJ0z23wOmQuYgwkvDI+YLCLeAEFMLHomHclsFAXwW0Mu
 PoGjJiWin5R60hPVJZLhqWLc35VBQnNcouCVEyg50FjbAtYlqCUpQRL6TNNEMJnO7voK
 uC3gIv4Eh8Jb2wOhDvfpRYp4IwmBXQ2XRIBg2jSd2V1LCbmx0OfDVBkakeEzPAM+9RXh
 tpB3M+4F9atAPL+rs1kLFRxzSKaClv4bNhXohDOIVt7XvmiVzaW7LDzoP0hXuDurYWfs
 hAdk5MylhpSiYT0z+p8dk2pQBPxL/UJZpgIre1wKxmt/mAgXdFPoM6drwhxdkFQtSMC6
 w8eA==
X-Gm-Message-State: AC+VfDxCA7I2B8daLPKsGj/ZCVvydS5UafRD3icHu9AKuyaQ1LbXjEZ6
 g2MsYqGbTlCAmCaKeWJijNlx03LlW9dneoEil3Trx9RbFc2kHJ/MwGPGB1HVTcCuddJsWWR3r43
 sm21QQ0hQvD8Z
X-Received: by 2002:adf:f28d:0:b0:307:82e3:70cd with SMTP id
 k13-20020adff28d000000b0030782e370cdmr7323645wro.14.1684744547934; 
 Mon, 22 May 2023 01:35:47 -0700 (PDT)
X-Received: by 2002:adf:f28d:0:b0:307:82e3:70cd with SMTP id
 k13-20020adff28d000000b0030782e370cdmr7323626wro.14.1684744547527; 
 Mon, 22 May 2023 01:35:47 -0700 (PDT)
Received: from ?IPV6:2003:cb:c742:c800:d74f:aec6:f8ac:558?
 (p200300cbc742c800d74faec6f8ac0558.dip0.t-ipconnect.de.
 [2003:cb:c742:c800:d74f:aec6:f8ac:558])
 by smtp.gmail.com with ESMTPSA id
 r14-20020adfce8e000000b00306c5900c10sm7006192wrn.9.2023.05.22.01.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 01:35:47 -0700 (PDT)
Message-ID: <698d17f4-8018-41dd-4551-749d715bf71e@redhat.com>
Date: Mon, 22 May 2023 10:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 15/27] target/s390x: Use tcg_gen_qemu_{ld,st}_i128 for
 LPQ, STPQ
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-16-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230520162634.3991009-16-richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.098, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-TUID: +7ALrD5o/h3W

On 20.05.23 18:26, Richard Henderson wrote:
> No need to roll our own, as this is now provided by tcg.
> This was the last use of retxl, so remove that too.

That's nice!

> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-s390x@nongnu.org
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> ---

[...]

>       /* psw.addr */
> @@ -3130,15 +3125,9 @@ static DisasJumpType op_lpd(DisasContext *s, DisasOps *o)
>   
>   static DisasJumpType op_lpq(DisasContext *s, DisasOps *o)
>   {
> -    if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
> -        gen_helper_lpq(o->out, cpu_env, o->in2);
> -    } else if (HAVE_ATOMIC128) {
> -        gen_helper_lpq_parallel(o->out, cpu_env, o->in2);
> -    } else {
> -        gen_helper_exit_atomic(cpu_env);
> -        return DISAS_NORETURN;
> -    }
> -    return_low128(o->out2);
> +    o->out_128 = tcg_temp_new_i128();
> +    tcg_gen_qemu_ld_i128(o->out_128, o->in2, get_mem_index(s),
> +                         MO_TE | MO_128 | MO_ALIGN);
>       return DISAS_NEXT;
>   }
>   
> @@ -4533,14 +4522,11 @@ static DisasJumpType op_stmh(DisasContext *s, DisasOps *o)
>   
>   static DisasJumpType op_stpq(DisasContext *s, DisasOps *o)
>   {
> -    if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
> -        gen_helper_stpq(cpu_env, o->in2, o->out2, o->out);
> -    } else if (HAVE_ATOMIC128) {
> -        gen_helper_stpq_parallel(cpu_env, o->in2, o->out2, o->out);
> -    } else {
> -        gen_helper_exit_atomic(cpu_env);
> -        return DISAS_NORETURN;
> -    }
> +    TCGv_i128 t16 = tcg_temp_new_i128();
> +
> +    tcg_gen_concat_i64_i128(t16, o->out2, o->out);
> +    tcg_gen_qemu_st_i128(t16, o->in2, get_mem_index(s),
> +                         MO_TE | MO_128 | MO_ALIGN);

I briefly glimpsed at tcg_gen_qemu_ld_i128_int (and 
use_two_i64_for_i128()), does this really provide the atomic guarantees 
we need in all cases?

-- 
Thanks,

David / dhildenb

