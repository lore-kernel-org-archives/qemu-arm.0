Received: by 10.28.71.155 with SMTP id m27csp768860wmi;
        Fri, 13 Apr 2018 06:38:28 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49VBnxP3gMuiFTnWUlOp+kwRas3rpFsr7NEJkbU2BEUjpDi277K0f/sBmcI1ZDc7nBfh4Sz
X-Received: by 2002:a25:4092:: with SMTP id n140-v6mr4642068yba.459.1523626708551;
        Fri, 13 Apr 2018 06:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523626708; cv=none;
        d=google.com; s=arc-20160816;
        b=cQEMRvbLgZmYf76+zhAPb9Eibk6GSd0JHJwkHEm1rb7jeidK4w8t4uoJG65hGdZovv
         JVpfoiHug+CszGxMWHdkUwGRFDI266E5uVgFaqx8SFdh9Qlnj5iwhIZ285+YthPQEAw+
         r5wjN4YwussadwvbHy856vw6p2PARD5tioOuXB8KILDAqGYWM476ojeTAu+uJPNHD5Rw
         rakQejpMlm7WwcT0nt7uA8FqRattHL6Z3LTpKmqhZETDNZD+oRUdxVIVcUOtxMhs5ks5
         9zYBrunF0kB2mLi+kG1EfTh3luB3Vc97PHEjd8ocl0WQ+VBUjEUpdAlsKRtcKAqGpYIH
         /8GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=d6n+28KRYSsXDspxv9LKasQetR8+oF18/tb81NSwrW8=;
        b=IM9zfUhUQ+gottfb3qQBcOIo7tuJN0jba0TfLfU2vL3Bv7T3pKQu9lSdRivJIDumwn
         7Pg2bY54yhLjqMt83/2RiFFKW/5i4CMjNF6kZaWags92MoTHZuJvupSWsKwOPK8MiNhY
         uvXxsvJQnqAY767opfSSsXTXiJJMtQ2SfcmNjvouSNQ2IXsO/7CDmFrVf6BY3a/0G6A6
         HVT+sLqeyfl5CA5tc0o/OlF1RjWdU7rAnEwz8PhhAfwqlTpfVlhyh4248exA2FYDhCJS
         Yl1Ju3dGlBAPQBVQyjjvEjpTOv96G0+/ohhLZKqZ0X0d4YuIQc3WmvyXK0ymn6t7FSGB
         CGrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RHAwssGY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t13si2847841qte.367.2018.04.13.06.38.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 06:38:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RHAwssGY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6yuK-0000tN-2Z
	for alex.bennee@linaro.org; Fri, 13 Apr 2018 09:38:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6ysL-0008Eq-4E
	for qemu-devel@nongnu.org; Fri, 13 Apr 2018 09:36:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6ysK-0000cn-BF
	for qemu-devel@nongnu.org; Fri, 13 Apr 2018 09:36:25 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:37661)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6ysK-0000cU-6f
	for qemu-devel@nongnu.org; Fri, 13 Apr 2018 09:36:24 -0400
Received: by mail-ot0-x244.google.com with SMTP id y46-v6so9871762otd.4
	for <qemu-devel@nongnu.org>; Fri, 13 Apr 2018 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=d6n+28KRYSsXDspxv9LKasQetR8+oF18/tb81NSwrW8=;
	b=RHAwssGYjO38Jv5wEY55YXoc+ci2c4brW3QXihXlQDTZxndQO7ud4atAiABtVVsmXS
	fv7Ed5JiPykqRUwr4qY7AQgXtiryq1lCaBnVY2mXtGIPpu6B2+tNmPt3mAtgrrzI73VS
	A5HT4xKrfFmLcBho6EL9fIIPXD97m15mtc1r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=d6n+28KRYSsXDspxv9LKasQetR8+oF18/tb81NSwrW8=;
	b=MGNs/lqUmZSEKR9WBev72FXdWE1cidejJS2QWtFtGP4GxOYC6sXw+RNu4Q3foHjNw0
	GylBwGlAScYcg2mBmZ/PZC99dqAwsuvPaDZnUPkqhU9W1PFzkxw8iYZRhqBkaNnZpC1G
	LyaCWo9B0daI7Zp36GsXuyPdpeYQmEU1iIKI7CHhYvUsVjFkgoM6+l9NUGPyd9CrTWWc
	mCgrLsw6bwsQETbrslZcF22iModpr6+i+RHjE2NJ3VLMvnBtHgKtRvAte48VsT1GwejG
	sm9y9+BYJZD6JqZnIsV9HPUNZvzWjPgBxj4rFpclb2yVOoslvUxJdDmfooG27gFfpIuU
	N2mQ==
X-Gm-Message-State: ALQs6tCNqytb6/ldn198X4lNZ09BNTO3HBIkpL3Rpiiuozu3TBeQH1SC
	7Xg671PGhlitZCs8XR97SKuqCrLttDaGr4zHIWsK3A==
X-Received: by 2002:a9d:2ff2:: with SMTP id
	b47-v6mr3861752otd.316.1523626583536; 
	Fri, 13 Apr 2018 06:36:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Fri, 13 Apr 2018 06:36:03
	-0700 (PDT)
In-Reply-To: <1522160122-10744-7-git-send-email-eric.auger@redhat.com>
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-7-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Apr 2018 14:36:03 +0100
Message-ID: <CAFEAcA_p+ibaMyePwKW_dMQ_M7BHADnzvN_5_mjOLmUtEp=m2Q@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-devel] [RFC 6/8] hw/arm/virt: Allow GICv3 DT node with
 multiple redistributor regions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Huang <wei@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Christoffer Dall <cdall@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ihtb2NFSyWnP

On 27 March 2018 at 15:15, Eric Auger <eric.auger@redhat.com> wrote:
> This patch adds the GICState handle in the virtual machine state and
> allows to create a GIC device tree node advertising multiple redistributor
> regions.
>
> There is one range per distributor region following the GIC distributor.
> Please refer to kernel documentation for further details:
> Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

> +
> +        num_reg_values =  4 * (s->nb_redist_regions + 1);
> +        regs = g_new0(uint64_t, num_reg_values);
> +        qemu_fdt_setprop_cell(vms->fdt, "/intc", "#redistributor-regions",
> +                              s->nb_redist_regions);
> +        regs[0] = 2;
> +        regs[1] = vms->memmap[VIRT_GIC_DIST].base;
> +        regs[2] = 2;
> +        regs[3] = vms->memmap[VIRT_GIC_DIST].size;
> +
> +        for (r = 1; r <= s->nb_redist_regions; r++) {
> +            regs[4 * r] = 2;
> +            regs[4 * r  + 1] = s->redist_region[r - 1].base;
> +            regs[4 * r  + 2] = 2;
> +            /* count redistributors of 2 x 64kB pages */
> +            regs[4 * r  + 3] = (uint64_t)s->redist_region[r - 1].count << 17;

Board code shouldn't be reaching into the GIC device state struct like this.

> +        }
> +        qemu_fdt_setprop_sized_cells_from_array(vms->fdt, "/intc", "reg",
> +                                                num_reg_values / 2, regs);
> +        g_free(regs);
> +
>          if (vms->virt) {
>              qemu_fdt_setprop_cells(vms->fdt, "/intc", "interrupts",

thanks
-- PMM
