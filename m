Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp416730lfg;
        Fri, 5 Mar 2021 06:57:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3Pvv4hUlB+ISxAF13XD9T+0yrqZDPqiy+PLJygJaUouF+GioCOCUZhGHVQajY4kT19dRi
X-Received: by 2002:a05:6e02:1806:: with SMTP id a6mr9148616ilv.8.1614956225955;
        Fri, 05 Mar 2021 06:57:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614956225; cv=none;
        d=google.com; s=arc-20160816;
        b=EWM7ifrF8JAaERxzNPgAKP59h68F1DHTX/glqnM4miqeFBe3wgp2AEMhBsesc24rMy
         mbTA7dO/hqT2xkwtZFZsF3CxSTS8BZ3IFre1LDyNKollBOJWV+nbepcGo4uMQD4MuCHv
         C/shKQgPyY8nU8do1WVAHzM5003A5/F1513ZybGT+R49zX8ZphzlkkHe5qgaaZsJTnxG
         jQTEWz9RJiJ+fX/sGTU0iH6AcbjK1S9ish1L5yPH6oxW79JiyfKtgL/9W0+PlTll7mD7
         FEWvShaT01KfSNTH82BKzlfmPDkjlD9y608L1SL4AT+/4GWNBP99u1+ZJ1fhTKzKM0zG
         nafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UKRX4+7q9McxwT3a8IQp5a5oCsCcryJWs0xxC1NbKCw=;
        b=NNhkOhQRakLYocuuTycUrheA75T1FVRo2WktbfKueDbVs5Y5kaAoI7iI1o7Ez/XLSx
         8QBDyUiEt4g7Bm1WMPnDRfOOROtDx6HXOL/OLKDQY5C/6njPZ7mGsTla1V7IFSK/FZvI
         uZGaqv7jh9TsCkWZ6vbLFbi5mCOXXAmh7JB/uBHm+uHILIolz4E54uT8vTQ9+RPartwR
         yrt0iNhkXqDnWGdyFAotR/uH5M8sCaZukkj/ZJOsZ/z/wyKjgCf855NAVdqUHv/YGvEO
         souTYyVzPkQkTv3cdPuPIb+xDezOadsKy/9rw8LIuxpt2GGnJtodF8U2QX8/14YoNSsc
         FJMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iXsIocLD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e21si2699596jaq.58.2021.03.05.06.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Mar 2021 06:57:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iXsIocLD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lIBt3-00081v-9w
	for alex.bennee@linaro.org; Fri, 05 Mar 2021 09:57:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lIBsv-00081f-7g
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 09:56:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lIBst-0002XV-AQ
 for qemu-arm@nongnu.org; Fri, 05 Mar 2021 09:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614956213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UKRX4+7q9McxwT3a8IQp5a5oCsCcryJWs0xxC1NbKCw=;
 b=iXsIocLDbvhRzzoc2Ri6x5re+vin94HoK/GiwVDCSW89g2vpWBeYtiKBsxXMBszK53Oydj
 SrKUqc2LRRBibHQa+hsOKlZ5mUXxmeN9XvOCnJZOUvu6CHcMULDwnLHhHpw3mMzPh/jeFc
 C2rxI7HSifLI9PKhLrd0nimLkua725c=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-KQjsPK2ZNQ2LeZGM73_xXw-1; Fri, 05 Mar 2021 09:56:50 -0500
X-MC-Unique: KQjsPK2ZNQ2LeZGM73_xXw-1
Received: by mail-vk1-f200.google.com with SMTP id s17so679206vke.11
 for <qemu-arm@nongnu.org>; Fri, 05 Mar 2021 06:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UKRX4+7q9McxwT3a8IQp5a5oCsCcryJWs0xxC1NbKCw=;
 b=iIQvjRvQNQD1ifACOvvBENkIA1DOO1n8QH6BA035r+c0PIIyjqvFez0ZLj9PhXGaIo
 YcfEy7HAnFvE3453j/D/eU7Ws56mHKvdfzC6HJjNtIaP24UgxE/ybeJhYBNC6Hsgirq5
 5YoI05CWPfjlsWvtJUlYBcHxkvzQK80w0+7nRuSfAORfZkxaFhcbmPNYvZQ71T0pYBjQ
 daM8h91pKq1tGFIu7S961z+J6o4t8d/CDjxecuVhJxNtlAU/aJvZAnzV16anmOioinyg
 Uu0XZJj+270hsI+QgJhxH8Gg/UAuw+TyihBq0q8Q07mAmyuPCBAS+C6ZmgFxHIksaKC8
 tMEQ==
X-Gm-Message-State: AOAM533/vSOtT580KkQm4MQ6rArnho/xR6Li8sr7O3++rAFIkuQERewp
 sXmlnamcnXWJlGemKE8LcYrhuXHY6oARXiVtjEqpJn8fKDzliWglPXPDlLWAUZwNnEPpL5vW2m0
 JmPDZD/yaJE3BZiq0elIeFPv6mEEW
X-Received: by 2002:ab0:660d:: with SMTP id r13mr5690970uam.5.1614956210329;
 Fri, 05 Mar 2021 06:56:50 -0800 (PST)
X-Received: by 2002:ab0:660d:: with SMTP id r13mr5690946uam.5.1614956210153;
 Fri, 05 Mar 2021 06:56:50 -0800 (PST)
MIME-Version: 1.0
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-4-nieklinnenbank@gmail.com>
In-Reply-To: <20210304203540.41614-4-nieklinnenbank@gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 5 Mar 2021 11:56:24 -0300
Message-ID: <CAKJDGDYmXH0xpOW534AMWhG_i0bqym=t4YyDpjQ3SoJRN_mAvw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] tests/acceptance/boot_linux_console: change URL
 for test_arm_orangepi_bionic_20_08
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 b.galvani@gmail.com, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VzPX1A8F2/6T

On Thu, Mar 4, 2021 at 5:42 PM Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> Update the download URL of the Armbian 20.08 Bionic image for
> test_arm_orangepi_bionic_20_08 of the orangepi-pc machine.
>
> The archive.armbian.com URL contains more images and should keep stable
> for a longer period of time than dl.armbian.com.
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  tests/acceptance/boot_linux_console.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

