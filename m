Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3847615njb;
        Tue, 10 Dec 2024 22:39:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyZyeRACpGgmAC0hFAC3EWctB5pCn+ELIk0wAojvXYXTLxudgNYyPVCUTMp/kvsX0YOGme
X-Received: by 2002:a05:620a:8012:b0:7b6:cdd4:bdd8 with SMTP id af79cd13be357-7b6eb443c69mr324393085a.16.1733899157553;
        Tue, 10 Dec 2024 22:39:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733899157; cv=none;
        d=google.com; s=arc-20240605;
        b=IAo9aNJt5r7vUBm/YE9yhkTklnEbTm5KRTasJgPCWB8sAzJUgaWBTTqV77x9X0QQoe
         cdib8PlDtjKtAfF2WC3wxn6gIz8cS8v62wgmfmTwn9dFSrZH/w0owXDrJu+TZnQn9ER3
         nN+G9B8PZp0jq17QNprWTgEyj6oHrL2uoJgoDf2dbZCROV3WYpQGgRn1iV8D3P3LJT28
         nLauAqtOkNIoMEvlUkPoFL/Pk7bYQ46nn0afWEqSS/MgvxjNTvhdlrzZMTRpF2/rSmn8
         4KZ7c+tAcJoGp6UGPDIdiqu/oiYIfcbEpwab/qmsaNI7TpbP4Vsmwj4X4cE+ILMWDyev
         D0fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=UXnWtbx06o0UTk1/qIEPiBZDQledSmt1TCdALnCN/Cc=;
        fh=PyRPp6p7Zb4yzib6tbXvkfdudwkdHT8PPxsBOu3pTV0=;
        b=DXR1crQQrdS6W2sThLVcuxHQzmb0tnGc3/N0CKiO35fjhotYFo0W0NdYOLVyobXfhe
         snCuy7BQvcb1Pj9buybqgkhIsJYrClBX3SS+PYTB8AAn4DvoG1xjnO1agybGTsjhB1Ue
         Bd73CzoOsFLyA68rygrgmXk8JG/QFO8ze6yHqMca92nD9zf57BvrEO+HbcwJuCkbwIYI
         tICVMsZjUumi5ArhjpRoB0DhVkYjLS40RJdg9bbBoGH7gndmbgF/CEUd6Y9ndYTRDRAX
         0Etcx8DRI7fXQCXU8vifUUC+kMKA9+bj4udLUZyMZSX+B3/gjoll2GXJG2CPXLXy/1RB
         DLXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NMWwdqo/";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b6ecb6281dsi79795885a.386.2024.12.10.22.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 22:39:17 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="NMWwdqo/";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733899157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UXnWtbx06o0UTk1/qIEPiBZDQledSmt1TCdALnCN/Cc=;
	b=NMWwdqo/rkLA4FZYoDx1xZo82/IJDIcP8gV5ksrdRzwkhrTn8sIhnQLyrrI/ihJsGe6yAd
	NuALHGglnJk1+02rTbRx9DEs9Oyf+zOvqwx9ymhR7UUUlDAv5tzeY9JVLAi5A6Pvu4LG0h
	cWv/LsPK+yOCHQAHlmaNPwO6NFwYWk4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-OeQqsBjaNN-4lhmdvKUtBw-1; Wed, 11 Dec 2024 01:39:16 -0500
X-MC-Unique: OeQqsBjaNN-4lhmdvKUtBw-1
X-Mimecast-MFC-AGG-ID: OeQqsBjaNN-4lhmdvKUtBw
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa680c6aa0eso383340566b.0
        for <alex.bennee@linaro.org>; Tue, 10 Dec 2024 22:39:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733899155; x=1734503955;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXnWtbx06o0UTk1/qIEPiBZDQledSmt1TCdALnCN/Cc=;
        b=CLdSop+PL8o/swYGXqrM16/cPPvpkamYBk8i1BWl2oOUwZnEi9C7FYPtvXc018ufPQ
         UFqGP4vlVyH+6v2a/4fUqb99WxQ/O6+OU8MTBPKR+k/gcXx6m+GdwpVJycbAnSNrCj1t
         4KSOKA6mhjbhRQvc4fMMm8/6JQBgny5q0zOoz4o/b9pktZdDX/Ekk0l/JjLECU5BJ1aF
         aOxenu91Xa0uLQYuDoA+oSpSs0OzCYdu32Hom7nL5FGgaJB0aAnOB7X8vZ2ASzf3NFcd
         qWOfIkbNbE6avvgRFgUo1j3DyQMvQkaiw2SO2FLldRWaXzcZOJWTrHZQAAk0GHX596Dm
         S1OA==
X-Gm-Message-State: AOJu0YxNAik+It/QKVq4Odaeugb6BJ6eZ6rDtBjeqxr6sQTKj6nziOX+
	JeAB7yBqgvZsFXsb0GXm+ckegWAt0YhpGp3uAtmkRh5LNvGNSbYL0PJx3awXNNBllfHaHvAuNtH
	czHWEnAypqgWAfCB7r4bPVFSCP8Z16RUiFtwkJ1dcsZf9E5tSgrI7+atmdqA4y1UFaGEXKo59kU
	JZnxanN1OkX69wbDjsYqntXIk3O+zaXJSZiw==
X-Gm-Gg: ASbGnct8pTSArk9kN5bGoBlLBR+8tdkNRM6lDENaw84oyLyni4LEXmODowwrNVQUuXE
	LLSM3DipBxc2c1DUNAaakYA4fxI2EOFI8NQmCOUT9oTr+Rsd1/Ej5gvAUNQVExxG0pdgM1bys68
	k8s9sQBUTTYQHziQY65ps2TTkJk2le071il2otn+RQcrmjLE0/rcqaK1aS0H/UP59EFR5G7cHjQ
	gdl3onb+Pur6fXzBByGmFGGYZmXK+1nMKQQERv3kmL6XtL/kpukARkDHXf4bk5B+jGJZh8zmyDQ
	U6KgIoE=
X-Received: by 2002:a17:906:1ba2:b0:aa6:8bb4:503d with SMTP id a640c23a62f3a-aa6b115b189mr134677066b.2.1733899154837;
        Tue, 10 Dec 2024 22:39:14 -0800 (PST)
X-Received: by 2002:a17:906:1ba2:b0:aa6:8bb4:503d with SMTP id a640c23a62f3a-aa6b115b189mr134670666b.2.1733899154305;
        Tue, 10 Dec 2024 22:39:14 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-42-51-17.web.vodafone.de. [109.42.51.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6701b08c2sm556535166b.124.2024.12.10.22.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 22:39:13 -0800 (PST)
Message-ID: <0509c96e-46d0-45ca-a768-9d443499b648@redhat.com>
Date: Wed, 11 Dec 2024 07:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/20] tests/functional: remove hacky sleep from the tests
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Eric Farman
 <farman@linux.ibm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bernhard Beschow <shentey@gmail.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
 <20241210204349.723590-20-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241210204349.723590-20-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IY2BR-hbTDN9ioNGsHSnWR_lzAX7JzqMKdfq2i9vfrU_1733899155
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: S3T7fWZ8B+jL

On 10/12/2024 21.43, Alex Bennée wrote:
> We have proper detection of prompts now so we don't need to guess with
> sleep() sprinkled through the test. The extra step of calling halt is
> just to flush the final bits of the log (although the last line is
> still missed).
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/test_aarch64_virt.py | 22 ++++++++++------------
>   1 file changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
