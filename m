Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp49174njd;
        Thu, 17 Apr 2025 23:55:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3d06:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-3087bbb6b01mr2473621a91.30.1744959313927;
        Thu, 17 Apr 2025 23:55:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744959313; cv=none;
        d=google.com; s=arc-20240605;
        b=W97HaB4G4MarVGsv9WIbTRZl8CcrLdF3V/Fl358t19zJhuXLa8KPLgn78+uayP5CTR
         mEp8gCuSMgiA8UK6vKLuKYMOgnx9Twat6EVVMe/rpTTNoZOusPi6Lii5BHGLPrlwrybq
         Ncdn/BIugxcd5tl4ZHDl+SsiFGRJ4mZD3R5XHKFQPThMitxBmU040xozJGmNAZvkGx+v
         9aHXUAsW9x1Xjy2kM7p/5WndQOrMTqzpd6r+zUtq2il1OnwJ4L3p/hVLQIxDYv7fs0E4
         BJpZh/jvJtQYn4g8kscc3etghh563Zktp2RT65lYAWcdIBmOKDEwGuJvqNIHqG93pUbU
         +O5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zE3VYyJM4u91oaT272fs/Lb82dU6BoeKgOTBkGAnBu0=;
        fh=k2nEAftFpHjUgAhnKFxAt1GGLkXFqtNClWS1QT9oe/E=;
        b=i56BaIts58suJHINS+1crbJCOj9OAi2F8EdF920OxWyVzTv9AT+mWL3rLA4Jdm3Nur
         WpnMCOXga1pTd9kUePa6OwOwtOiS3mvPGYhsjjilmx4c2uYYmQXNhSxNsYnEJ5QAOBzP
         TTTJwcpP1VLacjBZUSG7i8FEsaOk7JXppsyhShncAirvnhgbWtRgjALt5XD2y8Kl+0vH
         Plg/01lIJ37mMpx9d5A6zHcrd/UZehRkP5rBTaaJJZ17So0f3H9o9LKsZShBZKedrtKF
         f4OddxTPlb3dSnuXqGodBlTR1FVCICo6ObkH9sVXycIFup0lULWPq9/wbP/+WFAd3zOy
         hmLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ff1ibJV7;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <ktokunaga.mail@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30879f2c352sor1012748a91.1.2025.04.17.23.55.13
        (Google Transport Security);
        Thu, 17 Apr 2025 23:55:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ff1ibJV7;
       spf=pass (google.com: domain of ktokunaga.mail@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=ktokunaga.mail@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744959313; x=1745564113; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zE3VYyJM4u91oaT272fs/Lb82dU6BoeKgOTBkGAnBu0=;
        b=Ff1ibJV7UkmvZf7NKV8HmbArf+j2xGlAqTryXcd0j61WFGfuw6eWQhl1NAsB9xHKW4
         qY22w/4ysiC5AVTEZYqcMQuc6L3jbBWr4fG9eYNXIYc56Qw8IAy+JtC8V55ltFV2TPFU
         X+f2k6vRBEZpTi+2eEXuLhfK10PQgxhoE6oqzdfUXZDfVFroDeHEHGHHLgC8FdwgJSPw
         ojUheVU7DLqp4b8uTsjwTMv/B9IBHh8/6q4ajiFYZ+51S2/0l35izFV2ajwMyPPfWbZm
         gK/trDSNfn4V4CuylwE+AuLmo/ZHg66UKdjfILb9ArQ25BDJULIKVT2Y/+GbKFi/AqWM
         nn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744959313; x=1745564113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zE3VYyJM4u91oaT272fs/Lb82dU6BoeKgOTBkGAnBu0=;
        b=F38E58xss/NwqFkuqxucCwMMMVDBW1GT+YeU2cLlrbe8Y3se2jSs3tGRqo6YpZ6nzf
         xCb5WXTXuN0v5Eu8hJFEdgsoIHwcXEcHmFs8dwOVBEnKZDJn+xJrnKHHvvT+tkw3o3SS
         SiSWgPGtOCUgLn2m6Pb2pp5M0C3jQ2kkrg46OnQ1FSrF4hJg9PFY3xMKy2ICSLhfBqMs
         YfbXRhKZi5Hq89HJ9IpVeUbnOy1eRIeuWPdvXgI1hNZJWHXohpg697L6kuX8xRgB+9sX
         L7TfzNe4rc/EZr/hxfy7B74MFeJIB8j6pEtg5c5b48DrgzVVTBZ9jxIHjTjkGnsYYMGz
         nJSA==
X-Forwarded-Encrypted: i=1; AJvYcCVZuXs2V1FGa2MvIGmrwXJ8DmCu+vSfc2O2ONwHNOBGzb0FmWClmX+wFB9o9m2uPc9NGPwLhLpFtBOJ5nbCWhG1GA==@linaro.org, AJvYcCWBPlXWw1mxPvRvWkulLKV5YK2M9HdNIs3szRrOPtQ8/caToPkgmldDQWpkj3ZzOQT/Tq8sV5d3u10fZofD@linaro.org, AJvYcCWa1T+RKgEikKyJrpvcTC7LfoRMZqjcO5yCesqccvQNYehaljbbq2J41+WKd4ucnNoeCva37jCJFcSBydHOxNNBtdM=@linaro.org
X-Gm-Message-State: AOJu0YxEXddk4Qpx7HIBDx+jGM0n6BNqF9xg7MlmdXVI2eloOcMxxVJB
	mmWzeBafcARiqPTZu/WpBKUT/zUQPrnXG7Wk6m9o7tJJa20Em9s0veFZcccRiCzkJOW6xEpd9w1
	/YjOt5iiAW1y6lgDxHTOYnGrFNPHHm+Ub1IA=
X-Gm-Gg: ASbGncu950vzoKXzPzEB3BTQQ0DRbpPXxeJctMRo0QrBsUFdiBkhRX7lyrFaBqpZiPF
	Uj8jP9M9YkHYSSyWSQeG0BYELJ3BLq/0r6PNzTIPNx/MSB0wjvx4OIdIhTIp4Rl7W1zPtCuNS1D
	TQz50TR/APkpWkmu3G9tVCbw==
X-Google-Smtp-Source: AGHT+IEkswcbCVI7/mUhn3wxHieDdDPozlUfys+cT2bFQ15bD/nf3bmeEmrpvKBq7tfaRK8O2YCPo2tfq0I+FHdD86Y=
X-Received: by 2002:a17:90a:fc4f:b0:305:2d27:7ba5 with SMTP id
 98e67ed59e1d1-3087bb2cbabmr2357908a91.6.1744959313243; Thu, 17 Apr 2025
 23:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <58863961cf88a72b76a90279da09ea332943924d.1744787186.git.ktokunaga.mail@gmail.com>
 <1e658b6e-02ed-47d1-9c19-d5753cc6e6c8@linaro.org>
In-Reply-To: <1e658b6e-02ed-47d1-9c19-d5753cc6e6c8@linaro.org>
From: Kohei Tokunaga <ktokunaga.mail@gmail.com>
Date: Fri, 18 Apr 2025 15:55:01 +0900
X-Gm-Features: ATxdqUGu39lF6lPk8TSLhKph8MX3trqBTUhhySRtvszhNLQrTN5JRUPtO00LlLU
Message-ID: <CAEDrbUYfR6KxTf1fkasMBin5kB83iKebmuAC9ToJnF_2A-T8jw@mail.gmail.com>
Subject: Re: [PATCH 13/19] include/qemu/osdep.h: Add Emscripten-specific OS dependencies
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Pavel Pisa <pisa@cmp.felk.cvut.cz>, Francisco Iglesias <francisco.iglesias@amd.com>, 
	Vikram Garhwal <vikram.garhwal@bytedance.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>, 
	Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, David Hildenbrand <david@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
	qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000038bc70633080041"
X-TUID: 5cgFzyjYddXV

--000000000000038bc70633080041
Content-Type: text/plain; charset="UTF-8"

Hi Philippe,

> You shouldn't have to modify this file, likely a rebase typo.

Thank you for pointing this out. I'll fix this in the next version of the
series.

--000000000000038bc70633080041
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Philippe,<br><br>&gt; You shouldn&#39;=
t have to modify this file, likely a rebase typo.</div><div dir=3D"ltr"><br=
></div><div dir=3D"ltr">Thank you for pointing this out. I&#39;ll fix this =
in the next version of the<br>series.<br><br></div></div>

--000000000000038bc70633080041--
