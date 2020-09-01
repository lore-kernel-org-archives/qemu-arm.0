Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4431678lfc;
        Tue, 1 Sep 2020 02:53:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4O6fqnh+vZtDz1IkUfCq6LTe6UT25aTzMZ8W4662Z9zESANPX+d6QCgTXmiMjXq8dPQB1
X-Received: by 2002:a50:8f44:: with SMTP id 62mr1082016edy.3.1598954020421;
        Tue, 01 Sep 2020 02:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598954020; cv=none;
        d=google.com; s=arc-20160816;
        b=BgykaQgk5nvieJCI6/wi8TSCiPlYzLEtPwKnNIdCuRj2pDbVU2hhPnOwQlPfjrWQtJ
         OHFftOuoubwbZNuaNdjtSIGrgE0kFXnImz5jLP2w85fgIGHXuvnONtAgO+BjIJCx2lhW
         dlR9frFT49eI0+S9W8LwH2II4u07lx5jZGJhf5OgELltkA8sGQ0AdYfuBmGGpm8cJWYL
         /8FeBMgQUmCeLBijVW2dqBVkLVbwncXsdNIpygAurZC7Fu2cIDV5QioPV+UasgpE4xmz
         j6H9ud4mcgU7oD/EQU+gejsuYDWDLC1RghXpYbbnV43V9mxIWkfUYl4ZlQXYVXB5caYl
         VHPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=U2JvSN5xxsZuRllPa2OitISYaYAqu9ADlmJOSf23VPQ=;
        b=uIzuEm5zJwhYQQiGIzkrFS8cvhKHIMfAFE7p+1uGTZx+wMlBJAjxhLLz3lxJSzaHhL
         bO+S51EggVZENB5RkdypO2yABC+4BxkVFiDhs6igoE7ZXsyhBy3/oi64B3/oStKZUx3I
         JreS2HcU5ctsdykcUkay1gVlc9AhgCQgR9OGvC3/RtJXqb25gYdLHK4dk7MJMeAss3bf
         7zsWM8nUGA15R5ClpwutzhG3AwqwgwS4aA0ztVivoLYkk9zex+pn2OuHiGXrXsK2GqoI
         mtuMm2T6IayjgwrT1pmrrYlBbaLvT8sL77hiLSXvPGwhbKMUcmjeNIHpG5chyftrIetY
         OpTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NfpsKg+l;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id p26si291302edt.197.2020.09.01.02.53.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2020 02:53:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NfpsKg+l;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598954019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=U2JvSN5xxsZuRllPa2OitISYaYAqu9ADlmJOSf23VPQ=;
	b=NfpsKg+lY0ph53ZajdneENQsnOShgNjgf/RHqW84TUe3LlxbQI4xvuiFXd2IEr4g3N3Gvp
	OObINTbHh6cFGewmSVslllFJ2gPPBQYiwBjLnd/JCKHr6XI+djGFhDGFFjOJmwZYThpfIu
	vEUhmoEAtAGzqfVlTfvcQAgQRHAloRY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-kthqt0g3OBayK1QMDCUTGg-1; Tue, 01 Sep 2020 05:53:37 -0400
X-MC-Unique: kthqt0g3OBayK1QMDCUTGg-1
Received: by mail-wm1-f69.google.com with SMTP id q7so215023wmc.6
        for <alex.bennee@linaro.org>; Tue, 01 Sep 2020 02:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=U2JvSN5xxsZuRllPa2OitISYaYAqu9ADlmJOSf23VPQ=;
        b=NXa/OvT1m/7ALsSSkKfb+neAXmIBIP9tdrfNvUVl6BmoGjLWqBN8kPkcT0484F+a8Q
         65pwmsAAC5mVzU4ydnbiqMGoXDs07ImeRUy79qCiXA83ZHHfuJyszUibWGDfWccb6R4r
         0eCu/YYEu3MG7BDsmRdgwwxd5BKg9JbIKdWw5ihNBafls8zWrEuhgFDz+ZhODUAJ7sZo
         A6iDZBzoqu91Xv7yDLKDhgOCEEdjjoIINFwX+AkqEAYufiG9NeAvj/UNY/EsZBHoCjD/
         xEeP7OM6oyFgWNCG6DR2TxQkrWoo848+E0GSjAFrNogp8G78BanJSfcmD9MRobjh15WT
         iXWQ==
X-Gm-Message-State: AOAM531VHfL7M+hAjNQNJci0/UuqtOc0+/PIlB3AEjAw5cy64tXvGyyY
	qjSXbSLp3n1heeZa4C1QNbWEyec54kKGtI5crDO6gxlzPni2A84SNv6OghXm3A18h/ffCfxHEcn
	Ppu1aPbxvJmXa4gXB
X-Received: by 2002:adf:ec90:: with SMTP id z16mr932455wrn.145.1598954016735;
        Tue, 01 Sep 2020 02:53:36 -0700 (PDT)
X-Received: by 2002:adf:ec90:: with SMTP id z16mr932432wrn.145.1598954016539;
        Tue, 01 Sep 2020 02:53:36 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net. [83.52.54.50])
        by smtp.gmail.com with ESMTPSA id v24sm1685736wrd.6.2020.09.01.02.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 02:53:36 -0700 (PDT)
Subject: Re: [PATCH v7 6/8] sparc/sun4m: Don't set cs->halted = 0 in
 main_cpu_reset()
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Greg Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20200826055535.951207-1-bauerman@linux.ibm.com>
 <20200826055535.951207-7-bauerman@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <38442764-f54a-c3ab-01eb-8e9a1d1fc854@redhat.com>
Date: Tue, 1 Sep 2020 11:53:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826055535.951207-7-bauerman@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: 4NSiwBd1kIn8

On 8/26/20 7:55 AM, Thiago Jung Bauermann wrote:
> We rely on cpu_common_reset() to set cs->halted to 0, it's redundant to do
> it in main_cpu_reset().
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  hw/sparc/sun4m.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index cf7dfa4af5..7484aa4438 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -224,7 +224,6 @@ static void main_cpu_reset(void *opaque)
>      CPUState *cs = CPU(cpu);
>  
>      cpu_reset(cs);
> -    cs->halted = 0;
>  }
>  
>  static void secondary_cpu_reset(void *opaque)
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
