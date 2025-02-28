Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp630225njb;
        Thu, 27 Feb 2025 17:56:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUxeq/czqBi+dK88BAIHtJN2jencBqaZoidOkrpEZHNl2tYznzlI52se9YF4lDVQVDHocpZHG2n1rdsww==@linaro.org
X-Google-Smtp-Source: AGHT+IG5BYch81resrAJzJYMBvq78RFlga/86nxgq81iEpOekmIdFNQF0Wwe73ewzjUgYsBsa7oD
X-Received: by 2002:a05:620a:4451:b0:7c0:b0eb:4fa5 with SMTP id af79cd13be357-7c39c49d894mr219769885a.4.1740707775153;
        Thu, 27 Feb 2025 17:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740707775; cv=none;
        d=google.com; s=arc-20240605;
        b=CQx4r5+YlkqA7ygafGQJUnpi8jPtXdWsXI4aIM2m2IGjCI10ub5IHdWFUwWiWCZCTJ
         5wsFLuMSA8+tnJgwULQj7875H9nSuxF/gl3e0SlIET0rKJbXFmfYwl5E9x1vl1zpqNEO
         IR8iAYD8z6GHXXd4ZjUedQMRRqLHXXWLcaeVwIkL+xWcDSJoM+ve/8HfJ+7WZXOopNbE
         RC7SPNoa+d6mFYBQ1AAZmbiunobFbCHlm4jVhXGx4gfUehosJR2S4udmq2iomiimMabI
         bmQS/yd3O7VVOS8V71TS+w7xZV0lub528IFKTA39ovj08GTjepHyklfnLqEaUDv3oAbI
         zUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=OI0+5c9vFb6nWxhQJwq+SPXzp1sJjWGrc7MMOg9BlY0=;
        fh=jaKv0nqk24nD12PVOVCnyDKdsvg2A4OxF/Ltxf7HZ5Q=;
        b=PtFMM1nGZqUF9jOOpqJpPnu1kjsEs6FX6QJ+KLI5UsYrnu6DgHM0kbS+2CqDEtVpTC
         zABCTfr5j1rqO/HWeor5REDB+K5eD48miwNQgtyc7JKp6M9ag0u5Wka7bEU4NfHFl94o
         6edsUtqkDyYoBjFtjE+EuqxzXFiPgK2rtchxKGxaCn8eI75khCX0dSSILCy91C0i2FFW
         T2uqJgW5bJuaKYtJMyZoqnZxykLYkPFN21/Ax5UdVZb8sebwlgh3hNxTwzth3ezLumwK
         h+v/H1uFSPLgYVMQ5f0UHXgQj0/fUknfTF0OfkWeVP1+IEK24rP0Ghqfkyugyb84OESB
         +Glw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c378db23afsi231141585a.595.2025.02.27.17.56.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 17:56:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnpbc-0004sm-Vq; Thu, 27 Feb 2025 20:56:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnpbb-0004sY-Dz; Thu, 27 Feb 2025 20:55:59 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnpbY-0007C6-U1; Thu, 27 Feb 2025 20:55:59 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z3rpV44Lsz6K9Kv;
 Fri, 28 Feb 2025 09:53:38 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 662F2140134;
 Fri, 28 Feb 2025 09:55:38 +0800 (CST)
Received: from localhost (10.96.237.92) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 28 Feb
 2025 02:55:34 +0100
Date: Fri, 28 Feb 2025 09:55:29 +0800
To: Gavin Shan <gshan@redhat.com>
CC: Igor Mammedov <imammedo@redhat.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <mst@redhat.com>, <anisinha@redhat.com>,
 <gengdongjiu1@gmail.com>, <peter.maydell@linaro.org>, <pbonzini@redhat.com>,
 <shan.gavin@gmail.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 4/4] target/arm: Retry pushing CPER error if necessary
Message-ID: <20250228095529.00007890@huawei.com>
In-Reply-To: <dafa471d-c5bb-4f6b-8483-17741e0caab1@redhat.com>
References: <20250214041635.608012-1-gshan@redhat.com>
 <20250214041635.608012-5-gshan@redhat.com>
 <20250219185518.767a48d9@imammedo.users.ipa.redhat.com>
 <7caa54df-abe1-4833-bb59-cb83f8241962@redhat.com>
 <20250221110435.00004a3b@huawei.com>
 <20250225121939.7e0e2304@imammedo.users.ipa.redhat.com>
 <dafa471d-c5bb-4f6b-8483-17741e0caab1@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.96.237.92]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WBLVn3/X1XBB

On Wed, 26 Feb 2025 14:58:46 +1000
Gavin Shan <gshan@redhat.com> wrote:

> On 2/25/25 9:19 PM, Igor Mammedov wrote:
> > On Fri, 21 Feb 2025 11:04:35 +0000
> > Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:  
> >>
> >> Ideally I'd like whatever we choose to look like what a bare metal machine
> >> does - mostly because we are less likely to hit untested OS paths.  
> > 
> > Ack for that but,
> > that would need someone from hw/firmware side since error status block
> > handling is done by firmware.
> > 
> > right now we are just making things up based on spec interpretation.
> >   
> 
> It's a good point. I think it's worthwhile to understand how the RAS event
> is processed and turned to CPER by firmware.
> 
> I didn't figure out how CPER is generated by edk2 after looking into tf-a (trust
> firmware ARM) and edk2 for a while. I will consult to EDK2 developers to seek
> their helps. However, there is a note in tf-a that briefly explaining how RAS
> event is handled.
> 
>    From tf-a/plat/arm/board/fvp/aarch64/fvp_lsp_ras_sp.c:
>    (git@github.com:ARM-software/arm-trusted-firmware.git)
> 
>    /*
>     * Note: Typical RAS error handling flow with Firmware First Handling
>     *
>     * Step 1: Exception resulting from a RAS error in the normal world is routed to
>     *         EL3.
>     * Step 2: This exception is typically signaled as either a synchronous external
>     *         abort or SError or interrupt. TF-A (EL3 firmware) delegates the
>     *         control to platform specific handler built on top of the RAS helper
>     *         utilities.
>     * Step 3: With the help of a Logical Secure Partition, TF-A sends a direct
>     *         message to dedicated S-EL0 (or S-EL1) RAS Partition managed by SPMC.
>     *         TF-A also populates a shared buffer with a data structure containing
>     *         enough information (such as system registers) to identify and triage
>     *         the RAS error.
>     * Step 4: RAS SP generates the Common Platform Error Record (CPER) and shares
>     *         it with normal world firmware and/or OS kernel through a reserved
>     *         buffer memory.
>     * Step 5: RAS SP responds to the direct message with information necessary for
>     *         TF-A to notify the OS kernel.
>     * Step 6: Consequently, TF-A dispatches an SDEI event to notify the OS kernel
>     *         about the CPER records for further logging.
>     */
> 
> According to the note, RAS SP (Secure Partition) is the black box where the RAS
> event raised by tf-a is turned to CPER. Unfortunately, I didn't find the source
> code to understand the details yet.

This is very much 'a flow' rather than 'the flow'.  TFA may not even be
involved in many systems, nor SDEI, nor EDK2 beyond passing through some
config.   One option, as I understand it, is to offload the firmware handing
and building of the record to a management processor and stick to SEA
for the signalling.

I'd be rather surprised if you can find anything beyond binary blobs
for those firmware (if that!).  Maybe all we can get from publicish sources
is what the HEST tables look like.  I've asked our firmware folk if they
can share more on how we do it but might take a while.

I have confirmed we only have one GHESv2 SEA entry on at least the one random
board I looked at (and various interrupt ones).  That board may not be
representative but seems pushing everything through one structure is an option.

Jonathan

> 
> Thanks,
> Gavin
> 
> 

