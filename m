Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp498891lff;
        Fri, 30 Jul 2021 12:14:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywFmHxYLnj/mZjrjA6yKhF7yXALQzCaL40r66C2pqA7jSJAKqaLr1F2fAw+tijUua/8qi9
X-Received: by 2002:a05:6902:1106:: with SMTP id o6mr5111962ybu.380.1627672472586;
        Fri, 30 Jul 2021 12:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627672472; cv=none;
        d=google.com; s=arc-20160816;
        b=gcDdjbWRhrPYVBRH+K7Tovrke6qzF4A7saOS7jMZKqnNR6LU/tPw/EafeyiOucoE0W
         SQozD2dZ2fJsh4dEMgKaMWbGn3TykVn4S108NdE83cY+6/pdwNnR96qlElab6hBARj5S
         l4pmiCxCCsq2un8jTzcxi/v+NQ6GfZHkfXs/9LEs+40s6ZyetpLlRHsQ+qy0+v9L4+ED
         OMA/JzpBldSXfUxox3FVDumI1n878IRCM/DF8OEDB7eGb3TdHmh0FSRaDS5wKaj34e6o
         UT7t3FxhObaKzJV+tS3NTXNhONP8dWxqRbWPFRlfgJv6TNts18DifUi0cdNJd6puM+he
         avjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HWTHvKwdKomUUSmcYj0zNGkv8JvI5L/356UjqLXSDdE=;
        b=lzY4uBntVl5fOdGSxUzV5yglpEfsu5QzN69Xv+oUKyqBn65BI6DsZj07rBjWJvm6Bt
         j2EgjuALPvPu+061Wx8hSkHJ7sf0dbmxmK3h1q03JpqtmxK+PRaMwlBAxwdsNBTYFEP2
         rPb6xMw6pQVHKfrV4mL97ZUe6NmMiJPPKSeMpq4Jar4u8SB8qIq2QkOWSFEnHPg0iPDA
         jc27kIL3uA1kTAUZL84vcbfg3lesUs8HZRd+YpJOjHHREOtQVpAQTUZFypKf+m0pqo2o
         vV+IcKJz/JteAvSFVXfINHlEkfWVYVN1cvpDAu4xyHxDjnZMSPfJHanSzbdEGx/qxNrk
         JDhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dSE0YQau;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17si1075563ybc.200.2021.07.30.12.14.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 12:14:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dSE0YQau;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9Xxn-0001R3-W7
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 15:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Xxf-0001Ot-Cb
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:14:23 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Xxd-0007uj-Os
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 15:14:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so22187940pjb.3
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 12:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HWTHvKwdKomUUSmcYj0zNGkv8JvI5L/356UjqLXSDdE=;
 b=dSE0YQauJVYzbyUp73ZCqIDbDuBuuJ2s7JuoNY/pxKCB5gkCWjXgAbcS148TGG4t6a
 9oLs3bqXlq3LiN5emzfnYU/EKIoJNpj0nqbcjf4PoGyjzbewKTeDW2Rr9gpZZbR4MG0G
 yeDUsBNR6L2Vj7NIDTb6T1gRSp9nVspfKo5dsVA1uK56BNC5Qd806p5Sl1iOAznNMMnB
 4qqn/iqhnFMa8WdmiKNt4ARwh1gn1R3rvRbf4q+sXS63E5FYLSlo64btOxnhpecWAEjK
 GLAU6eyAkuQe3Hi1PqzKk/xppWyHh9QCizdjj1uZyGfAPAN0y82f2wozwwDgZDbEg69i
 DOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HWTHvKwdKomUUSmcYj0zNGkv8JvI5L/356UjqLXSDdE=;
 b=h3T49Bf9GyGVaTeweKiRF7iFNoKOB+RpdFUVdLaJl+6cQPlKhpIZ1CEp8k+JSB3e/X
 pCoZf6x6PEtdjcgWnz6u+A3EvKqsZpZLehhidO515W865jronotJd6C7Zey86v17pxTz
 wp8bQ9eCTCiEEmDoWadE2v5vwqaROrE00Q5HQhNV0Y9ujUS4MwEUQ/4xr1bRHHBxrwfq
 v2NVmeqxZgp5n5M0+t1hKHKsSt2clEO9m0QwRv+iw2+zsBlcuEnWxVWHkV9yQWPEFICj
 B0obJg69Jl2nhpwZ40uwcFIm3KaVWxv02ZAuIncVU+kCbpTRrTj/YqM8xCgtWjStATvT
 VDSw==
X-Gm-Message-State: AOAM533Mi/84bOSZFMfgGl4wV1+9Gk3ygKSMXl3u/cFnRTgVe/sw6smj
 UtTAx6IAPuJUMD+B8FPt5lmWqw==
X-Received: by 2002:a17:90a:7505:: with SMTP id
 q5mr4612627pjk.64.1627672460174; 
 Fri, 30 Jul 2021 12:14:20 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id ge21sm2994354pjb.55.2021.07.30.12.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:14:19 -0700 (PDT)
Subject: Re: [PATCH for-6.2 10/53] target/arm: Fix VPT advance when ECI is
 non-zero
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f593a136-7307-61c2-637c-55885ef0c71f@linaro.org>
Date: Fri, 30 Jul 2021 09:14:16 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
X-TUID: Yg/va/14nksm

On 7/29/21 1:14 AM, Peter Maydell wrote:
> We were not paying attention to the ECI state when advancing the VPT
> state.  Architecturally, VPT state advance happens for every beat
> (see the pseudocode VPTAdvance()), so on every beat the 4 bits of
> VPR.P0 corresponding to the current beat are inverted if required,
> and at the end of beats 1 and 3 the VPR MASK fields are updated.
> This means that if the ECI state says we should not be executing all
> 4 beats then we need to skip some of the updating of the VPR that we
> currently do in mve_advance_vpt().
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve_helper.c | 24 +++++++++++++++++-------
>   1 file changed, 17 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
