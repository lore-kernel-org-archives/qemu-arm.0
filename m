Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5844498lfc;
        Mon, 15 Feb 2021 10:32:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypr8WGEhHprIgjjZbf2vIgv1Nmk+E6yq66++6Ec4/VjLz1MlYfbYrRG37PX4G+ejbtU++M
X-Received: by 2002:a25:4e05:: with SMTP id c5mr5223856ybb.193.1613413957092;
        Mon, 15 Feb 2021 10:32:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613413957; cv=none;
        d=google.com; s=arc-20160816;
        b=hJ+3E7LBr8MipUhb+wHy8LGEvp04TGKQVqMXncWLSO+ZWgbQZN/L8RqtDvNJ08Eacl
         DaGIKm6CZTqAlvtxmByIV/A4FmUYSQ9hK/UozPF2JFHb2NoBpL8DnyjGNMg/iuUCOgUt
         Iq/RfQjclriTaF0tkIj5nFuHq5wp5MYu4XZEtFW01oL71JcM63q1uO/a33n+rJyb+yQi
         CTaocxry/n0OoBZsu/IgMRxo831NcDUUxCd6q8p5zncWdUTIVXJpTAfcRaqJew+p3s/b
         KJl0mdrWyLdJLyOJJUc7UozKZcyww0TCHWQF30Igyt8bwtW+4zkXrsti3u8e5OucqvFZ
         lqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=bOGSw2KfQysx9MPvNPzIC9mHGdtkmTxSgDe7SV/7s2c=;
        b=HmvhHYtsuqtV/9vAa7QnrS4oEUAg4Fv9cA4iB5bNh3Nck2v6mtwb/mARaAtmnqw2Jv
         bDlHaZm/gRnj5666mvLRU5gUWbS0voDm48mwFgfH0z+lVRHro1n1DNEIJG9VZg1x45yp
         ZAnSGx7IBVqSSkkAxc+x/XklF7SMvZAu7XB9uE1vbJB1B39vw7fnNBs8HxLB+qIJcR3X
         470BvBIa31dx/V9nxH1MU8f8gXvOkE8g5WYPEWja0HrQICw0kR+KneBDYLAoFNGF94bb
         h7iWYCnauc3ANyVTFECQzL0Ct3AHa4SONVjMxtmSkxGKQeRY82byxj4BhpHxTThomCbI
         fh5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mutex.one header.s=default header.b=KRyqROT0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si17032536ybm.453.2021.02.15.10.32.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 10:32:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mutex.one header.s=default header.b=KRyqROT0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBifk-0007j9-I4
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 13:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1lBict-0005b3-6o; Mon, 15 Feb 2021 13:29:40 -0500
Received: from mail.mutex.one ([62.77.152.124]:42214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <posteuca@mutex.one>)
 id 1lBico-0005qg-95; Mon, 15 Feb 2021 13:29:37 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 2E96CBF44177;
 Mon, 15 Feb 2021 20:29:30 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7qC6xwkswqYb; Mon, 15 Feb 2021 20:29:29 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [109.103.89.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id 228C3BF44165;
 Mon, 15 Feb 2021 20:29:29 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1613413769; bh=bOGSw2KfQysx9MPvNPzIC9mHGdtkmTxSgDe7SV/7s2c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KRyqROT0v5AgpmfCBeSkrhRaS8TJVDkTQPBSOWySes02toHkXjoj3yHDos8QQSYFc
 OOyDDwOVzsopbwEb0WLLMBMEZknj7JZKf+mUHIJvNYuoGZQGO2b5REzAQK/cBRYyzM
 Q5dVDQrdb+Vav7Ke4jFCMRHbObrlrBh8YEPAD0BE=
From: Marian Postevca <posteuca@mutex.one>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] acpi: Remove duplicated code handling OEM ID and OEM
 table ID fields
In-Reply-To: <20210215184404.7e342872@redhat.com>
References: <20210213102233.11428-1-posteuca@mutex.one>
 <20210215184404.7e342872@redhat.com>
Date: Mon, 15 Feb 2021 20:26:10 +0200
Message-ID: <877dn9w5kt.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=62.77.152.124; envelope-from=posteuca@mutex.one;
 helo=mail.mutex.one
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>,
 "open list:ACPI/HEST/GHES" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oaXRNBplCokj

Igor Mammedov <imammedo@redhat.com> writes:

> hmm, looks like adding instead of removing
>
Do you mean that the commit message does not describe the change
correctly, or that my refactoring is too extreme?

If it is the latter, I think I tried to simplify things, by creating
macros to be used in multiple places where this structure is created.
And passing the structure around instead of two parameters seemed simpler.

> have you considered, putting this field into X86MachineState?
> (that way you will be able to handle both PC and microvm in one place,
> without duplication io init/property setters)
>
I did not, will try this approach.
