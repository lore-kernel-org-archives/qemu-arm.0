Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4684201lfp;
        Tue, 28 Sep 2021 02:23:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGXLQiTdgegi3+zwQWLhr18JADpDE8vq3tI13zqpAu1RnR67F8DocGmRMwo/IAr2pBmsn8
X-Received: by 2002:a6b:dc05:: with SMTP id s5mr3260960ioc.109.1632820996515;
        Tue, 28 Sep 2021 02:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632820996; cv=none;
        d=google.com; s=arc-20160816;
        b=MrTvAhNg7u6/mbyAZ5keJeEdalCXyN5+/Ot+ggu7DL8zwQU53MmipNrq2Hz+sVSMpz
         zbQ4PK0gNbYtNroglbC2mf3KW1BkFZmCA5RDi0m41H29+5TDXvCw7VkoI05TUy8zygTH
         jWzsTM08md4mtGpenycxUgwcNbHg5e7i9l3+Fs2gSahXSIjqOemMdskzPJ6X24SkpvnZ
         WFvSzYkv4Tv4R7wrsTO9WwGhT7JlfhwzuKISuyXBbjSI8NxD7kn2Oz+Zzyq6FhxSMeHd
         +jmuNUVBLkVdRrRsTh2xHTcgT7EuQHkaPpqDYY9nbIxXPztCl6wP5n1L0cFvM09Cwfj3
         dLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r722AGBwSLzBCEUD+xAwVIZfxxIwuunXYPbgI0VJdcM=;
        b=CD//U1r83gvBa9spHtkjh2t+zFHEKkzl7sKGqQiFTWt7/Zy2UjppP/iE6S9oyvGQmQ
         +eJPtQ6F6uAAxD0tLHpXuy9OABG7+0IGyqnZhwSUR/l5nxOnszwbp8Q+4WfEYbq5yMdS
         4nt0D7+ZC2dwI5S9a1d9K731LgdmJfrcIbclApOyhPIB916O5xOZO2eGV4cmOuQMRsZM
         +7+BvDVspYfWzcuOrgfIKIrLF8MzZHYivMfEhYqmk35UQHoDNTfn+qL8HkpUKeQehtTi
         z+9QeEEhMz9VVs2d8lpzI/Y3bU9HfilhPGGxgkMGPw7s5XQG5IaZo4JqwXWmIbINBynz
         ORnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PV9Yb2dt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10si23486983ioh.48.2021.09.28.02.23.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 02:23:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PV9Yb2dt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mV9KV-0000DL-Rp
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 05:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mV9Ic-0007JM-Sh
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 05:21:18 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mV9Ia-0003Hn-3P
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 05:21:17 -0400
Received: by mail-wr1-x429.google.com with SMTP id d21so56674370wra.12
 for <qemu-arm@nongnu.org>; Tue, 28 Sep 2021 02:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r722AGBwSLzBCEUD+xAwVIZfxxIwuunXYPbgI0VJdcM=;
 b=PV9Yb2dtNC4DL992O46Q8DvG431JWzyRyky5s2iwxBFGmerwtMv7IsyjAEcDQrQ5jX
 Nu7IfSdCXvlISuLxX7wDgpDNvkqEmr/GoDP888+YrPu4sPfWc82mXTWOn0NmaaYOtGjy
 epDBz3GD8tqhSMgOt3utXj4j71oNliXajsfQM01z/kR7Rb+onHZsZDLrkahlH1tmRw+k
 p4aEveY/05s7E9JUDBKZGLKtwkX/wmaRaJ2LnRXWQQhaGSEaQg8s9VWUMPa3auMFvUOG
 Fe+a0z4j190Y6zrNQQRWg7Q9eOkWCJ7SS8uHosi3sPywUxYb2scluAtb4pBoLDvH8COX
 HMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r722AGBwSLzBCEUD+xAwVIZfxxIwuunXYPbgI0VJdcM=;
 b=YkYCbvoor/0HPRGAWOmkFvxylLidGYmShM7R6/1Dtk9JAGacrGKK0N0bq5Xm3IxQXN
 QDQBUVoCi5fYqKM0j8al4/SCTbnNetpHk+iZUlnitf79b6oCHEky8rb5ybucw1rtPRi/
 eiOITDrU83Nmu1Nm0AMytbXykc9woJkxNxo0KigJkJa6xF3xQkXkcNz/gkrQhaWPc6IC
 uPfIaACEwhUxdkyUhYEFHqpKmrFd/E1A1YkP9AwlLypyWOHizNR8KIWNB5bK90RcGEk3
 tmYBZOfLgRC5IfMJv8jYvUwVgFt0dN38eJGhDmhn3F17eSIJgm5qy4om//pmikPVaiWV
 jAFw==
X-Gm-Message-State: AOAM530K60VfW27cEjgl2VIgaV8tsP/YALLmRQ+SNJYpetyphpS3FIbF
 21q6SIuwJjnpuPv/wwuLjJRBAqGqvOsrlWjXYLgy6g==
X-Received: by 2002:adf:f185:: with SMTP id h5mr5313069wro.302.1632820874429; 
 Tue, 28 Sep 2021 02:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org>
 <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
 <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
 <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com>
 <CAPnjgZ2S7SXxHYd_bkcf+GcmmgEew3vpJkw+DRPqrpb44eLgcA@mail.gmail.com>
 <CAFEAcA-bk6PF_P3JOxQSCXo7Fh2K5AVygB9WwDUiK2fV9Fx5jw@mail.gmail.com>
 <CAPnjgZ26gQVpzL6fYsGzDf=c+z4aG5SPkBf7yoDC9+ynxQi_9Q@mail.gmail.com>
In-Reply-To: <CAPnjgZ26gQVpzL6fYsGzDf=c+z4aG5SPkBf7yoDC9+ynxQi_9Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Sep 2021 10:20:20 +0100
Message-ID: <CAFEAcA_QNcAHtdxUPLpmyzMYgb9YzhcE0-zyh=N8rqm4vOcGZA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l2JfZGDjcLPJ

On Mon, 27 Sept 2021 at 21:12, Simon Glass <sjg@chromium.org> wrote:
> I think you are misunderstanding my patch and that may be the problem here.
>
> Where QEMU is provided with a dtb (-dtb) it uses that and passes it
> on. This is absolutely fine and I have tested that this works well
> with U-Boot. No issues.
>
> Where QEMU creates its own dtb on the fly the -dtb parameter is
> actually ignored and there is no way to adjust what QEMU passes on,
> without recompiling QEMU. It is quite inflexible, actually. Even just
> creating a new device for development purposes is not possible. That
> is the problem I am trying to solve.
>
> There is certainly no intent to combine two bits of dtb with my patch.
> We could easily do that externally to QEMU.

So what *is* this patch doing? The subject says "Allow additions to
the generated device tree", and the patch adds an option to
"Merge a device tree binary (dtb) file into the generated device tree".
That sounds exactly like "combine two bits of dtb" -- the one the
user provides to the -dtbi option and the one QEMU generates
internally.

> The only current working option is to just pass the U-Boot dtb through
> and not use QEMU's on-the-fly-generated dtb at all. But I am assuming
> there is a reason why QEMU generates that dtb, so that would not be
> desirable?

QEMU generates the dtb to tell the guest what hardware is
present and where it is. We don't guarantee that that hardware
arrangement is necessarily stable between QEMU versions (in
practice there are generally additions and not deletions or
moves, but in theory there might be). All the guest is supposed
to assume is the location of RAM and flash; everything else it
must look in the dtb to determine.

> One more question...other than dtb, does QEMU typically add support
> for data structures needed by particular projects or groups of
> projects? It looks like dtb was supported for ARM Linux originally? I
> am looking at supporting bloblist as a way of communicating
> information between firmware (basically a simple way of packaging
> multiple blobs).

The answer here is essentially "no, as far as possible". We
ideally would not have special case support for any particular
guest code. We do have special handling for "directly boot the
Linux kernel" for a combination of historical reasons (we've
always supported it) and it being a massive use case. But even
that is painful to maintain (it starts off seeming easy but
gradually requires more weird tweaks and handling as CPU
architectures evolve). I really strongly don't want to add
additional categories of guests that QEMU has special case
support for, which is the main driver behind why I'm so negative
about this patchset.

Guest software running on the "virt" board needs to know it is
running on the "virt" board and deal with the interface and
information that QEMU provides. (For instance, Arm Trusted
Firmware and UEFI both have done this.)

-- PMM
