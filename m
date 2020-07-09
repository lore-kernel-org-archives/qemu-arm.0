Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1718901lfm;
        Thu, 9 Jul 2020 12:19:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwICUnTpZStdBweNFKgtlDxV9o6mi84DcYn6JiI8McP+aQieQwGdWNB4t4+Fa67+wsixeZy
X-Received: by 2002:a25:9c44:: with SMTP id x4mr78900273ybo.510.1594322394373;
        Thu, 09 Jul 2020 12:19:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594322394; cv=none;
        d=google.com; s=arc-20160816;
        b=ugXd7tyUmwEpqsS5l2MUW/glYUDIgH2sPBp98NYKOoXFSk4nrAZUQX8dtB47mbxkkV
         LHrG0oFRHEj8sXcctk4urB0W/b9yfD6Q+PHEifpMCuSWBmbUPm4f7RNNEWYX3G2FMGJ6
         V/F76pZwgWp3je/gKwQQvsrJQC+2pnMBErW6Fkb9E3amHGgM/QjNtwu4NtXKICOGfzmI
         7lACRSqShKTumvMVw7LKtL+7BkBC2pVWzVQIny6zdFC7hzLoCvOiHSy5QpxDZNaLaSMI
         mQ0Kwwhcl7ZfdYBYwJyYst7o/x2mCoo2mjSfjXez4gBHBEylnmPb1VWHLChBUdqNcJ72
         11Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=P2qYvp66cuwqIuOxXjaqzUeXwAbQY2fv8/ZXtTQnDqM=;
        b=Jt4d1OtU8by7gA6NDoWUAAaXEDTBkIfFwNgzirnbSqs3g/qNyFRZfIWnDAVMyyDFTH
         cJPqOb81n7+e0a64Xtls88z33HavHRYArAuwGIy5k9VQ9Ej6ZHC1pqR4zNBwlCCDdxrz
         oD85a+14OK8X9JapuMTh34qpVdoG9qI+8nhLICseNpPKmR23V+LSOktzSZGTW2uIEoaP
         40gPjMSM2IMrFQem8qk+mKe+ISFqkhWlSo5l/uzPakxHOmOIJAUlGwG3ifdJUxHME5Kd
         +WPnWKaGALarYqkHpzTVjL6/saAUq4SsJzRRLgtgfP/fT50YTKsTCAeG1aNW8CszH95y
         /m1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=axsHK+OZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si3261382yba.199.2020.07.09.12.19.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 12:19:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=axsHK+OZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtc5J-0001E1-9i
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 15:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtc5C-0001CY-Ft
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 15:19:46 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtc59-0005gQ-N6
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 15:19:46 -0400
Received: by mail-ot1-x342.google.com with SMTP id 72so2492102otc.3
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2020 12:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P2qYvp66cuwqIuOxXjaqzUeXwAbQY2fv8/ZXtTQnDqM=;
 b=axsHK+OZoKBvTOTWyMmTiLsz6mEUMP57JgAYTItukgVKlo/j0qVkhSECe8HZgHVXyX
 InUG1bmqckmmqqk4sOJutFIJ4T6B+emqWgAos8oSyXOJadwIRMWUK/+oWeBckxbExfXI
 YgXZgcBrHNF7gXQ8M1DUX+gM241cVyRK8ew1phoO+U0J89bkK6gZolJbNxSx0jRlu5OI
 wQr0J4UFDSukJ126Muo/A9jyHydDDz7iRcB1n6x5QQ1kunFgLnvwOgaZlTvI77eiEiGy
 SmfCXtyvAhEqq1lx92P/nBacP7Po3bxSYyef1RWdZCS+lsXIBg4VNhFUvMRcOriIWFyt
 9VVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P2qYvp66cuwqIuOxXjaqzUeXwAbQY2fv8/ZXtTQnDqM=;
 b=UAeemGyzNQcdvi2Qdlrqfh0rha3o6FwDRzykAfXdKLy3dVCsyQaRK54le58NqAu3Es
 7yV4Ue1KPLKDvhdATJMPEEiAj6nEPXjtmzqRpJPa3js4iSej3lNpdtvuockSOfcPRaaY
 4j0gnxZbAmIyQ1ovZYZOmu7BeZrdSSwnhnD+usRmuu5VxUAYb+2QuyW3WZj1DFGBFJmW
 2xrEnSj+EO5/CGVcp0z1ghb8Hz8zOuYQ3YmgW1rMx2KXK6dkXmHnRJv9XmigaPCMC89J
 rXaTbRZNAg0aW6bunuMdMXTnRQ6FynIHE+f6Z6apV7eWpetJ7KKZZ4NbfzyX3Qxy0uiP
 PwEg==
X-Gm-Message-State: AOAM530HDnQL3DFhzDmRAC0BvzJPdNvU7lFJ+t9nu251SG2mhVWUU7yn
 5ac+nn7KlMclahdgj1IoE8QvmUSkXPAKKgZnBT9KEg==
X-Received: by 2002:a05:6830:10ce:: with SMTP id
 z14mr48306860oto.135.1594322382470; 
 Thu, 09 Jul 2020 12:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200703201911.26573-1-f4bug@amsat.org>
In-Reply-To: <20200703201911.26573-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2020 20:19:31 +0100
Message-ID: <CAFEAcA8Cu2N5qX55rUk_yd4R6PdJX+X5KPQmMiQPFakP3ShZ-A@mail.gmail.com>
Subject: Re: [PATCH 00/18] hw: Mark the device with no migratable fields
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nll73xQBxgw5

On Fri, 3 Jul 2020 at 21:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> This is a proof-of-concept after chatting with Peter Maydell
> on IRC earlier.
>
> Introduce the vmstate_no_state_to_migrate structure, and
> a reference to it: vmstate_qdev_no_state_to_migrate.
> Use this reference in devices with no fields to migrate.
>
> This is useful to catch devices missing vmstate, such:
> - ads7846
> - mcf-uart
> - mcf-fec
> - versatile_i2c
> - ...
>
> I am not sure about:
> - gpex-pcihost

I think it's correct that this has no internal state:
the only interesting state is in the GPEXRootState, which
is a TYPE_GPEX_ROOT_DEVICE which migrates itself.

I made some comments on the "meaty" bits of the patchset,
and reviewed one or two of the "mark this device as
having no migration state" patches, but it doesn't seem
worth reviewing all of them until the migration submaintainers
have a chance to weigh in on whether they like the concept
(I expect they're busy right now with freeze-related stuff :-))

thanks
-- PMM
