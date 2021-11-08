Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp460221lfk;
        Mon, 8 Nov 2021 07:49:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgECVPIQovcJfKKB9bwzPakqL4zdBlZBK/WFfm+SZZFh6cbfoWOSfN3xKf0zc7oUgBrBTq
X-Received: by 2002:a05:6102:5489:: with SMTP id bk9mr1103758vsb.37.1636386567954;
        Mon, 08 Nov 2021 07:49:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636386567; cv=none;
        d=google.com; s=arc-20160816;
        b=M3PRY5PYKtO7fX6ENnfbVA+5+Xc0LtgRVOKwqIyqJMiFKJOjkQG12YCfwZPojYDUQ1
         2vlktJhRe5wTQ8Ort7FKRE8wfGErHBJNj1QANcgJoLLfAtJMIluH7TYthTrl1xkd75h3
         1uHH3xEueO7ljSHbsK/256ZL0qysNE7eIxGUhPsr7S/oPus6onK7UpbeSVI5sDhkb64e
         TQyIbRm0KdaFFuy4qVF3rRxxmIUjE0RDkYACjd2xND+LcvTL1eY7IFZ3jiUM2cGwno+5
         wUW2z0pCK1143Y5ImfbfeUMcxgYl9kIFMNTjQhhWmqM9tz0+d5lmOs4+H3G/Eh6oCNHU
         z7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ZFw9hfJGVsXaNAfDozeYJqDrfqyORV7Zibw8+byrL/Y=;
        b=sEXv1VxIeQFt+E9SMRmV1P3bQAnIw/gdJiDZUP2c13WObqvUlSX0dh2BxsJxIojW2Z
         K2/10Khv64Q4OqguLlO5DgQK+Wb9qCJDHc40KzMh+kVY8YqJ0beNNDhA84kEf+8Ix+se
         KXChbS4bIWzrDlq2eadP3JD1QC/JL8ZCGC6TLJegMKCTMpU7sU1PY/U/8fuyKlY37Wgd
         WCTKvDW/nB1d9+f45ZU6rqSTx/wHrxgA2GVxUkPe80/+SGANEUHxVvYdWc//+cktrwDm
         JBXPAMMMelhb9HdjQOBz+CRELFxR10MrR1/bUltFO7mLrcOs4QbeoxxTd+lVsk36GPtI
         gGOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RdqOIHAp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u40si27548609uau.196.2021.11.08.07.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Nov 2021 07:49:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RdqOIHAp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mk6tj-0008S1-Ch
	for alex.bennee@linaro.org; Mon, 08 Nov 2021 10:49:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk6tX-0008Pg-Nv
 for qemu-arm@nongnu.org; Mon, 08 Nov 2021 10:49:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk6tT-0008Ht-Dt
 for qemu-arm@nongnu.org; Mon, 08 Nov 2021 10:49:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636386546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZFw9hfJGVsXaNAfDozeYJqDrfqyORV7Zibw8+byrL/Y=;
 b=RdqOIHApAy/bvcUURkH6XlhnEsB7B780kpo5QrEyIxjxvPZL/Dl/N+ZYbGBF7IMpiq8xMv
 1c4mdRbvlPrW779j/DsZrevVZHW5sLvXfYgohLyViGQ3Ip0g9+wO3uslXbdcp5fRACjmL3
 kH0SjurQWYhm/1VcGppMb8KANpBnYm8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-f30e-yjXPayfXNcbptmJvA-1; Mon, 08 Nov 2021 10:49:04 -0500
X-MC-Unique: f30e-yjXPayfXNcbptmJvA-1
Received: by mail-wr1-f71.google.com with SMTP id
 p3-20020a056000018300b00186b195d4ddso4158471wrx.15
 for <qemu-arm@nongnu.org>; Mon, 08 Nov 2021 07:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZFw9hfJGVsXaNAfDozeYJqDrfqyORV7Zibw8+byrL/Y=;
 b=0BLh9e+cEuatjEHMWpyDxEXG4/sB4kamgGYg23Touq5SPPCfe1YnwnqYYOuy84jjPf
 RKyE2S/4E7qR/TbAkzyYzXy57xfOI+ttM5vnMtkSbenjCFX+Lc97W+7ZyfZHRuxngYMC
 iM6GABmXi9WLmA/jUTUKlrgSjmEbUYkNiVLUpPNr+dQFNSg+WRb+OaKHNbSc7HmGAdQi
 d9WLj8LREcZDiCpNOFYIZcRhCz4l6dDUe8VPdPosIHlfFosyJkEKgkCc8Rdi8yFsMxRr
 PHvGIVSYmUZ78tKx3tUC2kUNGv3+8wURGnwFE6g3g78BFmb3tUK9BMMZVSYzithU/a6b
 sgyQ==
X-Gm-Message-State: AOAM531xrtVTvpfte3tFLrMHxH2vTr7QwOoOSKQbm0qNZyrAoOmPnRFD
 a3wmr1k8URVoSVtePFMlOx3WNM6eRqltXMl8120g7krcYySGZ7FNUSbqyqdKGUbMnS66cF+qmqM
 pbjSjMQ3FSVFZ
X-Received: by 2002:adf:f44e:: with SMTP id f14mr140933wrp.37.1636386543347;
 Mon, 08 Nov 2021 07:49:03 -0800 (PST)
X-Received: by 2002:adf:f44e:: with SMTP id f14mr140922wrp.37.1636386543236;
 Mon, 08 Nov 2021 07:49:03 -0800 (PST)
Received: from [10.201.33.14] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id o2sm18034753wrg.1.2021.11.08.07.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 07:49:02 -0800 (PST)
Message-ID: <05370fb1-e391-1e03-fd3e-a69996df52fe@redhat.com>
Date: Mon, 8 Nov 2021 16:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] tests/avocado: Remove p7zip binary availability check
To: qemu-devel@nongnu.org
References: <20211106091059.465109-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211106091059.465109-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cWDDQBYxIMzo

On 11/6/21 10:10, Philippe Mathieu-Daudé wrote:
> The single use of the 7z binary has been removed in commit a30e114f3
> ("tests/acceptance: remove Armbian 19.11.3 test for orangepi-pc"),
> we don't need to check for this binary availability anymore.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Based-on: <20211105155354.154864-1-willianr@redhat.com>
> ---
>  tests/avocado/boot_linux_console.py | 7 -------
>  1 file changed, 7 deletions(-)

Patch queued to avocado-next.

