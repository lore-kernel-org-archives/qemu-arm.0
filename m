Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp915062njb;
        Fri, 6 Dec 2024 07:10:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWIxkNptoKszxClLNWq+qiH++AUQoRafnK/m/gn5mjQ7o9Px9pAz8OM2LkQ8FY+d2NRruQWwaFtk/U3KA==@linaro.org
X-Google-Smtp-Source: AGHT+IFRYFVG1zOv+tsl9Eo9n2p6h0j3i61bDrjtHNoFxx8YS8wXjLat7qe+lfufwqlbTEjWOT8m
X-Received: by 2002:a05:620a:472c:b0:7b6:6a3b:53af with SMTP id af79cd13be357-7b6bcad37a1mr453131085a.14.1733497851029;
        Fri, 06 Dec 2024 07:10:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733497851; cv=none;
        d=google.com; s=arc-20240605;
        b=YvNITAaC6O8jTFFy6IBk1bHS9FjhIx33AU1U/PE5fKfdgiuQeoQu/ZdTaHd3vPoPvA
         nzqzD1Xt2+1cHUAY6I+6Ado+1K7P8NNSVxS0wfXzSysJVQ8mh7vAqfDqMe2Rzv1P+B+1
         VRN56T1MddswrTFiPMj+wccQZFNYa3X1thaaafShxcr/v38e4id4VUCBu7hCcvZ/2TXj
         Aj95RJBwwrw6i+jsVzS0LkQBGlI88U2A0/MWT9n4WCadAKtkmyLnF2NhZjooDW5oaY4M
         tW8YFDWnGNZofPaVhdxb6bAq/Ln9sehp9gLxzXHuJUT2p0cuwYGilxOIR5PCRLmWvJR+
         IF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=SxL5VbJ0YJpwE8YrwqAvM2EfjoS1W637eH7sVAo2arM=;
        fh=Hpon8ovOCVjc7Kxa+UA/E/oLYc/slEL7HxUBcfXlROU=;
        b=kXjIBT2v3HNU/VDV5QJzx0HeYHufFvl3kifVLaA57Mp2VIC4E0no5CLGrp6pu+ShWy
         lX0YsXHoHUokoeH3llFzB6zZdtt0YmJdwRNLgJPj21HOmHhwvkhyGN992f0gbq2KgpNy
         cyLHQibX/f/nfE52F7iegu7GdMjjYraIRBrwHqSwpwUsvCLp4qGKA6JVkGYt7nLMABDG
         9HG0vYmhu2tB+KYcYgAjjf4yG4OGidfxC+XFLp9c9AFWvCjT5rWwAFk4ORI+LwaP+zIJ
         3JjOFsqSQ4vKjYoZkVY0xTzhsr61ApgTQShNnbVyzovG0zRSxER53dftqKTVotvHRTk5
         BLBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hY1W5CDL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5aaa817si447754085a.430.2024.12.06.07.10.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 07:10:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hY1W5CDL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJZyZ-0005gY-Ff; Fri, 06 Dec 2024 10:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJZyV-0005fb-BZ
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:10:35 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJZyT-00036n-J3
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:10:35 -0500
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3ea78529de1so496204b6e.0
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 07:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733497832; x=1734102632; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SxL5VbJ0YJpwE8YrwqAvM2EfjoS1W637eH7sVAo2arM=;
 b=hY1W5CDL7sjGknNGA6EFrPUnpjzV7e77l2tml8nSsP2PKx9fL4wPFjKzmoET86Oeqj
 Fl+8y1PrZvfO4SQZXhYSpARjxE1p5cvciTUHgNuYuHOvKceQi9pbQX6iz+rgwmUQDytY
 la64K7agQmreib9UbL9TQ6IUgzbQIWZS550C2TAjBrL9p7k7X0rV728CRN05Bfh8Kcr4
 UNAQW5x1OeLf1fiBqi1DoD9wIEjDU9pyNKeXVfz2uMsV/VflvxMWbToMSbwpj3M6YO83
 vJyDdqCID+xaxGp2/BigVOaZXNjU/r7j7+CK2qL6lLV8GlUPOxT9vcchDHrx8+1CeewF
 NeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733497832; x=1734102632;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SxL5VbJ0YJpwE8YrwqAvM2EfjoS1W637eH7sVAo2arM=;
 b=VoF4ezo+/PQUYkUEoucrmjFGQS3mCwCwe0/7HZsg1qRaaLqSK0oL70h1j/IuY6Wng1
 4uGX6mSy7l4gGQLJURtPTvD9IiNLfOpmAG83cT0LSI54nYEmvb2JTQcml05VGSgw1gWe
 XDbdju6Kwn7O9SOSEL1RijmpNFexfncerG+eoeTdB+aa/PH6vkTMjoEfX4O/k1GoYMb/
 8uwtONhqbX7K3wuT9lw87cg0LDCI80ajTUGTI05VCE7MltNUxOg38raCSzJrKyc078eL
 cXgsKBb8K6my3MDYKV0PqqZWKfWAWHIyaKivgobLSU6rfo6Y5Qf5cV04Cq2qRMeyC7Se
 LKrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEgNLlowtScDIPonOlP9CNz02MJrnTxJTcDJHn8Oiz89Z3vWmmTHj5fMLnb7JNuzfZHsDZ3q6swQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywpme1Fd7UOF11PfOYwNBoI/WS9FZWjlfC3k9NvjAGnMWJgfZxY
 pFqqYFQCGbZwe2h0iAa0L61cqjh2Xbgn/hcZAm0I45lSMlOgv3VrK7MYfdlNLhc=
X-Gm-Gg: ASbGncv2v8Vml2Hal4u8Zu4qNRp1xkMeVILgzp0IMVNanvWT8/CRPpI7/0v+JOF9sU/
 8QeFGTbHXZrII3adEEdt/ctSddCiMnRc8j2ZovawZka5epbQSVvtPmhNptkNg3YgheLhtr2Fgmx
 kmq+cDPwqIkCxjhIfiiA7qvqRKBlRUxnh7Ptxb1ln1KIgc9zMxh5s/3SyXaiBiRrvR8Fdtqw6KO
 jFREt7JITYVG3HnIK5UE+YjVJJmfuSjfHOjaTOAnNEZWc63FXYxpCvM8JRyWR/2+fdXfB17/nSW
 bUbgktzyRIraueqYEC5rX/p/vD6Z
X-Received: by 2002:a05:6808:ed0:b0:3e7:c7c1:e6cf with SMTP id
 5614622812f47-3eb19e0d4e4mr1405247b6e.43.1733497832211; 
 Fri, 06 Dec 2024 07:10:32 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-29f567602f5sm854842fac.23.2024.12.06.07.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Dec 2024 07:10:31 -0800 (PST)
Message-ID: <b3cd1199-f63f-4383-bc31-3666d2bc9677@linaro.org>
Date: Fri, 6 Dec 2024 09:10:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/67] target/arm: Convert handle_fpfpcvt to decodetree
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-32-richard.henderson@linaro.org>
 <CAFEAcA-11+JX0N4vjU_3WDNVt8nis-+ufANLG2L1TNGZhLcubQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-11+JX0N4vjU_3WDNVt8nis-+ufANLG2L1TNGZhLcubQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: gDctPW0dhPQs

On 12/6/24 07:48, Peter Maydell wrote:
>> +static bool do_fcvt_g(DisasContext *s, arg_fcvt *a,
>> +                      ARMFPRounding rmode, bool is_signed)
>> +{
>> +    TCGv_i64 tcg_int;
>> +    int check = fp_access_check_scalar_hsd(s, a->esz);
>> +
>> +    if (check <= 0) {
>> +        return check == 0;
>> +    }
>> +
>> +    tcg_int = cpu_reg(s, a->rd);
>> +    do_fcvt_scalar(s, (a->sf ? MO_64 : MO_32) | (is_signed ? MO_SIGN : 0),
>> +                   a->esz, tcg_int, a->shift, a->rn, rmode);
>> +
>> +    if (!a->sf) {
>> +        tcg_gen_ext32u_i64(tcg_int, tcg_int);
> 
> For the MO_16 and MO_32 input cases we already did a
> zero-extend-to-64-bits inside do_fcvt_scalar().
> Maybe we should put the tcg_gen_ext32u_i64() also
> inside do_fcvt_scalar() in the cases of MO_64 input
> MO_32 output which are the only ones that actually need it?

I thought about that.

(0) In that case the duplicate zero-extend will be optimized away.

(1) I thought it was clearer to retain the !sf test here rather
     than rely on a zero-extend elsewhere.

(2) In the scalar vector case, the best method for Vd.H is to clear
     the entire vector and only then store the 0th element directly
     from the bottom bits of either TCGv_{i32,i64}.

     Otherwise we wind up with two zero-extends which cannot be folded:
     tcg_gen_ext16u_i32 + tcg_gen_extu_i32_i64 or
     tcg_gen_extu_i32_i64 + tcg_gen_ext16u_i64.
     Fixing this duplication would require new tcg ops to
     extend-and-change-type.

     While Vd.S does not suffer the same fate, it's easiest to use
     the same method as Vd.H.  See patch 55.


r~
