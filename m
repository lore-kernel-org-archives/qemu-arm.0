Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp910524lfg;
        Tue, 17 Aug 2021 15:18:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVrtVULlzDAB2vdj3eCBSmxVSBrj7TNGcggAGzJjsKYtTMBhUyzlWli/V1Y3z5nWhIESUK
X-Received: by 2002:a1f:7d84:: with SMTP id y126mr4952018vkc.12.1629238693537;
        Tue, 17 Aug 2021 15:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629238693; cv=none;
        d=google.com; s=arc-20160816;
        b=kqXSgIEEhS8jFsmefDdpAQRjE+wlMI5tdf51JaPjvGbIz+DjcfeTVZU6GSYqWMtfp4
         mlJayGvhJ6bFtH97x9rld1fR4NlaM9KeYBA5GpeElQBjbdnlRWcAU3Qnrz/f/f7Y+zNx
         lTvGKjqBKigpn7nTkT00+7CWa8FkzKyVPt3vEoEtli4ay27mfQFv7fpKhan2XhxG1lRc
         xnFkiEuM50/EfcbEn9V8bkvtA3SbNMkZKXSAQTWcd0dAW1hoaKeelN3P9IxAR5mGvNOg
         so2zfRzvW3BeuNMUnMpBwJ7QuTvT/cq8VuDVB/lYt5XBqsb9+VLwgv6B9CXoPpbytwC/
         d1Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=eftd/mW0n2jtT2bgs/6VuS0pVK3ms5OQWOYs7rMQZqI=;
        b=aDgcc0KFQCbFQnXKzKpoCYlmdBsRwiLyiDEkaCkECuvy0Ejva8R7DKEZqkV8wHN2Bm
         69PRuZDAVhxqedXph+paimTqEvD8j1o2PXnc31k4kJX0R/mFzZpQVZBQKJyL9wq6L/fE
         aaOpRk+FmxrZ2bwUxuB1k3I0gAvJgXVQKer7pxzMnrgP9NXVMNqBF9wbBdfTHOnB7q+L
         eTSUuHNwCLNDnSfyDma4SZqUgqJ2kbmOLEea3MKNGuyqVG0hQWfDRYMswaBMapz+IbgP
         KHsl0SU+EwPykbKfmNO0pPimF77v6cnWrR4RhGyEXXtUvhIHAbV0LDW2Y9xxt+plOw9Y
         Nl3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NGu1rVK0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13si2303981uaf.146.2021.08.17.15.18.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 15:18:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NGu1rVK0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mG7PQ-0007b7-Rt
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 18:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG7PE-0007Yp-Il
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 18:18:01 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:43732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mG7PB-0007X6-S2
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 18:18:00 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so1031135pjb.2
 for <qemu-arm@nongnu.org>; Tue, 17 Aug 2021 15:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=eftd/mW0n2jtT2bgs/6VuS0pVK3ms5OQWOYs7rMQZqI=;
 b=NGu1rVK0EDw0LL8gnBu41T10YvBHAmS/Rcn4r7GL0HfXomfU88uiG/2SQOWLeoaMEb
 axLYhtJxc7vESZXyq/iXKKUVR6RPFDl2NShyQgFAMKkZiUqO2A+YinJLZ3s9KhUZipei
 lKbX5MsgBQ27hdg/9C40vGPjka18FK0ShPn9fU4QY5vbGyft/ZHgrVF0j/MBUVzkjmTb
 M7dBKdCXKSgIGrwdN4o506rvQkbJ1G/y6T4t25+4NlMmVjMHIiGlJQ4jaDIq/P46gxq0
 6yeHgUjTrtfdb/PPaphpd3q1migGsFUSLTe4wIS+HzVpOq8WqaQdHSjG75WJlmSPbmUB
 76ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eftd/mW0n2jtT2bgs/6VuS0pVK3ms5OQWOYs7rMQZqI=;
 b=WlUo2m0jW/G1KcVm9DZ8IkEL10NjOPT7BAk7l5bTx8lUXngemyq2xz4gybWRjNR+ND
 ll/oqBmAQzun991BxuPeXDp9TQw8wwEw24z7k24RV+RORynG94x9v6CvI5ih71K2h6hO
 SezZm79otyKwsB96OEKdR0gAwoAl+9pnIkjWcJRrRuf0JNQM2sYDdNWqiGtID2WFqAA3
 bsIJ94KngjffVlaIjIfOboyqUCokOcICzU8mMMlukuDkEuwZWJRUk+Bze5lbXBfGdk5Q
 KwBaYLlN0SscYfDUeLOYref+kYNv8ssGF3AP81lDhGYtUek4YSw+VLFV9tsjdmtKHXI5
 k6mw==
X-Gm-Message-State: AOAM530GUMWH7YJEVctEDuia1r+GgVnAIotkDzLju31IhQ64igQ1GTQn
 uE5yrB92nJaXtWJlk9GK10AVfQ==
X-Received: by 2002:a17:90a:a016:: with SMTP id
 q22mr5899260pjp.34.1629238676297; 
 Tue, 17 Aug 2021 15:17:56 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id q26sm3686046pff.174.2021.08.17.15.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 15:17:56 -0700 (PDT)
Subject: Re: [PATCH 0/2] target/arm: Implement remaining HSTR functionality
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210816180305.20137-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d9fcc66-2551-e45f-6c0b-66314152f1b5@linaro.org>
Date: Tue, 17 Aug 2021 12:17:53 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816180305.20137-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uk7G7ywr0pWA

On 8/16/21 8:03 AM, Peter Maydell wrote:
> Peter Maydell (2):
>    target/arm: Implement HSTR.TTEE
>    target/arm: Implement HSTR.TJDBX

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
