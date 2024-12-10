Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3185808njb;
        Tue, 10 Dec 2024 02:05:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVInQ/1NXffmZlrXh6iBKQmS69DEIzWgNMmi6p7cd6Ary6TZcKJNhpzJtkchvJ1z+lV3rtrANRus2dxjQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGQ1ouDqNZa8mT6tsfwqc8A8d3ZOGL5kMYOLkNx8ZNH+m2SdbUAU39T/+a4zvjMd9L2dLlh
X-Received: by 2002:a05:622a:7403:b0:467:5082:74bd with SMTP id d75a77b69052e-46750827cf4mr149076621cf.34.1733825158185;
        Tue, 10 Dec 2024 02:05:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733825158; cv=none;
        d=google.com; s=arc-20240605;
        b=It5J0oIfOI7ihdnyCxhhKEU4up99Yghf/iC3dEMbXPmvvCQrL7M9wdmt9dtAW50r7n
         wjrzBTj9lzHhwTOfJ1atrf1GsuwlW9kA5/LOaZzE1cf3T12MvPS3Z234Z18xIfTRmBa0
         iEDQp1E7SgockF27omvPBa7M6/TUL/+pPX1NCXonXzou6TK3KxL/bLgRX2ape2jNaiNr
         EdWGU2BmWBrH0wcz/6KsjET4mm0vfbpTL+WrTyOIHMSHwMXknUJqzoVW1G1KXZthXsHG
         5UrGjxR7+FQ2USavqhl7Syzoo2bo5t8fLAk1ocPXgzEeaw5hcf9e6+ndjNwKtkbOi139
         dhNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=Rl9qb4BdzAbu6XvW2CJ/Jxb2TM+gzbH927Fkpv7przk=;
        fh=iwruolNfw9EYCheWIG5mEImJ1hs8NSnfxQVG0S1DZaY=;
        b=QmPHGlGnFCNL6IGYp5AY2KiZV4ppjrRlcoZ20yxWJ2kuqaTHtWAPFC9xkzzobNmqqP
         cmx5DPew08r0dkTjOxRcty1oHGvOe+5cWygTGbN9sslyjoLCo4uFYwwqFgB0aXWPP5L2
         MT5pYg+oBbfY3knL45aDgSm86wqyMBnXDlF8Q3yUFTLiPyDyhy1n6qbqmT4kMMwmbery
         fS2wh16X7jrfdZomFZjvj+Wx8m4QhHg+D8Jh7Yp/PEScq1SY3Utm5MRlatGuFnb4R8lJ
         /dOKib36RgjnHJrU447DWDhqIc8Eu/8K7wpA0aOLy5TTrJFzkBTeR3JiLuaRg0hPVc26
         rz/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46764ec46b2si46894091cf.92.2024.12.10.02.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 02:05:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKx7h-0003DS-3u; Tue, 10 Dec 2024 05:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1tKx7b-0003DF-FR; Tue, 10 Dec 2024 05:05:39 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1tKx7Z-0003J1-A3; Tue, 10 Dec 2024 05:05:39 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 11D95608016B;
 Tue, 10 Dec 2024 11:05:26 +0100 (CET)
Message-ID: <999d4981-4f43-4319-b9dc-3786ff250d2a@csgraf.de>
Date: Tue, 10 Dec 2024 11:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] hvf: Add facility for initialisation code prior to
 first vCPU run
To: phil@philjordan.eu, qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20241209203629.74436-1-phil@philjordan.eu>
 <20241209203629.74436-2-phil@philjordan.eu>
Content-Language: en-US
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20241209203629.74436-2-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TQZ0eWN4deQb


On 09.12.24 21:36, phil@philjordan.eu wrote:
> From: Phil Dennis-Jordan <phil@philjordan.eu>
>
> Some VM state required for fully configuring vCPUs is only available
> after all devices have been through their init phase. This extra
> function, called just before each vCPU makes its first VM entry,
> allows us to perform such architecture-specific initialisation.
>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>


Reviewed-by: Alexander Graf <agraf@csgraf.de>

Alex


