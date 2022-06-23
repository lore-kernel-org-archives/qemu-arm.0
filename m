Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3232135lft;
        Thu, 23 Jun 2022 13:37:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sE7ijKZd6Fj7DZ0hUFe+QhusmaBglO7F9FiEYg8T7uFky0xaZtiD2nRhMUKPe1Ub0hEEVA
X-Received: by 2002:a0c:c68a:0:b0:46b:8e6b:306 with SMTP id d10-20020a0cc68a000000b0046b8e6b0306mr33975125qvj.7.1656016621960;
        Thu, 23 Jun 2022 13:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656016621; cv=none;
        d=google.com; s=arc-20160816;
        b=SA58555nq/kZC7y2msS1apClqsDkPOmdx+eAjyhyUnaT2PiKH5dmdR77owfwHyd386
         MGWOIjc68xBlaq5O1nXkn2M64e4Vw4rbztDGcRnWm8JCgT0b2GJo4PW4IYOTJkXcxuoV
         eMnSQcaH9AZ2i4RaO0PBAuiTliQgQAisGyQQY5E+vDBCPGNLhrC6t5waY1PQlQ3Mj3FQ
         K/ZONbr2L9M8/fY7Yt24aMwLc2M/upifVxBVmHIoFcTeNMNsc2EEkZxVYiakqvS0rowr
         2973ld1EON0V5kjgd1bB6u1EuufzZdREnXehN4ASxhahXp6AgZHHXIrx0pWP2LffvJmC
         k6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=5lvSv0ZZG0ClKjeNVWxcUG8GbtSlfE5LU4d7yOduDGA=;
        b=s8wNvb5Z4qA2m+lu7SUbZSNsj01FcUcWZaJ4I6bQH960nj5iqhOS6xRkvBbdt+Zf1n
         Cxx5fRv34SS2kI8DblUXhGzp/G9hLyv+tnh8xYiEk7ZsH2P2xtPY7+ma57/KmYINpP1P
         VC5cOsvUS8rgYfCLubM6A/hxBJ00FhIGsZEOm+9D7VdPsZiET09Td831tv+RBBePE2Ne
         /gAM8JIIbrwW+tAD19+d+r3tJyKpEkM0sk8F4rinexbn7HYMfGnWiX3YJGpnJhde3+FT
         mLIf9SXB4g/0NnOEe/rjF7R/sv/c7v9HxU7ZZOEZAnNSZaQwcuRLrVbKv4kY/+gsSUtS
         Tbaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bsGodv2I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf6-20020a0562140e8600b004703e43ffbbsi98855qvb.207.2022.06.23.13.37.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jun 2022 13:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bsGodv2I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o4TZV-0005kc-Dd
	for alex.bennee@linaro.org; Thu, 23 Jun 2022 16:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4TZJ-0005jb-RW
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 16:36:49 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:43877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4TZI-0005sW-6B
 for qemu-arm@nongnu.org; Thu, 23 Jun 2022 16:36:49 -0400
Received: by mail-pg1-x531.google.com with SMTP id 68so483371pgb.10
 for <qemu-arm@nongnu.org>; Thu, 23 Jun 2022 13:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5lvSv0ZZG0ClKjeNVWxcUG8GbtSlfE5LU4d7yOduDGA=;
 b=bsGodv2IqFF1AYZqoJhMdQkktCiF3J0t0AKdHuJYKigJ0kpbg17nTrt6EeN9GAtAxc
 aC/Jv9Zk8fkO2JIrLSjMFj3PLuk38G9/H9Xd8CG4zU8KiJN2oMhJu60QKDNGTGVjXXcG
 DX5+PViR9+wRLQ2fYWWJK7SN14Bz2Gz2E8ilYJ9vzviR8Co6JACbGewIt7S9nXQev3eV
 93Ha6CD5M3MTdnYCGpa6ULvxfnJmBR8Pt4k1TTKVheeyY0aPtsdkA0mVgLQtEcXEXQww
 OZovvae4gTbqUT0texLkFr4orGVfWVSp4SqLfX6wjqyOtrX5c6tnoRNaqzwGsuNQxGwc
 p63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5lvSv0ZZG0ClKjeNVWxcUG8GbtSlfE5LU4d7yOduDGA=;
 b=2NGD5uorTz6oBM5teGjQGAz4HYustRo3bdTpAggn7xb9eLod1r4rbyi/5Ul06n1d3U
 LAYHIFRQ5TzMlOZwNr2xIgMvX6RyHEJWOqlj4Pg3xbOvd8bholUUGqYsTweD+ZLuGwMv
 lgoONBR6Tvc9zY0H2O/tGr1WVCvnLeEIQNeWbVFNozpfw5aryQhOp7ulG5KNoF0belRr
 eL2qdB7ZwJnu/K81rzuyxhccf8I08Z17e1TxHsG/ndecIjtdtRYgS58Kk61rFSQkDoPV
 Fm0VwiG1EmvVOQBu0U5Mc2v1Au05QpzQj3S1dpYWx+UXKY5hP7RGX6IA6dc9ZUNQThah
 j3Vw==
X-Gm-Message-State: AJIora8/6ILp2m8GWIHX4v281B45m3QbtAlnAFA+H8NbiynEDFgCYADZ
 X0iPf6BWXP2UNqKvRsuQSi8zrw==
X-Received: by 2002:a62:ce8a:0:b0:525:706f:14c9 with SMTP id
 y132-20020a62ce8a000000b00525706f14c9mr835855pfg.55.1656016606537; 
 Thu, 23 Jun 2022 13:36:46 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:393f:6246:99c5:ff8a?
 ([2602:ae:1543:f001:393f:6246:99c5:ff8a])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a170902bcc600b0016a61e7f30dsm195189pls.281.2022.06.23.13.36.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 13:36:44 -0700 (PDT)
Message-ID: <c6308243-0742-b9dc-a325-da095e687181@linaro.org>
Date: Thu, 23 Jun 2022 13:36:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 26/51] target/arm: Implement SME LD1, ST1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-27-richard.henderson@linaro.org>
 <CAFEAcA932Ud1PH4Az=NVW02mR8Q_GNmsH-kvLTRZ_TmCR8=Psg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA932Ud1PH4Az=NVW02mR8Q_GNmsH-kvLTRZ_TmCR8=Psg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QbqAxNpJ06sK

On 6/23/22 04:41, Peter Maydell wrote:
>> +/*
>> + * FIXME: The ARMVectorReg elements are stored in host-endian 64-bit units.
>> + * We do not have a defined ordering of the 64-bit units for host-endian
>> + * 128-bit quantities.  For now, just leave the host words in little-endian
>> + * order and hope for the best.
>> + */
> 
> I don't understand this comment. The architecture ought to specify
> what order the two halves of a 128-bit quantity ought to go in the
> ZArray storage. If we can't guarantee that a host int128_t can be
> handled in a way that does the right thing, then we just can't
> use int128_t.

Indeed.  The spec is an array of bits, and the way the indexing is done is equal to 
putting the two 64-bit quantities in little-endian order in our array.  I'll improve the 
comment.


>> +static inline QEMU_ALWAYS_INLINE
>> +void sme_ld1(CPUARMState *env, void *za, uint64_t *vg,
>> +             const target_ulong addr, uint32_t desc, const uintptr_t ra,
>> +             const int esz, uint32_t mtedesc, bool vertical,
>> +             sve_ldst1_host_fn *host_fn,
>> +             sve_ldst1_tlb_fn *tlb_fn,
>> +             ClearFn *clr_fn,
>> +             CopyFn *cpy_fn)
> 
> We now have several rather long functions that are
> pretty complicated and pretty similar handling the various
> SVE and SME loads and stores. Is there really no hope for
> sharing code ?

I'm not sure.  Maybe.  The two issues are:

(1) sve ld4/st4 -- arm didn't make z29-z31 illegal, but defined wraparound to z0.  So I 
pass in a Zreg number not a pointer to those routines.  So the routines can't be reused 
for Zarray without changing that.

(2) sme ld1/st1 vertical slice, which significantly alters the spacing between the elements.

One possibility for these cases is to perform the load into env->some_scratch_space, then 
copy into the final position afterward, and the reverse for stores.

Is that preferable?  Do you see another alternative?


>> +    t_za = get_tile_rowcol(s, a->esz, a->rs, a->za_imm, a->v);
>> +    t_pg = pred_full_reg_ptr(s, a->pg);
>> +    addr = tcg_temp_new_i64();
>> +
>> +    tcg_gen_shli_i64(addr, cpu_reg(s, a->rn), a->esz);
>> +    tcg_gen_add_i64(addr, addr, cpu_reg_sp(s, a->rm));
> 
> Aren't rm and rn the wrong way around here?  The pseudocode
> says that rn is the base (can be SP, not scaled) and rm is
> the offset (can be XZR, scaled by mbytes).

Yep, thanks.


r~
