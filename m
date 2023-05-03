Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2982761ejm;
        Wed, 3 May 2023 10:15:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5zokuUXuwPHCXFYgwIeGuKtg4n44sy/X+Mcs3fmujugizYhkyiED+XyqwSS9+R3sg1P0oZ
X-Received: by 2002:ad4:5cc5:0:b0:5df:4d41:954d with SMTP id iu5-20020ad45cc5000000b005df4d41954dmr12177889qvb.3.1683134153121;
        Wed, 03 May 2023 10:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683134153; cv=none;
        d=google.com; s=arc-20160816;
        b=Rezb3QS6iKtW1ueL6KOXK/cQR1JHcGQ7rs+ypNfzOkW++dF5cae2UGGUjxFjJu/T42
         XfMsMr2DDsLvp4x9fEwx65Q3gh2d+0JXIGUs5UWsIM+u18rLOlxUxdjRm0IL6iEB8wOe
         dyJ6bMWSmn58sKJpCI52O0tfCMG+Z+ozj1lre9isd5xC34WjD5Ai/M5xbo8cSXTqBjpy
         o4MLGYq4UC6dqH23BkKyp3PEPNLfLyPWCTVe4eHP30mleJAGpWaJbv8fMjZ4TRtE8Vxe
         BOyPeciT7iim2hgdDms6d8dHV70vkn90HAg8u1DCqkywkHZAg7odZvPc+FxsMqnseIG3
         EvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tyDTZ6eEK5JlfyVWgV2p0R15jFFMMHvTlxtliUVQq14=;
        b=IDOhrYYCa1iiQEbKdU+i9VwnZBEpahAWw3XqOwNDom2xFHDtbuvDR5IvzSWG/hrYWk
         d5hd0nm30gsmneGOvfGhMfDWCArIRddD6c13IRctGFZX9XMxTkK+EV96ls/U7WViwHO8
         ywZC8M57BgZlbnwafe5xwcAOgsoBxUZARiyLJ+2I5fpLs0cfRFtTWJ7SCNm+GBKg3noq
         2brAXYxY6ujYhaoMTmiVFAiYYl5pd7dIXZ+knlP9UUfwEyPnuhXD6ucRELY2rFH0ry5T
         ShxAjmdPKBSIG2XiAZnVw09EfSH2j6HXz4T+Yg/qTtjdDfwLxURGFt48MY3sorKvl1Vq
         TsOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AaXC2Y1j;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id r17-20020a05620a299100b0074e1094fa7dsi12131401qkp.412.2023.05.03.10.15.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:15:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AaXC2Y1j;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683134152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tyDTZ6eEK5JlfyVWgV2p0R15jFFMMHvTlxtliUVQq14=;
	b=AaXC2Y1jWdP9RbLqJZHXH2QnWNAuVU+8isPn1wQc4FYYzSHFRvs1cmn5Q7Z6ghUovslMga
	oI7/E7QTsQ3kaY7w8PW0bRZYafPOXSxu0M9bRlsTXik6Uff2D9hqBM+OFkrxkg5RAwLtUo
	hJpJbMTGQo9J478R0PW1wW8e9shIKx0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-pJJ-Tdk0MS-PmeuEZTcAYg-1; Wed, 03 May 2023 13:15:51 -0400
X-MC-Unique: pJJ-Tdk0MS-PmeuEZTcAYg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94f59fc774fso677926366b.0
        for <alex.bennee@linaro.org>; Wed, 03 May 2023 10:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134150; x=1685726150;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tyDTZ6eEK5JlfyVWgV2p0R15jFFMMHvTlxtliUVQq14=;
        b=l1eWXAIs7uPlX4lcTuQxANrOrYUoaDzZywPsAY1AZi+gvMcs8vIgtzl9yszMA7F+yJ
         1sP/jGDFT1AnwysiCbuHbEjTv/UyRWUkBA1GWrE+kMvIv2mR2JgdPdkeopj8eLYSHtcm
         gqzqa4tBZR6NS6c2Pex8sxZjkjtySFHnpq/brwCHCukhvyrsvZF8W8QQXvPSIAjWTVHm
         M2Hs4CfO1LfgKFIg+xeUwRsaHBdVIhnWsWXNdbWyXVKQjeeiprtahwhvMUqyJv4ChP2K
         pbD3lMOMZ4b6WCKyv776biqC81xa5dQ20hqjCLJHc0Mmt0Q75gMJftuSKfjHhRm16yLK
         DV9w==
X-Gm-Message-State: AC+VfDzoIX0f81dbnkooYoj4pFZPTe/If8rtaa1UU/c35oxeC6Vu6QT7
	PH2SzCGiOB1dcYuSZvudFICUj/X59OxrFd/TW/cC1cHd4TrCbSiZu2BMtXW73fqWndXDQjMiG2t
	NtDxgjjH3mxUvNva0DUKe63JCIikc0qYPrgKhZVD/Cy1pCnktS5k6wHvxaKrx7E+WXUHjuJauwe
	9E
X-Received: by 2002:a17:906:db0d:b0:94a:6f1d:54df with SMTP id xj13-20020a170906db0d00b0094a6f1d54dfmr4037417ejb.67.1683134150286;
        Wed, 03 May 2023 10:15:50 -0700 (PDT)
X-Received: by 2002:a17:906:db0d:b0:94a:6f1d:54df with SMTP id xj13-20020a170906db0d00b0094a6f1d54dfmr4037352ejb.67.1683134149840;
        Wed, 03 May 2023 10:15:49 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id gn2-20020a1709070d0200b009545230e682sm17367686ejc.91.2023.05.03.10.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 10:15:49 -0700 (PDT)
Message-ID: <37f6e22c-433e-f71e-e348-27a23f35c116@redhat.com>
Date: Wed, 3 May 2023 19:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 12/22] hw/hppa: add TULIP as a dependency for HPPA_B160L
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-13-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-13-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: BaUQCQDpWv0q

On 5/3/23 11:12, Alex Bennée wrote:
> These are needed for board creation so fail under "make check" with a
> --without-default-devices build.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Not needed.  Selecting "LSI_SCSI_PCI" however is correct:

bus: main-system-bus
   type System
   dev: ps2-mouse, id ""
   dev: ps2-kbd, id ""
   dev: lasips2, id ""
   dev: fw_cfg_mem, id ""
   dev: serial-mm, id ""
   dev: isabus-bridge, id ""
   dev: dino-pcihost, id ""
     bus: pci
       type PCI
       dev: lsi53c895a, id ""
   dev: lasi-chip, id ""


Paolo
