Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2198847njb;
        Mon, 7 Oct 2024 14:16:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUl4sq5/VG/hEoZfvlyPlV46h8JniWHg7oMcaUUYKrW97BIFCH9iyrwq1fG4EBPDcLr62M0JKmPWPyC8Q==@linaro.org
X-Google-Smtp-Source: AGHT+IH5SfjX9Df9leqXWhMYIxObY3u1XxGacQLU2RfgKh2+bgQTCan1jX7ohZAD2qrnloe2iplV
X-Received: by 2002:a05:6512:3e0f:b0:52e:74d5:89ae with SMTP id 2adb3069b0e04-539ab9e4165mr6561853e87.39.1728335773136;
        Mon, 07 Oct 2024 14:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728335773; cv=none;
        d=google.com; s=arc-20240605;
        b=ZUp0cyiGZTcy5eznfi3YC3t+mzmnmFe8Ak8XkRHodpiGocGwYpBAKU8dxy8t+eRpGu
         uK0sxryPeo4x8S5ctWqogp50XzCTVgtg9mArki9d/xPHCDNPrCDdEa5cHJ05/7P4ohcD
         YPHzJlk0AP7u9+4fCZR9Ex4s6ScrVVqpTjQ3q+rV6+BplNjFFJSiEslWoVPHygYA//lS
         4KdXJAJ3hkhE1Ba/GwE+ddPzuzWAwYB8Pd4Zq/NbWtkbeMsND8atgzGKeHfiWL4uSajj
         0+Z+UqqF5hpfaBO9O7f61TEXASMVeoou7TyBiGvZnwel1Hj7wdAIWFTBpoP7KLokV0t3
         IKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=y7YOKmsDd2Sw+bnZNnqv9bTpXJJSuIu8qmMnvJ+HE10=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=YI/pxBimf0cupofZoKVk0JkNI2RPQmjswCNmyRJlvzSzgUQO/OVidNXP2xpC+Xobjg
         kW0DWUQoXAW142K7RjAgCtKqhq7M12U3K95YSIPoiWp50jhR8lL9XqWnYkSY1eOokXhU
         e33zXCq8xwwuz48OmQCHkMyg7Ux+6n85zcpFYlpUZR/GZXSw79UVf8q8BqjEEK/M/7zx
         SqTs6W0lJgvp2a62I46Ln0ztcx/7MTAwjLVPBHAR2YVT3xB2wmj7Fhp6da9/CBeRnG4a
         gi4TL5D51SkfSzKHJ8g4WbnscYI2JRi7L01Ie41393ebsGaKX9G6UxIoLbKlclw9bXpA
         +JGQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=NCpKrgZ1;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.20])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5c8e05f134dsi4732229a12.467.2024.10.07.14.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:16:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) client-ip=212.227.17.20;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=NCpKrgZ1;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.20 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728335772; x=1728940572; i=deller@gmx.de;
	bh=y7YOKmsDd2Sw+bnZNnqv9bTpXJJSuIu8qmMnvJ+HE10=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NCpKrgZ1hMZlIx8RiFTWozCUXTftmc6F8L0nz/v+xdJa3ruWLNgXnw0xBqB8fgV4
	 Xfexjr+3gSlD7JU7wdiviYec/uDI5wOd1Sqia4RkBvkI5DM75HH+OpnwBB/e/i6/G
	 LoVJhi0ppvq1ogk6UoShEjgxn5hErg10akVlIuU2nNmXlgUIeNoU07N1ApPP/wIVM
	 WLeiT22LKVj+fWsBbONwa6gvurv9c6vAL+MzNNZsfuLk1OwkbyOZ0efzo9pu+uhb/
	 /GUiytCPiIRZ46dn2fdIwoA8d3Pe5k0NglrQSC2pV/U4ylLhWTYlmy/NTR4hMhVjH
	 CKsZjnvcDvaakqaZ4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McY8T-1tYcDJ20J3-00gZGZ; Mon, 07
 Oct 2024 23:16:12 +0200
Message-ID: <05f3367d-1dd4-4b44-a804-7951665d93a6@gmx.de>
Date: Mon, 7 Oct 2024 23:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/21] target/hppa: Fix priority of T, D, and B page
 faults
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-11-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DLDA+Fd56ZzGQFtc5i+Js8hT/eAkUNWLho0gh3A9iixw8FIUXIy
 j1abqNTug7msrjYYy3U0ZjUQ64czsQO+N2N9zQH/jFwB5ZPZZsOtj4UqAScQZf1/99FPmNz
 a6y8u4vIx/hZuvsSYcHxHFvBDT43SYwlzJS95VsZ1ZXSFYVgoLAZVGN1EIg87Y8yGTkLydn
 2/AVj6eYeiH6D//kxCAJQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1aQxiWF0D2E=;NWKq02qCJghaPaqqWqdIHhZc0OT
 udabMPYtdonRHgHW3MZR2RjevvFEQFMc0lz0JuKSPTqJtir/2zveTMqt0hm1lMVYrxWn1xire
 KCy9AM4XAR/nCwrMOEL+VdeTpBSOAXteQuCiTw50PAMXH5MFVolePRPxb7TSeamrStsuCpLjS
 /LpxH1T6XCt5Q9yhXHB7RbrJpmNmXuXTEPo0UTV+L9xhyB5sYAngQx0DbF0w53qFw7+cWlLK4
 f9zNQfdTfQr2RYSDNUusFcoTBK77edRD2HTGwrjuhuXzV832zNnzD7owzZN2rmgr+zFUlTKWQ
 j+T5prL5wlUpKSbavTk7wHi+OT4Pzq9PXGqRZaXqEr0PF1ibMLjdPXR4w+9ZARvaHEmgz3lkr
 N+XV4slh5uhDrEbGPrtfnmGS1TDkFGE9WTUlaiF6dENyAKZBqKTluSb+Reunt6xphhCVSoHOS
 mH92HSZPELdWm6NR6GuKN1KXq0XHUaMNtGunlLPaqNcfsbGjZ2h94RWL3QwSxJdqHMFqBcXam
 MHTn5anDuLVtdmiRBXQlBGQC6ZxPNMC65G5FeqwoUaxW+MkyW01ZWrv5O+hprRJOf9WiX6HLA
 cNuyeffMYPea25toVNzCJoe1f2BOkt2TK03weVQaHeG//g2f9z7KUQWbTu6x8yZDT6wYuyODO
 PxpN46ZOZU+GrOKCdWVaAzZ8Eb19qKWzY5iVGmJWJ7bIjL/n1hms9/mqk2vIhpTmEA8XpO6st
 rsXHU9qxEeXnSv39OCRdwZol18VZ1MZSdbbucRnO39/CRF+grvelbxRIQ4bz4mehHchl+7Jo4
 FQdqp2EppiBdUuIKMw9Jcwbw==
X-TUID: OwSTi9qDqqpH

On 10/5/24 22:05, Richard Henderson wrote:
> Drop the 'else' so that ret is overridden with the
> highest priority fault.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   target/hppa/mem_helper.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
