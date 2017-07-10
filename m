Received: by 10.25.44.15 with SMTP id s15csp3656151lfs;
        Mon, 10 Jul 2017 09:55:48 -0700 (PDT)
X-Received: by 10.55.60.13 with SMTP id j13mr5579050qka.71.1499705748435;
        Mon, 10 Jul 2017 09:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499705748; cv=none;
        d=google.com; s=arc-20160816;
        b=Z3q0n8tYTEqKC8yu4ipteUoIuJrOlz8/1QZaXOkcAx0SqYHLL9itbRDbwhuhg2b2SA
         d6eF381Z86ej1vMrpfpRrTX3xFtfpubDH+CRkwTV3f1XxB1XMxIdFrquz0mUao6acefv
         6DLpUkz+na3P9UdnESo/Y+ktBWLCrxY6GtVQRmuA5RN55ULBXjVxjJiHruW08XTtm8cx
         RZ9o5R83J5DwkgQwnINinnXWMyYb5XAARGvMFAeD6t90g3mtJnHTYAyJT3azztrJp677
         f5Aag7nHb3qTElMOMgSrwsU0MAkycPxUISYZR1yIOJErXZObwEzB/HRMN0tE7FtrTDA2
         EMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature:arc-authentication-results;
        bh=W/Qur14zB6VBPyK2pDzQwRhPa3i3CbsLBY4QS0CwdDY=;
        b=W3gNSvgs2NIstD07EAk5NGnWGLAkeXEwIZuuTJkHCny9tvyL+MFMrQKrsI1VWiBqgu
         LkaVkgD1mWcT8D36cI9ny7O+GuaSrF6f6MMb1FoEdhho9UgAW+vWhyajCfk3bDCOotee
         yflh4ziIl9XTO/Fagnvzuunrb0ZvL2EulB6M33URu3zTOuPNWskYe2LXRcD908BUye0Q
         qTdUKobB6+u6/Wg/qkxtKEnxImY4PLv2XFTquu1rQhqo3C0FgaaCNFx0fYitpFgotZ8k
         k2tjn7aoEPJtyRqR06cYqngHBIv6xVfhJdtxG3MaBqlsrCcdU7DQbjoYUZ0jm77PwYLL
         oNqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=sLnOfbgR;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com. [2607:f8b0:400d:c09::244])
        by mx.google.com with ESMTPS id m37si12163288qtf.131.2017.07.10.09.55.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 09:55:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) client-ip=2607:f8b0:400d:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=sLnOfbgR;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x244.google.com with SMTP id p21so13587123qke.0;
        Mon, 10 Jul 2017 09:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W/Qur14zB6VBPyK2pDzQwRhPa3i3CbsLBY4QS0CwdDY=;
        b=sLnOfbgRnlCoWZSd3P5ju3IWJsaJYhT71tiD/40bZ/c5FuTMtBsL2GOdG2WTwAIGnt
         av/05RBNQ0vGDZKbLq48IIZHWnUWWt6YdjFsTONDSLtTkWV+yqyVy9oxV3gQekyfFf+1
         g1vC1/NBSLhJp4MoMfUwuvcQ1wZt5Dm0gIFsMRSt0VIcEX2BKA3h7Ms0e5NYWYhqhRku
         DqxB4HYNIB/I7nX26UGW3XL0o/6x9eqtkKWDpWOfox3+d/3mverx14BwkVvZUARU2L2c
         QQ7bQKf4EM0wl9EqW0h0MrMzFuItAji6yB9QuKWCCGCwuMnxjWCxPBvshqJ2YRRKzEuu
         Jy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W/Qur14zB6VBPyK2pDzQwRhPa3i3CbsLBY4QS0CwdDY=;
        b=XacG5QGuhCMZv3idd4LWoAyzZZ8BG8rt8ZVR8iYQTD4dA9Rtz9T48FJiU98LlcxUqc
         A/AlAMRtGVTQWCn3zCQ6kDgCnn/11MHpcoMX8v1mmnhg9PIUcFW7a7mn4lhqQCmyIqKy
         ZLdojKFWsBFbt+TOnlglbneHQhQPkIyqifZpKxha0p90r8VoLB9B6JAtjHTNgRaAclFP
         5sX4MSZLKZYVLsA6lyU+0A78pNcMJDUa+Ls2FjJ8rkRom0y2BzeH8ecHrqfog9aFHxw9
         5SMDPA4TksYNgWj+d6ygiBq9gBl73lOji6AjGkQgKPYK5SVOyNDVi8MLwZ9uDZy+TXK8
         BUmQ==
X-Gm-Message-State: AIVw1128LYGKuN4WWzpF48JbLSWu/bPYxZJU28qO7p9+Yla4vp+RT+tr
	jzAn8RNx3BdYiA==
X-Received: by 10.55.79.198 with SMTP id d189mr4971500qkb.37.1499705747948;
        Mon, 10 Jul 2017 09:55:47 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com. [173.197.98.123])
        by smtp.googlemail.com with ESMTPSA id c18sm10107212qtd.62.2017.07.10.09.55.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 09:55:47 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC PATCH] include/exec/cpu-defs.h: try and make SoftMMU page
 size match target
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, bobby.prani@gmail.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20170710142850.10468-1-alex.bennee@linaro.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <1e34d387-753b-14ff-dcc0-226515ff0124@twiddle.net>
Date: Mon, 10 Jul 2017 06:55:42 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170710142850.10468-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: pieEHcC7Tzxc

On 07/10/2017 04:28 AM, Alex Bennée wrote:
> While the SoftMMU is not emulating the target MMU of a system there is
> a relationship between its page size and that of the target. If the
> target MMU is full featured the functions called to re-fill the
> entries in the SoftMMU entries start moving up the perf profiles. If
> we can we should try and prevent too much thrashing around by having
> the page sizes the same.

What you are changing has absolutely nothing to do with page size.  Mentioning 
page sizes just confuses the issue.

What you're changing is the number of entries in the TLB, and the mapping 
between pages and TLB entries.  And I'm quite certain that you saw a 
performance increase by increasing the size of the TLB.


>   #define CPU_TLB_BITS                                             \
> -    MIN(8,                                                       \
> +    MIN(10,                                                      \

You will find this has broken tcg/arm, because the operand to an armv6 AND 
(immediate) instruction is only 8 bits.

I will grant you that we could do a better job of configuring this across the 
tcg backends.

It also possibly warrants some work in the tcg/arm backend so that armv7 makes 
use of UBFX so that not-ancient arm is not so constrained.


r~
