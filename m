Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp989285dye;
        Fri, 27 Jun 2025 08:49:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgUaP+bvvX0msgZxw7dOWlupv7Ps1gBhW5+nrtl1ZaJKCB3xtmEyLJzsf0k701x/YQRnVvGH7P3+aE9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IE4wx0HOzRhQZYCAWFGjfCj6Ki3ETSSh7BmTp/T24x+OUlWIdM/IQ1+1+IvMyVcHswIR9/t
X-Received: by 2002:a17:902:d545:b0:234:d399:f948 with SMTP id d9443c01a7336-23ac4633cd6mr59402915ad.33.1751039391126;
        Fri, 27 Jun 2025 08:49:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751039391; cv=none;
        d=google.com; s=arc-20240605;
        b=RLLFW5udd74TSWjj7Ezv7a50vfR6xirVFSlp+B+s4Q68ZlK4Bum8DXKscJhG20X7/1
         N4IJVsTGnsaSPKNqf0pbnAH2AtXGzAcZj154+H070YCNGBnFqsnbb7FCMc5QisuvyJ7y
         GzcGUkiSEUe/6/K/aPJGo28oA6KrlJ1YnkakjEgkHbx8M0nZ1d5dV7gx1N+qKMjnKaSF
         0NKwWAK6TuAzB5372jdp+EvKflJR11bLGI6Jo0iDPn31z+BEemmYXXE05OVHni2+jtAw
         Mm/DXeeavckJ1QNcOeb0ZTCnL1sN8dYJrAYFPvzKwRT7ez0i1wZ+E8AO2OoyauBHc0Te
         b9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=7xoxZLRWQq7WcffEgcQI6eAf7Lp4ELIC4XJ0R8S07HI=;
        fh=Xqoy6pttFymjWBXRXX1jl9Y5zUqAV+Ki/HcJr8ly8eQ=;
        b=ii8nrv9SI6BU3H6A1K0/qn0tFGV0DoiNm4+gcombV2NmqHM5o8XH7sbL0n8h1zLjZc
         Jj/w08yimJliooiguDB2N2/1rfk39+HzZAxS9ThNieMjgRgHCf9YXm31nyfeYw3SpLgo
         9AkNtizN2F9y860N6LqIUEblxcTYP53X7sbi+yNGvH7+L6I7+3XwmckiFSVC3Cew4WeA
         l65lJrcVMzSA1ml8MjvDzwg9q4KSxXQbw+CH17qnU7CaHg6demYgoPySG2kdQFdAEsl7
         +mRRW2Z2iKKh/CCl8TyJ+5FCbpR/2q5fxlZ6zVAfWOO0UjaPyJ356jtySz611tPlyrl+
         0WZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vh5PrGhU;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d9443c01a7336-23acb3b3d9esi23864655ad.301.2025.06.27.08.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:49:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vh5PrGhU;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751039389;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7xoxZLRWQq7WcffEgcQI6eAf7Lp4ELIC4XJ0R8S07HI=;
	b=Vh5PrGhUOHuvJN4mvLPm1+0iAcHUEu0hZpjlW1ZxLwF4LMkSqzk5uwO1MrKt/KPaJdlWrk
	VIZXaTXH6CisygRTxYEQNBZnNzkkMynKc5LywSEyg5SPS7IYidtjExQ2fVfOymyokb8+KI
	9GbEPOONMQXDksWKu6EZNVrnnaB2pQQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-friEddqDPfylykcLISSwHQ-1; Fri, 27 Jun 2025 11:49:48 -0400
X-MC-Unique: friEddqDPfylykcLISSwHQ-1
X-Mimecast-MFC-AGG-ID: friEddqDPfylykcLISSwHQ_1751039387
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so10964645e9.0
        for <alex.bennee@linaro.org>; Fri, 27 Jun 2025 08:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039387; x=1751644187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xoxZLRWQq7WcffEgcQI6eAf7Lp4ELIC4XJ0R8S07HI=;
        b=ZD1kcKqgKzP4Lgw/4l687gjrbGrSP5RMMihjIB4qgfEUsp30JjX2VuMDhZjhyeCZrh
         aZzL9nTcbAlOBs76HfG5DHlqEHhPVUBTF+XA156aDMBPuZZbHNUN18KiT7c8v8o7Nf+M
         R4EmQmR14emPK1DnXDabBw+5jnJOY0Bmwc/f0OzIBny3PTYpJbxz9RPpdQnUGtVIs1A5
         Lup4IWsmxbiL4dZbhGLRbVMTlz2NY1C1fMXbVL/b5JbaRlqPvKAy8SYy4idxObiwz+Lp
         ZZdCONgZy9y+yWTp8tWAzr79GdQZZZ0F31yjJhvFb4zNMmtXyxjtN6xGcqaKjZmyXg1x
         TfuA==
X-Forwarded-Encrypted: i=1; AJvYcCX/AnKLG/kyOwg+zbO64DgRrbLB29NEjP3wTjLnsJuXfVbz/ijwybnC7nCbH6/y9u33fcu6Hc3LwNMk7A==@linaro.org
X-Gm-Message-State: AOJu0Ywnp3oqGqDOv/Mq7yKlyPKc5cOXz9feYq+jPGAgN2sQsTElbt2X
	L3A0K7SVuFBvEMpyUcneZ2QqqppgJ32TrFCcl9q7tVWbPOsQrsVWBVEv3K1wcXxgnDCpgmUO9Wp
	9ql0ZuRO8AX568ErRDnioRaIk7RKDjXsiJbf5IkjuC+IVR8pJgqPtIsKFGg==
X-Gm-Gg: ASbGncsVca9Cm+OLNEk0Xsf9DG+PtHcmuc5r2Pc5Vjd+QCpTplqsJcxPuFxxXTW8hY5
	r38Pv/U2Z/0DqLB2hpTVoeIOYh0RrZY4SqhL/QaLItdUOMQXd3z8nx/sctR+d80K0IlzPF8QGZi
	xTy21eg36vxXYwOht9RcF3lHnLf2egHZeQ0t9xpmwtGytWH7IkF5k4W6vbp7F5Qu4praObi5e0S
	xGXXB8c3V0vleg2h0p40ZSrIfBuS6sJEk5XeJt3cQrzeg5Fo2P2ywQBnQHIg01fw+L7OOAn19GH
	G4RKlA6eysLHrwPQAiW+fflp2NxCxiIVpdBJ/Igwg4ue+WAj6CHd5J4YEcqSTjt4Dc/ALg==
X-Received: by 2002:a05:600c:c4ac:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-4538ee85615mr37712285e9.22.1751039387145;
        Fri, 27 Jun 2025 08:49:47 -0700 (PDT)
X-Received: by 2002:a05:600c:c4ac:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-4538ee85615mr37712035e9.22.1751039386588;
        Fri, 27 Jun 2025 08:49:46 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59628sm2982549f8f.81.2025.06.27.08.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:49:45 -0700 (PDT)
Message-ID: <4299cd13-f319-46f4-a36d-6ec1ff8169bd@redhat.com>
Date: Fri, 27 Jun 2025 17:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v5 9/9] qtest/bios-tables-test: Update blobs for its=off
 test on aarch64
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 philmd@linaro.org, mst@redhat.com
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, udo@hypervisor.org,
 ajones@ventanamicro.com, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com
References: <20250623135749.691137-1-gustavo.romero@linaro.org>
 <20250623135749.691137-10-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250623135749.691137-10-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iO1oGfWj1kYxVhW-p7_ELRURkMGliBo0q4vUJtnu2xc_1751039387
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: ZVzt1WzX0qsV

Hi Gustavo,

On 6/23/25 3:57 PM, Gustavo Romero wrote:
> Update blobs for the its=off test on aarch64 after fix.
>
> Basically, all structs related to ITS are gone in MADT and IORT
> tables after the fix (previously ITS was not properly disabled
> when "its=off" option was passed to the machine).
>
> MADT diff:
>
>  [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
> -[004h 0004   4]                 Table Length : 000000B8
> +[004h 0004   4]                 Table Length : 000000A4
>  [008h 0008   1]                     Revision : 04
> -[009h 0009   1]                     Checksum : C1
> +[009h 0009   1]                     Checksum : 08
>  [00Ah 0010   6]                       Oem ID : "BOCHS "
>  [010h 0016   8]                 Oem Table ID : "BXPC    "
>  [018h 0024   4]                 Oem Revision : 00000001
>  [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>  [020h 0032   4]        Asl Compiler Revision : 00000001
>
>  [024h 0036   4]           Local Apic Address : 00000000
>  [028h 0040   4]        Flags (decoded below) : 00000000
>                           PC-AT Compatibility : 0
>
>  [02Ch 0044   1]                Subtable Type : 0C [Generic Interrupt Distributor]
>  [02Dh 0045   1]                       Length : 18
>  [02Eh 0046   2]                     Reserved : 0000
>  [030h 0048   4]        Local GIC Hardware ID : 00000000
>  [034h 0052   8]                 Base Address : 0000000008000000
>  [03Ch 0060   4]               Interrupt Base : 00000000
> @@ -48,37 +48,29 @@
>  [064h 0100   8]                 Base Address : 0000000000000000
>  [06Ch 0108   8]     Virtual GIC Base Address : 0000000000000000
>  [074h 0116   8]  Hypervisor GIC Base Address : 0000000000000000
>  [07Ch 0124   4]        Virtual GIC Interrupt : 00000000
>  [080h 0128   8]   Redistributor Base Address : 0000000000000000
>  [088h 0136   8]                    ARM MPIDR : 0000000000000000
>  [090h 0144   1]             Efficiency Class : 00
>  [091h 0145   1]                     Reserved : 00
>  [092h 0146   2]       SPE Overflow Interrupt : 0000
>
>  [094h 0148   1]                Subtable Type : 0E [Generic Interrupt Redistributor]
>  [095h 0149   1]                       Length : 10
>  [096h 0150   2]                     Reserved : 0000
>  [098h 0152   8]                 Base Address : 00000000080A0000
>  [0A0h 0160   4]                       Length : 00F60000
>
> -[0A4h 0164   1]                Subtable Type : 0F [Generic Interrupt Translator]
> -[0A5h 0165   1]                       Length : 14
> -[0A6h 0166   2]                     Reserved : 0000
> -[0A8h 0168   4]               Translation ID : 00000000
> -[0ACh 0172   8]                 Base Address : 0000000008080000
> -[0B4h 0180   4]                     Reserved : 00000000
>
> IORT diff:
>
>  [000h 0000   4]                    Signature : "IORT"    [IO Remapping Table]
> -[004h 0004   4]                 Table Length : 000000EC
> +[004h 0004   4]                 Table Length : 000000AC
>  [008h 0008   1]                     Revision : 03
> -[009h 0009   1]                     Checksum : 57
> +[009h 0009   1]                     Checksum : 97
>  [00Ah 0010   6]                       Oem ID : "BOCHS "
>  [010h 0016   8]                 Oem Table ID : "BXPC    "
>  [018h 0024   4]                 Oem Revision : 00000001
>  [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>  [020h 0032   4]        Asl Compiler Revision : 00000001
>
> -[024h 0036   4]                   Node Count : 00000003
> +[024h 0036   4]                   Node Count : 00000002
>  [028h 0040   4]                  Node Offset : 00000030
>  [02Ch 0044   4]                     Reserved : 00000000
>
> -[030h 0048   1]                         Type : 00
> -[031h 0049   2]                       Length : 0018
> -[033h 0051   1]                     Revision : 01
> +[030h 0048   1]                         Type : 04
> +[031h 0049   2]                       Length : 0044
> +[033h 0051   1]                     Revision : 04
>  [034h 0052   4]                     Reserved : 00000000
>  [038h 0056   4]                Mapping Count : 00000000
>  [03Ch 0060   4]               Mapping Offset : 00000000
>
> -[040h 0064   4]                     ItsCount : 00000001
> -[044h 0068   4]                  Identifiers : 00000000
> -
> -[048h 0072   1]                         Type : 04
> -[049h 0073   2]                       Length : 0058
> -[04Bh 0075   1]                     Revision : 04
> -[04Ch 0076   4]                     Reserved : 00000001
> -[050h 0080   4]                Mapping Count : 00000001
> -[054h 0084   4]               Mapping Offset : 00000044
> -
> -[058h 0088   8]                 Base Address : 0000000009050000
> -[060h 0096   4]        Flags (decoded below) : 00000001
> +[040h 0064   8]                 Base Address : 0000000009050000
> +[048h 0072   4]        Flags (decoded below) : 00000001
>                               COHACC Override : 1
>                                 HTTU Override : 0
>                        Proximity Domain Valid : 0
> -[064h 0100   4]                     Reserved : 00000000
> -[068h 0104   8]                VATOS Address : 0000000000000000
> -[070h 0112   4]                        Model : 00000000
> -[074h 0116   4]                   Event GSIV : 0000006A
> -[078h 0120   4]                     PRI GSIV : 0000006B
> -[07Ch 0124   4]                    GERR GSIV : 0000006D
> -[080h 0128   4]                    Sync GSIV : 0000006C
> -[084h 0132   4]             Proximity Domain : 00000000
> -[088h 0136   4]      Device ID Mapping Index : 00000000
> -
> -[08Ch 0140   4]                   Input base : 00000000
> -[090h 0144   4]                     ID Count : 0000FFFF
> -[094h 0148   4]                  Output Base : 00000000
> -[098h 0152   4]             Output Reference : 00000030
> -[09Ch 0156   4]        Flags (decoded below) : 00000000
> -                              Single Mapping : 0
> -
> -[0A0h 0160   1]                         Type : 02
> -[0A1h 0161   2]                       Length : 004C
> -[0A3h 0163   1]                     Revision : 03
> -[0A4h 0164   4]                     Reserved : 00000002
> -[0A8h 0168   4]                Mapping Count : 00000002
> -[0ACh 0172   4]               Mapping Offset : 00000024
> -
> -[0B0h 0176   8]            Memory Properties : [IORT Memory Access Properties]
> -[0B0h 0176   4]              Cache Coherency : 00000001
> -[0B4h 0180   1]        Hints (decoded below) : 00
> +[04Ch 0076   4]                     Reserved : 00000000
> +[050h 0080   8]                VATOS Address : 0000000000000000
> +[058h 0088   4]                        Model : 00000000
> +[05Ch 0092   4]                   Event GSIV : 0000006A
> +[060h 0096   4]                     PRI GSIV : 0000006B
> +[064h 0100   4]                    GERR GSIV : 0000006D
> +[068h 0104   4]                    Sync GSIV : 0000006C
> +[06Ch 0108   4]             Proximity Domain : 00000000
> +[070h 0112   4]      Device ID Mapping Index : 00000000
> +
> +[074h 0116   1]                         Type : 02
> +[075h 0117   2]                       Length : 0038
> +[077h 0119   1]                     Revision : 03
> +[078h 0120   4]                     Reserved : 00000001
> +[07Ch 0124   4]                Mapping Count : 00000001
> +[080h 0128   4]               Mapping Offset : 00000024
> +
> +[084h 0132   8]            Memory Properties : [IORT Memory Access Properties]
> +[084h 0132   4]              Cache Coherency : 00000001
> +[088h 0136   1]        Hints (decoded below) : 00
>                                     Transient : 0
>                                Write Allocate : 0
>                                 Read Allocate : 0
>                                      Override : 0
> -[0B5h 0181   2]                     Reserved : 0000
> -[0B7h 0183   1] Memory Flags (decoded below) : 03
> +[089h 0137   2]                     Reserved : 0000
> +[08Bh 0139   1] Memory Flags (decoded below) : 03
>                                     Coherency : 1
>                              Device Attribute : 1
> -[0B8h 0184   4]                ATS Attribute : 00000000
> -[0BCh 0188   4]           PCI Segment Number : 00000000
> -[0C0h 0192   1]            Memory Size Limit : 40
> -[0C1h 0193   3]                     Reserved : 000000
> -
> -[0C4h 0196   4]                   Input base : 00000000
> -[0C8h 0200   4]                     ID Count : 000000FF
> -[0CCh 0204   4]                  Output Base : 00000000
> -[0D0h 0208   4]             Output Reference : 00000048
> -[0D4h 0212   4]        Flags (decoded below) : 00000000
> -                              Single Mapping : 0
> -
> -[0D8h 0216   4]                   Input base : 00000100
> -[0DCh 0220   4]                     ID Count : 0000FEFF
> -[0E0h 0224   4]                  Output Base : 00000100
> -[0E4h 0228   4]             Output Reference : 00000030
> -[0E8h 0232   4]        Flags (decoded below) : 00000000
> +[08Ch 0140   4]                ATS Attribute : 00000000
> +[090h 0144   4]           PCI Segment Number : 00000000
> +[094h 0148   1]            Memory Size Limit : 40
> +[095h 0149   3]                     Reserved : 000000
> +
> +[098h 0152   4]                   Input base : 00000000
> +[09Ch 0156   4]                     ID Count : 000000FF
> +[0A0h 0160   4]                  Output Base : 00000000
> +[0A4h 0164   4]             Output Reference : 00000030
> +[0A8h 0168   4]        Flags (decoded below) : 00000000
>                                Single Mapping : 0
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 184 -> 164 bytes
>  tests/data/acpi/aarch64/virt/IORT.its_off   | Bin 236 -> 172 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   2 --
>  3 files changed, 2 deletions(-)
>
> diff --git a/tests/data/acpi/aarch64/virt/APIC.its_off b/tests/data/acpi/aarch64/virt/APIC.its_off
> index 37d82e970b1331cb5b259f0bd2d3654bacb2d623..6130cb7d07103b326feb4dcd7034f85808bebadf 100644
> GIT binary patch
> delta 18
> ZcmdnNxP+0*F~HM#2?GNI3&%vRSpY2+1Zw~Q
>
> delta 39
> jcmZ3&xPy_)F~HM#2Ll5G%fX3UvqbnsfJ`vp;DE6JqX7kf
>
> diff --git a/tests/data/acpi/aarch64/virt/IORT.its_off b/tests/data/acpi/aarch64/virt/IORT.its_off
> index 0fceb820d509e852ca0849baf568a8e93e426738..c10da4e61dd00e7eb062558a2735d49ca0b20620 100644
> GIT binary patch
> delta 69
> zcmaFExQ3C-(?2L=4FdxM^Yn>aQj$zSmH`lh0E-I)3xowECx)7HGFdP%GXmL+6IZHp
> Hz*GSMclZc%
>
> literal 236
> zcmebD4+?q1z`(#9?&R<65v<@85#X!<1dKp25F11@1F-=RgMkDCNC*yK9F_<M77!bR
> zUBI%eoFED&4;F$FSwK1)h;xBB2Py`m{{M%tVD>TjFfcO#g+N#Zh@s|zoCF3AP#UU@
> R!2`+%Dg6Hr$N|zYvjDIZ5CH%H
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index a88198d5c2..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,3 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/aarch64/virt/APIC.its_off",
> -"tests/data/acpi/aarch64/virt/IORT.its_off",
