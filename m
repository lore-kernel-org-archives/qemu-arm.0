Received: by 10.25.44.15 with SMTP id s15csp5187362lfs;
        Tue, 11 Jul 2017 11:17:14 -0700 (PDT)
X-Received: by 10.37.27.7 with SMTP id b7mr120205ybb.81.1499797034126;
        Tue, 11 Jul 2017 11:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499797034; cv=none;
        d=google.com; s=arc-20160816;
        b=MCEtbF+I+NIkG667MXvIYKdd5d6Zb8bFzOolisQ+UbC502EX1ZjfKehNFJQSOUEViH
         UAsA4wjMfB4kwM/qlFiES1NkpOkHmOiJ+ZnYCYjTq6eGMsaU970QhmhQIM/H4lArzCng
         qw8zHidfWnZSKAfAgN5yONqUPREBmqek6pZNOVMP8Olsww2vCyPyR9Rx9y44JGdpQJo/
         4UFPDuYl/pv6cVJF/y6L1gfItzDe2+ChIH0ss4W9TBkU/2z6TRmiolCK1zZnOSUYzEA6
         TZWucq+qKaE429wIER8KmoqssH6kNE+iLGe05TkaWzO5Gq0LhxhbESk/eteMLmRGCYi4
         vEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=oS1AfwTjW2L264+elKnzzMwt2l4FpQwg5OiGR6/qHJQ=;
        b=PjscdvWvPe4orGUv/S+aJkWYPqumS/YIlVir0/3/HxjrUfdKOhvBMShQaBwsAIP8F1
         8d2ITJHD5Qgs3goQpdRAjRj4edi5s2RVsEFvIX5oPoefOBtom/9/rkhHhFgi8GLSCmUd
         UfSBQ46j8bcF6Ft6e3J/iBlpmPnT61Wz4Fn4fYpxzhRyY6OddTCwQowS+ehccyL/DJbg
         Lsqc9FcCnw6ikVQT8Z/VBs5QTGtt0LJn0qAUA4i6Mxtn37fpY8m69nbHXrpxDysWufoj
         DC3EsW+gVRSai4Rn+PGDRNAt2XV2EILQTbucvOYptDhLV1bXmT5t/0Rpz6hD6r0vVY4s
         z99g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=gT7rZa+/;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com. [2607:f8b0:400d:c09::242])
        by mx.google.com with ESMTPS id z124si3090ybf.2.2017.07.11.11.17.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 11:17:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) client-ip=2607:f8b0:400d:c09::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=gT7rZa+/;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x242.google.com with SMTP id q66so17017qki.1;
        Tue, 11 Jul 2017 11:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oS1AfwTjW2L264+elKnzzMwt2l4FpQwg5OiGR6/qHJQ=;
        b=gT7rZa+/hrjQJHUN27DpYK0BeSfG8+gobMov5zGMwRn4B09p1KNKRZ/ARDFf/IHdis
         G1IGQ5rAO4KujdwEEmP0yYckwQbrDCHavuKrtiQ+Gs6+pJbq4trovuOcXnYJs14VNw76
         yv/vogpY6X5K8uIK20t3olkSbw3lGOYV7DXoo3e7xooJfMDm8NUQOaD0T5odShwxk2Aq
         3qShb9v4vprLIxm+pwMqJAM0lcvQxeElKibjRt9gRgILo8bgnryznJD3T0SYO0QEqpCc
         6bBMkLK4xuyaquZK+usT+Qr159d5EUm8ZKCw9gFScTpYWI7GwVBQuSwZxA/GWkuQrS3U
         G3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oS1AfwTjW2L264+elKnzzMwt2l4FpQwg5OiGR6/qHJQ=;
        b=aN5owoSn8SG5Hh/Gx/094qDBydptTHKDL28JHJUeI3oLKkp1YA2reHh4jKUrDUBROZ
         n0selvmUixs+mirHYllsU/3iMsMlpl5V5XnY98zdIYFx1gsjl4VB2XS5Cng3fMJs9od2
         bJ4i2Eb50o92MmYOY3/Unbh0dR+8QTVTobQNxtPYAfhxpcvTV4dD9FZrmWJs0L7ksO1K
         k79ulEnnh+6caLR6l704XOHnsv/+XN3ydejpnTlM1b6efdAJKVfoSG0jN5p42q/9k1A9
         m/cuDdHD9IODpTe+n42NduHAdTwJrhI8fl3pZuhwr8VWcV8EkO/Ht1ty8yj/dyIg2TJD
         PAzw==
X-Gm-Message-State: AIVw110L2d1fLo4ZQ1oQScrA2BWt0TX8VkBrNH7tK6yZAIML6RdlLVAc
	7fc/OY7Z4u9Qmw==
X-Received: by 10.55.20.211 with SMTP id 80mr1543546qku.94.1499797033598;
        Tue, 11 Jul 2017 11:17:13 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id q89sm521450qkl.31.2017.07.11.11.17.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 11:17:13 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v3 5/6] target/arm: use gen_goto_tb for ISB handling
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, cota@braap.org
Cc: qemu-devel@nongnu.org, "open list:ARM" <qemu-arm@nongnu.org>
References: <20170711175937.23140-1-alex.bennee@linaro.org>
 <20170711175937.23140-6-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <6dfcb308-c3a6-ee54-baae-0686021ee48a@twiddle.net>
Date: Tue, 11 Jul 2017 08:17:09 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170711175937.23140-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 0qgxZk6u6oK/

On 07/11/2017 07:59 AM, Alex Bennée wrote:
> While an ISB will ensure any raised IRQs happen on the next
> instruction it doesn't cause any to get raised by itself. We can
> therefor use a simple tb exit for ISB instructions and rely on the
> exit_request check at the top of each TB to deal with exiting if
> needed.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/translate-a64.c | 2 +-
>   target/arm/translate.c     | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
