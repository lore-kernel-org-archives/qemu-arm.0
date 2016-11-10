Received: by 10.25.150.194 with SMTP id y185csp924946lfd;
        Thu, 10 Nov 2016 09:48:11 -0800 (PST)
X-Received: by 10.194.93.101 with SMTP id ct5mr5534294wjb.11.1478800091629;
        Thu, 10 Nov 2016 09:48:11 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com. [2a00:1450:400c:c09::244])
        by mx.google.com with ESMTPS id f184si7101452wme.33.2016.11.10.09.48.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2016 09:48:11 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) client-ip=2a00:1450:400c:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x244.google.com with SMTP id g23so4596288wme.1;
        Thu, 10 Nov 2016 09:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=PGcvMewySOvFh0yC0LYDs+iguPNQB6F0m4wxQcwyGgE=;
        b=RPgGd03c3UNOqrHN03F/P6aNmggPsD8sh1vaJGc4IyfsLCSuPqhpW21A+Gi/QlQPri
         NE8LzJIqlISlrFWhuVFbjzjjRC3qBZtN06dN4/PpsqI9vzvKxETVCXr95OGMPezn+NoX
         DCgcoChPB4HzvdYHJRquK6bhhN2uHGKF9UymD01QBVSxvFb/glpmuzBHCDc5pUDtCUab
         GLbFWfGHc0/L3N6LURgf6jjQM+V0gZE5SrzhTGWAt/cQwSkP7A9oxwjrh+284fYe3yUY
         n9EmveycjPr7lH5fu7v0JEuQsEwQnJcUnNel5vwRQAWUS6lJWdVtNqDAsMJbEGMw4s8I
         bSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=PGcvMewySOvFh0yC0LYDs+iguPNQB6F0m4wxQcwyGgE=;
        b=TC5jlPHP1syRZTxkpI5OGHQcO/VNxZEUax37Qg59YlvIYNkdb5DJZP90Bjr8Q7qCBU
         p7Z4puq+lDl7ISJbdKrup5GHGimIDY5bWk+BVi7tpK/wErGpFu+B46oXBG0BekMMfGaa
         NDW06n8r1e6ic9/JWKQie9PN8BxngvM+TXFvdzawQ4hR5pjWFVci/YVQ7Ltc51UzNrdP
         ghPVlUOvQIyVAvsoZjGUV1hlsyfFsgNlIyH6iG1lfZ3ekXvBlM5nJg7XibOfOtMci+46
         lBN4D5zTRTSKmbSp8SuJzpmlkRyqa2rBA7NVKrt8CAwASQA/AWKPJBKFNNzT3AYrQ+Fo
         j3Sg==
X-Gm-Message-State: ABUngvcmIiBQP+BVA7q2aaH8xMWP5IfXHMrLfqouzjFsZFqz2YVaeOIQ2KToaSe/LfKTFQ==
X-Received: by 10.28.103.134 with SMTP id b128mr7505746wmc.54.1478800091199;
        Thu, 10 Nov 2016 09:48:11 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net ([87.111.149.139])
        by smtp.googlemail.com with ESMTPSA id cl10sm6736573wjb.4.2016.11.10.09.48.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2016 09:48:10 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v6 15/19] target-arm/cpu: don't reset TLB structures, use
 cputlb to do it
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, pbonzini@redhat.com
References: <20161109145748.27282-1-alex.bennee@linaro.org>
 <20161109145748.27282-16-alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, mttcg@greensocs.com, fred.konrad@greensocs.com,
 a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com,
 nikunj@linux.vnet.ibm.com, mark.burton@greensocs.com,
 jan.kiszka@siemens.com, serge.fdrv@gmail.com, peter.maydell@linaro.org,
 claudio.fontana@huawei.com, "open list:ARM" <qemu-arm@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <23bbb76b-3009-373e-273e-b22e5a37a19b@twiddle.net>
Date: Thu, 10 Nov 2016 18:48:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161109145748.27282-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 2s2wXUBb2DoW

On 11/09/2016 03:57 PM, Alex Bennée wrote:
> +#ifdef CONFIG_SOFTMMU
> +    memset(env, 0, offsetof(CPUARMState, tlb_table));
> +    tlb_flush(s, 0);
> +#else
>      memset(env, 0, offsetof(CPUARMState, features));
> +#endif

I'd really prefer to see the tlb_flush be moved into parent_reset, so that we 
handle it identically for all targets.

As for the memset, do we really need to distinguish softmmu?  I don't like you 
picking out a variable name within CPU_COMMON.  Better to use empty struct 
markers, like the

       struct {} start_init_save;

that x86 uses.


r~
