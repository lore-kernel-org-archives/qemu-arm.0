Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3779650lfq;
        Mon, 28 Sep 2020 09:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLcwtrrummH3zC7j62uF4weHmggx3WfI/EaRQxqnV3aG3ktsGPXt67XHRXNpS0VMWWfYQv
X-Received: by 2002:a25:ac99:: with SMTP id x25mr427956ybi.13.1601309934058;
        Mon, 28 Sep 2020 09:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601309934; cv=none;
        d=google.com; s=arc-20160816;
        b=PiN5nGRLuTC9Oh7EXEmRl1Tu7XMJtJDcaizrx0dxPZw/2jCcnWM41akjo4RqsIU1QV
         D+7f7WHeuXTJmRH0pvqc0opIJ66UXGaCgB3bqb/nMQMqIwkKdj/BLfhjZgyAsBS6SOOk
         tU5T8KDBGKyCJKGJ0A5Exi9cMXy+4pN9FXdbNV2RAA5Lh5qvCX8OHalqCTnKILVRRGxX
         l3s2lqDhRooSQWBZ4Cki9VyrX/IefphCnxV/DCfEl1yHeqjpNr019hr1v61Rnszd2Yrv
         pD5aC1rhb40ocYE1ORjworNFf/IUYZgwtpQkYbJtl32QDAEXK6fg3usl8KtMaGY80M0h
         hp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=NuD0lMwvpzn5vDhe8ZM0TLc0R2Pl21Ma5DHqG/maFe4=;
        b=tQlQDfX+cPrP9rHoM4F7TTGFsGPhjEBKcuId2ZykA1sLVvMKLRVRboa5eoUBEEWIBx
         9GnyS6ZLB/yTSi20wgzSnY+i+M7sFDY6lQAP7ubv8o0PviYxHHLCWNiTPJ2X5hDYEaOl
         NF95nnmcOO0n9LTORwNFs6nJRVq/hJGFNcVrXdtLzpuolPk3e8MJJhmhd5bSIBD9nz76
         7/dY3w3sC+C8ky9UOFNagcRG0HP0upvOeAs2zTI4ZCZtcTOOAw3QFbNnM3vmalObWYP/
         PRvL8K50HavmzIdhZJSnxQysLh6C21Mx2ZptP2RTIA/eMvwgrJcf+WfK9RKIjp+kt8vQ
         rKdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="Yd/gObof";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18si1308217ybj.342.2020.09.28.09.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 09:18:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="Yd/gObof";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kMvrZ-0002bt-Dl
	for alex.bennee@linaro.org; Mon, 28 Sep 2020 12:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <psunjohnny@gmail.com>)
 id 1kMpFp-0003Za-BT
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 05:15:29 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <psunjohnny@gmail.com>)
 id 1kMpFn-0002Ib-K9
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 05:15:28 -0400
Received: by mail-ej1-x62f.google.com with SMTP id q13so7466204ejo.9
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2020 02:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=NuD0lMwvpzn5vDhe8ZM0TLc0R2Pl21Ma5DHqG/maFe4=;
 b=Yd/gObofM1B7ShKzj3FOsV5dRzUbZUeQrKTTmY0lRgXeTcWF0Skb+3qb1AEZHiL1xf
 ZIReHnkE8FQIpfJWpQfqBeShIsTulnLWC3JcIuBXZnPqxEoTSD+YIid/ZJJItGqtWZj2
 M04MqSK3/irYZTGqaB+lQaIcFSJLa/oVxa+DGEZH5I+TZaHnyxV629X7bjT+78gP7l8h
 c0oHro2mz3X2/LdQmXmBXS92DHdQH8HEO78avtAvMzegqnXJ/hBK8CDG/N8gU0jFXcUG
 kdbx79nwh9JnvijjkAFMJWAZzy7ilBcVwViEzY9wgANMXjMEB5827XNI1V4sCynz+JQP
 loEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=NuD0lMwvpzn5vDhe8ZM0TLc0R2Pl21Ma5DHqG/maFe4=;
 b=NvrvKe+GtUkRPy0GvLg0dJrcHld6gJMLcBzsSUejOHhBBB/U+K58Eoll88Kiz/nZFI
 hdLBQ4eytZ4SI0XgF1GrFx199ohAJyjpTNzlaE2wFznHvRv62Unqi6/8ljwIrxyYhgOX
 9H3Qa6En8OEG0mELvJOiS8EP0h6PmwPLmy+Ebn8IZrCxhAMFK6XTEtjHi07gDIWt/6kf
 rImpF8e5XOFnHzdx5QHjWfQT9623GXlwd0UWUbP0sZZ3T00gCaBzKtmz9lDH32GrkgUs
 hMZl7euxk2MyCCxgs8z8jZO7T0jaof64kpExJwInrDHMiHNpTkknc8cMykx4T7zZRBKf
 bmXg==
X-Gm-Message-State: AOAM531neJ4CVdPUPgyBC7Z71Levx7/IYmZ6qPg5W10NSfOOc5QTUwN4
 kRs9E1hTEPMGIrHXnaiyQmCzRcFwabDZZzYfJCuFM9qQEgVxKQ==
X-Received: by 2002:a17:906:2b83:: with SMTP id
 m3mr703756ejg.456.1601284525216; 
 Mon, 28 Sep 2020 02:15:25 -0700 (PDT)
MIME-Version: 1.0
From: Johnny Sun <psunjohnny@gmail.com>
Date: Mon, 28 Sep 2020 17:15:14 +0800
Message-ID: <CAEBAajZPv8bqHSBJ2iSw7njzy1yMrriO4GAAFuh+AAjy-enheQ@mail.gmail.com>
Subject: Any plan for supporting Raspberry Pi 4(raspi4)?
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004f596105b05c1b5b"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=psunjohnny@gmail.com; helo=mail-ej1-x62f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Sep 2020 12:17:10 -0400
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
X-TUID: You3gFvujaxc

--0000000000004f596105b05c1b5b
Content-Type: text/plain; charset="UTF-8"

Hi,

Now I can see the list of raspi2 and raspi3 in the machine list,

And I also see
https://lists.sr.ht/~philmd/qemu/%3C20190904171315.8354-1-f4bug%40amsat.org%3E

Anyone knows when the raspi4 will be ready? Maybe in 5.2?

Thanks

--0000000000004f596105b05c1b5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div>Now I can see the list of ras=
pi2 and raspi3 in the machine list,<div><br></div><div>And I also see=C2=A0=
<a href=3D"https://lists.sr.ht/~philmd/qemu/%3C20190904171315.8354-1-f4bug%=
40amsat.org%3E">https://lists.sr.ht/~philmd/qemu/%3C20190904171315.8354-1-f=
4bug%40amsat.org%3E</a></div><div><br></div><div>Anyone knows when the rasp=
i4 will be ready? Maybe in 5.2?</div><div><br></div><div>Thanks</div><div><=
br></div></div>

--0000000000004f596105b05c1b5b--
