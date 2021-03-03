Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5426162lfg;
        Wed, 3 Mar 2021 07:04:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz31ZzA0s+CoEP5jFRfZC03oNznRHdRWLggjEE3+6vmPKoA5P7bfjR8Ae9Slxfj0ADuYbd3
X-Received: by 2002:a05:6602:228f:: with SMTP id d15mr21317470iod.141.1614783840273;
        Wed, 03 Mar 2021 07:04:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614783840; cv=none;
        d=google.com; s=arc-20160816;
        b=OR/B8zdr4AAjMNwxNgUDGVOG9Q8UsPyXwsnYbEbOYdt9lrv0f36FEBzQLtD5pWB1se
         iZxX2EqTMhqRlB5yCaDphLocR1QDTRkqP958hNtKY2jhoG4vvh2lr5GLk+6/iM6g7xdf
         rDhuoa8viLmf+xFpy2lhOWcOCyg8EuRCCgh6i82cRWTmegM+MGno4AjKvlATQihWxIc0
         8xf6mjqBS3BFR1Po3+AQLZ4bu4ptcvEnIiz/UMlMMCRdTvg+Dr3ZTQwCAv7hC8Ba6vXC
         +WfkOWpRdR4jLCC7piOwV9vhY9705BeetsHRh/HE0YCrGsBxvaI17EfecRpXMik7/gW5
         4y8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:date:message-id:from
         :references:to:subject:dkim-signature;
        bh=U37SxE/OHxi02DNsabD4Ksbt37oNthK/tOxNJKXQH3M=;
        b=IJmzgirtx41nyE7fmgMsikKjY5pbtNqV4vtbTBVe7KvBxmJ9MkOP53lh/0MJixc2EB
         wEYlcz947mzcwK55T5Wfq9o8KfW/VLYA6girmWFZjPJLltpGHdz1p2GCfjRdc5s9RyWE
         bed+MkEkw47sOA/5MXpF/mFCp7xCdkdVN59To+8ZqaGOB5LV2HEz9CFJO5bUVr9JKazQ
         9OWYmpFG60tp/IbarCLoXeYxc2coPucJALtDDwQzcYNR67eHUtF4DV3ONS14OKQRSdFw
         VZQajx5u00gC19EhWs0+378p6IrC6gYb0JSkdYV7G3f7r+tEjIcjVUQP753JZAQ1Aiax
         wFtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZvwAF6+o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11si20633399iod.98.2021.03.03.07.03.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 07:04:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZvwAF6+o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHT2c-0002xs-T9
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 10:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lHT2S-0002xQ-Am
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 10:03:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lHT2Q-0007lJ-DR
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 10:03:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614783825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U37SxE/OHxi02DNsabD4Ksbt37oNthK/tOxNJKXQH3M=;
 b=ZvwAF6+oBJzROGHMaKywy0QZC4ygvencxEfm0VYqC0+Dw6C4urTxcTuIeXE/d1LmzWTmW3
 NCGgjMDAXaomU/crwi0B2Di26EhNvaOO/Oy028p437mY+Hr6Ttbeisqz1N8HZkGsO6oqQE
 1hXTklQoQxUuCYiU9mGJaLR6AZdDgnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-lahuPF5-OnaEDKd6XX9j7Q-1; Wed, 03 Mar 2021 10:03:41 -0500
X-MC-Unique: lahuPF5-OnaEDKd6XX9j7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52F88107ACC7;
 Wed,  3 Mar 2021 15:03:40 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-245.ams2.redhat.com
 [10.36.113.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB2385C241;
 Wed,  3 Mar 2021 15:03:37 +0000 (UTC)
Subject: Re: [PATCH v1] acpi: increase maximum size for "etc/table-loader" blob
To: David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20210301104833.45580-1-david@redhat.com>
 <20210302172323.6cac394a@MiWiFi-RA69-srv>
 <09fbdaa9-2882-2056-a5a2-2ca0da8c12cf@redhat.com>
 <7d8281a8-0479-ac81-c602-ed87c71ce3e2@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <4bc8c306-48d2-8122-c096-dcac15170791@redhat.com>
Date: Wed, 3 Mar 2021 16:03:36 +0100
MIME-Version: 1.0
In-Reply-To: <7d8281a8-0479-ac81-c602-ed87c71ce3e2@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ldr213wTYMJd

On 03/02/21 19:43, David Hildenbrand wrote:

> We are dealing with different blobs here (tables_blob vs. cmd_blob).

OK, thanks -- this was the important bit I was missing. Over time I've
lost track of the actual set of fw_cfg blobs that QEMU exposes, for the
purposes of the ACPI linker/loader.

I've looked up the acpi_add_rom_blob() calls in "hw/i386/acpi-build.c"
and "hw/arm/virt-acpi-build.c":

  hw       name                                         max_size                              notes
  -------  -------------------------------------------  ------------------------------------  ------

  virt     ACPI_BUILD_TABLE_FILE ("etc/acpi/tables")    ACPI_BUILD_TABLE_MAX_SIZE (0x200000)  n/a
  virt     ACPI_BUILD_LOADER_FILE ("etc/table-loader")  0                                     n/a
  virt     ACPI_BUILD_RSDP_FILE ("etc/acpi/rsdp")       0                                     simply modeled on i386 (below)

  i386     ACPI_BUILD_TABLE_FILE ("etc/acpi/tables")    ACPI_BUILD_TABLE_MAX_SIZE (0x200000)  n/a
  i386     ACPI_BUILD_LOADER_FILE ("etc/table-loader")  0                                     n/a
  i386     ACPI_BUILD_RSDP_FILE ("etc/acpi/rsdp")       0                                     d70414a5788c, 358774d780ee8

  microvm  ACPI_BUILD_TABLE_FILE ("etc/acpi/tables")    ACPI_BUILD_TABLE_MAX_SIZE (0x200000)  n/a
  microvm  "etc/table-loader"                           0                                     no macro for name???
  microvm  ACPI_BUILD_RSDP_FILE ("etc/acpi/rsdp")       0                                     simply modeled on i386 (above)

(I notice there are some other (optional) fw_cfg blobs too, related TPM,
vmgenid, nvdimm etc, using fw_cfg_add_file() rather than
acpi_add_rom_blob() -- so those are immutable (never regenerated). I
definitely needed this reminder...)

So, my observations:

(1) microvm open-codes "etc/table-loader", rather than using the macro
ACPI_BUILD_LOADER_FILE.

The proposed patch corrects it, which I welcome per se. However, it
should arguably be a separate patch. I found it distracting, in spite of
the commit message highlighting it. I don't insist though, I'm
admittedly rusty on this code.


(2) The proposed patch sets "max_size" to ACPI_BUILD_LOADER_MAX_SIZE for
each ACPI_BUILD_LOADER_FILE. Makes sense, upon constructing / reviewing
the above table.

(I'm no longer sure if tweaking the alignment were the preferable path
forward.)

Either way, I'd request including the above table in the commit message.
(Maybe drop the "notes" column.)


(3) The above 9 invocations are *all* of the acpi_add_rom_blob()
invocations. I find the interface brittle. It's not helpful to have so
many macros for the names and the max sizes. We should have a table with
three entries and -- minimally -- two columns, specifying name and
max_size -- possibly some more call arguments, if such can be extracted.
We should also have an enum type for selecting a row in this table, and
then acpi_add_rom_blob() should be called with an enum constant.

Of course, talk is cheap. :)


(4) When do we plan to introduce a nonzero "max_size" for
ACPI_BUILD_RSDP_FILE ("etc/acpi/rsdp")?

Is the current zero value a time bomb?

Put differently: acpi_add_rom_blob() should be *impossible* to call with
"max_size=0", arguably. *Whenever* we call acpi_add_rom_blob(), we do
that because the blob is resizable (mutable) -- but that also means we
should have a safety margin, does it not? So calling acpi_add_rom_blob()
with "max_size=0" looks self-contradictory.

FWIW, this could be covered by the table proposed in point (3).


In total, I don't disagree with the patch (beyond the fact that the new
macro's value doesn't match the commit message), functionally speaking.
However, wrt. readability, I think the patch further complicates the
code. I'd suggest five patches:

#1 -- use "etc/table-loader" via the proper macro name in "microvm",

#2 -- rework acpi_add_rom_blob() for using a table of constants + an
      enum type,

#3 -- bump the "max_size" field for ACPI_BUILD_LOADER_FILE, for the
      current symptom,

#4 -- set a nonzero "max_size" for the remaining ACPI_BUILD_RSDP_FILE,
      for "future-proofing",

#5 -- in the new acpi_add_rom_blob() implementation, taking the enum,
      assert(max_size != 0).

(I haven't thought through what this would mean for migration, forward
or backward; I'm just brain-storming.)

Thanks
Laszlo

