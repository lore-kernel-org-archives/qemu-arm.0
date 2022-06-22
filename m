Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1609259lft;
        Tue, 21 Jun 2022 17:59:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ujyNW8pqsJT7h2MzAaXhy6syL3v1flablFcFEDPfmzFHWLoGXAypcGWDyDx5EZP9w/3Xdg
X-Received: by 2002:a05:620a:1723:b0:6a7:5372:7e6d with SMTP id az35-20020a05620a172300b006a753727e6dmr628673qkb.156.1655859561093;
        Tue, 21 Jun 2022 17:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655859561; cv=none;
        d=google.com; s=arc-20160816;
        b=HL0BqFk8FJQzSg07rrOKLgMaI2SJB2W0L6j9pzboQ2N05rrpPK3qAQk8yNFdZ3nWke
         quBwahGKEoBMtdXB4tcTzBWuU/S5298f6Y3HEovk7ByHz93auYQJDiOFaQCEbXHIP+Zk
         EpZONHhe3gjNWwE8Fs8rWPH/yk5umQQOcWZ1tVz5ulo9aaRlifc6gwrb5NjqibEYH3H2
         XaG0S867wR3oLK1GJSlH6OcQNeRgcU9Xj4LLPXcvXCwDJOQTbIAtcGfvF1SU63WMAi3Z
         pXe6k5mjH/qV/sUCMJDviIKQupCNAjmrAKbbF6REA+JtZgW36I0oW0dO43fXimzXcqbP
         MZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XlwEu6eDlYZosY8WpIoFaBoBML6QsP4gViQYg5GpzQs=;
        b=hTvVf++/XTSeKZwhrUvnNbVVG9P853nFzRf1UqStLuu1cZyBkW/F0m0/tcNQL08267
         ljggX6v4PRNrKXK0vIkZXB43pKvFuzSJ6kvYe1VdQPleRPKK4RswmaiherK6utMyFkvz
         rI/YN3wIsznulSUuQ/olekwPHeX6EQoeqZH/6xSXbDuiGEWmWTN9HTuR30U9vJjCvqIZ
         kJ+k1uuul9IcINt3BEkmk2jCuk/FjjntyYLsU9qHWW+w6F+XOGS5Nyd2dCIh0c/rtFJA
         tmB520mm8QqdYQTKzG0d3DXzO6VUDQxM+cFk4GJw1FGBZkwZ2ss5BtwdZ3rgPm9SvuGa
         pNEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MyvVc6HJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p127-20020a37bf85000000b006a36692e841si10363510qkf.495.2022.06.21.17.59.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jun 2022 17:59:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MyvVc6HJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3oiG-0005wA-G3
	for alex.bennee@linaro.org; Tue, 21 Jun 2022 20:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3ohE-0005uS-Cv
 for qemu-arm@nongnu.org; Tue, 21 Jun 2022 20:58:16 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3ohC-0002DW-HU
 for qemu-arm@nongnu.org; Tue, 21 Jun 2022 20:58:16 -0400
Received: by mail-pj1-x102c.google.com with SMTP id d14so11071652pjs.3
 for <qemu-arm@nongnu.org>; Tue, 21 Jun 2022 17:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XlwEu6eDlYZosY8WpIoFaBoBML6QsP4gViQYg5GpzQs=;
 b=MyvVc6HJHh9Y3SBCp9GDlqL38EGWuwpmej5Vyh5bONPrVC0LJE24/yMfA/TVzV8chJ
 3s/aXHqig9nxFvOfJSB71Fti6nElkDVHYSV0wLxQwjeL5ujFQyqRVFzcnRkHiq5RC0td
 qS5BsuNDK6aVzaI3WCrnvdKHcN32OF8VhyMES8Dib1CCpQ5TkD66OwUY8axxeyfHu5UM
 ca+IxI2zRAJfSDp0XwMIRFIMOT6sM4e0oLXRe9ECpj9ssdb6nMnXA0lLzV5DESNrSONJ
 ZqtaWxZVs9puJxvq0jGrJKEdgEEZJUBCkbQNNs/b5puFcXiD2k7hepspc+rlh49U3nBu
 NuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XlwEu6eDlYZosY8WpIoFaBoBML6QsP4gViQYg5GpzQs=;
 b=e3NCqovtrwifytBMPTTwy3FBVRe22CyU5FxceP7jTOIpcvNOyMiNM+KlDm1ICGzU5H
 2Z/RcP/J/vpDQJoVpZomIDUlbeQBvid2cYQJqxn5pFm9t86T9VMUYqr/vpJmTBz/E3xI
 mcp4azziwaLKD/4VVwXKIJRoxMUkJeOF0RP1ahq66qdiz7mUBkw3aJPNN5XgDaQUHyOq
 tzonGfbYE1F5OL3tAIAv3y2ASS4LnQCesgkVB5SSNzEDXe2FG8n9wycj2rI67uMxVYUC
 CHiYbKA9YAJ7VrLsUcJtDufhaU1yLyLrM7C5SaK6SAxNlvuQtwseP8tq7Prebp25HlbI
 QWhg==
X-Gm-Message-State: AJIora8NvSx06uHonEPccDUCuIlYbLG3uzzuxDbrZOZThUL/Vm+CImAx
 jHab1q33KxDPfwK4dNjXi20VIw==
X-Received: by 2002:a17:903:245:b0:168:efbc:c10 with SMTP id
 j5-20020a170903024500b00168efbc0c10mr31318739plh.71.1655859492876; 
 Tue, 21 Jun 2022 17:58:12 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:8adc:a144:6ec2:4d71?
 ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a17090a928c00b001cd4989fee4sm13023453pjo.48.2022.06.21.17.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 17:58:12 -0700 (PDT)
Message-ID: <a2848fea-8d1f-03eb-2168-3cf5c1eb2de0@linaro.org>
Date: Tue, 21 Jun 2022 17:58:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 23/51] target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-24-richard.henderson@linaro.org>
 <CAFEAcA_f1dtuiTLuwZL+MTeNsJc1fiWUZmRzvZBHAFpbDzu4hg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_f1dtuiTLuwZL+MTeNsJc1fiWUZmRzvZBHAFpbDzu4hg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: q+CBSV95NGdo

On 6/21/22 10:23, Peter Maydell wrote:
>> +static bool trans_RDSVL(DisasContext *s, arg_RDSVL *a)
>> +{
>> +    if (!dc_isar_feature(aa64_sme, s)) {
>> +        return false;
>> +    }
>> +    if (sme_enabled_check(s)) {
>> +        TCGv_i64 reg = cpu_reg(s, a->rd);
>> +        tcg_gen_movi_i64(reg, a->imm * s->svl);
>> +    }
>> +    return true;
>> +}
> 
> I think we should define functions that parallel the SVE
> vec_full_reg_size() and pred_full_reg_size() rather than directly
> looking at s->svl, for consistency with how we did the SVE code.

I had actually been thinking of removing vec_full_reg_size, at least within SVE. 
However... done.  I've propagated the new predicates forward through the following patches 
as well.


r~
