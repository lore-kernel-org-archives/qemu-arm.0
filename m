Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp10285895lfk;
        Wed, 24 Nov 2021 03:07:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhhG2WCU/7KGm0jFeyQpgIaHVsP/AKHFOaXGo+0GN42R/jIsCiY6DyLnIdKP6sDSOzdBeV
X-Received: by 2002:a17:906:d214:: with SMTP id w20mr19267099ejz.120.1637752028356;
        Wed, 24 Nov 2021 03:07:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637752028; cv=none;
        d=google.com; s=arc-20160816;
        b=uFRdP3GbUk45qrjHVvriu+Lf15NUTZZNYmDPU8Wjc8/JYbpqTU6Pby3qYktEcLLVOi
         CSXB03qfqRArUMuloRJm92TeTtwVCQEe1B+qHcq4+E/IEDabYbadfwahVWAJVtOPX3j8
         IUugTIUWBRHmEYkqz8+6mx4VnbyIc2Sot43jD3Q78+xXtWRBNq2qIzhUysSbzHFlN05c
         qHGM6E/ETuEjVaS3z3MWEANgw5L8oD1el5060hJIz1wfgU+X2bNH5yqlHIuaMp9fQ2+D
         LIWTMOgnFVrdOY2SPs7BJkRPiTo8kwA9ja58mubnHTQ9aJO8rBN0S3p+NMSDAIFQ0LcW
         G2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=aMB2sNUsa/0UAP4HkeCP25BsocK+xXuD+P0zzpx3vjI=;
        b=yy0F/te7KllW6J0iR08F9htbtk5/v85IQggK9IX1w9dUu6a9VQbtsTSUyBRiaVER9m
         YuU9gqZPMJrES6oqKjE3iHcm3Dl42/S9jBnqXeiavPxcMjpbCEHL2gtnMYEzDEf0jSxd
         /PWGAgzzMR07BDILNlWe2BiaAcU7hsaTWL9ienqn95UxnaS5mm0iGeWPV1KQWJWK37AH
         PRySAecLCaA6d4FJbBFBSt7px7D/sPZCyh6VE3/pC6yoNq5ztZTnDh8f2L+egNmTTrfg
         ano2NI3rY/8EYw/hOOEqCX80x/2Z5N2Sme94hG+YxvzdlhoXZFBQ7CtDECya5JxLZhan
         IKVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D6K0Jy79;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 11si37718182ejk.83.2021.11.24.03.07.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Nov 2021 03:07:08 -0800 (PST)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D6K0Jy79;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637752027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aMB2sNUsa/0UAP4HkeCP25BsocK+xXuD+P0zzpx3vjI=;
	b=D6K0Jy79B/6P5Pke560YJhPVabV4QYYU8wfu5M2SaFmUJmVz009xbexwN9deR+N7NKkSSJ
	n0X9BIW8xUnkHZ2I2nwX4a3nj8KSSwTygCyvdVHJG5lVjlO3/fI8vT+7xH8vRAjHZdpKJm
	O/PAVzJ94Rf82rg5gnPQGp3UBL3shEg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-432-gUwOeG9KPSeR0Nn5fgI3HA-1; Wed, 24 Nov 2021 06:07:03 -0500
X-MC-Unique: gUwOeG9KPSeR0Nn5fgI3HA-1
Received: by mail-ed1-f71.google.com with SMTP id v10-20020aa7d9ca000000b003e7bed57968so1932801eds.23
        for <alex.bennee@linaro.org>; Wed, 24 Nov 2021 03:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aMB2sNUsa/0UAP4HkeCP25BsocK+xXuD+P0zzpx3vjI=;
        b=CRWtQL+R/Yb8FKisgbTpiDeLYqVcegurirk2EQpATDBgL3cRP18Cxe2P2dXKSIlQkI
         BgItRuU2FlebiSctLk/7p6wYQ2b6nE4JV8oYdcuyoTEcs8abUXgGiWcbatnVYyXK9h+K
         M4KzdcbVC9wRzyrwT3cjWfHhEM7FprGlLaLl6Oj1xychpzCJuQjbfbUuMiq+lk0hHpJn
         wK5ERZM/L6ZJYoLFZsz0NfrzM9eCeTAuoxv4l5qRrSuUzYUjbrh90+OCG4V2sh0vtiq0
         zUxg+rL8nv7/3OiyaCkQyBkmsh9aHKDtfDpsVRnrSBuLF+zyMJaGcJvO3TOlnLY500e9
         jY8A==
X-Gm-Message-State: AOAM531MC8Cd0EWF+qY7yScMnTJAPEV2bhwSeskK2Gx2exYhSaFZNPUA
	oiEmv3bvp6dAvXU0Xjam/y3PUm8kb5KDtP+eXbplstZcq9yePdF/SJOOHlXItiXMq5TKHjgxM2L
	+1OrC7B8UDubT7QIGrwO8msdSNkZmrndDLZhXxFZQ7anrbMW6JFebTni09WNK7olOhaI=
X-Received: by 2002:a17:906:398:: with SMTP id b24mr18897447eja.49.1637752022555;
        Wed, 24 Nov 2021 03:07:02 -0800 (PST)
X-Received: by 2002:a17:906:398:: with SMTP id b24mr18897369eja.49.1637752022167;
        Wed, 24 Nov 2021 03:07:02 -0800 (PST)
Return-Path: <drjones@redhat.com>
Received: from gator.home (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
        by smtp.gmail.com with ESMTPSA id gt18sm6730329ejc.88.2021.11.24.03.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 03:07:01 -0800 (PST)
Date: Wed, 24 Nov 2021 12:06:59 +0100
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvm@vger.kernel.org, maz@kernel.org, qemu-arm@nongnu.org,
	idan.horowitz@gmail.com, kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [kvm-unit-tests PATCH v8 01/10] docs: mention checkpatch in the
 README
Message-ID: <20211124110659.jhjuuzez6ij5v7g7@gator.home>
References: <20211118184650.661575-1-alex.bennee@linaro.org>
 <20211118184650.661575-2-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211118184650.661575-2-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: ZeD/xRY6bf+9

On Thu, Nov 18, 2021 at 06:46:41PM +0000, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  README.md | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/README.md b/README.md
> index b498aaf..5db48e5 100644
> --- a/README.md
> +++ b/README.md
> @@ -182,3 +182,5 @@ the code files.  We also start with common code and finish with unit test
>  code. git-diff's orderFile feature allows us to specify the order in a
>  file.  The orderFile we use is `scripts/git.difforder`; adding the config
>  with `git config diff.orderFile scripts/git.difforder` enables it.
> +
> +Please run the kernel's ./scripts/checkpatch.pl on new patches

This is a bit of a problem for kvm-unit-tests code which still has a mix
of styles since it was originally written with a strange tab and space
mixed style. If somebody is patching one of those files we've usually
tried to maintain the original style rather than reformat the whole
thing (in hindsight maybe we should have just reformatted). We're also
more flexible with line length than Linux, although Linux now only warns
for anything over 80 as long as it's under 100, which is probably good
enough for us too. Anyway, let's see what Paolo and Thomas say. Personally
I wouldn't mind adding this line to the documentation, so I'll ack it.
Anyway, we can also ignore our own advise when it suits us :-)

Acked-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew
