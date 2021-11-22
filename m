Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp6837703lfk;
        Mon, 22 Nov 2021 04:05:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIGVxn0q78Z1X01ZMqchNvS5uiiWlQHqn3DMjd81FzqdR+OV4TPSEKkgvWbiHmVlin6goZ
X-Received: by 2002:a05:620a:f92:: with SMTP id b18mr37424978qkn.436.1637582704860;
        Mon, 22 Nov 2021 04:05:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637582704; cv=none;
        d=google.com; s=arc-20160816;
        b=hoLr8AiBaL8vvoBZPBtA20j2fQ7iVx+9cyF4iew9eaGqJYrhtJhDVD9cctulYfH4MZ
         bulwgk1lfzhUTHNhI8DhI4gxAX6VS79iOusz9hG4eP6175VGzN6Rt4z9wAxg8mN9SNLW
         iQh1TrgAjIGeZ87cbow0IZfPeiUgeLshKLeKQUm/ZGlB9nl/EPGVrMldX1dlGLDURqCe
         BCTJzz/vvvH+zXnxJZyMh9yHR282178UkwQqi534i6Stz7AcVOCfYejhQFjrlZjKaVCP
         Or+BE9er4fUKwV8LVEi6mvN91PSSimjo0RAQpWppv+MLJg3XSY6k6LKS953RX7f2Mx/Q
         Iv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=39yIz6lLPMrpmAQPLdmfeQDERMqPTewiDQw8O3Cj+kU=;
        b=mzpkMQsXiSmWTXXoNIaWwwsCuJpP0rq2yuZoPLrr+Bat5bRxFwmKp/rlHlJGjqch5r
         b0b98fIj9QTB7IGd4LwTTnkMqOkDYtlK/f0ZuUtfu+H1aVZ9XGyUVpHhebdzKPz3n7gK
         qu68hnppmOjBulwZUM3p8M8l2rQXtp5StLyDT5ROfrygcwA9XJ8pGWzOaahEcOmyDXwq
         WijRL5IXS7Ad/Fas1WQ54fT7mYneewYIJb8h788rusK+eOBwJf6aUfTyPLkzKERCofR0
         OYxZU6rRqeXJ0eLijClssuDX/PLY56+ZXdzum3Zen8icnDV4w5zpT/vdd//aSBXefQIy
         tQug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=clvUL+qV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si15713068qve.101.2021.11.22.04.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Nov 2021 04:05:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=clvUL+qV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mp84G-0007HI-22
	for alex.bennee@linaro.org; Mon, 22 Nov 2021 07:05:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mp840-0007H2-Rn
 for qemu-arm@nongnu.org; Mon, 22 Nov 2021 07:04:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mp83y-0002p8-Lt
 for qemu-arm@nongnu.org; Mon, 22 Nov 2021 07:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637582685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39yIz6lLPMrpmAQPLdmfeQDERMqPTewiDQw8O3Cj+kU=;
 b=clvUL+qVMVu8Lb9o/iySdITlj4m30cCWvPzqakFhT16xbgDAcYWiVC1AcPQFYvKCX79Wup
 d9yxO1iZkY4IVamdzBVh5nrsQZkbz932aYXhqvgtKeZdsXGS6Ieeg6LBF8bWslAc4J9mpd
 NvP9l+llh8/nYnnyjkduOsCE69VgPPk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-d_DGtyr8O3qXj7ayTuRHsg-1; Mon, 22 Nov 2021 07:04:44 -0500
X-MC-Unique: d_DGtyr8O3qXj7ayTuRHsg-1
Received: by mail-wm1-f70.google.com with SMTP id
 138-20020a1c0090000000b00338bb803204so5959492wma.1
 for <qemu-arm@nongnu.org>; Mon, 22 Nov 2021 04:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=39yIz6lLPMrpmAQPLdmfeQDERMqPTewiDQw8O3Cj+kU=;
 b=Lo1tK7PnmbBNgK8x5E25+FlEL3SY3DO3QEY+4mI0omcTig/J/Ot70mW4OQUv+K8KNa
 mliC8Ah3XQqCdJAkqN2jadexjTVKTVc16S3p9pM7DWUPKx0tv9G2mIUPhAYb56w3FlgD
 whmGlYweg6pNjIB000sf7+RY+UJR4Yddl93xhuV8TDcnHEvJbCloTSh7+XSFMGbHtINH
 Jfsxafv5ZChpcpJg+BReWqXLL5oGqao1bDAuZAiPxlWFwQ1u/SYvRQn2+WMPnuv0RwF7
 KU659CbUvh/QbPMLlw+u671Lw8kbNSxt+3TWr/b5cpTu4lyH+Xse1QDDrCWIvpwnwpg/
 P+YA==
X-Gm-Message-State: AOAM533jyw3sFOlGze7vaAGzgPf0S9KJj7p7Nr6JrJKCY4ql2T0uKnBV
 nvssNuYTilpg6YfbW7A/uAxR4/KzZdJ3N5iJ9cREdq+Z8giEdX7fFhDjPyRkC+6Hr0hALbonlz0
 NahPPefY7jRbw
X-Received: by 2002:a05:600c:3505:: with SMTP id
 h5mr28452643wmq.22.1637582683378; 
 Mon, 22 Nov 2021 04:04:43 -0800 (PST)
X-Received: by 2002:a05:600c:3505:: with SMTP id
 h5mr28452624wmq.22.1637582683206; 
 Mon, 22 Nov 2021 04:04:43 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o10sm10696010wri.15.2021.11.22.04.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 04:04:42 -0800 (PST)
Message-ID: <d57c594d-41a4-6617-9890-a6e19955550f@redhat.com>
Date: Mon, 22 Nov 2021 13:04:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2? 0/2] hw/intc/arm_gicv3: Introduce
 CONFIG_ARM_GIC_TCG Kconfig selector
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211115223619.2599282-1-philmd@redhat.com>
 <CAFEAcA8TvHb3XG6Kw83=Bb69YZ+GF0p4r6uG+UdwM3UbLmQ31A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CAFEAcA8TvHb3XG6Kw83=Bb69YZ+GF0p4r6uG+UdwM3UbLmQ31A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Shashi Mallela <shashi.mallela@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZacsG8tj45tG

On 11/22/21 11:59, Peter Maydell wrote:
> On Mon, 15 Nov 2021 at 22:36, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> The GICv3 ITS support has been introduced uring the 6.2 development
>> window (commits 18f6290a6a9..17fb5e36aab). This device is for
>> emulation. When building virtualization-only binary, it might be
>> desirable to not include this device.
>>
>> Introduce the CONFIG_ARM_GIC_TCG Kconfig selector to allow downstream
>> distributions to deselect this device.
>>
>> Based-on: pull-target-arm-20211115-1
>>
>> Philippe Mathieu-Daudé (2):
>>   hw/intc/arm_gicv3: Extract gicv3_set_gicv3state from arm_gicv3_cpuif.c
>>   hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> This looks OK to me, but I'm inclined to leave it for 7.0 at this
> point in the release cycle, unless it would be awkward for
> downstreams if we didn't put it in ?

Mirek was Cc'ed and didn't comment so let's delay it to 7.0.

