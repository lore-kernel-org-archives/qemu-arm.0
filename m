Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp476555wme;
        Fri, 18 May 2018 08:28:58 -0700 (PDT)
X-Received: by 2002:ac8:2f3b:: with SMTP id j56-v6mr9599560qta.224.1526657338244;
        Fri, 18 May 2018 08:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526657338; cv=none;
        d=google.com; s=arc-20160816;
        b=zmYmvXgKzfsnxZlr+6eesrSY1PaxLLmNleh5Y/X6p9hS4pAzRIgyXbk0+DtSHGQyoL
         N7PqEf/tQBjAAn5q+loBZ4yMT15BEiWKP5mSgw6ws9XsJupoT5JjW39HV4xh3ui/lqr/
         DE4Alx0XbrPVHOVzG0haOjfYmKIJim0RTyVs7IuNNqcHQbAvchcl6wd0CioCsPCLI+7Q
         FFte4LPKgrcSAX8UzIQJsUfiAV03TBFsbtN+qOoWMkFGkEdyCBpKtBRt7eBlukruzpqQ
         Gs8bkrcw+GMPEbdjNNyUQy2QJpFxipLPuqCiPsA05/tqlqFvrXdUU/ePZa95CvbbuvFo
         G+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :sender:dkim-signature:arc-authentication-results;
        bh=08BCZ8XW2Mh5ZK6beTz7V+XH1giEv9mgPNrQKisZw4k=;
        b=fdNkdi/FsqNFbo8B1LcM0AJB/9FPrEU61wgbXb7JmYDLQey2Sj+H3uweKsgen5+LW+
         3ulGT9CKb4tmqR6C60F/x12h0svfAiIvFQFrNYdhwE9zzyNQstJa3d7tGaw2osEGIcii
         Z7d4cQZnKzOa+4YukQ9TrsD0U2I46d3yZ0+al59N7vPq55PjYgfs3N1xhxgn9ATxxTva
         UMs+Zw9EGYkvwGIAo/ENbkrYoPFWjUy9iSVYET1I6a+yrr1xEoz3iGpHYm23OxwdbLjd
         vNcg27lnBcqEybUO6oKaD6g7YqdNSgNIc4FG3qN3iDpESryt7WTtbFy7gc5QA4opfJfU
         AHGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qf2dh+cY;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g46-v6sor5610020qtf.34.2018.05.18.08.28.58
        (Google Transport Security);
        Fri, 18 May 2018 08:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qf2dh+cY;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=08BCZ8XW2Mh5ZK6beTz7V+XH1giEv9mgPNrQKisZw4k=;
        b=qf2dh+cYYtj5ej/LCEqLmtpXNaUWpNnCnMVkYXz2S/7j6iUPDUcXjBc2zYSMZ5CCHN
         hQsOnjcctGi3T3d+vKQ1bjGORF9JFBmaVi3+Wn82AgRW5K0r4OQQ7NAmMJwvjdjYDR7U
         HWS0wCaXHBwQHn/44doN+VTnniQQ9MLqr6qGM9McE4V7Wkkzfzbn3doUZlC0u/KJBOmc
         4oWAfR7+Z3ZIpb3fC5RF7bsvJAB3e7ERpZmJ4/gmwlDQ51NG/7NTMQCMK6xWwN2EWzUO
         HDZ0A+1lfPAoJP7Y36X1gV/DJXnaf35CT6wOem7VpDbCW/Rt4uGwt2RcOkHOH9ZMikNw
         5pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=08BCZ8XW2Mh5ZK6beTz7V+XH1giEv9mgPNrQKisZw4k=;
        b=jKQiURrTOSEho05PtdWF39Xtgla/TA58so81J97DOKqqk1ier5jB2ukXH84yRj8yiW
         EDYijxSy5P8H/lHGbbK4u6jBCAoU20lG+mktPaDjhr38rG3/9quDKQK0jeuvPS156RXc
         VrSCnkveO4UKFZqzwHoxW5mdAY7NIJCw6BhGo94SGqPuZNeiM4tjZyiON1+rQjqjtw7n
         CjF5VQZKlaiulD/SG+4BdCK3ShUvoFDJ8Jit+2+cK3LAYbFmaad25vxXXO6CYCsAvoxw
         9Et+iy8L3E9GbTVEQJ0w9OB2dt7sMzQDeJBVCMDZtxV5WR8bg/xdwUHAfYNnE+MmUcqk
         BXcA==
X-Gm-Message-State: ALKqPwcVcHBYr1PSlrTJjFs7e7ldp22nMPHLZRBgxUEmN7yUvE/ANxSV
	Vb71RQQmChEK//NtCZJsWgzhlNwU
X-Google-Smtp-Source: AB8JxZrcRCB64fsVvdz/4hNj5GJQTq6zcUR1492o8vMXFZWXhYirDoJ/PUIgMalgkX+F4U+DRsJCLQ==
X-Received: by 2002:aed:2ba3:: with SMTP id e32-v6mr9785859qtd.272.1526657337924;
        Fri, 18 May 2018 08:28:57 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.11] ([138.117.48.222])
        by smtp.gmail.com with ESMTPSA id 42-v6sm5593528qte.41.2018.05.18.08.28.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 May 2018 08:28:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v4 27/49] tests/tcg: enable building for ARM
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, cota@braap.org,
 famz@redhat.com, berrange@redhat.com, richard.henderson@linaro.org,
 balrogg@gmail.com, aurelien@aurel32.net, agraf@suse.de,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "open list:ARM" <qemu-arm@nongnu.org>
References: <20180517174718.10107-1-alex.bennee@linaro.org>
 <20180517174718.10107-28-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <13cbc8f7-ed4b-e302-3a6c-b8791a21047b@amsat.org>
Date: Fri, 18 May 2018 12:28:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180517174718.10107-28-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: d8JHNpeO8vaj

On 05/17/2018 02:46 PM, Alex Bennée wrote:
> This allows us to use the docker cross compiler image to build these
> tests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/arm/Makefile.include | 8 ++++++++
>  1 file changed, 8 insertions(+)
>  create mode 100644 tests/tcg/arm/Makefile.include
> 
> diff --git a/tests/tcg/arm/Makefile.include b/tests/tcg/arm/Makefile.include
> new file mode 100644
> index 0000000000..8e7eac008f
> --- /dev/null
> +++ b/tests/tcg/arm/Makefile.include
> @@ -0,0 +1,8 @@
> +# Makefile.include for all ARM targets
> +#
> +# We don't have any bigendian build tools so we only use this for armhf
> +
> +ifeq ($(TARGET_NAME),arm)
> +DOCKER_IMAGE=debian-armhf-cross

[Note for a later series:]
Since this image comes with ARMv7 libraries, I find clearer to rename as
arm32v7, following new Docker scheme. This will ease to add arm32v6 (and
arm32v5 if possible...)

> +DOCKER_CROSS_COMPILER=arm-linux-gnueabihf-gcc
> +endif
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
