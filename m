Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp212759lfg;
        Wed, 12 May 2021 23:55:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIuql56hdeb4o2A1/NexDIKqXOLdAraN+zbrMBNRexdCujRDRpOWVqE+5H6cAhF9Q1Ydtc
X-Received: by 2002:a02:c6da:: with SMTP id r26mr4262895jan.12.1620888949593;
        Wed, 12 May 2021 23:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620888949; cv=none;
        d=google.com; s=arc-20160816;
        b=lcwKtmFN7iCwqnjZSnyGqECizVM6HxMj5Kd5H8+6VoYx9z6ztqagY0VoJte5V0laVY
         Obbbn9i/w/Cv+HeMO2sB6mmcadezRpXJB/AeXE0WOdfKIEwTgMJ84gjsEYHcHsvJ4i0k
         xsK1YrHVAAYbRxEiSi/TQbfUVeTM/tAH0zWGzWMRRffEboniYLD+bbPPpqQWdF9kcjcX
         opCCzhedQsqJT5UxWsUYPi8Zj9EYU4fmpPvC3ODQshJEVvw6ANWLwDeGQARZbubwJds0
         6giQ0LTmrPMMYaHvpQ57HZa83kIEqAxdZwalojkcE6v7M/Qsi4uTJ7tlfojbDDgezXWp
         vyrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=plF+zJiGKDGafF7xXehxEl6fkDBYfKllnjd3TCDpng8=;
        b=DckAsCvRk69b4XA6KpcCphDa3vPjqf9XO6rJ/RIKs0zDp3X5Vxyt+ncsTGGOtxQNGh
         3rwUFJYGNy8OhM9i2VWt+hwRdNQLqrBbx+HT326KSU4srH/NtmRLmLLP6Xh5Oyyzzk36
         JNQ6ZrViVWviKnBlmlhw6E3WihH09ZeomrivVFRMkx7Vtp2mYGKVbs5ZWDyXlykakw2g
         GBncMtpHR+Uvtz2UA79/JC4M2p4c8RQjOKuctXfAPmbiYlxoQy1nIHd4DXfmRCunp///
         u4l4t/2jn0zNgVKD1AAydsnjGT8zsRc2TI+ZkCGaU6cV+CQ1JflTAc03zWCmdV1i6oT1
         Q/Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hEgHBuYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4si2697975iow.13.2021.05.12.23.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 23:55:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hEgHBuYR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lh5G8-0005VN-W4
	for alex.bennee@linaro.org; Thu, 13 May 2021 02:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lh5Fz-0005Uu-NA
 for qemu-arm@nongnu.org; Thu, 13 May 2021 02:55:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lh5Fy-0000Eo-1g
 for qemu-arm@nongnu.org; Thu, 13 May 2021 02:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620888936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=plF+zJiGKDGafF7xXehxEl6fkDBYfKllnjd3TCDpng8=;
 b=hEgHBuYRIz7gtbjx8eJcxzAZF9NiKXjx1VKWYW7u/qx3ESMEe/gxWO+o4aWfPxMvhn06VA
 YDQgeitHS6BWPRNgn9/R3AWmlupskHmrCHDxYM23AqizX8E3PitI92YzZmaH4nOfPR1Qh8
 nhXVqXflXDYWz9CWtC/BD1uExEgTRgI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-mzRtAhH6NSuCggVTbgsf6w-1; Thu, 13 May 2021 02:55:35 -0400
X-MC-Unique: mzRtAhH6NSuCggVTbgsf6w-1
Received: by mail-ed1-f71.google.com with SMTP id
 g17-20020aa7dd910000b029038843570b67so14155702edv.9
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 23:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=plF+zJiGKDGafF7xXehxEl6fkDBYfKllnjd3TCDpng8=;
 b=Epxej2PgbvZFjX9Hu/PROB1ibbcPKLOcwcSeXLjxdcxlfx88yCwJ4fK/6F6pki8Dmb
 6GHQh5WkbAFlBcEctwo5ltr4IBgYjZyx8tixWqUdPeN6OuwrOMU8XtQ9kGksrcyo0fKK
 Ac9OhReXH8y4GdaZGrsoil10dz3LdEdOOSzCasjZYhjrMyUbxbgXmv7MmGXfLv/Qot2i
 3v+7QQy966uxe/dHmX+17gBkGQ6G8dxHdt43xxXwyuhI0JzC57LdfQO57rvkVzmOB4vJ
 B8hHkXxaOTovWCjMt/6QDaOSlcYg1XhTkZibDkH91rvygUXNHxNdNaiQyHgb1VNTpDRY
 f5VQ==
X-Gm-Message-State: AOAM530DUqzR5bHwbstzqkkq5xx/X/oY2d8t9JfIeaIQW0XYmSUrpfPX
 Sc580gQofEO8p6HgfS+Pg/t2NrR5mZDi0o2+uBklPj1F8ukxMImbbFqh2kN0/Ve5oBrYRO4/p/x
 HgGfmWuT1xAtx
X-Received: by 2002:a50:ee85:: with SMTP id f5mr49123904edr.8.1620888933900;
 Wed, 12 May 2021 23:55:33 -0700 (PDT)
X-Received: by 2002:a50:ee85:: with SMTP id f5mr49123875edr.8.1620888933660;
 Wed, 12 May 2021 23:55:33 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id z22sm1885316edm.57.2021.05.12.23.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 23:55:32 -0700 (PDT)
Date: Thu, 13 May 2021 08:55:25 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Message-ID: <20210513065525.btpewwjuxidrhinf@gator>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IXoiGvBOku7s

On Thu, May 13, 2021 at 01:10:10PM +0800, wangyanan (Y) wrote:
> >   /* GTDT */
> >   static void
> >   build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > @@ -707,6 +765,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >       acpi_add_table(table_offsets, tables_blob);
> >       build_madt(tables_blob, tables->linker, vms);
> > +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> I'm not really sure why we need to care about "ms->smp.cpus > 1" here?
> 
> IMO, just like MADT in which we create both ENABLED and DISABLED
> gicc nodes no matter of number of ENABLED nodes is one or not, we
> should create PPTT table for all the possible cpus and not care about
> number of smp cpus, too. This will be more consistent with the ACPI
> specification and the PPTT table will be used for ACPI cpu hotplug in
> the future even with  "smp.cpus == 1".
> 
> Care of "smp.cpus > 1" in the DT cpu-map part makes sense to me,
> because we are required to only add present cpu nodes to the DT and
> Linux Doc says that a cpu-map is not needed for uniprocessor systems.
> 

Hi Yanan,

You're right. Let's just always generate the PPTT.

Thanks,
drew

