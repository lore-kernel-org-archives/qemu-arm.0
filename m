Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3290839ejb;
        Tue, 21 Feb 2023 06:15:23 -0800 (PST)
X-Google-Smtp-Source: AK7set+ym8VXD3GpRnAC0QFRd6WnRIB8jH0rgObdO42rqG9bHFjwDmiuSUA9M+ONiHvYOCF8YhNf
X-Received: by 2002:a05:6214:d83:b0:56e:aa8b:9100 with SMTP id e3-20020a0562140d8300b0056eaa8b9100mr5988274qve.20.1676988922979;
        Tue, 21 Feb 2023 06:15:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676988922; cv=none;
        d=google.com; s=arc-20160816;
        b=O0XFA8CX40dErT/vUH/VU5ZBr7FxRKz0ILFT/O/noCgEzYqKA9r+ru8aVWZ2/UsfSH
         hFfrDTEt0k2vtLXZgrqwq5bO7khihFTL/pVmEoQ1pkNCEvKeXgAiFHxrIKo5V5s3Aa+C
         twE5rq90LUKl42OaXXmR2ce0ljlXVZs6Kd3r3m+H3VgNkSkgKy6Hn+7d0yEvyX9QPg6Y
         DNK3vEDfr7NHjMSYc26wELBz0QLh9PXvCixtKh5Z5XQwMJ5Or9hW4ApxBg1R5AyDcNxA
         Ie6+nOa+Xc1HH3gMRhgQCrKn/RXsNKiYCy8GTH1LJL0PbM6Cw+Zf92HQcyXg0AWgsel2
         gDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oyItqO9dPERKAice0ZAF14XRg7dJq3RYadE46Gmgc4g=;
        b=RNFc/snPwmDcUBbKPH5cnC9IzGOLYCnBhj19aPZgscc9Ph3ExIEMwb0CeE8AHkW+JM
         04Ofj4IF9OLI/p27LZVlv+/GP0cig5u4JpffmO41ANzTY1Wc0ZgUpSEvkAuOE08vI8Po
         57wRhLkZfHXGx+t+0P6BI+aJq7HnnGdtEuLC68tLSs/y8Zvuit7+7zl3tIfGnuWAVE0Y
         L3Q5Hb52YrWVrbItY0hODFNJveA96RGq8awbRsVZp0/CQW+dw3Wm1t/l3gkX075VH5vR
         GtT9O171p6nuAueSL8XiG10Z8IIbrEp3r3uP8qaZTR3l+Cfk3D1R9mus20Gkjp61C1+c
         VvEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ac6B0b5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16-20020a0ce310000000b0056e9ecb0e6fsi6239418qvl.108.2023.02.21.06.15.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 06:15:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ac6B0b5d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUTQ0-0005ku-1h; Tue, 21 Feb 2023 09:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUTPv-0005js-El
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 09:14:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUTPt-0007OH-1C
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 09:14:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676988888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oyItqO9dPERKAice0ZAF14XRg7dJq3RYadE46Gmgc4g=;
 b=ac6B0b5d/unQhujgMxEWQ7ocZMXoV7zkB72daCbxU95H+hXtVQAHVgygXxMsabFeVCKoje
 4xRjyYUOoUL36SVxFBdaKWf5cmiiEHjfOLd/W2oUZoFbkude9fM1TDUWmYq5wEZagkyKYw
 Cdx8qGrjx5PLO0qoMBV60uFWlzZ6nw0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-547-EcOGLxBJONW-ieMu2PiVfg-1; Tue, 21 Feb 2023 09:14:46 -0500
X-MC-Unique: EcOGLxBJONW-ieMu2PiVfg-1
Received: by mail-ed1-f70.google.com with SMTP id
 cy28-20020a0564021c9c00b004acc6cf6322so6343262edb.18
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 06:14:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oyItqO9dPERKAice0ZAF14XRg7dJq3RYadE46Gmgc4g=;
 b=g52PsPVhxpn7n4MHuqtgA0WMtsM1mGp5jKug00wkN9c1knlVi1ot3YTSEHlFIB0Y9o
 9hqnHTxfaT8wKsWxzAA4MhmJBIBVHWZY0qX2GBP4O8aTLHnIBsgnL2+gxntxwjoZovVw
 z9WInczNXnfGKRE5J8DtKXM0uoGyL5JtjPgesV7IgAlDuu6dg2pKYqZRb8v+m7MdsQxR
 8KdDgWtL1Nv7YopUfk2L0Ob8FP7g3xSuzW+vNd0pAr9DlQTQ4SP6INJ4P+rtYKZsSq3W
 XUtrP3oKPYxdTgb3kKdmpWmNfe9aXFT9kznbxBi8KyGoo5nqaic/pkSr+rlV4gbyZ0RD
 d0Pw==
X-Gm-Message-State: AO0yUKUj19Xj9org6TNLl7/MN9DX6z8eUNIPKGkO0m57w43FV9mRiCVT
 hWiRIsHbpNC2jpCUxfcV87obJKB4Ez+vO7N8LjMERyAGj2UXKoTkwM7dEdaMmUS3CbIn+2YkpcG
 anpV5PG+Kk0J0
X-Received: by 2002:a17:906:5e42:b0:878:4e5a:18b8 with SMTP id
 b2-20020a1709065e4200b008784e5a18b8mr11868182eju.66.1676988885067; 
 Tue, 21 Feb 2023 06:14:45 -0800 (PST)
X-Received: by 2002:a17:906:5e42:b0:878:4e5a:18b8 with SMTP id
 b2-20020a1709065e4200b008784e5a18b8mr11868151eju.66.1676988884775; 
 Tue, 21 Feb 2023 06:14:44 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 ce25-20020a170906b25900b008b05b21e8aesm7294175ejb.172.2023.02.21.06.14.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 06:14:44 -0800 (PST)
Message-ID: <4975b132-691f-e2ff-ce39-4188b9de5f55@redhat.com>
Date: Tue, 21 Feb 2023 15:14:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 10/16] RFC: build-sys: add slirp.wrap
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
 <20230221124802.4103554-11-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230221124802.4103554-11-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mgMWa4fbdcpM

On 2/21/23 13:47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This allows to build with --enable-slirp / -D slirp=enabled, even when
> libslirp is not installed on the system. Meson will pull it from git in
> that case.
> 
> RFC because this is very convenient, for a developper targetting
> different environments, but might not be considered appropriate, as it
> is "a kind of" git submodule (without git submodule integration issues
> though, afaik, experience should tell).
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

I have no objections to using wraps for slirp and especially libfdt 
(though the latter is not yet part of wrapdb).

However, right now meson will do network access without respecting 
--with-git-submodule= or something like that, i.e. with no way to avoid 
the fallback.

As a start, configure could hardcode --wrap-mode=nodownload, so that 
wraps would be used only after a conscious decision of the user to use 
"meson subprojects download".

Paolo

> ---
>   .gitignore             | 2 ++
>   subprojects/slirp.wrap | 6 ++++++
>   2 files changed, 8 insertions(+)
>   create mode 100644 subprojects/slirp.wrap
> 
> diff --git a/.gitignore b/.gitignore
> index 61fa39967b..1ea59f4819 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -20,3 +20,5 @@ GTAGS
>   *.swp
>   *.patch
>   *.gcov
> +
> +/subprojects/slirp
> diff --git a/subprojects/slirp.wrap b/subprojects/slirp.wrap
> new file mode 100644
> index 0000000000..87cdd8dcd8
> --- /dev/null
> +++ b/subprojects/slirp.wrap
> @@ -0,0 +1,6 @@
> +[wrap-git]
> +url = https://gitlab.freedesktop.org/slirp/libslirp
> +revision = 15c52d69
> +
> +[provide]
> +slirp = libslirp_dep

