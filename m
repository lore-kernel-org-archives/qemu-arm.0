Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3142437njc;
        Sat, 24 May 2025 04:07:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGTFc58oo8OlUNdoADo4rJ1MScRKXW4G88uO1PRW701O5HCh96AkicGztOj3Q6uZpCcz0Y
X-Received: by 2002:a05:6e02:2407:b0:3dc:870a:e07e with SMTP id e9e14a558f8ab-3dc9b6652e3mr20463405ab.4.1748084847850;
        Sat, 24 May 2025 04:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748084847; cv=none;
        d=google.com; s=arc-20240605;
        b=aA7mifSzGO4DQPjqp4Ps+unyIP+PcetSTN8uazWVl8J4cNoFLCQzu40sqplzdzOpC8
         JBudx/4jSdj/+2yZfM5w5cpi1Cs2LX+Wb9xemrhlWfCW/cQHfojZDQVT32B9vFHwne7Q
         sV1FAtZ2DECLhE7EPEC5pQGNflfw5PUynVy8XwAxtTCqSeBe1Z/hFUkINWa5Iwkrht1R
         7eUwi6KhoMo7zNRtJHlssRTBg/ZP50WGb+MtBSIDXFILNvnK/M16ATS0OwhP48HcExZB
         YWOLyU3mtX8tFpHcpo5RPzNI/1OBlrGjG3K75jrCqySEzZsrgL8f6T/2Ju1dgEaq9Cy2
         yRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=rxux+cQznw+yXgLhUltPmceByWr9BOkwRx5pPAy7P1U=;
        fh=jgrumDk551Ivv5C4zZV9MlkdzoKJqxuzM1Qnm2KBKqw=;
        b=kwI5e9jSIiFaQOsQoGJCja9mx3FIVq5Y+4AoigGq0oNDConR3ijyPSNAc6Na2EtvBM
         BzT9rKf9OH5dqSJyjncs7OOSPh5vTXdZ3ga7YbuV4X9Yqmuakf3l+bezSvgAk0kdCExo
         giHdTZHbnhtKVMTVAWkwo/mlIAHSlp4u2Njg5R0+Nb6O666QEgCTvmgzdWD7h46xmXTm
         8kBKcBfxQOemwYgc3UKmFfYG4lz6G0G2V+5u0qzae29lG7vRgZjhZUaWsMz1SwXJrtPT
         7HZFCbJOAe1yXvReWhhqZYApjuzGdRNRa4jGkeTpS4jgCGzq027GvroSBUY6NLmNhbAO
         8h8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IT3zjuOu;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3dc8389fe37si82433745ab.71.2025.05.24.04.07.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 04:07:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IT3zjuOu;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748084847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rxux+cQznw+yXgLhUltPmceByWr9BOkwRx5pPAy7P1U=;
	b=IT3zjuOui9Tol9UoxkfkvnVmUEjyesbPEkFcG2MK++wUCkEr1e+QJuL5my3diPNsq3G/OD
	ZXBMgDpSbuM+HedQY4a9oMqMl4nJlRSsQ+PoskHKLeOJaC8ejpt/EJv7wgQXAL5YgZFhFL
	9bOhf6HCzbhB4/CioMSFNzrVhWlZcE0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-XgD3q9DTOHi402q-QAGYmw-1; Sat, 24 May 2025 07:07:26 -0400
X-MC-Unique: XgD3q9DTOHi402q-QAGYmw-1
X-Mimecast-MFC-AGG-ID: XgD3q9DTOHi402q-QAGYmw_1748084845
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442cd12d151so4777765e9.1
        for <alex.bennee@linaro.org>; Sat, 24 May 2025 04:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748084844; x=1748689644;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rxux+cQznw+yXgLhUltPmceByWr9BOkwRx5pPAy7P1U=;
        b=VD+vKzPONj3kiyOumND2Qqqbk2juGAogDfmQNKacTxGxPMp1cNsTN22EGJ/effTzwt
         fVnfZgWeDduBbxnAjjha8Bj0t2sb4WUFeUgiegGqY7XqbsWzWnMxi7tjXBw/9SPHUWvU
         ZG274fwTGdpKHw/EkR4srcQBwpl2PN2U2Cau4rItuMt3Oq+BxPstfpDcgIaWsTbh+qeS
         i6LjZ/A3/EJpGvtnco2ZPcxzvAhzZfqwkM5wADVd4rWYN9l7hNqiBIEuGGbqRzpWGip4
         YfQgZHDlOuOLmNzLv8+nvtOu3y14aU/R+dxWsJwSNhFhR6kdSEmsmnCKZNegwpFByxQm
         jNGA==
X-Gm-Message-State: AOJu0YwCgymryOTUn2fzA7UXqmUEHSeCyFLu8cFHpesSbgB6/JKZbi2D
	HLQZvpumusfJldINukyUlgt0RJEtgMj2uYfYj/pXE2zZuL3x8+55cIxixD016EBS+djuPDWn0Oe
	qxIC0BBHgMsH/ojCFKHFokpI4Eg2iacXHqRqTl7lpqh1prL6bUkCcO5Y0LLFJLUGZnIsINoxZWo
	eg8uAsiPsvo4VimjjHNGduNzDJ+lTLlhHHAFQ=
X-Gm-Gg: ASbGncv/GXOftXyzqHwVqYA0BDxpV6TWzbVcM8ZUiNNJS6sg1Fhvgu9x4Z/l5+5pq3f
	7YSjsr9F4G3unXVshj6PjQNCOF9bmT6QlZGmFObgLbEfOHja4ws9S/XXAFcQulLpGQdIMFJIKFr
	N3ueQ/TVCS9lWrn/i7daF4sQynrVlk7GghrAgXC+dcfb3QqajxIJbJqZ97Ezgmr+m33RjU2DkgV
	rVXvBGucu7Kq4f8QxUefddt7XtOK1EZElM9aZwyqpfrbFibJlA0sktIbEXrg5cX0l7TWGwlNxOJ
	kGryfg==
X-Received: by 2002:a05:6000:4025:b0:3a3:6481:1ca4 with SMTP id ffacd0b85a97d-3a4cb4834a6mr2045477f8f.43.1748084844502;
        Sat, 24 May 2025 04:07:24 -0700 (PDT)
X-Received: by 2002:a05:6000:4025:b0:3a3:6481:1ca4 with SMTP id ffacd0b85a97d-3a4cb4834a6mr2045434f8f.43.1748084844069;
        Sat, 24 May 2025 04:07:24 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a841sm29916764f8f.34.2025.05.24.04.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 04:07:23 -0700 (PDT)
Date: Sat, 24 May 2025 07:07:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
	Peter Xu <peterx@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gustavo Romero <gustavo.romero@linaro.org>
Subject: Re: [PATCH v3 10/20] MAINTAINERS: add Akihiko and Dmitry as reviewers
Message-ID: <20250524070711-mutt-send-email-mst@kernel.org>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-11-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20250521164250.135776-11-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9LNSyurXGvYDCBO5_3owHArSbwdvxICQqpT7yMkl6uY_1748084845
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: E8rjlrYmiGbv

On Wed, May 21, 2025 at 05:42:40PM +0100, Alex Bennée wrote:
> Thanks for volunteering to help.
> 
> Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>


Great!
Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8dfb393c06..a14e2796e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2674,6 +2674,8 @@ F: include/hw/display/ramfb.h
>  
>  virtio-gpu
>  M: Alex Bennée <alex.bennee@linaro.org>
> +R: Akihiko Odaki <akihiko.odaki@daynix.com>
> +R: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>  S: Odd Fixes
>  F: hw/display/virtio-gpu*
>  F: hw/display/virtio-vga.*
> -- 
> 2.39.5
