Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1975620ejf;
        Mon, 26 Feb 2024 02:55:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW23hgeB1Kqgm5WXMSTd6n5e+PzVhplGMFpIypP/w05mpQIw1/1eNXHnjYJMQejs/4WSP8yds88EO6/49ofabCp3/qY52lF
X-Google-Smtp-Source: AGHT+IGlDrTeWz/8sZ/eKyqtwZmjr/exYQryC/vY3CSneIYop2ZhWAxeXKuOAwjuN8rHMCm3vgYS
X-Received: by 2002:a0c:f5d2:0:b0:68f:b237:4ef4 with SMTP id q18-20020a0cf5d2000000b0068fb2374ef4mr7019535qvm.51.1708944910706;
        Mon, 26 Feb 2024 02:55:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708944910; cv=none;
        d=google.com; s=arc-20160816;
        b=Fyg3a37tphBqTFf6s/YtLfnJ1/H5Cwu7ySztRLIeZ2o0f7OoeLh6gV4TATC+NfF8Mg
         b6cdzXWWcHlEozVsZ15smp0jV/7+54VrO2/xJmoxcyvMcD/Pfvd6yBlQLsZU9LsZPYmi
         EBtxrM27CnrZsb1XpuBJKKVmJlMmJqlL2j/oAGJUVg27uSORBvpJU1CMwrfABmesbZK7
         z+8ARJmJC4bTXDU5qSL8woJLNmxXxR01AelKkm6YZGkpkOIrpAZCop7HP2oBKkfpOTEr
         HnROaEC0TYyK0R3qlzumEih9fR8RJZPZwbNgewr0IyjGz4kx218egEUl66jCwVTCJ91A
         S6wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=543e3HTbYEpqjozyqM0DuXUTpsp5QoAQPNDsAdKWHvE=;
        fh=ETlmwqe9NVc+3bqSVhrtWydl6yR3Ptjjn/QvvFe1kZs=;
        b=hUsWUqHd44gq6q6xzWSCET9xV8Kq6j1W3ZZBx49AWk9Aphddj92yMOqKlRl6anKyZ+
         AesB4Ooo0N84l8eHw1dq2w9kfj5+V+upMgRtEBtS2gjE0kd8bgwYFvCEQI0Me/cI4mXG
         KbCbjsSR6kuh1OZCLn+SHA8HFTVOs2SBADPIqYiMOJWii/ZUhq7XZ/GY1sCB2VLhWUgM
         i0RcdfOpuAB4riDhG20qI2kKHOVMCTQAFP8OYdNYbsQjUzMGB7umV7zIvBosTKx69yBQ
         bx9YudbDs6ziaLVh8LNNqxY6EzT+HE2KeWogu+nqX8i8ksR9oW6rRio7ns1qyGV8U2uZ
         g0YA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1-20020a056214040100b006901729a774si277952qvx.424.2024.02.26.02.55.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 02:55:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1reYdF-0004kK-Ok; Mon, 26 Feb 2024 05:54:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1reYcs-0004Xa-P5; Mon, 26 Feb 2024 05:54:27 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1reYch-0004SB-So; Mon, 26 Feb 2024 05:54:26 -0500
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DD14F4E601F;
 Mon, 26 Feb 2024 11:54:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id 2AEcEsPr3Gj8; Mon, 26 Feb 2024 11:54:10 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 95E784E601E; Mon, 26 Feb 2024 11:54:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 938C87456B4;
 Mon, 26 Feb 2024 11:54:10 +0100 (CET)
Date: Mon, 26 Feb 2024 11:54:10 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, 
 qemu-ppc@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org, 
 John Snow <jsnow@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 3/3] hw/ide: Include 'ide_internal.h' from current path
In-Reply-To: <fded510c-88d9-4bbb-8a80-08898c5850b2@linaro.org>
Message-ID: <c19f56bb-43ec-a7ef-32e6-c290e02f58c2@eik.bme.hu>
References: <20240225171637.4709-1-philmd@linaro.org>
 <20240225171637.4709-4-philmd@linaro.org>
 <feffd329-59e0-0291-0dd6-76a625da190b@eik.bme.hu>
 <878r37lll6.fsf@pond.sub.org>
 <fd0fba89-cd93-4113-9f3d-2ee20f2217d9@linaro.org>
 <fded510c-88d9-4bbb-8a80-08898c5850b2@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1159788311-1708944850=:1986"
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: qf3vnVrCI++Q

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1159788311-1708944850=:1986
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 26 Feb 2024, Philippe Mathieu-Daudé wrote:
> On 26/2/24 09:00, Philippe Mathieu-Daudé wrote:
>> On 26/2/24 08:40, Markus Armbruster wrote:
>>> BALATON Zoltan <balaton@eik.bme.hu> writes:
>>> 
>>>> On Sun, 25 Feb 2024, Philippe Mathieu-Daudé wrote:
>>>>> Rename "internal.h" as "ide_internal.h", and include
>>>> 
>>>> Is there a convention about using underscore or dash in file names? The 
>>>> headers Thomas added are using - as well as ahci-allwinner.c, only 
>>>> ahci_internal.h has _ (but there are others elsewhere such as 
>>>> pci_device.h). Maybe we should be consistent at least within IDE and this 
>>>> series is now a good opportunity for renaming these headers to match. But 
>>>> it's just a small nit, thanks for picking this up.
>>> 
>>> This is one of the many unnecessary inconsistencies we're inflicting on
>>> ourselves.
>>> 
>>> We have more than 3600 file names containing '-', and more almost 2700
>>> containing '_'.  Bizarrely, 68 of them contain both.
>>> 
>>> I strongly prefer '_' myself.
>>> 
>>> Zoltan is making a local consistency argument for '-'.
>>> 
>>> Let's use '-' here.
>
> BTW by "here" I understood "in this patch". After v3 only a single
> file use '_': "ahci_internal.h", but Zoltan said he is uninterested
> and doesn't care about it so I'm not renaming it.
> (https://lore.kernel.org/qemu-devel/3e576d33-1973-3f44-afd1-9224609f89a6@eik.bme.hu/)

Yes, I don't care and also prefer _ in file names but since all the other 
headers use - now it's simpler to make all of them the same just for 
consistency so I've meant to rename ahci_internal.h too but forgot to 
mention it explikcitly. Sorry for that.

Regards,
BALATON Zoltan
--3866299591-1159788311-1708944850=:1986--
