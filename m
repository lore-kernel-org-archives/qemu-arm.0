Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D26C79F89
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 12:03:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3Y3d-00013k-JA; Mon, 07 Sep 2026 08:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1x3Y3c-00012o-1d
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 08:02:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1x3Y3a-0005ZP-GU
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 08:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788782556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=bgpLL7vwYGw8jKQKvGQzcVNCbL7JQZtY8ghESOX8Ezo=;
 b=LQ5uBItx8I9ogZ/ZsoCWFyHV4yklvhRYlOltYsPSdhORTxsJ5tK+65PV5CDoFlTL9Gw39l
 4hKErx1ALHBZSQAgowYT3tlH9x9haw9pUwXevbAttiDaM+OxEVSM1WUusYHq5X4alf0kpo
 uUar4cGVyB0QHfrOkHb/Swfh/JEs35I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-X1Hkdy90PIWFIZenReJ6RA-1; Mon, 07 Sep 2026 08:02:35 -0400
X-MC-Unique: X1Hkdy90PIWFIZenReJ6RA-1
X-Mimecast-MFC-AGG-ID: X1Hkdy90PIWFIZenReJ6RA_1788782553
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-49cf4cc2125so16328075e9.2
 for <qemu-arm@nongnu.org>; Mon, 07 Sep 2026 05:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788782553; x=1789387353;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bgpLL7vwYGw8jKQKvGQzcVNCbL7JQZtY8ghESOX8Ezo=;
 b=tGqXmunaa11rOdVJmrBxk+OXewjccJgx2hD0eF7bWGo5WQuWYPj4Yl1L66G5ws+LXx
 MbAJ3Zwl1x/da+/806ZOxeh4ODpwar+xevG0zrO/3Gk37Z9Rp3XbWtXAf1l1QZl2RKDj
 n44g1OOhSLX7XnpzsAbDM7S8hpQdmZq9q5TAnriYTlLLuK5EBkFquXvie4AXnJXZfX/+
 h5py9+8+fldrLOVPekfaKKaEghx6bF+JBABdTSs2xFsVq35wJUyf6QciYFUwHvWsAbTs
 rfW3FjufHGLSUTGRssAJDwGBqH9OCwi7YpU/wd1zOtTfUULi1bjHrWZiyYfEz+1NrHfw
 WH1Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByoC3v/6xqoX5ZbZ+MzB3pfQAc1V/ckEBKqS6U7lm9YaKao+9HTo9KFphS1zLmnPkB7x5Ost7bRvQ==@nongnu.org
X-Gm-Message-State: AFuF++kv+i4S5tbdyDNXTKaj73yWRegOZ3h7lq+1ShrjHHOiaDumrcCW
 kWsFgAKvHK/Q8iHfbfElz4EZcYbCOkrYSbMbpomF2IA728ZJs3425pPgsPuYAPSscyFJDIYUBWn
 sXXzNncT0UIhQn8/aeGmushnKpaYBt9OA8nytMsMbW3F72uFJKkbSwA==
X-Gm-Gg: AYBFou3IYCu+OdwTsFAt7VuvWeGTjaDYT/amcKuoO85PJ/YqEUv/FoqAn8IWPVQg8uL
 QcoESIZl7Et80zNEzN+2SLoqTs1h9LlKLdwWCm8+LCnNFk/saebm5zbqqQad/dDvUe2KlZW5ZDC
 f0HVsA8uwe0HpuxOF9i0P20ECPAXqrPjAGoNr6QNEs0H7xdB3e03GH+jz4HCWlTUooVWnoSRyzn
 Qqo1UjW23lHIJ2O3ae9f+ttDyWMBycRrz3AmBYGOokFBHA5W+ffrwn9U+ix6DQMsV4oTqt+jfTa
 TZj5iQxIkKyYMRlAjBxB70CZKfFqofCncoKpLGjIelXhoeOKNjh4KDAp91IxJbgcvl3x9n/W
X-Received: by 2002:a05:600c:c4aa:b0:49c:e3c3:5efd with SMTP id
 5b1f17b1804b1-49cf8241a84mr381977385e9.9.1788782552811; 
 Mon, 07 Sep 2026 05:02:32 -0700 (PDT)
X-Received: by 2002:a05:600c:c4aa:b0:49c:e3c3:5efd with SMTP id
 5b1f17b1804b1-49cf8241a84mr381975285e9.9.1788782551871; 
 Mon, 07 Sep 2026 05:02:31 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.70]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883c074asm27362480f8f.23.2026.09.07.05.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 05:02:31 -0700 (PDT)
Message-ID: <3f5f77fc-05c9-4b26-8290-28b16dfd3be4@redhat.com>
Date: Mon, 7 Sep 2026 14:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] tests/functional: add skipUnlessConfig() helper
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <th.huth+qemu@posteo.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Glenn Miles <milesg@linux.ibm.com>, qemu-ppc@nongnu.org
References: <20260907-nohmp-v2-0-6d952d972c21@redhat.com>
 <20260907-nohmp-v2-2-6d952d972c21@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260907-nohmp-v2-2-6d952d972c21@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Cw0hFUb3kNwGcAKqZnjmXX7QcqJAQzhNvzpEiwJzZIY_1788782553
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

  Hi!

On 07/09/2026 12.30, Marc-André Lureau wrote:
> Read config-host.h and skip tests that rely on some CONFIG_*
> values.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/functional/qemu_test/__init__.py   |  2 +-
>   tests/functional/qemu_test/decorators.py | 25 +++++++++++++++++++++++++
>   2 files changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/functional/qemu_test/__init__.py b/tests/functional/qemu_test/__init__.py
> index 03e5c73d39dc..e21fa8279281 100644
> --- a/tests/functional/qemu_test/__init__.py
> +++ b/tests/functional/qemu_test/__init__.py
> @@ -16,7 +16,7 @@
>   from .decorators import skipIfMissingCommands, skipIfNotMachine, \
>       skipFlakyTest, skipUntrustedTest, skipBigDataTest, skipSlowTest, \
>       skipIfMissingImports, skipIfOperatingSystem, skipUnlessOperatingSystem, \
> -    skipLockedMemoryTest, skipIfMissingEnv
> +    skipLockedMemoryTest, skipIfMissingEnv, skipUnlessConfig
>   from .archive import archive_extract
>   from .uncompress import uncompress
>   from .gdb import GDB
> diff --git a/tests/functional/qemu_test/decorators.py b/tests/functional/qemu_test/decorators.py
> index aa135acc7857..7a7d30503440 100644
> --- a/tests/functional/qemu_test/decorators.py
> +++ b/tests/functional/qemu_test/decorators.py
> @@ -10,6 +10,7 @@
>   from unittest import skipIf, skipUnless
>   
>   from .cmd import which
> +from .config import BUILD_DIR
>   
>   
>   def skipIfMissingEnv(*vars_):
> @@ -162,6 +163,30 @@ def skipIfMissingImports(*args):
>       return skipUnless(has_imports, 'required import(s) "%s" not installed' %
>                                      ", ".join(args))
>   
> +def _read_config_host():
> +    config = set()
> +    with open(BUILD_DIR / "config-host.h", "r") as f:
> +        for line in f:
> +            if line.startswith("#define CONFIG_"):
> +                name = line.split()[1].removeprefix("CONFIG_")
> +                config.add(name)
> +    return config
> +
> +_CONFIG_HOST = _read_config_host()

This always reads in config-host.h, also for tests that don't need the 
decorator ... could you change it so that the file is only read (once) if a 
test calls the skipUnlessConfig decorator?

Also I'm a little bit torn whether we really need a decorator for this or 
whether we should rather fence the tests in meson.build instead (similar to 
what we do in tests/qtest/meson.build with config_all_devices.has_key('...') 
already). What do others think about this?

  Thomas


> +def skipUnlessConfig(*args):
> +    '''
> +    Decorator to skip execution of a test if the QEMU build
> +    does not have the required CONFIG_* options enabled.
> +    Example:
> +
> +      @skipUnlessConfig("PIXMAN")
> +    '''
> +    missing = [a for a in args if a not in _CONFIG_HOST]
> +    return skipUnless(len(missing) == 0,
> +                      'missing build config(s): %s' %
> +                      ', '.join('CONFIG_' + m for m in missing))
> +
>   def skipLockedMemoryTest(locked_memory):
>       '''
>       Decorator to skip execution of a test if the system's
> 


