Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp179761lfm;
        Mon, 6 Jul 2020 10:27:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFAomv7cNr2i9TCZneu4P2jruFJz9t7F+W4HMO35N+n8tJQVD7r8IVcjpRmeU0+PE3OtFS
X-Received: by 2002:a25:84cf:: with SMTP id x15mr72174658ybm.2.1594056452870;
        Mon, 06 Jul 2020 10:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594056452; cv=none;
        d=google.com; s=arc-20160816;
        b=mzECavFlIJGl+q0DQYOeoSenNYIPZYVQBcANNlUZ3Tpdh1RSToYaone1RAXWTg9wNl
         ZFFTd+P6LI3fyznCPAE+UOPfYcOgC5XrYaNY3fGN1Q9xJUYXfl773As187ja3g74ZkNA
         a38+NQOyt0nCrbOqP5bwNnqJnSxiiYjPTop1UybroiMD5p1sxZAzHBDka8mBCJVhSXOr
         CGo3gY4c3SvNUlkTK46RxIa0xm7+huhHrslq62JYnPuT1bwPFrXjFHRMKPwAvTIQ69c+
         csGCzZm9ISIgd7XVOZxuXVeTL1Z2bY+bl7XTaE6Cz2g0e+ITZATeRidfCsjiq6LR2fZ8
         4uiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7ctzFV2wTSbf5LJWwfLFnbYaCCE17qTbQd0y6awEpBc=;
        b=PkUNbROIOSRxfyz93drGFQZ8oxVuZm76WGJNrzLpI3kTcV4v43UpayBaxNERtMArUi
         XkWzvH6JjI3WUB0Xd57wOxZvZkDUU6yjHVbbXtXdf/GgOPiD/ZChkZQCSkSXK1mWsWhY
         LApEo1r0cl2wc5LK8o2GFFkkUNaIPEPsdnCu/uiLdCmO/dKMMaVH01kCqHXVwcfRbIo8
         QIrTa4VuZdBHj5+/SipltDOyDBlnMc0btAbp1wh/bz1++zvOfjzVnO9LWcyWtQbCQx06
         4Lx352CjgX129r21fR/k3faTTGVHwmjt8CzWczFFkMtQFsvvf+lv9ehA8SXVVfzwlEkH
         zF+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ThO12PL7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15si19548048ybn.58.2020.07.06.10.27.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 10:27:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ThO12PL7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsUtw-0001sU-4E
	for alex.bennee@linaro.org; Mon, 06 Jul 2020 13:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUUX-0000Mn-AE; Mon, 06 Jul 2020 13:01:17 -0400
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:42232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jsUUV-0006Rt-JJ; Mon, 06 Jul 2020 13:01:16 -0400
Received: by mail-il1-x144.google.com with SMTP id t27so28559432ill.9;
 Mon, 06 Jul 2020 10:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7ctzFV2wTSbf5LJWwfLFnbYaCCE17qTbQd0y6awEpBc=;
 b=ThO12PL7aDHTt6y75GpT9dyrfdUt5rmmp4Txh+Dd0WmdKFnGjk/r9Dm6MWbmdmKR2f
 gOl0EW560gWgAJC7KKPMPgy4RIOmmwIgVNkZadxV2u9D/dIfPdqotN2IpqAS9ycNQYHr
 hJ9dyDKYM4nPXV77ZHg3NPuffoCiRMGhmOByeH/avHgJv72C6g/CaXRvi9GUJfH3XClO
 jPo8NpRGszmVDXb43aPBUiVyM1/rwXiSMxzSVdmimKA5ZzWoLBOmJH+tqoSpPtKZ+8bh
 T2k+MkLuNEDO3YFDdNOzo/NtrgfOqqzzZgI1tkCp+0f10xp8ZpF+n8HFKOdAoTs7T00N
 VhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7ctzFV2wTSbf5LJWwfLFnbYaCCE17qTbQd0y6awEpBc=;
 b=GC+iYabkjjhtiURT1WKlPhDK84DXtPDSJ1SUb7X07NSN7ICnfFrgwd7Ee5J1kh/o+S
 h5eLIiH9yP97QNxOUq2qVoigIS8qVzdI89XroBMxx1cnaTKubP2rJ/BDPnP8XblThRFl
 zOVZqdxCHr3qwTYuNRhlBaJRa6QPS2ZdP7gBPMZ4GGlDPiMP2eBvZgDYiPJsO+WTZbr5
 fAOOEknIcJvhMQiRavAaJ76IHQvTyyQ5AlKHHF7eMx4PZRh15n3bR4ePvcjNK0jxBIN9
 zo7/eiNhzkLEZjCEY4N1a7Ll4fhYWZQQd/stn3WuUmFf9DNNQaR9ICGH7s8YtGImfWXk
 SdBg==
X-Gm-Message-State: AOAM531hR+m89Y3CLgPJyG+uzjaoM9LCpz+MU9w4gLIKJACw7JZv9Vf+
 s4GvX/vI1/G7BhwPE8XSjIo2ORHbmxVHF6QfZT0=
X-Received: by 2002:a05:6e02:d51:: with SMTP id
 h17mr31745866ilj.131.1594054872136; 
 Mon, 06 Jul 2020 10:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-4-f4bug@amsat.org>
In-Reply-To: <20200704144943.18292-4-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2020 09:51:17 -0700
Message-ID: <CAKmqyKOXnBzRC6-FQ664k-g8gQkByLEGq1MxBJ97eddL+OcH1A@mail.gmail.com>
Subject: Re: [PATCH 03/26] hw/usb: Remove unused VM_USB_HUB_SIZE definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Paul Zimmerman <pauldzim@gmail.com>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z6pwpYmv+cAy

On Sat, Jul 4, 2020 at 7:50 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Commit a5d2f7273c ("qdev/usb: make qemu aware of usb busses")
> removed the last use of VM_USB_HUB_SIZE, 11 years ago. Time
> to drop it.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/usb.h | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/include/hw/usb.h b/include/hw/usb.h
> index e29a37635b..4f04a1a879 100644
> --- a/include/hw/usb.h
> +++ b/include/hw/usb.h
> @@ -470,10 +470,6 @@ void usb_generic_async_ctrl_complete(USBDevice *s, U=
SBPacket *p);
>  void hmp_info_usbhost(Monitor *mon, const QDict *qdict);
>  bool usb_host_dev_is_scsi_storage(USBDevice *usbdev);
>
> -/* usb ports of the VM */
> -
> -#define VM_USB_HUB_SIZE 8
> -
>  /* usb-bus.c */
>
>  #define TYPE_USB_BUS "usb-bus"
> --
> 2.21.3
>
>
