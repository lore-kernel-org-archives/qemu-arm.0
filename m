Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1527441wrg;
        Mon, 3 Jun 2019 23:52:17 -0700 (PDT)
X-Received: by 2002:a5d:5446:: with SMTP id w6mr5415857wrv.164.1559631137356;
        Mon, 03 Jun 2019 23:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559631137; cv=none;
        d=google.com; s=arc-20160816;
        b=xWNGET92qVEAwNpL/oGn7ePS7vzRfATC0bnDJaHAmpy6DIjWT1z90iiW6XaZWL1JoP
         fhEkjoC2f6XniKMOxWDzFz1IgJvVyXJl65SYEw1NMOugWSRPHwRRTZv9zyWDCUbsP4lg
         OUfgab5jUOfMGWHcgO9UwkNbNTcoJ8/L+Kk/VIRLEketGPYhyb61axLvUR5y74XyoJJv
         CX/zH5LCLPRpuMU7N3O6OtLKHVvwi1O3QaIG9GuC+BSbh3pJkb+g/qVWzTvATCpY6pJJ
         Ow7fHfIniljZxLOxHshy0JB7tihNhaSThvC3c221GpEiyCFk21y/gAtZXd0fuNgGeztw
         RL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=7HyrfWNzOZWqQd/JNP17mo4lQI1otYlyqUO2aPnONbk=;
        b=OXJoEzLm5Pjj0FR1sNHbMROPxeHtrTaGeEMluiYUfTtpuXTvhluBx/90kRNbsS6d33
         YNSPmq5gYOAy3VFQvbOW2OXUnM1zXLXdRhpQw7XYgJjs4TfI6xDcclooDnvBvPciXeI7
         Pqtda2Nh608T3EQ5L+QDBTVQ8M8w8iy70WgvCgo0+LGm0zVYboGgxI1uHfIrvPMdFoUp
         f/2FA9RxFVHiIrLZoghYv4fiBHkdouuCAsoU08Ew5HIW2SGgp5LeK/ypTC6spQEFB0LX
         lhyj0pk8L0JZNHdgEZ/KYlRGCXsLa3PkDPCPUCMiqffdTcz8YfA4Nw3e3Y0SoYew2nBS
         SgSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h184sor7609950wme.25.2019.06.03.23.52.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Jun 2019 23:52:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7HyrfWNzOZWqQd/JNP17mo4lQI1otYlyqUO2aPnONbk=;
        b=dufds5AIr4Mk4H3P3tjBEvbnMDrWpMUk56qg3Av19akpBzBV/qc6UckbAzQk3C/ZpT
         fqXSsX89WTK551rkVWoG6bfob6JIQWphrpWCdXBvsr2srIqFw9lqOh6kZtwA+g8niX+L
         1HdjxlLG4oNfGzIG/18+sBXxQWy9O7Otjoq6L2g3pD2FIELaGbO/t3wPmpPPTFMCikER
         g07gbMXQVYI8nzFwD3ZO9qqx7Hwya7+Z86nN5xSyzPFyD/lg1njS0Q0iYFJALOzbGeWJ
         B2BMmuPKUq3OYo0PnSUpcuFHCIFcJE3/8+NSVd0NPVZsFNVaOFc2fYNWeC1LxwP2XJXn
         ByGA==
X-Gm-Message-State: APjAAAVzCQsw6MXkXJLlYTgKRWk4p+BpCzESLT/een2s7/2fmyNL28fT
	iEKyqqgbUnDmMT9DvylzCfnHig==
X-Google-Smtp-Source: APXvYqxvCDxj5abiAoMvc1ma3ADjGZln8AdJ7FO7nvcBwAe9dFFALK7Gj4ZIUDF3XSmYhyFqYhiwAw==
X-Received: by 2002:a1c:a848:: with SMTP id r69mr15270410wme.12.1559631137145;
        Mon, 03 Jun 2019 23:52:17 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net. [88.21.202.183])
        by smtp.gmail.com with ESMTPSA id 197sm16541080wma.36.2019.06.03.23.52.15
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 23:52:16 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH] cputlb: use uint64_t for interim values
 for unaligned load
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: 1830872@bugs.launchpad.net, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, randrianasulu@gmail.com,
 Richard Henderson <rth@twiddle.net>
References: <20190603150120.29255-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <818134d1-ca69-c6fe-acd5-6548c61184dc@redhat.com>
Date: Tue, 4 Jun 2019 08:52:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190603150120.29255-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 7AGV+vgQN8CT

On 6/3/19 5:01 PM, Alex Bennée wrote:
> When running on 32 bit TCG backends a wide unaligned load ends up
> truncating data before returning to the guest. We specifically have
> the return type as uint64_t to avoid any premature truncation so we
> should use the same for the interim types.
> 
> Hopefully fixes #1830872

Maybe clearer as:

Fixes: https://bugs.launchpad.net/qemu/+bug/1830872
Fixes: eed5664238e

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  accel/tcg/cputlb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index cdcc3771020..b796ab1cbea 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1303,7 +1303,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCGMemOpIdx oi,
>          && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
>                      >= TARGET_PAGE_SIZE)) {
>          target_ulong addr1, addr2;
> -        tcg_target_ulong r1, r2;
> +        uint64_t r1, r2;
>          unsigned shift;
>      do_unaligned_access:
>          addr1 = addr & ~(size - 1);
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
