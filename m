Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp2504575ejh;
        Tue, 30 Aug 2022 11:09:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4OnEoEaPhKwUby8f3r0lxKmrgT4twkurrvvPIGjtAbmgnfVUx3Oq5egJ+pjK8nj31YmCUW
X-Received: by 2002:a05:620a:955:b0:6be:74ee:c66c with SMTP id w21-20020a05620a095500b006be74eec66cmr10952976qkw.511.1661882958164;
        Tue, 30 Aug 2022 11:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661882958; cv=none;
        d=google.com; s=arc-20160816;
        b=xTpOut6Git4CqsG+UK3RE9psStAUdI2jDGSshHBGojbyiG6gpCaLHgzws0ygTOLjLv
         wFIX+V71iDhsL69+UT2UxdeW2x0OAGcKEeFMbdtHvdWBUq+ZZJvHLuqKBgvV1jEIV3FS
         4BsKxo9ke6VtiZrwTC7828NjPblp/YH949yzdh9JTGEMcnau4Sgl1fuvPMUe8BqFFsKQ
         eM1D4jlFdUREvwBTN7H0kiUnj8Iv9aAR/Z8594Xd/il1jbLuprcd79+ci/lGRSeI8G6/
         FhA8bRpRsFEPCC2firJGzqrkAGIx4WfUf4iAIOM1Ndo4xRw4EJNdDTKwnP9eXUXky9sy
         tM6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:dkim-signature;
        bh=QQQH5ELV9lfJk1pm5p+2zXE9V/M6oFJYxtdVlp7QE84=;
        b=Ol2azTRXZrBZau3C3dsWD59Lokl9UlEvnyAmaF8SFsrwJFYYD7qhnUm9fx4JcBatYZ
         Y+K2QTfjypXrNzLoGxEUDKmNb9iyQY43TNQcN0rIQPylWFskJBmDR1gm9XwYlD13IaIW
         mXZ5O9CUGTc6Ip5jnCFJdJKwFJS9ZDg6NXvSeuFE5zLHGUjuX5bMGs1wRV3JtKfztdzC
         RpFgy7ga9LLaIazBpgdtjPCk7xWMpEZbyuwjt7jkHJabAM5FbmNIpmfAzdLsk9lFBBTP
         A62Fh+wTkoaFpCtt9FUSO98JyzlyQ5N9mZRju9KsUhKkewhXH5L8DKeLbk8srq1oKuG8
         uUnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cyyTX6QC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020ac85f82000000b0031f4f8c3b28si7102238qta.517.2022.08.30.11.09.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Aug 2022 11:09:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cyyTX6QC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oT5fp-0007gT-If
	for alex.bennee@linaro.org; Tue, 30 Aug 2022 14:09:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oT5YN-0004Bw-T7
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:01:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oT5YM-0005Xy-5L
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661882493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQQH5ELV9lfJk1pm5p+2zXE9V/M6oFJYxtdVlp7QE84=;
 b=cyyTX6QC3cJMosYE+KIybsOPGcflAUDTpVSlhE7J8l+y87/RBKf3b/0449PFKpylog2fp8
 LDay6356bIYlPGl++o+RxlJzs5tutLJkx47p+tNnqwihm0c9WPwZ0Bhp1Na9s1tzHDm+0j
 Uy8Psot3n+CfVHXTAciAWgsTMmmP80w=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-45-zQ0If9jGNYu7soZN7CmVZw-1; Tue, 30 Aug 2022 14:00:17 -0400
X-MC-Unique: zQ0If9jGNYu7soZN7CmVZw-1
Received: by mail-io1-f71.google.com with SMTP id
 q10-20020a0566022f0a00b00688d703717bso7090116iow.9
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 11:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc;
 bh=QQQH5ELV9lfJk1pm5p+2zXE9V/M6oFJYxtdVlp7QE84=;
 b=e34u4AfpNR2V0VInZ9sMxxNpXd0g8mPtrp2Xu3pn6nz10JSDbxD1hHL+0itBlqhnKP
 4k3nON3KXOatJW5APEt5KX+o4cuZIwIFMFMjQ2xO6L/4SGhXUAGYT4F+Xgab4U5440CX
 btcIu8UqP1p2pqacPjLctwmPiAMtQSADnd2qKgzMbiUxrMd4UFpq2YEegnQynVtH+TiB
 46l9vgIkxvNSeh7oWUPoJfIbcr9eTcXfPBsvzQIJtQ9GzMR/lZytuQ4T7UX+5CHIrK5S
 UTyki/t0+Y3NtC9DdObk2GLDfWMKYe0l+H7swzqhkKl4jWMH8b5iQy2YKqGOoxh/nZ8a
 rgxw==
X-Gm-Message-State: ACgBeo2b7OWwHaR6Oa7LNSZUhRGd3dUa7PS+t1h5sodmQ+f9KRK598nn
 vPXen4056k92MtllQQJDcSgh1BygeY87Ks+iZuDMxgeowbn8izp894hWuXr5jObkN+oSdgqK0bb
 TMCNoFcnwGE6rvas=
X-Received: by 2002:a92:6903:0:b0:2e5:8f47:22e0 with SMTP id
 e3-20020a926903000000b002e58f4722e0mr13024954ilc.97.1661882416773; 
 Tue, 30 Aug 2022 11:00:16 -0700 (PDT)
X-Received: by 2002:a92:6903:0:b0:2e5:8f47:22e0 with SMTP id
 e3-20020a926903000000b002e58f4722e0mr13024945ilc.97.1661882416554; 
 Tue, 30 Aug 2022 11:00:16 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 y9-20020a056638228900b00344c3de5ec7sm5691940jas.150.2022.08.30.11.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 11:00:16 -0700 (PDT)
Date: Tue, 30 Aug 2022 12:00:14 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?B?5bCP55Sw5Zac6Zm95b2m?= <akihiko.odaki@daynix.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org, "Michael
 S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, John
 Snow <jsnow@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason
 Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>, Keith Busch
 <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>, Peter Maydell
 <peter.maydell@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Paul
 Burton <paulburton@kernel.org>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>
Subject: Re: [PATCH] pci: Abort if pci_add_capability fails
Message-ID: <20220830120014.55f55b24.alex.williamson@redhat.com>
In-Reply-To: <874jxuhshs.fsf@pond.sub.org>
References: <20220829084417.144739-1-akihiko.odaki@daynix.com>
 <874jxuhshs.fsf@pond.sub.org>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xiKfjd3nvPvI

On Tue, 30 Aug 2022 13:37:35 +0200
Markus Armbruster <armbru@redhat.com> wrote:
>        if (!offset) {
>            offset = pci_find_space(pdev, size);
>            /* out of PCI config space is programming error */
>            assert(offset);
>        } else {
>            /* Verify that capabilities don't overlap.  Note: device assignment
>             * depends on this check to verify that the device is not broken.
>             * Should never trigger for emulated devices, but it's helpful
>             * for debugging these. */
> 
> The comment makes me suspect that device assignment of a broken device
> could trigger the error.  It goes back to
> 
> commit c9abe111209abca1b910e35c6ca9888aced5f183
> Author: Jan Kiszka <jan.kiszka@siemens.com>
> Date:   Wed Aug 24 14:29:30 2011 +0200
> 
>     pci: Error on PCI capability collisions
>     
>     Nothing good can happen when we overlap capabilities. This may happen
>     when plugging in assigned devices or when devices models contain bugs.
>     Detect the overlap and report it.
>     
>     Based on qemu-kvm commit by Alex Williamson.
>     
>     Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>     Acked-by: Don Dutile <ddutile@redhat.com>
>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> If this is still correct, then your patch is a regression: QEMU is no
> longer able to gracefully handle assignment of a broken device.  Does
> this matter?  Alex, maybe?

Ok, that was a long time ago.  I have some vague memories of hitting
something like this with a Broadcom NIC, but a google search for the
error string doesn't turn up anything recently.  So there's a fair
chance this wouldn't break anyone initially.

Even back when the above patch was proposed, there were some
suggestions to turn the error path into an abort, which I pushed back
on since clearly enumerating capabilities of a device can occur due to
a hot-plug and we don't necessarily have control of the device being
added.  This is only more true with the possibility of soft-devices out
of tree, through things like vfio-user.

Personally I think the right approach is to support an error path such
that we can abort when triggered by a cold-plug device, while simply
rejecting a broken hot-plug device, but that seems to be the minority
opinion among QEMU developers afaict.  Thanks,

Alex

