Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp490797njc;
        Thu, 8 Aug 2024 05:45:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQirwykbhkLQKR3xHnQ3nATDYp9nOr1THmppCWUEfy/YLTEZXXexxTKRoNfweSoLVug2k3qhis0BRWKso8TXBFHdIFnE7I
X-Google-Smtp-Source: AGHT+IErvXBzlZafFpQLom+E6okE420AkTpf+3x9PZUUVfFXfjnMi6KmrzzK1yVatE2p5G832rbn
X-Received: by 2002:a05:6830:358f:b0:709:396c:c465 with SMTP id 46e09a7af769-70b4fc68aabmr2398805a34.18.1723121137390;
        Thu, 08 Aug 2024 05:45:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723121137; cv=none;
        d=google.com; s=arc-20160816;
        b=CxB0OSxjmmgHG1d+arRnUNFxN46lSFebNmtGzLy2vRAnpXsZpcxA0X61MGEIZlv56f
         h9mBag5Ti6cjokVr/s15KIu4IeTYILqp+fKgGILKjrF5t8tRcd8ai0H+Ot4H+gDlQF0X
         5gX3oX4aMhUowU1ul3MaMvjZzzy5bL1MZllht7hQwnL+aa9BldXrlklGM68uOZp1wa0I
         Aprlm+yBYtIhz6dc5PvFwM+gG2C99ZH6PuvZq4gkDAlgdCMdNxl0cMMRIMQUgtpYOhoi
         GCrkOLtoMtqsPkV/K0g5nHIZz2OHGsRXadiQHt8d+EpaDL/gAHxUaZ3d5inS/8U/7nBO
         NsXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=ptKDxgrGdse9UED2SWQeru7lsVTSreNqiYvZX807YgA=;
        fh=sew7c4gvAjTuiiZk2WNxcGjDB/kJeGRY5asucsczMjs=;
        b=NTsVDtlA4PpdJEUpaMZmO8X0u1IjtNhQxuhdI5AxZ+u6IxtFXctPtjFYH8K5IlVRS6
         mQ4EQzehzcgy+3XcBklYXHpk9jviexAvgXLdutcJ3LTUnCdI0Pg1JVNb9Ebz7zFZuY/O
         1oO4QRzXyP42aH4pYlHCbQnyDj9XIPA0jeZil/flHtWxZR9UmqnS3MW2rk+/19OuZXab
         NhTBaPEbAUCza/HcRIm0mHszDA6ea7x/dbGzhpFUjTSehFHLXGsYkxxqKlZihEyF93Nx
         KjllFkFfUEqQsLPnOzGPyRBJfNC+ZgnjoUn3LnHShtDL5vyKG6HO3v7qYpEWNdZovaJD
         pMlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WymqIFU5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb5f7e02si44748036d6.91.2024.08.08.05.45.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 05:45:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WymqIFU5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc2WG-0000JB-DL; Thu, 08 Aug 2024 08:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sc2WC-0000H0-OB
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 08:45:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sc2WA-00088r-MA
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 08:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723121121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ptKDxgrGdse9UED2SWQeru7lsVTSreNqiYvZX807YgA=;
 b=WymqIFU5QWjk+D4I69EQmNOs4puqK6jlOFEMNilFsXXBffGC0aTTA6k7VefqxHHnKvLKmL
 MJm86oy5t+eqyrJbdI7IFoTCUFbZfcv8JpWYs2mEam9s725pOz7gu6YM3Sa+MTRHgf3SKa
 U8G2Hljn4wJbUdqSm/uupThX2sQl0Ag=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-ZnVy09doPAyQEzwD8tWm2A-1; Thu, 08 Aug 2024 08:45:20 -0400
X-MC-Unique: ZnVy09doPAyQEzwD8tWm2A-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ef23ec8dceso8324711fa.0
 for <qemu-arm@nongnu.org>; Thu, 08 Aug 2024 05:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723121119; x=1723725919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ptKDxgrGdse9UED2SWQeru7lsVTSreNqiYvZX807YgA=;
 b=OM/vm3l3lXZAzfxPXCT7ae1ZY3LuOJXl7JCAmgn3PRvsaRgKGWNsn2UaT1BqDU26SO
 WrznJhWMWIOTNw7GyVp6xJSWJTfeCi+eNkxRLKzvET0AN3YEL4s9eR5bWEQRTa3QHEmm
 RDOjlxXwE2cKuevhRuSMsl3sIaCcC4pMZ4CFK1O2kBon1glYVSBY8y0HdQvVO9utW5RL
 oTjPFfAEZ7F7vZHiWG/gifad8QXUL42eIo83+7Pw2Qkc86t7LOxZ8zsY1Y02OgL7vfWk
 ZgbzrdeUVt8m+hi5RkZBxTL7zZVZB63/+BLazxqyncxEspe9p413aF921CIe4oDigiHM
 jdLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDKsZLgHsIqJbpC7KnqAHuqph2jRHNY8+B1zDAf2bcNDWw/gy83dXiPqnwz/b0zffdjg6tS5lxxxltNBPU+o2wNAcG
X-Gm-Message-State: AOJu0Yyth7If6N9qhxqZGE+8Ye6UsshuVnorRsfrcpzFJi3Ua8DQZYtx
 +msDIsdJvs4KNF5si+NuZOhsu1my8Qt+rj7ZUxX2bSkv/t4FpOwFDLDFLruForzyOuAckrzPec7
 7r4wzkiWfJEPEirPwnhDwxyRhp6U73H43CDZzc1iEia+BAjFX7w==
X-Received: by 2002:a05:651c:204:b0:2ef:22ed:3818 with SMTP id
 38308e7fff4ca-2f19de759f9mr11082521fa.32.1723121118855; 
 Thu, 08 Aug 2024 05:45:18 -0700 (PDT)
X-Received: by 2002:a05:651c:204:b0:2ef:22ed:3818 with SMTP id
 38308e7fff4ca-2f19de759f9mr11082211fa.32.1723121118172; 
 Thu, 08 Aug 2024 05:45:18 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429059cf83dsm71238425e9.47.2024.08.08.05.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 05:45:17 -0700 (PDT)
Date: Thu, 8 Aug 2024 14:45:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 6/7] acpi/ghes: add support for generic error
 injection via QAPI
Message-ID: <20240808144514.399e9e4b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240808141114.3b021f80@foz.lan>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
 <20c491e357340e0062b6ff09867c1661ed4d2479.1722634602.git.mchehab+huawei@kernel.org>
 <20240806163113.3bdc260a@imammedo.users.ipa.redhat.com>
 <20240808141114.3b021f80@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wCupzbxaiZiB

On Thu, 8 Aug 2024 14:11:14 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Tue, 6 Aug 2024 16:31:13 +0200
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > > +    /* Could also be read back from the error_block_address register */
> > > +    *error_block_addr = base +
> > > +        ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t) +
> > > +        ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t) +
> > > +        error_source_to_index[notify] * ACPI_GHES_MAX_RAW_DATA_LENGTH;
> > > +
> > > +    return true;
> > > +}    
> > 
> > I don't like all this pointer math, which is basically a reverse engineered
> > QEMU actions on startup + guest provided etc/hardware_errors address.
> > 
> > For once, it assumes error_source_to_index[] matches order in which HEST
> > error sources were described, which is fragile.
> > 
> > 2nd: migration-wive it's disaster, since old/new HEST/hardware_errors tables
> > in RAM migrated from older version might not match above assumptions
> > of target QEMU. 
> > 
> > I see 2 ways to rectify it:
> >   1st: preferred/cleanest would be to tell QEMU (via fw_cfg) address of HEST table
> >        in guest RAM, like we do with etc/hardware_errors, see
> >             build_ghes_error_table()
> >                ...
> >                tell firmware to write hardware_errors GPA into
> >        and then fetch from HEST table in RAM, the guest patched error/ack addresses
> >        for given source_id
> > 
> >        code-wise: relatively simple once one wraps their own head over
> >                  how this whole APEI thing works in QEMU
> >                  workflow  is described in docs/specs/acpi_hest_ghes.rst
> >                  look to me as sufficient to grasp it.
> >                  (but my view is very biased given my prior knowledge,
> >                   aka: docs/comments/examples wrt acpi patching are good enough)
> >                  (if it's not clear how to do it, ask me for pointers)  
> 
> That sounds a better approach, however...
> 
> >   2nd:  sort of hack based on build_ghes_v2() Error Status Address/Read Ack Register
> >         patching instructions
> >                bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,                
> >                    address_offset + GAS_ADDR_OFFSET, sizeof(uint64_t),                      
> >                    ACPI_GHES_ERRORS_FW_CFG_FILE, source_id * sizeof(uint64_t));
> >                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^
> >         during build_ghes_v2() also store on a side mapping
> >              source_id -> error address offset : read ack address
> > 
> >         so when you are injecting error, you'd at least use offsets
> >         used at start time, to get rid of risk where injection code
> >         diverge from HEST:etc/hardware_errors layout at start time.
> > 
> >         However to make migration safe, one would need to add a fat
> >         comment not to change order ghest error sources in HEST _and_
> >         a dedicated unit test to make sure we catch it when that happens.
> >         bios_tables_test should be able to catch the change, but it won't
> >         say what's wrong, hence a test case that explicitly checks order
> >         and loudly & clear complains when we will break order assumptions.
> > 
> >         downside:
> >            * we are are limiting ways HEST could be composed/reshuffled in future
> >            * consumption of extra CI resources
> >            * and well, it relies on above duct tape holding all pieces together  
> 
> I ended opting to do approach (2) on this changeset, as the current code
> is already using bios_linker_loader_add_pointer() for ghes, being deeply 
> relying on the block address/ack and cper calculus.

I consider (2) as a fallback in case (1) can't be done with reasonable effort.
At this point, (1) looks doable and I'm not convinced that duct tape
is necessary and that we badly need to rush in this series.
Hence I'd strongly prefer (1).

See my other reply to Jonathan, setting write pointer is not hard.
Parsing HEST doesn't have to be a full tables parser as long as
it respects table types/length/revision then we can cheat by using 
documented offsets from ACPI spec as is, for fields we
need to access.


> To avoid troubles on this duct tape, I opted to move all offset math
> to a single function at ghes.c:
> 
> 	/*
> 	 * ID numbers used to fill HEST source ID field
> 	 */
> 	enum AcpiHestSourceId {
> 	    ACPI_HEST_SRC_ID_SEA,
> 	    ACPI_HEST_SRC_ID_GED,
> 	
> 	    /* Shall be the last one */
> 	    ACPI_HEST_SRC_ID_COUNT
> 	} AcpiHestSourceId;
> 
> 	...
> 
> 	static bool acpi_hest_address_offset(enum AcpiGhesNotifyType notify,
>         	                             uint64_t *error_block_offset,
>                 	                     uint64_t *ack_offset,
>                         	             uint64_t *cper_offset,
>                                 	     enum AcpiHestSourceId *source_id)
> 	{
> 	    enum AcpiHestSourceId source;
> 	    uint64_t offset;
> 
> 	    switch (notify) {
> 	    case ACPI_GHES_NOTIFY_SEA:      /* Only on ARMv8 */
> 	        source = ACPI_HEST_SRC_ID_SEA;
> 	        break;
> 	    case ACPI_GHES_NOTIFY_GPIO:
> 	        source = ACPI_HEST_SRC_ID_GED;
> 	        break;
> 	    default:
> 	        return true;
> 	    }
> 
> 	    if (source_id) {
> 	        *source_id = source;
> 	    }
> 
> 	    /*
> 	     * Please see docs/specs/acpi_hest_ghes.rst for the memory layout.
> 	     * In summary, memory starts with error addresses, then acks and
> 	     * finally CPER blocks.
> 	     */
> 
> 	    offset = source * sizeof(uint64_t);
> 
> 	    if (error_block_offset) {
> 	        *error_block_offset = offset;
> 	    }
> 	    if (ack_offset) {
> 	        *ack_offset = offset + ACPI_HEST_SRC_ID_COUNT * sizeof(uint64_t);
> 	    }
> 	    if (cper_offset) {
> 	        *cper_offset = 2 * ACPI_HEST_SRC_ID_COUNT * sizeof(uint64_t) +
> 	                       source * ACPI_GHES_MAX_RAW_DATA_LENGTH;
> 	    }
> 
> 	    return false;
> 	}
> 
> I also removed the anonymous enum with SEA/GPIO source IDs, using
> only the ACPI notify type as arguments at the function calls.
> 
> As there's now a single point where the offsets from
> docs/specs/acpi_hest_ghes.rst are enforced, this should be error
> prone.
> 
> The code could later be changed to use approach (2), on a separate
> cleanup.
> 
> Thanks,
> Mauro
> 

