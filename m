Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2523578ejq;
        Mon, 8 May 2023 23:51:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ67QQ6nvqTgbzGqdlMj+JrXKkES+ZR0/n/PLtCtsOF2gcH95BPpcUI/IgCGrztfgKJf01TX
X-Received: by 2002:a05:6402:8c4:b0:506:be3f:ebb1 with SMTP id d4-20020a05640208c400b00506be3febb1mr10054297edz.26.1683615083781;
        Mon, 08 May 2023 23:51:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683615083; cv=none;
        d=google.com; s=arc-20160816;
        b=a5/OF8weFKjT8Q/dCChFaZ48r+S40HQ5RXJRVRkeeDHIAk+WCq9i84F2s9cciNuaYX
         ACOwLFEuHKjOINivT3pUhWXWaWckNoiteX71eB3VjPTOH9Qec+UeyEGWLzSERtIw/cfG
         pONHzfltX4Sm6rIYiNM4ooYMn8Nsi6teLQMwRttn7PzgPeKwYps9txBWyTcuCbTSvydl
         K8gsfAsK5+X7unqf2GkTduS50rPiE/cPfwwNzG6a6qLpNRPT9yx8O4TR9BucszN8lfk+
         CXhWgq+3huZKBcEc5OsnFXd5ZQUm/ljdvAQmQtQ6ihwz3bEWqFD8Ya3Uu06pl9zJ5VKO
         wOlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pRUycvyeJsgfCR4Up/kBe/GSmpa2t96Jnpur212oKHA=;
        b=CQjxZh21MB5Nq6QP8ORkGTgYRBf1PNYLrDtVznUGSxj+OAiAr4wuPJMLfxD2TA4YuP
         PIi8D0ZYJbvTZ1bYZtAJVjjBSp1IND7r4UYOJaoMSS6FqAVfobxL4k17MZi/c/HIQ+0R
         lrerGEifTX4tHGOKTH3oVwxaKE20FUzmyQ1zSPaZ1CumfQU9+2GJNUCs48DFu4jc6DxF
         3seEvu23pqxgTZ6KnJ0TqBo0FjbYQR8YMjKDwgxqhhMeTv+oMkW7sEbtQUP9qCCXfivr
         hT3GDqK76FKqeNBy1iaJb7vawPBrlhhFuQN7vp1qFd3xmnesQ5w23K27EXTXZL2h0QUp
         2m6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fbTT23ZF;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id l5-20020aa7cac5000000b0050bd0b3dd4csi669350edt.347.2023.05.08.23.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 23:51:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fbTT23ZF;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683615082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pRUycvyeJsgfCR4Up/kBe/GSmpa2t96Jnpur212oKHA=;
	b=fbTT23ZFtjxHrdqL5BycI3U1w+SPDocOYrPcUGf2rJAi4WwLfdISxYwWgZlDGUDEddkfh8
	uWzmRfVWym54oMMHKlIohiOePkMob5CSG/lD77qXFcp7qoyRlL/M427d3/FmxK3reWGyIm
	KwzeehUKFFCM1HxDMxaYIDH0KwWOPoY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-tVWlHNnSMk6msFqZf91zsw-1; Tue, 09 May 2023 02:51:21 -0400
X-MC-Unique: tVWlHNnSMk6msFqZf91zsw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3063287f1c9so1980767f8f.2
        for <alex.bennee@linaro.org>; Mon, 08 May 2023 23:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683615080; x=1686207080;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pRUycvyeJsgfCR4Up/kBe/GSmpa2t96Jnpur212oKHA=;
        b=Qvt9L9wbPgcePfv13/lkmF3uDS8gvOsGDjjm38NjxNcxkLTMp4bItGAfXo9T8Yp9PP
         ArdGkZZBHvLUw7UloUr56FxE3N1sywPVBkD19apard3hpPQsD8LmQT1IGSBIof+30fFl
         dciSodh/DyEblAvXuHXBWKMqGV/anxkUZc3d1QMGvzaP2slYfMXP2DyU9UD1LNDO+Ior
         MOUMC1yytbdEV7pIH989/QCdSHyoDczQcrD+dwwnBxEJw0xI6/LKIXAGAkf6hX8q1yAA
         gg71pz5IiJU6gbyDWdATOVnbdj8sHQcpDEc82uJh9ErM/jaBOedw2OZ4/K4VlhC90/SW
         0HQg==
X-Gm-Message-State: AC+VfDyx9h5qdU8HW4sl7Gxogf0Odd2cumthX40W6Ljw0SYorv3o121I
	CzMcyDrfZAkuwSPlfAm6+ciRxewULHHovmQG6gGECl8TA+dzcL6tmVvrjLqFUG8M+0AjGV/ahX0
	mW7yX78fcmSyQg+YfrT4yBvXS
X-Received: by 2002:a05:6000:10a:b0:2f9:482f:c13f with SMTP id o10-20020a056000010a00b002f9482fc13fmr8166294wrx.46.1683615080403;
        Mon, 08 May 2023 23:51:20 -0700 (PDT)
X-Received: by 2002:a05:6000:10a:b0:2f9:482f:c13f with SMTP id o10-20020a056000010a00b002f9482fc13fmr8166280wrx.46.1683615080144;
        Mon, 08 May 2023 23:51:20 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.3] (ip-109-43-179-53.web.vodafone.de. [109.43.179.53])
        by smtp.gmail.com with ESMTPSA id h14-20020a056000000e00b002ceacff44c7sm13322429wrx.83.2023.05.08.23.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 23:51:19 -0700 (PDT)
Message-ID: <09048894-0f80-cc17-c222-9371fd76b20d@redhat.com>
Date: Tue, 9 May 2023 08:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 3/3] tests/qtest: Don't run cdrom boot tests if no
 accelerator is present
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230508181611.2621-1-farosas@suse.de>
 <20230508181611.2621-4-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230508181611.2621-4-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: S+4FLrZ/jn32

On 08/05/2023 20.16, Fabiano Rosas wrote:
> On a build configured with: --disable-tcg --enable-xen it is possible
> to produce a QEMU binary with no TCG nor KVM support. Skip the cdrom
> boot tests if that's the case.
> 
> Fixes: 0c1ae3ff9d ("tests/qtest: Fix tests when no KVM or TCG are present")
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/cdrom-test.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> index 26a2400181..31d3bacd8c 100644
> --- a/tests/qtest/cdrom-test.c
> +++ b/tests/qtest/cdrom-test.c
> @@ -130,6 +130,11 @@ static void test_cdboot(gconstpointer data)
>   
>   static void add_x86_tests(void)
>   {
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No KVM or TCG accelerator available, skipping boot tests");
> +        return;
> +    }
> +
>       qtest_add_data_func("cdrom/boot/default", "-cdrom ", test_cdboot);
>       qtest_add_data_func("cdrom/boot/virtio-scsi",
>                           "-device virtio-scsi -device scsi-cd,drive=cdr "
> @@ -176,6 +181,11 @@ static void add_x86_tests(void)
>   
>   static void add_s390x_tests(void)
>   {
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No KVM or TCG accelerator available, skipping boot tests");
> +        return;
> +    }
> +
>       qtest_add_data_func("cdrom/boot/default", "-cdrom ", test_cdboot);
>       qtest_add_data_func("cdrom/boot/virtio-scsi",
>                           "-device virtio-scsi -device scsi-cd,drive=cdr "

Reviewed-by: Thomas Huth <thuth@redhat.com>
