Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4819396njd;
        Fri, 25 Apr 2025 23:36:31 -0700 (PDT)
X-Received: by 2002:a17:90a:c884:b0:308:5273:4dee with SMTP id 98e67ed59e1d1-309f7ddd4f5mr7813619a91.15.1745649391221;
        Fri, 25 Apr 2025 23:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745649391; cv=none;
        d=google.com; s=arc-20240605;
        b=Oq0mqLbATSqczy+0GQAv2BdujhLnNfSM7NFStIUHoenXHoVL3U0C3HNasxhuzHa8vD
         4zXT/4UriHzJe+tE+rZt2j2ynDEnSu97LRsD7gp54ToUQuRHv0jLXtQD7OV2RPxemgZo
         dJw+G0kLKuy5y5gNYfuxyYXqL+5+mA+Uv3z199LSSWJ1YOZ1bsMbNLGSq5jjADkV+2kr
         Lvdo6S+uZOaIyHesRgki1h/K6TSYJ4aTFPy1x5SqgJROr3VVnJos52YxVie07fqXKeDT
         qOcmb5p0o8UQHtOryJh+LonfsVn6a5xzST16tsj26o8viM/CTKJ9fHk784iNQkcdJadS
         e5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7/DYVcSZH+ZAOykmkKdDPPXfsHSN4FIgsDv2mq8ftDk=;
        fh=+dbNSdheosX43gkrhwzb+jeEZp69IvkTGVJCdRq9DHA=;
        b=CS1VJgv1PJzK2WE28/ruc+iLZiDH8jDNLmD8NcXMXCUqIt0znzhGVfO7XnXYFumx3W
         Jw+pS3g3NVdToeeHKGpDwkWyqbRAXe4HcRewjef2g9nrIFI/r60gjyUTj9e068Vc9onh
         OP0e2YmHCcAyYd1mQ9AN1OlbrOXmoRuPq2+Yco33zydJpewgdD68Sx8pYrCN+Y1IT7JE
         MQV1C4rcEqPdu1prd3W+H/hjrLk7kIExqwrNba5mEyX21tTrjbnvCFdP4MuJgP4smtru
         QWlF3kf6a0v8TqgpLMxpOSOWaXuzN9Z5HpyKWh9cMLFnUkLxMrNokoDVErg7G9BoViGo
         Aevg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FrhVTyXr;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-309ee80fd1dsor3577656a91.3.2025.04.25.23.36.30
        (Google Transport Security);
        Fri, 25 Apr 2025 23:36:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=FrhVTyXr;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745649390; x=1746254190; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7/DYVcSZH+ZAOykmkKdDPPXfsHSN4FIgsDv2mq8ftDk=;
        b=FrhVTyXr0WklnlOnYFyH1K16nX3TWymE0Yrs++/n8XdSzP1BYN9EMblJQwSOstMwK6
         SJEBL6JBFNM03hBvUpQ60waEtDhOgyAn6wXUVISwC2jjihpwfOmvyAnilaoM+Gow5/3t
         JdCpOvbHJrLw+MynOPoc+opFVv1O0Ec13grQNXjUFB+DOPBBIU3BVAYZ2CludjGyaTqH
         Nt5ZpMh9PWnNLGFh0ZQ3wk/6RDLUNYmDYxZ+GApPavfQ8JhudCYbLMIFHRPg7qvOTxTM
         Y0yKlejAMUNAeTLo3j0vmiXVLRXh6C+/Gfvlz0Mpby5GgSjFFZagr4CltsjNLjQ0kR3n
         uv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745649390; x=1746254190;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/DYVcSZH+ZAOykmkKdDPPXfsHSN4FIgsDv2mq8ftDk=;
        b=nReL5L9f37QCEHn834luRUQsUfJzSWM8mRMqeXwaxQiAPX9Ovw+rDq04UKIQPIK7In
         ws+OjGbQJ44rpxr/MYHFW/HvM/tH6o9DqjUt4Y3YEvgvSnx+xU93fo7ZKc6WMVRwjJej
         TPbfpz4oVXw6GP9hHumNJAcgxBXipmM322aaFNbRRzjASMoWXyr/A5pZpS6zRbbBOCg6
         6RMrYPH60Cz8ZRwJt4saD56JjuxHvaTzwuy2mJKhKdzv5xl5H7cZ8LwuHaWbaJApDxAK
         HW3oal8P7nh+K6tctMBd4CsBUrPCEVkteenRl3IDeHfya619Zkefs9zinca7WOt1NEWO
         QtRg==
X-Forwarded-Encrypted: i=1; AJvYcCUAoO6rA0rHP+bThvOK9M6mCrVAvA+qFGyV+DhYCespYQT1TyBxmcTXBRWz0yM5vsTH14A93MsfpVTRzkZHI5ZauYE=@linaro.org, AJvYcCVX8PlvHbY/1YH0j1sYM9XUOBnkN+rase77SYH/Sjo6ayHyVPgMoCzcV5NyekpeYX/DhuO/yTaZ@linaro.org, AJvYcCVsMPttklAl3l6ZtsG0kWAEFvxH9ioYcseBBBy3eS8hKzfHu4zg69+kz2MoicXX6OsJ1Lu2587OdCgzrqAZ@linaro.org, AJvYcCXm8FP0F9eEtEsf/+1oxeEghe3I3h5qlDqeIHcxpEHB+Gn8pLeQL/wNEtgTCiZSuE11p2E4KFxwTGeKBJrQtHGvcQ==@linaro.org
X-Gm-Message-State: AOJu0YwS8cW6PdXt3cLVRkAp+aY6lsjJpxIoCIKczWLksMNECfBxGBhD
	8aqrX1HNFPiDNmhwLf0f68lJ6EcYjcAfSw5mNBdIg7My1luaEEHntwJ9Q0rm1djg8lweS4w0YGb
	Naca33+j1/w7CxULUEuqVw49UkqQ=
X-Gm-Gg: ASbGncuHtK9/BTmUK0K37zE7aCNmJ0jvpa5832qPR6sT8D0/YN+rOnGiBrnZkkom+6b
	nEst9DfvMAvxoSbVC8K+3uObaiaATyKXKoVYAF5C/6YStZbtRYhoQOEUyhB5b2JyTQmN8chmVNm
	Tq+DyO+HmLXPg51fSq31rmIMrBmG7i35sNvDL+xFOMQ3YnsDcCHAyH
X-Google-Smtp-Source: AGHT+IHMcheiRX7erJEHMS9wBhZL3GAzAbFVYxcWM3rTtUBOTQfuoJgV8JtbSD2j87Ul7lrwoc20Wvu5/d2oBjfRKdE=
X-Received: by 2002:a17:90b:5101:b0:305:2d27:7ba0 with SMTP id
 98e67ed59e1d1-309f7d87675mr7518197a91.6.1745649390456; Fri, 25 Apr 2025
 23:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1745295397.git.ktokunaga.mail@gmail.com>
 <edc1b2ac9a26dc5bbf9a3897e842fbb36c69ea87.1745295397.git.ktokunaga.mail@gmail.com>
 <06c52d58-1b12-4036-b243-91be7a1b841f@redhat.com>
In-Reply-To: <06c52d58-1b12-4036-b243-91be7a1b841f@redhat.com>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Sat, 26 Apr 2025 15:36:18 +0900
X-Gm-Features: ATxdqUENhsWBICk9wxb3d5lIslSKZKSH5r1a65cIaeR_TLmUoy57ps7Ep6Mfc3E
Message-ID: <CAEDrbUbq=r_xuKcBLJ+1p5O4rkVVfaq_q5gP7pDuei_5+zCBSg@mail.gmail.com>
Subject: Re: [PATCH v2 10/20] include/glib-compat.h: Poison g_list_sort and g_slist_sort
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Pavel Pisa <pisa@cmp.felk.cvut.cz>, Francisco Iglesias <francisco.iglesias@amd.com>, 
	Vikram Garhwal <vikram.garhwal@bytedance.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, 
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d212ca0633a8ab3e"
X-TUID: SJvYuoR8kHkS

--000000000000d212ca0633a8ab3e
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

> Cosmetic nit: Multiline comments in QEMU should start with "/*" on their
own
> line.

Thank you for the feedback. I'll fix this in the next version of the series.

--000000000000d212ca0633a8ab3e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Thomas,<br><br>&gt; Cosmetic nit: Mult=
iline comments in QEMU should start with &quot;/*&quot; on their own<br>&gt=
; line.<br><br>Thank you for the feedback. I&#39;ll fix this in the next ve=
rsion of the series.<br><br></div><br><div class=3D"gmail_quote gmail_quote=
_container"><br></div></div>

--000000000000d212ca0633a8ab3e--
