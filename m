Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp574525lfg;
        Fri, 7 May 2021 10:14:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQODuMz07rPr7cmIbRLxoUq7bJwcQNQGIz1i5E/hfVNvGhMTCgNpLyQCW1T2V8UcV7H9wM
X-Received: by 2002:a17:906:e086:: with SMTP id gh6mr10544748ejb.201.1620407650119;
        Fri, 07 May 2021 10:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620407650; cv=none;
        d=google.com; s=arc-20160816;
        b=WRe79eSM54ANYu1gE18HbFih4k7hCgRqsU+EEFIGmATEtLovqRa4Bfd373x8F/xKDd
         Vi5ETKG9r8nd+KFs5cnCsnxNpluiN3hzNLqK0cGdi8n8tUdNnhDL0ZRBHdCBQSsC/DnZ
         9zyCjKrRX7AoMQUyvwC8pDwtq6v5NTJytwceuM6gJp9FzfW806s47tFvIbm5kCR10wUO
         Jf3OQ2wIZsTh7no5iSTlvsrzOGwzCG7gTNVKugkJOfBphtnGsoG1H+U48PXBUStyOnfk
         +hcOXDONFIfdp9XxtDXMzVNU2MMKNPoWOr/aXaTJTBbOpffcSTQHljPhNVODDSeSat3y
         JKWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=EmQ5kgpbf3169hBJ18Ia3FxprliSdUJRha7Gey5ycN8=;
        b=lp4xtjY0LGd5s3HVLkE8dczQq9HBYLmk02QlufcVa1APS8xHerw87d/x8K6Bdq2k/o
         kP6984nkM0a+bRzo/TJNRs/EmjoLQTrXoy3RR414M/CgfcwCTEpoeCM89YV35xE0Qwe8
         ymarZy5DFfU9eenWwCKIZukw8xw/vbOOEocfbR9yb1JIrEptczDySEUwWZVpORN/ULZJ
         QlKt/YDDDRhDwwJZZCSoN5dPR33QTl3fhW8DqX0rwq4zzmWqfE7LrvxlMF45hSEkau6H
         LeNjU6lyRusPUdvVhj+eZwS51+0u4LiJmCu5+EjIsLXWElTymWe0Elw79EjGJRXNXpeO
         3r2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ii1aZpgm;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id oy28si4963980ejb.412.2021.05.07.10.14.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 May 2021 10:14:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ii1aZpgm;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620407649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EmQ5kgpbf3169hBJ18Ia3FxprliSdUJRha7Gey5ycN8=;
	b=ii1aZpgmStIkFmgTtNllugazAI7CjKwS28JIwFDFAiwKl6JgfkLdploXlW3BNLUpoCScdc
	+gr4PBARfBg/IEz+9Ig7WzBTZSDMACWADeNBf0UVb2YoGuTtIEEGRRMZITwIv2ayP3kKh3
	NgMi0VIO8OD//K6n3lAoyjKO0SC3oa4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-shna27wnM3mgroSi7nwE1A-1; Fri, 07 May 2021 13:14:06 -0400
X-MC-Unique: shna27wnM3mgroSi7nwE1A-1
Received: by mail-wr1-f72.google.com with SMTP id s7-20020adfc5470000b0290106eef17cbdso3844413wrf.11
        for <alex.bennee@linaro.org>; Fri, 07 May 2021 10:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EmQ5kgpbf3169hBJ18Ia3FxprliSdUJRha7Gey5ycN8=;
        b=jVmRAxgmJ0AtmrMy2jonG6kbsQyaYaCgy5J3ffVuXC5+bsxSVQk5SQvKzhE+1RZsoc
         iy0TbUiCOvpi6EwYKVPwZ6hA3xYEe1Tny16mmnNq6sLN7sBELRTiTzrCOLoGEHaMQcE0
         z68v30d62Jmw4V7CCTlqV/toZVkFh+Ki6OBeZyTQ8Kpsf+nI54PjfuBnGTKKZFW5aNqF
         OuSyL+o0VM+j4cQ8tHvtP5ym4koipzDpZYQtdMTZgGFAQU2VB/IbTD6dqNcyTarqGePC
         rjFB7DHBv8ja8Sgl93C64DuDc3bd0BN5+fW+hQaNq4IDLhNPg4bmU+PM2qorz/qVxWN2
         exqw==
X-Gm-Message-State: AOAM531dDFrg49nAGj2KhjwJ7eUsQF1Z3/ent6EvtJieV32ra3vdjMtP
	d05jZK32gqGOF5J7nNnN2mRSULMOkaStef00pAH+LzMcD2bBmgx/QSiNSjUqkPFZk4X9BqWuJ1Q
	Hi18grYUGaOb83y1U
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr13717825wrj.407.1620407645385;
        Fri, 07 May 2021 10:14:05 -0700 (PDT)
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr13717811wrj.407.1620407645247;
        Fri, 07 May 2021 10:14:05 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
        by smtp.gmail.com with ESMTPSA id p7sm8514253wrt.24.2021.05.07.10.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 May 2021 10:14:04 -0700 (PDT)
Subject: Re: [PATCH v3 16/17] configure: Prohibit alloca() by using -Walloca
 CPPFLAG
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-arm@nongnu.org
References: <20210507144315.1994337-1-philmd@redhat.com>
 <20210507144315.1994337-17-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4bc42a9f-fcb6-40b0-cbe6-6b75c13c1440@redhat.com>
Date: Fri, 7 May 2021 19:14:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210507144315.1994337-17-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: r0T94pGceL4H

On 5/7/21 4:43 PM, Philippe Mathieu-Daudé wrote:
> Now that we removed all alloca() calls in the repository, add the
> -Walloca CPPFLAG to trigger a build failure if such stack allocation
> is used.
> 
> Rationale: The ALLOCA(3) man-page mentions its "use is discouraged".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> As there is an alloca() call in libslirp, this patch is pending
> on the following libslirp patch to be merged:
> https://lists.freedesktop.org/archives/slirp/2021-May/000150.html
> (and the submodule updated).
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 4f374b48890..67cb6d5421c 100755
> --- a/configure
> +++ b/configure
> @@ -552,7 +552,7 @@ ARFLAGS="${ARFLAGS-rv}"
>  # provides these semantics.)
>  QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv $QEMU_CFLAGS"
>  QEMU_CFLAGS="-Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
> -QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
> +QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls -Walloca $QEMU_CFLAGS"
>  QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"

Sigh I forgot one Clang version (7.0.1) doesn't recognize this warning.

I'll replace this patch by:

-- >8 --
diff --git a/configure b/configure
index 4f374b48890..4330245fa1f 100755
--- a/configure
+++ b/configure
@@ -2083,2 +2083,3 @@ add_to warn_flags -Wexpansion-to-defined
 add_to warn_flags -Wimplicit-fallthrough=2
+add_to warn_flags -Walloca

---

Regards,

Phil.
