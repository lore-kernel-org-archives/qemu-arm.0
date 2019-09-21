Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp987453wrp;
        Sat, 21 Sep 2019 14:23:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4dGR+h5qv63vVhK49R4Qwvo5VF2egnry6HoYFQf09kX/95Kf2Aizzg8IXGIGOjZiR/WiV
X-Received: by 2002:a17:906:60d0:: with SMTP id f16mr24375271ejk.267.1569101034569;
        Sat, 21 Sep 2019 14:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569101034; cv=none;
        d=google.com; s=arc-20160816;
        b=tBWz67CgqmWFg0GFqsaQCZN+RsG78wm9zMDdJFVAHrKvfF2cGwnn83kczzJ5ECLqCT
         tuX2HwyL35y7IMdpG2yb8cApuWIymy5RHt44PDkMmQKxMtmMhFfGllCn9v8ipMy0E6fr
         YgmLFlwHSP8pmri/PdcjiG+v679ypygnKJ5fkXQwYEyOS4R17MZg2ipiQkmEEd/7KQZg
         6cEnF2HN4gUW/CoscT+wDVxa13r60nTrF/4XHv+CGkDuS4Zqq/IgKze9xQIiYzwvHXq4
         j9sL0MlF9gVACsTELoUBjuppS21LI36kNg1WtsYKJUtgNhxQgNm5M8z6/M/YLLsKIjKT
         qfzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=TkUzjYncvntC7zkP3J2VUBzsY3k1Kp6v5/zUdwOh6Ys=;
        b=HvdavCpm2tiMgQYKplNxN/4mo+3267wGkwMpcyy/IPHNKgz8oMyAj+kBOMrnFJ858k
         haFZHhwLMaIhd6XivJac4FotMsoDk3YSyBwpuIumuJ+OKbV7j75/J0RFfl0AnmkxDXaT
         ML+f2saoD2ViL+VFqwNns/1T1RE4QOTm7h9tlrDNv4pgp0lcb1GcephvTM6wFDPwVblP
         sbWgOVMe6F2LLNrOcfqKKOFUhkv0iqQX4/hFhnHVcrDw24s3rZNKNy2nUTOBlH/NVcGK
         YWsDMz85aVNCkHB+moxpAqvOqRO95yhifKvvsJJQetBxu07Q06gmj8L47hhYewtBsqfi
         7Nzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=dC5qynKD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si2830914eja.377.2019.09.21.14.23.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Sep 2019 14:23:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=dC5qynKD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBmrB-00062N-KV
	for alex.bennee@linaro.org; Sat, 21 Sep 2019 17:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37065)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sherrellbc@gmail.com>) id 1iBlwj-0001gf-4R
 for qemu-arm@nongnu.org; Sat, 21 Sep 2019 16:25:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sherrellbc@gmail.com>) id 1iBlwi-0004qG-05
 for qemu-arm@nongnu.org; Sat, 21 Sep 2019 16:25:32 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:42031)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sherrellbc@gmail.com>)
 id 1iBlwh-0004pi-SM
 for qemu-arm@nongnu.org; Sat, 21 Sep 2019 16:25:31 -0400
Received: by mail-qk1-x734.google.com with SMTP id f16so11069719qkl.9
 for <qemu-arm@nongnu.org>; Sat, 21 Sep 2019 13:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=TkUzjYncvntC7zkP3J2VUBzsY3k1Kp6v5/zUdwOh6Ys=;
 b=dC5qynKDyBh5R4hbOAdVWpdROW0G2MUrpbffEhouHTTbC5/M3b4GzoInHo02uU2r4K
 4D5XGCpew/lfvLqUf9qNvQWKYQ4wFB4yZBACAXKAZE8RYwouTwAejwlY1tN6aUiTRzeR
 C0QHaPDAFO2864GRig0gt7fAKAmp1rhPsUoZyEtH8qPyiCjuRYnI9e3LH6FDy8DEIFOp
 ep/iPLHM+1+6fnrzgiu2KPJ81yHyG9y46VQXnlaha7h99zcLgDab8jO8QPSR79xd6CmM
 gc1/SiU+jMCxCahoii/vsg0kTIjPRct9krS33hANdmm8uKplAGAZsW+gkVOBWqsfXN0R
 aAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=TkUzjYncvntC7zkP3J2VUBzsY3k1Kp6v5/zUdwOh6Ys=;
 b=sVLgYuHU/Nz5qg6tEmLaikNpZ5M350E2gjqNeF9J3pxyRnA2PuuwUCVeiFV+W++YwS
 QgCiEQ0qFCZqZ8QH528CKWdx5hp5V+jsWL36KChJGfbANHX6WPOg0mjPCWFsvQwYJsGe
 JgMwIIT1a4XD5TYzwRY4wbUCTD3HRO0it6ZNKoTZPFQBKFZ/JH8IL4X7mhIyYCYxvrLP
 eY+wzh2PrLWk3PEjHkGiDeyDIaFF1gtzyB34Z+VlH+0ljsU4cIZkTnWe8So9dMikiSUq
 IUmR0flEipKtsO9WQrnYEB6B+/F4+LKGRy8PrZXiw88n4gRNaL+JqG58fGA0JLfRsr5O
 ytng==
X-Gm-Message-State: APjAAAUExOksXgLzsmmNEDmH+j9WexhLAEA1h2vIHF/p6YFLwEsDyNJ/
 zJnkI73qYHQJ3sIFajvN9sNwMB4HZm7ieKgtCxVZLQ==
X-Received: by 2002:a37:ea1a:: with SMTP id t26mr10011538qkj.211.1569097530459; 
 Sat, 21 Sep 2019 13:25:30 -0700 (PDT)
MIME-Version: 1.0
From: Branden Sherrell <sherrellbc@gmail.com>
Date: Sat, 21 Sep 2019 16:25:19 -0400
Message-ID: <CACkBWHZY72Hd6ekan5yi8RLf69g6Q4zHpuFvARaTOVw-_FjNoA@mail.gmail.com>
Subject: Remapping Flash into VM address space
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ebcc8d059315fc14"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::734
X-Mailman-Approved-At: Sat, 21 Sep 2019 17:23:46 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vKAUUV96KdAq

--000000000000ebcc8d059315fc14
Content-Type: text/plain; charset="UTF-8"

Hi all,

I've been prototyping EL3 firmware using the virt device lately. After
successfully initializing the page tables I was met with a particularly
strange issue: I am unable to map the Flash memory range into the VM
address space. At first I was identity mapping everything. I considered it
might be a strange issue related to using address "zero", so I tried moving
it above where I mapped RAM. However I'm always met with the same result:
Data Abort.

All other translations work, including the UART and RAM. I've tested my
translation table configuration in many ways, including several VA mappings
to the same PA and non-identity mappings. Everything works except those
destined to hit the emulated Flash hardware. Is this a known issue? Is
Flash handled differently than other emulated hardware in QEMU?

I tried enabling MMU debugging with `-d mmu` but, after looking through the
code, it appears to not be implemented for this target.

--000000000000ebcc8d059315fc14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div><br></div><div>I&#39;ve been protot=
yping EL3 firmware using the virt device lately. After successfully initial=
izing the page tables I was met with a particularly strange issue: I am una=
ble to map the Flash memory range into the VM address space. At first I was=
 identity mapping everything. I considered it might be a strange issue rela=
ted to using address &quot;zero&quot;, so I tried moving it above where I m=
apped RAM. However I&#39;m always met with the same result: Data Abort.<br>=
</div><div><br></div><div>All other translations work, including the UART a=
nd RAM. I&#39;ve tested my translation table configuration in many ways, in=
cluding several VA mappings to the same PA and non-identity mappings. Every=
thing works except those destined to hit the emulated Flash hardware. Is th=
is a known issue? Is Flash handled differently than other emulated hardware=
 in QEMU?</div><div><br></div><div>I tried enabling MMU debugging with `-d =
mmu` but, after looking through the code, it appears to not be implemented =
for this target.<br></div><div><br></div></div>

--000000000000ebcc8d059315fc14--
