Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp217214lfb;
        Wed, 4 Nov 2020 23:48:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTyocKm5uMybzIB+QAaa17wQrNWX/WBBKJYoxKI3FoMkLJXa943mZajCaSCgmhCPlmdJtT
X-Received: by 2002:a25:ce47:: with SMTP id x68mr1934184ybe.101.1604562493907;
        Wed, 04 Nov 2020 23:48:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604562493; cv=none;
        d=google.com; s=arc-20160816;
        b=MDawff0WQx8QUzCvlr6swam8qGBj7yAXkNnJ8/zzOZYJszfTIsytHzXjcD6DO7RbP/
         /sI0W7Dz844CQmT4stWIUW/HUF1J67pKqjuqMijcB/c8RWDueaizWmaRdNIXxC1RbWM+
         +hjOc/ChbdhouGkHUXL8cs+dxnZlN8LRumfI8ZILOKVjmdSki8m39YzqauZgcUl/fwru
         /RYlk6Kh/w3V4qg59engRHm7OL8JsVZfLzdGIkaVBnQcFaPSoO7eUtaQfGksm+NCFGCa
         /ZgNkngPnNvyintjEQp+Xplff6aRoK7eazXPZZbtHXe7/2Yt8lDEncka779gw4n7bpBe
         OlOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YgyepuOYyU9IQ5ylDDgqSog9cYBtBDYMibfTuSffir0=;
        b=FsT3jyZGtXperxjarMz5feGpkzsV2Z5knUs0INYKG3wUNv+lzIPY0hcL7Ko21IirpH
         HgTJJv61pEUtND3+I0NBfEKZJ4BtXy7BErpZoiEhd2qD0tS0ZhZf9veocFEE+fg6Wcgi
         deFwYL61L8sYlM70J7UIkMpwhtBRreBjrF754rT3hJJkmi5U6V/oY89wCOqztVBjkb9B
         nwqe4vb3Sg6lnTujT8CXgizKZGJgUnHJrv8XBbkq4R5pEXfTerMvy8PNy1kfsQw+7v6E
         CyaTbOhvIgvMhRJiLvSOja90SYPNjOc8XqQtfF4rd4BgOWWbONfYAA6q4z1oeIMOiCBY
         rEgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CGllYwzD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si587707ybu.339.2020.11.04.23.48.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 23:48:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CGllYwzD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kaa0D-0003X3-9N
	for alex.bennee@linaro.org; Thu, 05 Nov 2020 02:48:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kaa05-0003Wr-7h
 for qemu-arm@nongnu.org; Thu, 05 Nov 2020 02:48:05 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kaa01-0004gm-Tw
 for qemu-arm@nongnu.org; Thu, 05 Nov 2020 02:48:04 -0500
Received: by mail-pf1-x441.google.com with SMTP id x13so773927pfa.9
 for <qemu-arm@nongnu.org>; Wed, 04 Nov 2020 23:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YgyepuOYyU9IQ5ylDDgqSog9cYBtBDYMibfTuSffir0=;
 b=CGllYwzDja5VDepGtkOmQhNJe+DKhqUj2F25RdLaY39jWjk0xT8Kt4cBgPqykzVV8b
 JxqOX8c1Ka0XELwK1+5xyF6218loKqwaf+qQ6YVBlrfOPc/x5WReVHGN6K0NViEBKoKF
 ltSo6vauk0VCNT541OOUY2NRRYq2AzxEGPtOwYBMh6ZDBHvEQhXEdYL8GI+0rKP8ePhq
 Zu+vs/JiaAJrH9UMOKeClphL3HL/v3OpsLJ9maQLA4g3uS8n/gNHe43N0YmbXkR1BAGB
 i7oKevBmXW+1rnF1FIZiCseb+I1gf8oRBLEgI4gGdhQ9F2AdCg7f3jWR0v1N1RlTqEl1
 8btA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YgyepuOYyU9IQ5ylDDgqSog9cYBtBDYMibfTuSffir0=;
 b=lIXJeUrdGns4yISRsXTgm/sD8HczsUfLt0mBLMmwEgdxEpP5F9hAHK7hIhWRZhAgkl
 xOU2dXQ66ns00UI6xvJKG+hBC2oiEAAejXL0ot4i5CpNHMEgl3zPXSDLXepuZp51os/2
 Zt56BHy+W3jYEh9ScYMyj92ZqaElYMq310YjMPuUx4Mt2Ql2gO112CHUZh9ea6ym9Y6Z
 weAFwj+wZCAzI1XcPsfiOjUZEcDtMN/bUcjNqPP9ndjGOCh0xTWKzHcG1UyhOYbloG79
 y/baKJERJBf9aXGtHJ4x9sbBNKNGpgl2wsGrn7FHZniWijEX6NJz6ymwOHsM9mqyzA2L
 0P4A==
X-Gm-Message-State: AOAM532vF8N3/Z8jBPZrTjZ5SCZCHOF8JX4cXk3BRFIoqCAZ4ijW8d60
 wdK2VoRc0av+UvcAvSmwL3+WpdPNaGFkUPDifTlK1Q==
X-Received: by 2002:a65:644d:: with SMTP id s13mr1312524pgv.108.1604562479575; 
 Wed, 04 Nov 2020 23:47:59 -0800 (PST)
MIME-Version: 1.0
References: <20201028085918.14580-1-maxim.uvarov@linaro.org>
 <CAFEAcA8_1w=4qdE_AJxUP-uPoFL=Fsg9hy62Lw7bLDjKzL9Vvg@mail.gmail.com>
 <20201029111939.GI1664@vanye> <20201102135327.wgltgvk2olqvamyp@xora-monster>
In-Reply-To: <20201102135327.wgltgvk2olqvamyp@xora-monster>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Thu, 5 Nov 2020 10:47:48 +0300
Message-ID: <CAD8XO3Z9eKVrxu=B9rbKSzZgTXwiBOo81cr3L28=z5hQFx+_Rw@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/arm/virt: use sbsa-ec for reboot and poweroff in
 secure mode
To: Graeme Gregory <graeme@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>,
 ard.biesheuvel@arm.com, Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gy4u0Lo22ZsD

On Mon, 2 Nov 2020 at 16:53, Graeme Gregory <graeme@nuviainc.com> wrote:
>
> On Thu, Oct 29, 2020 at 11:19:39AM +0000, Leif Lindholm wrote:
> > Hi Peter, (+Ard)
> >
> > Graeme is on holiday this week, and I would like his input.
> >
> > On Wed, Oct 28, 2020 at 20:31:41 +0000, Peter Maydell wrote:
> > > On Wed, 28 Oct 2020 at 08:59, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > >
> > > > If we're emulating EL3 then the EL3 guest firmware is responsible for
> > > > providing the PSCI ABI, including reboot, core power down, etc.
> > > > sbsa-ref machine has an embedded controller to do reboot, poweroff. Machine
> > > > virt,secure=on can reuse this code to do reboot inside ATF.
> > > >
> > > > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > >
> > > (I've cc'd the sbsa-ref machine maintainers.)
> > >
> > > > ---
> > > >  Hello,
> > > >
> > > >  This patch implements reboot for the secure machine inside ATF firmware. I.e. current qemu
> > > >  patch should be used with [1] ATF patch. It looks like that Embedded Controller qemu
> > > >  driver (sbsa-ec) can be common and widely used for other emulated machines. While if
> > > >  there are plans to extend sbsa-ec then we might find some other solution.
> > > >
> > > >  So for the long term it looks like machine virt was used as an initial playground for secure
> > > >  firmware.  While the original intent was a runner for kvm guests. Relation between kvm guest
> > > >  and firmware  is not very clear now. If everyone agree it might be good solution to move secure
> > > >  firmware things from virt machine to bsa-ref and make this machine reference for secure boot,
> > > >  firmware updates  etc.
> > > >
> > > >  [1] https://github.com/muvarov/arm-trusted-firmware/commit/6d3339a0081f6f2b45d99bd7e1b67bcbce8f4e0e
> > >
> > >
> > > Thanks for this patch. It is definitely a missing
> > > bit of functionality that we intend to allow virt to run
> > > EL3 guest code but don't provide a trigger-shutdown/reboot
> > > device that works in that setup.
> > >
> > > I think the key question here is whether we want to implement
> > > this by:
> > > (1) providing the sbsa-ec device in the virt board
> > > (2) some other mechanism, eg a secure-only pl061 GPIO
> > > some of whose output pins can trigger shutdown or reboot
> > >
> > > The sbsa-ec device has the advantage of doing the
> > > shutdown/reboot functionality at the moment. The question
> > > I have for the sbsa-ref board folks is: what are your future
> > > plans for that device? If the idea is that it's going to end
> > > up stuffed full of sbsa-ref specific functionality that we
> > > wouldn't want to try to expose in the virt board, then we
> > > should probably go with the pl061 approach instead. But if
> > > it's not likely to grow new functionality then it might be
> > > simpler...
> > >
> > > A couple of notes on this patch if we do go down that route:
> > >  * we would need to arrange to only add the new device for
> > >    new versions of the virt board (that is, the "virt-5.0"
> > >    machine must not have this device because it must look
> > >    like the version of "virt" that shipped with QEMU 5.0)
> > >  * the device needs to be mapped into the Secure address
> > >    space only, because Secure firmware wants control over
> > >    it and doesn't want to allow NS code to reboot the system
> > >    without asking the firmware
> > >  * it would need to be described in the DTB (and maybe also
> > >    ACPI tables? I forget whether we need to describe Secure-only
> > >   devices there)
> >
> > Would it? Could it be something that goes into the virt spec?
> > We don't consume ACPI in firmware (but TF-A will of course have access
> > to the DT regardless).
> >
> > For sbsa-ref, I would ideally like to move to emulating communicating
> > with an SCP over time, as opposed to TF-A directly controlling the EC.
> > I am unsure if that leaves much opportunity for code sharing with
> > virt.
> >
> I would agree that would be the ideal end point for the sbsa-ref.
>
> I am now kicking myself that the GPIO style solution did not occur to
> me.
>
> I do see the EC device being a stopgap until a proper comms protocol
> can be implemented to replace it.
>
> Graeme
>

Thanks. Is there anything I need to do with this RFC patch or it can
be accepted as is?

Maxim.
