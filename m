Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1398451lfe;
        Tue, 17 Mar 2020 04:09:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuVUEDBs20g4a7fTjNnV8COx1xUaGm7VKOpFWhpze6ppphDVE06tIA/RotTbUnUejCKlTod
X-Received: by 2002:a05:620a:22a9:: with SMTP id p9mr4087741qkh.124.1584443389410;
        Tue, 17 Mar 2020 04:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584443389; cv=none;
        d=google.com; s=arc-20160816;
        b=MKO6uwFtICZqhIuAzfDulkEdqADb4HAqgZfLi6rpNIZKI2x8W14EZj55s2LiGWSBc4
         Ml5xP3Q9bNZHCSPGHO87W4UFrXfldCi4YpyglWiaprpfdg/TMgPb6Ontz8cxy8jYYL8u
         8+uZdbYYwZ4aECp2n8jWx1IQcI115oOw1KeMibdW9UrrQ743SKdj7TIn6S6wt8BOerID
         ynubXEcQ2jGk2ZLGjfjvpAt6QDwj0hfeLcO3gY4pcK8JXq97j2RBdBr8OkS7ALTY3/EP
         qYpnPBtp9asCHB6ODWyvQ5oD+40WR9i8qXnHeGm/Qk2MFOmmh4yVNmEywvKdt/qbh9Ep
         BBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=NXc1CMVP8fPkOAEbAXSA1LX5CXyYPNg1sYK75gFtxkA=;
        b=dv/mSN8afs1YqohKVr9/zeAexJpE+o73AgInumvDl0R0+eoRMvNvPf8n6kc1fxO3rU
         Nofv4oMD53enFqWSe1HBj4dcmKNGPyoru6UloLarY9IXISJo4o6Umy9N/zxc/FCwm5KQ
         t7PJGUqlhuCfmQ5rxJa/zTNyezNZxajxosNbxQTRoJAQ5PxP7WhM++8VYd/3YUbQYoz3
         XnqvAt8WpT0ua91aXUIgOELwIz65uasvOCXllvs3keB8DU6/6sE3CqK77MCVYdyRAp9L
         ncN14wr0MBHlMqCsccn3D6DQnjnRjH0RftPHYtRAt7SmunSbzLzTLq0zbco9qktAVVoh
         ojmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="AKYFtF/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si1805271qkt.62.2020.03.17.04.09.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Mar 2020 04:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="AKYFtF/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEA6W-0007Ob-QO
	for alex.bennee@linaro.org; Tue, 17 Mar 2020 07:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jEA6L-0007O9-MD
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 07:09:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jEA6K-0006c4-Lx
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 07:09:37 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:42436)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jEA6K-0006WQ-Df
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 07:09:36 -0400
Received: by mail-oi1-x242.google.com with SMTP id 13so12325268oiy.9
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2020 04:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NXc1CMVP8fPkOAEbAXSA1LX5CXyYPNg1sYK75gFtxkA=;
 b=AKYFtF/g6sx/HiI0KzPvMFmMkCrG9HVQZwHH//m5UuO3M10DTjRrbinSx1ERjGgAIy
 IFJBbBo9FEDq+FYlh0xEv3STgi24H0e1TuIl2f0xaxHJPWvTr5ci+6VcJ6qASajowgto
 QTZr1eGASXUMcw8Twz25eewAXhdMjPdaUiKsw46CzKLWF15RZK+mYKmpTCOtSt+ysACS
 WHfGCZSLnNicLT8PU5H4DLccmFTS13K1OHrf3RcWM9ZQOmaXdVVB31gx19T/xfL3r5g7
 R01/EmMI04lWnYIUnT0hPYqgbNZ0EWVTISaSWBCoErPVTnwSG8LmKalh5AL0iCLVrfir
 b0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NXc1CMVP8fPkOAEbAXSA1LX5CXyYPNg1sYK75gFtxkA=;
 b=X9jMk6DQosOS0gEZmiIenkb3jM+nrxJm3VPJPCc4mZs5dNrlO+zJDBWi76WZ6jCsS7
 IIhKg/J/l1c10Cw0qijvON0JN1xMcz77KX8LCBgOIq3WGLF7tKkVNnO9QtuHBwQBnske
 aH7JgoQBEi4sb436LHnJp7ZRbQxw8HV5RT3ycmYzWq2D6OWUgJStBfSptRIo4pBicDHw
 h98nRliul6IaKAQlVyP3dSy7HQjl2v3s+vOwWQKeeXSM8zMNEbHTid7Le9XjYdEwLqoq
 sSZVZRHQdJFgZYAmujow7BESeaoSifhtlmOyBJoCm7rlo8EW/E9SitCMgNWr3YRCuE2z
 +i1A==
X-Gm-Message-State: ANhLgQ1yXFjgOcEHHmT179akgwsVkBEKpFjGpE0ZqGnuBBXVYLykBILq
 KyufAfMgXO0AwBLA83YgPwjfC38V2VLTDzyJzLjKuQ==
X-Received: by 2002:aca:190f:: with SMTP id l15mr2930921oii.48.1584443374646; 
 Tue, 17 Mar 2020 04:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200303100511.5498-1-peter.maydell@linaro.org>
 <c71dbe77-a883-361b-e33c-ed85ce07c0de@redhat.com>
In-Reply-To: <c71dbe77-a883-361b-e33c-ed85ce07c0de@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Mar 2020 11:09:22 +0000
Message-ID: <CAFEAcA-gZnOVD9MPwUBCcA4fvrTSaE1xEvd9dyr_r1RctiPJhg@mail.gmail.com>
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FH2wn2wpLNNW

On Tue, 17 Mar 2020 at 11:01, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> ping

Eduardo said he'd queued it -- I've been assuming he'll send
a pullreq for it.

(The followup work I was planning to base on this turned out
to have complications I hadn't expected, so I've put it on
the shelf for the moment. But this is still a good bit of cleanup.)

thanks
-- PMM
