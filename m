Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4400343lfa;
        Tue, 8 Jun 2021 06:04:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ4C9Q0V3+ZDhPqXd29rPkkC69bfrsrCoJQjU6wAIiZkM17U1bGEPRDwf2T02S3TPKZ9Es
X-Received: by 2002:aa7:d602:: with SMTP id c2mr25629467edr.317.1623157433962;
        Tue, 08 Jun 2021 06:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623157433; cv=none;
        d=google.com; s=arc-20160816;
        b=idSlDkly5sQK1bKojvCNNyV5vkTKhgmtYCImEPH55hdwMYciS3k2oHL16zFGb4L5QL
         prKJVZosTkfi32KNmVqJCrxX/sFGnVYxgSZM377xQEeAGeX5pJrpwtSiOgIZ2z1JJHFA
         OyfURKWwc0mDyj2iTYSddfyLi2x6pdnusHrBdKvzKsnqK1YrYRTzw3AkGfLRdAg2QhYB
         nV5w1VA/Gzl+awdwXlqXTMtZaZiM3hhkKXLhhlcOgachKTc5VW4qqL465XjWEedY7Gfe
         0cFNwu9F28//Q1yqAsu93oPu6uoj+bvuSWBjLLA9cR15Eb+GuDNeucfFycwj9l/Z/pC4
         1sgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=1P3E+1SFe+knHstUP96mLqp7mIZlytc/2mavrUy9NyE=;
        b=VPRXeBvQwbLZlFO8d/9jL4QAqRc7oomwl2rgxycsOpfmO9qGy03z84lvAHe3adGc6J
         C/n8mzFyX3Q/C4lI860gyN6q5RmHYrqljQx+JonhnUYdIlOPY8pBPS57/WFP0QIBeMJ4
         4RcdSH31SQXCGsvUqJs6zcOd8T2r/Ptfw/xwuesSdV66o0hh/gdHfObEa9OPGmok2Xqm
         tWDdmNGIZ4VbSEn1klJHZU3X5We6urBYe/q8q6rcFBe9k3Yyroai3I4ZFljnFx+Gp1WT
         od7xabsss2gEsm9CFuMME8BcohZI/tquo7qk0RwwNDYDAQVGBjZ86vKJNzk0I4Jfn2cg
         BJug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ianVQaHR;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id f2si9324846edu.428.2021.06.08.06.03.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 06:03:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ianVQaHR;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623157432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1P3E+1SFe+knHstUP96mLqp7mIZlytc/2mavrUy9NyE=;
	b=ianVQaHRzZwTN8v1hTQPSClCOh1KFyisFMQ2zwSAD5sbwzWFloH8tge7WXbJ9QjNZCYIYl
	FsVpOePLxmGfQhBDwBI/EYlFkSyQARnt6UwVodRtOlRq1HES7086B1ZAmO3NOELBkLt1/M
	KfmbHutWlprZTgKQsdS5bCPw67aUtrA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-0feNaXxfNiOYeQTuvPrmEQ-1; Tue, 08 Jun 2021 09:03:50 -0400
X-MC-Unique: 0feNaXxfNiOYeQTuvPrmEQ-1
Received: by mail-wm1-f70.google.com with SMTP id a19-20020a1c98130000b02901960b3b5621so397817wme.8
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 06:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1P3E+1SFe+knHstUP96mLqp7mIZlytc/2mavrUy9NyE=;
        b=hX393KK38MvaWOdiub7OCVgLM/tTaJJl7MDgbrdAbzNToQFeUmkNJXqQu5/buWW7dJ
         jPHQe4XYmPfVi7MjKzM+RZYgU0p/7ZiEGUZHnAojmbmaF26IlMGxdIBXObIIpikUH4mE
         YQSFYdeDXizQD3v+08tGdhhERt2GIHAsxJo6Lho5yZOoXCXc1wFsK8Bp84v6+BBnnU41
         1B1xgJHUw6vszqBtfOYPJotUmWzuSwOW3SSRLmS/bnQzhiv4pl1s7++6vCm6oNzfpWG3
         HYWAjfyl2grS+Z+sqGz1MAHg+VwighpT1/uJan+EukZGa6nz0HBM3ARzvuEgsNWy052r
         GSHQ==
X-Gm-Message-State: AOAM530QDg1Ee4v/TexmoqWpwXhmk3Zqa233swhNMpSnnREKMcUD7Mlz
	hwRJWLbkmESYB4yFuY4HH5oy7/6ol9d3XiWokIBd8oV3hALQqtse1iqEdQTlh1K37/mbKbSNGIr
	FLY0In5ajdlW9IBcg
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr22668227wrr.71.1623157429663;
        Tue, 08 Jun 2021 06:03:49 -0700 (PDT)
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr22668212wrr.71.1623157429529;
        Tue, 08 Jun 2021 06:03:49 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id k5sm21397738wrv.85.2021.06.08.06.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 06:03:48 -0700 (PDT)
Subject: Re: [PATCH v16 98/99] configure: allow the overriding of
 default-config in the build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-99-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9ca40566-0390-e807-0cd5-2f21c897c35e@redhat.com>
Date: Tue, 8 Jun 2021 15:03:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-99-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: fJoN5DUYJu6l

On 6/4/21 5:53 PM, Alex Bennée wrote:
> While the default config works well enough it does end up enabling a
> lot of stuff. For more minimal builds we can pass a slimmed down list
> of devices and let Kconfig work out what we want. For example:
> 
>   ../../configure --without-default-features \
>     --target-list=arm-softmmu,aarch64-softmmu \
>     --with-devices-aarch64=(pwd)/../../configs/aarch64-softmmu/64bit-only.mak
> 
> will override the aarch64-softmmu default devices to one of our own
> choosing. Currently there are two configs provided:
> 
>   - 64bit-only, to build without any 32 bit boards at all
>   - virt, even more minimal set for --disable-tcg builds
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Message-Id: <20210528163116.31902-1-alex.bennee@linaro.org>
> 
> ---
> v2
>   - remove extraneous cc
>   - dropped pathname from config
>   - add virt.mak config
>   - drop ZYNQMP from the 64bit only build
>   - test -f the --with-devices-FOO file
> ---
>  configure                              | 20 ++++++++++++++++++++
>  configs/aarch64-softmmu/64bit-only.mak | 10 ++++++++++
>  configs/aarch64-softmmu/virt-only.mak  |  8 ++++++++
>  meson.build                            |  3 ++-
>  4 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 configs/aarch64-softmmu/64bit-only.mak
>  create mode 100644 configs/aarch64-softmmu/virt-only.mak

Shouldn't we also move default-configs/devices/X.mak to
configs/X/default.mak and adapt ./configure (instead of having
configurations spreads in multiple directories)?
