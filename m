Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp10301700wrx;
        Sun, 10 Mar 2019 03:55:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyyV8SXlOFw5ApU9CadEv6zQKbpCYrPNf5gbrFOtt0AWVXfJi1y9knHCGub65odJP0Sbc9U
X-Received: by 2002:a81:6241:: with SMTP id w62mr5948459ywb.225.1552215342486;
        Sun, 10 Mar 2019 03:55:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552215342; cv=none;
        d=google.com; s=arc-20160816;
        b=nP6Q1Hlv9BdYmNWYcUHo4N6Fgr0GqHRfzfzBQabdx3aSY6YEhlPsJ9tEBrjw3dvOt6
         +XfEYWqHxOJ24I/8Ed/kTZB5jvnKTrpeqUX6ElAsT/m1SlYPasW9SjBjpxUUVM0TRJUD
         Z5rZbddXQvjkp2rTtLWE7dbna2zee/F38I8OhCxbNSceq+iVWvwp/lnK8MXdbfb1NcVs
         mmKBmnGzMdcxYiWVDDXcYn1XUJTN8zGEuuHop+wlmu2OAUEcRkv7R8TW1gdRCKHqqA2K
         kDNnzKOdymk4/LhO42h+BX01/MRsKo80fFFhKnlu6x2QQdpOI8Y+BFx7glcO1sVEbbap
         4hSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=JfTqazNPwYeI/42PiQ/2l+b6wDok9zUfkxYBcfXUoE8=;
        b=XYNhDjVOlQVeE4jQftt3satuNu7AI1Zv1eWPhF0xevctzQpF+15Ax9GzEexSs9c8nL
         4NeQUAaZyWVVbLhQyLNQ9/YCQybge+zBhAmY81mmalFmlX6qZBJwPRS9sg+2Ni3h14hA
         MU19PS5OkS9Y8XH4pEXTF3CdINmOoD7jO13Y2QYQ4oW1kkf96YIu2boYtQoiBaBsxU3j
         P58SnPczJr4eABptNl4yxwVFLvyz28dILTsLyLykKrCdkAXiHMPMRlC2ssJcZZ3k559l
         2447diQg+q5hEQRzQ/PqNTiJT7Qig1eoks19O5ne9wzMPeQSyGCk6CoG5FQa48eFaYy4
         uDTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b186si1519144ywd.36.2019.03.10.03.55.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Mar 2019 03:55:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43545 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2w7J-0006wd-V2
	for alex.bennee@linaro.org; Sun, 10 Mar 2019 06:55:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h2w6y-0006vB-Ec
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 06:55:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h2w6x-0003uK-4h
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 06:55:20 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:55373)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h2w6u-0003rU-HL; Sun, 10 Mar 2019 06:55:16 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1MUXlG-1hTEQz1zYu-00QUwm; Sun, 10 Mar 2019 11:55:05 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20190309181920.30553-1-philmd@redhat.com>
	<20190309181920.30553-2-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <33a2a087-1552-dbbc-ba62-470046e31ff9@vivier.eu>
Date: Sun, 10 Mar 2019 11:55:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190309181920.30553-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qVojMqhIuIdtwpAWDILQLedB6JQjrP/C9PQydpF66Gf8SJeP5Xu
	+1ONjnf/8lWMmOO7o8vmXjZwOuOPzGr7oUr9I6hBx4leKomN1RGvlKreuZeRT2ZBYvmch5j
	U4daWWwoPK05/d6I1Btj/DeCZmr82gSr9YVxp0R3RYiwRUJuxfnfDqn+TwLTWNUbTa3Xdkn
	0vh615sSipGIsC053IuFg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vMwbJAX52yk=:EB1DVug9ZVoHv3EkpL5MYp
	xDPrUgDxuFkWczKNW/IpffuwewXr0qapQ/5g36fSw9DmIzZ+zFfVo7UAXpb1wdEf3N/rQOO47
	xZ59J036ML+qdZwHBeTCWNqbQMKENlv0qgj6LyBML5n9WM0JNjxpyz1cgVvQyUMmqUad723nu
	Ec36DQwWeSBuyRsy71W4uDx3+fQnkaqyWFxmnBoSMvgwnzl7R4Bra1NMapmN5RGzN7TFOSdBo
	pLtq6TCFAj1Zew5gWTqz2RXOrJDG/H1pL3FH2x9htx6v4IYP9p/jTeU/wstn97o3qVzQCYUH8
	XDyFD75BirCKjgJNG94xijZ9KoBjAnVzrjy30wuIovgoU0/s0m6WLs3pqlT/LrW3iWV9O6/jO
	ops2PjfPaDTYmfD5wgNxywWdvl79Us13iJnQXulAMItGLTV8OFkpUPKDfTilcWCJvDF+zU2ie
	n/hIv9z0+69z/g+tlJV5dmP/IaSgeRTVLVE6z1fKZJihTFPQG+GUXTITyFCxs4cUOqpo7ScZs
	Ghs1LD/GGQnvIA+/bbC6+aPvRsWPYHhXqfWm+fG3avkHSltvE1F7ZnRhox+WwhGWgduMcDJWy
	8kLz/qI2yyfXHx5yJ+nHdklnUtOUZ62j6/yYP6tjTbWZaSKzOfIozdySAahm8rRT+IFbCI+Zl
	Iw256W7ZyVZTkdH0BfCYbxZ/zTc+6/8FCH8iqnJKx/GDNfKO0qqhgaYL7y5MvigpB6NpqK5S7
	rfrDK88zhKKJMO8U8MQVnmrUzrqwQe+fbW+HntoJverQ6ILWu7J4ZwZZBHo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-arm] [PATCH v3 1/2] hw/arm/virt: Remove null-check in
 virt_build_smbios()
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
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VC/lEYScOoB/

On 09/03/2019 19:19, Philippe Mathieu-Daudé wrote:
> Since commit 578f3c7b0835 ("arm: add fw_cfg to "virt" board",
> 2014-12-22), the machvirt_init() unconditionally creates the
> fw_cfg object.  Later, commit c30e15658b1b ("smbios: implement
> smbios support for mach-virt", 2015-09-07) added a superfluous
> null-check on it.
> Remove this superfluous check.
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: Corrected commit reference (Laszlo)
> v3: Dropped 'Fixes:' (Markus)
> ---
>  hw/arm/virt.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7f66ddad89..377e95a4cd 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1281,10 +1281,6 @@ static void virt_build_smbios(VirtMachineState *vms)
>      size_t smbios_tables_len, smbios_anchor_len;
>      const char *product = "QEMU Virtual Machine";
>  
> -    if (!vms->fw_cfg) {
> -        return;
> -    }
> -
>      if (kvm_enabled()) {
>          product = "KVM Virtual Machine";
>      }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent
