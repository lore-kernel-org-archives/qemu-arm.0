Received: by 10.25.150.194 with SMTP id y185csp929567lfd;
        Thu, 10 Nov 2016 09:59:09 -0800 (PST)
X-Received: by 10.28.54.161 with SMTP id y33mr7540442wmh.122.1478800749712;
        Thu, 10 Nov 2016 09:59:09 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x241.google.com (mail-wm0-x241.google.com. [2a00:1450:400c:c09::241])
        by mx.google.com with ESMTPS id g9si2928560wjl.249.2016.11.10.09.59.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2016 09:59:09 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::241 as permitted sender) client-ip=2a00:1450:400c:c09::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x241.google.com with SMTP id u144so4628082wmu.0;
        Thu, 10 Nov 2016 09:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=Gr0sRU+a7ktssnOjQWbRuH0+dnk5wOPmP63PJtDqBZ0=;
        b=fzq4xq3tz8i2p+MoTAZLcSuByTtwBH8as/CQkU+pg2WcTAPMnl5GtTBe6fctMQ+QoL
         UIwYRuJMJnzdlp/jrvl/41B4z5eFDPZWchrNwLd4IOHYRtO+vCCelmPp+KoB7NpkBji3
         RLoooiHQyDAFtV5yroai8cfjY6O3s+2ruqXsYk5/6yZMCd8P5XKQjMymIba8Z8O1Ub5r
         d99A2hlXijJe697pYUcvwGIq4orq65BDYbG8GwS+6mfkXvAd8PCDXkmVE0eIw8WTex+f
         pIAQ8aZ6MrTnn5us/7e0lpzx14C8qYCBpIiN83ruyZ6v27rh2Akaz9cmuujMP1qCKM7b
         PgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=Gr0sRU+a7ktssnOjQWbRuH0+dnk5wOPmP63PJtDqBZ0=;
        b=iJdjDKG4RAp5PKLOuJBu96PnROBU2pl/eLHH0sS439H5002hVFC2FWicyXN+tkdMsB
         5PHB7bCDv6e2rByr0bA5qG504uerilxQKNjXxFzbxHSKNA+yB4QNJNkj8TJFW0JR/gs5
         sJrUJ60bGOE0J6MbqgrTQ5/uYVshQnF8PI7unJiAKjzaPoJuv2O1O4Z64cjubPs3YKlJ
         Wu3dOCRx5VcRiFzA/ze5ro8vR8vrQpE0Bwy5wmALPHRJLYjRfmHCMSGIhfMUHg7dc58j
         XMiQroZptoDZV0Gc7c6Y6hF1mlRUBDEwySWRj6ef5tjqQlVeQOKYxI9vh5lqM+kO0Ihn
         +QBA==
X-Gm-Message-State: ABUngvcJEe1UBdRLukqyOjXxkEFJ2pdruRhMKws9DKSGFpZ0uAtXD1sfsvkL4h2BedOEMQ==
X-Received: by 10.28.135.84 with SMTP id j81mr7518536wmd.127.1478800749370;
        Thu, 10 Nov 2016 09:59:09 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net ([87.111.149.139])
        by smtp.googlemail.com with ESMTPSA id f3sm14183985wmf.10.2016.11.10.09.59.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Nov 2016 09:59:08 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v6 18/19] target-arm: don't generate WFE/YIELD calls for
 MTTCG
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, pbonzini@redhat.com
References: <20161109145748.27282-1-alex.bennee@linaro.org>
 <20161109145748.27282-19-alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, mttcg@greensocs.com, fred.konrad@greensocs.com,
 a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com,
 nikunj@linux.vnet.ibm.com, mark.burton@greensocs.com,
 jan.kiszka@siemens.com, serge.fdrv@gmail.com, peter.maydell@linaro.org,
 claudio.fontana@huawei.com, "open list:ARM" <qemu-arm@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <7d5df909-399b-c5ab-e6b5-a5e2dffdd50f@twiddle.net>
Date: Thu, 10 Nov 2016 18:59:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161109145748.27282-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: VQCF4TkgVN2I

On 11/09/2016 03:57 PM, Alex Bennée wrote:
> The WFE and YIELD instructions are really only hints and in TCG's case
> they were useful to move the scheduling on from one vCPU to the next. In
> the parallel context (MTTCG) this just causes an unnecessary cpu_exit
> and contention of the BQL.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target-arm/op_helper.c     |  7 +++++++
>  target-arm/translate-a64.c |  8 ++++++--
>  target-arm/translate.c     | 20 ++++++++++++++++----
>  3 files changed, 29 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
