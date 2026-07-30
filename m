Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50489C54FDF
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Jul 2026 10:34:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpO5q-0001jK-4U; Thu, 30 Jul 2026 06:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpO5p-0001j4-5o
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 06:34:25 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wpO5n-00062l-PB
 for qemu-arm@nongnu.org; Thu, 30 Jul 2026 06:34:24 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-667971437d6so2610391d50.2
 for <qemu-arm@nongnu.org>; Thu, 30 Jul 2026 03:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785407662; cv=none;
 d=google.com; s=arc-20260327;
 b=NWxc6Tak0Ql3vrSmODQ0pQtpjm3x6DajJB2rQ6a63GZhOc3KkFK52YcV4TKU3OBCYG
 pO7WaamcjB4eCQez2cE0/n9S3dWyHsGApRi3DlsqxpHQbPlDYCF6IRcoU5ix4805w5Yi
 QRfgAlaDFEuC90XvIKxsbgrnOIMOur6qOVHjFJ/T1K2mhm9xAzyF1MPbT2HTv40ktjC+
 Al6rTgg78A/1pZ1u3DJB6OHAOi72CwgeKRHSFclrDU0BWFSowrvWD5tomjFbNFycmp7+
 kVS1Q3IYn4r0GAptgkcjpvUkF41Bg4aT9fJ3D8zkO7KbUAzJESpN6hjG7GljQ8U9k3dr
 niDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wUfthRHiqBb3xBsLHBxGBaZMfDAbD2HSehNMN9I2q2Y=;
 fh=72hHvMkORQDxVyRTGOgAV/5AmOCLmkSmLTUJlVoN0B0=;
 b=fznM61L4f2i6hzQuBh18sUKsKR+TXb3mhkE994NZtEPBMOrKCceqhbPEMQ/upNEFtp
 w72OCXbI056GHCJQ1xyCcVZO5HeCUsQoyq50KYybc7UPh3FNX30PAaA+RhisAx4LvAGq
 V2fgoN0yZ/cQ3ye6Xr+SqT+v7pGrYtmuEh/RVYWE3kxBpp84UNxwfI5Rm+kLgoNeB94U
 5oTmloqvZi8azRgOVi0UxGzY/V/Jd+ZTcDMpohnurPMyCjOnyjWzR0UkNC5wkCK/eKg2
 ct/PR8Cl/uONBsYiHMLSsjZr5gN3vSBCGxP+ewWDlSlqgwa6krNeuYb47DHOpci3LcUm
 1VPQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785407662; x=1786012462; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=wUfthRHiqBb3xBsLHBxGBaZMfDAbD2HSehNMN9I2q2Y=;
 b=XaWKPk/flAT/2qLrdYdhckBWLlVvdpqTbJiQDccZJUANHCtJ8v4fwmuguSvgzH1RE3
 h0zPiYTsY9nK0ZaL0amUKJfzAk4wyjVx1nVeQUBRPoUpMBKMpVDzYbqECZWn797PiCB5
 UHw8DLSIBU+uumh7SIVzIPR9HPoUtrAuSkzBqOmN2+AaIvWXzphOOlXSXI12phJHINgy
 3e9HC+SG9OyYyWQO/el7STI6IuO5EAuQD3E9rkiggHaf0evT6oph2B6CUJr2LRkOilTw
 n6xIKkTvNHXgvRwEHJJQkYwHKlQD8MS8ODRTCC+Hk0g6WZSUPvcuJWfE/b7xLhha6yPN
 bhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785407662; x=1786012462;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=wUfthRHiqBb3xBsLHBxGBaZMfDAbD2HSehNMN9I2q2Y=;
 b=MfbbpL1x7Qa4dGlI2awd9S17q2Zjs05y4bh2lwsW1REdjPRzSIIoRMfOLCkldN60av
 ngnS5MAzJfvmyJgxZY5uyO4YTF4AIIA3QSLEs+j82QPclABKKMsKQr2MVrCVWd0jBxnz
 DavI9QxfxvD/5wZO1TxYKIudSmuwOGo+5HMa9r6IXpMsSihOz3+hnA1jqbO5gHOEKtym
 ohOxaogBkh7c9uH8hPx0+/KxEu3v+Idxw1d3wue+o2hPVG+bymov7nJgVY2NtjawOYkW
 cwz+rBkRwmbmWWKqfS7qCv63vaXcsNI3EQZGZGdA9bDeuxtfddFDxiAtm/1ddUmklKjY
 kcEw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp/eeHAFa2yi9WqpryeOcEhZWQA9bE6ekWFxf2WuJzpAL8xZFZMgawf0JHs3DQMWneeuMax2AiC8Q==@nongnu.org
X-Gm-Message-State: AOJu0YzpG6IHoXZj5emClJLtm0A+ZPoMZ3Ua3JrZLfRhf2eohvPegUg4
 UAYoaXE49upTPjTi7bY6lwof1PGdvOBVH4TI2pOTtInTqQYz6x8HT2m8KwbNskVBvW+UCBB3L4l
 4QlljOYpflwE+nyuA1ZT8cgAAaIbubVzwPAQcF/XKyw==
X-Gm-Gg: AR+sD12scbxPeI5+rOljbBqn/BBZWmbTuMb7H+J35TQYDEhzcNmrdQEmqBTEjkRdhre
 +YFW6x5//ksuK+yfBrKpIHswpEH++1o9CuUHk2rDtf5BaRUDKlT+OT/Det+5mGiXk0tpGIQ9/h1
 q9cUuuVIixfqoLWJbdxUmxiHv9hyGgwhzcutlF6+NWJsg1h7uIX85IaFkVwYJbdgkYc6/4A5f3a
 KcXH6HDjC+xXm7FVgzOJpIcUr6rnlZboX7VXsZgGyRKzcFE6x3bI5oEGhFFhySczJNim0s2sXYE
 6ljUUHtp6siYnK6p2zkTLNyrBFhD4npLDCuMSl4dwuzEQY8hqIV4r9jlciSVPIKopAszH9yWws3
 1m3Iz//ngEvJsb0J6ljzbDKIAIbOwm3tHbIdrxdk=
X-Received: by 2002:a05:690c:6a0b:b0:80d:5ddd:1989 with SMTP id
 00721157ae682-81fb891e18fmr12463087b3.10.1785407662413; Thu, 30 Jul 2026
 03:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260728031731.286666-1-gshan@redhat.com>
 <20260728031731.286666-3-gshan@redhat.com>
 <20260729182316-mutt-send-email-mst@kernel.org>
 <CAFEAcA8nxsXNPuqOoc4DGnHbCKQ-pBJib4JhXnYkzMg79GMfAA@mail.gmail.com>
 <20260730062155-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260730062155-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jul 2026 11:34:10 +0100
X-Gm-Features: AUfX_mwJ2MI7LWs4BECwMrgTBZakM1zAATcqiS8nddtqW6Hd7PF_7BUI1NUnB0Q
Message-ID: <CAFEAcA_xWqomb6jPf_9RmAfaf77uHajMkQk4biOcK3xR+Rgunw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] system/memory: Use qemu_ram_move() for directly
 accessible regions
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 peterx@redhat.com, philmd@oss.qualcomm.com, richard.henderson@linaro.org, 
 alex@shazbot.org, berrange@redhat.com, philmd@mailo.com, david@kernel.org, 
 clg@redhat.com, pbonzini@redhat.com, phrdina@redhat.com,
 jugraham@redhat.com, 
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Thu, 30 Jul 2026 at 11:27, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Jul 30, 2026 at 10:24:32AM +0100, Peter Maydell wrote:
> > The idea is rather just to ignore the unaligned-access-to-not-RAM
> > case as "only a theoretical issue" and default it to memmove().
> > If anybody reports an actual problem we can think about it then :-)

> Well given the only reported case of virtio DMA into vfio memory we have is
> GH100 and that one is mapped MT_NORMAL, I'm fine with that.

> I feel extending vfio to report the mapping type to userspace might
> not be a bad idea down the road, though. "Directly accessible"
> is a very rough approximation to the rich variety of mappings
> available across architectures.

Yes, this sounds like a good longer term idea. If userspace doesn't
have a way to know what the mapping behind something it's mmap()ed
is then it can't know what operations it can and can't safely do.

-- PMM

