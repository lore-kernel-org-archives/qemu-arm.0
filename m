Received: by 2002:a05:7022:459c:b0:46:f5cc:2c85 with SMTP id cf28csp287707dlb;
        Tue, 29 Nov 2022 03:49:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf68ldgeaAYW7qROUsBSlvtZHoqFR+sc+g8PMEkAqE6nwVj+GqlAu/HCzbCApqtDZs0DsWtg
X-Received: by 2002:ac8:7615:0:b0:3a5:1be7:3603 with SMTP id t21-20020ac87615000000b003a51be73603mr52334416qtq.168.1669722543560;
        Tue, 29 Nov 2022 03:49:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669722543; cv=none;
        d=google.com; s=arc-20160816;
        b=B3PydDlcqBRSpXnZ+2AIrCIJKGMpyh5tSxlj3KvyIMuOlXTw1LXjiTPVHWF8LjSGhA
         MdSS3ki1LX+fLxnS5t5gwCKOrjQGzMCLvRoitCpHPhIhGZv1tcBB7Fqddmo4qOs6JWQ4
         cJGAMsoICfM1TiPCmvdf1UmPJx4smw8WuRn9OR+t369IHjp2XByv6NFTBG2f1ym0sCgH
         YjSYyoiWSA58PNfVV0sym7Yb8W+3iJbQlx4bhNX/BQ05fjbdKPzElYyfUMljh7oW84wG
         x+vM4dqbzW6jR63VmWT9Ma4jBBT5TykA3mwHk6gXjwSQPwFX4Lz83cJ6xYr3eMXnDsCr
         ZRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:dkim-signature;
        bh=mZgy7XLunnw/ANvmwORqoKJd/xgRxHzpkSNhiY8EVWA=;
        b=m/Bd77ptFYVM81X+GxG3BGZJ7sEINT38NyKWNOwszmVvABj9NNWzXHmUgwPu46dg+s
         GRUesyTumvcln33HSUhT+KEi9msYksekQ/oEvrcxQHJBx+F5sF8Qwo83C2c9EHZoqVoL
         j18ccfXf2+6a3ILfI205uGwHOOn+3htHhWiAoxuIPjBQ8NiqwZn7xjorGgIr48YJyeoL
         QuYD7jMsnfDvRAsQcdiwTVdtxp4kEuZBwr0rpSHt18NOZz0TLu0IYInglPuDwMcL+LdY
         cDUBAB2MZn0XyXePt9a2GFY+T46duL+haUMi2Csbp8ma5m61KH2rW+RU+kmslE5bQpwK
         2MzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gbo8FUZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7-20020a05620a112700b006fc40dafaa4si7314078qkk.198.2022.11.29.03.49.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Nov 2022 03:49:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gbo8FUZD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ozz6S-00049u-U7; Tue, 29 Nov 2022 06:48:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1ozz6P-00049I-D1; Tue, 29 Nov 2022 06:48:41 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <schspa@gmail.com>)
 id 1ozz6N-0007LK-GH; Tue, 29 Nov 2022 06:48:41 -0500
Received: by mail-pg1-x533.google.com with SMTP id h33so7799514pgm.9;
 Tue, 29 Nov 2022 03:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mZgy7XLunnw/ANvmwORqoKJd/xgRxHzpkSNhiY8EVWA=;
 b=gbo8FUZDzTXVdbcqiu31l0qwM3luHNatUunr0N4pEfMdtQ3tilHBF9zbqS5vMk+nLc
 WenCbgZVJLEnWHRZs7vj6J/PvClE55jlfAhFVVIvDnzwULi368QRY4Zy8LGSruJXGOcH
 36oQa0aiAi39KycetBS6t/mrolJbJCVNS9FLdXlXabJpoYrY4Cwbr7QZZWC1iOlz3WA8
 BxIILj2o6Jf/sh0jsFIT/7vKDYeIid8JxwoAecxxfsUOE40jITRUXFlYfxkSOc4eQ5dq
 OlBEaNs3SjTmHnLjLd7i6ihQuXqZuDUQzyXBXWAe2ZCBNvnB+mPkih9vYA/QkNvBJCGU
 cozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mZgy7XLunnw/ANvmwORqoKJd/xgRxHzpkSNhiY8EVWA=;
 b=8HNJseTYsno0bWtTei4C6kapey/DKr5GBBAt1/s2wzkRY+oosjrZefGNAUZVYpKwMy
 JLrveqf3MnZ0hUQsTxbSXy4XlojVJ0TL4MPA+sOb5rehXqNXmYsJwREsTgpHy3PtwHks
 ESB8Yc3k/8273DgOEVXSaoGKbgqXhncJOmkVfzc9LJw4TQ5gJDodgV32MH/Ki2JUqQYV
 diKLnAxMeN5seP3t3ATy2oyjFQr7kPOy+zHN0tqc6Fpz9m3m3Ro97yBqa+rZFNOPMCCZ
 4rqedE45VdKvFPamT5tQHNDkpmaS2ZESRdlMduKjW67e+vtxzzLNZyFYbnfKXRgancd1
 ImvQ==
X-Gm-Message-State: ANoB5pnTi4T2qWMYhco6SWoMjyW3FYgwecUEjAXEfu/ovjDyDYWi2KaW
 2GiDd9LZ3nJunFV5BKjZe5nbeWtJkvi6Yw==
X-Received: by 2002:a63:4d09:0:b0:477:7dc8:57a8 with SMTP id
 a9-20020a634d09000000b004777dc857a8mr31133483pgb.506.1669722517036; 
 Tue, 29 Nov 2022 03:48:37 -0800 (PST)
Received: from MBP (ec2-18-117-95-84.us-east-2.compute.amazonaws.com.
 [18.117.95.84]) by smtp.gmail.com with ESMTPSA id
 n1-20020a170902968100b00186616b8fbasm4024559plp.10.2022.11.29.03.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 03:48:36 -0800 (PST)
References: <20221129104809.84860-1-schspa@gmail.com>
 <84913eb8-75c3-5175-401f-9f4cc8409442@linaro.org>
User-agent: mu4e 1.8.10; emacs 28.2
From: Schspa Shi <schspa@gmail.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/1] hw/arm/boot: set initrd with
 #[address/size]-cells type in fdt
Date: Tue, 29 Nov 2022 19:46:41 +0800
In-reply-to: <84913eb8-75c3-5175-401f-9f4cc8409442@linaro.org>
Message-ID: <m2v8mym16c.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=schspa@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HLG8HN2Tq3Uk


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 29/11/22 11:48, Schspa Shi wrote:
>> We use 32bit value for linux,initrd-[start/end], when we have
>> loader_start > 4GB, there will be a wrong initrd_start passed
>> to the kernel, and the kernel will report the following warning.
>> [    0.000000] ------------[ cut here ]------------
>> [    0.000000] initrd not fully accessible via the linear mapping -- ple=
ase check your bootloader ...
>> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/init.c:355 arm64_=
memblock_init+0x158/0x244
>> [    0.000000] Modules linked in:
>> [    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W          =
6.1.0-rc3-13250-g30a0b95b1335-dirty #28
>> [    0.000000] Hardware name: Horizon Sigi Virtual development board (DT)
>> [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTY=
PE=3D--)
>> [    0.000000] pc : arm64_memblock_init+0x158/0x244
>> [    0.000000] lr : arm64_memblock_init+0x158/0x244
>> [    0.000000] sp : ffff800009273df0
>> [    0.000000] x29: ffff800009273df0 x28: 0000001000cc0010 x27: 00008000=
00000000
>> [    0.000000] x26: 000000000050a3e2 x25: ffff800008b46000 x24: ffff8000=
08b46000
>> [    0.000000] x23: ffff800008a53000 x22: ffff800009420000 x21: ffff8000=
08a53000
>> [    0.000000] x20: 0000000004000000 x19: 0000000004000000 x18: 00000000=
ffff1020
>> [    0.000000] x17: 6568632065736165 x16: 6c70202d2d20676e x15: 69707061=
6d207261
>> [    0.000000] x14: 656e696c20656874 x13: 0a2e2e2e20726564 x12: 00000000=
00000000
>> [    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 00000000=
00000000
>> [    0.000000] x8 : 0000000000000000 x7 : 796c6c756620746f x6 : 6e206472=
74696e69
>> [    0.000000] x5 : ffff8000093c7c47 x4 : ffff800008a2102f x3 : ffff8000=
09273a88
>> [    0.000000] x2 : 80000000fffff038 x1 : 00000000000000c0 x0 : 00000000=
00000056
>> [    0.000000] Call trace:
>> [    0.000000]  arm64_memblock_init+0x158/0x244
>> [    0.000000]  setup_arch+0x164/0x1cc
>> [    0.000000]  start_kernel+0x94/0x4ac
>> [    0.000000]  __primary_switched+0xb4/0xbc
>> [    0.000000] ---[ end trace 0000000000000000 ]---
>> [    0.000000] Zone ranges:
>> [    0.000000]   DMA      [mem 0x0000001000000000-0x0000001007ffffff]
>> To fix it, we can change it to #[address/size]-cells type.
>> Signed-off-by: Schspa Shi <schspa@gmail.com>
>>=20
>
> Something is odd with this patch, using Thunderbird + Colored Diffs add-o=
n can't
> see the patch content, but I can see it archived:
> https://lore.kernel.org/qemu-devel/20221129104809.84860-1-schspa@gmail.co=
m/
>
> Maybe because you used '--' instead of the git '---' separator?

This maybe cause by the seprator above the Change log line.
I use '-- ' as seprator.

Should I resend a new V3 patch to fix this ?

--=20
BRs
Schspa Shi
