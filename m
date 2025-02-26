Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp682887njg;
        Tue, 25 Feb 2025 20:59:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQfvXG5e+OFHKORTVPWfYQ795T9N9MkMCuLX1Ipu1dgvSJmvIHaVs3hwMGLlJRzQGkVEw6Dlt10jdFoA==@linaro.org
X-Google-Smtp-Source: AGHT+IEwS4+ynN8RmvNc2lep1JwELbpQ/ErnTroAsPuYhV0PI3s0nZPx1D0jtyUJZwgymEUWom6n
X-Received: by 2002:a05:620a:1916:b0:7c0:b587:9f5 with SMTP id af79cd13be357-7c23c0397f8mr774809885a.42.1740545961544;
        Tue, 25 Feb 2025 20:59:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740545961; cv=none;
        d=google.com; s=arc-20240605;
        b=E1eEEfOxLvqnP7+PmZIHdwDdNSXSiJk4VqYg00DmBS8iRVbC8WfnwApdWNTRC2fOQX
         DlZSbRkx9iahoe12RP1RphtFHplfulTEx1mXM6NgiHaz/BzMqaJZhyJGsYzi09cmjOgQ
         7iWKF1dziOpa7pd8j2GSwX8Yv640CbWE0pNkgY+fnh5TBBqCswFMNaOZOm08OgnMRspP
         N7ZSk3EL8/OE5+bao51Ilji51NJgA204cQy5hh0RFGVy0NmtT6Kgw/C5qZB0cU/I4epK
         5hivC0wHPDrGq/yDBLNUfLAvhdv2gvGYiTJeLgVnG49bO/Dq1LFIS6fI4yomsKg4H6Qv
         ZyXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jCnKTy/sgEG2ePdqmPVY/AE6ciXlhI5f1Xr2uhZKTd8=;
        fh=FFWUaoxwc3ugAXMgaoqRm8pEDgIVd26092AbK8hFSBc=;
        b=U6Na1L9590RVcCSZbNolKbnJWLiqs1y4GW8EobpFtH16YvJO7gJuseEQMI36Eb2mS3
         PBEQLo5KMUmJLHDFq8OKYyxIbnSRMwi5DEQoVXi8LEes8kRc2kECvgQBCL4k6MDiTVWh
         iiKbfu58eqeyBTHPQT6HsNSVgORBm60W54hDzqKRz4ZYvlo1RRdPuhHmWYPe04CyB0J7
         Ps5IBkjNAd6+NiBaeGGM9H6T+oVwGDr11iFGuN5pdsAeu5sZishVhXngWqAG4xFvHFk0
         /NhqeO8wAEGeSfJnN5T/XdBAzPttWO3D9ucAxcX8tcTv6hFxrtH9U3pD+dFFl9QuoG8E
         k3Yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bqsmVJE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c2357dasi294141185a.106.2025.02.25.20.59.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 20:59:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bqsmVJE3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tn9Vj-0007CI-M2; Tue, 25 Feb 2025 23:59:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tn9Vi-0007C0-De
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 23:59:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tn9Vg-000299-EA
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 23:59:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740545936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jCnKTy/sgEG2ePdqmPVY/AE6ciXlhI5f1Xr2uhZKTd8=;
 b=bqsmVJE3W+1VW5mkxbqsC165YY+K7DlKq6bVy0DNtxvMz9afpPtBv6pKucwO6rFEG9Rrf4
 4Ugo/FTbwqXSa1wGMiF5GgrdwwTZxD8Qxj5v6O1pbNc6sOAb948bXTgTGLhv7EmPs7Vax+
 BoSQxI9e0OsVnHe7lEYHldWOcdSyxZY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-kui_zHECOvCeArcLUxhlnw-1; Tue, 25 Feb 2025 23:58:53 -0500
X-MC-Unique: kui_zHECOvCeArcLUxhlnw-1
X-Mimecast-MFC-AGG-ID: kui_zHECOvCeArcLUxhlnw_1740545932
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2fc0bc05bb5so13297109a91.2
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 20:58:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740545932; x=1741150732;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jCnKTy/sgEG2ePdqmPVY/AE6ciXlhI5f1Xr2uhZKTd8=;
 b=SaIQrgCZRK4GSRSvqQ0EKMK29Op+QIzAruValm7RPozbBiAzlXbHTmRkMBVFGkt7vb
 UHZs1qEvhnM6cu8ns7p/wC3EY6mTHuFUK6W9HGEcLT0bLDTIxljYxYqHG5xZDbMhSB3M
 NpcMYSHITggojKnPms5Ckw545+/59Y39K407+9sKEu6XK4VVk7c/HOLjZJmlpFkngpFx
 rFmMnU3Nbqn9AkidE1WC6DSsItPL/M4sX8r/x37Qi2Q5VXvpnM7dW+w+iP7/2CrbsL2H
 U9jut1aarIdUE584+h1Gd3BOpvo7YGRcWYE/3RHh/bcJetrBZNndagzJBTUyd8Pd5fNR
 2xlg==
X-Gm-Message-State: AOJu0Yx08aV4Eqx4yQWxobmqxxpAbPQ2kaARNBCKFr7hMEnbbvHPfko1
 VbHF8Q6ubp50KEI4LTB0Up7I7/aORXiWbwIZNSw8Ms7/yTKql8J1/z7PgEPTR4vA4Ddca8dKqoc
 Dbs/xkKKeWSWH3gOgILz6kcsL3hW7bXan+6BOBelA247ubsVBKw==
X-Gm-Gg: ASbGncsI/hNxT9v/h2NElIQe/hGhLGXvAoNxQe09Kq86sarRrSdKSddM4BiB3yhnlhA
 QdLVeYu3HPlY+9DqDQRF6rwHZy9er3Kadj1gVS/M80gsnSfI4qwbRqlQeFYo7Dnr2NdobszpSR2
 FYUY99X/QV2temQEDWa4HEV7p8MRKxDkAYhmlQ1isdPqH8nI6IQVGG445xD4o7PlflY6e1qceXx
 6eUZL24JHrMvNC1ejps6IlyWHaYQIAv+I73d3FUWM36VpcHznwfRzRI8auJCdAXjJ0EQYG+pFcj
 /pUpUgIeau5s4j5Y8A==
X-Received: by 2002:a05:6a20:6a0d:b0:1ee:e808:732c with SMTP id
 adf61e73a8af0-1f0fc1394c6mr9224758637.14.1740545932424; 
 Tue, 25 Feb 2025 20:58:52 -0800 (PST)
X-Received: by 2002:a05:6a20:6a0d:b0:1ee:e808:732c with SMTP id
 adf61e73a8af0-1f0fc1394c6mr9224732637.14.1740545932110; 
 Tue, 25 Feb 2025 20:58:52 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7347a81edaesm2565592b3a.149.2025.02.25.20.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 20:58:51 -0800 (PST)
Message-ID: <dafa471d-c5bb-4f6b-8483-17741e0caab1@redhat.com>
Date: Wed, 26 Feb 2025 14:58:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] target/arm: Retry pushing CPER error if necessary
To: Igor Mammedov <imammedo@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20250214041635.608012-1-gshan@redhat.com>
 <20250214041635.608012-5-gshan@redhat.com>
 <20250219185518.767a48d9@imammedo.users.ipa.redhat.com>
 <7caa54df-abe1-4833-bb59-cb83f8241962@redhat.com>
 <20250221110435.00004a3b@huawei.com>
 <20250225121939.7e0e2304@imammedo.users.ipa.redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250225121939.7e0e2304@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0MEz0tCrzYoZYHSeYPSjF1ZhvJgLHRBeMVr8szdvjnM_1740545932
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: j3hhn4d+iqAR

On 2/25/25 9:19 PM, Igor Mammedov wrote:
> On Fri, 21 Feb 2025 11:04:35 +0000
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
>>
>> Ideally I'd like whatever we choose to look like what a bare metal machine
>> does - mostly because we are less likely to hit untested OS paths.
> 
> Ack for that but,
> that would need someone from hw/firmware side since error status block
> handling is done by firmware.
> 
> right now we are just making things up based on spec interpretation.
> 

It's a good point. I think it's worthwhile to understand how the RAS event
is processed and turned to CPER by firmware.

I didn't figure out how CPER is generated by edk2 after looking into tf-a (trust
firmware ARM) and edk2 for a while. I will consult to EDK2 developers to seek
their helps. However, there is a note in tf-a that briefly explaining how RAS
event is handled.

   From tf-a/plat/arm/board/fvp/aarch64/fvp_lsp_ras_sp.c:
   (git@github.com:ARM-software/arm-trusted-firmware.git)

   /*
    * Note: Typical RAS error handling flow with Firmware First Handling
    *
    * Step 1: Exception resulting from a RAS error in the normal world is routed to
    *         EL3.
    * Step 2: This exception is typically signaled as either a synchronous external
    *         abort or SError or interrupt. TF-A (EL3 firmware) delegates the
    *         control to platform specific handler built on top of the RAS helper
    *         utilities.
    * Step 3: With the help of a Logical Secure Partition, TF-A sends a direct
    *         message to dedicated S-EL0 (or S-EL1) RAS Partition managed by SPMC.
    *         TF-A also populates a shared buffer with a data structure containing
    *         enough information (such as system registers) to identify and triage
    *         the RAS error.
    * Step 4: RAS SP generates the Common Platform Error Record (CPER) and shares
    *         it with normal world firmware and/or OS kernel through a reserved
    *         buffer memory.
    * Step 5: RAS SP responds to the direct message with information necessary for
    *         TF-A to notify the OS kernel.
    * Step 6: Consequently, TF-A dispatches an SDEI event to notify the OS kernel
    *         about the CPER records for further logging.
    */

According to the note, RAS SP (Secure Partition) is the black box where the RAS
event raised by tf-a is turned to CPER. Unfortunately, I didn't find the source
code to understand the details yet.

Thanks,
Gavin

