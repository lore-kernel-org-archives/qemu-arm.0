Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp10302761wrx;
        Sun, 10 Mar 2019 03:57:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqysPRuf3mJwWJJIjfxu3OODIbazv9NobeU3emyAqGVfDUrTVDP5tb9htHCBhRY6gtjunyFh
X-Received: by 2002:a25:6dd4:: with SMTP id i203mr22477456ybc.440.1552215465627;
        Sun, 10 Mar 2019 03:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552215465; cv=none;
        d=google.com; s=arc-20160816;
        b=UUa+EkV/D0pQ0EA/n6Viuw3eYyci2AgBHpPaArsSm3MyACMqPnFOTqylbxnmM5bRD4
         YCN5Ek3eBAzstngd70mN94stFz1vrtk0vvf80xJ1tPsOamOXTxavLIbklKwnLQ86n1Od
         jEgRyN/uMR1aXLuzucPmx3VCgv04iRkJO02oMHbmbSTZKejfMpPOVHV2371Nwn7Djgvz
         96qOGTyVOIloZY+AItwxpkqdOcF5siIsEA32AkhRjMgPWoqUPhHdVYkV/AVztj5Mb9Io
         6xfGegAkDKlqrAj8vFilqtfC3A6rZc5qu0X4KCwCdNdbxgShIDPVUtsMnXSf1AgBc8eO
         Y8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=uLDA4k1kxn6wQaN/Jeo7JdZWfg7gvoWBlxd+XpVJ+lA=;
        b=XYeLOAREyylP3vDH8ulWlDobv8q9K/7D9cjmQiOCOmcvqYmzCxPqyR5Z2lPz6bUglC
         Y/LWb/26PPsNbN+Vcl4kCo4kIZnnuNINeumg2dOpNFMObC5hGGGUCgrJRbPF/e1bjkuY
         lIWVfEEfKOIB8IQjw2bWCp2AFyRiJa8Ec45MIIcE1nWb3z2v2DsS0Kt9sOOI+MaBkEZA
         FOl+wTo4flX66YEqLoO1QZs7KkcL4ftFWadqvC0qV0ZmaVH64L9nAjjaKYxHhgk1qCD8
         bSgVXUBpll3coev1+Fzlho2rXwSm5Z28a4yVJfEf6oDOzRENeJFzljXiDzYzWpq5VV7U
         FYbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9si1564759ywc.297.2019.03.10.03.57.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Mar 2019 03:57:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2w9J-0008E6-58
	for alex.bennee@linaro.org; Sun, 10 Mar 2019 06:57:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h2w8l-0007zM-87
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 06:57:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h2w8k-0004pG-9J
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 06:57:11 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:44017)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h2w8d-0004lN-Pn; Sun, 10 Mar 2019 06:57:04 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1MOiYD-1hQnRO1mNL-00QFaw; Sun, 10 Mar 2019 11:56:57 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20190309181920.30553-1-philmd@redhat.com>
	<20190309181920.30553-3-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f5c474da-1a8c-6b8d-0027-cff9c7bf974f@vivier.eu>
Date: Sun, 10 Mar 2019 11:56:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190309181920.30553-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BmmpZcUsSug+pAGASCrBLUQLUDe1i64NwfZrl5fK/jh3Yfwg5I0
	kLA7T6riym/6p8lwWI3WbhzKSlgljeZOBIjo7M9Yzl+wjMzRExtm7CSBN61QUSfg1pGFYEq
	r5krPbaL4/sBI7EvtWEBL0Ck7askxT+XkREN+nt0yXvwwNgC/Vp5uw0EGOpZab39PR+gPs4
	8HGH7WACVhhaARDojXTJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V0fPkH8KMjQ=:P7VyK5OFd7Ih80nPw6rWt8
	bmAjx23170nCPIFfY1qcCIWOnNmS7QA+RMlBXagB+Jfme6S5uqXm5JSNKSSjEsSPmj0h9+5CD
	ezAjiig8aoNwU/aHbpE25XvdD68ySSDBXXia6JmlMiV88Y+FyrFY/tuCq7LtIhBAvRRlP7bBJ
	Pr2nTVRQ3AK7nRtSPTMaNiLsVLqOrVoHS7AJsLyVHNefriVdFIP1mC4pJ3UAjKOWZkDjW5dVe
	j6Y8j0FhIqR5NdVj0N7s/NE9qRWVOUGKZRABakHXLhySDsEPRwGEdfvDnaPqyxMff1JIbJvUk
	+KsGQmhiOfcQVI0Kf71E8VCt58beFwZpIRbhH0CD4tf+Lv51tqoEdwwVlIjJPxSBWAIMX5v9y
	2APu4l6S1PI57pzVllYjieJIpQIpbw8USphxYYdJtJJu2L0swQQsruEbQguK3IQ247h5kOwmi
	IP293VOdRqfoiUckFo579d9XeYDkRF/aIQgZ4te7sC3aUZOV7VApGnj4Nbv+I43ZIoa0tAUkM
	ZmQBGoizGdC8gXBt9NZ7/mgpyOXnrOLqhG473vvwHTQKyhJf9hgeupbVO5sr/7zDWzc2jglaL
	nECSTSMv+t0cMVZE/LIJpRzvsAPxe66MmJwgIINGooTdnvbTJVVZQW1Aeg5fwmirjjgoxrhBX
	v2Qqtm1vXvgscinBU8DUDTJTYpojoy+1HYQKgDgVDhBBEbECe3+iA03MTdwEQM0XOE8MB0F0y
	nv+wwAAamczA0QHR4+YLlnB4qyqslH71YgaDLxPEi1j69q6naa8qsg8rC7Q=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-arm] [PATCH v3 2/2] hw/nvram/fw_cfg: Use the ldst API
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-arm@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o30i/D5hbwNS

On 09/03/2019 19:19, Philippe Mathieu-Daudé wrote:
> The load/store API eases code review.
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/nvram/fw_cfg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 7fdf04adc9..3d8859e333 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -85,7 +85,7 @@ static char *read_splashfile(char *filename, gsize *file_sizep,
>      }
>  
>      /* check magic ID */
> -    filehead = ((content[0] & 0xff) + (content[1] << 8)) & 0xffff;
> +    filehead = lduw_le_p(content);
>      if (filehead == 0xd8ff) {
>          file_type = JPG_FILE;
>      } else if (filehead == 0x4d42) {
> @@ -96,7 +96,7 @@ static char *read_splashfile(char *filename, gsize *file_sizep,
>  
>      /* check BMP bpp */
>      if (file_type == BMP_FILE) {
> -        bmp_bpp = (content[28] + (content[29] << 8)) & 0xffff;
> +        bmp_bpp = lduw_le_p(&content[28]);
>          if (bmp_bpp != 24) {
>              goto error;
>          }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent
