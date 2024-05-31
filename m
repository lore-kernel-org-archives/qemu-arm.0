Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp416330ejs;
        Fri, 31 May 2024 03:21:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTf/OxpvdAfiMFL6tgaNc2PUq3C8DS1SkAF2au+p8hERKUFZ14E9dRGI+9lefH5K8t2cWD+djs6QoM2EEuMehzKDLs7NVF
X-Google-Smtp-Source: AGHT+IFXcodnguYF3ya4SBm/aNJBbl4IjSclVuibn94QZXRIxp0mPfFJC2vabCXl0OEa648hqFHO
X-Received: by 2002:a9d:6851:0:b0:6f1:2ca5:4d08 with SMTP id 46e09a7af769-6f911fb9b5emr1475040a34.24.1717150906919;
        Fri, 31 May 2024 03:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717150906; cv=none;
        d=google.com; s=arc-20160816;
        b=ft68J8twuF3i+XgZWrqTrEFoOyiRbWAXxT/Sew/F61KPyE0lcAa+aWoXLjIrhLhjBG
         kPJ403GHBruzITxX29Q+xrQNIzLNS2JKu55cx8wQbi3CSMhm4bwv9dSn2qk5zx6MY/3c
         DX92/R+aY9bH5XbdRRYuyCtSrb7skr0N95NIeXIZnIpjlxUnCh3Ic2jPs2u7mGCLTtOd
         78CsMbpAeV94Rz+WYf8R5s7/T1m0xRakunvpTvEL4J6J7aPSoHGjQJ9slS69ndQCSBPx
         hhv3UUEDqEsUdrZFB/7W4Q6+pr/C/eqRpx95k32J1D+VQE8OwBIR+h4fLAn8YX0yv3/r
         sG5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=IxO6KV7r5MXxmmG+r3E6VhRYcjH+8JvBNIwyUucl50k=;
        fh=OI9XOljYbMXetiwzFOB7QgcB4VYCQd9no0vfYkiPSfg=;
        b=txKG8aV6VcZ9XyrcEkG2zSV6A9IxrJCbAXVr0pEAZUeQanxwaIK3eyTWurMaRQEEMm
         zGDzY8Zo2etV4QwuTXEv0FqSIJtHtPh2okOWbTXzHVB1sTO8p2oX3QDGAj0qQ7IJ2CFc
         f1+63xtX+gJpmiVqurIaqed3caSC3sAtBcyzJgANBRf2Yw/7X/0qCpWw7crbQIfYwIZf
         ILmr7vfCvIsH9v70SmTgGAlvi7NJ7O5ZTzcpK6suWuiPNbIwwcnljPKuZ9z69xih31D/
         QjceF8BC4jjn1lM8s1adLKL7z7MljfSZYi+r4stPnQcP/Geb7t7xzXLfe8XxL9jxjUit
         ELbA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MQ/AzLzh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43ff23aee7csi14289871cf.141.2024.05.31.03.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2024 03:21:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="MQ/AzLzh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCzO6-000097-Fi; Fri, 31 May 2024 06:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1sCzO4-00008a-Vg
 for qemu-arm@nongnu.org; Fri, 31 May 2024 06:21:29 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1sCzO0-0001DF-HY
 for qemu-arm@nongnu.org; Fri, 31 May 2024 06:21:28 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-35dcc681f70so696647f8f.0
 for <qemu-arm@nongnu.org>; Fri, 31 May 2024 03:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717150881; x=1717755681; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IxO6KV7r5MXxmmG+r3E6VhRYcjH+8JvBNIwyUucl50k=;
 b=MQ/AzLzhfXI3zSHxi2PrXH0RNuy7LGdLWcrem6EYxlWlhNv6ftU/BM40hRXhPhW9SC
 cHRrKzXmyq9J+23Rws2G34CLsLDTccDMF2EN9WxClmbHA/TAzAj3N6EGSs2nCA5VfVvl
 i2EWaGFr6CYYHvJgnlunR5PS36A/NW0PULy6yoKqwThgBnqxn63F5wer1SxkImerZkvg
 aEPHCk9IfwIt7uYJjRAJa78Z3+4uQdbxpj1vPISUm9c6n4DtTJ79MFBh7BQ5t4SWiWof
 +FI7wcMWh38DXzAwS1PT6TZY0h014xWr64BvL8uh6fG7YMjU7DBqZBBY2LAQ5aX8kvdh
 ZM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717150881; x=1717755681;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IxO6KV7r5MXxmmG+r3E6VhRYcjH+8JvBNIwyUucl50k=;
 b=KRATiCNbleMSWv5i0J3qsxWgngHjDRC3FKauAhV9444oVapOyuLGYB+1RgGHimPrJT
 xoXE27yKp6suQdhGMu1i+F2lYHdF58R2SXTPY1mhtOFw2h1fozgKqvl7PPFW1fq49Qpu
 jsgUdVpoYEzQFFJfAe9QoqzhiiaBm48mm26zVQugAqysvE6dhQECxlOhEs12S1X26B5r
 sXHVcqn7yLSbA0WlihixGEmSeXPbCAG3+YnIvNFiB0Y6PTinguNdauMYl3XMqos8GMyv
 ovOClb1W2QDjyv8ustfPXGINBWZw+PxMtFgQ8YaJ3VajxrUM7mEN6kp3HYwAxXbes6Lf
 UHxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTqUFBFtWllMlM4drQxu2aY9Fb7l1StTq8TDDY730ZDEmIkwpv8YVL70EoeDEctEC6w98DnPAGXJnlyTWTrHNvTABa
X-Gm-Message-State: AOJu0Yx51rL1+A/wLxyDjlcBt9Fr2Ck48L3XuP+kTpGZCSdl5mOB6zg4
 d5MUY1obH5isaf1biN3EDSqKUYvxRgBcWI+Fz5+SZqIzvV7shD9vklZurZ5BoNk=
X-Received: by 2002:adf:f742:0:b0:35d:cf2b:9106 with SMTP id
 ffacd0b85a97d-35e0f274187mr999329f8f.26.1717150880747; 
 Fri, 31 May 2024 03:21:20 -0700 (PDT)
Received: from myrica ([2.221.137.100]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04da182sm1516118f8f.54.2024.05.31.03.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 03:21:20 -0700 (PDT)
Date: Fri, 31 May 2024 11:21:35 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Itaru Kitayama <itaru.kitayama@linux.dev>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Unexpected error in rme_configure_one() at
 ../target/arm/kvm-rme.c:159
Message-ID: <20240531102135.GA40178@myrica>
References: <0C6F517A-5686-4BCE-8D08-1CED02CB470E@linux.dev>
 <4e7aa598-1a5d-47e1-aaa3-78af05947eeb@linaro.org>
 <CB05CAA2-9301-45F6-8AE3-A2E27A160CDF@linux.dev>
 <CAFEAcA-gye9B1yJNKyT0fcZzR7TukNvaQyc7QkKQ_1FUGfAaYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-gye9B1yJNKyT0fcZzR7TukNvaQyc7QkKQ_1FUGfAaYw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: z/mqSyZMITpL

Hi Itaru,

On Fri, May 31, 2024 at 10:57:13AM +0100, Peter Maydell wrote:
> On Fri, 31 May 2024 at 05:20, Itaru Kitayama <itaru.kitayama@linux.dev> wrote:
> >
> >
> >
> > > On May 30, 2024, at 22:30, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> > >
> > > Cc'ing more developers
> > >
> > > On 30/5/24 06:30, Itaru Kitayama wrote:
> > >> Hi,
> > >> When I see a Realm VM creation fails with:
> > >> Unexpected error in rme_configure_one() at ../target/arm/kvm-rme.c:159:
> > >> qemu-system-aarch64: RME: failed to configure SVE: Invalid argument
> > >> test.sh: line 8:  2502 Aborted                 qemu-system-aarch64 -M 'virt,acpi=off,gic-version=3' -cpu host -enable-kvm -smp 2 -m 512M -overcommit 'mem-lock=on' -M 'confidential-guest-support=rme0' -object 'rme-guest,id=rme0,measurement-algo=sha512,num-pmu-counters=6,sve-vector-length=256' -kernel Image -initrd rootfs.cpio -append 'earycon console=ttyAMA0 rdinit=/sbin/init' -nographic -net none
> > >> do I need to suspect first the VMM, QEMU, or the Image? The kernel is built with LLVM, does it matter?
> > >> Thanks,
> > >> Itaru.
> > >
> >
> > I’m testing Jean’s repo at:
> >
> > https://git.codelinaro.org/linaro/dcap/qemu/-/tree/cca/v2?ref_type=heads

Thanks again for testing, you can report issues by replying directly to
my posting, so I can get to them quicker. If you want I can Cc you on the
next one. The latest is:

[PATCH v2 00/22] arm: Run CCA VMs with KVM
https://lore.kernel.org/qemu-devel/20240419155709.318866-2-jean-philippe@linaro.org/

That does sound like the KVM host doesn't support SVE, but the QEMU VMM
version is also too old: in the latest series 'sve-vector-length' was
removed and we use the existing -cpu parameters to configure SVE. Please
make sure that the QEMU branch is cca/v2 to match the Linux KVM branch,
because the older QEMU patches doesn't work with the newest KVM patches.
You'll need to update the command-line as well, because paramaters have
changed for cca/v2.

This may be the case of older build directories that aren't properly
synchronized. They can be removed manually but the quicker way is usually
to remove all source and build directories and start anew.

Thanks,
Jean


> 
> OK, we should cc Jean-Philippe then.
> 
> I'm wondering if this is as simple as "RME via KVM doesn't support SVE yet",
> perhaps.
> 
> thanks
> -- PMM
