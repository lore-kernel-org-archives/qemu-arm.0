Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2252770lfa;
        Sat, 5 Jun 2021 13:30:11 -0700 (PDT)
X-Received: by 2002:a63:5d19:: with SMTP id r25mr10743801pgb.317.1622925011157;
        Sat, 05 Jun 2021 13:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622925011; cv=none;
        d=google.com; s=arc-20160816;
        b=SBixjps0EsneHmFP936d2B8i6nHzWLTHM8IFTJypCp+lpBVjBLzYI8FILpD0ow0+sd
         36bj8dQGLbarkO+Q9yh2YQPiRg9vKxII+QsOjmvPfyEydI8FjT319nTjsSddOBV76J8C
         GrQMgAuolL9D/8E+LiaQSx7I/XaGQ3EOmRozs8WBlh298Ii9KDTfnOmgx5FAwAHUtD/g
         YevMlbpY9jr6uceBf2CbYPKIVmcyH30DP2sz561yOSfqibLA7ktX7EWi2hiFRnHRDRjW
         OmimJ4Pux+sfKSpFn+AutPSiSukk8kCKjSAVs+9TMi6heU0PPfxzf+GpvT4TtFOuxiUG
         4Bmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=MjZDBfmlvEzke8ymEmImo3vV2Zv045gb0iAWw8myGww=;
        b=VflCCzeMYFqAF98C6hXbHCCVp2tcV/0diYOdrqlB7WltOb+yUCJEcdfO5zAQOtu583
         tgLoV0+B79zOlirzSEYcGlVsAhvIjKGHzrxA4OH+pjjpUmRZ1WPQVaspbHJcyL9+xKHw
         kt6yNhltjijL1tF0HntGS+iPVAN6MX2K5vopCfv88voCN3RBB2XeptFNkUN9IGvCHfWt
         Lv/2C0dqUCfnOoEF32YQ4htc2uyXKa8bvWtivlnXy7TwutSKe7ct9YI/wcDewj8eGhIk
         iXvcxiyEAZjuJH0fRvWx+I367IgqqNHp5KMg8iZEkjPlquY9BSjvtULh7EqRniUFF4yB
         JzeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TdU272Hm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p3sor2934446pfb.56.2021.06.05.13.30.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 13:30:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TdU272Hm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MjZDBfmlvEzke8ymEmImo3vV2Zv045gb0iAWw8myGww=;
        b=TdU272HmF4mVhWTpbbo2IkZOEFptPK4GhX8opCCbOEb9o7SYJ4PZ9EpeozCWcr+hVg
         bwmgwzx9yCzP/sBA1NSyBb0c3fHhw0uMmARZ0/1Wka5sbRvATTwIPTpG1bvfK5cYDnz4
         e2duIwbmrZD0d/NxDaMFMFK79csgKS/deNrrz909LjrIjqM5EH77FaCC0LaLxNjMZP36
         +bg8hzL0rGQtPJF+wHJTbCNQBiXi2a6/hJOED9WKmIrgzql8yw1wr7r+27zULBQBcvFE
         +FT/HJaeVg0gLAxPGSI+pns2GCDFXJN38VOHadZhG6kouAssGaACILb3T69iw7dvu5KH
         TaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MjZDBfmlvEzke8ymEmImo3vV2Zv045gb0iAWw8myGww=;
        b=Pt+FisyY2wEUtuzCUE+Di3VmkZ9oCzlAhSEOE52lrq9BgiNebRSTQHzx/N84n5kOvo
         4HYuN9hh2epyy09RuOkqioss0NWOUr5CJHnAatH3P8M5eqAb/H5qBjek3B0OWAQjhat9
         4ernzX0lM/+ip6ftX7ScTKC+0KAb9sxSO3MNhkB9SGYwdcomBcrIcjeEFCXkisRV6GlT
         sRj5kw7cKQWyOcgmRN9DlbYSGt0ViWPAMVuGapgWJLRji6llbiNCvadhu5fpx7DQJ1z+
         MozjIYDMkx39QSX0eoPwrton4JVctDNnewMJ2WoJpJYvUQUJSdm3yeBNYT8i0TcXOtaP
         EUJQ==
X-Gm-Message-State: AOAM531197bE3nKP9d09pixzyliEvyVbi/IFVqnBqRmAeBrn5Wi1mSEg
	fB5O5I0B2gW+cA6Gka4Oe9j6yGXt
X-Google-Smtp-Source: ABdhPJwTj+MY/UODcqDpUYDBnROie7eM+jzGIZGKQRXgSgfZKVP3qsvVFw82PgdHnupZrA7jxbm5jg==
X-Received: by 2002:a05:6a00:810:b029:2ec:3b54:6a89 with SMTP id m16-20020a056a000810b02902ec3b546a89mr10750861pfk.0.1622925010576;
        Sat, 05 Jun 2021 13:30:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id r10sm5362425pga.48.2021.06.05.13.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 13:30:10 -0700 (PDT)
Subject: Re: [PATCH v16 77/99] target/arm: arch_dump: restrict ELFCLASS64 to
 AArch64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-78-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d89b3fad-22fb-9745-e692-9b0616adc001@linaro.org>
Date: Sat, 5 Jun 2021 13:30:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-78-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: JA5DJchUzQ0n

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> this will allow us to restrict more code to TARGET_AARCH64
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

I don't see this as an improvement, necessarily.  IIRC, arch_dump is sysemu only.

I think that for sysemu we should simply work to eliminate qemu-system-arm (or 
conversely, qemu-system-aarch64), running all Arm stuff with one binary.  At 
which point all this ifdeffery must be undone.


> --- a/roms/u-boot
> +++ b/roms/u-boot
> @@ -1 +1 @@
> -Subproject commit b46dd116ce03e235f2a7d4843c6278e1da44b5e1
> +Subproject commit d3689267f92c5956e09cc7d1baa4700141662bff

Mistake.


r~
