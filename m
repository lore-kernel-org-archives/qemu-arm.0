Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2738760ejm;
        Wed, 3 May 2023 03:31:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XESyIRRXjO4VztxzZMxa5FDJpqm/LfhX1qO9HWZwCCJLvao5CKkAuLwKf+rMANyfw5DXq
X-Received: by 2002:a17:907:1629:b0:94f:7844:b0ca with SMTP id hb41-20020a170907162900b0094f7844b0camr3886983ejc.52.1683109887268;
        Wed, 03 May 2023 03:31:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683109887; cv=none;
        d=google.com; s=arc-20160816;
        b=KpfO9s3yTPm62GVbAIvyBP2B0mTUqgTGhm3apq+BT9I0emRMzTmLx68wdLd1DF0Svv
         mvtAMNCFQt+HALMOWYGHtCETJHgyx0JVkN4v4CVA9ixFOIRFFO0AAKHXh2zA85fb2/sB
         gPKtlzCV3cEbniOCoQePvS6MK/+GrQlMiSruIhWMDvMwKbI93S7JTLgNZA1j8ssKFSLJ
         vV5LRTTCA/+Ab/6XiPWdVM6hr8v1WpW+Kupfz0mzLssODVNrwTi8cF3wl64iMCRQFGCJ
         9ggWdjMt9AmAL9iysqJ1NmzG724klPPH+9IcKVy1rt3x/WwlsmNmhSzRz0GGF351MCaz
         q29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=9jomI8TSUfSqC5jMoj2cmZXKKX5UdztfJ/1fu7WdWnc=;
        b=I/6up53D9radkuKTg10KyJTctvJQfGm3n7sNvijNX6szhRATAujJ3JM4nafg7+bJHT
         9WISH32J5/HyZPBC5Uyzb1D/DiNAB8bMJ2fq5kMSLnnO/vPfuMy5KqEmJqrqxOR5ailP
         CkdBgd7ry9bGUzEPBI8l+zaE6pKI6dIp+XKUT3h8Jbh5f9SnLFWDVc0ZLfjIrXfs/0ix
         B3FweodVLT+B3yfssI6DHcECr++nrWv1U7Sp7Vx//PbuzKfCyXZIJKuybkmu41mwL8vk
         bG/fFpZEyb1ajC9DMoVHVrzHkuYzVXHfgxqFc4OKzpIhJW5TAYwfRJxnUNb50AcbCwYY
         vu4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hK96bXh5;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id dn17-20020a17090794d100b0095ed7845fbdsi18816302ejc.994.2023.05.03.03.31.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 03:31:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hK96bXh5;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683109886;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9jomI8TSUfSqC5jMoj2cmZXKKX5UdztfJ/1fu7WdWnc=;
	b=hK96bXh5crXhsGYZFw+vNs5kPaoOjd0IhcOVm9PjrtENpg95RoIq99TqGXrS8rfEiJKXIW
	8ujSy35xolk9beqQsYxqBARQ6TzlJkaSPeO1MTHieSxRnuXurdR6XxpXxOSZ4ukgCOch8I
	gn/6lfwlnG2aEUPAREu93i57/bo1IcU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-vGk5Dk5AP1qJolCO6nOcxQ-1; Wed, 03 May 2023 06:31:25 -0400
X-MC-Unique: vGk5Dk5AP1qJolCO6nOcxQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f170a1fbe7so30125265e9.2
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 03:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683109884; x=1685701884;
        h=content-transfer-encoding:mime-version:message-id:date:reply-to
         :user-agent:references:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9jomI8TSUfSqC5jMoj2cmZXKKX5UdztfJ/1fu7WdWnc=;
        b=iFHFq9UU7gY70N/cr117f+HtJGL+eV522RcLdCbd50//VKE2pVlAOkfLn920CiaEqo
         uuXN1oj7nrqJebHKkaFalL6KyPA6Tsoiw3B00s9T+TGTQXfoT4bXl8K/ZEIzlFwIcGYD
         +H+cIpiGP6JLmOvJ5Hhuth9Hk52IzrYG3C0G/ah+VVjr8qNtFMA8bqpugOSoGWad+YYJ
         mcq7BPEEd0GVp30tShGpfuApCMLwLZIlVQGim48HBgnAgloHYgwWxroOJY3lU8FutngO
         yarvwX0VpthZ0BWRscwt5cjGSJfWhwi38LDlGXbJWnIApcSvCFNk0GdgReOz8RPgEsTy
         j7Jg==
X-Gm-Message-State: AC+VfDwJbFautO4tgqvfHGVDOp8rhKLuoBbWs5+V/MWdH01iSt9Yko1L
	wm/15JvqMyP/IGOlP41zbz3XerJcCptlNOCsCkCk7Pj8OqXGIXFekg1Ef7/xhCNbN5EcM3HfXhz
	vdea88cEgp1TLPAc7UzFA4VYmuXhvh8XLZ7UrU7cm5/GVefSLHSIeP4VrdikWalyXW6XeH5Q4UL
	Wr7QdK2g==
X-Received: by 2002:adf:fb85:0:b0:2f8:cb68:8203 with SMTP id a5-20020adffb85000000b002f8cb688203mr14889163wrr.0.1683109883930;
        Wed, 03 May 2023 03:31:23 -0700 (PDT)
X-Received: by 2002:adf:fb85:0:b0:2f8:cb68:8203 with SMTP id a5-20020adffb85000000b002f8cb688203mr14889103wrr.0.1683109883499;
        Wed, 03 May 2023 03:31:23 -0700 (PDT)
Return-Path: <quintela@redhat.com>
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net. [188.85.120.92])
        by smtp.gmail.com with ESMTPSA id m10-20020a5d56ca000000b002c54c9bd71fsm33341734wrw.93.2023.05.03.03.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 03:31:22 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Laurent Vivier <lvivier@redhat.com>,  Artyom
 Tarasenko <atar4qemu@gmail.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Leif Lindholm
 <quic_llindhol@quicinc.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Helge Deller <deller@gmx.de>,  Xiaojuan
 Yang <yangxiaojuan@loongson.cn>,  Stefan Hajnoczi <stefanha@redhat.com>,
  Cleber Rosa <crosa@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,  John
 Snow <jsnow@redhat.com>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,
  Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,  Andrew Jeffery
 <andrew@aj.id.au>,  qemu-s390x@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-arm@nongnu.org,  Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>,  Beraldo Leal <bleal@redhat.com>,  Max
 Filippov <jcmvbkbc@gmail.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
  Radoslaw Biernacki <rad@semihalf.com>,  Aurelien Jarno
 <aurelien@aurel32.net>,  David Hildenbrand <david@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  Song Gao <gaosong@loongson.cn>,  Joel
 Stanley <joel@jms.id.au>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Fabiano
 Rosas
 <farosas@suse.de>
Subject: Re: [PATCH 06/22] hw/arm: Select VIRTIO_BLK for virt machine
In-Reply-To: <20230503091244.1450613-7-alex.bennee@linaro.org> ("Alex
	=?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 3 May 2023 10:12:28 +0100")
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
	<20230503091244.1450613-7-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Wed, 03 May 2023 12:31:21 +0200
Message-ID: <87354dso3q.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: n0tySrfmUeUj

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> From: Fabiano Rosas <farosas@suse.de>
>
> The virt machine has IF_VIRTIO as block_default_type, which causes the
> generic code to try to create a virtio-blk-pci device pair at
> configure_blockdev()/qemu_create_cli_devices().
>
> Select VIRTIO_BLK and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors
> when PCI_DEVICES=3Dn (due to e.g. --without-default-devices):
>
> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max -nodefaults -cdrom fo=
o.qcow2
> qemu-system-aarch64: -cdrom foo.qcow2: 'virtio-blk' (alias
> 'virtio-blk-pci') is not a valid device model name
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20230208192654.8854-7-farosas@suse.de>

Reviewed-by: Juan Quintela <quintela@redhat.com>
