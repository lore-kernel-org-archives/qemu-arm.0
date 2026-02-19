Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D29E9A03B
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 10:13:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt11x-0007lW-Cm; Thu, 19 Feb 2026 05:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt11v-0007l4-0p
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 05:13:07 -0500
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vt11s-0007q1-Cr
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 05:13:06 -0500
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-64ad2a2851cso600189d50.0
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 02:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771495983; cv=none;
 d=google.com; s=arc-20240605;
 b=K6rja5nk5aUzLyWkOqg4aacM9BckB7HzlS5p6v8vVy0HRhTigXD749tydaB/ts8AII
 AVQlGwtrqi/FWQV4vvyUR0JkOYe8p6AMBgh0UgFdTVFr/LeX9WvgR4bXp3w96T5CZMI1
 hopKc2U/Ot4cAk6IbFfAXYgfjTYhhawyXivfWODSnAO3EXWLYTNh6h6tsv8cG3WhLj2x
 8VNgFWIzvOti4nIBs4VRB7BkdBCxhagalizJY88EWHB0DDK+nMNCD9IOA8O9R12UiVbL
 Ci63ydInXUMOn8op0ax6tT4DkfC0quSUlGGCNfZq+RRoCU1GFMBCNXabBW7/YQdnc1iV
 Hbug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=I1Xccy3fuo4NeBujNW8Yr112yKgANjPYkwu+AYvM1zk=;
 fh=7CwNeHow5sjThGeMK/pq2ywD9iUgy0Rby81ZoZRWzOM=;
 b=S0GZqk/gGHHmxGABfZ7iw2IYuV1B9cp3MD9Ah8iH2CAQkUxyTL+0nuOqak33mxn9AB
 nS72uDWee1ROx2rEL3aFb+q3eGPDwwFo0CBENnF9pP2Ov/C39O7Zh4wOalfB7LXRNP35
 c7HOXL3dmSTmgOhWRpO2YTICJVU1KaxRGGfnG6OyvzOizF1TfDsTtwhwsyMhHVu97q6z
 /HGQ8MwDmuYX0yfu6xcG1OlHaga0/hMLJ05gSFIzqHsB0utHNd09UGZfpqbfoouxeupA
 HaEZKoiE+pvWC/plHUkoG9TmJkrWKJ44Q7IphOiAgv9iJPYub+yEzLL/uojg7jY2VDrF
 JhFA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771495983; x=1772100783; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=I1Xccy3fuo4NeBujNW8Yr112yKgANjPYkwu+AYvM1zk=;
 b=Tjj1g4UC6/+Ux3OTgK4u/CtJR+m9KdT8pChYqUyHn8q0jeUlXUUnIH9/IPhqIzALz/
 HVXg6HgzOL6t9Pp2dEkGU1VlC0ilrmdGcOjoQsgxkDGh9AFo1+9nrXOjRPwqN2bDsWLI
 22jEdBXDUmZtHhuEmVONJrxXlJPc50k1f1dibcfJRy6oEaqFTYUYdBLsda9cxdFewntt
 9/RXJORt634ny5HVqNQ6Rv8yip+3UGqdFxyCmB1mZJ+hCpt90COGHfEKwY0S4z6HXh6P
 K4/dYYtyT9Y5xzW0z74YWRZONSLdlBJekyNtXg6ImpQNobhJCk5aIfQ1m2C8hv+qUsjl
 duCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771495983; x=1772100783;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I1Xccy3fuo4NeBujNW8Yr112yKgANjPYkwu+AYvM1zk=;
 b=K9SUrCMIVz91BAK/4B9naynAVtXd9KkQ60JS8QXzrKkgyi/IyicMIx1Z6UrS6W6RZb
 XaL//8DS7AQznwi2IWVbnr5mRml1AeCqYbyGQd7akLwL0E2+b7bz8QlLrt2pi6+E/E+B
 Req/XqZle4SEjZrtI641p4lNzyqcnznlx47uGTkF6i7QoPooXzwccUi/DzDGVJoo926j
 3HMVEcv8VAxY+WvpnbEkm1g7VI3DNHiW9p0WfEnroSzXNWgHcMAHKXI85pj+X0D25uoV
 nuth0zsYmcrMiCAkodCVu3CT4sGkMYZcCLBmny1f+sfFl+seKz6eN0slf1JDT57dnykd
 F8hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLvfe62recdiE4cxZURBIKfs3ZdZD0l+Im3IwDuiyAXJmBLkd+0cB8NVnM7bHAX0EV9QSechcK1g==@nongnu.org
X-Gm-Message-State: AOJu0Yz7oa5B/BOLe8tc42DQs2wNdG5O0b/Gen/kHSRS27XH1AE7Lyr5
 8wnCSkh86vj/92e4L4jjF/GP5RoQrqiIMaICOGkxCYBTpS74ssDi3R4N+jTgv4GS8oY+EYtLwXK
 V8gixTm1TIKT3Uc91Cgy7JLZuX8yTdpu93Dn8vMXsMQ==
X-Gm-Gg: AZuq6aIITqQy0FB6/QaOft4zFhnqaZ0QC1UYb5z63gGUDgKKA4e/a6G8lVIS9dd1g2C
 LHMz6KozvmVSuUpESEokrOtiCeclPyZvYJY6AVBU0s+NAFn3rwuejzzoKXL2YriN1zor/GIJW9t
 XvdcGesx++7awk3xkhe0uvzc3hRsb6h3K3F27THTQxH4zQgrjXTwb4NiDrBuyALoli6gV0hzOEh
 a1A4iWS3TXi8mbXySwysr3QTpf3hTSRTTkXr6cxYeyxVS0Gh+vjlCEZCE9ZB06azYju8zoCqTsN
 mNxQvuh6LUa/FVf15uIaKvNXMPvxRCSfbs3Nk4gPAEOf+m6MBpXd+PLyx2ubvI1bQUk=
X-Received: by 2002:a05:690e:1590:20b0:649:3e3d:327 with SMTP id
 956f58d0204a3-64c21abc466mr10458746d50.40.1771495983057; Thu, 19 Feb 2026
 02:13:03 -0800 (PST)
MIME-Version: 1.0
References: <20260211122759.125094-1-mbawa@redhat.com>
 <CAFEAcA_+eqfTy+7U9igTscue5SMURm3C9yUXvdFTon+ZgSJfAA@mail.gmail.com>
In-Reply-To: <CAFEAcA_+eqfTy+7U9igTscue5SMURm3C9yUXvdFTon+ZgSJfAA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Feb 2026 10:12:51 +0000
X-Gm-Features: AZwV_Qhabehe9XEqgx1hlH4Z2TOu_dd-y-R6Q2cllhzQweagDwcNI8TNXSoHquA
Message-ID: <CAFEAcA_fR8gQc-f1qhcNb7tD0_EfqfNJEhS_tSg354Rhpb=fQw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Add virtio-transports property
To: Mohammadfaiz Bawa <mbawa@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, 
 philmd@linaro.org, cohuck@redhat.com, eric.auger@redhat.com, 
 sebott@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 18 Feb 2026 at 19:01, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 11 Feb 2026 at 12:28, Mohammadfaiz Bawa <mbawa@redhat.com> wrote:
> >
> > Windows ARM64 guests detect virtio-mmio devices declared in ACPI
> > tables even when no backend is attached. This causes "Unknown
> > devices" (ACPI\LNRO0005) to appear in Device Manager.
> >
> > Until Windows fixes that by supporting, adding a new machine
> > property 'virtio-transports' to control the number of
> > virtio-mmio transports instantiated. The default remains
> > NUM_VIRTIO_TRANSPORTS (32) for backward compatibility.
> > Setting it to 0 allows users to disable virtio-mmio entirely.
> >
> > Usage: -machine virt,virtio-transports=0
> >
> > Signed-off-by: Mohammadfaiz Bawa <mbawa@redhat.com>
>
> Applied to target-arm.next, thanks -- but please could you check
> up with the ACPI spec about whether it says anything about what
> to report for empty transports? If it says we should or if it's
> just vague we should probably match the x86 microvm behaviour
> of not showing empty transports, since they can never be
> hotplugged after startup. (This might need to be tied to
> a machine-version, not sure.) Maybe we should also not report
> them in the dtb?

Looking again at this patch, I had a couple of niggles, so
I've dropped this patch from target-arm.next for the moment.

(1) we need to document the new property in
    docs/system/arm/virt.rst. Something like

--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -226,6 +226,11 @@ dtb-randomness
 dtb-kaslr-seed
   A deprecated synonym for dtb-randomness.

+virtio-transports
+  Set the number of virtio-mmio transports to create (between 0 and 32;
+  the default is 32).  Unused transports are harmless, but you can
+  use this property to avoid exposing them to the guest if you wish.
+
 x-oem-id
   Set string (up to 6 bytes) to override the default value of field
OEMID in ACPI
   table header.

would do.

(2) I think we should call the property virtio-mmio-transports,
to make it clearer to the user that this is MMIO-specific and
nothing to do with the much more commonly used PCI virtio.
What do you think?

thanks
-- PMM

