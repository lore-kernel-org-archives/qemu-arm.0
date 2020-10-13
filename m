Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2153436lfa;
        Tue, 13 Oct 2020 10:12:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ5uYe+/jHqCEt2HfF/nfdRGHJcFnHTrSLmkhjnhzRSGc522z+9N6hDSluq+quUcz6gxAJ
X-Received: by 2002:a25:d701:: with SMTP id o1mr1250304ybg.453.1602609121159;
        Tue, 13 Oct 2020 10:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602609121; cv=none;
        d=google.com; s=arc-20160816;
        b=Zx7U6eB7DAkzXpiN2v+74JEgDH7vXSiA2N2qq4iAbD5Oq2m74hrRl4NtczPGYMyM5F
         fMcWnQiY+mrRWCywyBaj2Cg+iadxLTDqdEtkZ3lSTpTZzelnHffCrDNxZSDAE8ODcTeC
         aF6VG5o50/oA8WqCG6LlfXOIMQGbCdRYQblga8r/K6SWPcM+9c2e0ROjUIHFtxxy8HF9
         kpdkjHT7cURh8FT+QigO6jHzisJoEeHQ/Ikbq/e2iP05C6BWXi7oW+M5d3ZeunETUm1w
         3D6u0Zo2bbxGp8dELMEzLmv882Un/+1yx7Q5lp3bQ5ojJAXeNn9FgRrcWvees47seDZ2
         vgiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=phxlW6lMRw6L9JtzX5buY0Bt3gqjM+ySf+wKEcRgy3M=;
        b=mV7Vep6UANs7vVIP1WgBcwoSDA1qrhuWovqR6UdWdXY13VfH3BXA31Qy2LPf90uEu5
         UnRjXK660o++5UgxepVXP07uo3dSYvyVoS3sgqVI46GE8+xhUEGsfqK1VTD7Vnc7wAID
         7jzJnuiIbSCnefEViey+v9r75GIUX0Evj+2goaCLm9IP9Fo2wnl0X1w/xL2+R/dm2Z6S
         69fP+632rcU6ZUY+2LMdf1UMv/tzbzx3GOOHE80U+nZ3YmjmhDvESgL6Nv2YM3EPaREe
         ERhklr46J9A+eRXBrgjP3nQBo0LCHq3yiKGk1O+ZQ2vFBQXAI1QPq0M8xmn1VGtdldUN
         yMFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PI1dMTde;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si521048ybs.248.2020.10.13.10.12.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 10:12:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PI1dMTde;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSNqC-0007oX-Et
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 13:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSNpB-0007mp-Ia
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 13:10:57 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:39857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSNp9-0008MS-Gi
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 13:10:57 -0400
Received: by mail-pf1-x443.google.com with SMTP id n14so163590pff.6
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2020 10:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=phxlW6lMRw6L9JtzX5buY0Bt3gqjM+ySf+wKEcRgy3M=;
 b=PI1dMTdebZMGv6Txic44lfk/OPUX1fftcb0kDrlp+xlA9ljXgcePkFkvGGCMtBy+ss
 Z1/mlDElSSw0AR3nX4KuTZR30TFYeqRf5R5V31TZZqiwghDfvnmS9l9HGFG64iprSFwm
 9VnZ7mIDqkL/pD/1D7zCF6XGwimCE/Kpno5sujbq2lXGDPLr+6V9CulzAP1LYgrOUMcc
 IaujTE7ZJNFroYAtBAQ/7IHkoUBD+3Le8+zf+7g6rjYOvXLYrHugyTOTJX91RtlKnfke
 EglyWn974ja0y89niKhMGfc++w/HAgDJh1JUiY7MYVciidIHD6XJmwGjuEixaFUG9Ong
 iA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=phxlW6lMRw6L9JtzX5buY0Bt3gqjM+ySf+wKEcRgy3M=;
 b=S1ngPJqUZaSMXfmtcj/sW7r+LAsorzA2tAlf5SDnWMJPEnXMBgghKHKqUmG+BEOkR+
 Zt24mSCCyZp74IgQO+57m2noeY/yeSnSInsN9YWmc3Hv95GesSMyifKmzzNWSOb+fEZb
 3NkQblfpcga2o7YgxWQmvBgNq/Y+gilcqPFb5ckB32KiONL5vkw6vV+mTgvJuCrRtcoa
 YC7JsPWQ2jPN6DXCbdHK1W4jhgzeTBQSj2rorMdqjBKYe2nk5RnoPNwSaxdKrG8LNGP3
 Rm0B86vVkBYERrjItYj++UZRWxe4Yr6Et9/MFMK7x86AXpGEXjmOjiGasufFl+vbnURj
 R1ZA==
X-Gm-Message-State: AOAM533yCV4FrvA3ptZm1eBkLwEZpsMv+lwVnHYME48AiCZZF8ZEty6t
 KAXhkYjZ+QVQv/90CFZ7ffzFDg==
X-Received: by 2002:a05:6a00:2292:b029:156:8913:e424 with SMTP id
 f18-20020a056a002292b02901568913e424mr144373pfe.56.1602609053515; 
 Tue, 13 Oct 2020 10:10:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 38sm190729pgx.43.2020.10.13.10.10.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 10:10:52 -0700 (PDT)
Subject: Re: [PATCH 07/10] target/arm: Implement v8.1M low-overhead-loop
 instructions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
References: <20201012153746.9996-1-peter.maydell@linaro.org>
 <20201012153746.9996-8-peter.maydell@linaro.org>
 <CAFEAcA_MN4pzkWV65+2VtUgMdayf6pa-RCLXiomCsntF+38hNQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9a06ae91-68e1-47a7-c6aa-19c1e2c47dda@linaro.org>
Date: Tue, 13 Oct 2020 10:10:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_MN4pzkWV65+2VtUgMdayf6pa-RCLXiomCsntF+38hNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1wTT8G83ZkRU

On 10/12/20 12:56 PM, Peter Maydell wrote:
> On Mon, 12 Oct 2020 at 16:37, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> v8.1M's "low-overhead-loop" extension has three instructions
>> for looping:
>>  * DLS (start of a do-loop)
>>  * WLS (start of a while-loop)
>>  * LE (end of a loop)
>>
>> +static bool trans_WLS(DisasContext *s, arg_WLS *a)
>> +{
>> +    /* M-profile low-overhead while-loop start */
>> +    TCGv_i32 tmp;
>> +    TCGLabel *nextlabel;
>> +
>> +    if (!dc_isar_feature(aa32_lob, s)) {
>> +        return false;
>> +    }
>> +    if (a->rn == 13 || a->rn == 15) {
>> +        /* CONSTRAINED UNPREDICTABLE: we choose to UNDEF */
>> +        return false;
>> +    }
>> +
>> +    nextlabel = gen_new_label();
>> +    tcg_gen_brcondi_i32(TCG_COND_NE, cpu_R[a->rn], 0, nextlabel);
>> +    gen_jmp(s, read_pc(s) + a->imm);
>> +
>> +    gen_set_label(nextlabel);
>> +    tmp = load_reg(s, a->rn);
>> +    store_reg(s, 14, tmp);
>> +    gen_jmp(s, s->base.pc_next);
>> +    return true;
>> +}
> 
> This turns out not to work, because gen_jmp() always generates
> a goto-tb for tb exit 0, and we hit the assert() that exit 0
> was not used twice. Here's a fixup to fold into this patch:

Indeed.  I was going to suggest that here you should use arm_gen_condlabel()
like you did for LE.  Which I think would be still cleaner than your fixup patch.


r~
