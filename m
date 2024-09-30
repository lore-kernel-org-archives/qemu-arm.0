Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1275708njc;
        Mon, 30 Sep 2024 07:32:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOgdH+YEqzg95QATf0cujKFTsAjbxe5p0wP8Pvatct7aajYmhxZRZ4Yu5SmPDy1PQDglpya4QU54VQYg==@linaro.org
X-Google-Smtp-Source: AGHT+IHxl+969XzbnSm4tYTHS0vsv4uC8bZzRkQg6MCCWYYzW2npaV+jTH20mV0BbnKsS84GLbW1
X-Received: by 2002:a05:6358:63a8:b0:1b5:a060:678b with SMTP id e5c5f4694b2df-1becbc299f2mr378298155d.3.1727706745800;
        Mon, 30 Sep 2024 07:32:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727706745; cv=none;
        d=google.com; s=arc-20240605;
        b=JU1YbenVbVKUmXyfYwJBA1U1kMqqYVRXFIreQhnny7uvKCyG3U/18wvuzYrUq35Gw7
         mYm8GOOpRisgmjs+bnnezwasu5DBbf1nIaNciGB10chRQasomB+UFbp8kfXNcCgMAHbL
         7r5O6DRVOKMjqolEZffteA3H4srBnKNQbFA8t2HZJZe5QYwY9xzQ/75gpuDvdOHSelgH
         6DAnoIH1fNhCo7kIRIlZedTdPE5cUtHCdjS6y3h0EQRdAQKaDBzQxv91SUOQIIcOKj5O
         9cODrgSok2+TBsRl0eeSpuUrYP36uezfAhdiWu5ivzpd3SYvmcXkb7JQ2zVF4EKvdGu9
         waMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=mPMSI02Kb00GAbmUNwHQrXOfDcAxFEOqfr8eCYUCT6U=;
        fh=EZHjs686GiQxSNNbXQ/37Q8FI3ZieD6xLBKK/sRyfCY=;
        b=SZIUmwGcpAWiHEDA6rnkac18befQ0//DcrPd2pBMEC6at7HM5Dx5cGK5wq3hqEOcLR
         9BN/88jP9RhnaWdMnFZLjxdfn6ubzJw3BBpYP3wHoxCx9/miVbsmyLXXF2rSWDnQvbVT
         MFqio2nV22xnOWwKqxpW91QzRbXuy8L/khnNfyfutS97UYjzjGKhNa9iRdaFvkn1Q6TJ
         miGd13R+204/AEfBp6x3NKfpV7LqZWUzj5aHerYyd4Vg9tgei7II9cM2Dnc/4fhQlhf8
         WYCWBAAB1aCswUwpkRvXncBlwtnKw27pzdpD2RC6IEtG9vCYcmtRxu4tkRy9rrgiHRG3
         yV3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="E1zn/sGA";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7ae378a32ecsi854558485a.739.2024.09.30.07.32.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 07:32:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="E1zn/sGA";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727706745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mPMSI02Kb00GAbmUNwHQrXOfDcAxFEOqfr8eCYUCT6U=;
	b=E1zn/sGATnzUlm+oyVf3FQVk26KgMSpEw0MsaxMZxKz8m5Jrxcam6KUdwuweCwT8WayzGY
	zZe+NrvDpYanGcv5pOnbxgvjwefuvvE6J2e7CcveuLBx3QX4V226CvLjl9rMfZmiRkG9hu
	H7VkVd/wLZjpJ9GtEF3ugLLbpyq4L2Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-Zh-pqweIMpqFtmrukk4C_Q-1; Mon, 30 Sep 2024 10:32:23 -0400
X-MC-Unique: Zh-pqweIMpqFtmrukk4C_Q-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42cb6ed7f9dso45520085e9.3
        for <alex.bennee@linaro.org>; Mon, 30 Sep 2024 07:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727706742; x=1728311542;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPMSI02Kb00GAbmUNwHQrXOfDcAxFEOqfr8eCYUCT6U=;
        b=ffDHxqg3moTaAK59OgNxI/6xNtrGbiNG2y4IXtETh3mkWf587FBHWSQDiDliDoXups
         i2uWzMCu0P8lakCykhHGKxV1fmji+j7uzdU05Ugt7XDYCkQA5S78OW9MlhwkG71Lj8z1
         ZX8q/axgo6U2DNu3FtAQRcGncoe3+Vv+n3a2TWRR5yqlkSnPf2fLtdt+Z5BeBBSdndSJ
         RsLXoewlegfpicbEwas8Kqa3WSPHYDyLnq8xp3tNgO0w1Yfy5yCOl3iAAZzVQs5qkOrb
         6SEtvvydVmh1uCXDVzYBQ5NREfwRT3c3GALbBDI1pwvTP9g9DPJThBcEkMEpKatDMTs1
         6M0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUu6zHjamXy0nPg0AwDf+SZU+YUUly19d92e9XMA2YyxKV8B4vt+IXoGuv8lGcaj8/7TnMZkX2sCMl4Cg==@linaro.org
X-Gm-Message-State: AOJu0Yx+b89lux+eOR5tZ/dC0UQ1lsqRizRDEsCZwzc4gvJjGuut0OV2
	2uyIba/MeG11nB3z/tAexZYUE8Gf0fVwwDnnmahKaLfubo+hYjV9M79M4B21am07F0DFFDt95G+
	2STJOH7lRvqIlFqLUaMmT0uuB5aqYcUYHpklEanvQ5TTdT8wxUB6Yug==
X-Received: by 2002:a05:600c:3b11:b0:42a:a6b8:f09f with SMTP id 5b1f17b1804b1-42f58497683mr112602215e9.23.1727706742063;
        Mon, 30 Sep 2024 07:32:22 -0700 (PDT)
X-Received: by 2002:a05:600c:3b11:b0:42a:a6b8:f09f with SMTP id 5b1f17b1804b1-42f58497683mr112601875e9.23.1727706741606;
        Mon, 30 Sep 2024 07:32:21 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-48-176.web.vodafone.de. [109.42.48.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57debe5csm104589035e9.24.2024.09.30.07.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 07:32:21 -0700 (PDT)
Message-ID: <257b0de0-6744-4ae8-a2c5-f05eec29a3f0@redhat.com>
Date: Mon, 30 Sep 2024 16:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] hw/xtensa/xtfpga: Replace memcpy()+tswap32() by
 stl_endian_p()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Jason Wang <jasowang@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Sven Schnelle <svens@stackframe.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Burton <paulburton@kernel.org>
References: <20240930073450.33195-1-philmd@linaro.org>
 <20240930073450.33195-9-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240930073450.33195-9-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JTiS41em9fiw

On 30/09/2024 09.34, Philippe Mathieu-Daudé wrote:
> Replace a pair of memcpy() + tswap32() by stl_endian_p(),
> which also swap the value using target endianness.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/xtensa/xtfpga.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
> index 228f00b045..521fe84b01 100644
> --- a/hw/xtensa/xtfpga.c
> +++ b/hw/xtensa/xtfpga.c
> @@ -438,11 +438,9 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
>               const size_t boot_sz = TARGET_BIG_ENDIAN ? sizeof(boot_be)
>                                                        : sizeof(boot_le);
>               uint8_t *boot = TARGET_BIG_ENDIAN ? boot_be : boot_le;
> -            uint32_t entry_pc = tswap32(entry_point);
> -            uint32_t entry_a2 = tswap32(tagptr);
>   
> -            memcpy(boot + 4, &entry_pc, sizeof(entry_pc));
> -            memcpy(boot + 8, &entry_a2, sizeof(entry_a2));
> +            stl_endian_p(TARGET_BIG_ENDIAN, boot + 4, entry_point);
> +            stl_endian_p(TARGET_BIG_ENDIAN, boot + 8, tagptr);

Why don't you simply use stl_p() here?

  Thomas
