Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2740309ejm;
        Wed, 3 May 2023 03:34:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Mz7X2qEiPFgqBDz9OwYppOTmINrY0uT+xLv+NDR03OoDPNu7ESmpPP4evGFKcLC407TkD
X-Received: by 2002:a05:622a:134a:b0:3f2:a8db:3d57 with SMTP id w10-20020a05622a134a00b003f2a8db3d57mr2902515qtk.3.1683110081418;
        Wed, 03 May 2023 03:34:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683110081; cv=none;
        d=google.com; s=arc-20160816;
        b=a63TKqlwpTHWelARiJPo4fAgGjMISEmBlQ2pa/194gb4zPoA12jdK9GqIGlKxbjde6
         Wv2qxAjQ6fTFrZcxakiqThrPOx9NxJSRXsjdVcenagB/Ti1bk54eyaNGD+68sfSemZMj
         43KjpxCVPAGso/W5K0Cu+0SuOKazMUqjs5lvVz4n69bSisnFcc84yi0CrnG60BB3sdeh
         tTUx1d60kf4syhjbt0NhFetYuetFjeLkQpBmC3AZ5HWWhGetz8pmUbBTSA5D+BguKS2v
         glustvS9EOTSzwsYqWhzU4nxfbqaNnQDIyuMnmKrxCNnZ9tmpgIL9/VPyuTbNtKPXetp
         SGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=t6pPYq+XfrfjaqZsj/DmKkWD8+wh+UXYIc8fbVOja2w=;
        b=Fgcru8ZkdeF2LM36zQ/V8OMkS4oC+F3w0kRuaODoUNZRIqMFYCOWuX9UUy563AHfor
         8p5N3XxnEkHb3pa6iUITvaOP2q3Pu3uW9gh9em/UH67XtWorDLDm0BPg2w5Q4+cPakgd
         2+EaMyB+hLvpmoT0gvtwLQr2wg5QIc4cpbFyTGP6m0dUzIF45arkut4oDLGSLOVQAV14
         tW4KhVIjZSLnFzvjCd64MxT/5aEVkF2EcBbBaejeSpGPQTqWYidpxA7lXNn+bNIj8Zj2
         e99hiNRy1/E2SHB9ZXX9AZA47mHw6RllM5FH0EhyyIe71JChkZtCNyYIcPke70y64I9S
         AHzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hvB6fJgb;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id e1-20020a05622a110100b003efb3f032e1si13669353qty.786.2023.05.03.03.34.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 03:34:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hvB6fJgb;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683110081;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t6pPYq+XfrfjaqZsj/DmKkWD8+wh+UXYIc8fbVOja2w=;
	b=hvB6fJgbb35EOvheFjKw7l1aQT8z/1Ysr3GtRiGbOOegLG5yQi8W/UtQ2DDKLskagTfukU
	S08gbYrl4UcTKwvi77ja0Q6An9NzbTLszMyWADSvK5dqw18PYx6uE9csPKBUV7Ra8RyQMB
	sYLAg4SaVgWUUqsxcTFjDYrok2yv8GU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-bau1f7qwNPCJ_aOrvUMSiw-1; Wed, 03 May 2023 06:34:40 -0400
X-MC-Unique: bau1f7qwNPCJ_aOrvUMSiw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3062e5d0cd3so1192985f8f.3
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 03:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683110078; x=1685702078;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6pPYq+XfrfjaqZsj/DmKkWD8+wh+UXYIc8fbVOja2w=;
        b=Ou+CoZKfxWwOfUuAxOzZYljZjvzUiCY+LoNM9MaErduOTesBjwrDRWGaYK53ykO65U
         kJpR9gpjOJC2bxM6OWxJvLVlSkHd04tfpXpKcgomofm1SESaXllYPImyeTzmed3lsFq8
         sIhRnKhaFwu3HwLZLw7+p7qDAN37xKwbGiQpEGRkcWj6swNn+beh9Kk8w7dhHxcoXYGb
         kb1ebYG8u8cqRFr9TOP0y13nd8XD6svppZs9crtaxzi2+m8+bYz7pj7IKxl31Jk5zQ4c
         Uxnkfv+6SDkM7xkpABM+XrtNnp1GA2Idi5XrrST0b1RCTEvAXXgzxFkwF36XYDl36oe7
         2oyw==
X-Gm-Message-State: AC+VfDzFSnYxWLQyz6qE6KMohpgW3uFYfthOEnph0jTnJWzUeIDGh+qj
	5TkTwNo1TTiXlxkWwXy+BHP9afmnAt97lqcHFmS6r/h5NPvR54E5+AtLi+uPCJcOkLEmWgccX8+
	QuSMgYPmK9ygcxFmCTvpV+AtDE2BiuT/DOFklzd47iSFiRZ26vaPfhDH7mSP70oMMZ1GdbeTZoQ
	XDaoYOlQ==
X-Received: by 2002:a5d:6a8f:0:b0:306:3b62:d3be with SMTP id s15-20020a5d6a8f000000b003063b62d3bemr2755238wru.41.1683110078538;
        Wed, 03 May 2023 03:34:38 -0700 (PDT)
X-Received: by 2002:a5d:6a8f:0:b0:306:3b62:d3be with SMTP id s15-20020a5d6a8f000000b003063b62d3bemr2755183wru.41.1683110078197;
        Wed, 03 May 2023 03:34:38 -0700 (PDT)
Return-Path: <quintela@redhat.com>
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net. [188.85.120.92])
        by smtp.gmail.com with ESMTPSA id j18-20020a5d4492000000b0030632833e74sm5960204wrq.11.2023.05.03.03.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 03:34:37 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Laurent Vivier <lvivier@redhat.com>,  Artyom
 Tarasenko <atar4qemu@gmail.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Leif Lindholm
 <quic_llindhol@quicinc.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Helge Deller <deller@gmx.de>,  Xiaojuan
 Yang <yangxiaojuan@loongson.cn>,  Stefan Hajnoczi <stefanha@redhat.com>,
  Cleber Rosa <crosa@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,  John
 Snow <jsnow@redhat.com>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,
  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,  Andrew Jeffery
 <andrew@aj.id.au>,  qemu-s390x@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-arm@nongnu.org,  Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>,  Beraldo Leal <bleal@redhat.com>,  Max
 Filippov <jcmvbkbc@gmail.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
  Radoslaw Biernacki <rad@semihalf.com>,  Aurelien Jarno
 <aurelien@aurel32.net>,  David Hildenbrand <david@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  Song Gao <gaosong@loongson.cn>,  Joel
 Stanley <joel@jms.id.au>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Fabiano
 Rosas
 <farosas@suse.de>
Subject: Re: [PATCH 20/22] gitlab: enable minimal device profoile for
 aarch64 --disable-tcg
In-Reply-To: <20230503091244.1450613-21-alex.bennee@linaro.org> ("Alex
	=?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 3 May 2023 10:12:42 +0100")
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
	<20230503091244.1450613-21-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 03 May 2023 12:34:36 +0200
Message-ID: <87y1m5r9dv.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Cz8+D/2BmIqI

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> As this is likely the most common configuration people will want once
> the --disable-tcg patches land.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Fabiano Rosas <farosas@suse.de>

s/profoile/profile/ on $subject

> ---
>  .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitl=
ab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
> index f8489dd3fc..374b0956c3 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
> @@ -145,7 +145,7 @@ ubuntu-22.04-aarch64-notcg:
>   script:
>   - mkdir build
>   - cd build
> - - ../configure --disable-tcg
> + - ../configure --disable-tcg --with-devices-aarch64=3Dminimal
>     || { cat config.log meson-logs/meson-log.txt; exit 1; }
>   - make --output-sync -j`nproc --ignore=3D40`
>   - make --output-sync -j`nproc --ignore=3D40` check

I have no clue about what arm users want or not.

Later, Juan.
