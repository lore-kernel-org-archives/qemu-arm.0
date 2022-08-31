Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp330953ejh;
        Wed, 31 Aug 2022 05:34:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5tbv+rv+JDZWpO6UgYdaNMPnbJl4/Z2Ry20V60xFsgYgyrmJqi0CXKNTAE6EXbyZS6QJO5
X-Received: by 2002:a05:6214:246b:b0:497:28b7:d411 with SMTP id im11-20020a056214246b00b0049728b7d411mr18976484qvb.128.1661949294474;
        Wed, 31 Aug 2022 05:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661949294; cv=none;
        d=google.com; s=arc-20160816;
        b=BYCMGE7fK7UX4B50dB8Gx2tlr8THsapStlNcX9ydmEBLV+brMoa/7V6kGaBSBUqqKm
         LFddlED7esiW2V2XIAXKd1x0QZYE/nt9N/QnToHgFCTGs0i0Z0bsJcHSPNHWOm5zZh5f
         88W18bhQbZEqAPQCR9F/cWv4CfH8RS6YSnY/gOXiKCRZhKRf9q1+cyI912xwWg5w+Uft
         TL/oHe2fqDvMpksTRZmikvc4YOaWKYCuQUmnmxqIfwNkL4nvVWKKVdwJhLnVqPmTmPia
         2OT+S8Z8h7/tOBle6bQ/PRUmDAO0iKoqcL+Ups+o54QwgPj3BqgED3Hqq0lnqxnDrTub
         gECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=db5u7MoT2yxtd2eUKLd+WvQKmr7O5WLjxDzUPMuD/Nk=;
        b=vecRnDHLfz9af3HdQocoaQv1Ne7wvY/wWim10HeD6FO6r/kYYUhCbp23PmPddKf8Yo
         69/EytoCgHO+4KS3Ms3ms74oNY3uM+EM7p88p+AUoBdNpMnsRP2r23fvwvZAFzqqG3dT
         YJY3ixLERfmfOl9Ny7nNcjXvJWGakq8uVJ/2bvu/wpgJqHWDoh4UEnGjcYKV/PrK8RZM
         G0XqrYZV4fTDbflvHKBaJXVjnR98mNyUbFigRvKJF2YXThltaygwvTFqHxDbHzfcnCGO
         NpfPRrsunBjdt0m9rjMl5ew3mhpEECOnrqSCdXEV8yrya1GNJ99EEXk4+LHIfb6QLB28
         bqJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=vADEi+ZZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8-20020a05620a444800b006bae2594a0bsi7681941qkp.297.2022.08.31.05.34.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Aug 2022 05:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=vADEi+ZZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oTMvl-0002am-UE
	for alex.bennee@linaro.org; Wed, 31 Aug 2022 08:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oTMu0-0001Mi-TH
 for qemu-arm@nongnu.org; Wed, 31 Aug 2022 08:33:10 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:46642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oTMty-00061Q-BN
 for qemu-arm@nongnu.org; Wed, 31 Aug 2022 08:33:04 -0400
Received: by mail-io1-xd30.google.com with SMTP id h78so11717014iof.13
 for <qemu-arm@nongnu.org>; Wed, 31 Aug 2022 05:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=db5u7MoT2yxtd2eUKLd+WvQKmr7O5WLjxDzUPMuD/Nk=;
 b=vADEi+ZZkvfKqfbPbSVU4euCdC8CRb9f8H0GQY/gh7G6/LY4EH6N5LjtMl+lHkL5r4
 c8U1U2+yeObt8XX3M2wD8VQ69+RwTlPSvGYpmkBDLetkp1SSUQDJWWTwNUxtRnkPCyle
 SSDc0S5frEIatkdlLMvAnb5E7g+Yad5+sk4MKK4Oy8ATRXaft239Bb9ujHilfh1Mi+Fs
 +LqFVT4bMjkxoinNqeuYn1a0yT9YORswqVvwfAY+HEEIF6XOE4etDE94LBOdRHJJTJO0
 8dfNcgLmo0WFv6AynzXRK0BXuwvm+886iJXUQ/RbcrthRqIfZ8AyMXADwZBPF3PiwzNk
 ukbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=db5u7MoT2yxtd2eUKLd+WvQKmr7O5WLjxDzUPMuD/Nk=;
 b=N1HvTYI2INnSSL18RssKlJuT1kCd0ycYNv7za76QcZlZKNV98L8xyOqoO05dgLCm7h
 5pf3T42CJOV2AABVnvDXEBb/dBth4Zr0443sv3ZxANzg5al3lny6kBz5SbUjNzRUJck9
 cYHq/y9rpjM+3irMDb9mtKkCeeL7lC47VfVxjYbXYVWiNdJ3otLbPwsMSVmBaqY6AR0l
 /YejWJFFk5Ju3E7Y3kfPigx6ERUY2u1mfmp0lBn+uxM30RC8vwfYWf8eWR/DM6rmguID
 iCjXSUB+C6XsJ1bYBhEH+l3hs1NR9100PNuh/Rokghx2slvlEOwGESrsLJti6+740U/i
 ofjA==
X-Gm-Message-State: ACgBeo1ojH6ApgYSb2Nx4ug+dJg9CUZeAeVQ1dpIDdsZGdoNesHGFlTK
 fk0wdqr3qFt5Tjf1HgbrGSdpA505xmgIo98yPi5bQg==
X-Received: by 2002:a05:6602:2751:b0:68a:af60:c9d2 with SMTP id
 b17-20020a056602275100b0068aaf60c9d2mr12597435ioe.91.1661949181030; Wed, 31
 Aug 2022 05:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220829084417.144739-1-akihiko.odaki@daynix.com>
 <874jxuhshs.fsf@pond.sub.org>
 <20220830120014.55f55b24.alex.williamson@redhat.com>
 <87y1v4ddwx.fsf@pond.sub.org>
In-Reply-To: <87y1v4ddwx.fsf@pond.sub.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 31 Aug 2022 21:32:50 +0900
Message-ID: <CAE=JJXfU=kT6-pchk1iQrqv3__mwNbWomhaKH5uOT4PdPh84cA@mail.gmail.com>
Subject: Re: [PATCH] pci: Abort if pci_add_capability fails
To: Markus Armbruster <armbru@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org, 
 qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 John Snow <jsnow@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, 
 Klaus Jensen <its@irrelevant.dk>, Peter Maydell <peter.maydell@linaro.org>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aSfEw1BTSu4r

On Wed, Aug 31, 2022 at 5:18 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> Alex Williamson <alex.williamson@redhat.com> writes:
>
> > On Tue, 30 Aug 2022 13:37:35 +0200
> > Markus Armbruster <armbru@redhat.com> wrote:
> >>        if (!offset) {
> >>            offset = pci_find_space(pdev, size);
> >>            /* out of PCI config space is programming error */
> >>            assert(offset);
> >>        } else {
> >>            /* Verify that capabilities don't overlap.  Note: device assignment
> >>             * depends on this check to verify that the device is not broken.
> >>             * Should never trigger for emulated devices, but it's helpful
> >>             * for debugging these. */
> >>
> >> The comment makes me suspect that device assignment of a broken device
> >> could trigger the error.  It goes back to
> >>
> >> commit c9abe111209abca1b910e35c6ca9888aced5f183
> >> Author: Jan Kiszka <jan.kiszka@siemens.com>
> >> Date:   Wed Aug 24 14:29:30 2011 +0200
> >>
> >>     pci: Error on PCI capability collisions
> >>
> >>     Nothing good can happen when we overlap capabilities. This may happen
> >>     when plugging in assigned devices or when devices models contain bugs.
> >>     Detect the overlap and report it.
> >>
> >>     Based on qemu-kvm commit by Alex Williamson.
> >>
> >>     Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> >>     Acked-by: Don Dutile <ddutile@redhat.com>
> >>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >>
> >> If this is still correct, then your patch is a regression: QEMU is no
> >> longer able to gracefully handle assignment of a broken device.  Does
> >> this matter?  Alex, maybe?
> >
> > Ok, that was a long time ago.  I have some vague memories of hitting
>
> Indeed!
>
> > something like this with a Broadcom NIC, but a google search for the
> > error string doesn't turn up anything recently.  So there's a fair
> > chance this wouldn't break anyone initially.
>
> I like your careful phrasing.
>
> > Even back when the above patch was proposed, there were some
> > suggestions to turn the error path into an abort, which I pushed back
> > on since clearly enumerating capabilities of a device can occur due to
> > a hot-plug and we don't necessarily have control of the device being
> > added.  This is only more true with the possibility of soft-devices out
> > of tree, through things like vfio-user.
>
> Valid point.
>
> When an compiled-in device model asks for overlapping PCI capabilities,
> it's a programming error.
>
> When an assigned device (be it physical or virtual) has overlapping PCI
> capabilities, it's bad input.
>
> Abort on programming error is okay.  Abort on bad input isn't.
>
> I think callers of the former sort should pass &error_abort to
> pci_add_capability(), and callers of the latter sort should handle the
> error.

Looking at vfio's implementation, it seems it makes its own effort to
make capabilities not overlap. Taking account of that, I have sent a
new version titled "[PATCH v2] pci: Assert that capabilities never
overlap", which has an updated message and removes the comment in
pci_add_capability().

>
> > Personally I think the right approach is to support an error path such
> > that we can abort when triggered by a cold-plug device, while simply
> > rejecting a broken hot-plug device, but that seems to be the minority
> > opinion among QEMU developers afaict.  Thanks,
>
> I'm in the "aborting on programming errors is okay" camp.
>
> Recovery from certain programming errors is possible.  However,
> different programming errors can manifest themselves the same way, and
> not all need permit safe recovery.
>
> Say we detect overlapping PCI capabilities when hot-plugging a virtual
> device model.
>
> If this is because the programmer passed an incorrect literal offset, we
> can recover safely by failing the hot plug.
>
> But perhaps the offset comes from a table, and some other bug scribbled
> over it.  Continuing the process is *unsafe*, and may increase the
> damage and/or obstruct the root cause.
>
> The former kind of bug is unlikely to survive even cursory testing.
>

Whatever kind of programming error it is, it is dangerous to attempt
to recover from it using an error handling code path untested for a
long period. I think it is better to have some common code to recover
from assertion failures. For example, we may have some option to print
"oops" just like Linux does when an assertion fails and let the user
handle it. That is quite out of scope of this change though.

Regards,
Akihiko Odaki
