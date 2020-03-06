Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp4268108lfi;
        Fri, 6 Mar 2020 06:28:32 -0800 (PST)
X-Google-Smtp-Source: ADFU+vv/SvOdP8izuHka/sQcezJFxlJSEMWyUkzlo5E+WoKE5HItc0rTQrsQstYUXyxvGLIwNSBU
X-Received: by 2002:a0c:fc46:: with SMTP id w6mr3155800qvp.46.1583504912381;
        Fri, 06 Mar 2020 06:28:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583504912; cv=none;
        d=google.com; s=arc-20160816;
        b=0bvjRd3J1u99k1cE8NBRy41MkD1RFz4LHRmorHU4OhMXQEj28ICAdN9gXtdTYbSSwX
         PxXzRNGI2pdBpGh/jpiUET8mlV1wgnfozMqlHYHAaiz/e9f3F9NRQB+jDGua227rsvw5
         UvLOtsnx/APo3ASWZKQFBN+EuyTBKaboM6rOYymXBB4xLiyyGMS5ymgneF5UGzx5iEUi
         eu9WnXMnjwXMFhVUzgBZ4XiT3fviV+u9ImkuXWWZf3d5AVHCMwTePTdhWEADxAXVayvP
         xX3iq1RsmOeSln2Kf34GEMZH+2c5SaABC2ECrVnTxsdrrDhF3RERKj2Lu0TQTQEGxg4V
         yvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=zexsaYdz6DQAfVaaPXw2T/xuvAPNnGudtHfXvjWogFw=;
        b=Ud3LY8oZTuNKxYkaubbLUN4gbgVbGGYX2ZjUZeGCu1/MqVwaEpHBVVyn5UUJXFX7fB
         wXXTPRI615boMaC3Zw+pVaKNST9ubYfamB5HN8oRKQffvJ96vsnrZQPYl1JLZS3zLiOz
         G8rW67rks9tvB+e/RQ+vVLNZv39cgTvYZkGeCDpPzgAgEb2Jb30gKVYmafP33OUKyhcE
         HEcO7Zlf5UE7uRBrUMv3OvVOMReye94pq+8AXF2eewPNgzH/FQrTpZ2kl/E0k5nFeMp7
         L+8EY5hS1AeT6G/jiPdtigz/hC6CbYeWFqxymqHlNAl4Igi2n4DlfFXNEQFMtxfOAjDf
         pr0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MCCzm824;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9si1386391qkl.363.2020.03.06.06.28.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Mar 2020 06:28:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=MCCzm824;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37567 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jADxn-0001G1-Ss
	for alex.bennee@linaro.org; Fri, 06 Mar 2020 09:28:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58318)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tanaygupta0x00@gmail.com>) id 1jA74i-0001ok-U5
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 02:07:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tanaygupta0x00@gmail.com>) id 1jA74h-0001Rq-TF
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 02:07:12 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33156)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <tanaygupta0x00@gmail.com>)
 id 1jA74h-0001Lu-Mz
 for qemu-arm@nongnu.org; Fri, 06 Mar 2020 02:07:11 -0500
Received: by mail-wm1-x32e.google.com with SMTP id a25so8720827wmm.0
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2020 23:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zexsaYdz6DQAfVaaPXw2T/xuvAPNnGudtHfXvjWogFw=;
 b=MCCzm824aWxJU7EL44KBVClb800OmTGqaDI+w+BYllmIzvme0L4SCFmx5lcFjXW4Z2
 GH9m/nCqubcT7Ni7Sfox5aOSNlzJ4retjrOtPut2YkXbMr1/osOkfGrKaaysslb6fcyC
 ykl/9V4I9fnm29Ftwwtga55YrRkZ2sJVNTL37RJ1Q/v9PHViSeg7hkZPmntfmEQtr7iB
 p1I32nsfpkSGG1nM+CHpWNMu5fiLAKveC0851Q+0w5MZ8sxVImBtVBfDQl0yK/TxH0Fz
 FFT8QznV6vtZHSRJm3T+hmnXc/1sPb2UvOv8rn+Sg/upkg7PwySCbONiVMT5pJWUZWur
 M4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zexsaYdz6DQAfVaaPXw2T/xuvAPNnGudtHfXvjWogFw=;
 b=qh9Uhfpi5pgD0RQUVYD6YpzHgyoflmMyUS8JrOcGIk8gjBDDdzw3AR00/ju55TkZ58
 E4TAPXLVi2D7Q7qhvkalCXtcnSWsoXLodFvAKr81kap6B/pKy0XhklKJIuIY2uj9x69i
 GsvFXQR9bfilg75nuUmUjdAHOfOVAegjhaEC+U2yJQw7amxbBthdrDstMXiq9Af9dXtE
 ytKbTqC8DKmkSynapkrjU+Pnr0Spip5QUCuO573BNcNrIlzxWlF1AEeBHeqfPW+/jd2m
 NCpMbGLkiq4wysD+8LDDeNDK9JUVB+7mRWiHrwCpzaKxXjG/gLa42VVIKbHennZ+OCi8
 S86g==
X-Gm-Message-State: ANhLgQ3bbedDtyLu/+dOud33PEp869TLSMtItQPVrnhCFgLhjSXeiZSA
 rPILeRyCOLjn3gwhy6wmnpNG+OG6j/9GVMrXb8MI3g==
X-Received: by 2002:a1c:7e57:: with SMTP id z84mr2277129wmc.148.1583478429563; 
 Thu, 05 Mar 2020 23:07:09 -0800 (PST)
MIME-Version: 1.0
From: Tanay Gupta <tanaygupta0x00@gmail.com>
Date: Fri, 6 Mar 2020 12:36:58 +0530
Message-ID: <CALUW38uZL2PLM=GvBY=6uC=Fp0OE5ABJAKwUgebTEmPX5gK6eA@mail.gmail.com>
Subject: Custom ARM Board: Setting BE32 endianness
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004dc16405a02a4d51"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32e
X-Mailman-Approved-At: Fri, 06 Mar 2020 09:27:02 -0500
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
X-TUID: HzuwhC1FbSz8

--0000000000004dc16405a02a4d51
Content-Type: text/plain; charset="UTF-8"

Hi all!

I'm trying to write my own board, and I'm not quite sure how to set the
endianness to BE32.

I am loading binaries to memory using load_image_targphys_as.

I have tried:
- passing -cpu arm1136,cfgend=yes
- using the setend be instruction
- using mrc/mcr to change CP15

In all the above cases, I check whether the endianness has changed in these
ways:

- xp /10i 0x40000000 in qemu monitor; which prints the LE interpretation of
the code no matter what I do
- running the binary; which always ends in an ABORT32

The binary which I'm loading works on actual hardware, and I'm trying to
emulate it using qemu.

I don't have the elf, so I can't use the -kernel option.

Can someone please help me figure out what I'm doing wrong?

Any help is greatly appreciated.

Thanks,
Tanay

--0000000000004dc16405a02a4d51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi all!<div dir=3D"auto"><br></div><div dir=3D"auto">I&#3=
9;m trying to write my own board, and I&#39;m not quite sure how to set the=
 endianness to BE32.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I a=
m loading binaries to memory using load_image_targphys_as.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">I have tried:</div><div dir=3D"auto">- p=
assing -cpu arm1136,cfgend=3Dyes</div><div dir=3D"auto">- using the setend =
be instruction</div><div dir=3D"auto">- using mrc/mcr to change CP15</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">In all the above cases, I chec=
k whether the endianness has changed in these ways:</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">- xp /10i 0x40000000 in qemu monitor; which pri=
nts the LE interpretation of the code no matter what I do</div><div dir=3D"=
auto">- running the binary; which always ends in an ABORT32</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">The binary which I&#39;m loading work=
s on actual hardware, and I&#39;m trying to emulate it using qemu.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">I don&#39;t have the elf, so I c=
an&#39;t use the -kernel option.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Can someone please help me figure out what I&#39;m doing wrong?</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Any help is greatly appre=
ciated.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><di=
v dir=3D"auto">Tanay</div></div>

--0000000000004dc16405a02a4d51--
