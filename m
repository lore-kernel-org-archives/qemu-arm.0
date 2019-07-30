Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3765377wrv;
        Mon, 29 Jul 2019 18:25:50 -0700 (PDT)
X-Received: by 2002:a17:902:aa8a:: with SMTP id d10mr115166127plr.154.1564449950436;
        Mon, 29 Jul 2019 18:25:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564449950; cv=none;
        d=google.com; s=arc-20160816;
        b=rsu/JSSZb9JplGo1vW9s2sCPW5LZ9gIpUR3BpDRqN6YqFiOA8DT0fPWrtkXjV+m9RH
         Vv50As+f1JGGU+dfT3DkO+xMLXQG6dKB+a/nW9e7VELnsNS4GHZwASpuiNFVa19jZVIU
         t0CMdJCWnPlCbyoe6TmcefkGd+1+maL4XWRETLkIZEdHXhCpM/nBRKfRQ/fY7nhJimGH
         wDJONzeXQ/P8cp1Jmcgxr/CjpO6tkSSVsAoyqSSd2PmW5njRwT+mekQE/vtKXVNqLGjn
         4IuwZx2nlcDMWhBWsPKAEsO04ZcX/TaPIIIT+DzgegnURMQ5CyqYorXe+9tvvDCBCqgs
         vn7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=qtiOURiJCf250/lSLL4nQKDPaqIyCQn/F48JhGRvEJ0=;
        b=07mCAdr5Uzw0XZpCSkNesqaR6EXm9KbvsdFWkNhX7+9UR98Bx8Q6ryMD/gTvhagPEj
         fgsBbrCqnQxXL7mrrB6wPBKTfdkq1Ca2JwY1OBvBgujQrPbbC1qC+xKc6xx2f9rVkvN0
         5Joa+nh3gQ2mXPQC3gJXkYc4N44aH1mkkdcRpaumGu9g1byTt5E64aMd2Y9BsaJH1vFe
         Y4oH5x/Ul5XfZXz70WwDHuChkhI4M3XoFfnk/8quipeYI7CpU0mgr4FKK2vU/5A8K0rG
         n70yKlMiBCzOEzPiYP6TIcFsrdKekei0hEaXwm7hpCFuDpLIeUwZ5f3aFE3m2tDK6TsJ
         fpWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fU6oi9ih;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z2sor75751640pjn.1.2019.07.29.18.25.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 18:25:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fU6oi9ih;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qtiOURiJCf250/lSLL4nQKDPaqIyCQn/F48JhGRvEJ0=;
        b=fU6oi9ih4qCC60pXcy07gjvMPvAr1BZ5F2BPCmbHUAXkx+2eBRPougB7hcQw4mexuc
         9aNd6+RoBNbQQUp4CuFe9zbDljAkGt3STI9QIdB5TouZFZWbCyexpvsYOUk6MgilNyot
         Je+/uuUtPMfWBcAVkrHdG52fPJtFZxuo7vyZAimfCnwK1tLRM/4YlnbvRDhBbSGzyY9v
         CMbg0n71mmkZX5ZwoA+BPUsvj1I1uv6msQigXNjzlISGQzn9jt4cpIdnzPJgw2FLNl2o
         gTUzGNCYqjJje3UyiO4MJuGdR0C3HYECKNXPP7CrhbpfTaHkZ+Sz9Drf7K6qZzPYI18v
         4nsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qtiOURiJCf250/lSLL4nQKDPaqIyCQn/F48JhGRvEJ0=;
        b=kP3Kdz71pnIXw6YRB1KHz3QFQmQsSItAoBfyTquZf2DkN5I1QNGMVKz/cyMUxXvo7+
         dViimSW6uTiRrBg7C3O81jQOhtb+usWWv0mzi0NBmhyQpGH514l+YN6lncD8CoG2a0AC
         cP1JjWdc/t+VOGLX9u4kSMSrM4DlPlMt229owqloIcp7eZb94zHm53aE9CxAlPEhf89G
         /fno7fVj90gAdIQ6jVGnZcrbFIrG1cLu/idYTDN0qxdfwMLAD5GbylNzVzhYmT8+Jx09
         uGdf8FdiSkIVfj+8iOAEsr9FIEGmPruv8qqU4r/USxAz5aSLNIwUdJxyq8ZVKL+Piu9k
         ZniQ==
X-Gm-Message-State: APjAAAWrMtUcWgqFMtG+hjD1NRvktqwp8AWscuLs7bFPxCaKwCVQ7/AB
	/ldIkjtb3fcQk3GtDYfeF7DcopLOojv/Ow==
X-Google-Smtp-Source: APXvYqwvEz6uvJTT/fEBmEw218JiMaDLOOcIZPOGga61aLqMPUtCZSZ4GwXN2YMGfhV42Lmx+eZQMQ==
X-Received: by 2002:a17:90a:258b:: with SMTP id k11mr109922299pje.110.1564449949607;
        Mon, 29 Jul 2019 18:25:49 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.101.105] ([75.147.178.105])
        by smtp.gmail.com with ESMTPSA id o128sm68593609pfb.42.2019.07.29.18.25.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 18:25:48 -0700 (PDT)
Subject: Re: [PATCH 13/67] target/arm: Convert Data Processing (reg,
 reg-shifted-reg, imm)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-14-richard.henderson@linaro.org>
 <CAFEAcA-DG5JXVTT5tz7eJa03VWMxmq4RrujbQTk0R7KO-TAa6w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f37848c2-2d74-14c9-1e0f-2026e162aaa0@linaro.org>
Date: Mon, 29 Jul 2019 18:25:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-DG5JXVTT5tz7eJa03VWMxmq4RrujbQTk0R7KO-TAa6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: g5IZl8LoqeLD

On 7/29/19 8:25 AM, Peter Maydell wrote:
> I'm afraid this patch is too big for me to digest :-(
> 
> I just spent about half an hour trying to figure out whether
> the changes just to the thumb dp-immediate insns were right
> and didn't manage to work through it all.

Hmm.  It is probably the largest of the patches, and is caused by me trying to
do all of the insns handled by that one A32 code block.

I could perhaps split this to add fewer insns at a time, but I'd have to leave
the legacy decoder alone until the last patch, when it would go away all at
once.  I'm not sure if that is more or less reviewable.


> Why do we split it up into all these different kinds of patterns
> where some insns have special cases for rn==15 and some have
> special cases for rd==15 ?
> The legacy decoder doesn't seem to do that -- it treats everything
> the same.

It sorta special cases them, without actually diagnosing the UNPREDICTABLE
cases of invalid unused operands.

ARM MOV + MVN special cases:

> -        if (op1 != 0x0f && op1 != 0x0d) {
> -            rn = (insn >> 16) & 0xf;
> -            tmp = load_reg(s, rn);
> -        } else {
> -            tmp = NULL;
> -        }
...
> -        if (op1 != 0x0f && op1 != 0x0d) {
> -            tcg_temp_free_i32(tmp2);
> -        }

Here we have TST, TEQ, CMP, CMN:

> -        case 0x08:
> -            if (set_cc) {
> -                tcg_gen_and_i32(tmp, tmp, tmp2);
> -                gen_logic_CC(tmp);
> -            }
> -            tcg_temp_free_i32(tmp);
> -            break;
> -        case 0x09:
> -            if (set_cc) {
> -                tcg_gen_xor_i32(tmp, tmp, tmp2);
> -                gen_logic_CC(tmp);
> -            }
> -            tcg_temp_free_i32(tmp);
> -            break;
> -        case 0x0a:
> -            if (set_cc) {
> -                gen_sub_CC(tmp, tmp, tmp2);
> -            }
> -            tcg_temp_free_i32(tmp);
> -            break;
> -        case 0x0b:
> -            if (set_cc) {
> -                gen_add_CC(tmp, tmp, tmp2);
> -            }
> -            tcg_temp_free_i32(tmp);
> -            break;

I don't see bit 20 (set_cc) as even being optional in the decode, though rd is
RES0/SBZ and is thus ignoring it is valid for CONSTRAINED UNPREDICTABLE.

Thumb2 MOV, MVN (and the rest UNPREDICTABLE):

>              /* Data processing register constant shift.  */
> -            if (rn == 15) {
> -                tmp = tcg_temp_new_i32();
> -                tcg_gen_movi_i32(tmp, 0);
> -            } else {
> -                tmp = load_reg(s, rn);
> -            }
...
> -                if (rn == 15) {
> -                    tmp = tcg_temp_new_i32();
> -                    tcg_gen_movi_i32(tmp, 0);
> -                } else {
> -                    tmp = load_reg(s, rn);
> -                }

TST, TEQ, CMP, CMN (and the rest UNPREDICTABLE):

> -                } else if (rd != 15) {
> -                    store_reg(s, rd, tmp);
> -                } else {
> -                    tcg_temp_free_i32(tmp);
> -                }

r~
