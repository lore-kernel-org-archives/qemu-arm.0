Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2085801lfg;
        Fri, 21 Feb 2020 10:15:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqzGJRSnWu5G8fYCtz1K0g1QpKDodVUyW27zH65Fv9pteRBzbovkiVBxD9JEy3/jITfT1Xg0
X-Received: by 2002:a05:620a:785:: with SMTP id 5mr5521146qka.149.1582308943225;
        Fri, 21 Feb 2020 10:15:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582308943; cv=none;
        d=google.com; s=arc-20160816;
        b=MRof5Ax8oY4YJhK1pAeox9S6BWtwmygivO/zsYee9p0OsCjtsecS3pZzqisbwcoZa5
         5+KzTZLDktgvPHyTvFR78V2nP2keVK4OFWv3BAaico+12pTjvAAf1n7eTQ0tVHfie+4d
         jF3r7eG1LFk8Clb267OQ5URsqesANG2hsuoERcCIW7SzVUC16vzXLmH7rBbcXmXTRcCN
         sD3uDiBOFUiQ2lB7okkVVl5TzxC2szU/Ua0h6TjTluNCUpdDfa5LcqwJXc9jqTCgPjNu
         CiDFgg8xvGH6LPOB+y0nUw13AtV0/BCdhLTx1cqVIF/FtQLwP7B9FB34anocmLT6eXvP
         f/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3srUmliW9AlMGi/4LAcEMKWwu1twTFDFmKWjMsm2Q8Q=;
        b=pXg1/Zl2H+9TfP6L0orWnisDeihAC1Bc/S0XO3lVvKYAEvUCUDLbBREw8Rcw2PffeF
         cPCmr32Syd9KYOofNiK8sFeRgUoEwD63UxURyPLev7afC3XvvJEeaJ/z96msPBFApfcX
         557eXztvcxL7r8NHBxYBlDwIBQgl7dyM48X52YCQZ6n3jbOeIr9bW73qG/cETS5fIDzV
         /BmCT298tNVQFGdcsxrFmS8dcYZBoxIfY/o3V/0akMB72C8AWMpDbgfgUNnKOew43DKO
         qqGN82D8o9uuIesWuLmkR1p65hCGTTDImVCjscLJb+Zm+0EhPE8nsV+Tba41Jv9tTl53
         XO6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QCuDmVal;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a188si1769763qkg.243.2020.02.21.10.15.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 10:15:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QCuDmVal;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j5Cpy-0007Dh-Mr
	for alex.bennee@linaro.org; Fri, 21 Feb 2020 13:15:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47599)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1j5Cpn-0007B0-Nx
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 13:15:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1j5Cpm-0001Wq-Is
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 13:15:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21144
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1j5Cpm-0001Ug-Di
 for qemu-arm@nongnu.org; Fri, 21 Feb 2020 13:15:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582308929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3srUmliW9AlMGi/4LAcEMKWwu1twTFDFmKWjMsm2Q8Q=;
 b=QCuDmValxrWucisQO2RCMYCHA0RF18SpFRY2AGgoeH5KVgsPDs8/Ht7CBGgUvJuvxF0LAe
 7AHMJxLzCVCADigrdotGticMhD1GlOVYDQ/B6wPDJnAKzaow+pYKQJnvHAOd4p3x6Y51xl
 GUjUH5oK4NuZBp8EhwCB0Ex2iFo8Szk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-qNyd1sz2MZ-Hcvpf0sjjJA-1; Fri, 21 Feb 2020 13:15:27 -0500
X-MC-Unique: qNyd1sz2MZ-Hcvpf0sjjJA-1
Received: by mail-wr1-f70.google.com with SMTP id d8so1363723wrq.12
 for <qemu-arm@nongnu.org>; Fri, 21 Feb 2020 10:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3srUmliW9AlMGi/4LAcEMKWwu1twTFDFmKWjMsm2Q8Q=;
 b=M7o5F+GRE5A2n/S4vGo5XIQ31O1EpmOZTb3UU1q3XIoJEhhq/wc+E0QXfQlH7rRLSv
 Vsj3F75OmlDukOoAt8xcvPsEzfDGNA/D6z3PUKCsHzItdIZhogbyXDbP6XeKcebw2tYQ
 kemTGBThgU5v/RH8lWjC8kLI72YScK/dEQ68kBvKkYoPeY6JO01Kj54yGkTJGNKRdaQC
 WQv2kyJR3mBT0kPPEcc/V/7VUmWRCjtshMFGBpP79XiohB5J06GHg5jvrhMiZnFdvkjW
 zI/ijuORrBQ3KmMEu2A2fVMA0zbVvyNCT2Ffz/44zpReYLAhs7bMFAXnYP1dj09EG/aZ
 ypQw==
X-Gm-Message-State: APjAAAV20WNEDMZ7FtWYUHRV62i7j/1JCJsKDfGTmScZgn0gaaAcT7IA
 U6RxWNPo5N2ZuqfsLC3/WgYUXXQAmJobqt8/Q6wf5LFdNQuUOo9sKu8O7Sy6chNjR18ramLdZAT
 umGzMj3Ivt6hb
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr4935522wmk.131.1582308926188; 
 Fri, 21 Feb 2020 10:15:26 -0800 (PST)
X-Received: by 2002:a7b:c4c3:: with SMTP id g3mr4935505wmk.131.1582308925933; 
 Fri, 21 Feb 2020 10:15:25 -0800 (PST)
Received: from [192.168.178.40] ([151.20.135.128])
 by smtp.gmail.com with ESMTPSA id w15sm4957300wrs.80.2020.02.21.10.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 10:15:25 -0800 (PST)
Subject: Re: [PATCH] hw/char/pl011: Output characters using best-effort mode
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200220060108.143668-1-gshan@redhat.com>
 <f3c8adba729d050ba2144cc9c834fe82@kernel.org>
 <CAFEAcA8inLO75XOcCO3bUiiJQyZT+nqmp1be+z6ZtQx2a=68+g@mail.gmail.com>
 <fda602ae-43d5-728c-a5bb-f607f0acd3df@redhat.com>
 <CAFEAcA-VB1t2XDuAHgq_p2Fz8NQ+3HFgyNOzRjk8BjixNJb0qg@mail.gmail.com>
 <eedbac05-5a17-82e6-3cdc-c3b21983545b@redhat.com>
 <CAFEAcA-bHCLQGkFucY5RAY-mw9wFdDeOqCkcv0xgSRg-EYh9ew@mail.gmail.com>
 <fe7f3a60-5d90-ea3c-44d1-119f8b45b15c@redhat.com>
 <CAFEAcA-1UWOfbvhEOhOvozT8RwGoPgRwn2+Lh-UzP3WH8Vw+Kg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1ae86c0b-d4ab-8063-747b-ebea4950e76d@redhat.com>
Date: Fri, 21 Feb 2020 19:15:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-1UWOfbvhEOhOvozT8RwGoPgRwn2+Lh-UzP3WH8Vw+Kg@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Gavin Shan <gshan@redhat.com>, Marc Zyngier <maz@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Shan Gavin <shan.gavin@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BREoj7S8tJye

On 21/02/20 14:14, Peter Maydell wrote:
> The initial case reported by Gavin in this thread is
> "-serial tcp:127.0.0.1:50900" with the other end being a program which
> listens on TCP port 50900 and then sleeps without accepting any incoming
> connections, which blocks the serial port output and effectively blocks
> the guest bootup. If you want to insulate the guest from badly
> behaved consumers like that (or the related consumer who accepts
> the connection and then just doesn't read data from it) you probably
> need to deal with more than just POLLHUP. But I'm not sure how much
> we should care about these cases as opposed to just telling users
> not to do that...

No, I think we don't do anything (on purpose; that is, it was considered
the lesser evil) for x86 in that case.

Paolo

