Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2057904ejq;
        Mon, 8 May 2023 06:49:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6zKcZ+BbHC/1SMLo3+oHs7FeVqNOwsWYrYJj4WJc3AVtuWRC+oCAZfREd3YuAyi0vxhqBw
X-Received: by 2002:a05:6214:5189:b0:5ef:8b9c:aa86 with SMTP id kl9-20020a056214518900b005ef8b9caa86mr12331124qvb.44.1683553775617;
        Mon, 08 May 2023 06:49:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683553775; cv=none;
        d=google.com; s=arc-20160816;
        b=pcPYrwKIz41xoJ143ou0fw4dP5wEBgU4UpBstt1IXqRRNnF/yhFjHsSglzqxmrXsLz
         vt19EfGC+WcbCwXScqZ7r55Hu8ODSJLmR087mXlw5xQTnPxl2BlbgW9ZoItUBpSljVMa
         zYwEcaCk7A2BS0VWR4fwDbGiLppU34dlMAQlTNgKNd/e2vR32P4ClEEWHQZokdYbMQLh
         p0J3eXZ2fjdcqUtJtAsF2mR8p7Mt+AZDcXcTH0AivIWSBz+fAlVZERMmA6LZq08ilcum
         vMfpp8+3yq14YevoDeXXOb1j2Mo49j6MDoV+hScfzljg7xj7VqZd89k2aJNC2zWwlH+b
         cCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IGgQr3+pVtSwHz+pJNHOxqkBexjKhgxUvpEkUbe6oCI=;
        b=FXLrv/d15iXb4NZTlJdP2gdHen45FRd6l6qaCYVA+89j8mmJnX9kFjWrxhBHRw33NS
         5sv8LD820g7RORjTa5I+zZ3e/ciWHN/f13JTgpzpUJmoFL2sp9zZI2Qod+dbzJ4yHtkm
         HLckFDK6F2ohyKwbTZzkHkAcMpXkAwdDVj8V74ZUawX7xRDAmUFTMZxE7JYXjR2Orkh7
         yDUivnVNtz2AUgIvn3Pgc3SIcTB6eCJv/iJb1NtlqRnXx+YamszASrxl38wRe213xb23
         47I8jQD0giSRW4f6c1NKOw1P9EfJUvAotrDGL8rqPXukV3/P3FS7bYw5XTM6U7Y/2S0p
         U/vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y0CtSxBm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020a056214194900b0061b6c884bacsi2957572qvk.463.2023.05.08.06.49.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 06:49:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y0CtSxBm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pw1Eq-0004zM-3V; Mon, 08 May 2023 09:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw1Eo-0004yu-2A
 for qemu-arm@nongnu.org; Mon, 08 May 2023 09:49:14 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw1Em-0003Gf-7R
 for qemu-arm@nongnu.org; Mon, 08 May 2023 09:49:13 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30639daee76so2899933f8f.1
 for <qemu-arm@nongnu.org>; Mon, 08 May 2023 06:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683553750; x=1686145750;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IGgQr3+pVtSwHz+pJNHOxqkBexjKhgxUvpEkUbe6oCI=;
 b=Y0CtSxBmSBs9XFGh9hsyHgGSvYkjzWBn+R7+I1wbhlF/xlBYnoV9EkZxmvbCLl28j4
 K/lj7x70GOzYuzl2//YMPxI9+MZs6y8scAYHz1GN9LktkPkhIy5msrPO6q9gpmtp9q2G
 Ffk4lUlVLZoHvSye7JWnYGe5YXIXpEyx2ONi40ZO1tvrHJ6EGD/uJfUB70j6jFZ/UZxb
 7DtOdnq/7UbywVNlTmZxQu1Sdq863LmTM+5ZTp7hwPG+vYu9pucnR4mijL9R059gbZmu
 LCUzLKpdytWmn44Oo1ddb3QqkJTXqI5yVZfDAvki2k7rYSpBBt03er8Xra9mYf2Pmyys
 hzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683553750; x=1686145750;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IGgQr3+pVtSwHz+pJNHOxqkBexjKhgxUvpEkUbe6oCI=;
 b=V2VSlz+kGvmJi5j/aVIYV2i/Au1dB86m5Rrsc8SVfx9/z2oQJxmAHIpkusyQ/yofJJ
 ooq/Xd4EBACyHiVlJJwG4B+sxhjwFNNxtlhFGS9zbwUU6Vo6jydVEKOL8DPTsekUWing
 2+kB45dmlNjGzBawtp6PClAFZVmEu0XP5Q3Cl8Om/PBOG5FPd4AA7wjWjoFv4/6igGoQ
 NEsNcMIWMW1gJJsDcpX2um5KbQjhMhcuedntWU5q/oWBfiYlVcXlnP2e+pG5ZC9VmvGm
 7hbnvbylvZN24Ag1X8T7+YhFGfnUhJABGF04jlDQkhpAcWJUIT2lvA9MmNCrBC/ZkFXx
 9CnQ==
X-Gm-Message-State: AC+VfDwt5pwA2LN8f+30EryrIMsi2fg/BsFq1nHM8khFhhH8BpaYAuxL
 45d+owzEzmmblkJ1ueLhv4UkSw==
X-Received: by 2002:a5d:46cc:0:b0:307:1bba:ea61 with SMTP id
 g12-20020a5d46cc000000b003071bbaea61mr7511997wrs.44.1683553750427; 
 Mon, 08 May 2023 06:49:10 -0700 (PDT)
Received: from [10.248.102.233] (5d600b65.skybroadband.com. [93.96.11.101])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a5d4104000000b00304832cd960sm11279977wrp.10.2023.05.08.06.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 06:49:09 -0700 (PDT)
Message-ID: <3c37f8de-7d16-01f8-345f-67ff81ae0089@linaro.org>
Date: Mon, 8 May 2023 14:48:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 15/57] accel/tcg: Use have_atomic16 in
 ldst_atomicity.c.inc
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-16-richard.henderson@linaro.org>
 <CAFEAcA-qe+5+eDdjFUxrOqE4URwsBYdN7Q1_BLbAusGDnaudGw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-qe+5+eDdjFUxrOqE4URwsBYdN7Q1_BLbAusGDnaudGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 25m2DNaAOJs1

On 5/5/23 11:37, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:08, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Hosts using Intel and AMD AVX cpus are quite common.
>> Add fast paths through ldst_atomicity using this.
>>
>> Only enable with CONFIG_INT128; some older clang versions do not
>> support __int128_t, and the inline assembly won't work on structures.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/ldst_atomicity.c.inc | 76 +++++++++++++++++++++++++++-------
>>   1 file changed, 60 insertions(+), 16 deletions(-)
> 
> Inline x86 asm in a bit of generic code seems rather awkward.
> Ideally the compiler should be doing this for us; failing
> that can we at least abstract out the operations to a
> set of functions that we can provide (or not provide)
> implementations of?

This was the best I could come up with, because of the fall through into other generic 
code.  Specific suggestions welcome.


r~

