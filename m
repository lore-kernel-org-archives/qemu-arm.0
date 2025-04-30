Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp1227563njm;
        Wed, 30 Apr 2025 13:42:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE7c3/UOaUDwGtpcQ0c7isFePFuxjxyKQzUWdPJzBwe7ghcSyCXtAQ3tH8hRVehqCld8OR
X-Received: by 2002:a05:6a21:6d9b:b0:1f5:52fe:dcf8 with SMTP id adf61e73a8af0-20a8931f0b3mr4796724637.26.1746045764219;
        Wed, 30 Apr 2025 13:42:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746045764; cv=pass;
        d=google.com; s=arc-20240605;
        b=BcnBP1w9Q4nWU3remO++z1jOwgU6l24Q9A4Nf2aJKJVcAxNttbJyCiSTWcIwj4jIam
         JUHi3vPoF6Z8tL3JSFAVDnPY3NDJcLIlURRLALRIOeA1BI4Nsj3EY9ZWeW9A5kY7ecFd
         FwNE+JHaL9llH6TbEZi+LeSOqYnW6KU37enFo14Fk6ck07Nuhoq3Iwzo18NkMlC1FHmz
         9B1W2cyApwBRAL4I2jkvtfur0S7wdGuoLL7vByWqYyUylFjeNNAL7TrXVeMhFwBGcYPn
         oPD0wcxiNu+nE9zeZaocaxHeD7eoVFqTY4hTwyvG308FpDBj/uFQXMeMVMhrEa+cDySP
         TIrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+HMxDXM5EmWDfyjI7iKIounzo7KJUdVYfrDEQXDLqp4=;
        fh=47m133iozJJR9xJVPFXzH38DrozukQ8R2ZquLybNDT8=;
        b=gPafVxBmff3VLhRBbGmt5FyL6NfIP75HTOJRLAV7FCBFPLobnSNVIYr2QiUuzx6Vg5
         f1k2cVSplpgs114kXiB++zWs6rlkMYmqZA9HNwKkFuuibitFjcICfkefyxORszUo0lCw
         zth8mPuU10TNNC8mrZj8ioR3spF5SIdWBWg0cVZi82FCHwxdkYOCr5L7aDAq186sO/sC
         6eKtHShBqu6N05oQ+Nhv5W/lb9d8BLd+I3tQ2261h4eytNBiH42gxsouT0asndpbcjr6
         lCAWG8h8GhUozcXN9SfxPBfN/YdzmQK3BMyI1LukVeOO/d+B0LZ5Enx4pdZU5tAE9O9z
         uw8Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@collabora.com header.s=zohomail header.b=AlbR55JK;
       arc=pass (i=1 spf=pass spfdomain=collabora.com dkim=pass dkdomain=collabora.com dmarc=pass fromdomain=collabora.com>);
       spf=pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.188.112 as permitted sender) smtp.mailfrom=dmitry.osipenko@collabora.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=collabora.com
Return-Path: <dmitry.osipenko@collabora.com>
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com. [136.143.188.112])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b15fb5be69dsi18128111a12.558.2025.04.30.13.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:42:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.188.112 as permitted sender) client-ip=136.143.188.112;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@collabora.com header.s=zohomail header.b=AlbR55JK;
       arc=pass (i=1 spf=pass spfdomain=collabora.com dkim=pass dkdomain=collabora.com dmarc=pass fromdomain=collabora.com>);
       spf=pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.188.112 as permitted sender) smtp.mailfrom=dmitry.osipenko@collabora.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1746045752; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Lo+qTLoLk+XAuF5oADrlutxOjTftIx6TFBT3AHutnbIiizPle8x89Mwt0tpzhUo8AxJ1XZF097YST9qcTI4o/s6Dc00FM7aB0Y4Dsm/O+vhheZAufVE7o11Cgzy4uz39MxKOZdI5Ztd2jKhVqkZHoTWYFTPr0eqdm2fkMCHG9Wk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746045752; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+HMxDXM5EmWDfyjI7iKIounzo7KJUdVYfrDEQXDLqp4=; 
	b=QkkfH1VyGfxXgerLU9CI8YWow7DKoyEX2Ye0oCEZq0Io0zu+yF18qgoSTrenYoAYk1nQfkPb856Yi9tnLGP64QlymZ/9N62DTnjoASeGSlDgQvoL/chgcJE95TwGM2AHukwTbkaG/tSlINgrKYjKPIql6Pn+qdi0Ee5RqMXrTYc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746045752;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+HMxDXM5EmWDfyjI7iKIounzo7KJUdVYfrDEQXDLqp4=;
	b=AlbR55JKTuzhr6PhK8Xbe3U/sB847b1ly/eIVv170l1KYfmJNoeoumjMrEeaIoXt
	keMDm7Pv55bgmHHwOT76/Mj/H9jpfb5r85BNu1+03AoNYnoTKgIRSH5uH6b8FzckcX0
	lXWX0FxPLQjQQTnCUqI7kQ6sicDy11jyUnJ+t5/0=
Received: by mx.zohomail.com with SMTPS id 1746045749756451.6561705597459;
	Wed, 30 Apr 2025 13:42:29 -0700 (PDT)
Message-ID: <ef6d541b-6ff5-4783-a05a-5d8962ad8e3d@collabora.com>
Date: Wed, 30 Apr 2025 23:42:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] virtio-gpu: fix hang under TCG when unmapping blob
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-stable@nongnu.org
References: <20250428125918.449346-1-alex.bennee@linaro.org>
 <20250428125918.449346-9-alex.bennee@linaro.org>
 <8b123991-21f2-47b5-851d-6b53fbfaa691@collabora.com>
 <87o6we3bto.fsf@draig.linaro.org>
 <33ae8cd5-cc5c-4bfd-9c0b-dd71b80dfc0b@collabora.com>
 <87ikmm2bgt.fsf@draig.linaro.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <87ikmm2bgt.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-TUID: /HgZ/7Ajcdto

On 4/30/25 13:24, Alex Bennée wrote:
>> On 4/30/25 00:19, Alex Bennée wrote:
>>>> This change makes QEMU to crash.
>>> What is your command line to cause the crash?
>> I applied this patch on top of native context v11, ran AMD nctx and
>> got a crash on SDDM startup.
> Did you also include the pre-cursor patch which splits MemoryRegion out
> of the container struct. The aim here is to allow MemoryRegion counting
> to be handled without worrying about other structure lifetimes.

Very good catch, I indeed missed that other patch. Reapplied all the
patches and QEMU doesn't crash anymore. Now the code changes look sane
to me.

Will be great if Akihiko Odaki could comment too.

-- 
Best regards,
Dmitry
