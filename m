Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp198374ejb;
        Thu, 30 Nov 2023 04:59:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjx5gAA7EdqLo+t9ABUST4+eY5DyuJrp+XkJXoYIkFbVhEy/Ue+5Ia4qARAHrWyz2zvXeI
X-Received: by 2002:a05:6a00:2794:b0:6cb:bca2:cbd1 with SMTP id bd20-20020a056a00279400b006cbbca2cbd1mr22785560pfb.6.1701349159449;
        Thu, 30 Nov 2023 04:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701349159; cv=none;
        d=google.com; s=arc-20160816;
        b=SubgYgfOZF2Ujm7Od5/ASMbhcpwPP0I/Insz9oC/WhuHJ1qCTSPgk+BNZS+n+1Xh39
         pdBCqkPIy4i7xplimqqn3FHuoiC+SdbSJCmXHznESnBXtGMDHQTxaztzboqVmhYgUbRU
         FiwcykdzWw40C0oK6jjYnVBW3jAcoHdJ8vvH20aK+lmHhCrKnozzPHS+j0L2YYQnf7gH
         FpOiGXw2ko8M5YGO+MSOAyY3aXgTtRviT9yUYLlHiZIRxc0ArRK8xYxAubk5VTSj9fr7
         5uJaxF29Mawo5FmvenLdmFKydgwKQG8lBDwVXOINldDXVuzxLanowIewEVOnvpJVrUgK
         E12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=JazEB41gcRwBgZxV564L5fkGpE18QOb0brdHFsRUYjE=;
        fh=hh8iIRMxqXsh63WkBtfgaM2/SexR5FVGIZD55sUt70c=;
        b=JMAihzPVXTkP2ZN/p7mAWcrjV6EljFGCvNH+xS/yO3lnPwY6ZgP6N8YCVgj5vFdozK
         PQ4GZUrLOS/hUm1PgZ/9FATgSZywmM+ubKHDaDFv7+9rXSUpeiP/OZwiRihr5ycoCm2j
         dpjcMOUzw7CrJnv7svmV3Uy+MzZXfspfTUGHVIc9RSeaEUHcgzaGv2bTqyCmqioXTQNh
         n6I0c8vmCwk8KlNk2y2Kbexh1SPloOzA+T3AJx3GCKYoCqsEykEp21iSvMAPdNJv3jWr
         4EFjTdjxtrb0BWyKU5NOz7s4+XHlMkYJu8H7UdEGWqRebnr47p2EUqKX+58/FLCRrLia
         VS9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=tvl7=hl=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id s21-20020a056a00195500b0068e3f550763si1223881pfk.101.2023.11.30.04.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 04:59:19 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=tvl7=hl=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=tvl7=hl=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=Tvl7=HL=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Sgx912pNvz4xjZ;
	Thu, 30 Nov 2023 23:59:17 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sgx853gFPz4xW7;
	Thu, 30 Nov 2023 23:58:28 +1100 (AEDT)
Message-ID: <0f414482-a1e7-4863-9ce1-3584b4d43e6c@kaod.org>
Date: Thu, 30 Nov 2023 13:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] qemu/main-loop: rename QEMU_IOTHREAD_LOCK_GUARD to
 QEMU_BQL_LOCK_GUARD
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
 <20231129212625.1051502-3-stefanha@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231129212625.1051502-3-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 2GWecZMmmWMX

On 11/29/23 22:26, Stefan Hajnoczi wrote:
> The name "iothread" is overloaded. Use the term Big QEMU Lock (BQL)
> instead, it is already widely used and unambiguous.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


