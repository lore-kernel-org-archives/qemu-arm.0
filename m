Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4737665ejc;
        Thu, 12 Jan 2023 04:21:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs0o5hpTiobhMODHCuIRANXV7YmmLe8E6a+xzEtS2XkS01mDuaIgwJG51rqu9e61w+R9l8o
X-Received: by 2002:a05:6102:3d29:b0:3cb:8c6:da19 with SMTP id i41-20020a0561023d2900b003cb08c6da19mr35192235vsv.24.1673526086404;
        Thu, 12 Jan 2023 04:21:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673526086; cv=none;
        d=google.com; s=arc-20160816;
        b=Lb1n/QPP8J8YwkkVmCgdvCGoHAXzsxLKl9ema2BzckAKBgpmrZENrZR5mWVh4gGAap
         jklhTcDoyko+Cil80lVjUlUyhICPYsJub3XGQw5C4oK09MSAKDqZolARLogHulLFb1na
         0bAb32KxD5wizxPcVY/F7v2etsX0NHfo8SBok5ghKxmAJhGQmTtRvp4EXifTbRQK5h19
         Z6LQKXhCr5LyfNkt9grADDz/89wn67ImBNo6561NqpBQxeQT0arvn1egydmu7zz9KBSK
         PS7UQ/Au136oMDEe7vAFc+NmYx/+yF+z5flKK93Xwz0Ryl035CKLxNhis+uU0Ge5zZ42
         yUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xf+u8UrrR5wyb6z3Bp8h+7PAV2k8WeM26RI1bM/5cyc=;
        b=i98L2eTwb3hH7Jk/gge+ZxHAcsFD6Ctl96Vews54qqylSHRXRpwmyxQFQUJJhJJL4y
         /5c0d881WjEtZVPMyknXGvHxhBpemJveSvgOyPfWL6jjgWkGrnTjz9VHvewIBtAwqUb6
         K+1rHayMgcoKfxt/BInioqr8kP32F17DBf6TmiBIQGPSDIZ9i5X/GxSuq+rNE+aSR4tB
         4qi1sq2NPQNL+a0c+bhhR7rj1zEEE0b5Z3JJUm+Fl8sxC/LZ4wqCKIIWFVu5cjRa+LnV
         UHRxwtt7syVFKK/Oi2us5slv3jmVnN69a0qYhMOY8V0gLsamadSsen2svnsXOehyYmn5
         BUHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gG+0Zb11;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id f15-20020a05620a408f00b006faf3549450si11212479qko.493.2023.01.12.04.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 04:21:26 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gG+0Zb11;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673526086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xf+u8UrrR5wyb6z3Bp8h+7PAV2k8WeM26RI1bM/5cyc=;
	b=gG+0Zb11+S3vou933ha4KUZRJF40VuSnM1XJTPB2OGmsegym3Yysi0u9tCmTxPln3iiesv
	t/RdDKr2BmWSAf27npFt4Zo2n3Yp3QM2kPLkwlgMQNsklDUrWxWr52QPlOLtui6KCUkOst
	+3CCb40WnakX+cilf8t0d6r+DjFhWmg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-278-pJD-DOJgP9qeTzZmk13-0g-1; Thu, 12 Jan 2023 07:21:22 -0500
X-MC-Unique: pJD-DOJgP9qeTzZmk13-0g-1
Received: by mail-wr1-f69.google.com with SMTP id s20-20020adfa294000000b002b81849101eso3415644wra.16
        for <alex.bennee@linaro.org>; Thu, 12 Jan 2023 04:21:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xf+u8UrrR5wyb6z3Bp8h+7PAV2k8WeM26RI1bM/5cyc=;
        b=WND2YlAZqV13P/ZHjLIdw4lXmxZq/Hkp6qgI1oYw6TikVgrrEjDiJeGub3Bog3VIKM
         RcyAaEhAQzfyz77PitT4yzZ1/X9lM7PR51+X+J/mPYeP0yBeAujFyz9mvQ/Y9eTnbLsZ
         UdSNeUxJtGjpqk9K/Ud6ekf+ydqYjsDkj4wiMOp3eppMBKIeptSg9h5OAdHnE6zKxJUc
         00bcsusNpX9UyBRLrQVnrHwNH9+g8IvNcitqiwE436PPwIwjpkZczqGZrlyFdnCKEJVi
         ZibLwJm7KAWWp/eM4w8/hofZa85OV2ZhEl4HRFUgxBArYYlDGUi5Djv79ni9LmpXSMWg
         xrNw==
X-Gm-Message-State: AFqh2kpTw1TK7F4YZ6kWJFqs+62eGVqoEiqMKl43h6jLZR3RY08eO9Mv
	4Wa5BWl6ekdZbqYbUidicPkdf9ZnyWU3FGNOvsuPx9MHwg9nyaR7wW0m96fSr5ZIRgRDsV6QCNb
	VatOkfxZ88ZI235lirVI0mh8gHPAN19ZMbkV4EWc2XDjrItBeRTTBhEC5a++Dd+wZ
X-Received: by 2002:a05:6000:170f:b0:24a:9a21:c9e with SMTP id n15-20020a056000170f00b0024a9a210c9emr46640219wrc.59.1673526081861;
        Thu, 12 Jan 2023 04:21:21 -0800 (PST)
X-Received: by 2002:a05:6000:170f:b0:24a:9a21:c9e with SMTP id n15-20020a056000170f00b0024a9a210c9emr46640186wrc.59.1673526081582;
        Thu, 12 Jan 2023 04:21:21 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-128.web.vodafone.de. [109.43.177.128])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d6402000000b00297dcfdc90fsm16162209wru.24.2023.01.12.04.21.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 04:21:20 -0800 (PST)
Message-ID: <a7d2c722-e66e-25ef-6294-1e23f8fe285b@redhat.com>
Date: Thu, 12 Jan 2023 13:21:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 04/26] tests/unit: drop hacky race avoidance in
 test-io-channel-command
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ed Maste <emaste@freebsd.org>,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>, Bin Meng <bmeng.cn@gmail.com>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230110173922.265055-5-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: xFU5DxDs6Wuy

On 10/01/2023 18.39, Alex Bennée wrote:
> We don't need to play timing games to ensure one socat wins over the
> other, just create the fifo they both can use before spawning the
> processes. However in the process we need to disable two tests for
> Windows platforms as we don't have an abstraction for mkfifo().
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1403
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/unit/test-io-channel-command.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> index 19f72eab96..425e2f5594 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -20,6 +20,8 @@
>   
>   #include "qemu/osdep.h"
>   #include <glib/gstdio.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
>   #include "io/channel-command.h"
>   #include "io-channel-helpers.h"
>   #include "qapi/error.h"
> @@ -29,6 +31,7 @@
>   
>   static char *socat = NULL;
>   
> +#ifndef _WIN32
>   static void test_io_channel_command_fifo(bool async)
>   {
>       g_autofree gchar *tmpdir = g_dir_make_tmp("qemu-test-io-channel.XXXXXX", NULL);
> @@ -40,12 +43,13 @@ static void test_io_channel_command_fifo(bool async)
>       QIOChannel *src, *dst;
>       QIOChannelTest *test;
>   
> +    if (mkfifo(fifo, 0600)) {
> +        g_error("mkfifo: %s", strerror(errno));
> +    }
> +
>       src = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) srcargv,
>                                                       O_WRONLY,
>                                                       &error_abort));
> -    /* try to avoid a race to create the socket */
> -    g_usleep(1000);
> -
>       dst = QIO_CHANNEL(qio_channel_command_new_spawn((const char **) dstargv,
>                                                       O_RDONLY,
>                                                       &error_abort));
> @@ -60,7 +64,6 @@ static void test_io_channel_command_fifo(bool async)
>       g_rmdir(tmpdir);
>   }
>   
> -
>   static void test_io_channel_command_fifo_async(void)
>   {
>       if (!socat) {
> @@ -80,6 +83,7 @@ static void test_io_channel_command_fifo_sync(void)
>   
>       test_io_channel_command_fifo(false);
>   }
> +#endif
>   
>   
>   static void test_io_channel_command_echo(bool async)
> @@ -124,10 +128,12 @@ int main(int argc, char **argv)
>   
>       socat = g_find_program_in_path("socat");
>   
> +#ifndef _WIN32
>       g_test_add_func("/io/channel/command/fifo/sync",
>                       test_io_channel_command_fifo_sync);
>       g_test_add_func("/io/channel/command/fifo/async",
>                       test_io_channel_command_fifo_async);
> +#endif
>       g_test_add_func("/io/channel/command/echo/sync",
>                       test_io_channel_command_echo_sync);
>       g_test_add_func("/io/channel/command/echo/async",

Reviewed-by: Thomas Huth <thuth@redhat.com>
