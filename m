Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp281950ejs;
        Thu, 30 May 2024 21:20:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdar7nga0cOtDFGnjwGz5GMCArSLUuFQ0xDgV9CchbhfWb7Zv/KnGVstNJB0RwgSxYp+DGAKZwsnvdFSjnPcvcdEB9aDoK
X-Google-Smtp-Source: AGHT+IF7UBvvK/klcoW/LVtn5RUJD36piiw8HjquXt0tMZbHWlw06NCga5wYbokbQO/Hj04lB+2m
X-Received: by 2002:a05:6214:2025:b0:6ad:73f9:7ade with SMTP id 6a1803df08f44-6ae0e86f9ccmr79465466d6.8.1717129226097;
        Thu, 30 May 2024 21:20:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717129226; cv=none;
        d=google.com; s=arc-20160816;
        b=dEY6Ky3nHqUB4Wbw1FcScrfayPrWjPD2X1vkq6au3gF7eiA3nEbrq73OKk+NqVCkd6
         NTP/iNUihTSPZ4gVqbMcYX7eXGtO/ZUBS7B8biXfssPy7Ft2tA9Q++87sH8csMS5ttFl
         wKwpdHkQqph7xfVl9r7Kln+vOx4VVgPuNM/xAR0/2w2RXEL+NS9eQkjKhj/QJddHHEDF
         lDIkk3+9KTYcG4TrXlTSopVJZ+AVhNKZwWYGAvDNybxtjYRQfANNf0kAyo6aRMbTGym1
         hM1AXsMwswYrYoUNq2BAiBsTJfpivPYye9gDI4P8Dnfx6/t3B6hPIXOJePxWKWv80P8l
         HqqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:references:message-id
         :content-transfer-encoding:cc:date:in-reply-to:from:subject
         :mime-version:dkim-signature;
        bh=cVTDss2dlOigckry4MYMDgbefn+7J2pwfFpvzj3T2Pg=;
        fh=Q6CewLiIYINRiwO7jtadspmbIw6Jq+xxkpz8gvKY8jU=;
        b=XwmY4mtWvhDJxze0EGcjrB1h73n3jSovNwwUv+yvZEFTepx26XfQ28jZH7CRSww80m
         utXXYZIPI/CxR9jok/ISkdC/2Xiq9Q1vuxMw0LCzZmd1M9P2zO4JKzVvvxm8A+CbOb3z
         LTwG6owJ+Isc5SszLn1YR3VXAK5g9f7jUoyeHcHKbur4fG0IW3LDCoyCy0I+ijip0PoG
         caBdKQqnZHuIK5ndct4AhSYbENxcsfvZWYOcqUtnJOImu/fwtWlKo4/Mv0MkS+Zaz8jY
         YtDFO1qTTsqO64xboqQF8tBih86zWl1iWPpe8kiuCSgTsXGzwmnM8O/WDj6Kks2Z1WXP
         YoCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=S3GvzLGN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b403b9fsi12229616d6.289.2024.05.30.21.20.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 21:20:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=S3GvzLGN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sCtjs-0002R1-Qv; Fri, 31 May 2024 00:19:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@linux.dev>)
 id 1sCtjr-0002Qh-Uf
 for qemu-devel@nongnu.org; Fri, 31 May 2024 00:19:35 -0400
Received: from out-185.mta1.migadu.com ([95.215.58.185])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@linux.dev>)
 id 1sCtjp-0002HW-Dt
 for qemu-devel@nongnu.org; Fri, 31 May 2024 00:19:35 -0400
X-Envelope-To: philmd@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1717129171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVTDss2dlOigckry4MYMDgbefn+7J2pwfFpvzj3T2Pg=;
 b=S3GvzLGNacstSnWC5KBB8DtfHHqydh3AXMP2MhjGec8jGtRTzvwDruby7EWLIb/OdZYnth
 KqdqX5l33t1zYlVeuRhOHwUBBYdZOBSAUzCVedG2gRGIpncnDJl8JtPV/S6utZtaawcTdB
 SeGnc/Oa+1b4lY1Uzz8LiPsk+OD6zM0=
X-Envelope-To: qemu-devel@nongnu.org
X-Envelope-To: qemu-arm@nongnu.org
X-Envelope-To: richard.henderson@linaro.org
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: Unexpected error in rme_configure_one() at
 ../target/arm/kvm-rme.c:159
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Itaru Kitayama <itaru.kitayama@linux.dev>
In-Reply-To: <4e7aa598-1a5d-47e1-aaa3-78af05947eeb@linaro.org>
Date: Fri, 31 May 2024 13:19:13 +0900
Cc: qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CB05CAA2-9301-45F6-8AE3-A2E27A160CDF@linux.dev>
References: <0C6F517A-5686-4BCE-8D08-1CED02CB470E@linux.dev>
 <4e7aa598-1a5d-47e1-aaa3-78af05947eeb@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=95.215.58.185;
 envelope-from=itaru.kitayama@linux.dev; helo=out-185.mta1.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RoYfIPvqef+k



> On May 30, 2024, at 22:30, Philippe Mathieu-Daud=C3=A9 =
<philmd@linaro.org> wrote:
>=20
> Cc'ing more developers
>=20
> On 30/5/24 06:30, Itaru Kitayama wrote:
>> Hi,
>> When I see a Realm VM creation fails with:
>> Unexpected error in rme_configure_one() at =
../target/arm/kvm-rme.c:159:
>> qemu-system-aarch64: RME: failed to configure SVE: Invalid argument
>> test.sh: line 8:  2502 Aborted                 qemu-system-aarch64 -M =
'virt,acpi=3Doff,gic-version=3D3' -cpu host -enable-kvm -smp 2 -m 512M =
-overcommit 'mem-lock=3Don' -M 'confidential-guest-support=3Drme0' =
-object =
'rme-guest,id=3Drme0,measurement-algo=3Dsha512,num-pmu-counters=3D6,sve-ve=
ctor-length=3D256' -kernel Image -initrd rootfs.cpio -append 'earycon =
console=3DttyAMA0 rdinit=3D/sbin/init' -nographic -net none
>> do I need to suspect first the VMM, QEMU, or the Image? The kernel is =
built with LLVM, does it matter?
>> Thanks,
>> Itaru.
>=20

I=E2=80=99m testing Jean=E2=80=99s repo at:

https://git.codelinaro.org/linaro/dcap/qemu/-/tree/cca/v2?ref_type=3Dheads=


Itaru.=
