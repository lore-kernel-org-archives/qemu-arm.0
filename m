Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp1521237njb;
        Fri, 9 May 2025 21:52:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:9286:b0:73f:e8c:1aac with SMTP id d2e1a72fcca58-7423bc1f053mr8045861b3a.2.1746852734117;
        Fri, 09 May 2025 21:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746852734; cv=none;
        d=google.com; s=arc-20240605;
        b=MIOIzKnR/44puCfyaI1RvVzYpKok3atF2hPwsOELRIjDKq5XM6XsomWGonvHyOiXaO
         hxDKfADjqb4/0vSx0h847DtHga1G7p9EOOxuTjOkdel5yhpbNpzxMfy5HI/yZ2/MmyQZ
         sGbpQx+H7lDwUpRHcZG8wczEhCKDl5NHTVO4EBelzxb1RSv09QLsZSLVXy0t6CMwOZe6
         +9vyRY8o9nbiyHnI4elzN/MnYwdrBLTv2rUNWWoGzQIiBI+W8JxZFaKL70BK4exKibhN
         6o/pT5sGuxgcTzcfOgMWUfoSUR/0c6wq9hK5+PHhRE6NAIMY8Np2Auz03fbECDz/iOEO
         ngGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XzYIUcRqRCX8sgQOdVRbXsqbqNFycehqiA1oMJq6YHM=;
        fh=Ye2zjibjepcvnS6dukDXDCri0sGl2XJTEt7SjJpiwmM=;
        b=aqNiw6/iYXSjF7AURlZ2IsbO5kUMPuzQn91QDIyZMN28g993M2MNu1g5yT6q4bZ3hE
         tjMyS1vNtUUvqKPAMy1rTa8R9gX3a/fKvWile9gbffR12Byhkod4MwB9FrMeEVWhY3ON
         Jss2lb6vzZOgqsLnOoZLSTK5ciMpD7K7+eTT6XaVixlAUpZJ4CL/YM/ox8+9mabuW9c8
         lAEsg1ArRwLb+zlAd9Yabr+n3BM4HU7zfYdIkoGZF0tgi1MquiPu8sBrbgUQBfJHo24H
         xN3hUA59qj3qJhvVboZIX1tPXeTW3N8N0UGZUwQ23vEba3f/7neMPfidOiK8LDaaY9bE
         G91Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=SMOxYALV;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74237a970e5sor1716728b3a.6.2025.05.09.21.52.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 09 May 2025 21:52:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=SMOxYALV;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1746852733; x=1747457533; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XzYIUcRqRCX8sgQOdVRbXsqbqNFycehqiA1oMJq6YHM=;
        b=SMOxYALVOPwgDWvacO9X/CNoD4A9FYbF9VMcpKoZNz5JFW2Sjf8aruZn4htvtBfL/W
         WI0QzAVvkEfD26akQsL6xFuMTYFqedOD0F8NJZ/bgNbNLwPxPqlVV0DCLOqey4AVWMVo
         6qACs77BDM9TWEEFRqTeY+6kzteCdAMx36KH8BVQpj5eekSryfGt8KsPvaVJxr/0GrAm
         vIw5wq/jGLr9In1eEaNYPslvqUpy/k7/viImz8TqHHfGeKC8/WcjWhC+jgzNzsr2BnpA
         BYVEyQ9TQkSzZhAbF5sMnGW9Iq7OYboLtPpSV/IH89KFkHYaoJ/HrErWx5Kx1E0N48bR
         DHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746852733; x=1747457533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XzYIUcRqRCX8sgQOdVRbXsqbqNFycehqiA1oMJq6YHM=;
        b=ipJyQ+k6WNqXx9PdlYcTSMhSshmiS2K1xf4rlIU2JrtA9tlKLS4RbUjEkZBKowr023
         eoscQ8k+5EyDvuluWNjy/os8ijli2fv1UXZuZgKHctAoCR9YBzWoVy4T1ZdqLmTlFLV8
         VWBNBJxogrW2NqSvTHK3FVygMlx3tXIjWdjHR6EgAB9K44u41v3p16rH1rKspldTDudK
         POmQiDbFrT5NILsiX5R3rZq6hXVL0yS/YaSmL8HzQ0B6Pf3E32jzpfkOxVWdLCcXfs9e
         GK5TmX+E6eWN8dBUMofhjr9mO2FE9gHFTtqOzsVbqZNS3CMB6JSMeZUqZ1V60SIoIWry
         uRWg==
X-Gm-Message-State: AOJu0YxI9YEKK6mfVMqmnG2fwRj8Pd3KpazG2SOIYO2zatnljNEaTI5a
	Iouh5DNtcDu27ZgYoPVur3h9LsTAGt7sXog7HGVIQo1qfxPqtthvQmLiqc5eT5Ev9ccF+1RlY2t
	9
X-Gm-Gg: ASbGnctBnRPxe6p9kD4CRunSPeBvr9EfYtXYYtC8DoHPYVTg1TYql4i6xl0uJ7+Hh5p
	RvtYZ78HSH5qxTPNEkhGp4t7NahvYkIm1pZS4g1g7bEhapF9xy82CVIYKh1Sh4SngQ9J4o86Z4h
	emMmP2e1jbIWMxc7f472fpzZVwTYZ1PNzu4NNyS2p4/dqgxJ6feEWPAHSnKBJPLNIrLMCGZztZk
	GmPL2IEyzXDLLn+Tmz8TudTnE4Y3n8NyL2/ReuY5I+9BtTmwHZU9weLWD3OfTBdHvjH2r+Zx2aT
	kIAOwruY6S5RGpxC0m0u1bCK55iLTavQOYRrPNe1drk9Eau6K7H2SS/nGX4hrQ==
X-Google-Smtp-Source: AGHT+IHqVau87F90b1MQBIqhBECvSsJ/cvy04ceTr267TwBmYwsKCr8ygZiql9RVndj6kprrLAOecg==
X-Received: by 2002:a05:6a00:4fce:b0:736:b402:533a with SMTP id d2e1a72fcca58-7423bc1c81bmr7511854b3a.1.1746852733529;
        Fri, 09 May 2025 21:52:13 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a3d3e9sm2529326b3a.125.2025.05.09.21.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 21:52:13 -0700 (PDT)
Message-ID: <d5a8cec1-f689-4d31-b6bb-b63eaa4ce2af@daynix.com>
Date: Sat, 10 May 2025 13:52:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/14] ui/gtk-gl-area: Remove extra draw call in
 refresh
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Peter Maydell <peter.maydell@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
 <20250506125715.232872-13-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250506125715.232872-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6jWDN8u3kV7f

On 2025/05/06 21:57, Alex Bennée wrote:
> From: Dongwon Kim <dongwon.kim@intel.com>
> 
> This partially reverts commit 77bf310084dad38b3a2badf01766c659056f1cf2
> which causes some guest display corruption when gtk-gl-area
> is used for GTK rendering (e.g. Wayland Compositor) possibly due to
> simulataneous accesses on the guest frame buffer by host compositor
> and the guest.

Simply reverting the part of the commit may re-introduce the problem the 
commit tried to solve, which will be a regression as the commit is 
already included in releases.

I guess the problem is that the gl_block callback of GraphicHwOps is not 
properly implemented and it is what should be fixed.

> 
> Fixes: 77bf310084 ("ui/gtk: Draw guest frame at refresh cycle")
> Reported-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Reported-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> Message-Id: <20250214170813.2234754-1-dongwon.kim@intel.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   ui/gtk-gl-area.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
> index 2c9a0db425..9f7dc697f2 100644
> --- a/ui/gtk-gl-area.c
> +++ b/ui/gtk-gl-area.c
> @@ -129,7 +129,6 @@ void gd_gl_area_refresh(DisplayChangeListener *dcl)
>   
>       if (vc->gfx.guest_fb.dmabuf &&
>           qemu_dmabuf_get_draw_submitted(vc->gfx.guest_fb.dmabuf)) {
> -        gd_gl_area_draw(vc);
>           return;
>       }
>   
