Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2998287njb;
        Tue, 22 Oct 2024 04:29:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHwzesagOuQ3c+rinGl6kKmGWyrDXPPsbd8Jd54bIZ42yucTgDXKNAUAjSEYpnQEgS6Y69
X-Received: by 2002:ac8:5ac8:0:b0:458:4d0a:608 with SMTP id d75a77b69052e-460aee5c6b7mr180868231cf.51.1729596599394;
        Tue, 22 Oct 2024 04:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729596599; cv=none;
        d=google.com; s=arc-20240605;
        b=aahcJ00wI20GpfUtTMkzD4Vov4NdFoxakRlSIXPOdshWPICeu1OO6QfjRBVyVr8vNi
         TRRUH8ua6C8Hry3ipo5snJgtrbgncWKtNG8sSLvXE/hkU0epTIuBIpw13vh3VopKrZc2
         5pa7Jh8xVVHk9CbIvCWXvWo6m83rPCmaIFHz8rvdoHeBIDbNr/YcYFEQi96coDWS4o9o
         4/J2sE7PghImyUiLcUu17zzc7OLaw4FQTfJYAdZG9osmhXLK3OwoNhPkZM4coSKm64cD
         zezwvf5Db70X9wkzK13bL5K1JkZpNOEahZiimUuCIR0//YJgx9XKNGze+0rGOf/1/OSk
         zbAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=t10DH92XdarajLJbF79PPbEvjM2LTHQmCyl4xE/jwJU=;
        fh=z6H+tLebActmKXI7cElA2mfoLLXaJw4w6WDoX5Op/9Y=;
        b=Wmc4VAPGktmJAisGKabnHjxeyhiT8Sohh9d8+WP9z0HrJxgn2JCeS3Fw0IxID1C1Gv
         CKDXygDvTfbM5ZIjgIy8f0qLEIHCRWDWd4/jx1lyPeZnXFpfZ8YdtbDcVz8/EfWfgjXa
         0rd7QfUa3h7cT4r5BAvI4sJ+qXtsUJpQh9v65vATPwv/wgwdK85h+pBzUsZ+3AGQyXRh
         bKSkPcu8sZ00SgGzUaEEw87jA47gkwKYyiQu3yQiU87yh/I67Hu0bOkgVvb5UnqqJVOA
         G5UL36TPAecFHBKj+4XLSV6667seAjIZk/y5/9dNVm/0eBuDLTpFDOfbHAdNpOpbm4Lq
         LEWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XvXYW6s1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-460d3d5b247si60876681cf.592.2024.10.22.04.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 04:29:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XvXYW6s1;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729596599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=t10DH92XdarajLJbF79PPbEvjM2LTHQmCyl4xE/jwJU=;
	b=XvXYW6s1GSu6khccLctvZgPA4qLq0gIsQGrDRL1iMmEt1vUVUNJp4aNFd406Plc2GjA7U3
	aUMc+g07ZiToRJMi+FXBNagDA7Ytfz0cYvdZBvmfwgV8jimsHw1QBv4k+myHv6VDPjR+Z2
	TUaXbtWrXz7vv9qkElYVM6/rvxJldQo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-9r7-JOQuM1eQK0WqVF4hWg-1; Tue, 22 Oct 2024 07:29:57 -0400
X-MC-Unique: 9r7-JOQuM1eQK0WqVF4hWg-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b155c120daso778434985a.3
        for <alex.bennee@linaro.org>; Tue, 22 Oct 2024 04:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729596597; x=1730201397;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t10DH92XdarajLJbF79PPbEvjM2LTHQmCyl4xE/jwJU=;
        b=o2wlMcGTARbudHw2Rlm1/JMIqcrEOtKFtYt3MWcVQQhtQprvba8Zdx8UCW9n5xFbdC
         31YCiiJIShVBSCyn6e1fjHSqTFHEjyxZLPl6omxqnk2N9FA67Zb96b8TAK5w6KxtqFEd
         azK0qpvggCXulfdXAcWTtErK+P1oqOarrPWTENVCF4Ygz90YFNlFmtmxqDekT6ZAkOWl
         EWg0zkly0zfJjgMgmDhYLP96W4UUce/zHDeZiyC/MFPcX9v+KoLY8Rc5xxN56MKHplnQ
         KNKC1OUDYozvZUAawkGosDqZ4JthPX+hAcbiTMFvslEpEZucEkCLvVALD2fkcynCAx8v
         PPuw==
X-Gm-Message-State: AOJu0YzYmJ8DLIQViWwg1YzB2x0u2NqmN9NH6YRE0aTSXXLOInwow5ye
	ejKKIL5Pglxu4Ln7COb9ysc/q16BdLkehSZnYe74zHpXpA8CxGX+WshmrBkW7Beb5FUO8zRCO8w
	xIHuLMqqnUvR8P5wXX1SVm/GHupKsJctquyAU0w9PuR7Mxa++p7ljqHEpnnnuCjBmkCdSiFPJJo
	CL3bmXo4gsImETG2eRQVDki9E2seSReS0OABaq
X-Received: by 2002:a05:620a:4709:b0:7a1:c40d:7573 with SMTP id af79cd13be357-7b157be5745mr2080606685a.49.1729596597472;
        Tue, 22 Oct 2024 04:29:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4709:b0:7a1:c40d:7573 with SMTP id af79cd13be357-7b157be5745mr2080600385a.49.1729596597042;
        Tue, 22 Oct 2024 04:29:57 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-40-241-30.web.vodafone.de. [109.40.241.30])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b165a87c18sm272505585a.122.2024.10.22.04.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 04:29:56 -0700 (PDT)
Message-ID: <03774345-410f-46e8-b31f-64505e4808b1@redhat.com>
Date: Tue, 22 Oct 2024 13:29:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/20] MAINTAINERS: mention my gdbstub/next tree
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Yanan Wang <wangyanan55@huawei.com>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, devel@lists.libvirt.org,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Zhao Liu <zhao1.liu@intel.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20241022105614.839199-1-alex.bennee@linaro.org>
 <20241022105614.839199-12-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241022105614.839199-12-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +GEPUvzxow8M

On 22/10/2024 12.56, Alex Bennée wrote:
> Make it easy for people to see what is already queued.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>
