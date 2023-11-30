Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp197893ejb;
        Thu, 30 Nov 2023 04:58:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYeC6YHfODqSU8rAHVl0IYr4xDMY1QnyxWzaG+KvIl37WUgIXpl9Zh7vmQZzvIUyGF00D7
X-Received: by 2002:a05:6a21:6d85:b0:18c:3a58:fcc5 with SMTP id wl5-20020a056a216d8500b0018c3a58fcc5mr21821511pzb.15.1701349108245;
        Thu, 30 Nov 2023 04:58:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701349108; cv=none;
        d=google.com; s=arc-20160816;
        b=eA5/4nJfcF4uBSPNMKjieg5Pnkc2dzSbXmcJ+chH0ISPgp9ZX6hvpxwo9ItDHPqC4S
         TQ4UkroQ6x1FkB62UwCplAD9jGmSOCFkARWVwLIpgXXJKZdEYezeWNJCy48LSSQDKlA/
         VzeSUWr160Nar+nZXfWgI02PQjVK1F7rVNIHadKgMD3lNegTaQRAI0+irTTTSBAocVD9
         jq8q1pfVoGR5VGBz+GjqR5dKZrlGoVolV63yYhpT7r9EPe/TyoYFGiKrxGe8L4q2cpAh
         vJl7k/rlS3pjjSDK2hqhylVul3MlBc5LBBZBfzsSSQU7buB7nMPFD8b9K5lAD9BI0xIs
         Cyug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=PkWrdipkJpuGRYFKDtWTJRkxuU/bYwAnObhiOMe4gVg=;
        fh=hh8iIRMxqXsh63WkBtfgaM2/SexR5FVGIZD55sUt70c=;
        b=Gerq5sm/Pg6tNUkbly5myOkfpuQ6tz+/gsmqObpOUC4SDWiGmiqz+1ll8dKXaSIsZS
         iTjPz7ssPvRYKlYHI20TWbQPeQp8n8eTkFUofUuZ4UhhQ+tlocAbhLSLAKVrraD0UW7e
         IAasxan6AlQmZtQjyx0FC7yQcpyzVteOdvPxLvaOdZkbTHiHywhUw4zyhQCcMwTlN4uj
         CnmuP+atoVkf8woQfrRdUfu/NtH1rOeUV30BmrqtCU+xCajYptOyxV44PsFwrXZ0F1Rb
         bbZ93rm1PNbRY9OIFhBBXPgmv5Jd05GZBsZT6gde3I2nnD/D/QqNQggRZnsSLUhie1aO
         1kMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=tvl7=hl=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id oe8-20020a17090b394800b002858a291a45si1372113pjb.141.2023.11.30.04.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 04:58:28 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=tvl7=hl=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=tvl7=hl=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Sgx815VyTz4xhx;
	Thu, 30 Nov 2023 23:58:25 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sgx716RjTz4xWv;
	Thu, 30 Nov 2023 23:57:33 +1100 (AEDT)
Message-ID: <53cb0a57-d8c4-4c59-b37f-60182410e0cd@kaod.org>
Date: Thu, 30 Nov 2023 13:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] system/cpus: rename qemu_mutex_lock_iothread() to
 qemu_bql_lock()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Hyman Huang <yong.huang@smartx.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Paul Durrant <paul@xen.org>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org, Jason Wang
 <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Huacai Chen <chenhuacai@kernel.org>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Jiri Slaby <jslaby@suse.cz>, Alexander Graf <agraf@csgraf.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Stafford Horne <shorne@gmail.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Cameron Esfahani <dirty@apple.com>, xen-devel@lists.xenproject.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-riscv@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 John Snow <jsnow@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Michael Roth <michael.roth@amd.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 qemu-block@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Leonardo Bras
 <leobras@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20231129212625.1051502-1-stefanha@redhat.com>
 <20231129212625.1051502-2-stefanha@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231129212625.1051502-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 5fWx2G/yyjML

On 11/29/23 22:26, Stefan Hajnoczi wrote:
> The Big QEMU Lock (BQL) has many names and they are confusing. The
> actual QemuMutex variable is called qemu_global_mutex but it's commonly
> referred to as the BQL in discussions and some code comments. The
> locking APIs, however, are called qemu_mutex_lock_iothread() and
> qemu_mutex_unlock_iothread().
> 
> The "iothread" name is historic and comes from when the main thread was
> split into into KVM vcpu threads and the "iothread" (now called the main
> loop thread). I have contributed to the confusion myself by introducing
> a separate --object iothread, a separate concept unrelated to the BQL.
> 
> The "iothread" name is no longer appropriate for the BQL. Rename the
> locking APIs to:
> - void qemu_bql_lock(void)
> - void qemu_bql_unlock(void)
> - bool qemu_bql_locked(void)
> 
> There are more APIs with "iothread" in their names. Subsequent patches
> will rename them. There are also comments and documentation that will be
> updated in later patches.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


