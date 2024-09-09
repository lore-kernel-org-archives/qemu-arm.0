Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp948545njb;
        Mon, 9 Sep 2024 07:48:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1wqwLYuF/6txrgpwVs+0yTs8CqiyK6F2sl5sk3K2J4OCzPCVaVAEirnoPODIkyOdeKdSuu7dDBSOqUw==@linaro.org
X-Google-Smtp-Source: AGHT+IF4X/VYN2hT/koQuUdbLkYWd0h35L3SDNhH/sluX2lfjVKtKTc67ML9dJEAktJ6AHD3Kpqs
X-Received: by 2002:a0c:c692:0:b0:6c5:52cc:6070 with SMTP id 6a1803df08f44-6c552cc61a5mr10202976d6.39.1725893310513;
        Mon, 09 Sep 2024 07:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725893310; cv=none;
        d=google.com; s=arc-20240605;
        b=TfcIVSh3wxBxlDZVfJYlJDPuxznXS75GFHlTo4WBRwJ73se+DidpECd+C21ukhnP26
         DFvC070873zmzj6iYPo6StMxVQL+ugGIURKL0OuRrcfQXU4lkOyhYHHpDcBPPl19Ihvi
         5D370NWworPyl9GQAVuY53L1rjP9mhaOkIBE60id2+Gb60nYctZGmiQWapVDrM2xR8xe
         f8gSFnVWvB3j7JqPAVU+PUlHevF6Zsss3HUeogvPqxX9e5F58rlQ8Yw7cGeg373SZYcg
         pSJMq8+K6zZquAgpeuoZDb0ap9D/YTQcp58WtwMWwSLo14UOYrC5jdgC0UJ6rxKjWqcn
         vWZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rGNP4q2nB3w8H/b4HNTZaFQMm7t5KWa7zgpotIiQbAk=;
        fh=6VaWrSVvbJKv1T5Fu/8+QXaCvrIL3qPluQWReHFhVXo=;
        b=LP6J1xan+CmE5GMWQa9vIiCUm6Z3PUJHG2Bq+Sl17C0E/HkPeXIkaU2l63LOazj9lM
         oDB+5IjD88RgK4TtypfA4UxkkiYz6gb1A2ycUOso4Mb5jPaLs83Zf0p2tHc4bW+coF7a
         2UnoCdhgGmMwMYbRV2ymaZ138k6ijxHfc2MrMCApxVj0t5NHE0ytNEzOzkvDSCczix2L
         SO7ZPVeaRyp+RoQpSkC/tk4GelQJYkSO83ZmiVN5uty0Noba6wn/Y7c0W1r8ni5agNUS
         GVPF6Vn2//J2X3zHYUQIfmOZMGZjksAy33Qm5Od8Cdni1nuEn5Tj0/WR6pl1+9qantaP
         bP5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=hJrkU1Jt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c5343419fcsi56654986d6.189.2024.09.09.07.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 07:48:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=hJrkU1Jt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snfgi-0000Jv-Dw; Mon, 09 Sep 2024 10:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1snfge-0000Ha-Gv
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 10:48:17 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1snfgb-0006OM-73
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 10:48:14 -0400
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-4582fa01090so253021cf.0
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 07:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1725893291; x=1726498091; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rGNP4q2nB3w8H/b4HNTZaFQMm7t5KWa7zgpotIiQbAk=;
 b=hJrkU1Jt5joq7RNCZXj0QDLKGagfNrfbSuY2Z+m8N54DtEdpgkR+h2ml5H1H1jrHpz
 qxoCx9HsvHjJHGj8qlIMpFlq/jBBfWKByJpOdjnk52z/eod//QSLzZliBiT8A9fq/kVO
 Y4EMwO4CG5525ByF8mh4xLgMzAm2GXh68JV0NtDfD/XgS494O1xbAadF6eWRQ7EQiHz4
 ieMlGC4LSi6PkCHEvOAJBa5Wg327P7gXlziBEGfHDWglsw1JO8IFrRFvjfEQVBvPlVln
 mJCqW+ScBdOaqVVSFDUTA9wT+e4lRg8gMYBBN1KjFB5jqedhaxiPUphP0cC9D9uT/Ko3
 O6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725893291; x=1726498091;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rGNP4q2nB3w8H/b4HNTZaFQMm7t5KWa7zgpotIiQbAk=;
 b=iA54nCLA2XeMUWmqgRsYMuQ+45fuDY60Ysxeo1pemhMCkh9Y0FyUzibOOdnHDDpdsD
 zRoSQOWGxpsttL7ITkOOYUlLG8lVLUIsdELzKlet10kS2kHUCMj2dFjYizgy661/JpDY
 r+ZJfIFPNDX8S3P4v+hnXZ2WIThBdVQBY4OFjKwf64k5UvxHx1m6YSczMkSmUPeIRxYj
 9WsrJjVTj4oO/erYS+Ezy9Eromvv9gKGfiBv5dKDgBxC4aMtlR3+V5IsqVk0S3ls/JuR
 fZDHqnqiZQSoy/8mHeOKgnznSuZ1vDyLG8aMtMhJZ81ucBBo8XzgOBPXzpG9vCY0lsUz
 UKEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHIk3PXsaZ4/NLYZ8rNDWvjXXLxIqdoA4G9rX3ZEzflHcNsyrT16L8oRv2sJN3ae0RnMe19yjr5Q==@nongnu.org
X-Gm-Message-State: AOJu0YysVk8qzN6hW3m6gOtW5pbLynVhfuO68QGSl76dsPlerb8WMAUZ
 BAzOH8crajGHnGKXcIXP2/tLpGG+h3uMMJNsklgceKVsRIS3w9kfJbFSG6+EjpxRd4QjiXp/BDP
 uIIhtku+LIHN+AuNnmAEh/gP3WM2DEATwJlzH2nA19jY64K5fjTAv
X-Received: by 2002:a05:622a:2d1:b0:447:f3ae:383b with SMTP id
 d75a77b69052e-458214affa9mr4662971cf.19.1725893291050; Mon, 09 Sep 2024
 07:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <447984db-8c52-c911-d7bd-6616edaaefa5@hisilicon.com>
In-Reply-To: <447984db-8c52-c911-d7bd-6616edaaefa5@hisilicon.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Mon, 9 Sep 2024 15:47:59 +0100
Message-ID: <CAFgf54oTQqTJKxqD5U2i+jrTqHQQS=0zSkYiJjoWs5MOmaz5gg@mail.gmail.com>
Subject: Re: [Bug Report] smmuv3 event 0x10 report when running virtio-blk-pci
To: Zhou Wang <wangzhou1@hisilicon.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=smostafa@google.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: yOXegffGVrAJ

Hi Zhou,

On Mon, Sep 9, 2024 at 3:22=E2=80=AFPM Zhou Wang via <qemu-devel@nongnu.org=
> wrote:
>
> Hi All,
>
> When I tested mainline qemu(commit 7b87a25f49), it reports smmuv3 event 0=
x10
> during kernel booting up.
>
> qemu command which I use is as below:
>
> qemu-system-aarch64 -machine virt,kernel_irqchip=3Don,gic-version=3D3,iom=
mu=3Dsmmuv3 \
> -kernel Image -initrd minifs.cpio.gz \
> -enable-kvm -net none -nographic -m 3G -smp 6 -cpu host \
> -append 'rdinit=3Dinit console=3DttyAMA0 ealycon=3Dpl0ll,0x90000000 maxcp=
us=3D3' \
> -device pcie-root-port,port=3D0x8,chassis=3D0,id=3Dpci.0,bus=3Dpcie.0,mul=
tifunction=3Don,addr=3D0x2 \
> -device pcie-root-port,port=3D0x9,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,add=
r=3D0x2.0x1 \
> -device virtio-blk-pci,drive=3Ddrive0,id=3Dvirtblk0,num-queues=3D8,packed=
=3Don,bus=3Dpci.1 \
> -drive file=3D/home/boot.img,if=3Dnone,id=3Ddrive0,format=3Draw
>
> smmuv3 event 0x10 log:
> [...]
> [    1.962656] virtio-pci 0000:02:00.0: Adding to iommu group 0
> [    1.963150] virtio-pci 0000:02:00.0: enabling device (0000 -> 0002)
> [    1.964707] virtio_blk virtio0: 6/0/0 default/read/poll queues
> [    1.965759] virtio_blk virtio0: [vda] 2097152 512-byte logical blocks =
(1.07 GB/1.00 GiB)
> [    1.966934] arm-smmu-v3 9050000.smmuv3: event 0x10 received:
> [    1.967442] input: gpio-keys as /devices/platform/gpio-keys/input/inpu=
t0
> [    1.967478] arm-smmu-v3 9050000.smmuv3:      0x0000020000000010
> [    1.968381] clk: Disabling unused clocks
> [    1.968677] arm-smmu-v3 9050000.smmuv3:      0x0000020000000000
> [    1.968990] PM: genpd: Disabling unused power domains
> [    1.969424] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
> [    1.969814] ALSA device list:
> [    1.970240] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
> [    1.970471]   No soundcards found.
> [    1.970902] arm-smmu-v3 9050000.smmuv3: event 0x10 received:
> [    1.971600] arm-smmu-v3 9050000.smmuv3:      0x0000020000000010
> [    1.971601] arm-smmu-v3 9050000.smmuv3:      0x0000020000000000
> [    1.971601] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
> [    1.971602] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
> [    1.971606] arm-smmu-v3 9050000.smmuv3: event 0x10 received:
> [    1.971607] arm-smmu-v3 9050000.smmuv3:      0x0000020000000010
> [    1.974202] arm-smmu-v3 9050000.smmuv3:      0x0000020000000000
> [    1.974634] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
> [    1.975005] Freeing unused kernel memory: 10112K
> [    1.975062] arm-smmu-v3 9050000.smmuv3:      0x0000000000000000
> [    1.975442] Run init as init process
>
> Another information is that if "maxcpus=3D3" is removed from the kernel c=
ommand line,
> it will be OK.
>

That's interesting, not sure how that would be related.

> I am not sure if there is a bug about vsmmu. It will be very appreciated =
if anyone
> know this issue or can take a look at it.
>

Can you please provide logs with adding "-d trace:smmu*" to qemu invocation=
.

Also if possible, can you please provide which Linux kernel version
you are using, I will see if I can repro.

Thanks,
Mostafa

> Thanks,
> Zhou
>
>
>
