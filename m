Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp35563ejo;
        Thu, 4 Jan 2024 04:10:43 -0800 (PST)
X-Received: by 2002:a17:902:b789:b0:1d3:f245:ab27 with SMTP id e9-20020a170902b78900b001d3f245ab27mr330971pls.46.1704370243656;
        Thu, 04 Jan 2024 04:10:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704370243; cv=none;
        d=google.com; s=arc-20160816;
        b=s4b7m7+N3cr4/kq/auuaPHM0eFWL7j4+dCCfP/hL0Z8ajhHbggU8FoU9RR0nHG4/3g
         TQ+6UUwnM25rQNFH8pgb65XMVGPT+AOaK6BU7+TfFScyAIr7V3yoxCmF48ANNXTQV9Mp
         NoCP9Qc8rbvNYPYLp7Nt7EPN5PrJn76x0TZFhkPmZXLsk2bz/4jKgbRcccDg4vr2QLV6
         Da+ymWva5dJNKGE65jAXTLzbVRJDC3Qq86420/fIqEtVf9TcPd0ODOgBDJHmZqPSN7Ve
         H6tcYS6blLLR2d4mv1pLS132F5+Of7WRjziVzc59NcBXNhXHrrbveupJKNID1p5glrdo
         PKRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Q23i9yT7yrVEFxnf3fk5D4MyK0KHTuKJKDM3rop1kno=;
        fh=V9VUOiBJX3bMk+YhYt4OJ7NszhI7n2O4X10wXqauf7g=;
        b=LuJLioGcNvAvRZkXiXWd+zzNWfmN5Ynadn/9yQv/Vc0x/0x87/8nRwX8mKKdMfncXr
         ePoPEMvDW4+Z/7jqDfa2ZL+lPfwUYQkCxvRmhNgA8ZU8AARNX8Xx4zwSWfwmI0l6BjYO
         rZBl2B8SZ/H1PK9k+W1ftpQpJLB0ScNPiFJFM4xOq6f+UJnD7604lc+M6+goudnwi9hA
         9Hvz67Qi54pvqnKw9JGe2pe3zXVyC1OJ/6IQG3ElAJHETkzB+8VJ30IVPC7QVpUHgh+w
         M60jCKcEByjncq5gRra2beEeaHXb8xJkMvo1TDhAoAtId0iwDfPhlGTMeHfp7cCQQhmf
         HdsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=wXjEPj0T;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c15-20020a170902848f00b001d4beb1e16fsor2273696plo.7.2024.01.04.04.10.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jan 2024 04:10:43 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=wXjEPj0T;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1704370243; x=1704975043; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q23i9yT7yrVEFxnf3fk5D4MyK0KHTuKJKDM3rop1kno=;
        b=wXjEPj0T2vqkEwjhn9R8pdNo/mgdRVhu3vUU2ttCaAbWjK1GsX5av45WLPToKLU5Uh
         XkKXufFlQrtOhnumztAsIQ9FNIwN3T06vzCx0osfNDhkIqY3COrbwD7/97r/WBDWIIsG
         D4meO5mNRiMq7MFwLewI4Cx1Y8J0LBeeU1L5mZY5vJQJuKcL1IPKIDtflbd1DFHOyb2V
         pOisEBRwf32HwJDPKg5+Gh5V3AKcBXqGOEi3UKwkN/uu1k7sxmlop7PnZ4NHXFBFaenR
         PU7/VSr0STwO9X/bxZXa9R2iGspOdcM5WyFceBsy9H0r9KnmlEDT+SGCxj2OLZW8VWys
         w4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704370243; x=1704975043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q23i9yT7yrVEFxnf3fk5D4MyK0KHTuKJKDM3rop1kno=;
        b=wvJLMXT+ncqE6qoiEc3uXB2vpxeBCaxm5CxgZP3IsydZ0mF5dz7xee2lH5f5q2IfZk
         jgs1nXrcC6CbXEI9UDaJkEXGBA05EHY6aAo9DjVxxExMTJkQGDveqO4Fvwp30X101zyQ
         E8MqhmTv2RI76/FqbO5uwT4MHUyYkpxRnyQNqzLTC2JYjjRXCXaLojQdFkrXZ9wzodiO
         6FvuYQms5G/hBayf4ZMU+yf159oHNgf5Bbfyyny946NwTTUqRsV0A2z/8shsTIPA66d1
         R2hmigVWw6NGfkafX9a9mx0s8HEW1rUSBIC0jr676v6OvOyq2nXQyMSx/s70M2HZRd4V
         63iQ==
X-Gm-Message-State: AOJu0YxOdzkuLn42My2X8mnxiMv81jPLltwx2JtRqQAxWokTvc1xilMd
	yshtJIZrUTSwdlhd6vbcVb+oi6nS45Xc9g==
X-Google-Smtp-Source: AGHT+IEvVniyWW6+pm7fNDiUCukxNFVRQmngQJsY2M7PnvRddXZwN4RLgEaC/QIRqiAw2JDtmofBpQ==
X-Received: by 2002:a17:903:1d1:b0:1d4:2b5a:9cb7 with SMTP id e17-20020a17090301d100b001d42b5a9cb7mr365235plh.47.1704370243101;
        Thu, 04 Jan 2024 04:10:43 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:9ac7:6d57:2b16:6932? ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
        by smtp.gmail.com with ESMTPSA id x22-20020a170902821600b001cfc1b931a9sm25324308pln.249.2024.01.04.04.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 04:10:42 -0800 (PST)
Message-ID: <480302ec-4fb2-4e97-8940-8ec27846efc5@daynix.com>
Date: Thu, 4 Jan 2024 21:10:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Make Big QEMU Lock naming consistent
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-riscv@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
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
 Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
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
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240102153529.486531-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 0FNNhAIgE8nI

On 2024/01/03 0:35, Stefan Hajnoczi wrote:
> v3:
> - Rebase
> - Define bql_lock() macro on a single line [Akihiko Odaki]
> v2:
> - Rename APIs bql_*() [PeterX]
> - Spell out "Big QEMU Lock (BQL)" in doc comments [PeterX]
> - Rename "iolock" variables in hw/remote/mpqemu-link.c [Harsh]
> - Fix bql_auto_lock() indentation in Patch 2 [Ilya]
> - "with BQL taken" -> "with the BQL taken" [Philippe]
> - "under BQL" -> "under the BQL" [Philippe]
> 
> The Big QEMU Lock ("BQL") has two other names: "iothread lock" and "QEMU global
> mutex". The term "iothread lock" is easily confused with the unrelated --object
> iothread (iothread.c).
> 
> This series updates the code and documentation to consistently use "BQL". This
> makes the code easier to understand.

For the whole series,
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Thank you for sorting this out.
