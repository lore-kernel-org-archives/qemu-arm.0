Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2986368ejm;
        Wed, 3 May 2023 10:22:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7rJSkeVsxM/8f2u8Q56y8UyRAFwca/mpwTtg4NX33//MelPRzhIoZ4jOX5kSShkQd9DbA6
X-Received: by 2002:ac8:7f86:0:b0:3ef:3b5f:9aab with SMTP id z6-20020ac87f86000000b003ef3b5f9aabmr1331817qtj.56.1683134520447;
        Wed, 03 May 2023 10:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683134520; cv=none;
        d=google.com; s=arc-20160816;
        b=LCn8ikj65AT3g/LDfhL067E/9HL8Rv7oaAFktTBqc2gOhfWx3GaP/X0Mmk9UKCj4ga
         rX3ghVNtPBb6ioAO64l2CbfaBdOgE/z4tqxCqKB4En0nmSOM7Oan6NUu3Wq6wmNaEGgX
         gWNLb/w+SvlimSANQr+M33uQnkPuFwihPSPDqb7pVCn+anrnWeaJt2Jta0+AeT54QB8b
         DaMexd9eALZl8B9VC6L5n5qGuiQqZWEkgLUs6Wi//+ovZpv68mgAf4zFKQHCbQubx+Oq
         OScXallQyVcRR+OOWxjbXFHdSKCcTSBkW7MxjpZq6aZASU1KaXau9LViblRIW4/cZ9Rg
         Knmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=s66Bb5ELOpK+MSwQW0k0s761R0QO/f/gLY8F728xksA=;
        b=OaFJNlpVSqwbiRw4+WuoYNvBCVuZz3+9voWx107ggCvdD4f5BvvUkulnh1BqlX6F/E
         VXflAlSeLnkG1gG5wC0wAmc2N453WLc4qUtjRHVFqz4O3paC04yb9aOfJoKY4/rHzCWF
         GUNcqHl5VnTlGCDTK4iqBCbAVNg0bp3xa64l4/pBtdWx2v317ENA/zTHOcfxBb8sc6xl
         kf4gZbbzTGEXFkwGt/tJUVUKSAKX46b6PWjYGpIxUEQaJN4Eiv0DNz+j9Y8MlrEEJteU
         IgsQLwRPdL5PYjF2paCVC1nPPFQ1ymeqMMD3gU5bg6GDUvC9wIX7wDMkj5WViR3LcBrj
         tJdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NecwCBk5;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id i10-20020ac85e4a000000b003e391894beesi19225576qtx.552.2023.05.03.10.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:22:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NecwCBk5;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683134520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s66Bb5ELOpK+MSwQW0k0s761R0QO/f/gLY8F728xksA=;
	b=NecwCBk5kFLaBkSEldxVxDs4ee9q76ibkEa3hZd1hqWQYmMZsIZbhClCByRTyzG3KjkDTM
	JrmHhrkwtLXA9cHktgmdZZwb0kq2CQpOrxJU19ohNZsIRnANqjrLs4ijsN/59BgVBP1SBz
	qTiH6WSPVfNs1LfA3or3qXmVVbrykrA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-o4gV6XBeOw6WK5yA59hNIg-1; Wed, 03 May 2023 13:21:59 -0400
X-MC-Unique: o4gV6XBeOw6WK5yA59hNIg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94f0dd11762so665352866b.1
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 10:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134517; x=1685726517;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s66Bb5ELOpK+MSwQW0k0s761R0QO/f/gLY8F728xksA=;
        b=l5KhJWPai8nVA0rPOD6J507K9yWjCn7N+rge5penYTRK7ROB5TYsUpXH3O+7yxJqWw
         J7KGnWWPYFs//H7B36MsGcq00PPTGVsUBJFLHhWaSui+fkNAMS8uA42ZFoO+YnTlaQUT
         o4p5Nyn15KdrY5J8QGsWQLPnMG3aoB4sguvS67mxsuFzzVlUXHdchmNr7c9C3grMS+hk
         6bvXDlPdmq8qkPo+tmR6KUs9lI6LoLkeTmvmsyvrQb30FEJEYFuszMD2e2TydG0CME3C
         mwyYPtvMIwB5bSvHmueauyktmmTnpTXi7dEp50Q1X0QBuvzv1fO5BF4LaxW/Lx56uFIN
         NmRA==
X-Gm-Message-State: AC+VfDzW4ClaY1sKDUfDGX3LDfQjMy5CGWGb7iuglmaC9v2tVMDFFVfp
	bgBeLppaXMt/G1tP8aTQibpHCeEcAaw/pD4uj6E+LPlfD2kvHBzyOq2HM0Lag4g84BaonODgf96
	za0RwE14QUhb576sDvxxP0eQEtiOW9i7CLH5uiEjXCFKakHIBiK9W02k+/Pq/VVFVWeG1VhUXXM
	PS
X-Received: by 2002:a17:906:c155:b0:94a:5d16:a280 with SMTP id dp21-20020a170906c15500b0094a5d16a280mr4002268ejc.9.1683134517493;
        Wed, 03 May 2023 10:21:57 -0700 (PDT)
X-Received: by 2002:a17:906:c155:b0:94a:5d16:a280 with SMTP id dp21-20020a170906c15500b0094a5d16a280mr4002209ejc.9.1683134517040;
        Wed, 03 May 2023 10:21:57 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id q19-20020a1709060f9300b0094f1fe1696bsm17577296ejj.216.2023.05.03.10.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 10:21:56 -0700 (PDT)
Message-ID: <c6e7be44-eb95-56d8-c716-3983233a27b9@redhat.com>
Date: Wed, 3 May 2023 19:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 06/22] hw/arm: Select VIRTIO_BLK for virt machine
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-7-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-7-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: iRhhWOpGiYCM

On 5/3/23 11:12, Alex Bennée wrote:
> From: Fabiano Rosas<farosas@suse.de>
> 
> The virt machine has IF_VIRTIO as block_default_type, which causes the
> generic code to try to create a virtio-blk-pci device pair at
> configure_blockdev()/qemu_create_cli_devices().
> 
> Select VIRTIO_BLK and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors
> when PCI_DEVICES=n (due to e.g. --without-default-devices):
> 
> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max -nodefaults -cdrom foo.qcow2
> qemu-system-aarch64: -cdrom foo.qcow2: 'virtio-blk' (alias
> 'virtio-blk-pci') is not a valid device model name

This is also not needed.  It doesn't matter what's the default - it's 
possible to create a machine without block devices at all, therefore 
VIRTIO_BLK should not be selected.

Paolo
