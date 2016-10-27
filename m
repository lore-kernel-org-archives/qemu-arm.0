Received: by 10.80.166.35 with SMTP id d32csp700069edc;
        Thu, 27 Oct 2016 09:10:44 -0700 (PDT)
X-Received: by 10.31.33.65 with SMTP id h62mr7200373vkh.15.1477584644132;
        Thu, 27 Oct 2016 09:10:44 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com. [2607:f8b0:400d:c09::243])
        by mx.google.com with ESMTPS id y25si3653288uaa.104.2016.10.27.09.10.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Oct 2016 09:10:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) client-ip=2607:f8b0:400d:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x243.google.com with SMTP id n189so2849414qke.1;
        Thu, 27 Oct 2016 09:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=wuIUhlOL/6YsoQ6DSnGOqwpsM48AGBIGhr3S43Tt8n4=;
        b=qMytcuVl5J6QVBZYo768OwlOWlf7HOiqnyo4XUrcoCROK72SB/FMoRbByYSH+9knxl
         2z+VGTNwQBjRZrDZdEm+ZTAEeMahf3Ao8AGV1yGKWkqCP3yS2bRm+a45aFRzJ56dT/Ws
         V66yGGRSO53IzNwPInloEpXPljZbDxsEOcEh7FhDsYwPJdPN5wqAd/9EQOJ9iwH+C3LH
         6NAAgS/N3LinOWsZeQwfoaxAo1aTv4Qh9C/uSDhC++8tFQ3CR8aANGgAGncCIEkvrZQF
         fOAcLZdKk4BXKSM+p0bgL9cHCPTIWmfTI0AiRfKbFt9D0/1wJJwX5pj7LXSKu4EHJ83x
         WLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=wuIUhlOL/6YsoQ6DSnGOqwpsM48AGBIGhr3S43Tt8n4=;
        b=JVBqfW3/jpcZdrk1XoKdLRZHLSXiequDAeRGfpS0RwcXaLCafhqie9AnmJ1v0XKJWB
         JBQmtFfx+GjEpBSZiG3gFupBGGBzgAQypBPOvaVpmMHtJGtX8Q4xL0hwbrWdf5mN2mbX
         Oy5aKyL4IvIdtrq7qZlGeqlU/C9LHk4AWkN8CVaKBMi5ISGz40PBtEoxbGPyiY1/oZzV
         Io90d8w3yUSS+46V2n/XG0igGyMgnp3wwfqWgTp9+HbmIaoQJ6YgZ416xC9+CWFyovUz
         t6u+W6cyO5VOEe9mMr2duZs9r8ZsmUWJ16QZDhL5N9rb4DDiyX+arGmNGRAFQ7vuPsTK
         6hyQ==
X-Gm-Message-State: ABUngveiqGIO4PQdatnzqjaeQ+jjFdFKctw7xKzE+3JlmkN2xwAD0W6eqHPxAa06TUb7Uw==
X-Received: by 10.55.77.134 with SMTP id a128mr8120936qkb.157.1477584643679;
        Thu, 27 Oct 2016 09:10:43 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (174-24-157-40.tukw.qwest.net. [174.24.157.40])
        by smtp.googlemail.com with ESMTPSA id w72sm3939493qkb.33.2016.10.27.09.10.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Oct 2016 09:10:42 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v5 30/33] target-arm/cpu: don't reset TLB structures, use
 cputlb to do it
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, pbonzini@redhat.com
References: <20161027151030.20863-1-alex.bennee@linaro.org>
 <20161027151030.20863-31-alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, mttcg@greensocs.com, fred.konrad@greensocs.com,
 a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com,
 nikunj@linux.vnet.ibm.com, mark.burton@greensocs.com,
 jan.kiszka@siemens.com, serge.fdrv@gmail.com, peter.maydell@linaro.org,
 claudio.fontana@huawei.com, "open list:ARM" <qemu-arm@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <fa288bec-8178-590a-db42-abb4c6986db4@twiddle.net>
Date: Thu, 27 Oct 2016 09:10:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161027151030.20863-31-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: xSUPLNvUFFdW

On 10/27/2016 08:10 AM, Alex Bennée wrote:
> cputlb owns the TLB entries and knows how to safely update them in
> MTTCG.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target-arm/cpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 1b9540e..ff8c594 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -121,7 +121,13 @@ static void arm_cpu_reset(CPUState *s)
>
>      acc->parent_reset(s);
>
> +#ifdef CONFIG_SOFTMMU
> +    memset(env, 0, offsetof(CPUARMState, tlb_table));
> +    tlb_flush(s, 0);
> +#else
>      memset(env, 0, offsetof(CPUARMState, features));
> +#endif
> +

Why special case this for softmmu?  And don't we (or if not, shouldn't we) 
handle the tlb_flush generically for reset?


r~
