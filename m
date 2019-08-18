Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1539987wrs;
        Sun, 18 Aug 2019 05:39:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwu5lJ5HfmRgcaTWHMz0g26EKHjnHWcpkLTCmHwx/0P8VypDB07jgEYXkW45FowsC/Sgnhq
X-Received: by 2002:a05:620a:12e7:: with SMTP id f7mr17291356qkl.471.1566131969434;
        Sun, 18 Aug 2019 05:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566131969; cv=none;
        d=google.com; s=arc-20160816;
        b=DsDDfH1CeeZEZwu8cKmM1nHJgEoPbKCKzAoH7AEzfD2hhB5XBJTfcAkD40p5I1z7Q7
         DBgDQzEJCDBmRGoKZLQ5Uj7O3zVDRWJ1qQshRJRdocX5S6nkLF6KR7Rt/jrpPZ3VGKqW
         ZbTdEKI6AOq5Hypv6/fYiF2wKu0ia+aWIA37Les7voNhTXP6jEglRk+wXbY5pz5QzKi7
         Bc0sJd+kQ7rHWTmzVkVQw55YfgzICTk8QVQUKNhJjAOGa/+tok3Ten19/uJ67QoyrvK4
         CLqZJjXaPHotszf0vi9qMGGxaBD+7juCuh8ujzbdKEhFT1U5q5SBYWX/G4Wc0ytLLSIV
         m6Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=Q2CECf3Z0VZS2vsykoHMilxYJWnJFnixOycIv/0VdAc=;
        b=SU3cQGHaezV6+Q9qSluftdCbOlRBk8wOFwubvYgTuGrbIIE+9eCJezMJ+ViZp8OfWd
         8w3g4OJwFMGwVSW46+Qnfyr14+3Ehclxw4WsjwB8N5rPsQyKFowTLsC4LynhNtIPaUpZ
         C0StFjDc0m0GKD5emdGwH/wsHX7fiGtJO7WIXpA8B1uyzLfMbpBPiQZ2BaqgEpm2H6sK
         ralPIrsNuP57ad+AqkElLr8VIXpSldMCG1R9LZTs4RUzuRT0daWC1zrMLpfEAY7V1g16
         pAMf+LuusaM8cttGKm9T9wSO0xxuvu2n4cyVzF6Bcmumg0dUjRT3osFlbSrefV/O5XLG
         mVlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vH3nKXkl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si7264626qtu.68.2019.08.18.05.39.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Aug 2019 05:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vH3nKXkl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzKT2-0007Pc-Us
	for alex.bennee@linaro.org; Sun, 18 Aug 2019 08:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45793)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzKRq-0007AG-RV
 for qemu-arm@nongnu.org; Sun, 18 Aug 2019 08:38:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzKRp-0007Bm-KA
 for qemu-arm@nongnu.org; Sun, 18 Aug 2019 08:38:14 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34094)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzKRm-00078Z-Ap
 for qemu-arm@nongnu.org; Sun, 18 Aug 2019 08:38:11 -0400
Received: by mail-wr1-x443.google.com with SMTP id s18so5901762wrn.1
 for <qemu-arm@nongnu.org>; Sun, 18 Aug 2019 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q2CECf3Z0VZS2vsykoHMilxYJWnJFnixOycIv/0VdAc=;
 b=vH3nKXklQ3D6J2/DUV/Muhm5EQqjnOi1dOFDnoYkoWbFdHGdCTt0Q8H/PEx3US8HVr
 BvUvT45unuUHziXG9CABuehFsnGiy92O9yPs6EM1DOjtOQOUOf5aNmusmYAtenEpKhZU
 Pu6WIhMrgQs6oTjcv5/b9mcugffLmrQy+Ga3LvHGe4Cbic6u7Zp2AlmUwB1zher+kYK6
 3yBCSezj6lVnUja0g2Vxd3RILIf1CcZ6VnwhbaSkueQsZrX7Limpesb3ZKhlOXNae2KW
 7sCJeCoUVb6HYQGT38JuljsiR4FUcloY4PuupNMx8KAHk526GfDKtMT4X6DaoSdbTrHc
 yG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q2CECf3Z0VZS2vsykoHMilxYJWnJFnixOycIv/0VdAc=;
 b=Mx5+UZ3vAJVfCUQLIYGeuEV1MmVim7Mc1S9QjmXlutBjr6DV3HIMunvVo2rMjVMkQ/
 h3DBGV63LGO1XOUEkZejoRXKLHVg8aZDjLxS3HYOTp6oItl5vQq/PJVs8fvEuBTda3Ts
 Ci8kFP4rqp+b8RzGzhDSrT4ttuzQGj3IccwxuLbabGxNdX1+XYF0TGf9K1rk0dhcj7mH
 MJgG80s7oRf4b0ZKbt1aWQSM5P/vu5cIimyJD8TCkQELzu16ekR5xQGtWwMkozwbjQxc
 2DShe1+b+kgQvGpFkMP60fdIW59V1qIALdHPgDMf3slwSosdMO4QRUFWlXMTTmURQ+Hx
 U31g==
X-Gm-Message-State: APjAAAW7QTgV/LNtqdMYDB3nKPemcjH85VdGQiQI+EyK0JuxX2J2pX5e
 n8GUYUmvD0b8z30iaDvObOBDKA==
X-Received: by 2002:adf:f710:: with SMTP id r16mr22248357wrp.81.1566131885195; 
 Sun, 18 Aug 2019 05:38:05 -0700 (PDT)
Received: from [172.16.53.135] ([82.3.55.76])
 by smtp.gmail.com with ESMTPSA id r190sm12495818wmf.0.2019.08.18.05.37.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 05:38:04 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565941103483.3364@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <078b4e19-2b1e-bc21-f419-1064e45e5173@linaro.org>
Date: Sun, 18 Aug 2019 13:37:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565941103483.3364@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 37/42] cputlb: Replace size
 and endian operands for MemOp
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 cohuck@redhat.com, sagark@eecs.berkeley.edu, david@redhat.com,
 jasowang@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 i.mitsyanko@gmail.com, keith.busch@intel.com, jcmvbkbc@gmail.com,
 frederic.konrad@adacore.com, dmitry.fleytman@gmail.com, kraxel@redhat.com,
 gxt@mprc.pku.edu.cn, pburton@wavecomp.com, xiaoguangrong.eric@gmail.com,
 peter.chubb@nicta.com.au, philmd@redhat.com, robh@kernel.org, hare@suse.com,
 sstabellini@kernel.org, berto@igalia.com, chouteau@adacore.com,
 qemu-block@nongnu.org, arikalo@wavecomp.com, jslaby@suse.cz, deller@gmx.de,
 mst@redhat.com, magnus.damm@gmail.com, jcd@tribudubois.net,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, mreitz@redhat.com,
 hpoussin@reactos.org, joel@jms.id.au, anthony.perard@citrix.com,
 xen-devel@lists.xenproject.org, david@gibson.dropbear.id.au, lersek@redhat.com,
 green@moxielogic.com, atar4qemu@gmail.com, antonynpavlov@gmail.com,
 marex@denx.de, jiri@resnulli.us, ehabkost@redhat.com, minyard@acm.org,
 qemu-s390x@nongnu.org, sw@weilnetz.de, alistair@alistair23.me,
 yuval.shaia@oracle.com, b.galvani@gmail.com, eric.auger@redhat.com,
 alex.williamson@redhat.com, qemu-arm@nongnu.org, jan.kiszka@web.de,
 clg@kaod.org, stefanha@redhat.com, marcandre.lureau@redhat.com,
 shorne@gmail.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 qemu-riscv@nongnu.org, proljc@gmail.com, pbonzini@redhat.com, andrew@aj.id.au,
 claudio.fontana@suse.com, crwulff@gmail.com, laurent@vivier.eu,
 Andrew.Baumann@microsoft.com, sundeep.lkml@gmail.com, andrew.smirnov@gmail.com,
 michael@walle.cc, paul.durrant@citrix.com, qemu-ppc@nongnu.org,
 huth@tuxfamily.org, amarkovic@wavecomp.com, kbastian@mail.uni-paderborn.de,
 imammedo@redhat.com, aurelien@aurel32.net, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0qjJ6pG6+TCh

On 8/16/19 8:38 AM, tony.nguyen@bt.com wrote:
>  static uint64_t full_ldub_mmu(CPUArchState *env, target_ulong addr,
>                                TCGMemOpIdx oi, uintptr_t retaddr)
>  {
> -    return load_helper(env, addr, oi, retaddr, 1, false, false,
> -                       full_ldub_mmu);
> +    return load_helper(env, addr, oi, retaddr, MO_8, false, full_ldub_mmu);
...
>  void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
>                          TCGMemOpIdx oi, uintptr_t retaddr)
>  {
> -    store_helper(env, addr, val, oi, retaddr, 1, false);
> +    store_helper(env, addr, val, oi, retaddr, MO_8);
>  }

MO_UB.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
