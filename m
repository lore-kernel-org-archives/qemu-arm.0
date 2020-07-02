Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1314674lfm;
        Thu, 2 Jul 2020 02:50:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMUQKy1UBWwV1Fn2623+JeUEi1PBPhA82lQOR+5TPweZfZU/Vnpl8ePoxp+tFEKUfO6Ngh
X-Received: by 2002:a25:c5c3:: with SMTP id v186mr47000146ybe.233.1593683412191;
        Thu, 02 Jul 2020 02:50:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593683412; cv=none;
        d=google.com; s=arc-20160816;
        b=D5QsqEYy9L/z8UirWb28kRgF/cv6czaUeiWdFNkOozync9MpQqmIwZc1I8f1ef19v6
         dIfVPrRM9/hI1lfX5v2HhgQ0qv2h1OpWhRhyHaa+uTyLWrTS2TQ1gVJUYtujMcfPKk2Y
         cI9KqsnNG3sGJT2wZfxSigg9WCKAK7WuNYv/Y0ZgFyx0/62RR22ynLt8sAhqaw2pDH98
         6B7sDfFhV9OKFWXrPYdFpi/xD8yoJPPPNbPdqylGZHB/aQqjMm0UTTMMzGWSM4UY2Oi4
         0uuGjdb/YdDo+YET7ARSUd23Zln4NPCzYTSw4fATkBlWCtxSgB4SeoSS8MBsH6IN6+ou
         QFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KDQqUPp22m1i+Ap0vb6kh+3I9gxv+90WTpmNGByHgvs=;
        b=EvuG79Cgr8/u3Lo2wLMALepldOOGQrtIuCfatOnNqRmzpYFt8eDhIPctdX36M+kuQC
         8RAKxJA1+mOG8DIc9ovkBaXfzFUvC2NcqetxofhJkDgPBMQbppo6acDTYIT+9Zl3+eSg
         i42qKZriTZMbfN0SckAcY2SEs1uLeJnBpNA4tfgAmMGTdT1HmZrlg8yGGsGgcsZQpS08
         KjzeV65WYU9F2WoOEoiBaZTh3qPRXFKomvb9gjEInOU+3kIjDqYWanRy3sjm9+5cptFS
         Ns/iRNKaO2/OkaYnBorrFh1fq2pPDaB9BZIFZZK1PAw/QL36FmNhiY/CncR00cJp5oQV
         w7WA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CYdFT3u7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si8502693yba.205.2020.07.02.02.50.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 02:50:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CYdFT3u7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqvr9-0007fJ-GS
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 05:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jqvr1-0007dJ-Cf
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 05:50:03 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42664
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jqvqz-0005IP-Oc
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 05:50:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593683401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KDQqUPp22m1i+Ap0vb6kh+3I9gxv+90WTpmNGByHgvs=;
 b=CYdFT3u7bV6GGbUz2u1Ihv3IRXpI2vGqmw4JijmvGGXxxHaNAN1ZK0UgTR/5aGwKQGw9rb
 p/8x/094YsICJh6J0iDoqq1XNkwbXHNPeiWxC63XJ8juznRsXgAnr+cG5WukLyb5x/LqdN
 m228CkIQl2lVEpGXejU+vrGjH6mlFj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-QD5f9HimMLaNAQXhXE_MtQ-1; Thu, 02 Jul 2020 05:49:57 -0400
X-MC-Unique: QD5f9HimMLaNAQXhXE_MtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1771D18FE861;
 Thu,  2 Jul 2020 09:49:56 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-177.ams2.redhat.com
 [10.36.113.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11CB8619C3;
 Thu,  2 Jul 2020 09:49:48 +0000 (UTC)
Subject: Re: [PATCH 4/4] tests/acpi: virt: update golden masters for DSDT
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200629140938.17566-1-drjones@redhat.com>
 <20200629140938.17566-5-drjones@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <8ccf5fe1-35b4-34e1-828e-3e89af44793c@redhat.com>
Date: Thu, 2 Jul 2020 11:49:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200629140938.17566-5-drjones@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:18:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, mst@redhat.com, shannon.zhaosl@gmail.com,
 ard.biesheuvel@arm.com, imammedo@redhat.com, philmd@redhat.com,
 eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DY3QBZ8gYK19

On 06/29/20 16:09, Andrew Jones wrote:
> Differences between disassembled ASL files for DSDT:
> 
> @@ -5,13 +5,13 @@
>   *
>   * Disassembling to symbolic ASL+ operators
>   *
> - * Disassembly of a, Mon Jun 29 09:50:01 2020
> + * Disassembly of b, Mon Jun 29 09:50:03 2020
>   *
>   * Original Table Header:
>   *     Signature        "DSDT"
> - *     Length           0x000014BB (5307)
> + *     Length           0x00001455 (5205)
>   *     Revision         0x02
> - *     Checksum         0xD1
> + *     Checksum         0xE1
>   *     OEM ID           "BOCHS "
>   *     OEM Table ID     "BXPCDSDT"
>   *     OEM Revision     0x00000001 (1)
> @@ -45,32 +45,6 @@
>              })
>          }
> 
> -        Device (FLS0)
> -        {
> -            Name (_HID, "LNRO0015")  // _HID: Hardware ID
> -            Name (_UID, Zero)  // _UID: Unique ID
> -            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> -            {
> -                Memory32Fixed (ReadWrite,
> -                    0x00000000,         // Address Base
> -                    0x04000000,         // Address Length
> -                    )
> -            })
> -        }
> -
> -        Device (FLS1)
> -        {
> -            Name (_HID, "LNRO0015")  // _HID: Hardware ID
> -            Name (_UID, One)  // _UID: Unique ID
> -            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> -            {
> -                Memory32Fixed (ReadWrite,
> -                    0x04000000,         // Address Base
> -                    0x04000000,         // Address Length
> -                    )
> -            })
> -        }
> -
>          Device (FWCF)
>          {
>              Name (_HID, "QEMU0002")  // _HID: Hardware ID
> 
> The other two binaries have the same changes (the removal of the
> flash devices).
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  tests/data/acpi/virt/DSDT                   | Bin 5307 -> 5205 bytes
>  tests/data/acpi/virt/DSDT.memhp             | Bin 6668 -> 6566 bytes
>  tests/data/acpi/virt/DSDT.numamem           | Bin 5307 -> 5205 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   3 ---
>  4 files changed, 3 deletions(-)
> 
> diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
> index d6f5c617881c4247f55d4dcd06581f9693916b2f..e669508d175f1e3ddf355f8a9b0d419266cac8aa 100644
> GIT binary patch
> delta 28
> kcmdn3c~yhUCD<h-RD^+n>ET2!X{H9}iRuX(-<}f&0DgxFc>n+a
> 
> delta 156
> zcmcbrv0IbNCD<iow+I6R)5VEg(oAih6V(&y4c&Z#4LIUGJY9Hw{DS-q3=B;fIO0P+
> zU4W!>P_UpN7hfAE10w?juv9WcH-WSmV$;Hiu7w4t3#`S$E!^1+q9xGPH`KtuzzAr5
> LaERl^1zUvy_;n(J
> 
> diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DSDT.memhp
> index 730e95a46d2cce0af011ffc051d7342beb8f1328..4cb81f692d73526542493a0c4da9c9793cc8366e 100644
> GIT binary patch
> delta 28
> kcmeA%S!T@T66_MPOp<|tiD@F2G*jb@iRuX(-^xn@0CHUjRR910
> 
> delta 156
> zcmZ2x++)J!66_MfBgMeL^l>7WG*kP$iRuaUhHgH=1|0Doo-VvTenI{Q28N~#9Py!^
> zE<n;bC|FRCi?5B7fsp|MSSlH!n?PC&v1wsM*TMqS1=eEW7Vhi@(GuwD8){%+U<5Qj
> LIK*+|0yaqism~!^
> 
> diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/DSDT.numamem
> index d6f5c617881c4247f55d4dcd06581f9693916b2f..e669508d175f1e3ddf355f8a9b0d419266cac8aa 100644
> GIT binary patch
> delta 28
> kcmdn3c~yhUCD<h-RD^+n>ET2!X{H9}iRuX(-<}f&0DgxFc>n+a
> 
> delta 156
> zcmcbrv0IbNCD<iow+I6R)5VEg(oAih6V(&y4c&Z#4LIUGJY9Hw{DS-q3=B;fIO0P+
> zU4W!>P_UpN7hfAE10w?juv9WcH-WSmV$;Hiu7w4t3#`S$E!^1+q9xGPH`KtuzzAr5
> LaERl^1zUvy_;n(J
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 32a401ae35fa..dfb8523c8bf4 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,4 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/DSDT",
> -"tests/data/acpi/virt/DSDT.memhp",
> -"tests/data/acpi/virt/DSDT.numamem",
> 

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

