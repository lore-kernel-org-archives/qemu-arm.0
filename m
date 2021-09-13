Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3800804lfb;
        Mon, 13 Sep 2021 08:53:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwOjPyFK8xF9kMJq9GjcFhqLE9xEAf96FmjCMqhj92nSCcVBP4TgQtI2xu6F/dVVLw8L9K
X-Received: by 2002:a02:1081:: with SMTP id 123mr5321713jay.83.1631548435228;
        Mon, 13 Sep 2021 08:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631548435; cv=none;
        d=google.com; s=arc-20160816;
        b=fvF9MOId4UK6VakiAOarJH/XYPaMTfnjsToZIT16PWJm3c8G1b92wlVhmagYB2HEws
         mmc1V1wcuyZZhefrdY82kzEwDaSG2o0q/EQlOxyCf7wvX+0k2D8aQ0qn16FCUcwnVjYa
         A5QTD/nikWzM+vdJTOBxqOit1IRqN//NjukssQlfl/JsqXkVHr35NYm10/Lsx5gYdfIN
         kq/GLnYvko2icXTikqD1DvKrz4qNoZcXLxZPUivOhhMhq+zLxKKfMOgIIknkRpGT8PRA
         IVFWsqsQzW0A+ahayeUkDJGeZMHz4bpm22FRuKck5n3viTE7XTD/NsvAu34qDRd3l8pA
         suiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+z3EExJbRiXHHo4RCGPl4cSeH4apr0WZRd4aNSuJRwM=;
        b=ek8/DG/+f/BW0lfZF1vexv3gSvq7WtgMryrvew+zSK7tK61unwdmotKUJCNbdfQYhZ
         teNOc+W0vNvxiyt4Sx13tupt1olSEaGlXvhrgVzc106oysF6jwsKk+RuWsJAWboSuKIf
         FI2nYMj+A5RKc1p3CGJ2y5V9wriU048OJ2uiQJ6M2Er8Tx650GD9KI/i6ZkI/shYctzX
         kdHkI83xP+YK5/UqYrpD7jG9yM6Mrxp6uzNs5nppyYCYSrwJM82aW9VyKAlTIEaBUtzJ
         7n0bjDq+xA29L7P2xcKyjO4rcNKBqxb1t6F2cgB6AaiJgmZ4M0lm/zxcGwtFg8axSRsr
         QO1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tOFbpl3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 126si6413621jaw.85.2021.09.13.08.53.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 08:53:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tOFbpl3u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPoHK-0004qW-Jl
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 11:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPoHB-0004pz-88
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 11:53:45 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:40673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPoH9-0003nf-4U
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 11:53:45 -0400
Received: by mail-pl1-x632.google.com with SMTP id n18so6114136plp.7
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+z3EExJbRiXHHo4RCGPl4cSeH4apr0WZRd4aNSuJRwM=;
 b=tOFbpl3uLbXxANYXckAFsvvXFhKhbQcrWCmskx51e6ViKxlGHf3XmGELPmt7Yv5ZLS
 l3P3GauYdZtJM2Z82jwMhJUU4t103MU+gLvY84jHfgEK+uZwzLwXsFKOihc9kCzROwRc
 dbZANzOq5P/It307/+gCp4IRgSrJ5mqnw+4Do4woSIBqvVgbMhAxCtUwuvX6cWg7pkj3
 rR9nDesCjizwHmQXM72Ywcbg6HpMMuAe0T/R2kgmiOq7de5sUqcstvzzxYtq+/r5kudy
 0E33QdB2M10LZ7nJkG37vILpWB7qRm0badal6eiCZXt6H0Ayenn+Xtaj/oY4PGzxPqrP
 Z3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+z3EExJbRiXHHo4RCGPl4cSeH4apr0WZRd4aNSuJRwM=;
 b=m+vifiX/VHAiXJeyvSc+TftATUrIkIyO+8dYUPCkBgDQvhNj6i8OHZVuCXrjrSH9f6
 DZhaM9zoXgBiYVzmiSum+GG2af0py5Bkp2h4OyyKaSVo1dQUizZC8gG3iYx82Ze8IJ+N
 EVJlhyS20Uin1ziewzDdkbx4UCWMy4FzeWsUkALIHBPL2yMyz2fQrmL7G+rFNlKXY+Km
 P52n+22ooVTDBPsjJd9R8BfRNzhlx371ZNklq/E1kOvIF0dKDQVNYAxME6ERb8OxXBip
 Faqze6vdeTV+jRQb6sL9/WZ2LE2kImRGvawkbpgVKCYViVuUAJl0q5nrTG81y6SQG/if
 qvoA==
X-Gm-Message-State: AOAM531h/lkDa7CYlVNgUWYD5AhENu5zZSOzDZPdyBHDoC05iciXVNo4
 ra833ZP0dj1EY+KtCidUW59bmw==
X-Received: by 2002:a17:90b:1b06:: with SMTP id
 nu6mr254707pjb.15.1631548421254; 
 Mon, 13 Sep 2021 08:53:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j5sm7227900pjv.56.2021.09.13.08.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 08:53:40 -0700 (PDT)
Subject: Re: [PATCH v2 09/12] target/arm: Optimize MVE VSHL, VSHR immediate
 forms
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-10-peter.maydell@linaro.org>
 <1a0247d3-f472-546d-b838-dcacb640d282@linaro.org>
 <CAFEAcA-aDJ+14yNwnTmxZSWH=fgtz51CWa2bEahn4oYaWWrQgQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4344169-c9bf-9f5e-efa0-e29759f985c5@linaro.org>
Date: Mon, 13 Sep 2021 08:53:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-aDJ+14yNwnTmxZSWH=fgtz51CWa2bEahn4oYaWWrQgQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xnthS+yX0hUD

On 9/13/21 7:21 AM, Peter Maydell wrote:
> On Mon, 13 Sept 2021 at 14:56, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/13/21 2:54 AM, Peter Maydell wrote:
>>> +static void do_gvec_shri_s(unsigned vece, uint32_t dofs, uint32_t aofs,
>>> +                           int64_t shift, uint32_t oprsz, uint32_t maxsz)
>>> +{
>>> +    /*
>>> +     * We get here with a negated shift count, and we must handle
>>> +     * shifts by the element size, which tcg_gen_gvec_sari() does not do.
>>> +     */
>>> +    shift = -shift;
>>
>> You've already performed the negation in do_2shift_vec.
> 
> Here we are undoing the negation we did there, so as to get a
> "positive means shift right" shift count back again, which is what
> the instruction encoding has and what tcg_gen_gvic_shri() wants.

Ah, I misinterpreted.

>> Perhaps worth placing these functions somewhere we can share code with NEON?  Tactical
>> error, perhaps, open-coding these tests in trans_VSHR_S_2sh and trans_VSHR_U_2sh.
> 
> I'm not convinced the resemblance is close enough to be worth the
> effort...

Yeah, not with the negation bit above.


r~
