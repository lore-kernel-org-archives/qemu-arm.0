Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp539543njb;
        Fri, 31 Jan 2025 08:33:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUZ/Twn4BnN8mSGzCUIS/9F+S5uvafaju3h9rOPTM3VP6+6Mq1OnkRsFfJgD1PVwZmv9uhmeZmcH6hPNA==@linaro.org
X-Google-Smtp-Source: AGHT+IHAaYEUBaRtnqZR0raBpdBvnaMNSZRnnNAei6oB8dYaJJjI64Ipd2xnvbKw0C0VDJC0Yjo+
X-Received: by 2002:a05:6214:5194:b0:6e1:a253:b32e with SMTP id 6a1803df08f44-6e243c15cc3mr183096616d6.18.1738341230997;
        Fri, 31 Jan 2025 08:33:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738341230; cv=none;
        d=google.com; s=arc-20240605;
        b=Sv2SXhHz/pFcbhcgjXzyk7k5vV5/0u6gFzVMdpfhRe3u56CQ6LIzTcOOIqfFLTvA3m
         M3WmGQR+R4i6pPl9Wya1S5m8Kwm3WESQNqAcgVNV7VXxfr1vF8WJKEz2LriBEDuXsEMU
         +kTCMrcSI79L5bew0wOJOx3OiShk8FHeYEWI9GSdG9L/E5qSM0x0tkTAUyVpf/UqRwvE
         zWd2sLuj4efNPZx8izH+sS9eBZm/qsbBewpJfAp4bWMOagcZYuCBwJhoUKnh89S6DppT
         owKgoQ702JbuAEK/TApYHQhd8jq5gzEms+W2Lv1tOqTUZgzJZ7++a/FfaZp3JAgXb+qw
         8ddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=qbPvxv+SJlJsHXlpjSxo+uQOUl1d7qOYXt+GAFt8ziw=;
        fh=TduFyjKJ7fVZHHQ45yDH/mt+D1U0qQCiIUFC0mf7irk=;
        b=eFSU7PmHIAfVH/ryQKrYa7sSSoyDONk5S0sacMli5Nc4Iu3A/fAkMlZYIVCWpTcyEq
         WaMUpuZtpOlb4daLtRkBLlhiFKL69qTrtcdbntA9t6e8H1LGtZAMxXYbD5ZTX+dcMtWi
         GpLVxLqjbZSsRFxLYZNTtPf3/z77pOAHkCKWDfazYBxA8AEFk0loBIAnNLum26I2Tjdr
         4ZVwQczpHVesuhtaLJ/pax/R+3oPkUyYz5gU6nO6DHW6XIeiHK3bEcUEr/5AyQfS4a4n
         +mh50QEdYiAHKcaeEVi4eEdDtlQmiDr6MquwUmO3IViXNVa+0c8NsRU6Ya1Q+Meja/fO
         LTwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bvAKeIOk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e2548143dasi39048926d6.54.2025.01.31.08.33.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2025 08:33:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bvAKeIOk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdtxC-0001iQ-Si; Fri, 31 Jan 2025 11:33:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tdtx7-0001iC-1w
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 11:33:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tdtx4-0004xq-Sa
 for qemu-arm@nongnu.org; Fri, 31 Jan 2025 11:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738341183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qbPvxv+SJlJsHXlpjSxo+uQOUl1d7qOYXt+GAFt8ziw=;
 b=bvAKeIOkZzesXX5DCzf/SjdC/T28496orwOK9XQYZsixXszhk2Hd6wItmNS3sq/m4XzyAc
 Go95COZKzwdndGWVoJ3oQWbtJgZ59f5pET1A88bKuNzoERcS1cq5lBEm6xnjCmK9fQ/+wK
 trX+Lp3RNebp69RElZcY9QSPLNNFsns=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-tdOae6ZiOSGvvpm3XUxrmQ-1; Fri, 31 Jan 2025 11:33:02 -0500
X-MC-Unique: tdOae6ZiOSGvvpm3XUxrmQ-1
X-Mimecast-MFC-AGG-ID: tdOae6ZiOSGvvpm3XUxrmQ
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43582d49dacso16126425e9.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jan 2025 08:33:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738341181; x=1738945981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qbPvxv+SJlJsHXlpjSxo+uQOUl1d7qOYXt+GAFt8ziw=;
 b=rg70/a9KWqaBMSlWycg1z++CRg3DuyKjh6AyAwgGPBquGERI5KTyySVNT+0JFUSQsa
 wYe/su41IJ4aByUeG4UU9CSIUNumzKLAGcx5MrDA3a31pZqpfGv/t8GdxX6hKNqDQ9e9
 mZatRBmLRDMpjsxNV+Ug8LslxG4pnOdP4h8UGPZbBiSKnP4GA1KF8RbovjL3dQEU4oVw
 Cpsq0wXn53+M+I+fIG6cWYg2qocupH40MCxG6lEeqZyN41WAW+6Zwk+kPMfFnxUELKJP
 wK95w0mphWhAR+f7CTpM1xvAdee6pINz4CHE+ILGf1Um9kyeABdeDgpHF1OaAPwK1NaW
 +iFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCeMgnDj+WZWOXCdZQ9i6L0BbPgGwsuPaB8Oz1/nY4Ru2Pxg+1k9UyKFoZ+8Kw8Fgy6zj4k9+rBg==@nongnu.org
X-Gm-Message-State: AOJu0YynxSzdbiUrA4ijLuWSueR+STCCYmSsevCAwZ82mkaWEV646ZNx
 lQRlsQ2HoIi0TqZ62m6taKMN74/+c0YQFXtyQnO39a9U93TT/pqIt22KYX91JGNQcRdfxpmJMhH
 RMeL9dstnmLOEMzJi0VQIuwpjg6iWjtuIlSw/PYHosTr/s7o8fA==
X-Gm-Gg: ASbGncvrVW/vRXgWHTDxKtCU4lBtEhKlk1mmqu2kzhwmFgwQKrW6Ngyx8Ptiz664pMz
 bPruVC4GnUhzDOWNeWP0DHhmmK0zMbPyLhsGv4AZ4hk0A1AhmuF/QfzNJp7q4J74thx4ebrm+6V
 nULy8qb4rZ+li2Lshfm3glXSxUoqny9T29DLjq5pZrx7UC9HgX2dBgZ4fOApqZ1sE6KpXDpLziU
 tHmqkH5kzkyFKuK5X38kVWYzjcIgXEHLDLs2frklR3j4YrEyHottrPzyeUAj3bv4eWYy2wFDHVb
 Qi3JjZ3aVCBTjZ7OMUdux87RV2GQ+csQs0HI5wPOYFd2mP2hBSwE
X-Received: by 2002:a05:600c:3d9b:b0:436:e8b4:36e7 with SMTP id
 5b1f17b1804b1-438dc3c38admr112271785e9.8.1738341180850; 
 Fri, 31 Jan 2025 08:33:00 -0800 (PST)
X-Received: by 2002:a05:600c:3d9b:b0:436:e8b4:36e7 with SMTP id
 5b1f17b1804b1-438dc3c38admr112270925e9.8.1738341179214; 
 Fri, 31 Jan 2025 08:32:59 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b61f1sm5162786f8f.68.2025.01.31.08.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 08:32:58 -0800 (PST)
Date: Fri, 31 Jan 2025 17:32:57 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/13] tests/acpi: virt: add a HEST table to aarch64
 virt and update DSDT
Message-ID: <20250131173257.3b0f7df0@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250131164919.7955a110@foz.lan>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
 <7036f18f9c25852aeae6526d424e259211a0c9cd.1738137123.git.mchehab+huawei@kernel.org>
 <20250129162953.5c525555@imammedo.users.ipa.redhat.com>
 <20250131164919.7955a110@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bhtpmh8JuexOfE_x_Zfj1s8u3duPImKQGqzwKhey6UE_1738341181
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: EUdxmr3/L+Yx

On Fri, 31 Jan 2025 16:49:19 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Wed, 29 Jan 2025 16:29:53 +0100
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Wed, 29 Jan 2025 09:04:18 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > DSDT has gained a GED device to notify errors:
> > > 
> > > --- a/DSDT.dsl        2025-01-28 09:38:15.155347858 +0100
> > > +++ b/DSDT.dsl        2025-01-28 09:39:01.684836954 +0100
> > > @@ -9,9 +9,9 @@
> > >   *
> > >   * Original Table Header:
> > >   *     Signature        "DSDT"
> > > - *     Length           0x00001516 (5398)
> > > + *     Length           0x00001542 (5442)
> > >   *     Revision         0x02
> > > - *     Checksum         0x0F
> > > + *     Checksum         0xE9
> > >   *     OEM ID           "BOCHS "
> > >   *     OEM Table ID     "BXPC    "
> > >   *     OEM Revision     0x00000001 (1)
> > > @@ -1931,6 +1931,11 @@
> > >                  {
> > >                      Notify (PWRB, 0x80) // Status Change
> > >                  }
> > > +
> > > +                If (((Local0 & 0x10) == 0x10))
> > > +                {
> > > +                    Notify (GEDD, 0x80) // Status Change
> > > +                }
> > >              }
> > >          }
> > > 
> > > @@ -1939,6 +1944,12 @@
> > >              Name (_HID, "PNP0C0C" /* Power Button Device */)  // _HID: Hardware ID
> > >              Name (_UID, Zero)  // _UID: Unique ID
> > >          }
> > > +
> > > +        Device (GEDD)
> > > +        {
> > > +            Name (_HID, "PNP0C33" /* Error Device */)  // _HID: Hardware ID
> > > +            Name (_UID, Zero)  // _UID: Unique ID
> > > +        }
> > >      }
> > >  }
> > > 
> > > New HEST table:    
> > 
> > diff might be a better here,
> > you can have it during make check when expected tables haven't been update yet.
> > prereq for that is to have 'iasl' installed (usually part of acpica-tools package)
> > and adding V=1 to env vars, something like this:
> > 
> >  V=1 QTEST_QEMU_BINARY=./qemu-system-aarch64 ./tests/qtest/bios-tables-test  
> 
> Hmm... didn't produce any diff here. I added a diff generated by
> hand (calling iasl before/after the GED wire up patch and manually
> running diff).

that can happen due to stale files which rebuild-expected-aml.sh creates
(I'd check 'git status' output).
And well, rerun configure after iasl has been installed.


> Anyway, as HEST table is not checked, I dropped it file from the tests[1],
> and placed on patch 12/13 just the DSDT diff.

if it's not checked, then it would be better to add it before changes,
and then update here (with new layout)
> 
> [1] tests/data/acpi/aarch64/virt/HEST
> 
> >   
> > > 
> > > /*
> > >  * Intel ACPI Component Architecture
> > >  * AML/ASL+ Disassembler version 20240927 (64-bit version)
> > >  * Copyright (c) 2000 - 2023 Intel Corporation
> > >  *
> > >  * Disassembly of hest.dat
> > >  *
> > >  * ACPI Data Table [HEST]
> > >  *
> > >  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
> > >  */
> > > 
> > > [000h 0000 004h]                   Signature : "HEST"    [Hardware Error Source Table]
> > > [004h 0004 004h]                Table Length : 000000E0
> > > [008h 0008 001h]                    Revision : 01
> > > [009h 0009 001h]                    Checksum : 68
> > > [00Ah 0010 006h]                      Oem ID : "BOCHS "
> > > [010h 0016 008h]                Oem Table ID : "BXPC    "
> > > [018h 0024 004h]                Oem Revision : 00000001
> > > [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
> > > [020h 0032 004h]       Asl Compiler Revision : 00000001
> > > 
> > > [024h 0036 004h]          Error Source Count : 00000002
> > > 
> > > [028h 0040 002h]               Subtable Type : 000A [Generic Hardware Error Source V2]
> > > [02Ah 0042 002h]                   Source Id : 0000
> > > [02Ch 0044 002h]           Related Source Id : FFFF
> > > [02Eh 0046 001h]                    Reserved : 00
> > > [02Fh 0047 001h]                     Enabled : 01
> > > [030h 0048 004h]      Records To Preallocate : 00000001
> > > [034h 0052 004h]     Max Sections Per Record : 00000001
> > > [038h 0056 004h]         Max Raw Data Length : 00000400
> > > 
> > > [03Ch 0060 00Ch]        Error Status Address : [Generic Address Structure]
> > > [03Ch 0060 001h]                    Space ID : 00 [SystemMemory]
> > > [03Dh 0061 001h]                   Bit Width : 40
> > > [03Eh 0062 001h]                  Bit Offset : 00
> > > [03Fh 0063 001h]        Encoded Access Width : 04 [QWord Access:64]
> > > [040h 0064 008h]                     Address : 0000000139E40000
> > > 
> > > [048h 0072 01Ch]                      Notify : [Hardware Error Notification Structure]
> > > [048h 0072 001h]                 Notify Type : 08 [SEA]
> > > [049h 0073 001h]               Notify Length : 1C
> > > [04Ah 0074 002h]  Configuration Write Enable : 0000
> > > [04Ch 0076 004h]                PollInterval : 00000000
> > > [050h 0080 004h]                      Vector : 00000000
> > > [054h 0084 004h]     Polling Threshold Value : 00000000
> > > [058h 0088 004h]    Polling Threshold Window : 00000000
> > > [05Ch 0092 004h]       Error Threshold Value : 00000000
> > > [060h 0096 004h]      Error Threshold Window : 00000000
> > > 
> > > [064h 0100 004h]   Error Status Block Length : 00000400
> > > [068h 0104 00Ch]           Read Ack Register : [Generic Address Structure]
> > > [068h 0104 001h]                    Space ID : 00 [SystemMemory]
> > > [069h 0105 001h]                   Bit Width : 40
> > > [06Ah 0106 001h]                  Bit Offset : 00
> > > [06Bh 0107 001h]        Encoded Access Width : 04 [QWord Access:64]
> > > [06Ch 0108 008h]                     Address : 0000000139E40010
> > > 
> > > [074h 0116 008h]           Read Ack Preserve : FFFFFFFFFFFFFFFE
> > > [07Ch 0124 008h]              Read Ack Write : 0000000000000001
> > > 
> > > [084h 0132 002h]               Subtable Type : 000A [Generic Hardware Error Source V2]
> > > [086h 0134 002h]                   Source Id : 0001
> > > [088h 0136 002h]           Related Source Id : FFFF
> > > [08Ah 0138 001h]                    Reserved : 00
> > > [08Bh 0139 001h]                     Enabled : 01
> > > [08Ch 0140 004h]      Records To Preallocate : 00000001
> > > [090h 0144 004h]     Max Sections Per Record : 00000001
> > > [094h 0148 004h]         Max Raw Data Length : 00000400
> > > 
> > > [098h 0152 00Ch]        Error Status Address : [Generic Address Structure]
> > > [098h 0152 001h]                    Space ID : 00 [SystemMemory]
> > > [099h 0153 001h]                   Bit Width : 40
> > > [09Ah 0154 001h]                  Bit Offset : 00
> > > [09Bh 0155 001h]        Encoded Access Width : 04 [QWord Access:64]
> > > [09Ch 0156 008h]                     Address : 0000000139E40008
> > > 
> > > [0A4h 0164 01Ch]                      Notify : [Hardware Error Notification Structure]
> > > [0A4h 0164 001h]                 Notify Type : 07 [GPIO]
> > > [0A5h 0165 001h]               Notify Length : 1C
> > > [0A6h 0166 002h]  Configuration Write Enable : 0000
> > > [0A8h 0168 004h]                PollInterval : 00000000
> > > [0ACh 0172 004h]                      Vector : 00000000
> > > [0B0h 0176 004h]     Polling Threshold Value : 00000000
> > > [0B4h 0180 004h]    Polling Threshold Window : 00000000
> > > [0B8h 0184 004h]       Error Threshold Value : 00000000
> > > [0BCh 0188 004h]      Error Threshold Window : 00000000
> > > 
> > > [0C0h 0192 004h]   Error Status Block Length : 00000400
> > > [0C4h 0196 00Ch]           Read Ack Register : [Generic Address Structure]
> > > [0C4h 0196 001h]                    Space ID : 00 [SystemMemory]
> > > [0C5h 0197 001h]                   Bit Width : 40
> > > [0C6h 0198 001h]                  Bit Offset : 00
> > > [0C7h 0199 001h]        Encoded Access Width : 04 [QWord Access:64]
> > > [0C8h 0200 008h]                     Address : 0000000139E40018
> > > 
> > > [0D0h 0208 008h]           Read Ack Preserve : FFFFFFFFFFFFFFFE
> > > [0D8h 0216 008h]              Read Ack Write : 0000000000000001
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5240 bytes
> > >  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5326 bytes
> > >  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6601 bytes
> > >  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7723 bytes
> > >  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5442 bytes
> > >  tests/data/acpi/aarch64/virt/HEST             | Bin 0 -> 224 bytes
> > >  tests/qtest/bios-tables-test-allowed-diff.h   |   2 --
> > >  7 files changed, 2 deletions(-)
> > > 
> > > diff --git a/tests/data/acpi/aarch64/virt/DSDT b/tests/data/acpi/aarch64/virt/DSDT
> > > index 36d3e5d5a5e47359b6dcb3706f98b4f225677591..a182bd9d7182dccdf63c650d048c58f18505d001 100644
> > > GIT binary patch
> > > delta 109
> > > zcmX@3@k4{lCD<jTLWF^ViDe>}G*h$dM)euOOwJsW4+;nC=*7E+g>V+Q2D|zsED)Gn
> > > zoxsJ!z{S)S5FX^j)c_F?VBivHb9Z%dnXE4&D;?b=31V}^dw9C=2KWUSI2#)?aKwjt
> > > Hx-b9$X;vI^
> > > 
> > > delta 64
> > > zcmeyNaYlp7CD<jzM}&caNqQoeG*i3NM)euOOit{R4+;lM%f`Egg>V+Q2D|zsED)Gn
> > > UoxsJ!z{S)S5FX?-*+E1W06%jPR{#J2
> > > 
> > > diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt b/tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt
> > > index e6154d0355f84fdcc51387b4db8f9ee63acae4e9..af1f2b0eb0b77a80c5bd74f201d24f71e486627f 100644
> > > GIT binary patch
> > > delta 110
> > > zcmZ3ac}|ndCD<k8oCpI0)4_>c(oCIR8`a+lGdXii78eO-)SH|wBICY5U~+W=mjDBo
> > > yK%2X(iwjpnbdzL2c#soEyoaX?Z-8HbfwO@#14n$Qrwc=LlO#wDl9aJAR0;r(tsHj%
> > > 
> > > delta 66
> > > zcmX@7xk!`CCD<iokq83=(~XH-(oDVX8`a+lGdZzO78eO-l%1R{A|oB$BpDDM<irv0
> > > W;pxH~;1^)vY~akm5g+R5!T<noi4jWx
> > > 
> > > diff --git a/tests/data/acpi/aarch64/virt/DSDT.memhp b/tests/data/acpi/aarch64/virt/DSDT.memhp
> > > index 33f011d6b635035a04c0b39ce9b4e219f7ae74b7..10436ec87c4859fb84b3ecb7bba5788f38112e59 100644
> > > GIT binary patch
> > > delta 88
> > > zcmbPheA1Z9CD<k8q$C3algUIbX{MH08`WnBGdXcjJ}4Z_<jXo)OvH<SfxzVI1TFyv
> > > qE`c_8R~MJfaU%At($P(lAPz^oho=i~fM0-tv#~J)M|`NK3j+W#;TF9B
> > > 
> > > delta 44
> > > zcmX?UJlB}ZCD<iot|S8klg&gfX{L_p8`WnBGdXfiJ}4Z_<ij#qOvGz*p@=Oj039?8
> > > AE&u=k
> > > 
> > > diff --git a/tests/data/acpi/aarch64/virt/DSDT.pxb b/tests/data/acpi/aarch64/virt/DSDT.pxb
> > > index c0fdc6e9c1396cc2259dc4bc665ba023adcf4c9b..0524b3cbe00bfe552de824dd1090bd00a208c527 100644
> > > GIT binary patch
> > > delta 110
> > > zcmexwz1oJ$CD<iITaJN&sbC_PG*jDyjq2XAOwJsWOJsu?^(LQ?m2qDnFu6K`OMrn(
> > > ypv~RY#f7UOx=Au1JjjV7-ow*{H^48zz}di=fg?WD(}f|rNfM+6Ny^w5Dg^+WYaFrw
> > > 
> > > delta 66
> > > zcmZ2&^WU1wCD<k8zbpd-Q^!OuX{N5b8`ZsKnVi@sm&gV)%1%BZD<d7<BpDDM<irv0
> > > W;pxH~;1^)vY~akm5g+R5!T<oNArgiF
> > > 
> > > diff --git a/tests/data/acpi/aarch64/virt/DSDT.topology b/tests/data/acpi/aarch64/virt/DSDT.topology
> > > index 029d03eecc4efddc001e5377e85ac8e831294362..8c0423fe62d6950f9098983d86bfee256d7d003a 100644
> > > GIT binary patch
> > > delta 86
> > > zcmbQHbx4cLCD<jzNtA(s>E%Q&X{O%5jp|7vOwJsWyG4Q-^(NmJk>Ot;Fu6K`OMrn(
> > > opv~RY#bxqO5n1WzCP@&RBi_T)g*U)2z`)tqn1Lfc)YF9l01l28<p2Nx
> > > 
> > > delta 42
> > > ycmX@4HBF1lCD<iIOq79viGL!OG*hGhM)f2SCMWjE-6Fw^vXk$N$V}!Dl?DLb(h64q
> > > 
> > > diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
> > > index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..8b0cf87700fa1799c0f8e48610ce4b7ff751dd1f 100644
> > > GIT binary patch
> > > literal 224
> > > zcmeZp4Gww0z`($m;pFe^5v<@85#X$#prF9Wz`y`vgJ>oO1_mw$28RFt85lu)5N2Ru    
> > > tU|?_nkxwi^d=43qAPxXkD*#pd?>_{9%>kRuh}CQksCsrH%$C4mHUOJBAprmY      
> > > 
> > > literal 0
> > > HcmV?d00001
> > > 
> > > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> > > index 46298e38e7b8..dfb8523c8bf4 100644
> > > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > > @@ -1,3 +1 @@
> > >  /* List of comma-separated changed AML files to ignore */
> > > -"tests/data/acpi/aarch64/virt/HEST",
> > > -"tests/data/acpi/aarch64/virt/DSDT",    
> >   
> 
> 
> 
> Thanks,
> Mauro
> 

