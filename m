Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp407575lfg;
        Thu, 11 Mar 2021 07:56:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyl1dwjU7GzhQy0r+Qi7LQGJUSM+peDsF3WcqCz/v0RPm56Qr8ud/Ptv66QFWGZXJMPY/Ua
X-Received: by 2002:a05:6808:7ca:: with SMTP id f10mr6800090oij.139.1615478160173;
        Thu, 11 Mar 2021 07:56:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615478160; cv=none;
        d=google.com; s=arc-20160816;
        b=FTlJF0yrprTyjIjcWOrQmbdVgmSSABeETBgudKtiagupo33pwy/L5cGG77yPbBryX+
         ed5XUi9KBRiqU0X6Nsw5u4/uE49nDguEvnzQ35lzY8sAO29/Dqt8NnmK/FSUXpDkOo3c
         sVSOsLEf0qB5wG8MCl4PWs7+GH5fLibaSTjMljHXmN7+ejiXIg1noCAwfIjWxshE2n09
         enJxlheGrx3SErZEvkdUTwDquCtRy6s+gZ/DE5mis7Ond1dDgTJ99VBFGSi7TuVRiiOL
         pF/wGefjkuOW5iMNBXUDpLznoPINWzaCn2azbTBMfDPLcBfZD5vuSaUj5xEpzrsrWaC0
         oY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aChvB70ga2vyQQ6upZMSMkTcWbC7jbTXxgEhfs6fhw4=;
        b=Pw+1cISVyrTXi44k+IVnSyEap0pOXV02MQs5Tzv+dX2PNVy7lGUlk8e8NKMjaG0aPs
         kOg+UxkSl4LqIp14Q5VNXdHxLlHN4h9xx3A6bgLdOuJm042k5JBpgP3M8vECauEOtkTW
         ea/ijdyZTBRMW1yYCoVL2Jc7qpq0nseDOVRPcU1ax6Gn2X1fXC99RU6S7Rf43CnGv4O3
         xBZknGyucrdMCt4mXpVazvaYb0/O6e3XHFMhVTFAtraExw1qdEj2y9Epe803/bOlAAeT
         epcgY/ENjfTfZrShga7T++Y29j5MN5eD7kdxMc8GNw5dJQIkfVoxve3+ygqOSRZRhB+6
         kMRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iEbqqxyB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si2675587ote.258.2021.03.11.07.56.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 07:56:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iEbqqxyB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lKNfL-0000P4-Bu
	for alex.bennee@linaro.org; Thu, 11 Mar 2021 10:55:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKNL4-0007TI-5E
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 10:35:03 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKNL0-0004BR-Sq
 for qemu-arm@nongnu.org; Thu, 11 Mar 2021 10:35:01 -0500
Received: by mail-ed1-x52a.google.com with SMTP id h13so3378960eds.5
 for <qemu-arm@nongnu.org>; Thu, 11 Mar 2021 07:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aChvB70ga2vyQQ6upZMSMkTcWbC7jbTXxgEhfs6fhw4=;
 b=iEbqqxyBm9OxKYC4cfcJvubqMnCygTJ/QEm5H3YkTR4OvVQZ+tLyCWSclQre5bzV5X
 Z+RPnHH5mR2bW1i64Ip/o3HF2KLOELj7R2n7OacNtty9OOfiMnlkfJa+Uv3WO8HwYQdJ
 EQARJ6a+dOFtkvxOR++lZtWsj/Y1Uotz4J/KVucEkzlPOOBOO+HBnx53uPbPPv/sRv8c
 RRLiADniapFOajYBzOrOYAJjqogqryNB5ob8ZCpldMy6w6/wrTIT1i7mtdNWIzjfHs3j
 4slFZNCAspVtbM5y2T+wyp91fLuc6RBMLMgS+J5NG9m9pRMUdREO+0wbHHMi4k4xLSVl
 sr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aChvB70ga2vyQQ6upZMSMkTcWbC7jbTXxgEhfs6fhw4=;
 b=RINGjS1Ct020KZg5GsSZ/Mdgrvzun0CiV3NKadgQY1RD4vUA2UvxU46GTqy03krIta
 owJsqJkgbKOW3+zhReqcCBgnGx0BtG8LMxI60v7gR7TYXqhtPRBBkyleaSRS/hAtnYiT
 62Tj61ZgBvurp+hsKs8HBAAxJuKtw3NBFrAPNz9CKSNNyiFdRx/QvUEU4R0xyTJi3fTD
 3C8k+7EJX4HMMw/v3kl6ScDoU0RsNwYqjZ3Hw5ukaSIw7Q6DmpG11JvcVg2+IHjoUwlp
 4xmL2hVFGZ6jURHDtRYZ0UQMvyCxxFS0WQTzJPKMxIg/jhc76yo5aZDl8t9a+iKa64hK
 +TnA==
X-Gm-Message-State: AOAM531h18R5aBAHeshOLxuFErGTIAXurNCJH6Ma67xw1obk012645c0
 NuzhJ0QoeHRsKSwaXmWVTMBNQggOLtcOPSLj9iKBXw==
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr8991421edr.52.1615476897275; 
 Thu, 11 Mar 2021 07:34:57 -0800 (PST)
MIME-Version: 1.0
References: <20210310195820.21950-1-nieklinnenbank@gmail.com>
In-Reply-To: <20210310195820.21950-1-nieklinnenbank@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 15:34:38 +0000
Message-ID: <CAFEAcA8+Xc1fzCcNVQjGu_WJ3gZLnUXu-iPz1AJ8WS5Q+-7mKQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Allwinner H3 fixes for EMAC and acceptance tests
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 35jnlmBoZ8F1

On Wed, 10 Mar 2021 at 19:58, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> The following are maintenance patches for the Allwinner H3. The first patch
> resolves artifact download errors by updating the URLs to the armbian.com server.
>
> The second patch is a fix for the EMAC that is used by the Allwinner H3 / Orange Pi PC machine.
>
> All these patches have been reviewed and tested and should be ready to pull in.



Applied to target-arm.next, thanks.

-- PMM
