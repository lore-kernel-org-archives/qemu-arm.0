Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp919293lfq;
        Thu, 17 Sep 2020 14:06:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHdtDB7z996dWdAvo/FJ1TFRG5Nc9vG2jyI/x3K+/z7xPNOSG5fckucloa1bWfbudLKVXX
X-Received: by 2002:a25:aa54:: with SMTP id s78mr33162034ybi.75.1600376814145;
        Thu, 17 Sep 2020 14:06:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 81si721855ybp.101.2020.09.17.14.06.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 14:06:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       arc=fail (signature failed);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kJ17F-0006jI-J7
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 17:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kJ14J-0005B5-LZ; Thu, 17 Sep 2020 17:03:52 -0400
Resent-Date: Thu, 17 Sep 2020 17:03:51 -0400
Resent-Message-Id: <E1kJ14J-0005B5-LZ@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kJ14H-0005ny-1J; Thu, 17 Sep 2020 17:03:51 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600376620; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cQ6zhehyBQtetFaPkHTM6l3ce1Bsd3hYCfW5Qum9NpsISLR7lNv0gnpWsscEef7Y1APkXJsxT2quMBjfIXyZiP372ChicfYcNQ15oUTHxtMHt+g13YGvx/NL4fRF60YziJMpp3heLU12HXLHRKjTa0oPw8WXAwvGbc93GjSZ3S0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1600376620;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=f9rnI8qaOxp+ZXjC2nmiiXlzA12ojh4LJ4ICv5MyHbk=; 
 b=dHFHA+GcE4wekXvEp+gUiRIQ/W90sQ0OWh5TW092WYtOhQRObMAW5CgdLYxXWTeI4t8duIFVU5sI2058N3PnlqkkkYFsyHlQnJmXiBhr/DUEh6wVkbavRMAS46eTHx/+mA/GWFCr3pWX/Vqg67tE2YKe+ZMHuheYUdsGqHjafuQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1600376618357752.4315303135411;
 Thu, 17 Sep 2020 14:03:38 -0700 (PDT)
Subject: Re: [PATCH] hw/watchdog: Implement generic watchdog device model as
 per ARM BSAv0.9 hw/arm/sbsa-ref : Include SBSA watchdog device in sbsa-ref
 platform
Message-ID: <160037661694.8478.13292745241895579264@66eaa9a8a123>
In-Reply-To: <20200917181245.132819-1-shashi.mallela@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: shashi.mallela@linaro.org
Date: Thu, 17 Sep 2020 14:03:38 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 16:16:30
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, leif@nuviainc.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, rad@semihalf.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /LG0ymwWp5ys

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDkxNzE4MTI0NS4xMzI4
MTktMS1zaGFzaGkubWFsbGVsYUBsaW5hcm8ub3JnLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1z
IHRvIGhhdmUgc29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9y
Cm1vcmUgaW5mb3JtYXRpb246CgpOL0EuIEludGVybmFsIGVycm9yIHdoaWxlIHJlYWRpbmcgbG9n
IGZpbGUKCgoKVGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcv
bG9ncy8yMDIwMDkxNzE4MTI0NS4xMzI4MTktMS1zaGFzaGkubWFsbGVsYUBsaW5hcm8ub3JnL3Rl
c3RpbmcuY2hlY2twYXRjaC8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwgZ2VuZXJhdGVkIGF1dG9t
YXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5
b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==
