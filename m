Received: by 2002:a05:7022:7e0d:b0:70:a3b7:dfe7 with SMTP id ut13csp6659521dlb;
        Tue, 2 Jan 2024 08:05:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHk868gJoSwtC6nyXGrWY6PCwXoDA1DGZaHOo6DIs/Q0h3xRoZ+8yhJQu11Wuy2xWV1d0db
X-Received: by 2002:a17:90a:eb14:b0:28c:a437:5ce5 with SMTP id j20-20020a17090aeb1400b0028ca4375ce5mr2504389pjz.50.1704211536285;
        Tue, 02 Jan 2024 08:05:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704211536; cv=none;
        d=google.com; s=arc-20160816;
        b=0w3tKGq6loMy50RNCPcyvirXAdESCVxiz2XTBBhzx0ZFHtJpqT129oTVcFb+AJZztt
         1qPH//7rHgqCEKYTdb5dNKP3HkN5kwAzCRTmOhL6LuV34hDsUN4GAPphhKRapQyl+Hk6
         AjjcQ1ZDY3Tr5ueTiKv5ezoFn6IRr0fAdpP3Uo3AHW1LTYvDVGgy4JTJyitL9hENs+4y
         W25S9GyYUt1NrCoX0KX6+OOIRaqGJ3C+nFIvWUnHxnK1tJJNnnrXJsmZBhW1hjayqGM4
         vDM7hN1CYUW3w3OKJ/+sOdmzxt9L2EoxJLq9m32SdrjhrvV2yrvh5N4aHemdWGHQAVya
         5cXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=A/kchwZQmimMq/bq6AYEN5l5jOYVA8sGVNU4gs8bXho=;
        fh=W3tjlO6QYa482TJH9bmmDqCokjr+OPmKtfCkQqP795c=;
        b=FfGaCWvqRAGrj4ySPKuJylB2HGFNG5f7/A5HsmqvbQGkrkw3bmkEFtJB4bwtu8e+TU
         Gu8xb1POmNaT0zXZJNPzXaZN1HDAhlpTwxIMNhswWB1mNTajry7oB34RARrHxlgKh5oL
         MVcsiJsPmy7E8a5+mdbrpUMoS+mslf3SNZbEiBWAXzirRLI7pLWXs55cpYfXEMVWFVDa
         1PujcV6dmFoSKLUMUjczulyt5Iu1ih5Vb+DmGEXQ6xh4tH8XOJ8IA+46V+at/oJstvqp
         t6qHzZz6fHIV7Sg5vRRf0ZHA5m0GOqmSnlWrpBydIPmfLPN0k8dGLJYUtypufwqdL1R3
         qTcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id y4-20020a17090a8b0400b0028b7653ac36si23060987pjn.171.2024.01.02.08.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 08:05:36 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4Hkj6Q0lz4wdB;
	Wed,  3 Jan 2024 03:05:33 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4HkK0K3sz4wcM;
	Wed,  3 Jan 2024 03:05:12 +1100 (AEDT)
Message-ID: <5bcc750f-2736-4eca-aec2-f45e56a6fa92@kaod.org>
Date: Tue, 2 Jan 2024 17:05:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] Rename "QEMU global mutex" to "BQL" in comments
 and docs
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-riscv@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, John Snow <jsnow@redhat.com>,
 Stafford Horne <shorne@gmail.com>, Weiwei Li <liwei1518@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Cameron Esfahani <dirty@apple.com>, Alexander Graf <agraf@csgraf.de>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Jiri Slaby <jslaby@suse.cz>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eric Blake <eblake@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Michael Roth <michael.roth@amd.com>,
 Paul Durrant <paul@xen.org>, Jagannathan Raman <jag.raman@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hyman Huang <yong.huang@smartx.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 xen-devel@lists.xenproject.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Kevin Wolf <kwolf@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, qemu-ppc@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Leonardo Bras <leobras@redhat.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, kvm@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Eric Farman <farman@linux.ibm.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240102153529.486531-1-stefanha@redhat.com>
 <20240102153529.486531-6-stefanha@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240102153529.486531-6-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: bwrBBzZobgqq

On 1/2/24 16:35, Stefan Hajnoczi wrote:
> The term "QEMU global mutex" is identical to the more widely used Big
> QEMU Lock ("BQL"). Update the code comments and documentation to use
> "BQL" instead of "QEMU global mutex".
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

