Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp365819ejc;
        Wed, 12 Jun 2024 05:49:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKsdwWuJAQyCOecYuQfyAYT9NHbecID1SmZ8mUjdT7ire+7mxvhh1lW7lrwOAyGU5ZZ1tUXIcKIQ1UFTzLY7Bkl6Kqn44u
X-Google-Smtp-Source: AGHT+IEyZ8eFZVk4CLEYUeuDT06CKwfk9B6ZmiG8aOE0CfMC9hleMDZlio0f9uesi2Zzf9MQVtOd
X-Received: by 2002:ac8:5781:0:b0:441:78:4e01 with SMTP id d75a77b69052e-4415ac6cfe7mr22344501cf.56.1718196551685;
        Wed, 12 Jun 2024 05:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718196551; cv=none;
        d=google.com; s=arc-20160816;
        b=gZzhG5DoaGC83jLok7GeIA8W+hKHlJ9dcEemKVGbGVL1j4EY7WIJ5fF/HAHT3sLWKY
         CgdwsD5zTnrNCsgcQEDn/QehZ1W2Z/urPwG4MBSKLA1LolOls42kxamlISwkKU32dACD
         V/OKFCAspYfbdtArRIl25rA0DcKAPi871MmxieFE24DbBe+Ogp0t/U1HpwVDNVUnGzPd
         WUxuie4Gz/5TctDtQHWwhF65PHAjIC/rlUlp+Zz5LpCcWTL0qDzzWFBJZCjo/eE3oJrr
         uFXuxmLerqN3NSpjKO3YJlw18CLOmsgfxfBfYB601WXQEastDkldaxApiWETHMgXKMnj
         hYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=VJKu1EI5WiRS6emBcQ8li8fqo56Fg1wL9feC7WT0qL0=;
        fh=sG8+SMHOMxL20vVfKEMgKW+9avo4kTp8TQE0e+HG1hM=;
        b=gTvG6PpoJdv5waMlHNtLCzH0OhT0qTrT9RU+j9RQVSKMBIv/1LezdBqy+2XuZEJGiG
         EBq4O8pZMuFHswqEkZwgZo56am1fNPS6UbiNMSzx8HBJcpmyR5jqzc9usazyGWbPR6he
         LDyl1A5BNqiQzmNLdBTdbVtCC5gY3pMWu1eIm0dMoXwLzQBIJnryzHeNu4p8mEv2ByU2
         y4bJMugEtkPFLnGI6xWuaIaOWTWMGiuNUNnMY7EdbXZ/FeI8t+ec4LPtIgjUuCeaZvIH
         HQqtvk5pYhFTY9Agw+Qt91z0shaH6QCBs7Qlo19jBuQQhdjbaRJM7qF9qSjwnxW1gIZs
         9+6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sjjODgjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44038b16975si155021721cf.246.2024.06.12.05.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 05:49:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sjjODgjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHNPK-0005Te-VD; Wed, 12 Jun 2024 08:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sHNPJ-0005T0-Tn
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 08:48:53 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sHNPI-0005tP-9Y
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 08:48:53 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5751bcb3139so2814630a12.1
 for <qemu-arm@nongnu.org>; Wed, 12 Jun 2024 05:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718196531; x=1718801331; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VJKu1EI5WiRS6emBcQ8li8fqo56Fg1wL9feC7WT0qL0=;
 b=sjjODgjJTzJsfQxaHF92wunFkKDI5KTDr9BwlPzhPeOR+Sok00O9si15/mDoOcc2XH
 jXz/KlMG2R13NTztwgAHxIanKjYkKC3X1X5+CfF8JiCXLPEzb4iIP4PbAJhmEUgVyOYQ
 VB5AxC1rB6PrJVG9FsvQ/VXc/vn7lt7imMwxkx16ugJ2LbnspixAuJQNxT9F6Jqn2Rcj
 3gZj9yqApzZJbC5zx9whcfDxa4zXqIEr0V8yRU9XeHRWICy6Hsv6p2m4hrhkJMXEUR0v
 bzyBlFWFlkOjFimzMwHoSrdUqyCedIlH1w8VUi435p7/yN8bdJKFAlcahD5pL8XS5bLJ
 ereg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718196531; x=1718801331;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VJKu1EI5WiRS6emBcQ8li8fqo56Fg1wL9feC7WT0qL0=;
 b=SnHi6zPv7bTyCljEO67wZiw92Sxuo/mRdE4iJrXaz8Kkq0actcQ61l4Z7wl46vjzqj
 X6ZKRiTi8vCNc6jNOHN123NR2IznBs66FipZZ/jGi3fACv8qYw/2m9iQgWcs6Wt74Tke
 LdLeUc/PbBK9j7x9UDuSdRcXIuN3o8vR4T/T/EWhBz+U9Yu6gUEpccBq4TrNvSO0sSnx
 bDtt8ZOgpqBCp/6oerWHpswnp+nJlUh2ANZ0oFjnPwXeejTm4hjgm0/NYDhTXFyyahER
 12ayBIbA2U7xLzErPurQgdndAGSHjkwY0E6yMi1Uj+QOORw45Nmnrc8bzVZ3LuHKoA9w
 dyBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD4NAxNj9x9P5VyffJtTXFl/uElDabbu4fkbF2R2RbjPVbZBND2/OaWs37yatxAmr0Wg+oi9j3S5j74cRgbOxFds0a
X-Gm-Message-State: AOJu0Yx+h1riC18f2RgwkoNKBeKSYJDgQ5N4XxhKwlIWXgbs3gSExS6n
 KOv9J7jMHvKi/oXS4NPA2Yjm6FN9dSjMiv5OKfaLq9WX+gUHR/ChQSUhzzfVQ2EEzLZUN6fpT/e
 PEpvSxoIRKYF0DFlS9QN8jQ1VxZg2D/vINf3uQg==
X-Received: by 2002:a50:aa9d:0:b0:57a:2a46:701 with SMTP id
 4fb4d7f45d1cf-57ca9769334mr1164669a12.19.1718196530638; Wed, 12 Jun 2024
 05:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240612020506.307793-1-zhenyzha@redhat.com>
 <69649622-e52c-4d24-809b-3d8a97786a69@linaro.org>
In-Reply-To: <69649622-e52c-4d24-809b-3d8a97786a69@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Jun 2024 13:48:37 +0100
Message-ID: <CAFEAcA9wEjONgLfTObNYwJbwn5Gs1BDJiDivc9PEwmfOeZW6ww@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm/virt: Avoid unexpected warning from Linux guest
 on host with Fujitsu CPUs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Zhenyu Zhang <zhenyzha@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 robin.murphy@arm.com, Jonathan.Cameron@huawei.com, gshan@redhat.com, 
 eauger@redhat.com, sebott@redhat.com, cohuck@redhat.com, ddutile@redhat.com, 
 shahuang@redhat.com, qemu-riscv <qemu-riscv@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Song Gao <gaosong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6BTolZRnE1s7

On Wed, 12 Jun 2024 at 13:33, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Zhenyu,
>
> On 12/6/24 04:05, Zhenyu Zhang wrote:
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 3c93c0c0a6..3cefac6d43 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -271,6 +271,17 @@ static void create_fdt(VirtMachineState *vms)
> >       qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
> >       qemu_fdt_setprop_string(fdt, "/", "model", "linux,dummy-virt");
> >
> > +    /*
> > +     * For QEMU, all DMA is coherent. Advertising this in the root nod=
e
> > +     * has two benefits:
> > +     *
> > +     * - It avoids potential bugs where we forget to mark a DMA
> > +     *   capable device as being dma-coherent
> > +     * - It avoids spurious warnings from the Linux kernel about
> > +     *   devices which can't do DMA at all
> > +     */
> > +    qemu_fdt_setprop(fdt, "/", "dma-coherent", NULL, 0);
>
> OK, but why restrict that to the Aarch64 virt machine?
> Shouldn't advertise this generically in create_device_tree()?
> Or otherwise at least in the other virt machines?

create_device_tree() creates an empty device tree, not one
with stuff in it. It seems reasonable to me for this property
on the root to be set in the same place we set other properties
of the root node.

thanks
-- PMM
