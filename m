Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2738195ejm;
        Wed, 3 May 2023 03:30:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ66BAb5deyZquNbcFlSyJl9J9HL7PNYw8saMR467jQu7QCXGBh5TnpefwFycEAdLuur6QCG
X-Received: by 2002:a05:6402:47:b0:504:a2e5:d951 with SMTP id f7-20020a056402004700b00504a2e5d951mr11000292edu.13.1683109817785;
        Wed, 03 May 2023 03:30:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683109817; cv=none;
        d=google.com; s=arc-20160816;
        b=0yk/cNtQc5rPtS9SGtjvsXiJhvCd9lfupqFhRRfCtS2SAj/nLzTz4vFmppzG+El5ya
         vILhoaJHk9g4LV4okPnqmPQ/s9nfmkH2TK3Nh8JwwHDKzsDnP0ETXlqrUjk0wrqfnPWQ
         wtCU00YIJJAeNXxnHtnBmj/OUI3vjwBB/lruCjdbB0DX+ZioP15USd3K972HY+Fcmnr7
         ovT2BrljbqUID6cC7Ccu/AXo8+GgspP+eR7ECprew+NuuNQWyw53i/6NgNXTCLH46Ep+
         JCkyFGV61XP88qlLC39lBDI/CP9HBBQaMN26t/YrkaZozsYCTEkpMSW9gGWmi5bswDGf
         HzMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=En9QoHUoC6dMPn6ozwvRZYLS0H/sOJprYNMiFk0oPoU=;
        b=v32XNSBtNsoaCpMeLqTmEYbaAG0hI4SV3Hwd4bZK1fLYsRolmQQobQa+0Rv3rBNCLT
         G9Ju7lsXXZq2G+lRb1fhx1w6ScZNDr/LHU02sbvC4NC4OKUDBljMc/tXGZRptCdXLVyE
         wdHIaDBMONBFUz02lzZhFvhrCCB8UPCdooZ1oa+zqKXD2SkZl6R/5HouoEAniOGQwfOu
         VZgMCti+8AyLjaYBI/tqJJPq28vlXw+Dnbwb2iRciwB/66a0EQQTyqHzqFA8hhmcCA6I
         Bh+D095yaJ+PmpLPwLVJKIM7uM5sk0jF8KZALw+xtC6Ph+3gmXoHE2ek1KZauGxlZNNc
         U1Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P5rzX1Rq;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s7-20020aa7d787000000b0050bd64c4e33si885694edq.611.2023.05.03.03.30.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 03:30:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P5rzX1Rq;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683109816;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=En9QoHUoC6dMPn6ozwvRZYLS0H/sOJprYNMiFk0oPoU=;
	b=P5rzX1Rqi7EeRAZ5++chMAAYjtzQLrKte/yVPEe/XweWZMLTuParPyjHJJzWh90GDTvq3I
	erW3hk/yNapwmPCGiRxsVgYn8rX6jVL/1maRE/Rq8OTO8XOjjK8j7jB+IHEXmYqJZmOYs5
	5LCNJLHCWjron9r0pwWJFio4bfHViUw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-WiE3zz5ePzuV6C_jSSu3MA-1; Wed, 03 May 2023 06:30:15 -0400
X-MC-Unique: WiE3zz5ePzuV6C_jSSu3MA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-30633990a69so871467f8f.3
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 03:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683109814; x=1685701814;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=En9QoHUoC6dMPn6ozwvRZYLS0H/sOJprYNMiFk0oPoU=;
        b=QlqYMTkQJjfS7IjW/0Eux64NA00U+rz+RwrOa+QLrgj2DMQ7oDqkh80/aG3oKUYJ6t
         fc2xxWR78hwiep3skvQjHh9mCmJB0QaBtMigp5w9AZ+aJabXroE3scJXjXebhNKhElCm
         PA0/mvvbGgMk+n8ewTWTVlz2Xzrn2xFA3/TN8hCG1o1yifR7e5ElDx26vTBXmpCJrUAG
         HU+oCPXi05gDeREZj3GQR6lmieKNU44pvOwLBZWsxfvrAe1fkpDsPYPQ6ZMQfIv3Lyrh
         lRSoR/FDnoBo312+T3m85tt1L1iGgLeB164etjwk6fN3YafTrxWPRzW/hmdX1NFAjZQh
         9JPA==
X-Gm-Message-State: AC+VfDy92wwzrpZP1Dy9JNGqDkqdqEVzww7la3XoPXAkBANmwxG16q61
	VouzCns2ZD+GtTCih6OK9ikIW+WUnt8O2m33lvnZSPpWIUnFVU++jajzt1sHtkf9AgV4c5CmOZ1
	io7SPu9giJ6LYSnuYOR+Ui3wbccSrLsLERuqivv/DcrtKJ4/aOwctjX/MRL3lTVlpYCbtS33QbZ
	ZV/J3Oqg==
X-Received: by 2002:a5d:58d0:0:b0:306:2701:5346 with SMTP id o16-20020a5d58d0000000b0030627015346mr7992132wrf.39.1683109814023;
        Wed, 03 May 2023 03:30:14 -0700 (PDT)
X-Received: by 2002:a5d:58d0:0:b0:306:2701:5346 with SMTP id o16-20020a5d58d0000000b0030627015346mr7992077wrf.39.1683109813602;
        Wed, 03 May 2023 03:30:13 -0700 (PDT)
Return-Path: <quintela@redhat.com>
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net. [188.85.120.92])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4c82000000b003021288a56dsm32554642wrs.115.2023.05.03.03.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 03:30:13 -0700 (PDT)
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
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 03/22] docs: document breakpoint and watchpoint support
In-Reply-To: <20230503091244.1450613-4-alex.bennee@linaro.org> ("Alex
	=?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 3 May 2023 10:12:25 +0100")
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
	<20230503091244.1450613-4-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 03 May 2023 12:30:12 +0200
Message-ID: <878re5so5n.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xctPN3Q1VPov

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> This varies by accelerator. Also mention the modern bear trap that is
> ASLR.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

> +Relocating code
> +---------------
> +
> +On modern kernels confusion can be caused by code being relocated by
> +features such as address space layout randomisation. To avoid
> +confusion when debugging such things you either need to update gdb's
> +view of where things are in memory or perhaps more trivially disable
> +ASLR when booting the system.

Makes sense for everything except debugging ASLR O:-)
