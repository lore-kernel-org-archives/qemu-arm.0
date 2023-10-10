Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp11304ejr;
        Tue, 10 Oct 2023 02:59:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu8oyJItR6iJIx8GtiExLjW8JVgghh36d4UJM275Ewpo7jF/iGqvtN9Y+j3XJB8crZp9th
X-Received: by 2002:ac8:5981:0:b0:409:de05:4593 with SMTP id e1-20020ac85981000000b00409de054593mr22701687qte.62.1696931944050;
        Tue, 10 Oct 2023 02:59:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696931944; cv=none;
        d=google.com; s=arc-20160816;
        b=Ii3WXOC/xF6nS1iHK2N29vivytF94hR5iNOI1sdxXE9IliAbWRS5a8g9ts8gRi8vVL
         pLFdhhHyaBiJaR4swLomQtSKwGhprxjW7UsdEZ2SoemUToIcIHhMJXvhbhKr2Ejxl3B1
         Tb/XS5DPiVvyWeLvgsKiY9byvtpDIeGDw8Nb0lNPeykgaehjA/Zj+WlrnBWI0jZtyNWX
         +y+sxLbsFkoTk5AzunoS9LtBPD7Ib8rGgDjaIQJyfed1VX9x+6oz0Jt5HFVsgzxeIAPx
         Y3VHv3wBRf/47SqxwZEVNj/gPqjVLYm1BXUE1TGzJOqZEkqVU7slrfqLfIBCC58r49sr
         B6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cFDoNYvu4AGyjhzaDodqA+59Tdxx5F8lL1P2nMkx30I=;
        fh=nMkDEmoHCshhMbmj1+dWFVTvOFH7uSoFcig+K2lO/yg=;
        b=lGz06Xf/8wfAoGTMdDOtjjFa1x/cyNkekd/dANKIYo/6hLZJdWVb12E+hmmjlC4FTN
         dfvuM12qnz25eLQS1TdVGAajpc4E0CIoTSlu0WkOKPbw83RBxsWwxKlQqA7eUjQqYrn4
         91UxHOIKUAsel1BOVW84CvvnoPwjVSYxnpqyP2tR/cH+qrh/y/S2DtmOxIizHRFHKEiP
         wBKX7u23nap6zeNbwC3gK7+B+bxvZLpqNP4vqmfqpcVq4R/rsIGJsvOB4JLknWUTUDxe
         3RemTyGo7A4lM3Rv0ThWqZh6p2aTRey6Y3AzpyrTjK7vY56x6CnM0U+BtAkeSs3Jmtd5
         2s+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Gf/Wc0wE";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id t9-20020a05622a01c900b0040a547f5370si7480879qtw.364.2023.10.10.02.59.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:59:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Gf/Wc0wE";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696931943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cFDoNYvu4AGyjhzaDodqA+59Tdxx5F8lL1P2nMkx30I=;
	b=Gf/Wc0wEWaoiOi0B7SufsZkMKEYAA7G/gD9VBLG+vtOrQUT/rs+5LpxeJihDQpO5EX08Vp
	yS+MfgOXgyGx74TYEfTq2EatRlfP3hsdexg9HiaFcFMpIiKOu+j013B646Hw4Wtt9G/eFP
	a8LhpCH0lnQpTx5fwqyXYmh1gR8EfRY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-AxIEpKZnMOKgsS7cel4_XQ-1; Tue, 10 Oct 2023 05:58:52 -0400
X-MC-Unique: AxIEpKZnMOKgsS7cel4_XQ-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41b1f81f3f1so24461571cf.1
        for <alex.bennee@linaro.org>; Tue, 10 Oct 2023 02:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696931932; x=1697536732;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFDoNYvu4AGyjhzaDodqA+59Tdxx5F8lL1P2nMkx30I=;
        b=tMc8X68NTfc182bK5cdlFxd+KQc/QDvnsMeg5CoUo3oY1ScD985SoUmU6J15hE45u2
         RbFM5OvhaofrPbtmJFArhUy11crSFONoxP+7GRM5OTasrJzxyP8CCymRzbsCcdfkQu5H
         lf2q1EG7Q4u6U0F/nOtpEb336Nsvs/EoB4BGz/CWUO/01IxW7uliNaRJd9AUzCnp97zl
         tbnEkKSzALPomHwqrWAN40ISqSTjMYSXF8oeOf8vRxKFQb8nANJ+u92OuFmzB3YMtoqf
         B5+8vdCXgBxs1hDi8z09ryGwjRBQk0QSBjeGsirql23WJNZqTdwQar4NEmK6ct7Hb01d
         ZjiA==
X-Gm-Message-State: AOJu0YxZEBzvgxvkmlDLkWgHd0PPe55VSVT7t6ChChN/DyNgFXeq/ei0
	ZKxKwIbBkKeddCYhx8KYqH+G5SauGhclPrmKezEQMWAVA9GD4jZgm2xkuJBaWpx8dEbWaoenbpb
	5s+hR1RKLdocQOJNS
X-Received: by 2002:a05:622a:144d:b0:40d:6219:d813 with SMTP id v13-20020a05622a144d00b0040d6219d813mr22774626qtx.68.1696931932108;
        Tue, 10 Oct 2023 02:58:52 -0700 (PDT)
X-Received: by 2002:a05:622a:144d:b0:40d:6219:d813 with SMTP id v13-20020a05622a144d00b0040d6219d813mr22774595qtx.68.1696931931846;
        Tue, 10 Oct 2023 02:58:51 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-176-176.web.vodafone.de. [109.43.176.176])
        by smtp.gmail.com with ESMTPSA id bb36-20020a05622a1b2400b00403ad6ec2e8sm4352278qtb.26.2023.10.10.02.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 02:58:51 -0700 (PDT)
Message-ID: <a3ff5135-2fd1-b3dd-f576-129ef08b47be@redhat.com>
Date: Tue, 10 Oct 2023 11:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/4] tests/qtest: Use qtest_get_base_arch()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Nicholas Piggin
 <npiggin@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Jeuk Kim
 <jeuk20.kim@samsung.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>
References: <20231010074952.79165-1-philmd@linaro.org>
 <20231010074952.79165-5-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20231010074952.79165-5-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7ZUPe9RzUiix

On 10/10/2023 09.49, Philippe Mathieu-Daudé wrote:
> Additionally use qtest_get_arch_bits() when relevant.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/ahci-test.c           |  5 ++---
>   tests/qtest/am53c974-test.c       |  4 +---
>   tests/qtest/bios-tables-test.c    |  6 +++---
>   tests/qtest/boot-sector.c         |  6 +++---
>   tests/qtest/device-plug-test.c    |  6 ++----
>   tests/qtest/drive_del-test.c      | 16 ++++++----------
>   tests/qtest/erst-test.c           |  4 +---
>   tests/qtest/fuzz-e1000e-test.c    |  4 +---
>   tests/qtest/ivshmem-test.c        |  6 +++---
>   tests/qtest/libqos/qos_external.c |  6 ++++--
>   tests/qtest/lpc-ich9-test.c       |  4 +---
>   tests/qtest/m48t59-test.c         |  6 ++----
>   tests/qtest/pxe-test.c            |  6 +++---
>   tests/qtest/qos-test.c            |  6 ++++--
>   tests/qtest/readconfig-test.c     |  6 +-----
>   tests/qtest/rtas-test.c           |  4 +---
>   tests/qtest/ufs-test.c            |  4 +---
>   tests/qtest/usb-hcd-uhci-test.c   |  6 +++---
>   tests/qtest/virtio-net-test.c     |  3 +--
>   tests/qtest/virtio-rng-test.c     |  4 +---
>   20 files changed, 44 insertions(+), 68 deletions(-)
> 
> diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
> index eea8b5f77b..93d1e14896 100644
> --- a/tests/qtest/ahci-test.c
> +++ b/tests/qtest/ahci-test.c
> @@ -1835,7 +1835,7 @@ static void create_ahci_io_test(enum IOMode type, enum AddrMode addr,
>   
>   int main(int argc, char **argv)
>   {
> -    const char *arch, *base;
> +    const char *base;
>       int ret;
>       int fd;
>       int c;
> @@ -1867,8 +1867,7 @@ int main(int argc, char **argv)
>       }
>   
>       /* Check architecture */
> -    arch = qtest_get_arch();
> -    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
> +    if (strcmp(qtest_get_base_arch(), "x86")) {
>           g_test_message("Skipping test for non-x86");
>           return 0;
>       }

While this change makes sense (unifying two checks into one) ...

> diff --git a/tests/qtest/am53c974-test.c b/tests/qtest/am53c974-test.c
> index ed3ac7db20..dc41182a38 100644
> --- a/tests/qtest/am53c974-test.c
> +++ b/tests/qtest/am53c974-test.c
> @@ -253,11 +253,9 @@ static void test_reset_before_transfer_ok(void)
>   
>   int main(int argc, char **argv)
>   {
> -    const char *arch = qtest_get_arch();
> -
>       g_test_init(&argc, &argv, NULL);
>   
> -    if (strcmp(arch, "i386") == 0) {
> +    if (!strcmp(qtest_get_base_arch(), "x86") && qtest_get_arch_bits() == 32) {

... this change looks more cumbersome now (doing two checks now instead of 
one), at least at the current point in time. Do you urgently need this for 
your refactoring? If not, I'd maybe postpone such changes that make the 
checks more compilcated to a later point in time.

  Thomas

