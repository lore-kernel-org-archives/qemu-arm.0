Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2783039eja;
        Mon, 6 Nov 2023 06:06:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF78QnwqpCLxuxC3blsFEiPvsOjiBpS4+OoHyUXp3PlWySRYBdP/tdqKDucnqN1CFM3rPcs
X-Received: by 2002:a05:620a:3c81:b0:775:cf5e:a66d with SMTP id tp1-20020a05620a3c8100b00775cf5ea66dmr25551106qkn.24.1699279581884;
        Mon, 06 Nov 2023 06:06:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699279581; cv=none;
        d=google.com; s=arc-20160816;
        b=phEmds81wXejo5CednQYT0vxEHjcQDMTKdinMIfwJmBL9nH+K3fhZpslEfDmc7bViz
         k2EMOjKChcKlURnnYIFAtfq5yJnVXBKSiLgpZbvwewQ9Q+fPXx57UL6eSuN/RKONKH1h
         nRs5rINgCZDPkafr6nVkQucRcMnKcfwcdzIhTn8SiaONvKa1LlKzbh+DtiFojieXlfhh
         juDhHbrwopI5GqSqIfT5iYEB9OT+V/rX981MXID3qnYiwwkONX7wxqqCx4sjfQbaRkW7
         0SaMDqaXAHfOpE8Bn7hln2iyTZo0qCmSMuWXaSEvXlRppOCublFWuvxFKkENtwE/gJkM
         a2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=pD65NxC9SsOFtcmqkdSzLnveDY+EeTkeb86KlLLSh80=;
        fh=MMw2CKgCjtCuoNDR7xbB6QxX/Y2uo0ThDtIY+3EYr8w=;
        b=Wi2p5h7HkB+m77DW7WXE2qw9CExkUbaj8FYnqVAgQhCpmwc2QzXGUH85psAPp50j+9
         27Oto2CXD+c0f7NS4gZ1DohykvWcpeAfmuU4qlf9IUFDC6mcesctW3gXUTJaG6vj4SBT
         y1nMBQWNGs9FpM3rTIB72q8u0RM8aQQcB6zucPezAqDDr/t2muj6ptMKgZLnr1R05tQL
         be5fkL/qk9GzlYKK/45seSJHcdOffhn9Ov2vdAegrkdR+1aIvrJOc4vrQxsEREKeoHu8
         fF7/UDGXU+6vmk8NVrvkhNPbKD0dJhpo/n7ugxKgPDpBXVOiBzEkNJhGn5fjiFQ+fsLw
         8c5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DTQpntfg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020a05620a023400b00768b6bc7aa0si5115975qkm.713.2023.11.06.06.06.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 06:06:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DTQpntfg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r00Ei-0002oL-Tw; Mon, 06 Nov 2023 09:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1r00Ec-0002mI-1i
 for qemu-arm@nongnu.org; Mon, 06 Nov 2023 09:05:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1r00EX-0001dE-C7
 for qemu-arm@nongnu.org; Mon, 06 Nov 2023 09:05:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699279539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pD65NxC9SsOFtcmqkdSzLnveDY+EeTkeb86KlLLSh80=;
 b=DTQpntfgWFn7oJBgzskagilKHgMh8i9QlCUweNADNyhXKth82+SGsNAw5Pg02n0aivkm99
 qR6uKGIWacC+Lt1Yk1OfkN0sTwnY8dafojfA/vyMbekDHKOyXz0BOZtfrXQ8o+0pQdxReL
 p4xlEPnz7Okn6wazyMBy1PgkK08CkN8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-PtFrJHH2MjybXLwKyUMlzw-1; Mon, 06 Nov 2023 09:05:38 -0500
X-MC-Unique: PtFrJHH2MjybXLwKyUMlzw-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-66fa17e145aso55917466d6.0
 for <qemu-arm@nongnu.org>; Mon, 06 Nov 2023 06:05:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699279538; x=1699884338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pD65NxC9SsOFtcmqkdSzLnveDY+EeTkeb86KlLLSh80=;
 b=BxiB1UTw9x52/ZBADV4u/F9X3stFade1u5MdfyL4BoUQ6AtTwgqaooUPVrij7GVXZA
 GlX7/Cb/e1SolAQCe/0fnb2HkJLOinIyWyZrEr/Jtnflx0JPYCEFHq5/bucs0tf37i+l
 BACW0Pb+7WJaHm81gXrgANPyhhsSyb7ybqSLXKktgAEAXpFhnAP6gOLfIsy1uB7Sad6f
 /GiiFtvvlkiCKBrIxaCjWasaBw5i4ZyD6WnafWUOJqZHpM7sx8ghQ+p4CZaXwkhLbIXJ
 EaEqKXiKh03aveGxn6JHiNrTEx52pSTlo7wzECblNXTv/+aU9EzTxcRKyOijVNKkjM2p
 BcOg==
X-Gm-Message-State: AOJu0YzIEUGb10hT90M75lMYrz7yBMhHnKAnfb6seF1UI9H6Y1IfVtnA
 bgvxCqcD7vQ1FpL/eDylPGh7LXEMmz4N7JLq4XBXwcjE2f+EZEZ2SinXjayRDnKsfwCfjTTeiXU
 qpSpOf/4F1IY5
X-Received: by 2002:a05:6214:1c41:b0:66f:aed2:64de with SMTP id
 if1-20020a0562141c4100b0066faed264demr36629234qvb.5.1699279538073; 
 Mon, 06 Nov 2023 06:05:38 -0800 (PST)
X-Received: by 2002:a05:6214:1c41:b0:66f:aed2:64de with SMTP id
 if1-20020a0562141c4100b0066faed264demr36629198qvb.5.1699279537690; 
 Mon, 06 Nov 2023 06:05:37 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 i17-20020a0cfcd1000000b0065b02eaeee7sm3442569qvq.83.2023.11.06.06.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 06:05:36 -0800 (PST)
Date: Mon, 6 Nov 2023 15:05:33 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Udo Steinberg
 <udo@hypervisor.org>
Subject: Re: [PATCH v3 2/3] hw/arm/virt: Report correct register sizes in
 ACPI DBG2/SPCR tables.
Message-ID: <20231106150533.1b166fb5@imammedo.users.ipa.redhat.com>
In-Reply-To: <CAFEAcA-iSvg0r7-pRbv07p80Fy4ZEii0Md2DnuGs_=djdBe-HA@mail.gmail.com>
References: <20231103152120.829962-1-peter.maydell@linaro.org>
 <20231103152120.829962-3-peter.maydell@linaro.org>
 <CAFEAcA-iSvg0r7-pRbv07p80Fy4ZEii0Md2DnuGs_=djdBe-HA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: E+Ck1WXgQyvS

On Fri, 3 Nov 2023 15:26:22 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 3 Nov 2023 at 15:21, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > From: Udo Steinberg <udo@hypervisor.org>
> >
> > Documentation for using the GAS in ACPI tables to report debug UART addresses at
> > https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table
> > states the following:
> >
> > - The Register Bit Width field contains the register stride and must be a
> >   power of 2 that is at least as large as the access size.  On 32-bit
> >   platforms this value cannot exceed 32.  On 64-bit platforms this value
> >   cannot exceed 64.
> > - The Access Size field is used to determine whether byte, WORD, DWORD, or
> >   QWORD accesses are to be used.  QWORD accesses are only valid on 64-bit
> >   architectures.
> >
> > Documentation for the ARM PL011 at
> > https://developer.arm.com/documentation/ddi0183/latest/
> > states that the registers are:
> >
> > - spaced 4 bytes apart (see Table 3-2), so register stride must be 32.
> > - 16 bits in size in some cases (see individual registers), so access
> >   size must be at least 2.

it might be worth mentioning that QEMU impl. uses 32 bit registers and
can correctly handle 32 bit access only, while 16 (or any other) bit access
to 32 bit registers won't actually work.  

ex:
pl011_write()
   ...
   switch (offset >> 2)

essentially only 1st byte will be accessed correctly,
the rest will be misplaced as read/write handlers do not account
for split access possibility.

So it's not about what linux or NOVA do, but rather fixing
ACPI description to match what the device model is capable of.

> >
> > Linux doesn't seem to care about this error in the table, but it does
> > affect at least the NOVA microhypervisor.
> >
> > In theory we therefore have a choice between reporting the access
> > size as 2 (16 bit accesses) or 3 (32-bit accesses).  In practice,
> > Linux does not correctly handle the case where the table reports the
> > access size as 2: as of kernel commit 750b95887e5678, the code in
> > acpi_parse_spcr() tries to tell the serial driver to use 16 bit
> > accesses by passing "mmio16" in the option string, but the PL011
> > driver code in pl011_console_match() only recognizes "mmio" or
> > "mmio32". The result is that unless the user has enabled 'earlycon'
> >  
> Oops, a line seems to have got deleted here -- should continue
> 
> "there is no console output from the guest kernel."
> 
> > We therefore choose to report the access size as 32 bits; this works
> > for NOVA and also for Linux.  It is also what the UEFI firmware on a
> > Raspberry Pi 4 reports, so we're in line with existing real-world
> > practice.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1938
> > Signed-off-by: Udo Steinberg <udo@hypervisor.org>
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > [PMM: minor commit message tweaks; use 32 bit accesses]
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > --  
> 
> thanks
> -- PMM
> 

