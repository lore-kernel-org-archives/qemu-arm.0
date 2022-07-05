Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3642643lft;
        Mon, 4 Jul 2022 20:32:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1umNCBLCTc4QgJQPPqmR0+7ZO+s9AJTKXg2qCULA1JofPkOjCrnLq9XtL/wWbT5BwoPwj/D
X-Received: by 2002:a25:838e:0:b0:66b:add7:f32c with SMTP id t14-20020a25838e000000b0066badd7f32cmr35311433ybk.384.1656991964796;
        Mon, 04 Jul 2022 20:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656991964; cv=none;
        d=google.com; s=arc-20160816;
        b=IolHcGVh0dZbrRZHlufUPcXeJmSE941wHGQpJMhUflTbsCk691asVLUgSokn3lHFI1
         zSUFDJDNTXkLjMGalNbFuyk/cCNGKjvhRUhZ6uLDlEvtNlQERYVE0XVzG+NqvEz5TysA
         mlwYhSo593tWJiYM1Gwv/5HRjxRUlXDexIeRaqUOUKmSAxHNjoa/flAaHUi5NvvyQ4Oz
         AFQ9QQYa5ipgxpZJtO6BW0sVFmJQATLnuP3zyW/Y54aEyAzqSaSg+eWHJiqRIPiCq1Mt
         zF4ZnUGxXdNE7++iETJ3C0kg69bHdlIOgQW1uCDijpks4mHyP+XySyk6ZALsC7LH5A55
         t5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=n+tqJTvn7soNfiKqhPkChiNYQkgp2XITmS45YDF3Ma8=;
        b=QbWeQz8VwVx0lww5vhixtu7cBOvLuhsrKtWnp7mL5HskprI9BLauDtXJf6gVA/vJrA
         SkR1sWR4ZlcPKaSSDct2dzT6i/O19Vf8euIyFju9VUkojZmmV/x2VKya3zKExLMD3629
         cx+q9IvGggx7br/LnYbLX0Yo+hVWtOwysNoo7wc6rAx0Yj7jO25s6dKEVtSRENqml0sS
         wG3coxWYJsVckUcAz4F0HDqAnbNzRB45uMlxcSWqXeTMp4ZWaskOf3bLloSeTWieiX14
         xij+sx5fS465TudSts0+BNqxUreteHrdck9kPS5O2VYku4AaENnUhnMi9ZRu5DJJpXE4
         nnkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nys2pHb3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z126-20020a256584000000b0066988307799si41433355ybb.512.2022.07.04.20.32.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 20:32:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nys2pHb3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8ZIq-0003Ow-74
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 23:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZIg-0003OH-BD
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 23:32:34 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:35654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZIe-0004sC-S6
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 23:32:34 -0400
Received: by mail-pl1-x636.google.com with SMTP id y18so1930708plb.2
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 20:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=n+tqJTvn7soNfiKqhPkChiNYQkgp2XITmS45YDF3Ma8=;
 b=Nys2pHb3hFXi93JvCvilT9ych7WTQWJDdYv9rdmFYOvIHMMSSpiJDRJ6Z2f8NoR14B
 Ma+fnN1ULyiYYxdXaeXvYARafHMkboyKjSiVEK/w6Y36F1BnbWCp+fN7djRL6GZw7dMa
 2JmuuzfPkeDcWLisPhs8xsFbT17urwzJKJ68kRzwlWLq7WJyLwn2gXGeqpiUxBaP/7c/
 b5uH4o6ia29KXmZ4oP8S4QADmOcA4suLvA5nAvUPUYdRtFpqGBaUThznWU5P/sBw5NXP
 l+vN2nDfp21x+uhhnmCN+M98tjWfkMCV/Yis+4LQig3te8ck9vWlDiZjUM5giHcbvFRx
 zuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=n+tqJTvn7soNfiKqhPkChiNYQkgp2XITmS45YDF3Ma8=;
 b=JraCjiTnBWwxU5N33RD7za5mCuJ4NN2eI4OJb6xDOuHaeCPwLIqViAq1C9STEDzIMO
 wrmoi7hac4ujV2EPCN72EZZ3oH3Gzeb9o6HGtYfqILS+g5N4Z3Pz2zKPOMenF/AIMEV4
 q0p5khvviYm9OlyLBqY55nBlaJrCCwjVpzrEhtJs2cWlpAimQyDVcgtVsudRFdfDalG0
 8RNUPxnzUmntG038jzgiBq6mOWWIGYiOhLzmmrCcpxYZiv+P9PviQ+0Rf5SrWnkC7KLF
 qWpAn2wAo4C1Nj3XDXZTqPem/s0u4BEeBTEQVf/xS/di2xeK08UqXLHJ0Yq0bqmNHYuV
 1Ylw==
X-Gm-Message-State: AJIora9PQz/5eqZK8zHn4ARI3c/7CHL3DNYr5WrZ+DetFSia9HAWqkGi
 E7phnY/MevotVuD35oqfJ1mjDQ==
X-Received: by 2002:a17:90a:e7c6:b0:1ee:fed1:60a4 with SMTP id
 kb6-20020a17090ae7c600b001eefed160a4mr40500500pjb.100.1656991951443; 
 Mon, 04 Jul 2022 20:32:31 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902f14900b0016368840c41sm21855191plb.14.2022.07.04.20.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 20:32:31 -0700 (PDT)
Message-ID: <b09aa13c-d7c1-d80e-fa80-c6720fb0c10a@linaro.org>
Date: Tue, 5 Jul 2022 09:02:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 37/45] linux-user/aarch64: Do not allow duplicate or
 short sve records
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-38-richard.henderson@linaro.org>
 <CAFEAcA81Xc0kXrYTeq+Ck4b9vwu7jOAMerS0s_L0HaqyvfUcJg@mail.gmail.com>
 <1dcf1ad6-eb4e-5c20-b8f7-254eca7f58df@linaro.org>
In-Reply-To: <1dcf1ad6-eb4e-5c20-b8f7-254eca7f58df@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: 73DjMdBb38Dy

On 7/5/22 09:00, Richard Henderson wrote:
> On 7/4/22 17:38, Peter Maydell wrote:
>>>           case TARGET_SVE_MAGIC:
>>> +            if (sve || size < sizeof(struct target_sve_context)) {
>>> +                goto err;
>>> +            }
>>>               if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
>>>                   vq = sve_vq(env);
>>>                   sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
>>> -                if (!sve && size == sve_size) {
>>> +                if (size == sve_size) {
>>>                       sve = (struct target_sve_context *)ctx;
>>>                       break;
>>>                   }
>>
>> On the other hand, the kernel seems to happily allow records
>> which are larger than the SVE_SIG_CONTEXT_SIZE, whereas we
>> ignore the record unless there's an exact size match.
> 
> Yeah, this gets fixed properly in patch 39.
> Perhaps I should simply squash this with that?

Bah!  No, those are two separate checks: the minimum size to contain vq and flags 
(target_sve_context) and the minimum size to contain all of the vector data 
(TARGET_SVE_SIG_CONTEXT_SIZE).

The latter *is* fixed in patch 39, but this one should stay as-is.


r~
