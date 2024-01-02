Received: by 2002:a05:7022:7e0d:b0:70:a3b7:dfe7 with SMTP id ut13csp6657038dlb;
        Tue, 2 Jan 2024 08:02:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEt1F3jiO10SXQInl+iqbNx9CLB0q3hOxVtNZE4KvzLXPcZBCRAqcls/L4wlKmi2pd4maWb
X-Received: by 2002:a17:902:6805:b0:1d4:4b09:6b6a with SMTP id h5-20020a170902680500b001d44b096b6amr15377966plk.134.1704211365270;
        Tue, 02 Jan 2024 08:02:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704211365; cv=none;
        d=google.com; s=arc-20160816;
        b=HkoDxjpfjeMJ6Kj2hcVV/Gv8XPMnQ6GpAntOcK1DHQnDTCO6ChlTr9UEofzEsQYGUC
         xnNZunD/djGspPtybjjXnA0tdVIPWrnjT5h3pur47pVdkCxXJJ4sBuoqjyH37YlhbxBR
         5xFTM0Q1xLfxh+Rvxo66d/ewaFR5qq7deXQSv+/wJqz3o7kUFOzjA3zN0q1P6jiovY40
         whhqoYaOV8Gt6EmDcBTnBfvExk1FzAnuBRI9AEKHd6auzAfx2g+OSaVb3DKAW2tLDI8E
         b6wkxpCAG4Sh8sLQUW3yd7lnRFj6O/6A7oYYoHVpY498HabB+7Mro4pskgyFMYJLbPpK
         1cCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=RqbwUxLB0FvFJS5RkvSk/rcads4+VrVu66R8FGEwTkQ=;
        fh=W3tjlO6QYa482TJH9bmmDqCokjr+OPmKtfCkQqP795c=;
        b=qCQ+1pAPvwN2zjnm9oY5V7Fe+oNyYWiZjPbpFvn0GaqZjnwQYjWBnpvQH1iIELaH7p
         doNLBVIXqgKV/Rs/EhIIrbp/oRXu4zWoF2LUaQ04A79uEGgQlxc7sK1NOmAVPFCA10dt
         /oyTUdbffVixLlzxmBykw/aGm1RtxSiLODSV7i1rgBdxzXmc+PgtW9/yf2o0srg+ANMx
         rR6cbJoHw3gAyf6aAVqaClaMEq1hDBqZux53docdksWf4hFBlfeYCsAqeVKkjoMfa2Ux
         eIBQHiJtH1VB9jkR/PR5fU+AZBC2MeVN5u6rqlXka3TWrrdTcM1a23GLyWgDHakoVL6J
         +wmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=hBD0=IM=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id q14-20020a170902788e00b001d3ac497f07si15597686pll.565.2024.01.02.08.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 08:02:45 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hbd0=im=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=hBD0=IM=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T4HgQ2NfRz4x22;
	Wed,  3 Jan 2024 03:02:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4T4Hfs3GGMz4x23;
	Wed,  3 Jan 2024 03:02:13 +1100 (AEDT)
Message-ID: <6fe17c0c-e9c4-46fc-bac0-8e977e531c8c@kaod.org>
Date: Tue, 2 Jan 2024 17:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] Replace "iothread lock" with "BQL" in comments
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
 <20240102153529.486531-5-stefanha@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20240102153529.486531-5-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: D9KQhVl3KWf1

On 1/2/24 16:35, Stefan Hajnoczi wrote:
> The term "iothread lock" is obsolete. The APIs use Big QEMU Lock (BQL)
> in their names. Update the code comments to use "BQL" instead of
> "iothread lock".
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


