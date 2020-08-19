Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp66714lfy;
        Tue, 18 Aug 2020 20:07:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjCuTVTesU+C6Q4CtU1GiuRwmhgBsWJyeHSY2rI9j2YCW9JZh0HHNdnAVK0qoO0oak65Mu
X-Received: by 2002:a17:906:414b:: with SMTP id l11mr23204203ejk.334.1597806428743;
        Tue, 18 Aug 2020 20:07:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597806428; cv=none;
        d=google.com; s=arc-20160816;
        b=YKFodE5wpNw42+gWenuKCb0xekr2Z8S8ReqU+rz6j9ujEUcbv3dc6qX3mR5rqWTwuh
         zahTvwTTbHj+pcsNzwiiO7iHh9E5EB6lPWeekZ3hPS8brsXnOr6GUZiKs8tP1mjHfJ5n
         flM3E02PK/HDi9yFnUwkiqNA+WVghRvfWtnjVXF6P9pmx48WXCBAoo390tf4okTY7DoI
         5TU177m18AKzBa0KyvBweR1nvv7NIGo0l/uV5AwhaxHBnmt8ieFLbfg50L8/hIhHc50P
         D2e8yZKE+9vTELPSJQYtrNccZldWrVMAWNPfW2QS+ZYfry+pvh+HNDnKAO7yTQ5CPzib
         WG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=979V5Vd6/uGHDNqVqRyxWv43guOgWI6Yur8ZiVkaDL8=;
        b=MnkumRtRa8LuHErl1RKePFurg7YJJozngRtZVkmnFjN3wM3bVTC7LFw0DORqbnDFzB
         ew2y/wNLwFe1elEkh/d1h2ns1+QIuk9vVhm2D1P7QIvfHqDjfx6/bPgwjuHWtjJmRt12
         PF4kz7y5YHzXaWncYJAp9WyLQuA/X8bHdYWPaEAipOr3jIoaY2oh1/lgjcXgfnSt8efE
         w+d9QMI7x1AACnQnXcyga6o6yjNZACzjbNyLG1TWa4Yz0AtUt+8kj6dZN+eHpk1C2dLN
         qerkAaVXiAhYAUN8W3s4Dgd/qiidNca9X0DIfl3otG+xqVAhGCc8L3yhSc04Ek734qUe
         QaLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i+TcEzuE;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id r9si15174195eji.408.2020.08.18.20.07.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 20:07:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i+TcEzuE;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597806427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=979V5Vd6/uGHDNqVqRyxWv43guOgWI6Yur8ZiVkaDL8=;
	b=i+TcEzuEFzkEHA98MQXDZ5HOGiFyjjuCOzaIriTLIEbDX9Xhr+LHzxiJwBihBlPP69qvUr
	qs41vrWCVup110R5chxTz6ZYOeD5bAeMnUpgWhyxEOttDNKJopKvz96goIbJX0z3R9KzZP
	xUlqlN07Aruvz+4mCPVq3tsayF2sqZg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-A0CpBq1-MHq7Iry1Xb9DSA-1; Tue, 18 Aug 2020 23:07:04 -0400
X-MC-Unique: A0CpBq1-MHq7Iry1Xb9DSA-1
Received: by mail-wr1-f71.google.com with SMTP id b8so8901696wrr.2
        for <alex.bennee@linaro.org>; Tue, 18 Aug 2020 20:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=979V5Vd6/uGHDNqVqRyxWv43guOgWI6Yur8ZiVkaDL8=;
        b=SunJVRr/Xf8d+8CH0M7vuogJAzVO/zElB22rSW8UvwT3a/gziR8o2KWVcvbhSrjtnV
         HFpwt6vXE1J7g+0pRDJdU3jSUMPK57cA3y/x3Y5kg4DglIlqV59xD4fftIUr7qknz38v
         PTCA8MHkRkEcoxOOEqD8SOJonel9iBRnhUbhDPYBzGz9Ykm7L3RtCfgJpGPbOpQx+25l
         80emlJx2CWVex7D3nAl9Pc1ZD/8YRcygNXklD+ppCc6Rv0gZgc/ujs7LV3AfupWe6P6Z
         M5fTh85qiRfel0LKiF4Q6REH207PwHMhhs5+tGfbzw2xOARrELTFGZ6Rw1DX+FMDEojT
         ap/A==
X-Gm-Message-State: AOAM530knkoUwQiu+gPF25/V+ZTDNF0MStbhZRyhJv6rWg5Xr6He2r5z
	945dUeEqDHVez323VGeXLGLVkNCruGUp6oWMkrbpR31eCQEy8Rh2hj9741Rapj/ixNn8ErnCMuR
	uGBjdKLodSzhbi3tC
X-Received: by 2002:a5d:4984:: with SMTP id r4mr22536807wrq.401.1597806422938;
        Tue, 18 Aug 2020 20:07:02 -0700 (PDT)
X-Received: by 2002:a5d:4984:: with SMTP id r4mr22536786wrq.401.1597806422692;
        Tue, 18 Aug 2020 20:07:02 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net. [81.40.121.121])
        by smtp.gmail.com with ESMTPSA id o7sm37683851wrv.50.2020.08.18.20.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 20:07:02 -0700 (PDT)
Subject: Re: [PATCH v5 6/8] sparc/sun4m: Remove main_cpu_reset()
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
 Greg Kurz <groug@kaod.org>
References: <20200819024220.587612-1-bauerman@linux.ibm.com>
 <20200819024220.587612-7-bauerman@linux.ibm.com>
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
Message-ID: <a5bf6f7f-e2a7-4e4d-6ddf-c697cea18b4e@redhat.com>
Date: Wed, 19 Aug 2020 05:07:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819024220.587612-7-bauerman@linux.ibm.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: FRXQFoySkgyr

On 8/19/20 4:42 AM, Thiago Jung Bauermann wrote:
> We rely on cpu_common_reset() to set cs->halted to 0, so main_cpu_reset()
> is pointless.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/sparc/sun4m.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index cf7dfa4af5..22c51dac8a 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -218,15 +218,6 @@ static void dummy_cpu_set_irq(void *opaque, int irq, int level)
>  {
>  }
>  
> -static void main_cpu_reset(void *opaque)
> -{
> -    SPARCCPU *cpu = opaque;
> -    CPUState *cs = CPU(cpu);
> -
> -    cpu_reset(cs);
> -    cs->halted = 0;
> -}
> -
>  static void secondary_cpu_reset(void *opaque)
>  {
>      SPARCCPU *cpu = opaque;
> @@ -827,9 +818,7 @@ static void cpu_devinit(const char *cpu_type, unsigned int id,
>      env = &cpu->env;
>  
>      cpu_sparc_set_id(env, id);
> -    if (id == 0) {
> -        qemu_register_reset(main_cpu_reset, cpu);
> -    } else {
> +    if (id != 0) {
>          qemu_register_reset(secondary_cpu_reset, cpu);
>          cs = CPU(cpu);
>          cs->halted = 1;
> 
