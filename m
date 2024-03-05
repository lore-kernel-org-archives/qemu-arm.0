Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp119326ejb;
        Tue, 5 Mar 2024 13:10:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWcwOS+oEbQKH220TFEW0nUI2Zn/JDA4+rHgQWQpMLEuKvLhVcyUoWRmELnZIkhKQCNRZJtdchR9IdGqrgmRqpY6yvLBpVe
X-Google-Smtp-Source: AGHT+IG4Y+EmVGz2uQrbAOVkz/eb12s9YhOgQcqDviTXxUzSGmaM5sQ3k0T0qVRERxMd1eA8GMbh
X-Received: by 2002:a05:6358:3423:b0:17b:5b6a:de9d with SMTP id h35-20020a056358342300b0017b5b6ade9dmr3456920rwd.23.1709673039165;
        Tue, 05 Mar 2024 13:10:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709673039; cv=none;
        d=google.com; s=arc-20160816;
        b=CIXJep2elaQMO3C6CUX/5MCXgCXUCBKJEKyun6/2L8Qi9NG0hgBUPzcFTuiJDarjNX
         CPifp4zdd1CFqRqfLes5v29KG1W9Zi4USI9sLDVONJCoi2Bz+7x7e8T8aoX6OmMFy0nE
         HyPaUMU/z5+unbDxcyqf9Nv0R2bc0g4IUgIMVa6L6MOLLDqJIQmsm6+99tSz8LP+t5CH
         eu4sJJRxvTOYz6UKu+pJb5nydST1LdNryhOvtJzQLipqSRatO+g9pE9GZ16jOueIoSmC
         aVCPjd8OOKslIKAa2WjoYlZUS/NLeap4U4EHwl9Jww6c18WHMRtod1kVUdGzv49hmrem
         ZXxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:thread-index:thread-topic
         :content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:dkim-signature:dkim-filter;
        bh=XBjsdGyNVybnDL3wiGl2pO0JAxHdvVjEyRQhNTwnuxM=;
        fh=qzF0zmhd1JkU1Zj2Aos/DeT7Q40ZG7xF4+eIv4Zmmdk=;
        b=UsR+S1Gk8mpU7ZRCUdA+tC7/PN49k1Tj2LKlEFQV+zUl7DhHqHmS2dyFogyFjdUwXc
         JPQBPhXspMB775+Kr5WHRAwmyqVt0qtkfjRkejVvrxzfXzj3M+VXK8of5SVEv1qSog2Y
         Bq8aSfTX/LbeBwBW0pF9S7QrrvEmH7DLh1r9MCY8LacbplvoTUWUWYYrUJPdusw37Eq6
         mdmBTi/RAWf8BJ5iQka2fr8XctMhsMNTix+FrI8fBj63ZA9k4cjd2HnTl3AKXihUtgRg
         aTlqCUU/BNVePrPC2sMKYpeltE0Lhzilbd0idDYiw/eqZBrQFvA/2czgQKOvb+3oe+8L
         7eLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=MfaWOMWf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020ad45c67000000b0068fd0486f10si13341314qvh.51.2024.03.05.13.10.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 13:10:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=MfaWOMWf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhc3T-0008Cy-CK; Tue, 05 Mar 2024 16:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivarhol-21@enst.fr>)
 id 1rhc3P-0008Cb-RZ; Tue, 05 Mar 2024 16:10:28 -0500
Received: from zproxy3.enst.fr ([2001:660:330f:2::de])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ivarhol-21@enst.fr>)
 id 1rhc3M-0007nQ-Qj; Tue, 05 Mar 2024 16:10:27 -0500
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id BAEFAA05F2;
 Tue,  5 Mar 2024 22:10:19 +0100 (CET)
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id ZBwWOZoPIht6; Tue,  5 Mar 2024 22:10:18 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by zproxy3.enst.fr (Postfix) with ESMTP id 41566A06E0;
 Tue,  5 Mar 2024 22:10:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy3.enst.fr 41566A06E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1709673018;
 bh=XBjsdGyNVybnDL3wiGl2pO0JAxHdvVjEyRQhNTwnuxM=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=MfaWOMWfMuo9/nyOlvUtuscm0PpPLjAcD3NvxCOR2oIeeDnNojpnb/3TLBiSHTlmT
 pCSgCDiDKsrJzZ4cIfJaG87kcxbVi/DnLoNsvEK2/OW8vN0HsDJqo6dn0adHVmDn5z
 LaEJwLHnuZ8IMpYeCPWnbYnzKK70hGe8VgCH+GAs=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy3.enst.fr ([IPv6:::1])
 by localhost (zproxy3.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id mlaoc7-txKBg; Tue,  5 Mar 2024 22:10:18 +0100 (CET)
Received: from zmail-tp2.enst.fr (zmail-tp2.enst.fr [137.194.2.199])
 by zproxy3.enst.fr (Postfix) with ESMTP id D9130A05F2;
 Tue,  5 Mar 2024 22:10:17 +0100 (CET)
Date: Tue, 5 Mar 2024 22:10:15 +0100 (CET)
From: =?utf-8?B?SW7DqHM=?= Varhol <ines.varhol@telecom-paris.fr>
To: peter maydell <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, 
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 Laurent Vivier <lvivier@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Message-ID: <266035206.1369214.1709673015960.JavaMail.zimbra@enst.fr>
In-Reply-To: <CAFEAcA9cW0W8pcD6-HBrF2V9t1ewvAR+bB5+khSrWT5-gcxUcQ@mail.gmail.com>
References: <20240224105417.195674-1-ines.varhol@telecom-paris.fr>
 <CAFEAcA9cW0W8pcD6-HBrF2V9t1ewvAR+bB5+khSrWT5-gcxUcQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add device STM32L4x5 GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [::ffff:80.125.0.74]
X-Mailer: Zimbra 9.0.0_GA_4597 (ZimbraWebClient - FF123 (Linux)/9.0.0_GA_4597)
Thread-Topic: Add device STM32L4x5 GPIO
Thread-Index: 0NjsMYnvrFNIaPyyjAkgrN0dkn4BEw==
Received-SPF: pass client-ip=2001:660:330f:2::de;
 envelope-from=ivarhol-21@enst.fr; helo=zproxy3.enst.fr
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: QvzO6fEtGz48

Le 5 Mar 24, =C3=A0 17:10, peter maydell peter.maydell@linaro.org a =C3=A9c=
rit :

> On Sat, 24 Feb 2024 at 10:54, In=C3=A8s Varhol <ines.varhol@telecom-paris=
.fr> wrote:
>>
>> This patch adds a new device STM32L4x5 GPIO device and is part
>> of a series implementing the STM32L4x5 with a few peripherals.
>=20
> Hi -- I think this patchset is basically good to go, but it
> didn't quite apply cleanly on top of the RCC v6 patchset.
> If you could rebase it on current head-of-git (where the RCC
> device has just landed) and send it out within the next few
> days then we should be able to get it into the 9.0 release.
> (Softfreeze is 12 Mar, and patches need to be in pullrequests
> by then, so the patch needs to get on the list a little before
> softfreeze.) Otherwise we'll be able to put it in for 9.1.
>=20
> thanks
> -- PMM

Thank you for the information, I just sent a new version based on master.

Ines
