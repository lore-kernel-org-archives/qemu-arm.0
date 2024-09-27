Received: by 2002:a17:504:5f68:b0:1be9:327d:8ee3 with SMTP id gl8csp142535njc;
        Thu, 26 Sep 2024 23:18:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWi3SReEIdJCtUvu0VJSYNIGBMkYY83yljtFd88ROKE/aNKFP1Gu7ewgdmGCyvKNtAP3o0ZJ6f4/WxuzA==@linaro.org
X-Google-Smtp-Source: AGHT+IGJ0Jy+ti0NBWle//YFwt4HO0/EMymza2MMlUd2KWmtRLJ9hMwqdkOkZ+zW/SpCjiC3ipmL
X-Received: by 2002:a05:622a:5b85:b0:45c:a614:f0ab with SMTP id d75a77b69052e-45ca614f842mr6444911cf.60.1727417918612;
        Thu, 26 Sep 2024 23:18:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727417918; cv=none;
        d=google.com; s=arc-20240605;
        b=Ll3Hc7YcZiNDhBdRhkBSRGOoaBpLvGkta+oUMXsVK37un2Br8grMvfSU+k8egVl3fP
         89/covAP6P+JAFAqR2nJVID8ZDRXQZcl7cro+cqOKsLfFe1hOBMF4AKKw3stjDk56AxJ
         Ft1SkIJ4jasA90jSSkfzoNDHQRyUBwQqs3aPLBOH2TMH22fR1y+5wUq+Xj/ItnJZkZJI
         QWCxUBwV4fBm3lMOlIMh556ZoSQ7VyoKf4jL4q/CALuV4lf24j7IDwt/J2vlzz7/U76r
         5fYtm7ROVxj1Og2jnron6ora7kFuzzYCIq9H7t4ggHCLMuM4pfT97Oqo/0Bss1cAmbU6
         RifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=6fj5PjDQeCcHcE2qSDPYfUlyuB+kP98uLPsghC+p7i0=;
        fh=CL8FkEck4sBUNnn94VzrZRxnUNRexsX6t//lDNccdpQ=;
        b=NKFuKOBPipmqJQuah5C9EKCDLrYZaWBuurtgy3DX2TTV6KFGL+CBcKCGR5xXYBBm+v
         GiJ4D1OSVQdNVFI/aVax3cavVhN+05UbklIUpgu4fk4HwbYTc53YAa4Q7klZnn6pCaIi
         s9Ol71k6IL5SB4OXQf38YOnvTTr27fM16CQg02lIRU/m2Ye0YK3KLJl9HabwKXgeYvO0
         eb/1WhgvRLbm/dxJ1KCeiBJxmui4HeBeQken2SOAJ0BLDd13jWeuM15ENLgfen/QMIgH
         0VgzX3+9MRaM1k3LQam7IpsNQeNJYHNDH5H3JqCGlzbdipbWOXeTW/k/PjqqB7wyzB3p
         J4QQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f34d908si14532241cf.514.2024.09.26.23.18.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Sep 2024 23:18:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1su4Hn-0000HW-UY; Fri, 27 Sep 2024 02:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=hVAz=QZ=kaod.org=clg@ozlabs.org>)
 id 1su4HH-0006Kg-AZ; Fri, 27 Sep 2024 02:16:35 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=hVAz=QZ=kaod.org=clg@ozlabs.org>)
 id 1su4HE-00045S-DO; Fri, 27 Sep 2024 02:16:30 -0400
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4XFKwg2bZBz4xR5;
 Fri, 27 Sep 2024 16:16:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XFKwb4B8jz4xQ2;
 Fri, 27 Sep 2024 16:16:12 +1000 (AEST)
Message-ID: <1f517713-bb9c-420d-8dce-9423123a3eab@kaod.org>
Date: Fri, 27 Sep 2024 08:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Support GPIO for AST2700
To: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>,
 Yunlin Tang <yunlin.tang@aspeedtech.com>
References: <20240926074535.1286209-1-jamin_lin@aspeedtech.com>
 <e1076f8e-2e32-41ba-adf4-8e28aae8e526@kaod.org>
 <SI2PR06MB5041AC649E5F76F2700A42D9FC6B2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SI2PR06MB5041AC649E5F76F2700A42D9FC6B2@SI2PR06MB5041.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=hVAz=QZ=kaod.org=clg@ozlabs.org; helo=mail.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.246, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: UCb4ku/UUCYs

Hello Jamin,

>> Could you please to add tests in tests/qtest/aspeed_gpio-test.c for this
>> changes ? At least one with the ast2700-evb machine if possible.
>>
> 
> Will add
Thanks for the effort. I appreciate.

Also, your emails have an invalid "From" field set to
"qemu-devel@nongnu.org" when retrieved with the b4 command.
I have been fixing them for a while. Could you please tell
us how you send the patchsets ?


C.




