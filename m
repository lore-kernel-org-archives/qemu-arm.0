Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1984532ejt;
        Tue, 28 Nov 2023 07:51:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/K1oc+9A4x7G2Gi5R+MjWQn8vFCjWsdd0/AOiBfNk66nSc0fURBalz3qNMzyQI6EbFVFp
X-Received: by 2002:a05:620a:440b:b0:77d:98f2:8624 with SMTP id v11-20020a05620a440b00b0077d98f28624mr14869120qkp.17.1701186665880;
        Tue, 28 Nov 2023 07:51:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701186665; cv=none;
        d=google.com; s=arc-20160816;
        b=gR4XyYMrNVBmB+N76opyukFrFHc2P8V8nVY3Eu6cCo6btJPejsK5YcdzSKxLXJhw4c
         wn25mm5KnYT173w+ytUxBAQ8iCQtaWJ/WhlzhwqOwKmHiPlOCifTGEdlXhNKdwuGUdML
         +ui20TefQjoGOjaHJWN2SaZTDw8Zo0GFupkykOjqkCe8z14LN/hGMW83zYcLM+TwDiPn
         3uren6Sg08ZrtSRY0iV2VJaHV29sTr+IpjghI4mNWGm+iH8r+rydA/n33d6/LtKcKMDR
         bvyBsUrMFSN2XwYhCC/M3juwKVuSbnM5Yt9Ajj0OGlXc3mI7ChpLPOLpv6FqIqLKY6zu
         ZMFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=a7TaJ1fftDKYLjchnWgAH2T0JUqr3+5SdVc0/8Z4EIs=;
        fh=wV6b0TL7corVRWTR29RPx4Qkj2+2+kgqvIqkMoPpvnQ=;
        b=edBZYMMdfjAx7akR61ZXG2Jby3j1x+uM7FVNaMurVl2vhBnupDHDbBgmQd7U4PdL+A
         SIUC5qrId0bH6Ap5qG66gxi1KM0euYRMFITm/8VC0MMlxl0zYPBP+O8Yo7qiDSAWqoZR
         Hh0FR/ahIDfkxb9pvq9Gd9PNZh5oCKgmsf98BtDceKsYKGgzjEW2dpuT382WZfg49ZUj
         04UoKcZ+oiI1UtaBe4omOQITkevDknZggYeVQXvveE5ieOyuXU4BH9FcAjWOquX3wkxP
         5VtJI+rM7dsUXBAXa6Spd8PKMWTM443iUQVXmM13nm53cFYW/I0aAST2nVNMcl/aKfDs
         NseA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g2FtqkKm;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bk15-20020a05620a1a0f00b0077d7da0e988si6237187qkb.337.2023.11.28.07.51.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 07:51:05 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g2FtqkKm;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701186665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a7TaJ1fftDKYLjchnWgAH2T0JUqr3+5SdVc0/8Z4EIs=;
	b=g2FtqkKmMfVEwbeSWHRRRFzal+8CFPa2CspgBH++J3x8CMkl3YJhJAu3jTltdvmMAhlQoV
	cCu4wHUH7AEK3M9JNtwW1VAWHP6YrsgUpJwmRWvR3snPkgfqukHsMQGd1PM4QcgGLKOfJk
	gk7+Ls3r4CfWftxRqM3+qX9E775u0lI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-IibiVLHWNvuT1FnNGAM1Ug-1; Tue, 28 Nov 2023 10:51:04 -0500
X-MC-Unique: IibiVLHWNvuT1FnNGAM1Ug-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9fffa4c4f28so418401566b.3
        for <alex.bennee@linaro.org>; Tue, 28 Nov 2023 07:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701186663; x=1701791463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7TaJ1fftDKYLjchnWgAH2T0JUqr3+5SdVc0/8Z4EIs=;
        b=Bc27PtMjYSmdr+ISQldwMenGrplkm/cF/HmjXmXX7CY4dEhPbM2fSdJGIggFrvdL+u
         PUjDc4mfBx3ilUDm26sZ8pwI+OKFz1mSVpTRIygpeKQooHZ+4pbuZXICeAjEgIXHnYFl
         Wm4Nybhu+JoC3ButevXnOfiY5GMRPC8xMI3Pn6OI5P9S9x33rsDK+EAWl18NfDavc7ae
         T81MjQ8Al3vApiO/IgiAoeEIjVUnZV2NcyDJbxiGjztIM0hP+7bKiklTtYMJvQjg9XwK
         JXCMpeiwueut/+X2VLnAClo40WE2gZAVW/wDEc8whMA9pCNDMFcj78uw/VpI668jLt4A
         NZqg==
X-Gm-Message-State: AOJu0Yzr6xAtmiLkyy8g3DFpGE+mkxRe1qGxpvfSCx6fBixkAbejNoPJ
	DF7w9EaslI2+2iF8tokPUpEKrNvuK4LSeGQgxzoNbMt+SZkoesdqRF760gOysEMscojAI0XTyDb
	56/YtUBCCUVFlSQNU
X-Received: by 2002:a17:906:eb08:b0:9fd:5708:cefd with SMTP id mb8-20020a170906eb0800b009fd5708cefdmr10544120ejb.76.1701186662903;
        Tue, 28 Nov 2023 07:51:02 -0800 (PST)
X-Received: by 2002:a17:906:eb08:b0:9fd:5708:cefd with SMTP id mb8-20020a170906eb0800b009fd5708cefdmr10544093ejb.76.1701186662648;
        Tue, 28 Nov 2023 07:51:02 -0800 (PST)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id cd19-20020a170906b35300b009ff783d892esm7045461ejb.146.2023.11.28.07.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 07:51:02 -0800 (PST)
Date: Tue, 28 Nov 2023 16:50:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini
 <pbonzini@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>, David Hildenbrand
 <david@redhat.com>, Peter Xu <peterx@redhat.com>, Anton Johansson
 <anjo@rev.ng>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, Marek Vasut <marex@denx.de>, David Gibson
 <david@gibson.dropbear.id.au>, Brian Cain <bcain@quicinc.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Claudio Fontana <cfontana@suse.de>, Daniel
 Henrique Barboza <dbarboza@ventanamicro.com>, Artyom Tarasenko
 <atar4qemu@gmail.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Aurelien
 Jarno <aurelien@aurel32.net>, Ilya Leoshkevich <iii@linux.ibm.com>, Daniel
 Henrique Barboza <danielhb413@gmail.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater
 <clg@kaod.org>, Alistair Francis <alistair.francis@wdc.com>, Alessandro Di
 Federico <ale@rev.ng>, Song Gao <gaosong@loongson.cn>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Chris Wulff <crwulff@gmail.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org, Yanan Wang
 <wangyanan55@huawei.com>, Luc Michel <luc@lmichel.fr>, Weiwei Li
 <liweiwei@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>, Stafford Horne
 <shorne@gmail.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, "Daniel P .
 Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Bernhard Beschow <shentey@gmail.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Nicholas Piggin
 <npiggin@gmail.com>, Greg Kurz <groug@kaod.org>, Michael Rolnik
 <mrolnik@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Markus
 Armbruster <armbru@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 03/22] target/i386/kvm: Correct comment in
 kvm_cpu_realize()
Message-ID: <20231128165059.0d991a0c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230918160257.30127-4-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
	<20230918160257.30127-4-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: l8NEOmvkCij5

On Mon, 18 Sep 2023 18:02:36 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  target/i386/kvm/kvm-cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
> index 7237378a7d..1fe62ce176 100644
> --- a/target/i386/kvm/kvm-cpu.c
> +++ b/target/i386/kvm/kvm-cpu.c
> @@ -37,6 +37,7 @@ static bool kvm_cpu_realizefn(CPUState *cs, Error **err=
p)
>       *  -> cpu_exec_realizefn():
>       *            -> accel_cpu_realizefn()
>       *               kvm_cpu_realizefn() -> host_cpu_realizefn()
> +     *  -> cpu_common_realizefn()
>       *  -> check/update ucode_rev, phys_bits, mwait
>       */
>      if (cpu->max_features) {
